<%-- destinations.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Destinations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20240916/pngtree-explore-the-world-pinpoint-your-travel-destinations-on-a-global-map-image_16222384.jpg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Explore Extraordinary Destinations</h1>
                <p class="lead text-white-90 mb-4">Discover handpicked luxury destinations around the world</p>
            </div>
        </div>
    </section>

    <!-- Destinations Section -->
    <section class="py-5">
        <div class="container">
            <!-- Search and Filters -->
            <div class="bg-white rounded shadow p-4 mb-5">
                <form id="destination-filter-form">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-search"></i></span>
                                <input type="text" id="search-dest" name="search" class="form-control" placeholder="Search destinations..." value="${search}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <select id="country" name="country" class="form-select">
                                <option value="">All Regions</option>
                                <c:forEach var="country" items="${countries}">
                                    <option value="${country}" ${country == selectedCountry ? 'selected' : ''}>${country}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3 text-center">
                            <button type="submit" class="btn btn-primary w-100">Apply Filters</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Results -->
            <div>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="font-serif fs-3 fw-bold text-primary">${destinations.size()} Destinations Found</h2>
                    <div class="d-flex align-items-center">
                        <i class="bi bi-funnel me-2 text-muted"></i>
                        <select class="form-select">
                            <option>Sort by Popularity</option>
                            <option>Sort by Rating</option>
                        </select>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty destinations}">
                        <div class="row">
                            <c:forEach var="destination" items="${destinations}">
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
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <p class="fs-5 text-muted">No destinations found matching your criteria.</p>
                            <a href="/destinations" class="btn btn-outline-primary">Clear Filters</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>