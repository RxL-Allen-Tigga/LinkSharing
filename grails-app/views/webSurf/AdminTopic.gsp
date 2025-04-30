<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Search</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome (optional) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css"/>

    <style>
    body {
        background-image: url('https://i0.wp.com/www.omgubuntu.co.uk/wp-content/uploads/2022/03/jammy-jellyfish-hero.jpg?fit=1473%2C832&ssl=1'); /* Replace with the URL of your image */
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    body {
        padding: 0;
        margin: 0;
    }

    .main-content {
        padding: 20px 50px 50px; /* extra top padding to clear sticky navbar */
    }

    .tables-container {
        display: flex;
        gap: 30px;
        flex-wrap: wrap;
    }

    table.dataTable {
        width: 100% !important;
    }

    th, td {
        text-align: left;
        padding: 8px;
        min-width: 120px;
    }

    .table-wrapper {
        flex: 1;
        min-width: 300px;
    }

    .search-container {
        margin-bottom: 10px;
    }
    </style>
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
<div class="container-fluid sticky-top bg-light shadow break-word">
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
                             class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                        </svg>
                    </g:link>
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
</div>

<div class="main-content">
    <div class="search-container">
        <h2>
            <label for="globalSearch" class="form-label"><strong>Search:</strong></label>
        </h2>
        <input type="text" id="globalSearch" class="form-control" placeholder="Type to search...">
    </div>
    <br>

    <div class="tables-container">
        <div class="table-wrapper text-center border rounded border-dark p-2 mb-2 text-bg-light">
            <h3>Users</h3>
            <table id="table1" class="display">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Topic Name</th>
                    <th>Created By</th>
                    <th>Visibility</th>
                    <th>Date Created</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${topics}" var="topic">
                    <tr>
                        <td>
                            ${topic.id}
                        </td>
                        <td>
                            <g:link controller="webSurf" action="Topic" params="[id: topic.id]">
                                ${topic.name}
                            </g:link>
                        </td>
                        <td>
                            <g:link controller="webSurf" action="Profile" params="[id: topic.createdBy?.id]">
                                @${topic.createdBy?.username}
                            </g:link>
                        </td>
                        <td>${topic.visibility}</td>
                        <td><g:formatDate date="${topic.dateCreated}" format="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
<script>
    $(document).ready(function () {
        const commonOptions = {
            dom: 'lrtip', // removes the default search box (removes the 'f')
            search: {
                caseInsensitive: true
            }
        };

        const table1 = $('#table1').DataTable(commonOptions);

        function debounce(func, delay) {
            let timer;
            return function (...args) {
                clearTimeout(timer);
                timer = setTimeout(() => func.apply(this, args), delay);
            };
        }

        const globalSearch = debounce(function () {
            const value = $('#globalSearch').val();
            table1.search(value).draw();
        }, 300);

        $('#globalSearch').on('keyup', globalSearch);
    });

</script>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>