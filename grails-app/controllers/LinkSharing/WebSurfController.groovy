package LinkSharing

class WebSurfController {

    def index(){
    }
    def Admin() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Dashboard() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def EditProfile() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Login() {
    }
    def Post() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Profile() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Search() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
    def Topic() {
        if (!session.user) {
            redirect(controller: "webSurf", action: "Login")
        }
    }
}