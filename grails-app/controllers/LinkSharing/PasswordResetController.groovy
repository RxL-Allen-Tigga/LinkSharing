package LinkSharing

class PasswordResetController {

    EmailOperationsService emailOperationsService // Injecting EmailOperationsService

    def forgotPassword() {
        println "EmailOperationsService available: ${emailOperationsService != null}"

        String email = params.email // Correctly retrieving email from the form
        if (!email) {
            flash.message = "Email is required."
            redirect(uri: request.getHeader("referer") ?: "/")
            return
        }

        try {
            // Call the correct service method to handle password reset email logic
            boolean success = emailOperationsService.sendPasswordResetEmail(email)
            if (success) {
                flash.message = "Your password has been sent to your email."
            }
        } catch (IllegalArgumentException e) {
            flash.message = e.message
        } catch (Exception e) {
            flash.message = "An error occurred while processing your request."
            log.error("Error occurred in forgotPassword", e)
        }

        redirect(uri: request.getHeader("referer") ?: "/")
    }
}
