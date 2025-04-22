package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile
import LinkSharing.ReadingItem
@Transactional

class ModifyReadingItemController {

    def updateIsDelete(Long id) {
        println("Mark as Read: $id")
        // Find the ReadingItem by its ID
        def readingItem = ReadingItem.get(id)

        // Check if the ReadingItem exists
        if (!readingItem) {
            flash.message = "Reading item not found"
            redirect(uri: request.getHeader("referer") ?: "/")
            return
        }
        // Mark the ReadingItem as deleted
        readingItem.isDeleted = true

        // Save the changes
        if (readingItem.save(flush: true)) {
            flash.message = "Resource marked as Read"
        } else {
            flash.message = "Failed to delete reading item"
        }

        // Redirect back to the referring page
        redirect(uri: request.getHeader("referer") ?: "/")
    }
    def download(String filename) {
        def file = new File("/home/allentigga/IdeaProjects/LinkSharing/grails-app/assets/ResourcesDocFiles/${filename}")
        if (file.exists()) {
            response.setContentType("application/pdf")
            response.setHeader("Content-Disposition", "attachment; filename=${filename}")
            response.outputStream << file.bytes
            response.outputStream.flush()
        } else {
            render "File not found."
        }
    }
}
