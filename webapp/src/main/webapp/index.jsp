<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime - Movies, Events, Plays & More</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }
        body {
            background-color: #0f0f0f;
            color: #fff;
            line-height: 1.5;
        }
        a { text-decoration: none; color: inherit; }

        /* Header */
        header {
            background: linear-gradient(to bottom, #000, #111);
            padding: 15px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #e50914; /* Netflix-red like accent, close to BMS red */
        }
        .nav-right {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        .location {
            background: #222;
            border: none;
            color: #ddd;
            padding: 10px 15px;
            border-radius: 6px;
            font-size: 14px;
        }
        .search-container {
            position: relative;
            width: 450px;
        }
        .search-bar {
            width: 100%;
            padding: 12px 20px 12px 45px;
            background: #222;
            border: none;
            border-radius: 30px;
            color: #fff;
            font-size: 15px;
        }
        .search-bar::placeholder { color: #888; }
        .search-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        .login-btn {
            background: #e50914;
            border: none;
            padding: 10px 24px;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        /* Hero Banner - larger, promotional style */
        .hero {
            position: relative;
            height: 520px;
            overflow: hidden;
        }
        .hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.7);
        }
        .hero-overlay {
            position: absolute;
            bottom: 60px;
            left: 60px;
            max-width: 600px;
            background: rgba(0,0,0,0.6);
            padding: 30px;
            border-radius: 12px;
        }
        .hero-overlay h1 {
            font-size: 48px;
            margin-bottom: 12px;
        }
        .hero-overlay p {
            font-size: 22px;
            color: #ddd;
        }

        /* Sections */
        section {
            padding: 50px 40px;
        }
        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            color: #fff;
            font-weight: 600;
        }
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
        }
        .card {
            position: relative;
            background: #1a1a1a;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(229,9,20,0.3);
        }
        .card img {
            width: 100%;
            height: 320px;
            object-fit: cover;
        }
        .card-info {
            padding: 15px;
            text-align: center;
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 8px;
        }
        .card-details {
            font-size: 13px;
            color: #bbb;
            margin-bottom: 10px;
        }
        .rating-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: #e50914;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }
        .book-btn {
            background: #e50914;
            border: none;
            width: 100%;
            padding: 14px;
            color: white;
            font-size: 15px;
            font-weight: bold;
            border-radius: 0 0 12px 12px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .book-btn:hover { background: #b20710; }

        /* Events - slightly different accent */
        .event-grid .card {
            border: 1px solid #333;
        }
        .event-grid .book-btn {
            background: #0066cc;
        }
        .event-grid .book-btn:hover {
            background: #0055aa;
        }

        /* Footer */
        footer {
            background: #000;
            padding: 40px 40px 20px;
            text-align: center;
            color: #888;
            font-size: 14px;
        }
        .footer-links a {
            margin: 0 15px;
            color: #ccc;
        }
        .social-icons i {
            font-size: 24px;
            margin: 0 15px;
            color: #e50914;
        }

        @media (max-width: 1024px) {
            header { flex-direction: column; gap: 15px; padding: 15px 20px; }
            .search-container { width: 100%; max-width: none; }
            .hero { height: 400px; }
            .hero-overlay { left: 20px; bottom: 40px; padding: 20px; }
            .hero-overlay h1 { font-size: 36px; }
        }
        @media (max-width: 768px) {
            .hero { height: 300px; }
            .hero-overlay h1 { font-size: 28px; }
            .hero-overlay p { font-size: 16px; }
            section { padding: 30px 20px; }
        }
    </style>
</head>
<body>

    <header>
        <div class="logo">ShowTime</div>
        <div class="nav-right">
            <select class="location">
                <option>Bangalore</option>
                <option>Chennai</option>
                <option>Hyderabad</option>
                <option>Mumbai</option>
            </select>
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-bar" placeholder="Search for Movies, Events, Plays, Sports">
            </div>
            <button class="login-btn">Sign In</button>
        </div>
    </header>

    <!-- Hero - more like BookMyShow promo banner -->
    <div class="hero">
        <img id="banner-slider" src="https://picsum.photos/1920/1080?random=20" alt="Promo Banner">
        <div class="hero-overlay">
            <h1>LOVE IS SHARING YOUR POPCORN</h1>
            <p>Book your tickets & enjoy the magic of cinema</p>
        </div>
    </div>

    <!-- Movies - Recommended style -->
    <section>
        <h2>Recommended Movies</h2>
        <div class="movie-grid">
            <div class="card">
                <span class="rating-badge">8.5</span>
                <img src="https://picsum.photos/220/320?random=1" alt="Movie 1">
                <div class="card-info">
                    <h3>Movie Title 1</h3>
                    <div class="card-details">Action, Thriller • English • 2D</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <span class="rating-badge">7.2</span>
                <img src="https://picsum.photos/220/320?random=2" alt="Movie 2">
                <div class="card-info">
                    <h3>Movie Title 2</h3>
                    <div class="card-details">Comedy, Drama • Hindi • 2D</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <span class="rating-badge">9.0</span>
                <img src="https://picsum.photos/220/320?random=3" alt="Movie 3">
                <div class="card-info">
                    <h3>Movie Title 3</h3>
                    <div class="card-details">Sci-Fi, Adventure • English • IMAX</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <span class="rating-badge">6.8</span>
                <img src="https://picsum.photos/220/320?random=4" alt="Movie 4">
                <div class="card-info">
                    <h3>Movie Title 4</h3>
                    <div class="card-details">Horror, Mystery • Tamil • 2D</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Events -->
    <section>
        <h2>Events This Week</h2>
        <div class="event-grid movie-grid">
            <div class="card">
                <img src="https://picsum.photos/220/320?random=5" alt="Comedy">
                <div class="card-info">
                    <h3>Comedy Shows</h3>
                    <div class="card-details">Stand-up Night • English/Hindi</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <!-- Add 3 more similar event cards if needed -->
            <div class="card">
                <img src="https://picsum.photos/220/320?random=6" alt="Concert">
                <div class="card-info">
                    <h3>Live Concerts</h3>
                    <div class="card-details">Rock Festival • Multi-language</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=7" alt="Sports">
                <div class="card-info">
                    <h3>Sports Events</h3>
                    <div class="card-details">Cricket Match • Live</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=8" alt="Theatre">
                <div class="card-info">
                    <h3>Theatre Plays</h3>
                    <div class="card-details">Drama Performance</div>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-youtube"></i>
        </div>
        <div class="footer-links" style="margin: 20px 0;">
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Terms & Conditions</a>
            <a href="#">Privacy Policy</a>
        </div>
        <p>© 2026 ShowTime. All rights reserved.</p>
    </footer>

    <script>
        const banners = [
            "https://picsum.photos/1920/1080?random=20",
            "https://picsum.photos/1920/1080?random=21",
            "https://picsum.photos/1920/1080?random=22"
        ];
        let idx = 0;
        const slider = document.getElementById('banner-slider');
        setInterval(() => {
            idx = (idx + 1) % banners.length;
            slider.src = banners[idx];
        }, 6000);
    </script>
</body>
</html>
