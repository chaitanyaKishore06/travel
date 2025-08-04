<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${room.name} - Details</title>
    <link rel="stylesheet" href="<c:url value='/css/room-details.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <a href="<c:url value='/package/book-now/${room.tour.id}' />" class="back-btn">← Back to Booking</a>
        <h1 class="page-title">${room.name}</h1>
        <div class="room-gallery">
            <c:choose>
                <c:when test="${not empty room.imageUrls}">
                    <c:forEach var="image" items="${room.imageUrls}" varStatus="loop">
                        <img src="${image}" alt="${room.name} Image ${loop.index + 1}" class="${loop.index == 0 ? 'main-image' : 'thumbnail'}">
                    </c:forEach>
                </c:when>
                <c:when test="${not empty room.imageUrl}">
                    <img src="${room.imageUrl}" alt="${room.name}" class="main-image">
                </c:when>
                <c:otherwise>
                    <img src="<c:url value='/images/no-image.jpg' />" alt="No Image" class="main-image">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="room-details-section">
            <h2 class="section-title">Room Overview</h2>
            <p><strong>Rating:</strong> ★ ${room.rating} (${room.reviews} reviews)</p>
            <p><strong>Size:</strong> ${room.size}</p>
            <p><strong>Bed Type:</strong> ${room.bedType}</p>
            <p><strong>Amenities:</strong> ${room.amenities}</p>
            <p><strong>Offers:</strong> ${room.offers}</p>
            <p><strong>Price:</strong> $${room.pricePerNight} per night + $${room.taxesAndFees} taxes & fees</p>
            <c:if test="${not empty room.originalPrice}">
                <p><strong>Original Price:</strong> $${room.originalPrice} per night</p>
                <p class="save">Save: $${room.originalPrice - room.pricePerNight} per night</p>
            </c:if>
        </div>
        <a href="<c:url value='/package/book-now/${room.tour.id}' />" class="book-now-btn">Book Now</a>
    </div>
    <script src="<c:url value='/js/scripts.js' />"></script>
</body>
</html>