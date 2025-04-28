package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class EmailOperationsService {

    def mailService // Injecting mailService into the service

    def sendPasswordResetEmail(String email) {
        if (!email) {
            throw new IllegalArgumentException("Email is required.")
        }

        LS_User user = LS_User.findByEmail(email)
        if (user) {
            String password = user.password

            mailService.sendMail {
                to user.email
                subject "Your Password"
                html """
                    <p>Your password for the LinkSharing system is:</p>
                    <p><strong>${password}</strong></p>
                    <p>For security reasons, we recommend you change your password after logging in.</p>
                """
            }
            return true
        } else {
            throw new IllegalArgumentException("No user found with that email address.")
        }
    }

    def sendInvitation(String email, Long topicId, String token, String invitationLink) {
        def topic = Topic.get(topicId)

        // You can choose whether to save the token or store it in the database for tracking the invitation
        mailService.sendMail {
            to email
            subject "You're invited to join a topic"
            html """
                <p>You have been invited to join the topic <strong>${topic.name}</strong> on LinkSharing.</p>
                <p>If you're already registered, click the link below to subscribe:</p>
                <a href="${invitationLink}">Click here to subscribe</a>
                <p>If you're not registered yet, you will be prompted to create an account. After registration, you will automatically be subscribed to the topic.</p>
                <p>Best regards,<br>Your Platform Team</p>
            """
        }

        return topic // Return topic to track it in the controller if needed
    }
}