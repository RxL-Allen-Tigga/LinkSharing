package LinkSharing
import spock.lang.Ignore
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

//import LinkSharing.UrlMappings
@Ignore
//class UrlMappingsControllerSpec extends Specification implements ControllerUnitTest<UrlMappingsCotroller> {
class UrlMappingsControllerSpec extends Specification implements ControllerUnitTest<UrlMappings> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
