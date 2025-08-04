<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${tourPackage.title} - Details</title>
    <link rel="stylesheet" href="<c:url value='/css/package-details.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="package-header">
            <h1 class="package-title">${tourPackage.title}</h1>
            <p class="package-info">Location: ${tourPackage.location}</p>
            <c:if test="${tourPackage.featured}">
                <span class="featured-tag">Featured</span>
            </c:if>
        </div>
        <div class="package-image">
            <img src="${tourPackage.imageUrl}" alt="${tourPackage.title}">
        </div>
        <div class="package-details">
            <h2 class="section-title">Package Overview</h2>
            <p><strong>Duration:</strong> ${tourPackage.duration}</p>
            <p><strong>Price:</strong> $${tourPackage.price} per person</p>
            <c:if test="${not empty tourPackage.highlights}">
                <p><strong>Highlights:</strong> ${tourPackage.highlights}</p>
            </c:if>
        </div>
        <div class="rooms-section">
            <h2 class="section-title">Available Rooms</h2>
            <c:choose>
                <c:when test="${not empty rooms}">
                    <div class="room-grid">
                        <c:forEach var="room" items="${rooms}">
                            <div class="room-card">
                                <img src="${room.imageUrl}" alt="${room.name}">
                                <div class="room-info">
                                    <h3>${room.name}</h3>
                                    <p>Price: $${room.pricePerNight} per night</p>
                                    <c:if test="${not empty room.offers}">
                                        <p class="offer">Offer: ${room.offers}</p>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="no-rooms">No rooms available yet.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="button-group">
            <a href="<c:url value='/packages' />" class="back-btn">Back to Packages</a>
            <a href="<c:url value='/packages/${tourPackage.id}/room-selection' />" class="select-btn">Select Room</a>
        </div>
    </div>
    <script src="<c:url value='/js/scripts.js' />"></script>
</body>
</html>