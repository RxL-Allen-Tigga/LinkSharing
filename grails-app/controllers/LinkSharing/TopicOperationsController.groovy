package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MaxUploadSizeExceededException

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

        def result = topicMiscellaneousService.createTopic(name, visibilityParam, user)
        flash.message = result.message

        redirect(uri: request.getHeader("referer") ?: "/")
    }

    def shareLink() {
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

        redirect(uri: request.getHeader("referer") ?: "/")
    }

    def shareDocument() {
        try {
            def user = session.user
            if (!user) {
                flash.message = "Please log in to share a document."
                redirect(controller: "webSurf", action: "Login")
                return
            }

            def file = request.getFile('documentFile')
            String description = params.description
            Long topicId = params.long('topicId')

            // Validate file extension
            def allowedExtensions = ['pdf', 'doc', 'docx']
            String originalFilename = file.originalFilename
            String extension = originalFilename?.split('\\.')?.last()?.toLowerCase()

            if (!file || !allowedExtensions.contains(extension)) {
                flash.message = "Only PDF, DOC, and DOCX files are allowed."
                redirect(controller: "webSurf", action: "Dashboard")
                return
            }

            def result = topicMiscellaneousService.createDocumentResource(file, description, topicId, user)
            flash.message = result.message

            redirect(uri: request.getHeader("referer") ?: "/")

        } catch (MaxUploadSizeExceededException e) {
            flash.message = "The file size exceeds the allowed limit."
            redirect(controller: "webSurf", action: "Dashboard")
        }
    }

    def editTopic() {
        def user = session.user
        if (!user) {
            flash.message = "You need to log in to edit a topic."
            redirect(controller: 'webSurf', action: 'Login')
            return
        }

        def result = topicMiscellaneousService.editTopic(params, user)

        flash.message = result.message
        redirect(uri: request.getHeader("referer") ?: "/")
    }
}