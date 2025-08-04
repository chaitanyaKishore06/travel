<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Packages - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/book.css" rel="stylesheet">
    <style>
        .header-title {
            text-align: center;
            font-family: 'Playfair Display', serif;
            color: #0d6efd;
            margin-bottom: 10px;
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<section class="py-5">
    <div class="container">
        <!-- Centered Heading -->
        <h2 class="header-title fs-3 fw-bold">Manage Tour Packages</h2>

        <!-- Button Row -->
        <div class="header-actions">
            <a href="/admin" class="btn btn-back">Back</a>
            <a href="/admin/packages/add" class="btn btn-primary">Add New Package</a>
        </div>

        <!-- Tour Packages Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Location</th>
                    <th>Duration</th>
                    <th>Price</th>
                    <th>Featured</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tourPackage" items="${packages}">
                    <tr class="table-row">
                        <td>${tourPackage.id}</td>
                        <td>${tourPackage.title}</td>
                        <td>${tourPackage.location}</td>
                        <td>${tourPackage.duration}</td>
                        <td>${tourPackage.price}</td>
                        <td>${tourPackage.featured}</td>
                        <td>
                            <a href="/admin/packages/edit/${tourPackage.id}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="/admin/packages/delete/${tourPackage.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- No Packages Message -->
        <c:if test="${empty packages}">
            <p class="text-center text-muted">No packages available.</p>
        </c:if>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/JS/book.js"></script>
</body>
</html>
