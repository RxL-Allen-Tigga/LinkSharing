package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class SendInvitationControllerSpec extends Specification implements ControllerUnitTest<SendInvitationController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
