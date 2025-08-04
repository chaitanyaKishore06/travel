document.addEventListener('DOMContentLoaded', () => {
    const rows = document.querySelectorAll('.table-row');
    rows.forEach((row, index) => {
        row.style.animationDelay = `${index * 0.1}s`;
    });

    const buttons = document.querySelectorAll('.action-button, .add-button');
    buttons.forEach(button => {
        button.addEventListener('click', () => {
            button.style.transform = 'scale(0.95)';
            setTimeout(() => {
                button.style.transform = 'scale(1)';
            }, 100);
        });
    });
});