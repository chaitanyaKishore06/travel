document.addEventListener('DOMContentLoaded', function() {
    const checkIn = document.querySelector('input[name="checkIn"]');
    const checkOut = document.querySelector('input[name="checkOut"]');
    const daysSelect = document.querySelector('select[name="days"]');

    checkIn.addEventListener('change', updateDays);
    checkOut.addEventListener('change', updateDays);

    function updateDays() {
        if (checkIn.value && checkOut.value) {
            const checkInDate = new Date(checkIn.value);
            const checkOutDate = new Date(checkOut.value);
            const diffTime = Math.abs(checkOutDate - checkInDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
            daysSelect.value = diffDays.toString();
            updateRoomPrices(diffDays);
        }
    }

    function updateRoomPrices(days) {
        document.querySelectorAll('.room-card').forEach(card => {
            const pricePerNight = parseFloat(card.querySelector('.price').textContent.replace('$', '').split(' ')[0]);
            const taxesAndFees = parseFloat(card.querySelector('.price').textContent.match(/\+ \$(\d+)/)[1]);
            const total = (pricePerNight + taxesAndFees) * days;
            card.querySelector('.room-info p:nth-child(5)').textContent = `Total for ${days} nights: $${total}`;
        });
    }
});