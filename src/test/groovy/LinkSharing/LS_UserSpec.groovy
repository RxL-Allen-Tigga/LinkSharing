package LinkSharing

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class LS_UserSpec extends Specification implements DomainUnitTest<LS_User> {

     void "test domain constraints"() {
        when:
        LS_User domain = new LS_User()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
