document.addEventListener('DOMContentLoaded', () => {
    // Add scroll animation for elements
    const elements = document.querySelectorAll('.package-card, .room-card, .offering-item');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animationPlayState = 'running';
            }
        });
    }, { threshold: 0.1 });

    elements.forEach(element => {
        observer.observe(element);
    });
});