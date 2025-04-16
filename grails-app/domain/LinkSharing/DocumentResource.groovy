package LinkSharing

class DocumentResource extends LS_Resource{
    String filePath
    static constraints = {
        filePath nullable: false
    }
}
