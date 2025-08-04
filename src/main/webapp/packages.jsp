<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Tour Packages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <style>
        .room-card { margin-bottom: 10px; }
        .room-card .card-body { padding: 0.75rem; }
        .flip-card-front {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 1rem;
            background: linear-gradient(135deg, rgba(10, 61, 98, 0.1), rgba(243, 156, 18, 0.1));
            border-radius: 0.375rem;
        }
        .flip-card-front p {
            font-family: 'Playfair Display', serif;
            font-size: 1.1rem;
            color: #0a3d62;
            font-weight: 700;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://cdn.pixabay.com/photo/2017/03/27/16/50/beach-2179624_1280.jpg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Luxury Tour Packages</h1>
                <p class="lead text-white-90 mb-4">Curated travel experiences designed for the discerning traveler</p>
            </div>
        </div>
    </section>

    <!-- Packages Section -->
    <section class="py-5">
        <div class="container">
            <!-- Search and Filters -->
            <div class="bg-white rounded shadow p-4 mb-5">
                <form id="package-filter-form" action="/packages" method="get">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-search"></i></span>
                                <input type="text" id="search" name="search" class="form-control" placeholder="Search packages..." value="${param.search}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <select id="location" name="location" class="form-select">
                                <option value="">All Locations</option>
                                <c:forEach var="loc" items="${locations}">
                                    <option value="${loc}" ${loc == param.location ? 'selected' : ''}>${loc}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select id="duration" name="duration" class="form-select">
                                <option value="">All Durations</option>
                                <c:forEach var="dur" items="${durations}">
                                    <option value="${dur}" ${dur == param.duration ? 'selected' : ''}>${dur}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <div class="d-flex align-items-center mb-2">
                                <i class="bi bi-currency-dollar me-1 text-muted"></i>
                                <span class="small fw-medium text-muted">Price Range: $${param.priceMin} - <span id="price-range-value">$${param.priceMax}</span></span>
                            </div>
                            <input type="range" id="price-range" name="priceMax" class="form-range" min="0" max="10000" step="500" value="${param.priceMax != null ? param.priceMax : 10000}">
                        </div>
                        <div class="col-12 text-center mt-3">
                            <button type="submit" class="btn btn-primary">Apply Filters</button>
                            <a href="/packages" class="btn btn-outline-secondary ms-2">Clear Filters</a>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Results -->
            <div>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="font-serif fs-3 fw-bold text-primary">${packages.size()} Tour Packages Found</h2>
                    <div class="d-flex align-items-center">
                        <i class="bi bi-funnel me-2 text-muted"></i>
                        <select class="form-select">
                            <option>Sort by Popularity</option>
                            <option>Sort by Price: Low to High</option>
                            <option>Sort by Price: High to Low</option>
                            <option>Sort by Duration</option>
                        </select>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty packages}">
                        <div class="row">
                            <c:forEach var="pkg" items="${packages}">
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
                                            <p class="small text-muted"><i class="bi bi-geo-alt me-1"></i>${pkg.location}</p>
                                            <p class="small text-muted"><i class="bi bi-clock me-1"></i>${pkg.duration}</p>
                                            <p class="small text-muted"><i class="bi bi-star me-1"></i>${pkg.rating} (${pkg.reviews} reviews)</p>
                                            <p class="text-muted small">${pkg.highlights}</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <p class="small text-muted mb-0">Starting from</p>
                                                    <p class="fs-5 font-serif fw-bold text-primary">$${pkg.price}</p>
                                                    <c:if test="${pkg.originalPrice != null && pkg.originalPrice > pkg.price}">
                                                        <p class="small text-decoration-line-through text-muted">$${pkg.originalPrice}</p>
                                                    </c:if>
                                                    <p class="small text-muted">per person</p>
                                                </div>
                                                <a href="/packages/${pkg.id}" class="btn btn-primary btn-sm">Explore <i class="bi bi-chevron-right ms-1"></i></a>
                                            </div>
                                        </div>
                                        <!-- Room Options with Flip Card -->
                                        <c:if test="${not empty pkg.roomOptions}">
                                            <div class="card-footer bg-light">
                                                <h6 class="mb-2">Available Rooms:</h6>
                                                <div class="flip-card">
                                                    <div class="flip-card-inner">
                                                        <div class="flip-card-front">
                                                            <p>Discover luxurious room options including ocean views, private balconies, and premium amenities. Click to explore!</p>
                                                        </div>
                                                        <div class="flip-card-back">
                                                            <c:forEach var="room" items="${pkg.roomOptions}">
                                                                <div class="card room-card">
                                                                    <div class="card-body">
                                                                        <h6 class="card-title">${room.name}</h6>
                                                                        <p class="card-text"><i class="bi bi-bed"></i> ${room.bedType}</p>
                                                                        <p class="card-text"><i class="bi bi-cash"></i> $${room.pricePerNight} per night</p>
                                                                        <c:if test="${not empty room.offers}">
                                                                            <p class="card-text text-success"><i class="bi bi-tag"></i> ${room.offers}</p>
                                                                        </c:if>
                                                                        <p class="card-text"><i class="bi bi-star"></i> ${room.rating} (${room.reviews} reviews)</p>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <p class="fs-5 text-muted">No tour packages found matching your criteria.</p>
                            <a href="/packages" class="btn btn-outline-primary">Clear Filters</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/JS/scripts.js"></script>
    <script>
        document.getElementById('price-range').addEventListener('input', function() {
            document.getElementById('price-range-value').textContent = '$' + this.value;
        });
    </script>
</body>
</html>