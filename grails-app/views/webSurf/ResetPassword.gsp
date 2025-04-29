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
                    <g:if test="${session.user?.admin}">
                        (ADMIN)
                    </g:if>
                    </h2>
                </g:link>
            </div>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                  rel="stylesheet">
        </div>

        <div class="col">
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

<div class="container">
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

    <div class="row align-items-start mt-5">
        <div class="col-3">
        </div>

        <div class="col">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Reset Password</h3>
                </div>
                <br>

                <form action="/LS_UserRegister/resetPassword" method="POST">
                    <input type="hidden" name="token" value="${token}" />  <!-- Pass the token as a hidden field -->
                    <div class="form-group">
                        <label for="newPassword">New Password<span style="color: red;">*</span></label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password<span style="color: red;">*</span></label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required maxlength="250">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">Reset Password</button>
                </form>
            </div>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>