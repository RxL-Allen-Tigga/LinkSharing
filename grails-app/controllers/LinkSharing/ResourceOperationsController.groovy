package LinkSharing

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional

@Transactional
class ResourceOperationsController {
    ResourceOperationsMiscellaneousService resourceOperationsMiscellaneousService
    def editDescription() {
        Long resourceId = params.id as Long
        String newDescription = params.description

        def result = resourceOperationsMiscellaneousService.editDescription(resourceId, newDescription, session.user)

        flash.message = result.message
        redirect(uri: request.getHeader("referer") ?: "/")
    }

    def deleteResource() {
        Long resourceId = params.id as Long
        def result = resourceOperationsMiscellaneousService.deleteResource(resourceId, session.user, request)

        flash.message = result.message
        flash.error = result.error
        redirect(controller: "webSurf", action: "Dashboard")
    }
}