<g:each in="${trendingtopicDataList}" var="map">
    <div class="row mb-2">
        <div class="col-2">
            <img src="data:image/jpeg;base64,${map.topic.createdBy?.photo?.encodeBase64()?.toString()}"
                 alt="Profile Image" width="100%" height="auto">
        </div>

        <div class="col">
            <!-- Topic Name -->
            <div class="row">
                <div class="col-9">
                    <g:link controller="webSurf" action="Topic" params="[id: map.topic?.id]">
                        <h5>${map.topic.name}
                        </h5>
                    </g:link>
                </div>

                <div class="col">
                    <g:if test="${!map.subscription}">
                        <a class="link-opacity-60-hover"
                           href="${createLink(controller: 'modifySubscription',
                                   action: 'updateSubscribeTopic', params: [userid: session.user.id, topicid: map.topic.id])}">
                            Subscribe
                        </a>
                    </g:if>
                    <g:if test="${map.subscription && map.topic.createdBy.id != session.user.id}">
                        <a class="link-opacity-60-hover"
                           href="${createLink(controller: 'modifySubscription',
                                   action: 'updateUnsubscribeTopic', params: [userid: session.user.id, topicid: map.topic.id])}">
                            UnSubscribe
                        </a>
                    </g:if>
                </div>
            </div>

            <!-- Creator, Subscribers, Posts -->
            <div class="row">
                <div class="col">
                    <g:link controller="webSurf" action="Profile" params="[id: map.topic.createdBy.id]">
                        <h6>@${map.topic.createdBy.username}</h6>
                    </g:link>
                </div>

                <div class="col">
                    <h6>${map.subscriptionCount} Subscribers</h6>
                </div>

                <div class="col">
                    <h6>${map.resourceCount} Posts</h6>
                </div>
            </div>

            <!-- Actions Row -->
            <div class="row">
                <div class="col">
                    <g:if test="${map.subscription}">
                        <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            ${map.subscription?.seriousness}
                        </a>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness',
                                           params: [id: map.subscription.id, seriousness: 'SERIOUS'])}">SERIOUS</a>
                            </li>
                            <li><a class="dropdown-item"
                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness',
                                           params: [id: map.subscription.id, seriousness: 'CASUAL'])}">CASUAL</a>
                            </li>
                            <li><a class="dropdown-item"
                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness',
                                           params: [id: map.subscription.id, seriousness: 'VERY_SERIOUS'])}">VERY_SERIOUS</a>
                            </li>
                        </ul>
                    </g:if>
                </div>

                <div class="col">
                    <g:if test="${map.topic?.createdBy?.id == session?.user?.id || session?.user?.admin == true}">
                        <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            ${map.topic.visibility}
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item"
                                   href="${createLink(controller: 'modifyTopic', action: 'updateVisibility', params: [id: map.topic.id, visibility: 'PRIVATE'])}">
                                    Private
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="${createLink(controller: 'modifyTopic', action: 'updateVisibility', params: [id: map.topic.id, visibility: 'PUBLIC'])}">
                                    Public
                                </a>
                            </li>
                        </ul>
                    </g:if>
                </div>

                <div class="col-1">
                    <g:if test="${map.topic.createdBy.id == session.user.id || session?.user?.admin == true}">
                        <g:link controller="modifyTopic" action="updateIsDelete"
                                id="${map.topic.id}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto"
                                 fill="currentColor"
                                 class="bi bi-trash3" viewBox="0 0 16 16">
                                <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                            </svg>
                        </g:link>
                    </g:if>
                </div>

                <div class="col-1">
                    <g:if test="${map.topic.createdBy.id == session.user.id || session?.user?.admin == true}">
                        <a href="#"
                           onclick="openEditModal(${map.topic.id}, '${map.topic.name?.replaceAll("'", "\\\\'")}')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25"
                                 height="auto" fill="currentColor"
                                 class="bi bi-pencil-square"
                                 viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd"
                                      d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>
                        </a>
                    </g:if>
                </div>

                <div class="col-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto" fill="currentColor"
                         class="bi bi-envelope-fill" viewBox="0 0 16 16">
                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>
    <hr>
</g:each>