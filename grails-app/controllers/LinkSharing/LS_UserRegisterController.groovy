package LinkSharing

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional

@Transactional
class LS_UserRegisterController {

    def register() {
        println "Inside register() method"
        // Check password match
        if (params.password != params.confirmPassword) {
            render "Passwords do not match."
            return
        }

        def user = new LS_User()
        user.firstName = params.firstName
        user.lastName = params.lastName
        user.email = params.email
        user.username = params.username
        user.password = params.password

        user.active = true
        user.admin = false
        user.isDeleted = false

        def photoFile = request.getFile('photo')
        if (photoFile && !photoFile.empty) {
            user.photo = photoFile.bytes
        }

        try {
            if (user.save(flush: true, failOnError: true)) {
                flash.message = "User registered successfully!"
                redirect(controller: "webSurf", action: "Dashboard")
            }
        } catch (Exception e) {
            e.printStackTrace()
            render "Failed to register user: ${e.message}"
        }

    }
}
