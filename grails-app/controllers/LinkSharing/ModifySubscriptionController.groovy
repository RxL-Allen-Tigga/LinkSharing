package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile


@Transactional
class ModifySubscriptionController {
    def updateSeriousness(Long id, String seriousness) {
        Subscription subscription = Subscription.get(id)
        if (subscription && seriousness in Subscription.Seriousness.values()*.name()) {
            subscription.seriousness = Subscription.Seriousness.valueOf(seriousness)
            subscription.save(flush: true)
            flash.message = "Seriousness updated to ${seriousness}"
        } else {
            flash.error = "Invalid subscription or seriousness"
        }
//        redirect(controller: 'webSurf', action: 'Dashboard')
        String referer = request.getHeader('referer') ?: '/'
        redirect(uri: referer)
    }
    def updateSubscribeTopic(Long userid, Long topicid) {
        LS_User user = LS_User.get(userid)
        Topic topic = Topic.get(topicid)

        if (!user || !topic) {
            flash.error = "Invalid user or topic."
            redirect(uri: request.getHeader('referer') ?: '/')
            return
        }

        Subscription existing = Subscription.findByUserAndTopic(user, topic)

        if (existing) {
            if (existing.isDeleted) {
                // Reactivate the soft-deleted subscription
                existing.isDeleted = false
                existing.seriousness = Subscription.Seriousness.CASUAL // or keep the previous seriousness
                if (existing.save(flush: true)) {
                    flash.message = "Successfully re-subscribed to topic '${topic.name}'"
                } else {
                    flash.error = "Re-subscription failed: ${existing.errors}"
                }
            } else {
                flash.message = "You're already subscribed to this topic."
            }
        } else {
            // Create a new subscription
            Subscription subscription = new Subscription(
                    user: user,
                    topic: topic,
                    seriousness: Subscription.Seriousness.CASUAL
            )
            if (subscription.save(flush: true)) {
                flash.message = "Successfully subscribed to topic '${topic.name}'"
            } else {
                flash.error = "Subscription failed: ${subscription.errors}"
            }
        }

        String referer = request.getHeader('referer') ?: '/'
        redirect(uri: referer)
    }
    def updateUnsubscribeTopic(Long userid, Long topicid) {
        LS_User user = LS_User.get(userid)
        Topic topic = Topic.get(topicid)

        if (!user || !topic) {
            flash.error = "Invalid user or topic."
            redirect(uri: request.getHeader('referer') ?: '/')
            return
        }

        Subscription subscription = Subscription.findByUserAndTopic(user, topic)
        if (!subscription) {
            flash.error = "No subscription found."
        } else {
            subscription.isDeleted = true
            if (subscription.save(flush: true)) {
                flash.message = "Unsubscribed from topic '${topic.name}'."
            } else {
                flash.error = "Failed to unsubscribe: ${subscription.errors}"
            }
        }
        String referer = request.getHeader('referer') ?: '/'
        redirect(uri: referer)
    }


}