package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class TopicMiscellaneousService {

    def createTopic(String name, String visibilityParam, def user) {
        if (!name || !visibilityParam) {
            return [success: false, message: "Topic name and visibility are required."]
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
                    user: user
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
}
