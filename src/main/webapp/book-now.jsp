<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Now - TravelBuddy</title>
    <link rel="stylesheet" href="<c:url value='/css/book-now.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        .modal { display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4); }
        .modal-content { background-color: #fefefe; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 80%; max-width: 500px; }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; }
        .close:hover, .close:focus { color: black; text-decoration: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <!-- Existing content -->
        <a href="<c:url value='/packages' />" class="back-btn">← Back to Packages</a>
        <h1 class="page-title">${tour.title}</h1>
        <p class="location">⦁ ${tour.location}</p>
        <div class="booking-section">
            <div class="sidebar">
                <h2 class="section-title">Customize Your Stay</h2>
                <form:form id="booking-form" modelAttribute="booking" method="post" action="/package/book-now">
                    <!-- Existing form fields -->
                    <div class="form-group">
                        <label>Check-in Date:</label>
                        <form:input path="travelDate" type="date" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Check-out Date:</label>
                        <form:input path="returnDate" type="date" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Adults:</label>
                        <form:select path="adults" class="form-control" required="true">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label>Youth:</label>
                        <form:select path="children" class="form-control" required="true">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label>Full Name:</label>
                        <form:input path="fullName" class="form-control" required="true" value="${user != null ? user.fullName : ''}"/>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <form:input path="email" type="email" class="form-control" required="true" value="${user != null ? user.email : ''}"/>
                    </div>
                    <div class="form-group">
                        <label>Phone:</label>
                        <form:input path="phone" class="form-control" value="${user != null ? user.phone : ''}"/>
                    </div>
                    <div class="form-group">
                        <label>Special Requests:</label>
                        <form:textarea path="specialRequests" class="form-control" rows="4"/>
                    </div>
                    <button type="submit" class="submit-btn">Confirm Booking</button>
                </form:form>
            </div>
            <div class="room-content">
                <h2 class="section-title">Selected Package & Room</h2>
                <c:if test="${not empty rooms and not empty rooms[0]}">
                    <c:set var="room" value="${rooms[0]}" />
                    <div class="room-card">
                        <div class="room-details">
                            <h3 class="room-name">${room.name} ★ ${room.rating} (${room.reviews} reviews)</h3>
                            <p class="amenities"><strong>Amenities:</strong> ${room.amenities}</p>
                            <p class="price"><strong>Price:</strong> $${room.pricePerNight} per night + $${room.taxesAndFees} taxes & fees</p>
                            <p class="total"><strong>Total for selected days:</strong> $
                                <c:set var="days" value="${(returnDate != null && travelDate != null) ? ((returnDate.toEpochDay() - travelDate.toEpochDay())) : 5}" />
                                ${days > 0 ? (room.pricePerNight + room.taxesAndFees) * days : (room.pricePerNight + room.taxesAndFees) * 5}
                            </p>
                            <a href="<c:url value='/package/room-details/${room.id}' />" class="more-details">More Details ></a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty rooms}">
                    <p>No room selected.</p>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Testimonial Popup -->
    <c:if test="${not empty bookingId}">
        <div id="testimonialModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3>Leave a Review</h3>
                <form action="/submit-testimonial" method="post">
                    <input type="hidden" name="bookingId" value="${bookingId}">
                    <div class="mb-3">
                        <label class="form-label">Name:</label>
                        <input type="text" name="name" class="form-control" value="${user.fullName}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Comment:</label>
                        <textarea name="comment" class="form-control" rows="4" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Rating (1-5):</label>
                        <input type="number" name="rating" min="1" max="5" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Image URL:</label>
                        <input type="text" name="imageUrl" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Review</button>
                </form>
            </div>
        </div>

        <script>
            // Show popup after booking
            document.addEventListener("DOMContentLoaded", function() {
                var modal = document.getElementById("testimonialModal");
                modal.style.display = "block";
                var span = document.getElementsByClassName("close")[0];
                span.onclick = function() {
                    modal.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            });
        </script>
    </c:if>

    <script src="<c:url value='/js/scripts.js' />"></script>
</body>
</html>