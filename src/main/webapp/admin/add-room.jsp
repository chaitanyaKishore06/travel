<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Room - Admin</title>
    <link href="/css/book.css" rel="stylesheet">
    <style>
        .container {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        select {
            height: 40px;
        }
        input[type="file"] {
            padding: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .image-group {
            margin-bottom: 15px;
        }
        .image-group label {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Room</h2>
        <form action="<c:url value='/admin/rooms/add' />" method="post" enctype="multipart/form-data">
            <label>Tour Package:
                <select name="tour.id" required>
                    <c:forEach var="pkg" items="${packages}">
                        <option value="${pkg.id}">${pkg.title}</option>
                    </c:forEach>
                </select>
            </label>
            <label>Name: <input type="text" name="name" required></label>
            <label>Size: <input type="text" name="size" required></label>
            <label>Bed Type: <input type="text" name="bedType" required></label>
            <label>Price Per Night: <input type="number" step="0.01" name="pricePerNight" required></label>
            <label>Original Price: <input type="number" step="0.01" name="originalPrice"></label>
            <label>Taxes and Fees: <input type="number" step="0.01" name="taxesAndFees" required></label>
            <label>Amenities: <input type="text" name="amenities" placeholder="e.g., Heater,Free WiFi" required></label>
            <label>Offers: <input type="text" name="offers" placeholder="e.g., 10% off Spa,Free Breakfast"></label>
            <label>Rating: <input type="number" step="0.1" name="rating" required></label>
            <label>Reviews: <input type="number" name="reviews" required></label>
            <!-- Single Multiple Image Upload -->
            <div class="image-group">
                <label>Images (Upload up to 4 images):</label>
                <input type="file" name="images" accept="image/*" multiple required>
                <small class="text-muted">Note: Upload at least 1 image, up to 4 images are allowed. Hold Ctrl (or Cmd) to select multiple files.</small>
            </div>
            <button type="submit">Add Room</button>
        </form>
    </div>
</body>
</html>