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
<Header:navbar username="Alok"/>

<div class="container">
    <div class="row align-items-start mt-5">
        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Recent Shares</h3>
                </div>
                <br>

                <div class="row">
                    <div class="col-2">
                        <img src="../src/img.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>Uday Pratp Singh</h5>
                            </div>

                            <div class="col-2">
                                <a class="link-opacity-60-hover" href="https://www.google.com/"><h5>Grails</h5></a>
                            </div>
                        </div>

                        <div class="row">
                            <p>To dread o'er bear the pative shocks their currenter regards of
                            ressor's deat with.</p>
                        </div>

                        <div class="row">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View post</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>
                    </div>
                </div>
                <hr>

                <div class="row">
                    <div class="col-2">
                        <img src="../src/img.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>Uday Pratp Singh</h5>
                            </div>

                            <div class="col-2">
                                <a class="link-opacity-60-hover" href="https://www.google.com/"><h5>Grails</h5></a>
                            </div>
                        </div>

                        <div class="row">
                            <p>To dread o'er bear the pative shocks their currenter regards of
                            ressor's deat with.</p>
                        </div>

                        <div class="row">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View post</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Top Trending Posts</h3>
                    </div>

                    <div class="col-1">
                        <h6 style="color: blue;">sort:</h6>
                    </div>

                    <div class="col-3">
                        <input type="date" id="datePicker" name="date">
                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="col-2">
                        <img src="../src/img.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>Uday Pratp Singh</h5>
                            </div>

                            <div class="col-2">
                                <a class="link-opacity-60-hover" href="https://www.google.com/"><h5>Grails</h5></a>
                            </div>
                        </div>

                        <div class="row">
                            <p>To dread o'er bear the pative shocks their currenter regards of
                            ressor's deat with.</p>
                        </div>

                        <div class="row">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View post</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Login</h3>
                </div>
                <br>

                <form>
                    <div class="form-group ">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp1"
                               placeholder="Enter email">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Password*</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    <br>

                    <div class="row ">
                        <div class="col">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>

                        <div class="col-3">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">Forgot Password ?</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>
                    </div>
                </form>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Register*</h3>
                </div>
                <br>

                <form id="registerForm" method="POST" enctype="multipart/form-data" action="/LS_UserRegister/register">
                    <div class="form-group ">
                        <label for="exampleFirstName">First Name</label>
                        <input type="text" name="firstName" class="form-control" id="exampleFirstName" placeholder="First Name">
                    </div>

                    <div class="form-group">
                        <label for="exampleLastName">Last Name</label>
                        <input type="text" name="lastName" class="form-control" id="exampleLastName" placeholder="Last Name">
                    </div>

                    <div class="form-group ">
                        <label for="exampleInputEmail2">Email address</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
                        <small id="emailHelp2" class="form-text text-muted">We'll never share your email with anyone
                        else.</small>
                    </div>

                    <div class="form-group">
                        <label for="exampleUsername">Username</label>
                        <input type="text" name="username" class="form-control" id="exampleUsername" placeholder="Username">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword2">Password*</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword2">Confirm Password*</label>
                        <input type="password" name="confirmPassword" class="form-control" id="exampleInputPassword3" placeholder="Confirm Password">
                    </div>

                    <div class="mb-3">
                        <label for="formFile" class="form-label">Photo</label>
                        <input class="form-control" type="file" name="photo" id="formFile">
                    </div>

                    <br>

                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>


</html>