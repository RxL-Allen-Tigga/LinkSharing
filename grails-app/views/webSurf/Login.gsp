<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
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
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* solid base shadow */
    border: 1px solid #ccc; /* neutral light border */
    border-radius: 0.5rem;  /* optional rounding */
    transition: all 0.3s ease;
}

.hover-pop:hover {
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.20); /* deeper shadow */
    transform: translateY(-6px); /* pop effect */
    border-color: #0056b3; /* darker version of primary */
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
<script>
    document.getElementById("formFile").addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const validTypes = ["image/jpeg", "image/png"];
            if (!validTypes.includes(file.type)) {
                alert("Only JPG and PNG files are allowed.");
                this.value = ""; // Clear the input
            }
        }
    });
</script>
%{--<Header:navbar username="${session.user?.username}"/>--}%
<div class="container-fluid sticky-top bg-light shadow">
    <div class="row align-items-center text-bg-light p-2 border-dark mb-2">
        <div class="col-4">
            <!-- Use Grails link for the Dashboard -->
            <!-- <g:link class="link-opacity-60-hover" controller="webSurf" action="dashboard">
                <h2>Link Sharing</h2>
            </g:link> -->
            <a class="link-opacity-60-hover " href="http://localhost:8080/webSurf/dashboard/"><h2>Link Sharing</h2></a>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                  rel="stylesheet">
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</div>
<form action="/passwordReset/forgotPassword" method="POST">
    <div class="modal fade" id="ForgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="forgotPasswordLabel">Forgot Password</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <!-- Email Input -->
                    <div class="mb-3">
                        <label for="forgotEmail" class="form-label">Enter your registered email address<span style="color: red;">*</span></label>
                        <input
                                type="email"
                                class="form-control"
                                id="forgotEmail"
                                name="email"
                                placeholder="you@example.com"
                                required maxlength="250">
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Send Password</button>
                </div>

            </div>
        </div>
    </div>
</form>

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
        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <h3>
                    Recent Shares
                </h3>
                <hr>
                <g:each in="${resourcex}" var="resource">
                    <div class="row">
                        <div class="col-2">
                            <img src="data:image/jpeg;base64,${resource.createdBy?.photo ? resource.createdBy?.photo.encodeBase64() : ''}"
                                 alt="User Photo" width="100%" height="auto">
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="row">
                                    <div class="col">
%{--                                        <h6>${resource.topic.name}</h6>--}%
                                        <h6>${resource.topic?.name?.take(15)}</h6>
                                    </div>

                                    <div class="col">
                                        <h6>@${resource.createdBy.username.take(15)}</h6>
                                    </div>
                                </div>

                                <div class="row break-word">
                                    <p>${resource.description?.take(180)}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <g:if test="${resource instanceof LinkSharing.DocumentResource}">
                                        <a href="${createLink(controller: 'modifyReadingItem', action: 'download', params: [filename: (resource as LinkSharing.DocumentResource).filePath.tokenize('/')[-1]])}">
                                            Download
                                        </a>
                                    </g:if>
                                </div>

                                <div class="col">
                                    <g:if test="${resource instanceof LinkSharing.LinkResource}">
                                        <a href="${(resource as LinkSharing.LinkResource).url}"
                                           target="_blank">
                                            View Full Site
                                        </a>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </g:each>

            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Top Trending Posts</h3>
                    </div>
                    <hr>
                    <g:each in="${topResourcesWithAvg}" var="item">
                        <div class="col-2">
                            <img src="data:image/jpeg;base64,${item.resource?.createdBy?.photo ? item.resource?.createdBy?.photo.encodeBase64() : ''}"
                                 alt="User Photo" width="100%" height="auto">
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="row">
                                    <div class="col">
                                        <h6>${item.resource.topic.name.take(15)}</h6>
                                    </div>

                                    <div class="col">
                                        <h6>@${item.resource.createdBy.username.take(15)}</h6>
                                    </div>
                                    <div class="col">
                                        Avg Rating: ${item.average ? String.format('%.2f', item.average) : 'No Ratings Yet'}
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row break-word">
                                <p>${item.resource?.description?.take(180)}</p>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <g:if test="${item.resource instanceof LinkSharing.DocumentResource}">
                                        <a href="${createLink(controller: 'modifyReadingItem', action: 'download', params: [filename: (item.resource as LinkSharing.DocumentResource).filePath.tokenize('/')[-1]])}">
                                            Download
                                        </a>
                                    </g:if>
                                </div>

                                <div class="col">
                                    <g:if test="${item.resource instanceof LinkSharing.LinkResource}">
                                        <a href="${(item.resource as LinkSharing.LinkResource).url}"
                                           target="_blank">
                                            View Full Site
                                        </a>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                        <br>
                        <hr>
                    </g:each>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row ">
                    <h3>Login</h3>
                </div>
                <br>

                <form id="loginForm" method="POST" enctype="multipart/form-data" action="/LS_UserRegister/login">
                    <div class="form-group ">
                        <label for="exampleInputEmail1">
                            Email address<span style="color: red;">*</span>
                        </label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp1"
                               placeholder="Enter email" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">
                            Password<span style="color: red;">*</span>
                        </label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                               placeholder="Password" required maxlength="250">
                    </div>
                    <br>

                    <div class="row ">
                        <div class="col">
                            <button type="submit" class="btn btn-primary  hover-pop">Login</button>
                        </div>

                        <div class="col-3">
                            <button type="button" class="btn btn-link p-0 " data-bs-toggle="modal" data-bs-target="#ForgotPasswordModal">
                                Forgot Password?
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row centered">
                    <h3>Register</h3>
                </div>

                <form id="registerForm" method="POST" enctype="multipart/form-data" action="/LS_UserRegister/register">
                    %{--                <form id="registerForm" method="POST" enctype="multipart/form-data" action="/TempService/register">--}%
                    <div class="form-group ">
                        <label for="exampleFirstName">
                            First Name<span style="color: red;">*</span>
                        </label>
                        <input type="text" name="firstName" class="form-control" id="exampleFirstName"
                               placeholder="First Name" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="exampleLastName">Last Name</label>
                        <input type="text" name="lastName" class="form-control" id="exampleLastName"
                               placeholder="Last Name" maxlength="250">
                    </div>

                    <div class="form-group ">
                        <label for="exampleInputEmail2">
                            Email address<span style="color: red;">*</span>
                        </label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail2"
                               placeholder="Enter email" required maxlength="250">
                        <small id="emailHelp2" class="form-text text-muted">We'll never share your email with anyone
                        else.</small>
                    </div>

                    <div class="form-group">
                        <label for="exampleUsername">
                            Username<span style="color: red;">*</span>
                        </label>
                        <input type="text" name="username" class="form-control" id="exampleUsername"
                               placeholder="Username" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword2">
                            Password<span style="color: red;">*</span>
                        </label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword2"
                               placeholder="Password" required maxlength="250">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword2">
                            Confirm Password<span style="color: red;">*</span>
                        </label>
                        <input type="password" name="confirmPassword" class="form-control" id="exampleInputPassword3"
                               placeholder="Confirm Password" required maxlength="250">
                    </div>

                    <div class="mb-3">
                        <label for="formFile" class="form-label">
                            Photo<span style="color: red;">*</span>
                        </label>
                        <input class="form-control" type="file" name="photo" id="formFile" accept=".png, .jpg, .jpeg"
                               required>
                    </div>

                    <br>

                    <button type="submit" class="btn btn-primary  hover-pop">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>