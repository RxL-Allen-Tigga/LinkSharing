package LinkSharing

class Subscription {
    Topic topic;
    LS_User user;
    Date dateCreated;
    Boolean isDeleted=false;
    enum Seriousness{
        SERIOUS, VERY_SERIOUS, CASUAL
    }
    static belongsTo = [user: LS_User, topic: Topic]
    static constraints = {
    }
}