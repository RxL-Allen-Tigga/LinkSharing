package LinkSharing
import org.hibernate.criterion.CriteriaSpecification

class WebSurfController {
    TrendingTopicsService trendingTopicsService
    def index(){
    }
    def Admin() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Dashboard() {
        def sessionUser = session.user
        if (!sessionUser) {
            redirect(controller: "webSurf", action: "Login")
            return
        }
//        User subscribed topics
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", sessionUser)
            eq("isDeleted",false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic

//        Top 5 subscription
        def pageSize = 5

        def page = params.int('page') ?: 1
        def subscriptions = Subscription.createCriteria().list(max: pageSize, offset: (page - 1) * pageSize) {
            eq('user', sessionUser)
            eq("isDeleted",false)
            order('dateCreated', 'desc')
            topic {
                eq("isDeleted", false)
            }
        }
        def totalSubscriptions = subscriptions.totalCount
        def totalPages = Math.ceil(totalSubscriptions / pageSize)

        //Your Inbox
        def UnreadItemPage = params.int('page') ?: 1
        def totalUnread = ReadingItem.createCriteria().list(max: pageSize, offset: (page - 1) * pageSize) {
            eq('user', sessionUser)
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
        def totalUnreadItemPage = Math.ceil(totalUnread.totalCount / pageSize)
//        println(totalUnreadItemPage)
//        totalUnread.each { item ->
//            println "Topic: ${item.resource?.topic?.name}"
//            println "Created by: ${item.resource?.createdBy?.username}"
//        }
        //

//        Your profile
        def userSubscribedTopics = Topic.createCriteria().list {
            createAlias("subscription", "s")
            eq("s.user", session.user)
            eq("s.isDeleted", false)
            eq("isDeleted", false)
            order("name", "asc")
        }
        def userSubscribedTopicsCount = Topic.createCriteria().count {
            createAlias("subscription", "s")
            eq("s.user", session.user)
            eq("s.isDeleted", false)
            eq("isDeleted", false)
        }
        def userCreatedTopics = Topic.createCriteria().list {
            eq("createdBy", session.user)
            eq("isDeleted", false)
            order("name", "asc")
        }
        def userCreatedTopicsCount = Topic.createCriteria().count {
            eq("createdBy", session.user)
            eq("isDeleted", false)
        }
//        Trending Topics

        def trendingtopicDataList = trendingTopicsService.getPublicTopicsWithStats(sessionUser)


        render(view: 'Dashboard', model: [
                subscribedTopics: subscribedTopics,

                totalPages: totalPages,
                currentPage: page,
                subscriptions: subscriptions,

                totalUnreadItemPage: totalUnreadItemPage,
                UnreadItemPage: UnreadItemPage,
                totalUnread: totalUnread,

//                totalSubscriptionCount:totalSubscriptionCount,
//                totalPostsCount:totalPostsCount,

                userSubscribedTopics:userSubscribedTopics,
                userSubscribedTopicsCount: userSubscribedTopicsCount,
                userCreatedTopics:userCreatedTopics,
                userCreatedTopicsCount:userCreatedTopicsCount,

//                trendingTopics: trendingTopics
                trendingtopicDataList: trendingtopicDataList
        ])
    }
    def EditProfile() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Login() {
    }
    def Post() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Profile(Long id) {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
        def userProfile = LS_User.get(id)
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

        def topics = Topic.findAllByCreatedByAndIsDeleted(userProfile, false)
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
                eq("user", session.user)
                eq("isDeleted", false)
            }

            return [topic, subCount, resCount, subscription]
        }

        // Define subscriptions of the profile user
        def subscriptions = Subscription.createCriteria().list {
            eq("user", userProfile)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }

// Build detailed data for each subscription
        def subscriptionData = subscriptions.collect { sub ->
            def topic = sub.topic

            // Subscription of session user to the same topic
            def sessionUserSub = Subscription.findByUserAndTopicAndIsDeleted(session.user, topic, false)

            // Count of active subscriptions on the topic
            def activeSubCount = Subscription.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0

            // Count of active posts/resources on the topic
            def activePostCount = LS_Resource.createCriteria().get {
                eq("topic", topic)
                eq("isDeleted", false)
                projections {
                    countDistinct("id")
                }
            } ?: 0

            return [
                    otherUserSub    : sub,
                    topic           : topic,
                    sessionUserSub  : sessionUserSub,
                    activeSubCount  : activeSubCount,
                    activePostCount : activePostCount
            ]
        }

        render(view: 'Profile',model: [
                id: id,
                userProfile: userProfile,
                userSubscribedTopicsCount: userSubscribedTopicsCount,
                userCreatedTopicsCount: userCreatedTopicsCount,
//                Topics
                userCreatedTopics: userCreatedTopics,
//                Subscriptions
                subscriptionData: subscriptionData
        ])
    }
    def Search() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Topic() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
}