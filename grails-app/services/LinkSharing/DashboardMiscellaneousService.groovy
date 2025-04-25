package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class DashboardMiscellaneousService {

    def getDashboardData(user) {
//        Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic

//         Session user subscriptions data (Your Subscriptions)
        def subscriptions = Subscription.createCriteria().list {
            eq('user', user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }

        subscriptions = subscriptions.sort { sub ->
            // Find latest active post in the topic
            def latestPost = LS_Resource.createCriteria().get {
                eq("topic", sub.topic)
                eq("isDeleted", false)
                projections {
                    max("dateCreated")
                }
            }

            return latestPost ? -latestPost.time : Long.MIN_VALUE
        }
// Step 1: Retrieve recent resources (sorted by creation date)
        def recentResources = LS_Resource.createCriteria().list {
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
            order("dateCreated", "desc")
        }

// Step 2: Collect topics based on resources (to preserve order of recent activity)
        def seenTopicIds = new HashSet<Long>()
        def topicsWithPosts = []

        recentResources.each { resource ->
            def topic = resource.topic
            if (!seenTopicIds.contains(topic.id)) {
                seenTopicIds << topic.id
                def subscription = Subscription.findByTopicAndIsDeleted(topic, false)
                topicsWithPosts << [
                        topic      : topic,
                        latestPost : resource,
                        postCount  : LS_Resource.countByTopicAndIsDeleted(topic, false),
                        subCount   : Subscription.countByTopicAndIsDeleted(topic, false),
                        subscription: subscription // Add subscription object
                ]
            }
        }

// Step 3: Find all non-deleted topics and filter out the ones already seen (i.e., topics with no posts)
        def topicsWithoutPosts = Topic.createCriteria().list {
            eq("isDeleted", false)
            not {
                'in'("id", seenTopicIds.toList())
            }
            order("dateCreated", "desc") // optional: can sort by topic creation
        }.collect { topic ->
            def subscription = Subscription.findByTopicAndIsDeleted(topic, false)
            [
                    topic      : topic,
                    latestPost : null,
                    postCount  : 0,
                    subCount   : Subscription.countByTopicAndIsDeleted(topic, false),
                    subscription: subscription // Add subscription object
            ]
        }

// Step 4: Combine both
        def finalOrderedTopics = topicsWithPosts + topicsWithoutPosts

// Step 5: Print
        finalOrderedTopics.eachWithIndex { data, idx ->
            println """
${idx + 1}. Topic: ${data.topic.name}
   ID            : ${data.topic.id}
   Created By    : ${data.topic.createdBy.username}
   Posts         : ${data.postCount}
   Subscribers   : ${data.subCount}
   ${data.latestPost ? """
   Latest Post   : "${data.latestPost.description}"
   Posted At     : ${data.latestPost.dateCreated}
   Post Author   : ${data.latestPost.createdBy.username}
   """ : "No Posts"}
   Subscription ID : ${data.subscription?.id ?: 'No Subscription'}
   Subscription Seriousness : ${data.subscription?.seriousness ?: 'No Seriousness'}
"""
        }



//        Inbox A.K.A unread items data (Your Inbox)
        def totalUnread = ReadingItem.createCriteria().list {
            eq('user', user)
            eq('isRead', false)
            eq('isDeleted', false)
            resource {
                eq('isDeleted', false)
                topic {
                    'in'("id", subscribedTopics*.id)
                    eq("isDeleted", false)
                }
            }
        }

        // Subscribed Topics Data (Your Profile)
        def userSubscribedTopics = Topic.createCriteria().list {
            createAlias("subscription", "s")
            eq("s.user", user)
            eq("s.isDeleted", false)
            eq("isDeleted", false)
            order("name", "asc")
        }
        def userSubscribedTopicsCount = Topic.createCriteria().count {
            createAlias("subscription", "s")
            eq("s.user", user)
            eq("s.isDeleted", false)
            eq("isDeleted", false)
        }

        // Created Topics Data (Your Profile)
        def userCreatedTopics = Topic.createCriteria().list {
            eq("createdBy", user)
            eq("isDeleted", false)
            order("name", "asc")
        }
        def userCreatedTopicsCount = Topic.createCriteria().count {
            eq("createdBy", user)
            eq("isDeleted", false)
        }

        return [
                subscribedTopics: subscribedTopics,
                subscriptions: subscriptions,
                totalUnread: totalUnread,
                userSubscribedTopics: userSubscribedTopics,
                userSubscribedTopicsCount: userSubscribedTopicsCount,
                userCreatedTopics: userCreatedTopics,
                userCreatedTopicsCount: userCreatedTopicsCount,
                finalOrderedTopics:finalOrderedTopics
        ]
    }
}
