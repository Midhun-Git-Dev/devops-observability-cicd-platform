<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background-color: #121212;
            color: #ffffff;
            line-height: 1.6;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        button {
            cursor: pointer;
        }

        /* Header/Navbar */
        header {
            background-color: #000000;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #ff0000; /* Red accent */
        }
        .navbar {
            display: flex;
            align-items: center;
            gap: 20px;
            flex: 1;
            justify-content: flex-end;
        }
        .location-selector {
            background-color: #333333;
            border: none;
            color: #ffffff;
            padding: 8px;
            border-radius: 4px;
        }
        .search-bar {
            flex: 1;
            max-width: 400px;
            background-color: #333333;
            border: none;
            padding: 10px;
            border-radius: 4px;
            color: #ffffff;
        }
        .search-bar::placeholder {
            color: #aaaaaa;
        }
        .login-btn {
            background-color: #ff0000;
            border: none;
            padding: 10px 20px;
            color: #ffffff;
            border-radius: 4px;
        }

        /* Hero Section */
        .hero {
            position: relative;
            height: 400px;
            overflow: hidden;
            margin: 20px 0;
        }
        .banner-slider {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .hero-text {
            position: absolute;
            bottom: 20px;
            left: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            border-radius: 4px;
        }
        .hero-text h1 {
            font-size: 32px;
        }
        .hero-text p {
            font-size: 18px;
        }

        /* Section Styles */
        section {
            padding: 20px;
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #ff0000;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        .card {
            background-color: #1e1e1e;
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
            padding: 10px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            width: 100%;
            height: auto;
            border-radius: 4px;
        }
        .card h3 {
            margin: 10px 0;
            font-size: 18px;
        }
        .card p {
            font-size: 14px;
            color: #aaaaaa;
        }
        .rating {
            background-color: #ff0000;
            color: #ffffff;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            margin: 5px 0;
        }
        .book-btn {
            background-color: #ff0000;
            border: none;
            padding: 10px;
            color: #ffffff;
            width: 100%;
            border-radius: 4px;
            margin-top: 10px;
        }

        /* Footer */
        footer {
            background-color: #000000;
            padding: 20px;
            text-align: center;
        }
        .footer-links {
            margin-bottom: 10px;
        }
        .footer-links a {
            margin: 0 10px;
            color: #aaaaaa;
        }
        .social-icons i {
            margin: 0 10px;
            font-size: 20px;
            color: #ff0000;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 10px;
            }
            .navbar {
                justify-content: center;
                width: 100%;
            }
            .search-bar {
                max-width: none;
            }
            .hero {
                height: 200px;
            }
            .hero-text h1 {
                font-size: 24px;
            }
            .hero-text p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navbar -->
    <header>
        <div class="logo">ShowTime</div>
        <div class="navbar">
            <select class="location-selector">
                <option>Bangalore</option>
                <option>Chennai</option>
                <option>Hyderabad</option>
                <option>Mumbai</option>
            </select>
            <input type="text" class="search-bar" placeholder="Search for Movies, Events, Plays, Sports">
            <button class="login-btn">Login / Signup</button>
        </div>
    </header>

    <!-- Hero Section -->
    <div class="hero">
        <img id="banner-slider" class="banner-slider" src="https://via.placeholder.com/1920x400?text=Banner+1" alt="Banner">
        <div class="hero-text">
            <h1>Now Showing</h1>
            <p>Upcoming Movies</p>
        </div>
    </div>

    <!-- Movies Section -->
    <section id="movies">
        <h2>Movies</h2>
        <div class="grid">
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Movie+1" alt="Movie Poster">
                <h3>Movie Title 1</h3>
                <p>Action, Thriller</p>
                <p>English</p>
                <span class="rating">8.5</span>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Movie+2" alt="Movie Poster">
                <h3>Movie Title 2</h3>
                <p>Comedy, Drama</p>
                <p>Hindi</p>
                <span class="rating">7.2</span>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Movie+3" alt="Movie Poster">
                <h3>Movie Title 3</h3>
                <p>Sci-Fi, Adventure</p>
                <p>English</p>
                <span class="rating">9.0</span>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Movie+4" alt="Movie Poster">
                <h3>Movie Title 4</h3>
                <p>Horror, Mystery</p>
                <p>Tamil</p>
                <span class="rating">6.8</span>
                <button class="book-btn">Book Tickets</button>
            </div>
        </div>
    </section>

    <!-- Events Section -->
    <section id="events">
        <h2>Events</h2>
        <div class="grid">
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Comedy+Show" alt="Event Poster">
                <h3>Comedy Shows</h3>
                <p>Stand-up Comedy Night</p>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Live+Concert" alt="Event Poster">
                <h3>Live Concerts</h3>
                <p>Rock Music Festival</p>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Sports+Event" alt="Event Poster">
                <h3>Sports Events</h3>
                <p>Cricket Match</p>
                <button class="book-btn">Book Tickets</button>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/200x300?text=Theatre+Play" alt="Event Poster">
                <h3>Theatre Plays</h3>
                <p>Drama Performance</p>
                <button class="book-btn">Book Tickets</button>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-links">
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Terms</a>
        </div>
        <div class="social-icons">
            <i class="fab fa-facebook"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
        </div>
    </footer>

    <!-- Minimal JavaScript for Banner Slider -->
    <script>
        const banners = [
            "https://via.placeholder.com/1920x400?text=Banner+1",
            "https://via.placeholder.com/1920x400?text=Banner+2",
            "https://via.placeholder.com/1920x400?text=Banner+3"
        ];
        let currentBanner = 0;
        const slider = document.getElementById('banner-slider');
        setInterval(() => {
            currentBanner = (currentBanner + 1) % banners.length;
            slider.src = banners[currentBanner];
        }, 5000);
    </script>
</body>
</html>
