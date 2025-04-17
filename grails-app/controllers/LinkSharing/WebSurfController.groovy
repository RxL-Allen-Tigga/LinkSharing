package LinkSharing

class WebSurfController {

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
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", sessionUser)
            topic {
                eq("isDeleted", false)
            }
        }*.topic


        LS_User user = session.user
        def pageSize = 5
        def page = params.int('page') ?: 1
        def subscriptions = Subscription.createCriteria().list(max: pageSize, offset: (page - 1) * pageSize) {
            eq('user', sessionUser)
            order('dateCreated', 'desc')
            topic {
                eq("isDeleted", false)
            }
        }
        def totalSubscriptions = Subscription.countByUser(sessionUser)
        def totalPages = Math.ceil(totalSubscriptions / pageSize)
        render(view: 'Dashboard', model: [subscriptions: subscriptions, totalPages: totalPages, currentPage: page, subscribedTopics: subscribedTopics])
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
    def Profile() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
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