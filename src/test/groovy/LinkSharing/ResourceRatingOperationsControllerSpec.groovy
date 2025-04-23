package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ResourceRatingOperationsControllerSpec extends Specification implements ControllerUnitTest<ResourceRatingOperationsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
