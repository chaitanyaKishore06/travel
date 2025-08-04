<%-- admin/add-destination.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Add Destination</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../admin/adminnavbar.jsp"/>
    <section class="py-5">
        <div class="container">
            <h2 class="font-serif fs-3 fw-bold text-primary mb-4">Add New Destination</h2>
            <form:form modelAttribute="destination" method="post" action="/admin/destinations/add">
                <div class="mb-3">
                    <label class="form-label small fw-medium">Name *</label>
                    <form:input path="name" class="form-control" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Country *</label>
                    <form:input path="country" class="form-control" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Description *</label>
                    <form:textarea path="description" class="form-control" rows="4" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Image URL *</label>
                    <form:input path="imageUrl" class="form-control" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Rating *</label>
                    <form:input path="rating" type="number" step="0.1" min="0" max="5" class="form-control" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Best Time to Visit *</label>
                    <form:input path="bestTimeToVisit" class="form-control" required="true"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Activities (comma-separated)</label>
                    <form:textarea path="activities" class="form-control" rows="2"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Top Attractions (comma-separated)</label>
                    <form:textarea path="topAttractions" class="form-control" rows="2"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Local Cuisine (comma-separated)</label>
                    <form:textarea path="localCuisine" class="form-control" rows="2"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Travel Tips</label>
                    <form:textarea path="travelTips" class="form-control" rows="3"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Cultural Etiquette</label>
                    <form:textarea path="culturalEtiquette" class="form-control" rows="3"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Approximate Costs</label>
                    <form:textarea path="approximateCosts" class="form-control" rows="3"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Weather Details</label>
                    <form:textarea path="weatherDetails" class="form-control" rows="3"/>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-medium">Hidden Gem</label>
                    <form:input path="hiddenGem" class="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary w-100 py-3">Add Destination</button>
            </form:form>
        </div>
    </section>
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/JS/scripts.js"></script>
</body>
</html>