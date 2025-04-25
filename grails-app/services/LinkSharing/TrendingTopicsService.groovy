package LinkSharing
import grails.gorm.transactions.Transactional
import LinkSharing.*
import org.hibernate.criterion.CriteriaSpecification

@Transactional
//class TrendingTopicsService {
//
//    def getPublicTopicsWithStats(LS_User sessionUser) {
//        def results = Topic.createCriteria().list {
//            eq("isDeleted", false)
//            eq("visibility", Topic.Visibility.PUBLIC)
//
//            createAlias("subscription", "s", CriteriaSpecification.LEFT_JOIN)
//            createAlias("resource", "r", CriteriaSpecification.LEFT_JOIN)
//
//            // Apply filters using alias names (flat filters)
//            or {
//                isNull("s.isDeleted")
//                eq("s.isDeleted", false)
//            }
////            or {
////                isNull("r.isDeleted")
////                eq("r.isDeleted", false)
////            }
//
//            projections {
//                groupProperty("id")                 // 0: topicId
//                groupProperty("name")              // 1: topicName (needed for ORDER BY)
//                countDistinct("s.id", "subscriptionCount") // 2
//                countDistinct("r.id", "resourceCount")     // 3
//            }
//
//            order("resourceCount", "desc")
//            order("name", "asc")
//        }
//
//        results.collect { row ->
//            def topicId = row[0]
//            def topicName = row[1] // now available
//            def subscriptionCount = row[2]
//            def resourceCount = row[3]
//
//            Topic topic = Topic.get(topicId)
//            Subscription subscription = Subscription.findByUserAndTopicAndIsDeleted(sessionUser, topic, false)
//            boolean isSubscribed = subscription != null
//
//            def result = [
//                    topic            : topic,
//                    subscriptionCount: subscriptionCount,
//                    resourceCount    : resourceCount,
//                    isSubscribed     : isSubscribed,
//                    subscription     : subscription
//            ]
//
//            println "Topic: ${topic.name} (ID: ${topic.id}), Subscription Count: ${subscriptionCount}, " +
//                    "Resource Count: ${resourceCount}, Is Subscribed: ${isSubscribed}" +
//                    (isSubscribed ? ", Subscription ID: ${subscription?.id}, Seriousness: ${subscription?.seriousness}" : "")
//
//            return result
//        }
//    }
//}
class TrendingTopicsService {

    def getPublicTopicsWithStats(LS_User sessionUser) {
        def results = Topic.createCriteria().list {
            eq("isDeleted", false)                  // Only non-deleted topics
            eq("visibility", Topic.Visibility.PUBLIC) // Only public topics

            createAlias("subscription", "s", CriteriaSpecification.LEFT_JOIN)
            createAlias("resource", "r", CriteriaSpecification.LEFT_JOIN)

            // Apply filters to count only non-deleted subscriptions and resources (posts)
            projections {
                groupProperty("id")                 // 0: topicId
                groupProperty("name")               // 1: topicName
                countDistinct("s.id", "subscriptionCount") // 2: count of non-deleted subscriptions
                countDistinct("r.id", "resourceCount")    // 3: count of non-deleted posts/resources
            }

            // Order by non-deleted post count (resourceCount) in descending order
            order("resourceCount", "desc")  // Order by resource count (active posts) in descending order
            order("name", "asc")            // Optional: order by topic name in ascending order
        }

        results.collect { row ->
            def topicId = row[0]
            def topicName = row[1]  // Now available
            def subscriptionCount = row[2]
            def resourceCount = row[3]

            Topic topic = Topic.get(topicId)

            // Check if the session user is subscribed to this topic
            Subscription subscription = Subscription.findByUserAndTopicAndIsDeleted(sessionUser, topic, false)
            boolean isSubscribed = subscription != null

            // Adjust the count to exclude deleted subscriptions or posts
            def adjustedSubscriptionCount = Subscription.countByTopicAndIsDeletedAndUserIsNotNull(topic, false)
            def adjustedResourceCount = LS_Resource.countByTopicAndIsDeleted(topic, false)

            def result = [
                    topic            : topic,
                    subscriptionCount: adjustedSubscriptionCount,
                    resourceCount    : adjustedResourceCount,
                    isSubscribed     : isSubscribed,
                    subscription     : subscription
            ]

//            println "Topic: ${topic.name} (ID: ${topic.id}), Subscription Count: ${adjustedSubscriptionCount}, " +
//                    "Resource Count: ${adjustedResourceCount}, Is Subscribed: ${isSubscribed}" +
//                    (isSubscribed ? ", Subscription ID: ${subscription?.id}, Seriousness: ${subscription?.seriousness}" : "")

            return result
        }
    }
}

