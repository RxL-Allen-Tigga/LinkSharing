package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class ProfileMiscellaneousService {

    def getProfileData(user,id){
//        Other profile data
        def userProfile = LS_User.get(id)

//        Other user profile topics and subs count (Profile)
        def userSubscribedTopicsCount = Topic.createCriteria().count {
            createAlias("subscription", "s")
            eq("s.user", userProfile)
            eq("s.isDeleted", false)
            eq("isDeleted", false)
        }
        def userCreatedTopicsCount = Topic.createCriteria().count {
            eq("createdBy", userProfile)
            eq("isDeleted", false)
        }

//        Other user created topics (Topics)
        def userCreatedTopics = Topic.findAllByCreatedByAndIsDeleted(userProfile, false).collect { topic ->
            def subCount = Subscription.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0
            def resCount = LS_Resource.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0
            def subscription = Subscription.createCriteria().get {
                eq("topic", topic)
                eq("user", user)
                eq("isDeleted", false)
            }
            return [topic, subCount, resCount, subscription]
        }

//        Other user Subscriptions (Subscriptions)
        def subscriptions = Subscription.createCriteria().list {
            eq("user", userProfile)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }
        def subscriptionData = subscriptions.collect { sub ->
            def topic = sub.topic
            def sessionUserSub = Subscription.findByUserAndTopicAndIsDeleted(user, topic, false)
            def activeSubCount = Subscription.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0
            def activePostCount = LS_Resource.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0
            return [
                    otherUserSub   : sub,
                    topic          : topic,
                    sessionUserSub : sessionUserSub,
                    activeSubCount : activeSubCount,
                    activePostCount: activePostCount
            ]
        }

//        Other user created resources (Posts)
        def resources = LS_Resource.createCriteria().list {
            eq("createdBy.id", userProfile.id)
            eq("isDeleted", false)
            order("dateCreated", "desc")
        }
        return [
                id                       : id,
                userProfile              : userProfile,
                userSubscribedTopicsCount: userSubscribedTopicsCount,
                userCreatedTopicsCount   : userCreatedTopicsCount,
                userCreatedTopics        : userCreatedTopics,
                subscriptionData         : subscriptionData,
                resources                : resources
        ]
    }
}