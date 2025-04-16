package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class TopicShowControllerSpec extends Specification implements ControllerUnitTest<TopicShowController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
