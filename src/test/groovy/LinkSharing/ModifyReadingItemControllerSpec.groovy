package LinkSharing

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ModifyReadingItemControllerSpec extends Specification implements ControllerUnitTest<ModifyReadingItemController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
