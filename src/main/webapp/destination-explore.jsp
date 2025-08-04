<%-- destination-explore.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Explore ${destination.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section position-relative" style="background-image: url('${destination.imageUrl}'); height: 60vh;">
        <div class="hero-overlay"></div>
        <div class="container position-relative text-white">
            <h1 class="display-4 font-serif fw-bold mb-2">${destination.name}</h1>
            <p class="lead"><i class="bi bi-geo-alt me-1"></i>${destination.country}</p>
            <div class="d-flex align-items-center">
                <i class="bi bi-star-fill text-warning me-1"></i>
                <span>${destination.rating}</span>
            </div>
        </div>
    </section>

    <!-- Destination Details Section -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <h2 class="font-serif fs-3 fw-bold text-primary mb-3">What to Expect</h2>
                    <p>${destination.description}</p>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Top Attractions</h2>
                    <ul class="list-unstyled">
                        <c:forEach var="attraction" items="${destination.topAttractions}">
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-primary me-2"></i>${attraction}</li>
                        </c:forEach>
                    </ul>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Local Cuisine to Try</h2>
                    <ul class="list-unstyled">
                        <c:forEach var="cuisine" items="${destination.localCuisine}">
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-primary me-2"></i>${cuisine}</li>
                        </c:forEach>
                    </ul>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Travel Tips</h2>
                    <p>${destination.travelTips}</p>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Cultural Etiquette</h2>
                    <p>${destination.culturalEtiquette}</p>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Approximate Costs</h2>
                    <p>${destination.approximateCosts}</p>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Weather in ${destination.bestTimeToVisit}</h2>
                    <p>${destination.weatherDetails}</p>

                    <h2 class="font-serif fs-3 fw-bold text-primary mt-5 mb-3">Hidden Gem</h2>
                    <p>${destination.hiddenGem}</p>
                </div>
                <div class="col-lg-4">
                    <div class="card shadow-sm p-4 sticky-top" style="top: 20px;">
                        <h5 class="font-serif fw-bold text-primary mb-3">Quick Info</h5>
                        <p><strong>Best Time to Visit:</strong> ${destination.bestTimeToVisit}</p>
                        <p><strong>Activities:</strong></p>
                        <div class="d-flex flex-wrap gap-2 mb-3">
                            <c:forEach var="activity" items="${destination.activities}">
                                <span class="badge bg-light text-dark">${activity}</span>
                            </c:forEach>
                        </div>
                        <a href="/booking" class="btn btn-primary w-100">Book a Trip</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/JS/scripts.js"></script>
</body>
</html>