package LinkSharing

class LinkResource extends Resource {
    String url;
    static constraints = {
        url url:true, nullable:false
    }
}