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
    def createDocumentResource(MultipartFile file, String description, Long topicId, LS_User user) {
        if (!file || file.empty || !description || !topicId || !user) {
            return [success: false, message: "All fields are required."]
        }

        def topic = Topic.get(topicId)
        if (!topic) {
            return [success: false, message: "Topic not found."]
        }

        try {
            // Save the file to disk or any directory
            String uploadDir = "/path/to/store/documents"  // replace with real path
            new File(uploadDir).mkdirs()
            String uniqueFileName = "${System.currentTimeMillis()}_${file.originalFilename}"
            String filePath = "${uploadDir}/${uniqueFileName}"
            file.transferTo(new File(filePath))

            def resource = new DocumentResource(
                    filePath: filePath,
                    description: description,
                    topic: topic,
                    createdBy: user
            )

            if (!resource.validate()) {
                return [success: false, message: "Resource validation failed: ${resource.errors}"]
            }

            resource.save(flush: true)

            // Add reading item for the uploader
            new ReadingItem(user: user, resource: resource, isRead: false).save(flush: true)

            // Add reading items for other subscribers
            def otherSubscribers = Subscription.findAllByTopic(topic).findAll { it.user.id != user.id }*.user
            otherSubscribers.each { subscribedUser ->
                new ReadingItem(user: subscribedUser, resource: resource, isRead: false).save(flush: true)
            }

            return [success: true, message: "Document shared successfully in topic '${topic.name}'."]
        } catch (Exception e) {
            return [success: false, message: "Error sharing document: ${e.message}"]
        }
    }
}
