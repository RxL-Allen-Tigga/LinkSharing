package LinkSharing

import org.hibernate.criterion.CriteriaSpecification

class WebSurfController {
    UserMiscellaneousService userMiscellaneousService
    DashboardMiscellaneousService dashboardMiscellaneousService
    TrendingTopicsService trendingTopicsService
    EditProfileMiscellaneousService editProfileMiscellaneousService
    LoginMiscellaneousService loginMiscellaneousService
    PostMiscellaneousService postMiscellaneousService
    ProfileMiscellaneousService profileMiscellaneousService
    TopicMiscellaneousService topicMiscellaneousService

    def index() {
    }

    def Admin() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Login")
            return
        }
        def result = userMiscellaneousService.getAdminData(session.user)

        render(view: 'Admin', model: result)
    }

    def AdminTopic() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Login")
            return
        }
        def result = userMiscellaneousService.getAdminTopicData(session.user, params)

        render(view: 'AdminTopic', model: result)
    }

    def AdminPost() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Login")
            return
        }
        def result = userMiscellaneousService.getAdminPostData(session.user, params)

        render(view: 'AdminPost', model: result)
    }

    def Dashboard() {
        def sessionUser = session.user
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
            return
        }
        def dashboardData = dashboardMiscellaneousService.getDashboardData(session.user)

//        Trending Topics Data (Top Trending Topics)
        def trendingtopicDataList = trendingTopicsService.getPublicTopicsWithStats(session.user)

        render(view: 'Dashboard', model: dashboardData + [
                trendingtopicDataList: trendingtopicDataList
        ])
    }

    def EditProfile() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
        def editProfileData = editProfileMiscellaneousService.getEditProfileData(session.user)

        render(view: 'EditProfile', model: editProfileData)
    }

    def Login() {
        def loginData = loginMiscellaneousService.getLoginData()

        render(view: 'Login', model: loginData)
    }

    def Post(Long id) {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
        def postData = postMiscellaneousService.getPostData(session.user, id)

//        Trending Topics Data (Top Trending Topics)
        def trendingtopicDataList = trendingTopicsService.getPublicTopicsWithStats(session.user)

        render(view: 'Post', model: postData + [
                trendingtopicDataList: trendingtopicDataList
        ])
    }

    def Profile(Long id) {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
        def profileData=profileMiscellaneousService.getProfileData(session.user,id)

        render(view: 'Profile', model: profileData)
    }

    def Search() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
        def searchData=userMiscellaneousService.getSearchData()

        render(view: 'Search', model: searchData)
    }

    def Topic(Long id) {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
            return // important to stop further execution
        }
        def topicData=topicMiscellaneousService.getTopicData(id,session.user)

        render(view: 'Topic', model: topicData)
    }
}