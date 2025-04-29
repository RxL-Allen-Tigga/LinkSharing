package LinkSharing


class SendInvitationController {
    EmailOperationsService emailOperationsService

    def SendTopicInvitation() {
        def email = params.email
        def topicId = params.long("topicId")

        def result = emailOperationsService.sendInvitation(email, topicId)
        if (result.success) {
            flash.message = result.message
        } else {
            flash.error = result.message
        }
        redirect(uri: request.getHeader("referer") ?: "/")
        return
    }
}