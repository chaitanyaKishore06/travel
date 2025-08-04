<%-- admin/destinations.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Manage Destinations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../admin/adminnavbar.jsp"/>
    <section class="py-5">
        <div class="container">
            <h2 class="font-serif fs-3 fw-bold text-primary mb-4">Manage Destinations</h2>
            <a href="/admin/destinations/add" class="btn btn-primary mb-3">Add New Destination</a>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th>Rating</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dest" items="${destinations}">
                        <tr>
                            <td>${dest.name}</td>
                            <td>${dest.country}</td>
                            <td>${dest.rating}</td>
                            <td>
                                <a href="/admin/destinations/edit/${dest.id}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="/admin/destinations/delete/${dest.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>