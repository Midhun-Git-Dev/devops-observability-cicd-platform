<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime - Book Movie Tickets, Events & More</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background: #0a0a0a;
            color: #fff;
        }

        /* Top Bar */
        .top-bar {
            background: #000;
            padding: 8px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 14px;
        }
        .top-bar-left {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #ff2d55;
        }
        .search-container {
            position: relative;
            width: 520px;
        }
        .search-input {
            width: 100%;
            padding: 12px 20px 12px 50px;
            background: #111;
            border: 1px solid #333;
            border-radius: 6px;
            color: white;
            font-size: 15px;
        }
        .search-input::placeholder { color: #888; }
        .search-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        .top-bar-right {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        .location-select {
            background: #111;
            border: 1px solid #333;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
        }
        .sign-in-btn {
            background: #ff2d55;
            border: none;
            padding: 8px 20px;
            color: white;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
        }

        /* Main Nav */
        .main-nav {
            background: #111;
            padding: 0 40px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #222;
        }
        .nav-links {
            display: flex;
            gap: 35px;
            font-weight: 500;
        }
        .nav-links a {
            color: #ddd;
            text-decoration: none;
            font-size: 15px;
        }
        .nav-links a:hover { color: white; }
        .nav-right {
            display: flex;
            gap: 30px;
            font-size: 14px;
            color: #ccc;
        }

        /* Hero Banner */
        .hero {
            height: 420px;
            position: relative;
            background: linear-gradient(to right, #0d1b3a 40%, transparent 60%);
            display: flex;
            align-items: center;
        }
        .hero-poster {
            position: absolute;
            right: 80px;
            top: 50%;
            transform: translateY(-50%);
            width: 320px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.8);
        }
        .hero-content {
            padding-left: 80px;
            max-width: 600px;
        }
        .hero-title {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .hero-subtitle {
            font-size: 22px;
            margin-bottom: 30px;
            color: #ddd;
        }
        .promo-code {
            background: rgba(255,255,255,0.1);
            border: 2px dashed #ff2d55;
            padding: 15px 25px;
            border-radius: 8px;
            display: inline-block;
            font-size: 18px;
        }

        /* Recommended Section */
        .section {
            padding: 50px 80px;
        }
        .section-title {
            font-size: 28px;
            margin-bottom: 30px;
            font-weight: 600;
        }
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
        }
        .movie-card {
            background: #111;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.25s;
        }
        .movie-card:hover {
            transform: scale(1.04);
        }
        .movie-poster {
            width: 100%;
            height: 320px;
            object-fit: cover;
        }
        .movie-info {
            padding: 12px;
            text-align: center;
        }
        .movie-title {
            font-size: 16px;
            margin-bottom: 6px;
        }
        .rating {
            color: #ff2d55;
            font-weight: bold;
            margin-bottom: 4px;
        }
        .votes {
            color: #888;
            font-size: 13px;
        }

        @media (max-width: 1024px) {
            .hero { height: 360px; }
            .hero-content { padding-left: 40px; }
            .hero-poster { right: 40px; width: 260px; }
            .section { padding: 40px 40px; }
        }
        @media (max-width: 768px) {
            .top-bar, .main-nav { flex-direction: column; gap: 12px; padding: 12px 20px; }
            .search-container { width: 100%; }
            .hero { background: #0d1b3a; text-align: center; }
            .hero-content { padding: 0 20px; }
            .hero-poster { position: static; margin: 20px auto; transform: none; }
            .hero-title { font-size: 32px; }
        }
    </style>
</head>
<body>

    <!-- Top Bar -->
    <div class="top-bar">
        <div class="top-bar-left">
            <div class="logo">ShowTime</div>
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search for Movies, Events, Plays, Sports...">
            </div>
        </div>
        <div class="top-bar-right">
            <select class="location-select">
                <option>Bengaluru</option>
                <option>Mumbai</option>
                <option>Delhi</option>
                <option>Hyderabad</option>
                <option>Chennai</option>
            </select>
            <button class="sign-in-btn">Sign In</button>
        </div>
    </div>

    <!-- Main Navigation -->
    <nav class="main-nav">
        <div class="nav-links">
            <a href="#">Movies</a>
            <a href="#">Stream</a>
            <a href="#">Events</a>
            <a href="#">Plays</a>
            <a href="#">Activities</a>
            <a href="#">Buzz</a>
        </div>
        <div class="nav-right">
            <a href="#">ListYourShow</a>
            <a href="#">Corporates</a>
            <a href="#">Offers</a>
            <a href="#">Gift Cards</a>
        </div>
    </nav>

    <!-- Hero Banner -->
    <div class="hero">
        <div class="hero-content">
            <div class="hero-title">STREAM</div>
            <div class="hero-subtitle">LOVE IS SHARING YOUR POPCORN 🍿</div>
            <div class="promo-code">
                AT 90% OFF* USE CODE <strong>SAAVO</strong>
            </div>
        </div>
        <img class="hero-poster" src="https://picsum.photos/320/480?random=30" alt="Featured Movie Poster">
    </div>

    <!-- Recommended Movies -->
    <section class="section">
        <div class="section-title">Recommended Movies</div>
        <div class="movies-grid">
            <div class="movie-card">
                <img class="movie-poster" src="https://picsum.photos/220/320?random=41" alt="Movie 1">
                <div class="movie-info">
                    <div class="movie-title">Dada</div>
                    <div class="rating">★ 8.4</div>
                    <div class="votes">8.7k votes</div>
                </div>
            </div>
            <div class="movie-card">
                <img class="movie-poster" src="https://picsum.photos/220/320?random=42" alt="Movie 2">
                <div class="movie-info">
                    <div class="movie-title">Jailer</div>
                    <div class="rating">★ 8.4</div>
                    <div class="votes">1.6k votes</div>
                </div>
            </div>
            <div class="movie-card">
                <img class="movie-poster" src="https://picsum.photos/220/320?random=43" alt="Movie 3">
                <div class="movie-info">
                    <div class="movie-title">Vikram</div>
                    <div class="rating">★ 8.3</div>
                    <div class="votes">2.7k votes</div>
                </div>
            </div>
            <div class="movie-card">
                <img class="movie-poster" src="https://picsum.photos/220/320?random=44" alt="Movie 4">
                <div class="movie-info">
                    <div class="movie-title">Valimai</div>
                    <div class="rating">★ 7.9</div>
                    <div class="votes">4.1k votes</div>
                </div>
            </div>
            <div class="movie-card">
                <img class="movie-poster" src="https://picsum.photos/220/320?random=45" alt="Movie 5">
                <div class="movie-info">
                    <div class="movie-title">Ponniyin Selvan</div>
                    <div class="rating">★ 8.0</div>
                    <div class="votes">5.2k votes</div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>
