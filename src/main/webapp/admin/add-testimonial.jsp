<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Testimonial</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error { color: red; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Testimonial</h2>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
        <form:form modelAttribute="testimonial" method="post" action="${pageContext.request.contextPath}/admin/testimonials/add">
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <form:input path="name" class="form-control" required="true"/>
                <form:errors path="name" cssClass="error"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Comment:</label>
                <form:textarea path="comment" class="form-control" rows="4" required="true"/>
                <form:errors path="comment" cssClass="error"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Rating (1-5):</label>
                <form:input path="rating" type="number" min="1" max="5" class="form-control" required="true"/>
                <form:errors path="rating" cssClass="error"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Image URL:</label>
                <form:input path="imageUrl" class="form-control" required="true"/>
                <form:errors path="imageUrl" cssClass="error"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Location (optional):</label>
                <form:input path="location" class="form-control"/>
                <form:errors path="location" cssClass="error"/>
            </div>
            <button type="submit" class="btn btn-primary">Add Testimonial</button>
        </form:form>
    </div>
</body>
</html>