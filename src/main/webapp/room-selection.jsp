<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room Selection - TravelBuddy</title>
    <link rel="stylesheet" href="<c:url value='/css/book.css' />">
</head>
<body>
    <div class="container">
        <a href="<c:url value='/packages' />" class="back-btn">← Back to Packages</a>
        <h2>${tour.title}</h2>
        <p class="location">⦁ ${tour.location}</p>
        <div class="room-selection-grid">
            <div class="sidebar">
                <h3>Customize Your Stay</h3>
                <form>
                    <label>Check-in Date: <input type="date" name="checkIn"></label>
                    <label>Check-out Date: <input type="date" name="checkOut"></label>
                    <!-- Remove Number of Days and handle it dynamically on book-now.jsp -->
                    <label>Adults:
                        <select name="adults">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </label>
                    <label>Youth:
                        <select name="youth">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </label>
                    <div class="package-includes">
                        <h4>Package Includes:</h4>
                        <c:forEach var="highlight" items="${tour.highlights.split(',')}">
                            <p>${highlight}</p>
                        </c:forEach>
                    </div>
                </form>
            </div>
            <div class="room-content">
                <h3>Choose Your Room</h3>
                <c:forEach var="room" items="${rooms}">
                    <div class="room-card">
                        <c:if test="${not empty room.originalPrice}">
                            <span class="discount">Save $${room.originalPrice - room.pricePerNight}</span>
                        </c:if>
                        <c:choose>
                            <c:when test="${not empty room.imageUrls and not empty room.imageUrls[0]}">
                                <img src="${room.imageUrls[0]}" alt="${room.name}">
                            </c:when>
                            <c:when test="${not empty room.imageUrl}">
                                <img src="${room.imageUrl}" alt="${room.name}">
                            </c:when>
                            <c:otherwise>
                                <img src="<c:url value='/images/no-image.jpg' />" alt="No Image" style="width: 100%; height: auto;">
                            </c:otherwise>
                        </c:choose>
                        <div class="room-info">
                            <h4>${room.name} ★ ${room.rating} (${room.reviews} reviews)</h4>
                            <p>${room.size} | ${room.bedType}</p>
                            <p>Amenities: ${room.amenities}</p>
                            <p>Offers: ${room.offers}</p>
                            <p class="price">$${room.pricePerNight}<c:if test="${not empty room.originalPrice}"> <span class="original-price">$${room.originalPrice}</span></c:if> per night + $${room.taxesAndFees} taxes & fees</p>
                            <p>Total for 5 nights: $${(room.pricePerNight + room.taxesAndFees) * 5}</p> <!-- Placeholder, adjust with date logic if needed -->
                            <a href="<c:url value='/package/room-details/${room.id}' />" class="more-details">More Details ></a>
                            <a href="<c:url value='/package/book-now/${tour.id}?roomId=${room.id}' />" class="select-btn">Select Room</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script src="<c:url value='/JS/scripts.js' />"></script>
</body>
</html>