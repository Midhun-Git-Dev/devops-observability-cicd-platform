<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime – Book Movies, Events & Plays</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0d0d0d;
            color: #ffffff;
            line-height: 1.5;
        }

        /* ────────────────────────────────────────────────
           HEADER + NAVIGATION
        ──────────────────────────────────────────────── */
        header {
            background: #000;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 12px rgba(0,0,0,0.7);
        }

        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 5vw;
            background: #000;
            border-bottom: 1px solid #222;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            color: #e50914;
            letter-spacing: -1px;
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
            flex: 1;
            max-width: 580px;
            margin: 0 30px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 12px 20px 12px 48px;
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
            font-size: 18px;
        }

        .sign-in-btn {
            background: #e50914;
            color: white;
            border: none;
            padding: 9px 22px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .sign-in-btn:hover {
            background: #b20710;
        }

        /* Main Navigation Bar */
        .main-nav {
            background: #0f0f0f;
            height: 48px;
            display: flex;
            align-items: center;
            padding: 0 5vw;
            border-bottom: 1px solid #1a1a1a;
        }

        .nav-left {
            display: flex;
            gap: 36px;
            font-weight: 500;
        }

        .nav-left a,
        .nav-right a {
            color: #e0e0e0;
            text-decoration: none;
            font-size: 15px;
            transition: color 0.2s;
        }

        .nav-left a:hover,
        .nav-right a:hover {
            color: white;
        }

        .nav-right {
            margin-left: auto;
            display: flex;
            gap: 32px;
            font-size: 14px;
        }

        /* ────────────────────────────────────────────────
           HERO BANNER (promotional style)
        ──────────────────────────────────────────────── */
        .hero {
            height: 480px;
            background: linear-gradient(90deg, #0a1f3a 45%, transparent 70%);
            position: relative;
            display: flex;
            align-items: center;
        }

        .hero-content {
            padding-left: 8vw;
            max-width: 620px;
            z-index: 2;
        }

        .hero-title {
            font-size: 54px;
            font-weight: 900;
            line-height: 1.05;
            margin-bottom: 16px;
            color: #fff;
        }

        .hero-subtitle {
            font-size: 22px;
            color: #ddd;
            margin-bottom: 32px;
        }

        .promo-box {
            background: rgba(255,255,255,0.08);
            border: 2px dashed #e50914;
            padding: 18px 28px;
            border-radius: 10px;
            display: inline-block;
            font-size: 18px;
        }

        .promo-box strong {
            color: #ffdd57;
        }

        .hero-poster {
            position: absolute;
            right: 8vw;
            top: 50%;
            transform: translateY(-50%);
            width: 340px;
            border-radius: 14px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.9);
            z-index: 1;
        }

        /* ────────────────────────────────────────────────
           RECOMMENDED MOVIES SECTION
        ──────────────────────────────────────────────── */
        .section {
            padding: 60px 8vw;
        }

        .section-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 36px;
        }

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 28px;
        }

        .movie-card {
            background: #111;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.28s ease;
        }

        .movie-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 18px 40px rgba(229,9,20,0.25);
        }

        .movie-poster {
            width: 100%;
            height: 320px;
            object-fit: cover;
        }

        .movie-info {
            padding: 14px 12px;
            text-align: center;
        }

        .movie-title {
            font-size: 17px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .rating-line {
            color: #e50914;
            font-weight: 700;
            margin-bottom: 4px;
            font-size: 15px;
        }

        .votes {
            color: #aaa;
            font-size: 13px;
        }

        /* ────────────────────────────────────────────────
           RESPONSIVE
        ──────────────────────────────────────────────── */
        @media (max-width: 1100px) {
            .hero { height: 420px; }
            .hero-title { font-size: 42px; }
            .hero-poster { right: 5vw; width: 280px; }
        }

        @media (max-width: 900px) {
            .top-bar { flex-wrap: wrap; gap: 16px; padding: 16px 5vw; }
            .search-container { order: 3; margin: 0; width: 100%; }
            .hero { background: #0a1f3a; text-align: center; }
            .hero-content { padding: 0 5vw; }
            .hero-poster { position: static; margin: 30px auto; transform: none; }
        }

        @media (max-width: 600px) {
            .hero-title { font-size: 32px; }
            .hero-subtitle { font-size: 18px; }
            .section { padding: 40px 5vw; }
        }
    </style>
</head>
<body>

<header>
    <div class="top-bar">
        <div class="logo">ShowTime</div>

        <div class="search-container">
            <i class="fa-solid fa-magnifying-glass search-icon"></i>
            <input type="text" class="search-input" placeholder="Search for movies, events, plays, sports...">
        </div>

        <div style="display:flex; align-items:center; gap:24px;">
            <select class="location-select">
                <option>Bengaluru</option>
                <option>Mumbai</option>
                <option>Delhi-NCR</option>
                <option>Hyderabad</option>
                <option>Chennai</option>
            </select>
            <button class="sign-in-btn">Sign in</button>
        </div>
    </div>

    <nav class="main-nav">
        <div class="nav-left">
            <a href="#">Movies</a>
            <a href="#">Stream</a>
            <a href="#">Events</a>
            <a href="#">Plays</a>
            <a href="#">Sports</a>
            <a href="#">Activities</a>
        </div>
        <div class="nav-right">
            <a href="#">ListYourShow</a>
            <a href="#">Corporates</a>
            <a href="#">Offers</a>
            <a href="#">Gift Cards</a>
        </div>
    </nav>
</header>

<!-- Hero Banner -->
<div class="hero">
    <div class="hero-content">
        <div class="hero-title">STREAM</div>
        <div class="hero-subtitle">LOVE IS SHARING YOUR POPCORN 🍿</div>
        <div class="promo-box">
            AT <strong>90% OFF*</strong> • USE CODE <strong>SAAVO</strong>
        </div>
    </div>
    <img class="hero-poster" src="https://picsum.photos/340/500?random=99" alt="Featured Movie">
</div>

<!-- Recommended Movies -->
<section class="section">
    <h2 class="section-title">Recommended Movies</h2>
    <div class="movies-grid">
        <div class="movie-card">
            <img class="movie-poster" src="https://picsum.photos/220/320?random=51" alt="">
            <div class="movie-info">
                <div class="movie-title">Dada</div>
                <div class="rating-line">★ 8.4 (8.7k votes)</div>
                <div class="votes">Family • Drama • Tamil</div>
            </div>
        </div>
        <div class="movie-card">
            <img class="movie-poster" src="https://picsum.photos/220/320?random=52" alt="">
            <div class="movie-info">
                <div class="movie-title">Jailer</div>
                <div class="rating-line">★ 8.4 (16k+ votes)</div>
                <div class="votes">Action • Thriller • Tamil</div>
            </div>
        </div>
        <div class="movie-card">
            <img class="movie-poster" src="https://picsum.photos/220/320?random=53" alt="">
            <div class="movie-info">
                <div class="movie-title">Vikram</div>
                <div class="rating-line">★ 8.3 (27k+ votes)</div>
                <div class="votes">Action • Crime • Tamil</div>
            </div>
        </div>
        <div class="movie-card">
            <img class="movie-poster" src="https://picsum.photos/220/320?random=54" alt="">
            <div class="movie-info">
                <div class="movie-title">Kantara</div>
                <div class="rating-line">★ 8.2 (45k+ votes)</div>
                <div class="votes">Action • Drama • Kannada</div>
            </div>
        </div>
        <div class="movie-card">
            <img class="movie-poster" src="https://picsum.photos/220/320?random=55" alt="">
            <div class="movie-info">
                <div class="movie-title">Ponniyin Selvan 2</div>
                <div class="rating-line">★ 7.9 (12k+ votes)</div>
                <div class="votes">Historical • Drama • Tamil</div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
