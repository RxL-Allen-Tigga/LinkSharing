package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile
@Transactional

class ModifyTopicController {

    def updateVisibility(Long id, String visibility) {
        Topic topic = Topic.get(id)

        if (!topic) {
            flash.error = "Topic not found"
        } else if (topic.createdBy.id != session.user?.id) {
            flash.error = "Unauthorized access"
        } else if (visibility in Topic.Visibility.values()*.name()) {
            topic.visibility = Topic.Visibility.valueOf(visibility)
            topic.save(flush: true)
            flash.message = "Visibility updated to ${visibility}"
        } else {
            flash.error = "Invalid visibility option"
        }

        redirect(uri: request.getHeader("referer") ?: "/")
    }
    def updateIsDelete(Long id) {
        def topic = Topic.get(id)

        if (!topic) {
            flash.message = "Topic not found"
            redirect(uri: request.getHeader("referer") ?: "/")
            return
        }

        if (topic.createdBy.id != session.user.id) {
            flash.message = "Unauthorized"
            redirect(uri: request.getHeader("referer") ?: "/")
            return
        }

        topic.isDeleted = true
        if (topic.save(flush: true)) {
            flash.message = "Topic marked as deleted"
        } else {
            flash.message = "Failed to delete topic"
        }
        redirect(uri: request.getHeader("referer") ?: "/")
    }
}