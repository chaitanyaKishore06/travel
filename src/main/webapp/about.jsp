<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy - About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://videos.openai.com/vg-assets/assets%2Ftask_01jx60exj1efyrv12y45yxv55t%2F1749327351_img_0.webp?st=2025-06-07T18%3A53%3A33Z&se=2025-06-13T19%3A53%3A33Z&sks=b&skt=2025-06-07T18%3A53%3A33Z&ske=2025-06-13T19%3A53%3A33Z&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skoid=8ebb0df1-a278-4e2e-9c20-f2d373479b3a&skv=2019-02-02&sv=2018-11-09&sr=b&sp=r&spr=https%2Chttp&sig=ONidY7SgbsKJjVjpzTUwGCsr1Nso8InGXzLwGYmEezo%3D&az=oaivgprodscus');">
        <div class="hero-overlay"></div>
        <div class="container position-relative">
            <div class="max-w-3xl">
                <h1 class="display-3 font-serif fw-bold text-white mb-4">About TravelBuddy</h1>
                <p class="lead text-white-90 mb-4">Crafting extraordinary travel experiences since 2010</p>
            </div>
        </div>
    </section>

    <!-- Our Story -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2 class="section-title">Our Story</h2>
                    <p class="text-muted mb-4">
                        Founded in 2010, TravelBuddy began with a simple vision: to create extraordinary travel experiences for discerning travelers who seek more than just a vacation.
                    </p>
                    <p class="text-muted mb-4">
                        What started as a boutique agency has grown into a globally recognized luxury travel company with offices in New York, London, and Singapore. We remain committed to exceptional service and unforgettable memories.
                    </p>
                    <p class="text-muted">
                        Today, we serve thousands of clients worldwide, crafting bespoke journeys that exceed expectations.
                    </p>
                </div>
                <div class="col-lg-6 position-relative">
                    <img src="https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg" class="rounded shadow-lg w-100" alt="Our team">
                    <div class="position-absolute bottom-0 start-0 bg-white p-3 rounded shadow-lg" style="transform: translate(-20px, 20px);">
                        <p class="font-serif fw-bold text-primary fs-5 mb-0">15+ Years</p>
                        <p class="small text-muted">of Excellence</p>
                    </div>
                    <div class="position-absolute top-0 end-0 bg-white p-3 rounded shadow-lg" style="transform: translate(20px, -20px);">
                        <p class="font-serif fw-bold text-primary fs-5 mb-0">10,000+</p>
                        <p class="small text-muted">Happy Travelers</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Values -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title section-title-centered">Our Values</h2>
                <p class="text-muted">These core principles guide everything we do.</p>
            </div>
            <div class="row">
                <div class="col-md-3 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-award text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-5 fw-bold mb-2">Excellence</h3>
                    <p class="text-muted small">We strive for excellence in every aspect of our service.</p>
                </div>
                <div class="col-md-3 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-person text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-5 fw-bold mb-2">Personalization</h3>
                    <p class="text-muted small">We tailor every journey to your unique preferences.</p>
                </div>
                <div class="col-md-3 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-globe text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-5 fw-bold mb-2">Sustainability</h3>
                    <p class="text-muted small">We are committed to responsible travel practices.</p>
                </div>
                <div class="col-md-3 text-center p-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                        <i class="bi bi-heart text-primary fs-3"></i>
                    </div>
                    <h3 class="font-serif fs-5 fw-bold mb-2">Passion</h3>
                    <p class="text-muted small">Our team shares a genuine passion for travel.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose TravelBuddy Section -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title section-title-centered">Why Choose TravelBuddy for Your Next Journey</h2>
                <p class="text-muted">Discover what sets us apart in luxury travel.</p>
            </div>
            <div class="row">
                <div class="col-md-3 text-center p-4 animate-card" style="animation-delay: 0s;">
                    <div class="card shadow-sm border-0 p-4 h-100">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                            <i class="bi bi-map text-primary fs-3"></i>
                        </div>
                        <h3 class="font-serif fs-5 fw-bold mb-2">Curated Destinations</h3>
                        <p class="text-muted small">Explore hand-picked destinations, from hidden gems to iconic landmarks, tailored to your desires.</p>
                    </div>
                </div>
                <div class="col-md-3 text-center p-4 animate-card" style="animation-delay: 0.2s;">
                    <div class="card shadow-sm border-0 p-4 h-100">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                            <i class="bi bi-headset text-primary fs-3"></i>
                        </div>
                        <h3 class="font-serif fs-5 fw-bold mb-2">24/7 Support</h3>
                        <p class="text-muted small">Our dedicated team is available around the clock to ensure a seamless travel experience.</p>
                    </div>
                </div>
                <div class="col-md-3 text-center p-4 animate-card" style="animation-delay: 0.4s;">
                    <div class="card shadow-sm border-0 p-4 h-100">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                            <i class="bi bi-star text-primary fs-3"></i>
                        </div>
                        <h3 class="font-serif fs-5 fw-bold mb-2">Exclusive Experiences</h3>
                        <p class="text-muted small">Enjoy VIP access, private tours, and unique activities you won’t find anywhere else.</p>
                    </div>
                </div>
                <div class="col-md-3 text-center p-4 animate-card" style="animation-delay: 0.6s;">
                    <div class="card shadow-sm border-0 p-4 h-100">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 64px; height: 64px;">
                            <i class="bi bi-wallet text-primary fs-3"></i>
                        </div>
                        <h3 class="font-serif fs-5 fw-bold mb-2">Competitive Pricing</h3>
                        <p class="text-muted small">Luxury doesn’t have to break the bank—get the best value with our transparent pricing.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6">
                    <h2 class="section-title">Get in Touch</h2>
                    <p class="text-muted mb-4">Have questions or ready to plan your next luxury journey? Our team is here to assist you.</p>
                    <div>
                        <div class="d-flex mb-4">
                            <div class="bg-primary bg-opacity-10 rounded-circle p-3 me-3">
                                <i class="bi bi-geo-alt text-primary fs-5"></i>
                            </div>
                            <div>
                                <h3 class="fs-5 fw-medium">Our Headquarters</h3>
                                <p class="text-muted">IT Park at Banglore</p>
                            </div>
                        </div>
                        <div class="d-flex mb-4">
                            <div class="bg-primary bg-opacity-10 rounded-circle p-3 me-3">
                                <i class="bi bi-telephone text-primary fs-5"></i>
                            </div>
                            <div>
                                <h3 class="fs-5 fw-medium">Call Us</h3>
                                <p class="text-muted">9493929227</p>
                                <p class="text-muted">Monday - Friday: 9:00 AM - 6:00 PM</p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="bg-primary bg-opacity-10 rounded-circle p-3 me-3">
                                <i class="bi bi-envelope text-primary fs-5"></i>
                            </div>
                            <div>
                                <h3 class="fs-5 fw-medium">Email Us</h3>
                                <p class="text-muted">info@TravelBuddy.com</p>
                                <p class="text-muted">bookings@TravelBuddy.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-white rounded shadow p-4">
                        <h3 class="font-serif fs-3 fw-bold text-primary mb-4">Send Us a Message</h3>
                        <form id="contact-form">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Your Name</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-medium">Your Email</label>
                                    <input type="email" class="form-control" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-medium">Subject</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-medium">Your Message</label>
                                    <textarea class="form-control" rows="5" required></textarea>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100 py-3">Send Message</button>
                                </div>
                            </div>
                        </form>
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
            const cards = document.querySelectorAll('.animate-card');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, { threshold: 0.3 });

            cards.forEach(card => observer.observe(card));
        });
    </script>

    <style>
        /* Animation for Why Choose TravelBuddy cards */
        .animate-card {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }

        .animate-card.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Hover effect for cards */
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
    </style>