<%-- terms-conditions.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Terms & Conditions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section animate-fade-in" style="background-image: url('https://images.pexels.com/photos/318548/pexels-photo-318548.jpeg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Terms & Conditions</h1>
                <p class="lead text-white-90 mb-4">Understand the rules that govern our services.</p>
            </div>
        </div>
    </section>

    <!-- Terms & Conditions Content -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="animate-slide-in-left">
                        <h2 class="section-title mb-4">Our Service Agreement</h2>
                        <p class="text-muted mb-4">
                            By using TravelBuddy services, you agree to the following terms and conditions. Please read them carefully.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">1. Booking and Payment</h3>
                        <p class="text-muted mb-4">
                            All bookings must be paid in full at the time of reservation. We accept major credit cards and online payment methods. Prices are subject to change without notice.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">2. Cancellations and Refunds</h3>
                        <p class="text-muted mb-4">
                            Cancellations made 30 days or more before departure are eligible for a full refund, minus a 10% processing fee. Cancellations within 30 days are non-refundable.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">3. Travel Insurance</h3>
                        <p class="text-muted mb-4">
                            We strongly recommend purchasing travel insurance to cover unexpected events such as trip cancellations, medical emergencies, or lost luggage.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">4. Liability</h3>
                        <p class="text-muted mb-4">
                            TravelBuddy is not liable for any loss, injury, or damage incurred during your trip due to circumstances beyond our control, such as natural disasters or third-party actions.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">5. Governing Law</h3>
                        <p class="text-muted mb-4">
                            These terms are governed by the laws of India. Any disputes will be resolved in the courts of Bangalore, Karnataka.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">6. Updates to Terms</h3>
                        <p class="text-muted mb-4">
                            We may update these Terms & Conditions periodically. The latest version will be posted on this page with the effective date.
                        </p>
                        <p class="text-muted small">Last updated: June 08, 2025</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/JS/scripts.js"></script>
    <script>
        // Scroll animation trigger
        document.addEventListener('DOMContentLoaded', function () {
            const elements = document.querySelectorAll('.animate-slide-in-left, .animate-slide-in-right');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, { threshold: 0.2 });

            elements.forEach(element => observer.observe(element));
        });
    </script>

    <style>
        /* Fade-in animation for hero section */
        .animate-fade-in {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Slide-in animations */
        .animate-slide-in-left {
            opacity: 0;
            transform: translateX(-50px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }

        .animate-slide-in-right {
            opacity: 0;
            transform: translateX(50px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }

        .animate-slide-in-left.visible,
        .animate-slide-in-right.visible {
            opacity: 1;
            transform: translateX(0);
        }

        /* Hover effect for links */
        .hover-scale {
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .hover-scale:hover {
            transform: scale(1.05);
            color: #d88a10 !important; /* Matches secondary color hover */
        }
    </style>