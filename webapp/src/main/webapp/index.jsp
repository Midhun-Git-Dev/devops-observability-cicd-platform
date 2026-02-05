<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime – Movies, Events & More</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0a0a0a;
            color: #f5f5f5;
            line-height: 1.5;
        }

        /* Header */
        header {
            background: #000;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }

        .top-nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 5vw;
            flex-wrap: wrap;
            gap: 15px;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            color: #ff2d55;
            letter-spacing: -0.5px;
        }

        .nav-controls {
            display: flex;
            align-items: center;
            gap: 20px;
            flex: 1;
            justify-content: flex-end;
        }

        .location-select {
            background: #111;
            color: #ddd;
            border: 1px solid #333;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .search-container {
            position: relative;
            flex: 1;
            max-width: 480px;
        }

        .search-input {
            width: 100%;
            padding: 11px 16px 11px 44px;
            background: #111;
            border: 1px solid #333;
            border-radius: 8px;
            color: white;
            font-size: 15px;
        }

        .search-input::placeholder {
            color: #888;
        }

        .search-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }

        .auth-btn {
            background: #ff2d55;
            color: white;
            border: none;
            padding: 9px 22px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .auth-btn:hover {
            background: #d91e45;
        }

        /* Hero Banner */
        .hero {
            height: 460px;
            background: linear-gradient(90deg, #0f1a36 45%, transparent 70%);
            position: relative;
            display: flex;
            align-items: center;
        }

        .hero-content {
            padding-left: 7vw;
            max-width: 600px;
            z-index: 2;
        }

        .hero-title {
            font-size: 52px;
            font-weight: 900;
            line-height: 1.05;
            margin-bottom: 16px;
        }

        .hero-subtitle {
            font-size: 22px;
            color: #ccc;
            margin-bottom: 28px;
        }

        .hero-poster {
            position: absolute;
            right: 7vw;
            top: 50%;
            transform: translateY(-50%);
            width: 320px;
            border-radius: 12px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.9);
        }

        /* Sections */
        .section {
            padding: 60px 7vw;
        }

        .section-title {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 32px;
            color: #fff;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 28px;
        }

        .card {
            background: #111;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.25s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(255,45,85,0.22);
        }

        .card img {
            width: 100%;
            height: 310px;
            object-fit: cover;
        }

        .card-body {
            padding: 14px 12px;
            text-align: center;
        }

        .card-title {
            font-size: 17px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .card-meta {
            font-size: 13px;
            color: #aaa;
            margin-bottom: 10px;
        }

        .rating-badge {
            background: #ff2d55;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 700;
            display: inline-block;
            margin: 6px 0;
        }

        .btn-book {
            background: #ff2d55;
            border: none;
            width: 100%;
            padding: 12px;
            color: white;
            font-weight: 600;
            border-radius: 0 0 12px 12px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-book:hover {
            background: #d91e45;
        }

        /* Footer */
        footer {
            background: #000;
            padding: 50px 7vw 30px;
            text-align: center;
            color: #888;
            font-size: 14px;
        }

        .footer-links a {
            color: #bbb;
            margin: 0 16px;
            text-decoration: none;
        }

        .footer-links a:hover {
            color: #ff2d55;
        }

        .social-icons {
            margin: 24px 0 16px;
        }

        .social-icons i {
            font-size: 22px;
            margin: 0 14px;
            color: #ff2d55;
        }

        /* Responsive */
        @media (max-width: 1100px) {
            .hero { height: 400px; }
            .hero-title { font-size: 42px; }
            .hero-poster { right: 5vw; width: 280px; }
        }

        @media (max-width: 900px) {
            .top-nav {
                flex-direction: column;
                gap: 16px;
                padding: 16px 5vw;
            }
            .search-container {
                order: -1;
                width: 100%;
                max-width: none;
            }
            .nav-controls {
                justify-content: center;
                width: 100%;
            }
            .hero {
                background: #0f1a36;
                text-align: center;
            }
            .hero-content {
                padding: 0 5vw;
            }
            .hero-poster {
                position: static;
                margin: 30px auto;
                transform: none;
            }
        }
    </style>
</head>
<body>

    <!-- Header / Navbar -->
    <header>
        <div class="top-nav">
            <div class="logo">ShowTime</div>

            <div class="search-container">
                <i class="fa-solid fa-magnifying-glass search-icon"></i>
                <input type="text" class="search-input" placeholder="Search for Movies, Events, Plays, Sports">
            </div>

            <div class="nav-controls">
                <select class="location-select">
                    <option>Bangalore</option>
                    <option>Chennai</option>
                    <option>Hyderabad</option>
                    <option>Mumbai</option>
                </select>
                <button class="auth-btn">Login / Signup</button>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-content">
            <div class="hero-title">Now Showing</div>
            <div class="hero-subtitle">Upcoming Movies & Events</div>
        </div>
        <img class="hero-poster" src="https://picsum.photos/320/480?random=88" alt="Featured Movie">
    </div>

    <!-- Movies Section -->
    <section class="section">
        <h2 class="section-title">Movies</h2>
        <div class="cards-grid">
            <div class="card">
                <img src="https://picsum.photos/220/320?random=11" alt="Movie 1">
                <div class="card-body">
                    <div class="card-title">Movie Title 1</div>
                    <div class="card-meta">Action, Thriller • English</div>
                    <div class="rating-badge">8.5</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=12" alt="Movie 2">
                <div class="card-body">
                    <div class="card-title">Movie Title 2</div>
                    <div class="card-meta">Comedy, Drama • Hindi</div>
                    <div class="rating-badge">7.8</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=13" alt="Movie 3">
                <div class="card-body">
                    <div class="card-title">Movie Title 3</div>
                    <div class="card-meta">Sci-Fi, Adventure • English</div>
                    <div class="rating-badge">9.1</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=14" alt="Movie 4">
                <div class="card-body">
                    <div class="card-title">Movie Title 4</div>
                    <div class="card-meta">Horror, Mystery • Tamil</div>
                    <div class="rating-badge">6.9</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Events Section -->
    <section class="section">
        <h2 class="section-title">Events</h2>
        <div class="cards-grid">
            <div class="card">
                <img src="https://picsum.photos/220/320?random=21" alt="Comedy">
                <div class="card-body">
                    <div class="card-title">Comedy Shows</div>
                    <div class="card-meta">Stand-up & Live Comedy</div>
                    <div class="rating-badge">Live</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=22" alt="Concert">
                <div class="card-body">
                    <div class="card-title">Live Concerts</div>
                    <div class="card-meta">Music Festivals & Gigs</div>
                    <div class="rating-badge">Live</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=23" alt="Sports">
                <div class="card-body">
                    <div class="card-title">Sports Events</div>
                    <div class="card-meta">Cricket, Football & More</div>
                    <div class="rating-badge">Live</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <img src="https://picsum.photos/220/320?random=24" alt="Theatre">
                <div class="card-body">
                    <div class="card-title">Theatre Plays</div>
                    <div class="card-meta">Drama & Performances</div>
                    <div class="rating-badge">Live</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-youtube"></i>
        </div>
        <div class="footer-links">
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Terms & Conditions</a>
            <a href="#">Privacy Policy</a>
        </div>
        <p style="margin-top: 24px;">© 2026 ShowTime. All rights reserved.</p>
    </footer>

    <!-- Minimal banner auto-change (optional) -->
    <script>
        // You can add more images here if you want a rotating hero banner
        const posters = [
            "https://picsum.photos/320/480?random=88",
            "https://picsum.photos/320/480?random=89",
            "https://picsum.photos/320/480?random=90"
        ];
        let idx = 0;
        const heroPoster = document.querySelector('.hero-poster');

        setInterval(() => {
            idx = (idx + 1) % posters.length;
            heroPoster.src = posters[idx];
        }, 6000);
    </script>

</body>
</html>
