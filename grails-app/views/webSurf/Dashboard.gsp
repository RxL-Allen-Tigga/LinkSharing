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
<Header:navbar username="${session.user?.username}"/>

<div class="container">
    <div class="row align-items-start mt-5">
        <div class="col ">
            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Your Profile</h3>
                </div>

                <div class="row">
                    <div class="col-3">
                        <img src="data:image/jpeg;base64,${session.user?.photo ? session.user?.photo.encodeBase64() : ''}" alt="User Photo" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>${session.user?.firstName} ${session.user?.lastName}</h5>
                            </div>
                        </div>

                        <div class="row">
                            <h6>@${session.user?.username}</h6>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6>Subscriptions</h6>
                            </div>

                            <div class="col">
                                <h6>Posts</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6 style="color: blue;">619</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">777</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <div class="col">
                        <h3>Your Subscriptions</h3>
                    </div>

                    <div class="col-2">
                        <h5>
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View All</a>
                        </h5>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-2">
                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <h5>
                                <a class="link-opacity-60-hover" href="https://www.google.com/">
                                    Grails</a>
                            </h5>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6>@user_name</h6>
                            </div>

                            <div class="col">
                                <h6>Subscriptions</h6>
                            </div>

                            <div class="col">
                                <h6>Posts</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">619</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">777</h6>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    Serious
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Serious</a></li>
                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>
                                </ul>
                            </div>

                            <div class="col">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    Private
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Private</a></li>
                                    <li><a class="dropdown-item" href="#">Public</a></li>
                                </ul>
                            </div>

                            <div class="col">
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                            </div>

                            <div class="col-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
                                </svg>
                            </div>

                            <div class="col-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd"
                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                </svg>
                            </div>

                            <div class="col-3">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-trash3" viewBox="0 0 16 16">
                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                </svg>
                            </div>
                        </div>
                    </div>

                </div>
                <hr>

                <div class="row">
                    <div class="col-2">
                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        Grails</a>
                                </h5>
                            </div>

                            <div class="col">
                                <h5>
                                    (Private)
                                </h5>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6>@user_name</h6>
                            </div>

                            <div class="col">
                                <h6>Subscriptions</h6>
                            </div>

                            <div class="col">
                                <h6>Posts</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h5>
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        Subscribe</a>
                                </h5>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">619</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">777</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                            </div>

                            <div class="col">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    Serious
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Serious</a></li>
                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>
                                </ul>
                            </div>

                            <div class="col">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="border rounded border-dark p-2 mb-2 text-bg-light">
                <div class="row">
                    <h3>Top Trending Topics</h3>
                </div>
                <br>

                <div class="row">
                    <div class="col-2">
                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h5>
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        Grails</a>
                                </h5>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6>@user_name</h6>
                            </div>

                            <div class="col">
                                <h6>Subscriptions</h6>
                            </div>

                            <div class="col">
                                <h6>Posts</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h5>
                                    <a class="link-opacity-60-hover" href="https://www.google.com/">
                                        Subscribe</a>
                                </h5>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">619</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">777</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>

                <div class="row">
                    <div class="col-2">
                        <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <input type="email" class="form-control" id="text"
                                       aria-describedby="emailHelp" placeholder="Grails">
                            </div>

                            <div class="col">
                                <button type="submit" class="btn btn-primary">save</button>
                            </div>
                        </div>
                        <br>

                        <div class="row">
                            <div class="col">
                                <h6>@user_name</h6>
                            </div>

                            <div class="col">
                                <h6>Subscriptions</h6>
                            </div>

                            <div class="col">
                                <h6>Posts</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">619</h6>
                            </div>

                            <div class="col">
                                <h6 style="color: blue;">777</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    Serious
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Serious</a></li>
                                    <li><a class="dropdown-item" href="#">UnSerious</a></li>
                                </ul>
                            </div>

                            <div class="col">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    Private
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Private</a></li>
                                    <li><a class="dropdown-item" href="#">Public</a></li>
                                </ul>
                            </div>

                            <div class="col">
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                            </div>

                            <div class="col-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
                                </svg>
                            </div>

                            <div class="col-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd"
                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                </svg>
                            </div>

                            <div class="col-3">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor"
                                     class="bi bi-trash3" viewBox="0 0 16 16">
                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col border rounded border-dark p-2 mb-2 text-bg-light">
            <div class="row ">
                <div class="col">
                    <h3>Your Inbox</h3>
                </div>

                <div class="col">
                    <div class="input-group">
                        <button type="button" class="btn btn-outline-primary" data-mdb-ripple-init><h5>Search</h5>
                        </button>
                        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                               aria-describedby="search-addon"/>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-2">
                    <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                </div>

                <div class="col">
                    <div class="row">
                        <p>To dread o'er bear the pative shocks their currenter regards of
                        ressor's deat with.</p>
                    </div>

                    <div class="row">
                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                Download</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>

                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View full site</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>

                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                Mark as read</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
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

            <div class="row">
                <div class="col-2">
                    <img src="../../assets/images/defaultImg.png" alt="Placeholder Image" width="100%" height="auto">
                </div>

                <div class="col">
                    <div class="row">
                        <p>To dread o'er bear the pative shocks their currenter regards of
                        ressor's deat with.</p>
                    </div>

                    <div class="row">
                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                Download</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>

                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                View full site</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
                        </div>

                        <div class="col">
                            <a class="link-opacity-60-hover" href="https://www.google.com/">
                                Mark as read</a>
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                  rel="stylesheet">
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
        </div>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>