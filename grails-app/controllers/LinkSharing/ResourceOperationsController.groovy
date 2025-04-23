package LinkSharing

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional

@Transactional
class ResourceOperationsController {
    def editDescription() {
        Long resourceId = params.id as Long
        String newDescription = params.description

        LS_Resource resource = LS_Resource.get(resourceId)

        if (!resource) {
            flash.error = "Resource not found."
            redirect(controller: "dashboard", action: "index") // or your appropriate view
            return
        }

        def user = session.user

        if (resource.createdBy.id == user.id || user?.admin) {
            resource.description = newDescription
            resource.lastUpdated = new Date()

            if (resource.validate()) {
                resource.save(flush: true)
                flash.message = "Description updated successfully."
            } else {
                flash.error = "Validation failed: ${resource.errors.allErrors*.defaultMessage.join(', ')}"
            }
        } else {
            flash.error = "Unauthorized to edit this resource."
        }

        redirect(uri: request.getHeader('referer')) // or wherever you want to go next
    }
    def deleteResource() {
        Long resourceId = params.id as Long
        LS_Resource resource = LS_Resource.get(resourceId)

        if (!resource) {
            flash.error = "Resource not found."
            redirect(uri: request.getHeader('referer'))
            return
        }

        def user = session.user

        if (resource.createdBy.id == user.id || user?.admin) {
            resource.isDeleted = true
            resource.lastUpdated = new Date()

            if (resource.save(flush: true)) {
                flash.message = "Resource deleted successfully."
            } else {
                flash.error = "Failed to delete resource."
            }
        } else {
            flash.error = "Unauthorized to delete this resource."
        }

        redirect(controller: "webSurf", action: "Dashboard")
    }
}