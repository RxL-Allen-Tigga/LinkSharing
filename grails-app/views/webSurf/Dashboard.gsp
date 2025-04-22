<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
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
%{--<Header:navbar username="${session.user?.username}"/>--}%
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
                    <div class="input-group">
                        <button type="button" class="btn btn-outline-primary" data-mdb-ripple-init>
                            <h5>Search</h5>
                        </button>
                        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                               aria-describedby="search-addon"/>
                    </div>
                </div>


                <div class="col-1">
                    <a href="#" class="svg-link" data-bs-toggle="modal" data-bs-target="#Create_Topic">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto" fill="currentColor"
                             class="bi bi-journal-plus" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5"/>
                            <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"/>
                            <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/>
                        </svg>
                    </a>
                </div>

                <div class="col-1">
                    <a href="#" class="svg-link" data-bs-toggle="modal" data-bs-target="#Send_Invitation">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto" fill="currentColor"
                             class="bi bi-envelope-plus-fill" viewBox="0 0 16 16">
                            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.026A2 2 0 0 0 2 14h6.256A4.5 4.5 0 0 1 8 12.5a4.49 4.49 0 0 1 1.606-3.446l-.367-.225L8 9.586zM16 4.697v4.974A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-1.965.45l-.338-.207z"/>
                            <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 0 0 1 0v-1h1a.5.5 0 0 0 0-1h-1v-1a.5.5 0 0 0-.5-.5"/>
                        </svg>
                    </a>
                </div>

                <div class="col-1">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Share_Link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="auto" fill="currentColor"
                             class="bi bi-link-45deg" viewBox="0 0 16 16">
                            <path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1 1 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4 4 0 0 1-.128-1.287z"/>
                            <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243z"/>
                        </svg>
                    </a>
                </div>

                <div class="col-1">
                    <a href="#" class="svg-link" data-bs-toggle="modal" data-bs-target="#Share_Document">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="auto" fill="currentColor"
                             class="bi bi-file-earmark-plus-fill" viewBox="0 0 16 16">
                            <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M8.5 7v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 1 0"/>
                        </svg>
                    </a>
                </div>

                <div class="col-2 dropdown">
                    <!-- User dropdown -->
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="auto" fill="currentColor"
                             class="bi bi-person-fill" viewBox="0 0 16 16">
                            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                        </svg>
                        ${session.user.username ?: 'user_name'}
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
                        <label for="edit-topic-name">Topic Name*</label>
                        <input type="text" class="form-control" id="edit-topic-name" name="name" placeholder="Name"
                               required>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Apply Changes</button>
                </div>
            </div>
        </div>
    </div>
</form>

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

%{--<g:render template="/templates/shareLinkModal" model="[subscribedTopics: subscribedTopics]" />--}%
<g:render template="/shared/navbarModals" model="[subscribedTopics: subscribedTopics]"/>


