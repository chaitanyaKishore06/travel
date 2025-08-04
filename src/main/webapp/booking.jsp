<%-- booking.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Book Your Trip</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://wallpapers.com/images/hd/1366x768-travel-background-vk9c2y88x4bx63ob.jpg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Book Your Dream Vacation</h1>
                <p class="lead text-white-90 mb-4">Start your journey to extraordinary experiences</p>
            </div>
        </div>
    </section>

    <!-- Booking Section -->
    <section class="py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-8">
                    <div class="bg-white rounded shadow p-4">
                        <h3 class="font-serif fs-3 fw-bold text-primary mb-4">Booking Form</h3>
                        <form:form id="booking-form" modelAttribute="booking" method="post" action="/booking">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Full Name *</label>
                                    <form:input path="fullName" class="form-control" required="true"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Email Address *</label>
                                    <form:input path="email" type="email" class="form-control" required="true"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Phone Number</label>
                                    <form:input path="phone" class="form-control"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Select Package *</label>
                                    <form:select path="tourPackage" class="form-select" required="true">
                                        <option value="">Select a package</option>
                                        <c:forEach var="pkg" items="${packages}">
                                            <option value="${pkg.id}">${pkg.title} - ${pkg.location}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Travel Date *</label>
                                    <form:input path="travelDate" type="date" id="travelDate" class="form-control" required="true"/>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label small fw-medium">Adults *</label>
                                    <form:input path="adults" type="number" min="1" class="form-control" required="true"/>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label small fw-medium">Children</label>
                                    <form:input path="children" type="number" min="0" class="form-control" value="0"/>
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-medium">Special Requests</label>
                                    <form:textarea path="specialRequests" class="form-control" rows="4"/>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100 py-3">Submit Booking</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="bg-white rounded shadow p-4 mb-4">
                        <h3 class="font-serif fs-4 fw-bold text-primary mb-3">Why Book With Us</h3>
                        <ul class="list-unstyled">
                            <li class="d-flex mb-3">
                                <div class="bg-success bg-opacity-10 rounded-circle p-2 me-3">
                                    <i class="bi bi-check text-success"></i>
                                </div>
                                <div>
                                    <h4 class="fs-6 fw-medium">Best Price Guarantee</h4>
                                    <p class="small text-muted">We match or beat any competitor's price.</p>
                                </div>
                            </li>
                            <li class="d-flex mb-3">
                                <div class="bg-success bg-opacity-10 rounded-circle p-2 me-3">
                                    <i class="bi bi-check text-success"></i>
                                </div>
                                <div>
                                    <h4 class="fs-6 fw-medium">No Hidden Fees</h4>
                                    <p class="small text-muted">All costs are transparent and upfront.</p>
                                </div>
                            </li>
                            <li class="d-flex mb-3">
                                <div class="bg-success bg-opacity-10 rounded-circle p-2 me-3">
                                    <i class="bi bi-check text-success"></i>
                                </div>
                                <div>
                                    <h4 class="fs-6 fw-medium">Flexible Cancellation</h4>
                                    <p class="small text-muted">Free cancellation up to 30 days before departure.</p>
                                </div>
                            </li>
                            <li class="d-flex mb-3">
                                <div class="bg-success bg-opacity-10 rounded-circle p-2 me-3">
                                    <i class="bi bi-check text-success"></i>
                                </div>
                                <div>
                                    <h4 class="fs-6 fw-medium">24/7 Support</h4>
                                    <p class="small text-muted">Our travel experts are always available.</p>
                                </div>
                            </li>
                            <li class="d-flex">
                                <div class="bg-success bg-opacity-10 rounded-circle p-2 me-3">
                                    <i class="bi bi-check text-success"></i>
                                </div>
                                <div>
                                    <h4 class="fs-6 fw-medium">Secure Payments</h4>
                                    <p class="small text-muted">All transactions are encrypted and secure.</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bg-primary rounded shadow p-4 text-white">
                        <h3 class="font-serif fs-4 fw-bold mb-3">Need Assistance?</h3>
                        <p class="mb-4">Our travel experts are ready to help you plan your perfect vacation.</p>
                        <div class="d-flex mb-3">
                            <i class="bi bi-telephone me-2 mt-1"></i>
                            <span>+1 (800) 123-4567</span>
                        </div>
                        <div class="d-flex mb-3">
                            <i class="bi bi-envelope me-2 mt-1"></i>
                            <span>bookings@TravelBuddy.com</span>
                        </div>
                        <div class="d-flex">
                            <i class="bi bi-geo-alt me-2 mt-1"></i>
                            <span>123 Luxury Avenue, New York, NY 10001, USA</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>