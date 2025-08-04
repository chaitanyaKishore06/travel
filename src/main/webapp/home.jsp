<%-- home.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://images.pexels.com/photos/3155666/pexels-photo-3155666.jpeg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Discover Extraordinary Travel Experiences</h1>
                <p class="lead text-white-90 mb-4">Curated luxury journeys to the world's most breathtaking destinations</p>
                <a href="/destinations" class="btn btn-secondary py-3 px-5">Explore Now <i class="bi bi-chevron-right ms-2"></i></a>
            </div>
        </div>
    </section>

    <!-- Search Form -->
    <section class="py-5">
        <div class="container">
            <div class="bg-white rounded shadow-lg p-4 mt-n5 position-relative">
                <form>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label small fw-medium">Destination</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                <input type="text" class="form-control" placeholder="Where do you want to go?">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label small fw-medium">Travel Date</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label small fw-medium">Travelers</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-people"></i></span>
                                <select class="form-select">
                                    <option>Select travelers</option>
                                    <option>1 Traveler</option>
                                    <option>2 Travelers</option>
                                    <option>3 Travelers</option>
                                    <option>4+ Travelers</option>
                                    <option>5+ Travelers</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 text-center mt-4">
                            <button type="submit" class="btn btn-primary">Search Packages <i class="bi bi-search ms-2"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title section-title-centered">Why Choose Us</h2>
                <p class="text-muted">We create bespoke luxury travel experiences tailored to your preferences.</p>
            </div>
            <div class="row">
                <div class="col-md-4 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-compass text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-4 fw-bold mb-2">Curated Experiences</h3>
                    <p class="text-muted">Handpicked extraordinary experiences beyond the ordinary.</p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-award text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-4 fw-bold mb-2">Luxury Accommodations</h3>
                    <p class="text-muted">Finest hotels and resorts with exceptional service.</p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-heart text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-4 fw-bold mb-2">Personalized Service</h3>
                    <p class="text-muted">Tailored itineraries for a unique travel experience.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Destinations -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="section-title">Popular Destinations</h2>
                    <p class="text-muted">Explore our collection of handpicked destinations.</p>
                </div>
                <a href="/destinations" class="btn btn-outline-primary d-none d-md-block">View All Destinations</a>
            </div>
            <div class="row">
                <c:forEach var="destination" items="${destinations}" varStatus="loop">
                    <c:if test="${loop.index < 3}">
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="position-relative">
                                    <img src="${destination.imageUrl}" class="card-img-top" alt="${destination.name}" style="height: 200px; object-fit: cover;">
                                    <div class="position-absolute top-0 end-0 bg-white rounded-circle p-2 m-2">
                                        <i class="bi bi-star-fill text-warning me-1"></i>${destination.rating}
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h5 class="font-serif fw-bold text-primary">${destination.name}</h5>
                                    <p class="small text-muted"><i class="bi bi-geo-alt me-1"></i>${destination.country}</p>
                                    <p class="text-muted small">${destination.description}</p>
                                    <div class="d-flex flex-wrap gap-2 mb-3">
                                        <c:forEach var="activity" items="${destination.activities}" varStatus="actLoop">
                                            <c:if test="${actLoop.index < 3}">
                                                <span class="badge bg-light text-dark">${activity}</span>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <p class="small text-muted mb-0">Best time to visit</p>
                                            <p class="small fw-medium">${destination.bestTimeToVisit}</p>
                                        </div>
                                        <a href="/destinations/${destination.id}" class="btn btn-outline-primary btn-sm">Explore</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="text-center mt-4 d-md-none">
                <a href="/destinations" class="btn btn-outline-primary">View All Destinations</a>
            </div>
        </div>
    </section>

    <!-- Featured Packages -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="section-title">Featured Tour Packages</h2>
                    <p class="text-muted">Discover our most popular luxury tour packages.</p>
                </div>
                <a href="/packages" class="btn btn-outline-primary d-none d-md-block">View All Packages</a>
            </div>
            <div class="row">
                <c:forEach var="pkg" items="${featuredPackages}" varStatus="loop">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <div class="position-relative">
                                <img src="${pkg.imageUrl}" class="card-img-top" alt="${pkg.title}" style="height: 200px; object-fit: cover;">
                                <c:if test="${pkg.featured}">
                                    <span class="position-absolute top-0 start-0 bg-warning text-white small px-3 py-1 rounded-end">Featured</span>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <h5 class="font-serif fw-bold text-primary">${pkg.title}</h5>
                                <p class="small text-muted"><i class="bi bi-geo-alt me-1"></i>${pkg.location}</p> <!-- Changed from destination -->
                                <p class="small text-muted"><i class="bi bi-clock me-1"></i>${pkg.duration}</p>
                                <p class="text-muted small">${pkg.highlights}</p> <!-- Changed from description -->
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="small text-muted mb-0">Starting from</p>
                                        <p class="fs-5 font-serif fw-bold text-primary">$${pkg.price}</p>
                                        <p class="small text-muted">per person</p>
                                    </div>
                                    <a href="/packages/${pkg.id}" class="btn btn-primary btn-sm">View Details <i class="bi bi-chevron-right ms-1"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="text-center mt-4 d-md-none">
                <a href="/packages" class="btn btn-outline-primary">View All Packages</a>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title section-title-centered">What Our Clients Say</h2>
                <p class="text-muted">Hear from travelers who have experienced our luxury journeys.</p>
            </div>
            <div class="row">
                <c:forEach var="testimonial" items="${testimonials}">
                    <div class="col-md-4 mb-4">
                        <div class="bg-white p-4 rounded shadow">
                            <div class="d-flex align-items-center mb-3">
                                <img src="${testimonial.imageUrl}" class="rounded-circle me-3" alt="${testimonial.name}" style="width: 64px; height: 64px; object-fit: cover;">
                                <div>
                                    <h4 class="fs-6 fw-medium">${testimonial.name}</h4>
                                    <p class="small text-muted">${testimonial.location}</p>
                                </div>
                            </div>
                            <div class="d-flex mb-3">
                                <c:forEach begin="1" end="5" var="i">
                                    <i class="bi bi-star-fill ${i <= testimonial.rating ? 'text-warning' : 'text-muted'} me-1"></i>
                                </c:forEach>
                            </div>
                            <p class="text-muted fst-italic">"${testimonial.comment}"</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>