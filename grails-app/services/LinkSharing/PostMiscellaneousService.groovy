package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class PostMiscellaneousService {

    def getPostData(user, id) {
//        Current post data (Post)
        def resource = LS_Resource.findByIdAndIsDeleted(id, false)

//        Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic
        return [
                resource: resource,
                subscribedTopics: subscribedTopics
        ]
    }
}