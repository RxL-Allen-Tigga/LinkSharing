package LinkSharing

class LS_Resource {
    String description;
    LS_User createdBy;
    Topic topic;
    Date dateCreated;
    Date lastUpdated;
    boolean isDeleted=false;
    static belongsTo = [createdBy: LS_User, topic: Topic]
    static hasMany=[readingItem:ReadingItem,]
    static constraints = {
        description nullable: false, blank:false;
    }

}