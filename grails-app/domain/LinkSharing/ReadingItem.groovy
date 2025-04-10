package LinkSharing

class ReadingItem {
    Resource resource;
    LS_User user;
    Boolean isRead;
    Boolean isDeleted=false;
    static belongsTo = [user: LS_User, resource: Resource]
    static constraints = {
        isRead nullable: false; blank:false
    }
}