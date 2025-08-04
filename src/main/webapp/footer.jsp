<%-- footer.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3 class="font-serif fs-3 fw-bold mb-4">Travel Buddy</h3>
                <p class="text-gray-300 mb-4">
                    Crafting unforgettable luxury travel experiences since 2010.
                </p>
                <div class="d-flex gap-3">
                    <a href="https://www.instagram.com/chaitanya_kishore_0601/" class="social-icon"><i class="bi bi-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/chaitanya-kishore/" class="social-icon"><i class="bi bi-linkedin"></i></a>
                    <a href="https://www.linkedin.com/in/chaitanya-kishore/" class="social-icon"><i class="bi bi-youtube"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <h4 class="font-serif fs-4 fw-bold mb-4">Quick Links</h4>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="/">Home</a></li>
                    <li class="mb-2"><a href="/destinations">Destinations</a></li>
                    <li class="mb-2"><a href="/packages">Tour Packages</a></li>
                    <li class="mb-2"><a href="/booking">Book Now</a></li>
                    <li class="mb-2"><a href="/about">About Us</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h4 class="font-serif fs-4 fw-bold mb-4">Contact Us</h4>
                <ul class="list-unstyled">
                    <li class="d-flex mb-3">
                        <i class="bi bi-geo-alt me-2 mt-1"></i>
                        <span>IT park Banglore Karnataka India</span>
                    </li>
                    <li class="d-flex mb-3">
                        <i class="bi bi-telephone me-2"></i>
                        <span>+91 9652504858</span>
                    </li>
                    <li class="d-flex mb-3">
                        <i class="bi bi-envelope me-2"></i>
                       <a href="mailto:2100031555cseh@gmail.com" class="text-white text-decoration-none">Email</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-3">
                <h4 class="font-serif fs-4 fw-bold mb-4">Newsletter</h4>
                <p class="mb-3 text-gray-300">Subscribe for exclusive offers and travel inspiration.</p>
                <form id="newsletter-form" onsubmit="handleNewsletterSubmit(event)">
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="newsletter-email" placeholder="Your email address" required>
                        <button class="btn btn-secondary" type="submit">Subscribe</button>
                    </div>
                </form>
                <p class="text-gray-400 small">By subscribing, you agree to our Privacy Policy.</p>
                <div id="confirmation-message" class="mt-3" style="display: none;">
                    <div class="bg-light p-3 rounded shadow-sm">
                        <h5 class="font-serif fw-bold text-primary mb-2">🌍 Welcome to TravelBuddy Adventures!</h5>
                        <p class="text-muted small mb-2">
                            <strong>From:</strong> TravelBuddy Team <newsletter@TravelBuddy.com><br>
                            <strong>To:</strong> <span id="user-email-display"></span><br>
                            <strong>Subject:</strong> Your Journey Begins Here! ✈️
                        </p>
                        <p class="text-muted small">
                            Hello Traveler,<br>
                            Thank you for joining the TravelBuddy community! We're thrilled to have you on board. As a special welcome, enjoy a <strong>15% discount</strong> on your first booking with us. Use code: <strong>WELCOME15</strong> at checkout.
                        </p>
                        <p class="text-muted small">
                            Expect monthly updates with exclusive deals, destination highlights, and travel tips to inspire your next adventure. Ready to explore? Check out our latest packages <a href="/packages" class="text-primary">here</a>!
                        </p>
                        <p class="text-muted small">Happy travels,<br>The TravelBuddy Team</p>
                        <button class="btn btn-sm btn-primary" onclick="closeConfirmation()">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <hr class="border-white-20 my-5">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
            <p class="text-gray-400 small mb-0">© 2025 TravelBuddy. All rights reserved.</p>
            <div class="d-flex gap-4">
                <a href="/privacy-policy.jsp" class="text-gray-400 small">Privacy Policy</a>
                <a href="/terms-conditions.jsp" class="text-gray-400 small">Terms & Conditions</a>
                <a href="/faq.jsp" class="text-gray-400 small">FAQ</a>
            </div>
        </div>
    </div>
</footer>

<script>
function handleNewsletterSubmit(event) {
    event.preventDefault();
    const emailInput = document.getElementById('newsletter-email');
    const email = emailInput.value.trim();
    const confirmationMessage = document.getElementById('confirmation-message');
    const userEmailDisplay = document.getElementById('user-email-display');

    // Simple email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email) {
        alert('Please enter an email address.');
        return;
    }
    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        return;
    }

    // Display the fake confirmation email
    userEmailDisplay.textContent = email;
    confirmationMessage.style.display = 'block';
    emailInput.value = ''; // Clear the input field
}

function closeConfirmation() {
    const confirmationMessage = document.getElementById('confirmation-message');
    confirmationMessage.style.display = 'none';
}
</script>

<style>
/* Match the Subscribe button color to the screenshot (orange) */
#newsletter-form .btn-secondary {
    background-color: var(--secondary); /* #f39c12 from styles.css */
    border-color: var(--secondary);
    color: white;
}

#newsletter-form .btn-secondary:hover {
    background-color: #d88a10; /* Hover color from styles.css */
    border-color: #d88a10;
}

/* Animation for confirmation message */
#confirmation-message {
    animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive adjustments */
@media (max-width: 767px) {
    #confirmation-message {
        margin-top: 1rem;
    }
}
</style>