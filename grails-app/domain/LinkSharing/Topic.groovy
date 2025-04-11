package LinkSharing

class Topic {
    String name;
    LS_User createdBy;
    Date dateCreated;
    Date lastUpdated;
    Boolean isDeleted=false;
    enum Visibility{
        PUBLIC, PRIVATE
    }
    static hasMany=[subscription:Subscription,resource:LS_Resource]
    static belongsTo = [createdBy: LS_User]
    static constraints = {
        name blank: false, unique: 'createdBy'
        visibility nullable: false
    }
}