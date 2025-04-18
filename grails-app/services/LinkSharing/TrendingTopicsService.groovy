package LinkSharing
import grails.gorm.transactions.Transactional
import LinkSharing.*
import org.hibernate.criterion.CriteriaSpecification

@Transactional
class TrendingTopicsService {

    def getPublicTopicsWithStats(LS_User sessionUser) {
        def results = Topic.createCriteria().list {
            eq("isDeleted", false)
            eq("visibility", Topic.Visibility.PUBLIC)

            createAlias("subscription", "s", CriteriaSpecification.LEFT_JOIN)
            createAlias("resource", "r", CriteriaSpecification.LEFT_JOIN)

            // Apply filters using alias names (flat filters)
            or {
                isNull("s.isDeleted")
                eq("s.isDeleted", false)
            }
            or {
                isNull("r.isDeleted")
                eq("r.isDeleted", false)
            }

            projections {
                groupProperty("id")                 // 0: topicId
                groupProperty("name")              // 1: topicName (needed for ORDER BY)
                countDistinct("s.id", "subscriptionCount") // 2
                countDistinct("r.id", "resourceCount")     // 3
            }

            order("resourceCount", "desc")
            order("name", "asc")
        }

        results.collect { row ->
            def topicId = row[0]
            def topicName = row[1] // now available
            def subscriptionCount = row[2]
            def resourceCount = row[3]

            Topic topic = Topic.get(topicId)
            Subscription subscription = Subscription.findByUserAndTopicAndIsDeleted(sessionUser, topic, false)
            boolean isSubscribed = subscription != null

            def result = [
                    topic            : topic,
                    subscriptionCount: subscriptionCount,
                    resourceCount    : resourceCount,
                    isSubscribed     : isSubscribed,
                    subscription     : subscription
            ]

            println "Topic: ${topic.name} (ID: ${topic.id}), Subscription Count: ${subscriptionCount}, " +
                    "Resource Count: ${resourceCount}, Is Subscribed: ${isSubscribed}" +
                    (isSubscribed ? ", Subscription ID: ${subscription?.id}, Seriousness: ${subscription?.seriousness}" : "")

            return result
        }
    }
}
