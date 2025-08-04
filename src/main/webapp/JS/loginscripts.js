// scripts.js
$(document).ready(function () {
    // Navbar scroll effect
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('nav').addClass('bg-white shadow-sm').removeClass('bg-transparent');
            $('nav .btn').removeClass('text-white').addClass('text-primary');
        } else {
            $('nav').removeClass('bg-white shadow-sm').addClass('bg-transparent');
            $('nav .btn').removeClass('text-primary').addClass('text-white');
        }
    });

    // Login form animation
    $('#login-form').on('submit', function (e) {
        e.preventDefault();
        const $btn = $('.login-btn');
        $btn.removeClass('animate__pulse animate__infinite').addClass('animate__bounce');
        setTimeout(() => {
            this.submit(); // Proceed with form submission
        }, 500);
    });

    // Background animations with Anime.js
    anime({
        targets: '.plane-animation',
        translateX: ['-10%', '110%'],
        translateY: [0, -50],
        rotate: 15,
        duration: 10000,
        easing: 'linear',
        loop: true
    });

    anime({
        targets: '.cloud1',
        translateX: ['20%', '80%'],
        translateY: [0, 20],
        scale: [1, 1.2],
        duration: 8000,
        easing: 'easeInOutSine',
        direction: 'alternate',
        loop: true
    });

    anime({
        targets: '.cloud2',
        translateX: ['60%', '20%'],
        translateY: [0, -30],
        scale: [1, 1.3],
        duration: 12000,
        easing: 'easeInOutSine',
        direction: 'alternate',
        loop: true
    });

    anime({
        targets: '.cloud3',
        translateX: ['40%', '60%'],
        translateY: [0, 10],
        scale: [1, 1.1],
        duration: 10000,
        easing: 'easeInOutSine',
        direction: 'alternate',
        loop: true
    });
});