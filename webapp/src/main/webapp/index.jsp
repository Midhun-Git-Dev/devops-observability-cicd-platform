<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ShowTime - Movie and Event Ticket Booking Portal">
    <title>ShowTime | Movie & Events Ticket Booking</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --primary-red: #f84464;
            --bg-dark: #1f212a;
            --bg-nav: #333545;
            --text-white: #ffffff;
            --text-gray: #b9b9b9;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #222;
            line-height: 1.6;
        }

        /* Navigation Styling */
        header {
            background-color: var(--bg-nav);
            padding: 12px 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--primary-red);
            text-decoration: none;
            letter-spacing: 1px;
        }

        .search-bar {
            flex-grow: 1;
            max-width: 600px;
            margin: 0 30px;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border-radius: 6px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        .search-bar i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #777;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .location-select {
            background: transparent;
            color: white;
            border: 1px solid #555;
            padding: 5px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-signin {
            background-color: var(--primary-red);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: opacity var(--transition-speed);
        }

        .btn-signin:hover { opacity: 0.9; }

        /* Hero Banner */
        .hero-section {
            background-color: var(--bg-dark);
            padding: 20px 0;
        }

        .banner-container {
            width: 90%;
            max-width: 1240px;
            height: 320px;
            margin: 0 auto;
            border-radius: 12px;
            background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), 
                        url('https://via.placeholder.com/1240x320/222/fff?text=Big+Cinema+Experience+Wait+For+You') center/cover;
            transition: background 0.8s ease-in-out;
        }

        /* Content Grid */
        .main-content {
            width: 90%;
            max-width: 1240px;
            margin: 40px auto;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .grid-layout {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        /* Cards */
        .movie-card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: transform var(--transition-speed);
        }

        .movie-card:hover { transform: translateY(-8px); }

        .poster-wrapper {
            position: relative;
            height: 360px;
        }

        .poster-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .rating-tag {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: rgba(0,0,0,0.7);
            color: #fff;
            padding: 8px 12px;
            font-size: 13px;
            backdrop-filter: blur(5px);
        }

        .card-details { padding: 15px; }
        .movie-name { font-weight: 700; font-size: 1.1rem; margin-bottom: 5px; }
        .movie-meta { color: #666; font-size: 14px; margin-bottom: 15px; }

        .book-btn {
            width: 100%;
            padding: 12px;
            background: var(--primary-red);
            color: #fff;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Footer */
        footer {
            background-color: var(--bg-nav);
            color: var(--text-gray);
            padding: 60px 5% 20px;
            text-align: center;
        }

        .social-bar {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .social-bar i {
            margin: 0 15px;
            cursor: pointer;
            transition: color 0.3s;
        }

        .social-bar i:hover { color: white; }

        .footer-links a {
            color: var(--text-gray);
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }

        .footer-links a:hover { text-decoration: underline; }

        @media (max-width: 768px) {
            .search-bar { display: none; }
            .banner-container { height: 180px; }
        }
    </style>
</head>
<body>

    <header>
        <div class="nav-left" style="display:flex; align-items:center;">
            <a href="#" class="logo">SHOWTIME</a>
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search for Movies, Events, Plays and Sports">
            </div>
        </div>
        <div class="nav-actions">
            <select class="location-select">
                <option>Bengaluru</option>
                <option>Mumbai</option>
                <option>Chennai</option>
                <option>Delhi</option>
            </select>
            <button class="btn-signin">Sign In</button>
        </div>
    </header>

    <section class="hero-section">
        <div class="banner-container" id="mainBanner"></div>
    </section>

    <main class="container main-content">
        
        <div class="section-title">
            <h2>Recommended Movies</h2>
            <a href="#" style="color: var(--primary-red); text-decoration:none; font-size:14px;">See All ></a>
        </div>

        <div class="grid-layout">
            <article class="movie-card">
                <div class="poster-wrapper">
                    <img src="https://via.placeholder.com/300x450/111/fff?text=The+Batman" alt="Batman" class="poster-img">
                    <div class="rating-tag"><i class="fas fa-star" style="color:#f84464"></i> 8.9/10 (2.4M Votes)</div>
                </div>
                <div class="card-details">
                    <p class="movie-name">The Batman</p>
                    <p class="movie-meta">Action/Crime • UA</p>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </article>

            <article class="movie-card">
                <div class="poster-wrapper">
                    <img src="https://via.placeholder.com/300x450/111/fff?text=Inception" alt="Inception" class="poster-img">
                    <div class="rating-tag"><i class="fas fa-star" style="color:#f84464"></i> 9.2/10 (1.8M Votes)</div>
                </div>
                <div class="card-details">
                    <p class="movie-name">Inception</p>
                    <p class="movie-meta">Sci-Fi/Action • A</p>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </article>

            <article class="movie-card">
                <div class="poster-wrapper">
                    <img src="https://via.placeholder.com/300x450/111/fff?text=Dune+2" alt="Dune" class="poster-img">
                    <div class="rating-tag"><i class="fas fa-star" style="color:#f84464"></i> 9.0/10 (500K Votes)</div>
                </div>
                <div class="card-details">
                    <p class="movie-name">Dune: Part Two</p>
                    <p class="movie-meta">Sci-Fi/Adventure • UA</p>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </article>

            <article class="movie-card">
                <div class="poster-wrapper">
                    <img src="https://via.placeholder.com/300x450/111/fff?text=Joker" alt="Joker" class="poster-img">
                    <div class="rating-tag"><i class="fas fa-star" style="color:#f84464"></i> 8.6/10 (1.2M Votes)</div>
                </div>
                <div class="card-details">
                    <p class="movie-name">Joker</p>
                    <p class="movie-meta">Drama/Crime • A</p>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </article>
        </div>

        <div class="section-title">
            <h2>Live Events</h2>
        </div>

        <div class="grid-layout">
            <article class="movie-card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Comedy+Show" style="height:200px; width:100%; object-fit:cover;">
                <div class="card-details">
                    <p class="movie-name">Stand-up Sunday</p>
                    <p class="movie-meta">Comedy • English/Hindi</p>
                </div>
            </article>
            <article class="movie-card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Rock+Concert" style="height:200px; width:100%; object-fit:cover;">
                <div class="card-details">
                    <p class="movie-name">Neon Lights Tour</p>
                    <p class="movie-meta">Music • Live Concert</p>
                </div>
            </article>
        </div>
    </main>

    <footer>
        <div class="social-bar">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-linkedin-in"></i>
        </div>
        <div class="footer-links">
            <a href="#">Help</a>
            <a href="#">Offers</a>
            <a href="#">Gift Cards</a>
            <a href="#">Contact Us</a>
        </div>
        <p style="margin-top:20px; font-size:12px;">© 2026 ShowTime Entertainment. All rights reserved.</p>
    </footer>

    <script>
        // Use a function to avoid global scope pollution (SonarQube Best Practice)
        (function() {
            const bannerElement = document.getElementById('mainBanner');
            const slides = [
                "https://via.placeholder.com/1240x320/333545/ffffff?text=Biggest+Action+Movies+Releasing+This+Week",
                "https://via.placeholder.com/1240x320/1f212a/ffffff?text=Early+Bird+Offer:+20+Percent+Off+on+Events",
                "https://via.placeholder.com/1240x320/f84464/ffffff?text=Stream+Latest+Movies+at+Home"
            ];
            let index = 0;

            function rotateBanner() {
                index = (index + 1) % slides.length;
                bannerElement.style.backgroundImage = "linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('" + slides[index] + "')";
            }

            setInterval(rotateBanner, 5000);
        })();
    </script>
</body>
</html>
