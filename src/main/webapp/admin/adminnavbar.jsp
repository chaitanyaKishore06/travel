<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Portal</title>

    <!-- ✅ Place your CSS file link here -->
    <link href="/css/admincss.css" rel="stylesheet">
    
    <!-- Optionally Bootstrap or Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>

<header class="fixed-top w-100 bg-dark py-3 transition-all shadow-sm">
    <div class="container">
        <nav class="navbar navbar-expand-md">
            <a class="navbar-brand text-white font-serif fs-3 fw-bold" href="/admin">Admin Portal</a>
            <button class="navbar-toggler mobile-toggle text-white" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbarNav">
                <i class="bi bi-list"></i>
            </button>
            <div class="collapse navbar-collapse" id="adminNavbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item me-3">
                        <a class="nav-link text-white fw-medium admin-nav-link position-relative" href="/admin">
                            Admin Dashboard
                            <span class="nav-underline"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary admin-btn-signout" href="/admin/logout">Sign Out</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

<!-- your page content here -->

</body>
</html>
