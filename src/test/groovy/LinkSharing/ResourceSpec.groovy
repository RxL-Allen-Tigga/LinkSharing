package LinkSharing

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ResourceSpec extends Specification implements DomainUnitTest<LS_Resource> {

     void "test domain constraints"() {
        when:
        LS_Resource domain = new LS_Resource()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
