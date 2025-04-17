package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ModifySubscriptionControllerSpec extends Specification implements ControllerUnitTest<ModifySubscriptionController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
