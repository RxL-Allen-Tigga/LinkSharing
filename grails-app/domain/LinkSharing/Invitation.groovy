package LinkSharing

class Invitation {
    String token
    String email
    Topic topic
    Date dateCreated
    Date expirationDate
    boolean used = false

    static constraints = {
        token nullable: false, unique: true
        email nullable: false, email: true
        topic nullable: false
        expirationDate nullable: false
    }
}