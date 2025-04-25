package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class EditProfileMiscellaneousService {

    def getEditProfileData(user) {
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

//        Session user created topics data (Your Created Topics)
        def subscriptions = Subscription.createCriteria().list {
            eq('user', user)
            eq("isDeleted", false)
            order('dateCreated', 'desc')
            topic {
                eq("isDeleted", false)
            }
        }

        return [
                userSubscribedTopics      : userSubscribedTopics,
                userSubscribedTopicsCount : userSubscribedTopicsCount,
                userCreatedTopics         : userCreatedTopics,
                userCreatedTopicsCount    : userCreatedTopicsCount,
                subscriptions             : subscriptions
        ]
    }
}