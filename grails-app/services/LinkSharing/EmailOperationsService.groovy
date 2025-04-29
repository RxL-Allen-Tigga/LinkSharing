package LinkSharing

import grails.gorm.transactions.Transactional
import grails.web.mapping.LinkGenerator

@Transactional
class EmailOperationsService {

    def mailService // Injecting mailService into the service
    LinkGenerator grailsLinkGenerator

    def sendPasswordResetEmail(String email) {
        if (!email) {
            throw new IllegalArgumentException("Email is required.")
        }

        // Find the user by email
        LS_User user = LS_User.findByEmail(email)
        if (user) {
            def token = UUID.randomUUID().toString()

            user.passwordResetToken = token
            user.save(flush: true)

            def resetLink = grailsLinkGenerator.link(
                    controller: 'webSurf',
                    action: 'ResetPassword',
                    params: [token: token],
                    absolute: true
            )

            mailService.sendMail {
                to email
                subject "Password Reset Request"
                html """
                    <p>You have requested to reset your password for the LinkSharing system.</p>
                    <p><a href="${resetLink}">Click here to reset your password</a></p>
                    <p>If you did not request a password reset, please ignore this email.</p>
                """
            }

            return true
        } else {
            throw new IllegalArgumentException("No user found with that email address.")
        }
    }

    def sendInvitation(String email, Long topicId) {
        def topic = Topic.get(topicId)
        if (!topic) {
            return [success: false, message: "Topic not found."]
        }

        def token = UUID.randomUUID().toString()
        try {
            // Save invitation token
            def invitation = new Invitation(email: email, token: token, topic: topic)
            if (!invitation.save(flush: true)) {
                return [success: false, message: "Failed to save invitation: ${invitation.errors}"]
            }

            // Generate link
            def invitationLink = grailsLinkGenerator.link(
                    controller: 'webSurf',
                    action: 'Topic',
                    params: [id: topicId, token: token],
                    absolute: true
            )

            // Send email
            mailService.sendMail {
                to email
                subject "You're invited to join a topic"
                html """
                <p>You have been invited to join the topic <strong>${topic.name}</strong> on LinkSharing.</p>
                <p><a href="${invitationLink}">Click here to subscribe</a></p>
                <p>Best regards,<br>Your Platform Team</p>
            """
            }

            return [success: true, message: "Invitation sent successfully.", topic: topic]

        } catch (Exception e) {
            log.error("Failed to send invitation email: ${e.message}", e)
            return [success: false, message: "An error occurred while sending the invitation."]
        }
    }
}