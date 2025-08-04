<%-- faq.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - FAQ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section animate-fade-in" style="background-image: url('https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">Frequently Asked Questions</h1>
                <p class="lead text-white-90 mb-4">Find answers to common questions about our services.</p>
            </div>
        </div>
    </section>

    <!-- FAQ Content -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item animate-slide-in-left">
                            <h2 class="accordion-header" id="faqHeading1">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse1" aria-expanded="true" aria-controls="faqCollapse1">
                                    How do I book a tour package?
                                </button>
                            </h2>
                            <div id="faqCollapse1" class="accordion-collapse collapse show" aria-labelledby="faqHeading1" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    To book a tour package, visit our <a href="/booking" class="text-primary hover-scale">Book Now</a> page, select your desired package, and follow the prompts to complete your booking. You'll need to provide your details and make a payment to confirm.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item animate-slide-in-right">
                            <h2 class="accordion-header" id="faqHeading2">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse2" aria-expanded="false" aria-controls="faqCollapse2">
                                    What is your cancellation policy?
                                </button>
                            </h2>
                            <div id="faqCollapse2" class="accordion-collapse collapse" aria-labelledby="faqHeading2" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Cancellations made 30 days or more before departure are eligible for a full refund, minus a 10% processing fee. Cancellations within 30 days are non-refundable. Please see our <a href="/terms-conditions" class="text-primary hover-scale">Terms & Conditions</a> for more details.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item animate-slide-in-left">
                            <h2 class="accordion-header" id="faqHeading3">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse3" aria-expanded="false" aria-controls="faqCollapse3">
                                    Do you offer travel insurance?
                                </button>
                            </h2>
                            <div id="faqCollapse3" class="accordion-collapse collapse" aria-labelledby="faqHeading3" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    We do not provide travel insurance directly, but we strongly recommend purchasing it to cover unexpected events like trip cancellations or medical emergencies. We can recommend trusted insurance providers upon request.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item animate-slide-in-right">
                            <h2 class="accordion-header" id="faqHeading4">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse4" aria-expanded="false" aria-controls="faqCollapse4">
                                    How can I contact customer support?
                                </button>
                            </h2>
                            <div id="faqCollapse4" class="accordion-collapse collapse" aria-labelledby="faqHeading4" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    You can reach our customer support team via email at <a href="mailto:klu@gmial.com" class="text-primary hover-scale">support@TravelBuddy.com</a> or by phone at +91 9493929227, Monday to Friday, 9:00 AM to 6:00 PM IST.
                                </div>
                            </div>
                        </div>
                        <div class="animate-slide-in-left mt-4">
                            <p class="text-muted">
                                Have more questions? <a href="/about" class="text-primary hover-scale">Contact us</a> for assistance.
                            </p>
                        </div>
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

        /* Accordion animation */
        .accordion-button {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .accordion-button:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
        }

        .accordion-collapse {
            transition: height 0.3s ease;
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