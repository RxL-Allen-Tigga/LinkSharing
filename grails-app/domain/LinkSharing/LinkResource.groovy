package LinkSharing

class LinkResource extends LS_Resource {
    String url;
    static constraints = {
        url url:true, nullable:false
    }
}