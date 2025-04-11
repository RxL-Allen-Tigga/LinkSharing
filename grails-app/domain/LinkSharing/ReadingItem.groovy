package LinkSharing

class ReadingItem {
    LS_Resource resource;
    LS_User user;
    Boolean isRead;
    Boolean isDeleted=false;
    static belongsTo = [user: LS_User, resource: LS_Resource]
    static constraints = {
        isRead nullable: false; blank:false
    }
}