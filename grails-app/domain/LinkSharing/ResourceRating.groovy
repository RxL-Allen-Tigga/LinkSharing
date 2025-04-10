package LinkSharing

class ResourceRating {
    Resource resource;
    LS_User user;
    Integer score;
    Boolean isDeleted=false;
    static belongsTo = [user: LS_User, resource: Resource]
    static constraints = {
        score min: 1, max: 5
    }
}