package LinkSharing

class WebSurfController {

    def index(){
    }
    def Admin() {
        if (!session.user?.admin) {
            redirect(controller: "webSurf", action: "Dashboard")
        }
    }
    def Dashboard() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
    def EditProfile() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
    def Login() {
    }
    def Post() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
    def Profile() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
    def Search() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
    def Topic() {
        if (!session.user) {
            redirect(uri: request.getHeader('referer'))
        }
    }
}