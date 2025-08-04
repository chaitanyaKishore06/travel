<%-- admin/dashboard.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../admin/adminnavbar.jsp"/>
    <section class="py-5">
        <div class="container">
            <h2 class="font-serif fs-3 fw-bold text-primary mb-4">Admin Dashboard</h2>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="bg-white rounded shadow p-4 text-center">
                        <h3 class="fs-5 fw-bold text-primary">${destinationCount}</h3>
                        <p class="text-muted">Destinations</p>
                        <a href="/admin/destinations" class="btn btn-outline-primary mt-3">Manage</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="bg-white rounded shadow p-4 text-center">
                        <h3 class="fs-5 fw-bold text-primary">${packageCount}</h3>
                        <p class="text-muted">Tour Packages</p>
                        <a href="/admin/packages" class="btn btn-outline-primary mt-3">Manage</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="bg-white rounded shadow p-4 text-center">
                        <h3 class="fs-5 fw-bold text-primary">${bookingCount}</h3>
                        <p class="text-muted">Bookings</p>
                        <a href="/admin/bookings" class="btn btn-outline-primary mt-3">Manage</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="bg-white rounded shadow p-4 text-center">
                        <h3 class="fs-5 fw-bold text-primary">${testimonialCount}</h3>
                        <p class="text-muted">Testimonials</p>
                        <a href="/admin/testimonials" class="btn btn-outline-primary mt-3">Manage</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="bg-white rounded shadow p-4 text-center">
                        <h3 class="fs-5 fw-bold text-primary">${userCount}</h3>
                        <p class="text-muted">Users</p>
                        <a href="/admin/users" class="btn btn-outline-primary mt-3">Manage</a>
                    </div>
                </div>
                
               <div class="col-md-3 mb-4">
    <div class="bg-white rounded shadow p-4 text-center">
        <h3 class="fs-5 fw-bold text-primary">${roomCount}</h3>
        <p class="text-muted">Rooms</p>
        <a href="/admin/rooms" class="btn btn-outline-primary mt-3">Manage</a>
    </div>
</div>
            </div>
        </div>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>