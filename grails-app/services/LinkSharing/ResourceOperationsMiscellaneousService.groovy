package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class ResourceOperationsMiscellaneousService {

    def editDescription(Long resourceId, String newDescription, def user) {
        LS_Resource resource = LS_Resource.get(resourceId)

        if (!resource) {
            return [success: false, message: "Post not found."]
        }

        if (resource.createdBy.id == user.id || user?.admin) {
            resource.description = newDescription
            resource.lastUpdated = new Date()

            if (resource.validate()) {
                resource.save(flush: true)
                return [success: true, message: "Post updated Successfully"]
            } else {
                return [success: false, message: "${topic.errors?.allErrors}"]
            }
        } else {
            return [success: false, message: "Unauthorized to edit this resource."]
        }
    }

    def deleteResource(Long resourceId, def user, def request) {
        LS_Resource resource = LS_Resource.get(resourceId)

        if (!resource) {
            return [success: false, message: "Resource not found."]
        }

        if (resource.createdBy.id == user.id || user?.admin) {
            resource.isDeleted = true
            resource.lastUpdated = new Date()

            if (resource.save(flush: true)) {
                return [success: true, message: "Post Deleted Successfully"]
            } else {
                return [success: false, message: "${resource.errors?.allErrors}"]
            }
        } else {
            return [success: false, message: "Unauthorized to edit this resource."]
        }
    }

}