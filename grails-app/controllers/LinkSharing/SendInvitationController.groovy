package LinkSharing


class SendInvitationController {
    EmailOperationsService emailOperationsService

    def SendTopicInvitation() {
        def email = params.email
        def topicId = params.long("topicId")

        // Generate a unique token for the invitation
        def token = UUID.randomUUID().toString()

        // Generate the correct link for local development using absolute:true
        def invitationLink = createLink(controller: 'webSurf', action: 'Topic', params: [id: topicId], absolute: true)
//        def invitationLink = createLink(controller: 'webSurf', action: 'Topic', params: [id: topicId, token: token], absolute: true)

        // Force the invitation link to use the correct localhost URL
        if (!invitationLink.startsWith('http://localhost:8080')) {
            invitationLink = "http://localhost:8080" + invitationLink.substring(invitationLink.indexOf('/webSurf'))
        }

        // Send the invitation email with the correct link
        emailOperationsService.sendInvitation(email, topicId, token, invitationLink)

        // Flash message
        flash.message = "Invitation sent successfully"

        // Redirect user if necessary
        def user = LS_User.findByEmail(email)

        if (user?.active) {
            // If user exists and is active, redirect them to the topic page
            redirect(controller: 'webSurf', action: 'Topic', params: [id: topicId])
//            redirect(controller: 'webSurf', action: 'Topic', params: [id: topicId, token: token])
        } else {
            // If user is not registered, redirect them to the registration page
            redirect(controller: 'user', action: 'register')
        }
    }
}