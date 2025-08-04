// scripts.js (updated)
$(document).ready(function () {
    // Existing code from the first half...
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('header').addClass('bg-white shadow-sm').removeClass('bg-transparent');
            $('header .navbar-brand, header .nav-link').removeClass('text-white').addClass('text-primary');
            $('header .mobile-toggle').removeClass('text-white').addClass('text-primary');
        } else {
            $('header').removeClass('bg-white shadow-sm').addClass('bg-transparent');
            $('header .navbar-brand, header .nav-link').removeClass('text-primary').addClass('text-white');
            $('header .mobile-toggle').removeClass('text-primary').addClass('text-white');
        }
    });

    $('#package-filter-form').on('submit', function (e) {
        e.preventDefault();
        const search = $('#search').val();
        const destination = $('#destination').val();
        const duration = $('#duration').val();
        const priceMax = $('#price-range').val();
        const priceMin = 0;

        window.location.href = `/packages?search=${search}&destination=${destination}&duration=${duration}&priceMin=${priceMin}&priceMax=${priceMax}`;
    });

    $('#price-range').on('input', function () {
        $('#price-range-value').text(`$${$(this).val()}`);
    });

    $('#newsletter-form').on('submit', function (e) {
        e.preventDefault();
        alert('Thank you for subscribing to our newsletter!');
        $(this).trigger('reset');
    });

    // New: Destination filter form submission
    $('#destination-filter-form').on('submit', function (e) {
        e.preventDefault();
        const search = $('#search-dest').val();
        const country = $('#country').val();
        window.location.href = `/destinations?search=${search}&country=${country}`;
    });

    // New: Booking form validation
    $('#booking-form').on('submit', function (e) {
        const travelDate = $('#travelDate').val();
        const today = new Date().toISOString().split('T')[0];
        if (travelDate < today) {
            e.preventDefault();
            alert('Travel date must be in the future.');
        }
    });

    // New: Contact form submission (mock)
    $('#contact-form').on('submit', function (e) {
        e.preventDefault();
        alert('Thank you for your message! We will get back to you soon.');
        $(this).trigger('reset');
    });
});