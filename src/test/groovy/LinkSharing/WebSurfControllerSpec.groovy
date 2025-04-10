package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class WebSurfControllerSpec extends Specification implements ControllerUnitTest<WebSurfController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
