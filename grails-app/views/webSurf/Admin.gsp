<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
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

    <div class="row align-items-start text-bg-light p-2 rounded-2 border border-dark p-2 mb-2">
        <div class="row">
            <div class="col-6">
                <h3>Users Details</h3>
            </div>
            <div class="col input-group">
                <button type="button" class="btn btn-outline-primary" data-mdb-ripple-init><h5>Search</h5>
                </button>
                <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                       aria-describedby="search-addon"/>
            </div>
        </div>
        <br>
        <table class="table table-striped mb-2">
            <thead>
            <tr>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'id', order: sortColumn == 'id' && sortDirection == 'asc' ? 'desc' : 'asc']">Id</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'username', order: sortColumn == 'username' && sortDirection == 'asc' ? 'desc' : 'asc']">Username</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'email', order: sortColumn == 'email' && sortDirection == 'asc' ? 'desc' : 'asc']">Email</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'firstName', order: sortColumn == 'firstName' && sortDirection == 'asc' ? 'desc' : 'asc']">Firstname</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'lastName', order: sortColumn == 'lastName' && sortDirection == 'asc' ? 'desc' : 'asc']">Lastname</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'active', order: sortColumn == 'active' && sortDirection == 'asc' ? 'desc' : 'asc']">Status</g:link>
                </th>
                <th scope="col" class="sortable">
                    <g:link action="Admin" params="[sort: 'admin', order: sortColumn == 'admin' && sortDirection == 'asc' ? 'desc' : 'asc']">Admin</g:link>
                </th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>@${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>
                        <g:if test="${!user.isDeleted}">
                            <g:link controller="LS_UserRegister" action="updateToInActive" params="[id: user.id]">
                                Active
                            </g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="LS_UserRegister" action="updateToActive" params="[id: user.id]">
                                Inactive
                            </g:link>
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${user.admin}">
                            <g:link controller="LS_UserRegister" action="degradeFromAdmin" params="[id: user.id]">
                                Admin
                            </g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="LS_UserRegister" action="updateToAdmin" params="[id: user.id]">
                                Non Admin
                            </g:link>
                        </g:else>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>