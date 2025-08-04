<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelLux - Edit Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/book.css" rel="stylesheet">
    <style>
        .container {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn {
            padding: 10px 20px;
            margin-right: 10px;
            border-radius: 4px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        img {
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .alert {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <!-- Edit Room Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="mb-4">Edit Room</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>
                    <form:form action="/admin/rooms/update" method="post" modelAttribute="room">
                        <form:hidden path="id"/>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <form:input path="name" class="form-control" value="${room.name}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="tour" class="form-label">Tour Package</label>
                            <form:select path="tour.id" class="form-select" required="true">
                                <form:option value="" label="Select Tour Package"/>
                                <c:forEach var="tourPackage" items="${packages}">
                                    <form:option value="${tourPackage.id}" label="${tourPackage.title}"/>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="mb-3">
                            <label for="size" class="form-label">Size</label>
                            <form:input path="size" class="form-control" value="${room.size}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="bedType" class="form-label">Bed Type</label>
                            <form:input path="bedType" class="form-control" value="${room.bedType}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="pricePerNight" class="form-label">Price Per Night ($)</label>
                            <form:input path="pricePerNight" type="number" step="0.01" class="form-control" value="${room.pricePerNight}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="originalPrice" class="form-label">Original Price ($)</label>
                            <form:input path="originalPrice" type="number" step="0.01" class="form-control" value="${room.originalPrice}"/>
                        </div>
                        <div class="mb-3">
                            <label for="taxesAndFees" class="form-label">Taxes and Fees ($)</label>
                            <form:input path="taxesAndFees" type="number" step="0.01" class="form-control" value="${room.taxesAndFees}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="amenities" class="form-label">Amenities</label>
                            <form:input path="amenities" class="form-control" value="${room.amenities}" placeholder="e.g., Heater,Free WiFi" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="offers" class="form-label">Offers</label>
                            <form:input path="offers" class="form-control" value="${room.offers}" placeholder="e.g., 10% off Spa,Free Breakfast"/>
                        </div>
                        <div class="mb-3">
                            <label for="rating" class="form-label">Rating</label>
                            <form:input path="rating" type="number" step="0.1" class="form-control" value="${room.rating}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="reviews" class="form-label">Reviews</label>
                            <form:input path="reviews" type="number" class="form-control" value="${room.reviews}" required="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">Image URL</label>
                            <form:input path="imageUrl" class="form-control" value="${room.imageUrl}"/>
                            <c:if test="${not empty room.imageUrl}">
                                <img src="${room.imageUrl}" alt="${room.name}" style="width: 100px; height: 100px; object-fit: cover; margin-top: 10px;">
                            </c:if>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <a href="/admin/rooms" class="btn btn-secondary ms-2">Cancel</a>
                    </form:form>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/JS/book.js"></script>
</body>
</html>