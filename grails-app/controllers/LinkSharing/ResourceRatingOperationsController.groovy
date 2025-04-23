package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class ResourceRatingOperationsController {
    def saveRating() {
        def user = session.user
        if (!user) {
            flash.message = "You must be logged in to rate."
            redirect(uri: request.getHeader("referer"))
            return
        }

        def resource = LS_Resource.get(params.resourceId)
        if (!resource) {
            flash.message = "Resource not found."
            redirect(uri: request.getHeader("referer"))
            return
        }

        int score = params.int("score") ?: 0

        if (score < 1 || score > 5) {
            flash.message = "Invalid score. Please select between 1 and 5 stars."
            redirect(controller: "webSurf", action: "Post", params: [id: resource.id])
            return
        }

        def existingRating = ResourceRating.findByResourceAndUserAndIsDeleted(resource, user, false)

        if (existingRating) {
            existingRating.score = score
            existingRating.save(flush: true)
        } else {
            new ResourceRating(resource: resource, user: user, score: score).save(flush: true)
        }
        flash.message = "Your rating has been saved!"
        redirect(controller: "webSurf", action: "Post", params: [id: resource.id])
    }

    /**
     * (Optional) Returns the current user's rating as text (used in JS-based version).
     */
    def userRating() {
        def user = session.user
        if (!user) {
            render text: "0"
            return
        }

        def resource = LS_Resource.get(params.resourceId)
        if (!resource) {
            render status: 404, text: "Resource not found"
            return
        }

        def rating = ResourceRating.findByResourceAndUserAndIsDeleted(resource, user, false)
        render text: rating?.score ?: "0"
    }

    /**
     * (Optional) Returns the average rating (can be used in view)
     */
    def averageRating() {
        def resource = LS_Resource.get(params.resourceId)
        if (!resource) {
            render status: 404, text: "Resource not found"
            return
        }

        def ratings = ResourceRating.findAllByResourceAndIsDeleted(resource, false)
        if (!ratings) {
            render text: "No ratings yet"
            return
        }

        def average = (ratings*.score.sum() / ratings.size()).round(2)
        render text: average
    }
}
