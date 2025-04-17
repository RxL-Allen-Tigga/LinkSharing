package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ModifyTopicControllerSpec extends Specification implements ControllerUnitTest<ModifyTopicController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
