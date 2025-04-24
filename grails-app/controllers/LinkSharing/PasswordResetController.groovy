package LinkSharing

import grails.gorm.transactions.Transactional
import jakarta.mail.internet.MimeMessage
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import org.springframework.stereotype.Controller

@Controller  // <-- Ensure this or make it a Grails controller
class PasswordResetController {

    @Autowired
    JavaMailSender javaMailSender  // No @Autowired, Grails will inject

    def forgotPassword() {
        def email = params.email
        def user = LS_User.findByEmail(email)

        if (user) {
            try {
                MimeMessage message = javaMailSender.createMimeMessage()
                MimeMessageHelper helper = new MimeMessageHelper(message, true)

                helper.setTo(user.email)
                helper.setSubject("Your Password")
                helper.setText("Hi ${user.firstName},\n\nYour password is: ${user.password}\n\nLinkSharing Team")

                javaMailSender.send(message)

                flash.message = "Password has been sent to your email."
            } catch (Exception e) {
                flash.message = "Error sending email: ${e.message}"
            }
        } else {
            flash.message = "Email not found."
        }

        redirect(controller: 'webSurf', action: 'Login')
    }
}
