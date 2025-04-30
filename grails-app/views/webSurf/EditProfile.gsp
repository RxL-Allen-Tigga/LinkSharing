<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<style>
body {
    background-image: url('https://i0.wp.com/www.omgubuntu.co.uk/wp-content/uploads/2022/03/jammy-jellyfish-hero.jpg?fit=1473%2C832&ssl=1'); /* Replace with the URL of your image */
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}
.break-word {
    word-wrap: break-word;    /* Legacy */
    overflow-wrap: break-word; /* Modern */
    word-break: break-all;    /* Aggressive, breaks inside words */
}
.hover-pop {
    /*box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); !* solid base shadow *!*/
    /*border: 1px solid #ccc; !* neutral light border *!*/
    /*border-radius: 0.5rem;  !* optional rounding *!*/
    transition: all 0.3s ease;
    transform: none;
}

.hover-pop:hover {
    /*box-shadow: 0 12px 24px rgba(0, 0, 0, 0.20); !* deeper shadow *!*/
    transform: translateY(-6px); /* pop effect */
    /*border-color: #0056b3; !* darker version of primary *!*/
}
.sortable {
    cursor: pointer;
}

.svg-link svg {
    fill: currentColor; /* The color will follow the anchor's text color */
    transition: fill 0.3s ease; /* Smooth transition */
}

/* Change color to dark blue on hover */
.svg-link:hover svg {
    fill: #003366; /* Dark blue color */
}

/* Optional: Add color change for the link itself when hovered */
.svg-link:hover {
    color: #003366; /* Change the text color of the link (optional) */
}
</style>

<body>
<div class="container-fluid sticky-top bg-light shadow">
    <div class="row align-items-center text-bg-light p-2 border-dark mb-2">
        <div class="col-4">
            <div class="row">
                <g:link class="link-opacity-60-hover" controller="webSurf" action="dashboard">
                    <h2>Link Sharing
                    <g:if test="${session.user.admin}">
                        (ADMIN)
                    </g:if>
                    </h2>
                </g:link>
            </div>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                  rel="stylesheet">
        </div>

        <div class="col">
            <div class="row">
                <div class="col">
                </div>
                <div class="col-1">
                    <g:link controller="webSurf" action="Search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto" fill="currentColor"
                             class="bi bi-search hover-pop" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                        </svg>
                    </g:link>
                </div>

                <div class="col-2 dropdown">
                    <!-- User dropdown -->
                    <a class="btn btn-primary dropdown-toggle hover-pop" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="auto" fill="currentColor"
                             class="bi bi-person-fill " viewBox="0 0 16 16">
                            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                        </svg>
                        ${session.user.username.take(15) ?: 'user_name'}
                    </a>
                    <ul class="dropdown-menu">
                        <g:if test="${session.user.admin}">
                            <li>
                                <a class="dropdown-item" href="/webSurf/AdminTopic">Topics</a>
                            </li>
                        </g:if>
                        <g:if test="${session.user.admin}">
                            <li>
                                <a class="dropdown-item" href="/webSurf/AdminPost">Posts</a>
                            </li>
                        </g:if>
                        <g:if test="${session.user.admin}">
                            <li>
                                <a class="dropdown-item" href="/webSurf/Admin">Users</a>
                            </li>
                        </g:if>
                        <li>
                            <a class="dropdown-item" href="/webSurf/EditProfile">Edit Profile</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/LS_UserRegister/logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</div>

<form action="${createLink(controller: 'topicOperations', action: 'editTopic')}" method="POST">
    <div class="modal fade" id="Edit_Topic" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Edit Topic</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="edit-topic-id" name="id">

                    <div class="modal-form-group">
                        <label for="edit-topic-name">Topic Name<span style="color: red;">*</span></label>
                        <input type="text" class="form-control" id="edit-topic-name" name="name" placeholder="Name"
                               required maxlength="250">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Apply Changes</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    function openEditModal(topicId, topicName) {
        document.getElementById('edit-topic-id').value = topicId;
        document.getElementById('edit-topic-name').value = topicName;
        let editModal = new bootstrap.Modal(document.getElementById('Edit_Topic'));
        editModal.show();
    }
</script>

