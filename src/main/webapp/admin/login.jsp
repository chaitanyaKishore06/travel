<%-- admin/login.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/adminlogin.css" rel="stylesheet">
</head>
<body class="admin-login-page">
    <!-- Custom Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent fixed-top">
        <div class="container">
            <a class="btn btn-outline-primary" href="/"><i class="bi bi-arrow-left"></i> Back</a>
        </div>
    </nav>

    <!-- Admin Login Section with Animations -->
    <section class="py-5 admin-login-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="bg-white rounded shadow p-4 admin-login-card animate__animated animate__zoomIn">
                        <h2 class="font-serif fs-3 fw-bold text-primary mb-4 text-center">Admin Login</h2>
                        <c:if test="${param.error}">
                            <div class="alert alert-danger animate__animated animate__shakeX">Invalid username or password.</div>
                        </c:if>
                        <form method="post" action="/admin/login" id="admin-login-form">
                            <div class="mb-3 form-group">
                                <label class="form-label small fw-medium">Username *</label>
                                <input type="text" name="username" class="form-control animate__animated animate__fadeIn" required>
                            </div>
                            <div class="mb-3 form-group">
                                <label class="form-label small fw-medium">Password *</label>
                                <input type="password" name="password" class="form-control animate__animated animate__fadeIn" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 py-3 admin-login-btn animate__animated animate__pulse animate__infinite">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Background Animation -->
    <div class="background-animation">
        <div class="plane-animation"><i class="bi bi-airplane"></i></div>
        <div class="cloud cloud1"></div>
        <div class="cloud cloud2"></div>
        <div class="cloud cloud3"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
    <script src="/JS/adminlogin.js"></script>
</body>
</html>