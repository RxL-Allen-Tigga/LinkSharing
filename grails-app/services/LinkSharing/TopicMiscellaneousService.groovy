package LinkSharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile


@Transactional
class TopicMiscellaneousService {

    def createTopic(String name, String visibilityParam, LS_User user) {
        if (!name || !visibilityParam) {
            return [success: false, message: "Topic name and visibility are required."]
        }
        def existingTopic = Topic.findByNameAndCreatedBy(name.trim(), user)
        if (existingTopic) {
            return [success: false, message: "Topic '${name}' already exists. Create a Topic with another name"]
        }

        try {
            Topic.Visibility visibility = Topic.Visibility.valueOf(visibilityParam.toUpperCase())
            def topic = new Topic(
                    name: name.trim(),
                    visibility: visibility,
                    createdBy: user
            )
            def subscription = new Subscription(
                    topic: topic,
                    user: user,
                    seriousness: Subscription.Seriousness.VERY_SERIOUS
            )
            if (topic.validate()) {
                topic.save(flush: true)
                subscription.save(flush: true)
                return [success: true, message: "Topic '${name}' created successfully and a new subscription added to '${name}'"]
            } else {
                return [success: false, message: "Error creating topic: ${topic.errors}"]
            }
        } catch (Exception e) {
            return [success: false, message: "Failed to create topic: ${e.message}"]
        }
    }
    def createLinkResource(String link, String description, def topicId, LS_User user) {
        if (!link || !description || !topicId || !user) {
            return [success: false, message: "All fields are required."]
        }
        def topic = Topic.get(topicId)
        if (!topic) {
            return [success: false, message: "Topic not found."]
        }
        try {
            def resource = new LinkResource(
                    url: link,
                    description: description,
                    topic: topic,
                    createdBy: user
            )
            if (!resource.validate()) {
                return [success: false, message: "Resource validation failed: ${resource.errors}"]
            }
            resource.save(flush: true)
            new ReadingItem(
                    user: user,
                    resource: resource,
                    isRead: false
            ).save(flush: true)
            def otherSubscribers = Subscription.findAllByTopic(topic).findAll { it.user.id != user.id }*.user
            otherSubscribers.each { subscribedUser ->
                new ReadingItem(
                        user: subscribedUser,
                        resource: resource,
                        isRead: false
                ).save(flush: true)
            }
            return [success: true, message: "Link shared successfully in topic '${topic.name}'."]
        } catch (Exception e) {
            return [success: false, message: "Error sharing link: ${e.message}"]
        }
    }
    def grailsApplication

    def createDocumentResource(MultipartFile file, String description, Long topicId, LS_User user) {
        Topic topic = Topic.get(topicId)
        if (!topic) {
            return [success: false, message: "Invalid topic."]
        }

        // Get the custom upload directory (you can use absolute path as you specified)
        String uploadDir = '/home/allentigga/IdeaProjects/LinkSharing/grails-app/assets/ResourcesDocFiles'

        // Ensure the directory exists
        new File(uploadDir).mkdirs()

        // Generate a unique filename
        String fileName = "${UUID.randomUUID()}_${file.originalFilename}"
        String filePath = "${uploadDir}/${fileName}"

        // Save file to the directory
        File dest = new File(filePath)
        file.transferTo(dest)

        // Save DocumentResource with relative path in DB
        String relativeFilePath = "assets/ResourcesDocFiles/${fileName}"  // Store the relative path
        DocumentResource resource = new DocumentResource(
                description: description,
                createdBy: user,
                topic: topic,
                filePath: relativeFilePath
        )
        try {
            resource.save(flush: true, failOnError: true)

            // Add ReadingItem for creator
            new ReadingItem(
                    user: user,
                    resource: resource,
                    isRead: false
            ).save(flush: true)

            // Add ReadingItems for other subscribers
            def otherSubscribers = Subscription.findAllByTopic(topic).findAll { it.user.id != user.id }*.user
            otherSubscribers.each { subscribedUser ->
                new ReadingItem(
                        user: subscribedUser,
                        resource: resource,
                        isRead: false
                ).save(flush: true)
            }

            return [success: true, message: "Document shared successfully."]
        } catch (Exception e) {
            return [success: false, message: "Error sharing document: ${e.message}"]
        }
    }

    def getTopicData(Long id, def sessionUser){
        def subscribedTopics = Subscription.createCriteria().list {
            eq("user", sessionUser)
            eq("isDeleted", false)
            topic {
                eq("isDeleted", false)
            }
        }*.topic

//        Resouces of current topic (Posts)
        def userTopic = Topic.findByIdAndIsDeleted(id, false)
        def resources = LS_Resource.createCriteria().list {
            eq("topic.id", userTopic.id)
            eq("isDeleted", false)
            order("dateCreated", "desc")
        }

//        Other subscribers of current topic
        def activeSubscriptionCount = Subscription.createCriteria().get {
            eq("topic", userTopic)
            eq("isDeleted", false)
            projections {
                countDistinct("id")
            }
        } ?: 0
        def activeResourceCount = LS_Resource.createCriteria().get {
            eq("topic", userTopic)
            eq("isDeleted", false)
            projections {
                countDistinct("id")
            }
        } ?: 0

//        Data to check if session user is subcriber to curent topic
        def userSubscription = Subscription.findByUserAndTopicAndIsDeleted(sessionUser, userTopic, false)

//        Subscibers of current topic (Subscriptions)
        def topicId = userTopic.id // Use actual user topic id here
        def topicSubscribers = LS_User.executeQuery("""
            select new map(
                u as user,
                (select count(distinct t1.id)
                 from Topic t1
                 where t1.createdBy = u and t1.visibility = 'PUBLIC' and t1.isDeleted = false) as publicTopicCount,
                (select count(distinct r1.id)
                 from LS_Resource r1
                 where r1.createdBy = u and r1.isDeleted = false and r1.topic.visibility = 'PUBLIC') as publicPostCount
            )
            from Subscription s
            join s.user u
            join s.topic t
            where s.isDeleted = false
              and t.isDeleted = false
              and t.id = :topicId
        """, [topicId: userTopic.id])

        return [
                userTopic              : userTopic,
                activeSubscriptionCount: activeSubscriptionCount,
                activeResourceCount    : activeResourceCount,
                userSubscription       : userSubscription,
                topicSubscribers       : topicSubscribers,
                subscribedTopics       : subscribedTopics,
                resources              : resources
        ]
    }
    def editTopic(params, def user) {
        Long topicId = params.long("id")
        String newName = params.name?.trim()

        def topic = Topic.findById(topicId)
        if (!topic) {
            return [success: false, message: "Topic not found."]
        }

        def existingTopic = Topic.findByNameAndIsDeleted(newName, false)
        if (existingTopic && existingTopic.id != topicId) {
            return [success: false, message: "A topic with this name already exists."]
        }

        if (user.admin || topic.createdBy.id == user.id) {
            topic.name = newName
            if (topic.validate()) {
                topic.save(flush: true)
                return [success: true, message: "Topic updated successfully."]
            } else {
                return [success: false, message: "Failed to update topic. ${topic.errors?.allErrors}"]
            }
        }

        return [success: false, message: "You are not authorized to edit this topic."]
    }
}
