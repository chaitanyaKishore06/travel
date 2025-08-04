<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Rooms - Admin</title>
    <link rel="stylesheet" href="<c:url value='/css/admin-styles.css' />">
    <style>
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .text-center h2 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin: 5px 0;
            text-decoration: none;
            border-radius: 4px;
        }
        .add-btn {
            background-color: #007bff;
            color: white;
        }
        .add-btn:hover {
            background-color: #0056b3;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
            margin-right: 5px;
        }
        .edit-btn:hover {
            background-color: #218838;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .back-btn {
            background-color: #6c757d;
            color: white;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .admin-table th, .admin-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .admin-table th {
            background-color: #f8f9fa;
            color: #333;
        }
        .admin-table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Centered Heading -->
        <div class="text-center">
            <h2>Manage Rooms</h2>
        </div>

        <!-- Buttons below the heading -->
        <div class="header-actions">
            <a href="<c:url value='/admin' />" class="btn back-btn">Back</a>
            <a href="<c:url value='/admin/rooms/add' />" class="btn add-btn">Add New Room</a>
        </div>

        <!-- Rooms Table -->
        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Tour Package</th>
                    <th>Size</th>
                    <th>Bed Type</th>
                    <th>Price Per Night</th>
                    <th>Original Price</th>
                    <th>Taxes and Fees</th>
                    <th>Amenities</th>
                    <th>Offers</th>
                    <th>Rating</th>
                    <th>Reviews</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${rooms}">
                    <tr>
                        <td>${room.id}</td>
                        <td>${room.name}</td>
                        <td>${room.tour != null ? room.tour.title : 'N/A'}</td>
                        <td>${room.size}</td>
                        <td>${room.bedType}</td>
                        <td>$${room.pricePerNight}</td>
                        <td>
                            <c:choose>
                                <c:when test="${room.originalPrice != null}">
                                    $${room.originalPrice}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>$${room.taxesAndFees}</td>
                        <td>${room.amenities}</td>
                        <td>${room.offers}</td>
                        <td>${room.rating}</td>
                        <td>${room.reviews}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty room.imageUrls and not empty room.imageUrls[0]}">
                                    <img src="<c:url value='${room.imageUrls[0]}' />" alt="${room.name}">
                                </c:when>
                                <c:when test="${not empty room.imageUrl}">
                                    <img src="<c:url value='${room.imageUrl}' />" alt="${room.name}">
                                </c:when>
                                <c:otherwise>
                                    No Image
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="<c:url value='/admin/rooms/edit/${room.id}' />" class="btn edit-btn">Edit</a>
                            <form action="<c:url value='/admin/rooms/delete/${room.id}' />" method="post" style="display:inline;">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this room?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty rooms}">
                    <tr>
                        <td colspan="14" class="text-center">No rooms available.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
