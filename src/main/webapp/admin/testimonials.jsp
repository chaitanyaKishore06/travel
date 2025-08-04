<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Testimonials</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        h1 {
            font-family: 'Playfair Display', serif;
            color: #2c3e50;
            margin: 0;
        }
        .text-center h1 {
            text-align: center;
            margin-bottom: 10px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #3498db;
            color: #fff;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn {
            border-radius: 5px;
        }
        .btn-add {
            background-color: #28a745;
            border: none;
            margin-bottom: 0;
            color: white;
        }
        .btn-add:hover {
            background-color: #218838;
        }
        .btn-edit {
            background-color: #ffc107;
            border: none;
            color: black;
        }
        .btn-edit:hover {
            background-color: #e0a800;
        }
        .btn-delete {
            background-color: #dc3545;
            border: none;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .back-btn {
            background-color: #6c757d;
            color: white;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
        .no-data {
            text-align: center;
            color: #e74c3c;
            font-size: 1.1em;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Centered Heading -->
        <div class="text-center mb-3">
            <h1>All Testimonials</h1>
        </div>

        <!-- Buttons Row -->
        <div class="header-actions">
            <a href="<c:url value='/admin' />" class="btn back-btn">Back</a>
            <a href="${pageContext.request.contextPath}/admin/testimonials/add" class="btn btn-add">Add New Testimonial</a>
        </div>

        <!-- Testimonial Table or Message -->
        <c:if test="${empty testimonials}">
            <p class="no-data">No testimonials available. Add a new testimonial to get started!</p>
        </c:if>
        <c:if test="${not empty testimonials}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Comment</th>
                        <th>Rating</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="testimonial" items="${testimonials}">
                        <tr>
                            <td>${testimonial.name}</td>
                            <td>${testimonial.comment}</td>
                            <td>${testimonial.rating}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/testimonials/edit/${testimonial.id}" class="btn btn-edit btn-sm">Edit</a>
                                <a href="${pageContext.request.contextPath}/admin/testimonials/delete/${testimonial.id}" class="btn btn-delete btn-sm" onclick="return confirm('Are you sure you want to delete this testimonial?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
