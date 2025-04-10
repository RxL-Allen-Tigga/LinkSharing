package LinkSharing

class DocumentResource extends Resource{
    String filePath
    static constraints = {
        filePath nullable: false
    }
}