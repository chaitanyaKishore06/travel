<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Package - Admin</title>
    <link rel="stylesheet" href="<c:url value='/css/book.css' />">
    <style>
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, textarea, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
        .photo-preview img {
            max-width: 100px;
            margin: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Package</h2>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <form:form action="${pageContext.request.contextPath}/admin/packages/edit/${tourPackage.id}" method="post" modelAttribute="tourPackage" enctype="multipart/form-data">
            <form:hidden path="id" />
            
            <div class="form-group">
                <label for="title">Title</label>
                <form:input path="title" id="title" required="true" />
                <form:errors path="title" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="location">Location</label>
                <form:input path="location" id="location" required="true" />
                <form:errors path="location" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="duration">Duration</label>
                <form:input path="duration" id="duration" required="true" />
                <form:errors path="duration" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <form:input path="price" id="price" type="number" step="0.01" required="true" />
                <form:errors path="price" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="originalPrice">Original Price (Optional)</label>
                <form:input path="originalPrice" id="originalPrice" type="number" step="0.01" />
                <form:errors path="originalPrice" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="rating">Rating</label>
                <form:input path="rating" id="rating" type="number" step="0.1" min="0" max="5" />
                <form:errors path="rating" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="reviews">Reviews</label>
                <form:input path="reviews" id="reviews" type="number" min="0" />
                <form:errors path="reviews" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="discount">Discount (%)</label>
                <form:input path="discount" id="discount" type="number" min="0" max="100" />
                <form:errors path="discount" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="highlights">Highlights (comma-separated)</label>
                <form:input path="highlights" id="highlights" />
                <form:errors path="highlights" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="itinerary">Itinerary (comma-separated)</label>
                <form:input path="itinerary" id="itinerary" />
                <form:errors path="itinerary" cssClass="error"/>
            </div>

            <div class="form-group">
                <label for="image">Update Image</label>
                <input type="file" id="image" name="image" accept="image/*"/>
                <c:if test="${not empty tourPackage.imageUrl}">
                    <div class="photo-preview">
                        <img src="${tourPackage.imageUrl}" alt="Current Image" 
                             onerror="this.src='https://via.placeholder.com/100?text=No+Image'; this.onerror=null;" />
                    </div>
                </c:if>
                <form:input path="imageUrl" type="hidden" />
            </div>

            <div class="form-group">
                <label for="featured">Featured</label>
                <form:checkbox path="featured" id="featured" cssClass="form-check-input" />
                <form:errors path="featured" cssClass="error"/>
            </div>

            <button type="submit" class="btn">Update Package</button>
        </form:form>

        <div class="form-group">
            <a href="${pageContext.request.contextPath}/admin/packages" class="btn">Back to Packages</a>
        </div>
    </div>
</body>
</html>
