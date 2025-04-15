package LinkSharing

import grails.gorm.transactions.Transactional

//@Transactional
class TopicOperationsController {
    def topicMiscellaneousService
    def createTopic() {
        def user = session.user
        if (!user) {
            flash.message = "Please log in to create a topic."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        String name = params.name?.trim()
        String visibilityParam = params.visibility

        def result = topicMiscellaneousService.createTopic(name, visibilityParam, user)
        flash.message = result.message

        redirect(controller: "webSurf", action: "Dashboard")
    }
    def shareLinkModal() {
        def sessionUser = session.user
        def subscribedTopics = Subscription.findAllByUser(sessionUser)*.topic

        render(view: "shareLinkModal", model: [subscribedTopics: subscribedTopics])
    }

    def addLink(String url, String description, Long topicId) {
        def sessionUser = session.user
        def topic = Topic.get(topicId)

        if (topic && sessionUser) {
            def resource = new LinkResource(
                    url: url,
                    description: description,
                    createdBy: sessionUser,
                    topic: topic
            )
            if (resource.save(flush: true)) {
                flash.message = "Link shared successfully!"
            } else {
                flash.error = "Failed to share link: ${resource.errors}"
            }
        } else {
            flash.error = "Invalid topic or session expired."
        }
        redirect(controller: "webSurf", action: "Dashboard")
    }
    def dashboard() {
        def user = session.user
        def subscribedTopics = Subscription.findAllByUser(user)*.topic
        render(view: "dashboard", model: [subscribedTopics: subscribedTopics])
    }
}