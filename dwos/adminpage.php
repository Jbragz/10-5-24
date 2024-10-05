<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="adminpage.css" />
    <title>Admin Page</title>
</head>
<body>
    <?php include 'adminnavbar.php'; ?>

    <!-- Container for Top Selling and Top Subscriber -->
    <div class="home-container">
        <!-- Top Selling Section -->
        <section class="top-selling">
            <h2>TOP SELLING</h2>
            <ul class="list">
                <li class="home"><span class="home-id">1.</span>Water</li>
                <li class="home"><span class="home-id">2.</span>2beg</li>
                <li class="home"><span class="home-id">3.</span>Lee REFILLING STATION</li>
                <li class="home hidden"><span class="home-id">4.</span>Waturrrr</li>
                <li class="home hidden"><span class="home-id">5.</span>Bongga</li>
                <li class="home hidden"><span class="home-id">6.</span>Inomi na</li>
            </ul>
            <div class="show-all">
                <button class="btn" data-modal="top-selling-modal">Show All</button>
            </div>
        </section>

        <!-- Top Subscribers Section -->
        <section class="top-subscriber">
            <h2>TOP SUBSCRIBERS</h2>
            <ul class="list">
                <li class="home"><span class="home-id">1.</span>Subscriber One</li>
                <li class="home"><span class="home-id">2.</span>Subscriber Two</li>
                <li class="home"><span class="home-id">3.</span>Subscriber Three</li>
                <li class="home hidden"><span class="home-id">4.</span>Subscriber Four</li>
                <li class="home hidden"><span class="home-id">5.</span>Subscriber Five</li>
                <li class="home hidden"><span class="home-id">6.</span>Subscriber Six</li>
            </ul>
            <div class="show-all">
                <button class="btn" data-modal="top-subscriber-modal">Show All</button>
            </div>
        </section>
    </div>

    <!-- Modal for Top Selling -->
    <div id="top-selling-modal" class="modal">
        <div class="modal-content">
            <span class="close-button" data-close="top-selling-modal">&times;</span>
            <h2>ALL TOP SELLING ITEMS</h2>
            <ul class="full-list">
                <li><span class="home-id">1.</span>Water</li>
                <li><span class="home-id">2.</span>2beg</li>
                <li><span class="home-id">3.</span>Lee REFILLING STATION</li>
                <li><span class="home-id">4.</span>Waturrrr</li>
                <li><span class="home-id">5.</span>Bongga</li>
                <li><span class="home-id">6.</span>Inomi na</li>
                <!-- Add more items as needed -->
            </ul>
        </div>
    </div>

    <!-- Modal for Top Subscribers -->
    <div id="top-subscriber-modal" class="modal">
        <div class="modal-content">
            <span class="close-button" data-close="top-subscriber-modal">&times;</span>
            <h2>ALL TOP SUBSCRIBERS</h2>
            <ul class="full-list">
                <li><span class="home-id">1.</span>Subscriber One</li>
                <li><span class="home-id">2.</span>Subscriber Two</li>
                <li><span class="home-id">3.</span>Subscriber Three</li>
                <li><span class="home-id">4.</span>Subscriber Four</li>
                <li><span class="home-id">5.</span>Subscriber Five</li>
                <li><span class="home-id">6.</span>Subscriber Six</li>
                <li><span class="home-id">7.</span>Subscriber Seven</li>
                <li><span class="home-id">8.</span>Subscriber Eight</li>
                <li><span class="home-id">9.</span>Subscriber Nine</li>
                <li><span class="home-id">10.</span>Subscriber Ten</li>
                <!-- Add more subscribers as needed -->
            </ul>
        </div>
    </div>

    <script>
    // Function to open modal
    function openModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.style.display = 'flex'; // Show modal
        }
    }

    // Function to close modal
    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.style.display = 'none'; // Hide modal
        }
    }

    // Attach event listeners to "Show All" buttons
    document.querySelectorAll('.show-all .btn').forEach(button => {
        button.addEventListener('click', () => {
            const modalId = button.getAttribute('data-modal');
            openModal(modalId);
        });
    });

    // Attach event listeners to close buttons
    document.querySelectorAll('.close-button').forEach(button => {
        button.addEventListener('click', () => {
            const modalId = button.getAttribute('data-close');
            closeModal(modalId);
        });
    });

    // Close modal when clicking outside the modal content
    window.addEventListener('click', (event) => {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    });
</script>
</body>
</html>
