<%-- privacy-policy.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - Privacy Policy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section animate-fade-in" style="background-image: url('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Privacy Policy</h1>
                <p class="lead text-white-90 mb-4">Your trust matters to us. Learn how we protect your data.</p>
            </div>
        </div>
    </section>

    <!-- Privacy Policy Content -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="animate-slide-in-left">
                        <h2 class="section-title mb-4">Our Commitment to Your Privacy</h2>
                        <p class="text-muted mb-4">
                            At TravelBuddy, we are committed to protecting your personal information and ensuring your privacy. This Privacy Policy outlines how we collect, use, and safeguard your data when you use our services.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">1. Information We Collect</h3>
                        <p class="text-muted mb-4">
                            We collect information you provide directly to us, such as your name, email address, and payment details when you book a tour package. We also collect data automatically, such as your IP address and browsing behavior, to improve our services.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">2. How We Use Your Information</h3>
                        <p class="text-muted mb-4">
                            Your information is used to process bookings, personalize your experience, and send you promotional offers (if you opt-in). We may also use it to analyze trends and improve our website functionality.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">3. Sharing Your Information</h3>
                        <p class="text-muted mb-4">
                            We do not sell your personal data. We may share it with trusted partners (e.g., hotels, airlines) to fulfill your bookings, or as required by law.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">4. Your Rights</h3>
                        <p class="text-muted mb-4">
                            You have the right to access, update, or delete your personal information. Contact us at <a href="mailto:klu@gmial.com" class="text-primary hover-scale">support@TravelBuddy.com</a> to exercise your rights.
                        </p>
                    </div>
                    <div class="animate-slide-in-right">
                        <h3 class="font-serif fs-4 fw-bold mb-3">5. Security Measures</h3>
                        <p class="text-muted mb-4">
                            We use industry-standard encryption and security protocols to protect your data. However, no system is completely secure, and we cannot guarantee absolute security.
                        </p>
                    </div>
                    <div class="animate-slide-in-left">
                        <h3 class="font-serif fs-4 fw-bold mb-3">6. Updates to This Policy</h3>
                        <p class="text-muted mb-4">
                            We may update this Privacy Policy from time to time. The latest version will always be available on this page, with the effective date noted below.
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