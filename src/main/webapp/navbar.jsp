<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="fixed-top w-100 bg-transparent py-3 transition-all navbar-slide" id="navbar">
    <div class="container">
        <nav class="navbar navbar-expand-md">
            <a class="navbar-brand text-white font-serif fs-3 fw-bold" href="/">Travel Buddy</a>
            <button class="navbar-toggler mobile-toggle text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item nav-item-spacing">
                        <a class="nav-link text-white fw-medium" href="/">Home</a>
                    </li>
                    <li class="nav-item nav-item-spacing">
                        <a class="nav-link text-white fw-medium" href="/destinations">Destinations</a>
                    </li>
                    <li class="nav-item nav-item-spacing">
                        <a class="nav-link text-white fw-medium" href="/packages">Tour Packages</a>
                    </li>
                    <li class="nav-item nav-item-spacing">
                        <a class="nav-link text-white fw-medium" href="/booking">Book Now</a>
                    </li>
                    <li class="nav-item nav-item-spacing">
                        <a class="nav-link text-white fw-medium" href="/about">About Us</a>
                    </li>
                    <c:if test="${sessionScope.admin}">
                        <li class="nav-item nav-item-spacing">
                            <a class="nav-link text-white fw-medium" href="/admin">Admin Panel</a>
                        </li>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty sessionScope.user && not sessionScope.admin}">
                            <li class="nav-item nav-item-spacing">
                                <a class="nav-link text-white fw-medium" href="/profile">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="/logout">Logout</a>
                            </li>
                        </c:when>
                        <c:when test="${sessionScope.admin}">
                            <li class="nav-item">
                                <a class="btn btn-primary" href="/admin/logout">Logout</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item nav-item-spacing">
                                <a class="nav-link text-white fw-medium" href="/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="/register">Register</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>
    </div>
</header>

<style>
/* Adjusted spacing for navbar items */
.nav-item-spacing {
    margin-right: 1.5rem; /* Consistent spacing between nav items */
}

/* Navbar slide animation */
.navbar-slide {
    transition: transform 0.5s ease-in-out, opacity 0.5s ease-in-out;
}

.navbar-hidden {
    transform: translateY(-100%);
    opacity: 0;
}

.navbar-visible {
    transform: translateY(0);
    opacity: 1;
}

/* Ensure the navbar stays visible on hover for usability */
.navbar-slide:hover {
    transform: translateY(0);
    opacity: 1;
}

/* Responsive adjustments */
@media (max-width: 767px) {
    .nav-item-spacing {
        margin-right: 0;
        margin-bottom: 0.5rem;
    }
}
</style>

<script>
// JavaScript for scroll-based navbar hide/show
document.addEventListener('DOMContentLoaded', function () {
    let lastScrollTop = 0;
    const navbar = document.getElementById('navbar');

    window.addEventListener('scroll', function () {
        let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

        if (scrollTop > lastScrollTop) {
            // Scrolling down
            navbar.classList.remove('navbar-visible');
            navbar.classList.add('navbar-hidden');
        } else {
            // Scrolling up
            navbar.classList.remove('navbar-hidden');
            navbar.classList.add('navbar-visible');
        }
        lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // For Mobile or negative scrolling
    });
});
</script>