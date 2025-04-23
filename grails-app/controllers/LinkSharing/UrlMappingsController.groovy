package LinkSharing

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
//            constraints {
//                // apply constraints here
//            }
        }

        "/"(controller: "webSurf", action: "Login")
        "500"(view:'/error')
        "404"(view:'/notFound')

//        "/LS_UserRegister/register"(controller: "LS_UserRegister", action: "register")

    }
}