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
//        println("date visibility"+visibilityParam);

        def result = topicMiscellaneousService.createTopic(name, visibilityParam, user)
        flash.message = result.message

        redirect(controller: "webSurf", action: "Dashboard")
    }
    def shareLink(){
        def user = session.user
        if (!user) {
            flash.message = "Please log in to share a link."
            redirect(controller: "webSurf", action: "Login")
            return
        }

        String link = params.link
        String description = params.description
        def topicId = params.topicId

        def result = topicMiscellaneousService.createLinkResource(link, description, topicId, user)
        flash.message = result.message

        redirect(controller: "webSurf", action: "Dashboard")
    }
    def shareDocument() {
        def user = session.user
        if (!user) {
            flash.message = "Please log in to share a document."
            redirect(controller: "webSurf", action: "Login")
            return
        }

        def file = request.getFile('documentFile')
        String description = params.description
        Long topicId = params.long('topicId')

        def result = topicMiscellaneousService.createDocumentResource(file, description, topicId, user)
        flash.message = result.message
        redirect(controller: "webSurf", action: "Dashboard")
    }
}