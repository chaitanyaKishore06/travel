<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
</head>
<body class="login-page">
    <!-- Custom Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent fixed-top">
        <div class="container">
            <a class="btn btn-outline-primary me-2" href="/"><i class="bi bi-arrow-left"></i> Back</a>
            <a class="btn btn-primary" href="/register">Register</a>
        </div>
    </nav>

    <!-- Login Section with Animations -->
    <section class="py-5 login-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="bg-white rounded shadow p-4 login-card animate__animated animate__fadeInUp">
                        <h2 class="font-serif fs-3 fw-bold text-primary mb-4 text-center">Login to TravelBuddy</h2>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger animate__animated animate__shakeX">${error}</div>
                        </c:if>
                        <form method="post" action="/login" id="login-form">
                            <div class="mb-3 form-group">
                                <label class="form-label small fw-medium">Username *</label>
                                <input type="text" name="username" class="form-control animate__animated animate__fadeIn" value="${username}" required>
                            </div>
                            <div class="mb-3 form-group">
                                <label class="form-label small fw-medium">Password *</label>
                                <input type="password" name="password" class="form-control animate__animated animate__fadeIn" required>
                            </div>
                            <input type="hidden" name="redirect" value="${redirect}">
                            <button type="submit" class="btn btn-primary w-100 py-3 login-btn animate__animated animate__pulse animate__infinite">Login</button>
                            <p class="text-center mt-3 small">Don't have an account? <a href="/register">Register here</a></p>
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
    <script src="/JS/loginscripts.js"></script>
</body>
</html>