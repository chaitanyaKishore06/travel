<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.jfsd.travel.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <style>
        .circular-image {
            border-radius: 50%;
            object-fit: cover; /* Ensures the image fills the circle without distortion */
            width: 200px; /* Fixed width for consistency */
            height: 200px; /* Fixed height to match width for a perfect circle */
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <section class="py-5">
        <div class="container">
            <h2 class="font-serif fs-3 fw-bold text-primary mb-4">My Profile</h2>
            <c:choose>
                <c:when test="${user != null}">
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <div class="bg-white rounded shadow p-4">
                                <h3 class="font-serif fs-5 fw-bold mb-3">Account Details</h3>
                                <p><strong>Username:</strong> ${user.username}</p>
                                <p><strong>Email:</strong> ${user.email}</p>
                                <p><strong>Phone:</strong> ${user.phone}</p>
                                <p><strong>Full Name:</strong> ${user.fullName}</p>
                                <!-- Updated Profile Photo Section -->
                                <div class="mb-3">
                                    <h4 class="font-serif fs-6 fw-bold mb-2">Profile Photo</h4>
                                    <c:if test="${not empty base64Photo}">
                                        <img src="data:image/jpeg;base64,${base64Photo}" alt="Profile Photo" class="circular-image mb-2" >
                                        <form action="/profile/remove-photo" method="post">
                                            <button type="submit" class="btn btn-danger btn-sm">Remove Photo</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${empty base64Photo}">
                                        <p>No profile photo uploaded.</p>
                                        <form action="/profile/upload-photo" method="post" enctype="multipart/form-data">
                                            <input type="file" name="photo" class="form-control mb-2" accept="image/*" required>
                                            <button type="submit" class="btn btn-primary btn-sm">Upload Photo</button>
                                        </form>
                                    </c:if>
                                </div>
                                <a href="/logout" class="btn btn-outline-primary w-100 mt-3">Logout</a>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="bg-white rounded shadow p-4">
                                <h3 class="font-serif fs-5 fw-bold mb-3">My Bookings</h3>
                                <c:choose>
                                    <c:when test="${not empty bookings}">
                                        <c:forEach var="booking" items="${bookings}">
                                            <div class="border-bottom py-3">
                                                <h4 class="fs-6 fw-bold text-primary">${booking.tourPackage.title}</h4>
                                                <p class="small text-muted"><i class="bi bi-geo-alt me-1"></i>${booking.tourPackage.location}</p>
                                                <p class="small text-muted"><i class="bi bi-calendar me-1"></i>Travel Date: ${booking.travelDate}</p>
                                                <p class="small text-muted"><i class="bi bi-people me-1"></i>Adults: ${booking.adults}, Children: ${booking.children}</p>
                                                <p class="small text-muted"><i class="bi bi-clock me-1"></i>Booked on: ${booking.bookingDate}</p>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted">You have no bookings yet. <a href="/packages">Explore our packages</a> to start planning your trip!</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger" role="alert">
                        Error: User information is not available. Please log in again or contact support.
                    </div>
                    <a href="/login" class="btn btn-primary">Log In</a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>