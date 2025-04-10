package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification
//import LinkSharing.UrlMappings

class UrlMappingsControllerSpec extends Specification implements ControllerUnitTest<UrlMappingsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
