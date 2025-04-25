package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class UserMiscellaneousService {
    def getAdminData(user) {
//        Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic
//        Users data to show Admin
        def users = LS_User.createCriteria().list {
        }

        return [subscribedTopics: subscribedTopics, users: users]
    }

    def getAdminTopicData(user, params) {
//        Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic
//        Topics data to show Admin
        def topics = Topic.createCriteria().list {
            eq("isDeleted", false)
        }

        return [subscribedTopics: subscribedTopics, topics: topics]
    }

    def getAdminPostData(user, params) {
//        Navbar Modals Data
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", user)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic
//        Resources data to show Admin
        def posts = LS_Resource.createCriteria().list {
            eq("isDeleted", false)
        }

        return [subscribedTopics: subscribedTopics,
                posts: posts
        ]
    }
    def getSearchData(){
//        User
        def users = LS_User.findAllByIsDeleted(false)

//        Topic
        def publicTopics = Topic.findAllByIsDeletedAndVisibility(false, Topic.Visibility.PUBLIC)

//        Resources
        def publicResources = LS_Resource.createCriteria().list {
            eq('isDeleted', false)  // Filter LS_Resource where isDeleted is false
            topic {
                eq('isDeleted', false)  // Filter Topic where isDeleted is false
                eq('visibility', Topic.Visibility.PUBLIC)  // Filter Topic where visibility is PUBLIC
            }
        }

        return [
                users          : users,
                publicTopics   : publicTopics,
                publicResources: publicResources
        ]
    }
}