<div class="modal fade" id="Show_All_Subscriptions" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h1 class="modal-title fs-5">My Subscriptions</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <div class="modal-form-group">
                    <ul class="row list-group">
                        <g:each in="${userSubscribedTopics}" var="topic">
                            <li class="list-group-item">
                                ${topic.name} (${topic.visibility}) : @${topic.createdBy.username}
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="Show_User_Created_Topics" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h1 class="modal-title fs-5">My Created Topics</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <div class="modal-form-group">
                    <ul class="row list-group">
                        <g:each in="${userCreatedTopics}" var="topic">
                            <li class="list-group-item">
                                ${topic.name} (${topic.visibility})
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="container break-word">
    <div>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">
                ${flash.message}
            </div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger" role="alert">
                ${flash.error}
            </div>
        </g:if>
    </div>

    <div class="row align-items-start mt-5">
        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Your Profile</h3>
                </div>

                <div class="row">
                    <div class="col-3">
                        <img src="data:image/jpeg;base64,${session.user?.photo ? session.user?.photo.encodeBase64() : ''}"
                             alt="User Photo" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>${session.user?.firstName} ${session.user?.lastName}
                                </h5>
                            </div>
                        </div>

                        <div class="row">
                            <g:link controller="webSurf" action="Profile" params="[id: session.user?.id]">
                                <h6>@${session.user?.username}</h6>
                            </g:link>
                        </div>

                        <div class="row">
                            <div class="col">
                                <a href="#" data-bs-toggle="modal" data-bs-target="#Show_All_Subscriptions">
                                    <h6>Subscriptions</h6>
                                </a>
                            </div>

                            <div class="col">
                                <a href="#" data-bs-toggle="modal" data-bs-target="#Show_User_Created_Topics">
                                    <h6>Topics</h6>
                                </a>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6 style="color: blue;">${userSubscribedTopicsCount}</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">${userCreatedTopicsCount}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Your Created Topics</h3>
                    </div>

                    <div class="col">
                    </div>
                </div>
                <hr>
                <g:each in="${subscriptions}" var="subscription">
                    <g:if test="${subscription.topic.createdBy.id == session.user.id}">
                        <div class="row">
                            <div class="col-2">
                                <img src="data:image/jpeg;base64,${subscription.topic.createdBy?.photo?.encodeBase64()?.toString()}"
                                     alt="Profile Image" width="100%" height="auto">
                            </div>

                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <g:link controller="webSurf" action="Topic"
                                                params="[id: subscription.topic?.id]">
                                            <h5>${subscription.topic.name.take(15)}</h5>
                                        </g:link>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <g:link controller="webSurf" action="Profile"
                                                params="[id: subscription.topic?.createdBy?.id]">
                                            <h6>@${subscription.topic.createdBy.username.take(15)}</h6>
                                        </g:link>
                                    </div>

                                    <div class="col">
                                        <h6>${subscription.topic.subscription?.size()} Subscribers</h6>
                                    </div>

                                    <div class="col">
                                        <h6>${subscription.topic.resource?.size()} Posts</h6>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <a class="btn btn-primary dropdown-toggle hover-pop" href="#" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false">
                                            ${subscription.seriousness}
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness', params: [id: subscription.id, seriousness: 'SERIOUS'])}">SERIOUS</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness', params: [id: subscription.id, seriousness: 'CASUAL'])}">CASUAL</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                   href="${createLink(controller: 'modifySubscription', action: 'updateSeriousness', params: [id: subscription.id, seriousness: 'VERY_SERIOUS'])}">VERY_SERIOUS</a>
                                            </li>
                                        </ul>
                                    </div>
                                    %{--                                VISIBILITY--}%
                                    <div class="col">
                                        <g:if test="${subscription?.topic?.createdBy?.id == session?.user?.id || session?.user?.admin == true}">
                                            <a class="btn btn-primary dropdown-toggle hover-pop" href="#" role="button"
                                               data-bs-toggle="dropdown" aria-expanded="false">
                                                ${subscription.topic.visibility}
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a class="dropdown-item"
                                                       href="${createLink(controller: 'modifyTopic', action: 'updateVisibility', params: [id: subscription.topic.id, visibility: 'PRIVATE'])}">
                                                        Private
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item"
                                                       href="${createLink(controller: 'modifyTopic', action: 'updateVisibility', params: [id: subscription.topic.id, visibility: 'PUBLIC'])}">
                                                        Public
                                                    </a>
                                                </li>
                                            </ul>
                                        </g:if>
                                    </div>

                                    %{--                                Delete--}%
                                    <div class="col-1">
                                        <g:if test="${subscription.topic.createdBy.id == session.user.id || session?.user?.admin == true}">
                                            <g:link controller="modifyTopic" action="updateIsDelete"
                                                    id="${subscription.topic.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto"
                                                     fill="currentColor"
                                                     class="bi bi-trash3 hover-pop" viewBox="0 0 16 16">
                                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                                </svg>
                                            </g:link>
                                        </g:if>
                                    </div>
                                    %{--                                Edit--}%
                                    <div class="col-1">
                                        <g:if test="${subscription.topic.createdBy.id == session.user.id || session?.user?.admin == true}">
                                            <a href="#"
                                               onclick="openEditModal(${subscription.topic.id}, '${subscription.topic.name?.replaceAll("'", "\\\\'")}')">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25"
                                                     height="auto" fill="currentColor"
                                                     class="bi bi-pencil-square hover-pop"
                                                     viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                </svg>
                                            </a>
                                        </g:if>
                                    </div>
                                    %{--                                Invite--}%
                                    <div class="col-2">
                                    <a href="#" data-bs-toggle="modal"
                                       data-bs-target="#Send_Invitation">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto"
                                             fill="currentColor"
                                             class="bi bi-envelope-fill hover-pop" viewBox="0 0 16 16">
                                            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
                                        </svg>
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </g:if>
                </g:each>
            </div>
        </div>

        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Edit Profile</h3>
                </div>
                <br>

                <form action="/LS_UserRegister/updateProfile" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" name="firstName" id="firstName" class="form-control"
                               value="${userInstance?.firstName}"
                               placeholder=${session.user.firstName} onfocus="enablePlaceholderEdit(this)" maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" name="lastName" id="lastName" class="form-control"
                               value="${userInstance?.lastName}"
                               placeholder=${session.user.lastName} oninput="updatePlaceholder(this)" maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" id="username" class="form-control"
                               value="${userInstance?.username}"
                               placeholder=${session.user.username} oninput="updatePlaceholder(this)" maxlength="250">
                    </div>

                    <div class="mb-3">
                        <label for="photo">Photo</label>
                        <input type="file" name="photo" id="photo" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-primary hover-pop">Update</button>
                </form>
            </div>
            <script>
                function enablePlaceholderEdit(inputElement) {
                    inputElement.addEventListener('input', function () {
                        inputElement.setAttribute('placeholder', inputElement.value || "${session.user.lastName}");
                    });
                }
            </script>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Change Password</h3>
                </div>
                <br>

                <form action="/LS_UserRegister/changePassword" method="POST">
                    <div class="form-group">
                        <label for="newPassword">New Password<span style="color: red;">*</span></label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword"
                               placeholder="New Password" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password<span style="color: red;">*</span></label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                               placeholder="Confirm Password" required maxlength="250">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary hover-pop">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>