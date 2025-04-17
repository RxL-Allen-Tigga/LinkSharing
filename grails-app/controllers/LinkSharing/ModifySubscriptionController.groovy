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
}