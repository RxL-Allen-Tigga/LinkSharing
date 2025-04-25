package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile


@Transactional
class ResourceRatingMiscellaneousService {

    def saveRating(params, def user) {
        def resource = LS_Resource.get(params.resourceId)
        if (!resource) {
            return [success: false, message: "Resource not found.", resourceId: params.resourceId]
        }

        int score = params.int("score") ?: 0
        if (score < 1 || score > 5) {
            return [success: false, message: "Invalid score. Please select between 1 and 5 stars.", resourceId: resource.id]
        }

        def existingRating = ResourceRating.findByResourceAndUserAndIsDeleted(resource, user, false)

        if (existingRating) {
            existingRating.score = score
            existingRating.save(flush: true)
        } else {
            new ResourceRating(resource: resource, user: user, score: score).save(flush: true)
        }

        return [success: true, message: "Your rating has been saved!", resourceId: resource.id]
    }

    def getUserRating(params, def user) {
        if (!user) return "0"
        def resource = LS_Resource.get(params.resourceId)
        if (!resource) return "Resource not found"

        def rating = ResourceRating.findByResourceAndUserAndIsDeleted(resource, user, false)
        return rating?.score?.toString() ?: "0"
    }

    def getAverageRating(params) {
        def resource = LS_Resource.get(params.resourceId)
        if (!resource) return "Resource not found"

        def ratings = ResourceRating.findAllByResourceAndIsDeleted(resource, false)
        if (!ratings) return "No ratings yet"

        def average = (ratings*.score.sum() / ratings.size()).round(2)
        return average
    }
}
