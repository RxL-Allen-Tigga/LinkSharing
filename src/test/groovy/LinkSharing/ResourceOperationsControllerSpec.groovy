package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ResourceOperationsControllerSpec extends Specification implements ControllerUnitTest<ResourceOperationsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
