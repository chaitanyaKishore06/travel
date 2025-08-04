<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking - TravelBuddy</title>
    <link rel="stylesheet" href="<c:url value='/css/book.css' />">
</head>
<body>
    <div class="container">
        <h2>Featured Tour Packages</h2>
        <p>Discover our handpicked selection of extraordinary travel experiences, crafted to create memories that last a lifetime</p>
        <div class="tour-grid">
            <c:forEach var="tour" items="${tourPackages}">
                <div class="tour-card">
                    <c:if test="${not empty tour.discount}">
                        <span class="discount">${tour.discount}% OFF</span>
                    </c:if>
                    <img src="${tour.imageUrl}" alt="${tour.title}">
                    <div class="tour-info">
                        <div class="rating">★ ${tour.rating} (${tour.reviews} reviews)</div>
                        <h3>${tour.title}</h3>
                        <p><span class="location">⦁ ${tour.location}</span></p>
                        <p>${tour.duration} | ${tour.groupSize}</p>
                        <p class="price">$${tour.price}<c:if test="${not empty tour.originalPrice}"> <span class="original-price">$${tour.originalPrice}</span></c:if> per person</p>
                        <a href="<c:url value='/package/room-selection/${tour.id}' />" class="book-btn">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="<c:url value='/JS/scripts.js' />"></script>
</body>
</html>