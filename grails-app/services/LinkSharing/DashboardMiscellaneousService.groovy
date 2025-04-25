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
            order('dateCreated', 'desc')
            topic {
                eq("isDeleted", false)
            }
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
                userCreatedTopicsCount: userCreatedTopicsCount
        ]
    }
}
