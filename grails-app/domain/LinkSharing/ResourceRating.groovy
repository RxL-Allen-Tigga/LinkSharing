package LinkSharing

class ResourceRating {
    LS_Resource resource;
    LS_User user;
    Integer score;
    Boolean isDeleted=false;
    static belongsTo = [user: LS_User, resource: LS_Resource]
    static constraints = {
        score min: 1, max: 5
    }
}