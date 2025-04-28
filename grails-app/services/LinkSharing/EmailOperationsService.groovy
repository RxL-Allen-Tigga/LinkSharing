package LinkSharing

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
}