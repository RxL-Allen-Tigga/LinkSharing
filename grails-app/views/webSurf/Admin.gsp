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
<Header:navbar username="Alok"/>
<div class="container">

    <div class="row align-items-start text-bg-light p-2 rounded-2 border border-dark p-2 mb-2">
        <div class="row">
            <div class="col-6">
                <h3>Users Details</h3>
            </div>

            <div class="col">
                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                   data-bs-toggle="dropdown"
                   aria-expanded="false">
                    All Users
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">All Users</a></li>
                    <li><a class="dropdown-item" href="#">Active</a></li>
                    <li><a class="dropdown-item" href="#">Deactive</a></li>
                </ul>
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
                <th scope="col" class="sortable">Id</th>
                <th scope="col" class="sortable">Username</th>
                <th scope="col" class="sortable">Email</th>
                <th scope="col" class="sortable">Firstname</th>
                <th scope="col" class="sortable">Lastname</th>
                <th scope="col" class="sortable">Status</th>
                <th scope="col" class="sortable">Admin</th>
                <th scope="col" class="sortable">Remove</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>mrk_otto_123</td>
                <td>mark@otto.com</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>Active</td>
                <td>
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                </td>
                <td>
                    <button class="remove btn btn-danger">X</button>
                </td>
            </tr>
            <tr>
                <th scope="row">1</th>
                <td>mrk_otto_123</td>
                <td>mark@otto.com</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>Deactive</td>
                <td>
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1">
                </td>
                <td>
                    <button class="remove btn btn-danger">X</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<br>
<g:render template="/shared/navbarModals"/>
</body>

</html>