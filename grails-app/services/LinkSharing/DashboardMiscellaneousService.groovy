package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class DashboardMiscellaneousService {

    // Fetch subscribed topics with active subscriber count and active resource count
    def getSubscribedTopicsWithCounts(LS_User user) {
        // Fetch subscriptions of the current user where the topic and subscription are not deleted
        def resultList = Subscription.createCriteria().list() {
            eq("user", user)
            eq("isDeleted", false)

            createAlias("topic", "t")
            eq("t.isDeleted", false)
        }

        // Collecting the data with active subscriber count and active resource count
        def sortedSubscriptions = resultList.sort { sub ->
            def latestDate = LS_Resource.createCriteria().get {
                eq("topic", sub.topic)
                eq("isDeleted", false)
                projections {
                    max("dateCreated")
                }
            }
            return latestDate ? -latestDate.time : Long.MAX_VALUE  // Sort nulls last
        }

        def subscribedTopicsData = sortedSubscriptions.collect { subscription ->
            def topic = subscription.topic

            def activeSubscribersCount = Subscription.countByTopicAndIsDeleted(topic, false)
            def activeResourcesCount = LS_Resource.countByTopicAndIsDeleted(topic, false)

            return [
                    subscription: subscription,
                    activeSubscribersCount: activeSubscribersCount,
                    activeResourcesCount: activeResourcesCount
            ]
        }
    }

    // Fetch data for the entire dashboard
    def getDashboardData(user) {
        // Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic

        // Session user subscriptions data (Your Subscriptions)
        def subscriptions = Subscription.createCriteria().list {
            eq('user', user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }

        subscriptions = subscriptions.sort { sub ->
            // Find the latest active post in the topic
            def latestPost = LS_Resource.createCriteria().get {
                eq("topic", sub.topic)
                eq("isDeleted", false)
                projections {
                    max("dateCreated")
                }
            }

            return latestPost ? -latestPost.time : Long.MIN_VALUE
        }

        // Inbox A.K.A unread items data (Your Inbox)
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
                userCreatedTopicsCount: userCreatedTopicsCount
        ]
    }
}
