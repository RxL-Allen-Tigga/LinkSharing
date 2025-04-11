package LinkSharing
import java.sql.Blob

class LS_User {
    String email;
    String username;
    String password;
    String firstName;
    String lastName;
    byte[] photo;
    Boolean admin=false;
    Boolean active=true;
    Boolean isDeleted=false;
    Date dateCreated;
    Date lastUpdated;
    static hasMany=[topic:Topic, subscription:Subscription, readingItem:ReadingItem, rating:ResourceRating, resource:LS_Resource]
    static constraints = {
//        email email: true, unique: true, nullable: false;
//        email blank: false
        email blank: false, validator: { val, obj ->
            return val ==~ /.+@.+\..+/
        }
        username unique: true, nullable: false;
        password nullable: false , blank:false;
        firstName nullable: false;
        lastName nullable: true;
        photo nullable: true, maxSize: 5 * 1024 * 1024;
    }
}