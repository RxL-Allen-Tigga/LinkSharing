package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
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
    def editTopic() {
        def user = session.user
        if (!user) {
            flash.message = "You need to log in to edit a topic."
            redirect(controller: 'webSurf', action: 'Login')
            return
        }

        Long topicId = params.long("id")
        String newName = params.name?.trim()

        def topic = Topic.findById(topicId)
        if (!topic) {
            flash.message = "Topic not found."
            redirect(controller: 'webSurf', action: 'Dashboard')
            return
        }else if(session?.user?.admin == true){
            topic.name = newName
            if (topic.validate()) {
                topic.save(flush: true)
                flash.message = "Topic updated successfully."
            } else {
                flash.message = "Failed to update topic. ${topic.errors?.allErrors}"
            }
        }
        else if (topic.createdBy.id != user.id) {
            flash.message = "You are not authorized to edit this topic."
            redirect(controller: 'webSurf', action: 'Dashboard')
            return
        }
        else{
            topic.name = newName
            if (topic.validate()) {
                topic.save(flush: true)
                flash.message = "Topic updated successfully."
            } else {
                flash.message = "Failed to update topic. ${topic.errors?.allErrors}"
            }
        }

        redirect(controller: 'webSurf', action: 'Dashboard')
    }
}