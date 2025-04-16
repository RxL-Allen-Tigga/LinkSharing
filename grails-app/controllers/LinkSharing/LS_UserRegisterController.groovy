package LinkSharing

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional

@Transactional
class LS_UserRegisterController {

    def register() {
        println "Inside register() method"
        if (!params.firstName || !params.email || !params.username || !params.password || !params.confirmPassword) {
            flash.message = "Please fill all required fields."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        if (params.password != params.confirmPassword) {
            flash.message = "Passwords do not match."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        if (LS_User.findByEmail(params.email.toLowerCase())) {
            flash.message = "Email already registered. Try logging in."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        if (LS_User.findByUsername(params.username)) {
            flash.message = "Username already taken. Please choose another."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        def photoFile = request.getFile('photo')
        if (!photoFile || photoFile.empty) {
            flash.message = "Please upload a photo."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        if (!photoFile.contentType.startsWith("image/")) {
            flash.message = "Uploaded file must be an image."
            redirect(controller: "webSurf", action: "Login")
            return
        }
        if (params.password.length() < 6) {
            flash.message = "Password must be at least 6 characters long."
            redirect(controller: "webSurf", action: "Login")
            return
        }

        def user = new LS_User(
                firstName: params.firstName,
                lastName: params.lastName,
                email: params.email.toLowerCase(),
                username: params.username,
                password: params.password,
                photo: photoFile.bytes,
                active: true,
                admin: false,
                isDeleted: false
        )
        try {
            if (user.save(flush: true, failOnError: true)) {
                flash.message = "User registered successfully! Please log in."
                redirect(controller: "webSurf", action: "Login")
            }
        } catch (Exception e) {
            e.printStackTrace()
            flash.message = "Registration failed: ${e.message}"
            redirect(controller: "webSurf", action: "Login")
        }
    }


    def login() {
        String email = params.email.toLowerCase()
        String password = params.password
        if (!email || !password) {
            flash.message = "Please fill in all required fields."
            redirect(controller: 'webSurf', action: 'Login')
            return
        }

        def user = LS_User.findByEmailAndPassword(email, password)
        if (user) {
            session.user = user
            flash.message = "Welcome, ${user.email}!"
            redirect(controller: 'webSurf', action: 'Dashboard')
        } else {
            flash.message = "Invalid email or password."
            redirect(controller: 'webSurf', action: 'Login')
        }
    }
    def logout(){
        session.invalidate()
        flash.message = "You have been logged out."
        redirect(controller: "webSurf", action: "Login")
    }
    def updateProfile() {
        LS_User userInstance = session.user  // Assuming session.user is a full LS_User object
        if (!userInstance) {
            flash.message = "User not found"
            redirect(controller: "webSurf", action: "EditProfile")
            return
        }

        // Only update if data is provided
        if (params.firstName?.trim()) {
            userInstance.firstName = params.firstName
        }

        if (params.lastName?.trim()) {
            userInstance.lastName = params.lastName
        }

        if (params.username?.trim()) {
            userInstance.username = params.username
        }

        def photoFile = request.getFile('photo')
        if (photoFile && !photoFile.empty) {
            userInstance.photo = photoFile.bytes
        }

        if (userInstance.validate()) {
            userInstance.save(flush: true)
            flash.message = "Profile updated successfully"
            session.user = userInstance
        } else {
            flash.message = "There was an error updating your profile"
        }

        redirect(controller: "webSurf", action: "EditProfile")
    }
    def changePassword() {
        def user = session.user
        if (!user) {
            flash.message = "User not found"
            redirect(controller: "webSurf", action: "EditProfile")
            return
        }
        def newPassword = params.newPassword?.trim()
        def confirmPassword = params.confirmPassword?.trim()
        if (!newPassword || !confirmPassword) {
            flash.message = "Both fields are required"
            redirect(controller: "webSurf", action: "EditProfile")
            return
        }
        if (newPassword != confirmPassword) {
            flash.message = "Passwords do not match"
            redirect(controller: "webSurf", action: "EditProfile")
            return
        }
        if (newPassword.length() < 6) {
            flash.message = "Password must be at least 6 characters"
            redirect(controller: "webSurf", action: "EditProfile")
            return
        }
        user.password = newPassword  // 🔒 You should hash this before saving!
        if (user.validate()) {
            user.save(flush: true)
            flash.message = "Password updated successfully"
        } else {
            flash.message = "Failed to update password"
        }
        redirect(controller: "webSurf", action: "EditProfile")
    }
}