<div class="container">
    <div>
        <g:if test="${flash.message}">
            <div class="alert alert-warning" role="alert">
                ${flash.message}
            </div>
        </g:if>
    </div>

    <div class="row align-items-start mt-5">
        <div class="col ">
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
                            <h5>${session.user?.firstName} ${session.user?.lastName}</h5>
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

            %{--            <div class="border rounded border-dark p-2 mb-2 text-bg-light">--}%
            %{--                <div class="row">--}%
            %{--                    <div class="col">--}%
            %{--                        <h3>Your Subscriptions</h3>--}%
            %{--                    </div>--}%

            %{--                    <div class="col-2">--}%
            %{--                        <h5>--}%
            %{--                            <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                View All</a>--}%
            %{--                        </h5>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--                <hr>--}%
            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <h5>--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    Grails</a>--}%
            %{--                            </h5>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h6>@user_name</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Subscriptions</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Posts</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">619</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">777</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
            %{--                                   data-bs-toggle="dropdown"--}%
            %{--                                   aria-expanded="false">--}%
            %{--                                    Serious--}%
            %{--                                </a>--}%
            %{--                                <ul class="dropdown-menu">--}%
            %{--                                    <li><a class="dropdown-item" href="#">Serious</a></li>--}%
            %{--                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>--}%
            %{--                                </ul>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
            %{--                                   data-bs-toggle="dropdown"--}%
            %{--                                   aria-expanded="false">--}%
            %{--                                    Private--}%
            %{--                                </a>--}%
            %{--                                <ul class="dropdown-menu">--}%
            %{--                                    <li><a class="dropdown-item" href="#">Private</a></li>--}%
            %{--                                    <li><a class="dropdown-item" href="#">Public</a></li>--}%
            %{--                                </ul>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                            </div>--}%

            %{--                            <div class="col-2">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%

            %{--                            <div class="col-2">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-pencil-square" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>--}%
            %{--                                    <path fill-rule="evenodd"--}%
            %{--                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%

            %{--                            <div class="col-3">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-trash3" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%

            %{--                </div>--}%
            %{--                <hr>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h5>--}%
            %{--                                    <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                        Grails</a>--}%
            %{--                                </h5>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h5>--}%
            %{--                                    (Private)--}%
            %{--                                </h5>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h6>@user_name</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Subscriptions</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Posts</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h5>--}%
            %{--                                    <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                        Subscribe</a>--}%
            %{--                                </h5>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">619</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">777</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
            %{--                                   data-bs-toggle="dropdown"--}%
            %{--                                   aria-expanded="false">--}%
            %{--                                    Serious--}%
            %{--                                </a>--}%
            %{--                                <ul class="dropdown-menu">--}%
            %{--                                    <li><a class="dropdown-item" href="#">Serious</a></li>--}%
            %{--                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>--}%
            %{--                                </ul>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--            </div>--}%

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Your Subscriptions</h3>
                    </div>

                    <div class="col-2">
                        <a href="#" data-bs-toggle="modal" data-bs-target="#Show_All_Subscriptions">
                            <h5>View All
                            </h5>
                        </a>
                    </div>
                </div>
                <hr>
                <g:each in="${subscriptions}" var="subscription">
                    <div class="row">
                        <div class="col-2">
                            <img src="data:image/jpeg;base64,${subscription.topic.createdBy?.photo?.encodeBase64()?.toString()}"
                                 alt="Profile Image" width="100%" height="auto">
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <g:link controller="webSurf" action="Topic" params="[id: subscription.topic?.id]">
                                        <h5>${subscription.topic.name}</h5>
                                    </g:link>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <g:link controller="webSurf" action="Profile"
                                            params="[id: subscription.topic?.createdBy?.id]">
                                        <h6>@${subscription.topic.createdBy.username}</h6>
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
                                    <a class="btn btn-primary dropdown-toggle" href="#" role="button"
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
                                        <a class="btn btn-primary dropdown-toggle" href="#" role="button"
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
                                                 class="bi bi-trash3" viewBox="0 0 16 16">
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
                                                 class="bi bi-pencil-square"
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

            <!-- Pagination Controls -->
                <div class="pagination row">
                    <div class="col-10">
                        <g:if test="${currentPage > 1}">
                            <a href="?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                        </g:if>
                    </div>

                    <div class="col">
                        <g:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}" class="btn btn-primary">Next</a>
                        </g:if>
                    </div>
                </div>
            </div>
            <script>
                function openEditModal(topicId, topicName) {
                    document.getElementById('edit-topic-id').value = topicId;
                    document.getElementById('edit-topic-name').value = topicName;
                    let editModal = new bootstrap.Modal(document.getElementById('Edit_Topic'));
                    editModal.show();
                }
            </script>

            <br>

            %{--            topic            : topic,--}%
            %{--            subscriptionCount: subscriptionCount,--}%
            %{--            resourceCount    : resourceCount,--}%
            %{--            isSubscribed     : isSubscribed,--}%
            %{--            subscription     : subscription--}%
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Top Trending Topics</h3>
                </div>
                <hr>

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
            </div>

            <br>

            %{--            <div class="border rounded border-dark p-2 mb-2 text-bg-light">--}%
            %{--                <div class="row">--}%
            %{--                    <h3>Top Trending Topics</h3>--}%
            %{--                </div>--}%
            %{--                <br>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%"--}%
            %{--                             height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h5>--}%
            %{--                                    <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                        Grails</a>--}%
            %{--                                </h5>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h6>@user_name</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Subscriptions</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Posts</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h5>--}%
            %{--                                    <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                        Subscribe</a>--}%
            %{--                                </h5>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">619</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">777</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--                <hr>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%"--}%
            %{--                             height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <input type="email" class="form-control" id="text"--}%
            %{--                                       aria-describedby="emailHelp" placeholder="Grails">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <button type="submit" class="btn btn-primary">save</button>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                        <br>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <h6>@user_name</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Subscriptions</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6>Posts</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">619</h6>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <h6 style="color: blue;">777</h6>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--                <br>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
            %{--                                   data-bs-toggle="dropdown"--}%
            %{--                                   aria-expanded="false">--}%
            %{--                                    Serious--}%
            %{--                                </a>--}%
            %{--                                <ul class="dropdown-menu">--}%
            %{--                                    <li><a class="dropdown-item" href="#">Serious</a></li>--}%
            %{--                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>--}%
            %{--                                </ul>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
            %{--                                   data-bs-toggle="dropdown"--}%
            %{--                                   aria-expanded="false">--}%
            %{--                                    Private--}%
            %{--                                </a>--}%
            %{--                                <ul class="dropdown-menu">--}%
            %{--                                    <li><a class="dropdown-item" href="#">Private</a></li>--}%
            %{--                                    <li><a class="dropdown-item" href="#">Public</a></li>--}%
            %{--                                </ul>--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                            </div>--}%

            %{--                            <div class="col-2">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%

            %{--                            <div class="col-2">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-pencil-square" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>--}%
            %{--                                    <path fill-rule="evenodd"--}%
            %{--                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%

            %{--                            <div class="col-3">--}%
            %{--                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"--}%
            %{--                                     class="bi bi-trash3" viewBox="0 0 16 16">--}%
            %{--                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>--}%
            %{--                                </svg>--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--            </div>--}%
        </div>

        %{--        <div class="col border rounded border-dark p-2 mb-2 text-bg-light">--}%
        %{--            <div class="row">--}%
        %{--                <div class="col">--}%
        %{--                    <h3>Your Inbox</h3>--}%
        %{--                </div>--}%

        %{--                <div class="col">--}%
        %{--                    <div class="input-group">--}%
        %{--                        <button type="button" class="btn btn-outline-primary"><h5>Search</h5></button>--}%
        %{--                        <input type="search" class="form-control rounded" placeholder="Search" />--}%
        %{--                    </div>--}%
        %{--                </div>--}%
        %{--            </div>--}%
        %{--            <br/>--}%
        %{--        </div>--}%

        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Your Inbox</h3>
                    </div>
                </div>
                <hr>
                <g:each in="${totalUnread}" var="totalunread">
                    <div class="row">
                        <div class="col-2">
                            <img src="data:image/jpeg;base64,${totalunread?.resource?.createdBy?.photo ? totalunread?.resource?.createdBy?.photo.encodeBase64() : ''}"
                                 alt="User Photo" width="100%" height="auto">
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <g:link controller="webSurf" action="Topic"
                                            params="[id: totalunread.resource?.topic?.id]">
                                        <h5>
                                            ${totalunread.resource.topic.name}
                                        </h5>
                                    </g:link>
                                </div>

                                <div class="col">
                                    <g:link controller="webSurf" action="Profile"
                                            params="[id: totalunread.resource?.createdBy?.id]">
                                        <h6>@${totalunread.resource.createdBy.username}</h6>
                                    </g:link>
                                </div>
                            </div>


                            <div class="row">
                                <p>${totalunread.resource.description}</p>
                            </div>

                            <div class="row">

                                <div class="col">
                                    %{--                                    <g:if test="${totalunread.resource instanceof LinkResource && totalunread.resource.url != null}">--}%
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        Download</a>
                                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                          rel="stylesheet">
                                    %{--                                    </g:if>--}%
                                </div>

                                <div class="col">
                                    %{--                    <g:if test="${totalunread.resource.url !== null}">--}%
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        View full site</a>
                                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                          rel="stylesheet">
                                    %{--                        <g:if test="${totalunread.resource.filepath !== null}">--}%
                                </div>

                                <div class="col">
                                    <g:link controller="modifyReadingItem" action="updateIsDelete"
                                            id="${totalunread.id}">
                                    %{--                                        <a class="link-opacity-60-hover">--}%
                                        Mark as read
                                    %{--                                        </a>--}%
                                    </g:link>
                                </div>

                                <div class="col">
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        View post</a>
                                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                          rel="stylesheet">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </g:each>
                <div class="pagination row mt-3">
                    <div class="col-10">
                        <g:if test="${UnreadItemPage > 1}">
                            <a href="?page=${UnreadItemPage - 1}" class="btn btn-primary">Previous</a>
                        </g:if>
                    </div>

                    <div class="col">
                        <g:if test="${UnreadItemPage < totalUnreadItemPage}">
                            <a href="?page=${UnreadItemPage + 1}" class="btn btn-primary">Next</a>
                        </g:if>
                    </div>
                </div>
            </div>
            <!-- Pagination Controls for Inbox -->


            %{--            <div class="border rounded border-dark p-2 mb-2 text-bg-light">--}%
            %{--                <div class="row ">--}%
            %{--                    <div class="col">--}%
            %{--                        <h3>Your Inbox</h3>--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="input-group">--}%
            %{--                            <button type="button" class="btn btn-outline-primary" data-mdb-ripple-init><h5>Search</h5>--}%
            %{--                            </button>--}%
            %{--                            <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"--}%
            %{--                                   aria-describedby="search-addon"/>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--                <br>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%"--}%
            %{--                             height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <p>To dread o'er bear the pative shocks their currenter regards of--}%
            %{--                            ressor's deat with.</p>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    Download</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    View full site</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    Mark as read</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    View post</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--                <hr>--}%

            %{--                <div class="row">--}%
            %{--                    <div class="col-2">--}%
            %{--                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%"--}%
            %{--                             height="auto">--}%
            %{--                    </div>--}%

            %{--                    <div class="col">--}%
            %{--                        <div class="row">--}%
            %{--                            <p>To dread o'er bear the pative shocks their currenter regards of--}%
            %{--                            ressor's deat with.</p>--}%
            %{--                        </div>--}%

            %{--                        <div class="row">--}%
            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    Download</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    View full site</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    Mark as read</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%

            %{--                            <div class="col">--}%
            %{--                                <a class="link-opacity-60-hover" href="https://www.google.com/">--}%
            %{--                                    View post</a>--}%
            %{--                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"--}%
            %{--                                      rel="stylesheet">--}%
            %{--                            </div>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            %{--            </div>--}%
        </div>
    </div>
</div>
<br>
</body>

</html>