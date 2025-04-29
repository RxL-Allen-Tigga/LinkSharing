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

<body>
<!-- ✅ STICKY NAVBAR -->
<div class="container-fluid sticky-top bg-light shadow">
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
    <div class="row align-items-center text-bg-light p-3 border-dark">
        <div class="col-4">
            <a href="/webSurf/dashboard" class="text-primary text-decoration-underline">
                <h2 class="m-0">
                    Link Sharing
                    <g:if test="${session.user?.admin}">
                        (ADMIN)
                    </g:if>
                </h2>
            </a>
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

                <div class="col-2 dropdown text-end">
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="fas fa-user"></i> ${session.user.username}
                    </a>
                    <ul class="dropdown-menu">
                        <g:if test="${session.user.admin}">
                            <li><a class="dropdown-item" href="/webSurf/AdminTopic">Topics</a></li>
                        </g:if>
                        <g:if test="${session.user.admin}">
                            <li><a class="dropdown-item" href="/webSurf/AdminPost">Posts</a></li>
                        </g:if>
                        <g:if test="${session.user.admin}">
                            <li><a class="dropdown-item" href="/webSurf/Admin">Users</a></li>
                        </g:if>
                        <li><a class="dropdown-item" href="/webSurf/EditProfile">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="/LS_UserRegister/logout">Logout</a></li>
                    </ul>
                </div>
                <!-- Bootstrap Bundle includes Popper.js (required for dropdowns) -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

            </div>
        </div>
    </div>
</div>

<!-- ✅ MAIN CONTENT: TABLES -->
<div class="main-content">
    <div class="search-container">
        <label for="globalSearch" class="form-label"><strong>Search All Tables:</strong></label>
        <input type="text" id="globalSearch" class="form-control" placeholder="Type to search...">
    </div>
    <br>

    <div class="tables-container">
        <div class="table-wrapper text-center border rounded border-dark p-2 mb-2 text-bg-light">
            <h3>Users</h3>
            <table id="table1" class="display">
                <thead>
                <tr>
                    <th>User Name</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${users}" var="user">
                    <tr>
                        <td><g:link controller="webSurf" action="Profile" params="[id: user.id]">@${user.username}
                        </g:link>
                        </td>
                        <td>${user.firstName}
                        </td>
                        <td>${user.lastName}
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="table-wrapper text-center border rounded border-dark p-2 mb-2 text-bg-light">
            <h3>Topics</h3>
            <table id="table2" class="display">
                <thead>
                <tr>
                    <th>Topic Name</th>
                    <th>Created By</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${publicTopics}" var="topic">
                    <tr>
                        <td><g:link controller="webSurf" action="Topic" params="[id: topic.id]">${topic.name}
                        </g:link></td>
                        <td><g:link controller="webSurf" action="Profile" params="[id: topic.createdBy.id]">@${topic.createdBy.username}
                        </g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="table-wrapper text-center border rounded border-dark p-2 mb-2 text-bg-light">
            <h3>Posts</h3>
            <table id="table3" class="display">
                <thead>
                <tr>
                    <th>Topic</th>
                    <th>Created By</th>
                    <th>Description</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${publicResources}" var="resource">
                    <tr>
                        <td><g:link controller="webSurf" action="Topic" params="[id: resource.topic.id]">${resource.topic.name}
                        </g:link></td>
                        <td><g:link controller="webSurf" action="Profile" params="[id: resource.createdBy.id]">@${resource.createdBy.username}
                        </g:link></td>
                        <td><g:link controller="webSurf" action="Post" params="[id: resource.id]">${resource.description}
                        </g:link></td>
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
        const table2 = $('#table2').DataTable(commonOptions);
        const table3 = $('#table3').DataTable(commonOptions);

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
            table2.search(value).draw();
            table3.search(value).draw();
        }, 300);

        $('#globalSearch').on('keyup', globalSearch);
    });

</script>

</body>
</html>
