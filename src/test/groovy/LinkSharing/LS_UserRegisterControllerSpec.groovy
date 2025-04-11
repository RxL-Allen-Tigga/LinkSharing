package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification
import org.springframework.mock.web.MockMultipartFile
import spock.lang.Ignore
//
//@Ignore
//class LS_UserRegisterControllerSpec extends Specification implements ControllerUnitTest<LS_UserRegisterController> {
//
//    void "test register action with valid data"() {
//        given:
//        request.method = 'POST'
//        controller.params.firstName = "John"
//        controller.params.lastName = "Doe"
//        controller.params.email = "john.doe@example.com"
//        controller.params.username = "johndoe"
//        controller.params.password = "secret"
//        controller.params.confirmPassword = "secret"
//
//        // You can mock file upload like this if needed
//        def file = new MockMultipartFile("photo", "filename.jpg", "image/jpeg", "mock file content".bytes)
//        controller.request.addFile(file)
//
//        when:
//        controller.register()
//
//        then:
//        response.redirectedUrl == "/webSurf/Dashboard"
//        flash.message == "User registered successfully!"
//    }
//}
