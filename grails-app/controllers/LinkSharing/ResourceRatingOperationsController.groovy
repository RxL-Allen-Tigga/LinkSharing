package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class ResourceRatingOperationsController {

    ResourceRatingMiscellaneousService resourceRatingMiscellaneousService

    def saveRating() {
        def user = session.user
        if (!user) {
            flash.message = "You must be logged in to rate."
            redirect(uri: request.getHeader("referer"))
            return
        }

        def result = resourceRatingMiscellaneousService.saveRating(params, user)
        flash.message = result.message
        redirect(controller: "webSurf", action: "Post", params: [id: result.resourceId])
    }

    def userRating() {
        def user = session.user
        def rating = resourceRatingMiscellaneousService.getUserRating(params, user)
        render text: rating
    }

    def averageRating() {
        def average = resourceRatingMiscellaneousService.getAverageRating(params)
        render text: average
    }
}