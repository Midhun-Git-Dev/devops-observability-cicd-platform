<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime | Movie & Events Ticket Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* CSS Variables for Consistency */
        :root {
            --primary-red: #f84464;
            --bg-dark: #1f212a;
            --bg-nav: #333545;
            --text-white: #ffffff;
            --text-gray: #b9b9b9;
            --card-shadow: 0 4px 12px rgba(0,0,0,0.5);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
        }

        /* --- Header & Navbar --- */
        header {
            background-color: var(--bg-nav);
            padding: 10px 5%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-red);
            text-decoration: none;
        }

        .search-container {
            flex-grow: 1;
            max-width: 500px;
            position: relative;
            margin: 0 20px;
        }

        .search-container input {
            width: 100%;
            padding: 8px 35px;
            border-radius: 4px;
            border: none;
            outline: none;
        }

        .search-container i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        select {
            background: transparent;
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn-login {
            background-color: var(--primary-red);
            color: white;
            border: none;
            padding: 6px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        /* --- Hero Section --- */
        .hero {
            width: 100%;
            background-color: var(--bg-dark);
            padding: 20px 0;
            text-align: center;
        }

        .hero-banner {
            width: 90%;
            max-width: 1200px;
            height: 300px;
            margin: 0 auto;
            border-radius: 8px;
            background: url('https://via.placeholder.com/1200x300/333545/ffffff?text=Blockbuster+Movies+Now+Showing') center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        /* --- Main Content Layout --- */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #222;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
            margin-bottom: 50px;
        }

        /* --- Card Styles --- */
        .card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            position: relative;
        }

        .rating-badge {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 12px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .card-info {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
        }

        .btn-book {
            width: 100%;
            padding: 10px;
            background-color: var(--primary-red);
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        /* --- Footer --- */
        footer {
            background-color: var(--bg-nav);
            color: var(--text-gray);
            padding: 40px 5%;
            text-align: center;
        }

        .footer-links {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: var(--text-gray);
            text-decoration: none;
        }

        .social-icons {
            font-size: 24px;
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .social-icons i {
            cursor: pointer;
        }

        /* Mobile Adjustments */
        @media (max-width: 768px) {
            .nav-left { width: 100%; justify-content: space-between; }
            .search-container { order: 3; width: 100%; margin: 10px 0; }
            .hero-banner { height: 150px; }
        }
    </style>
</head>
<body>

    <header>
        <div class="nav-left">
            <a href="#" class="logo">ShowTime</a>
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search for Movies, Events, Plays, Sports">
            </div>
        </div>
        <div class="nav-right">
            <select>
                <option>Bangalore</option>
                <option>Chennai</option>
                <option>Hyderabad</option>
                <option>Mumbai</option>
            </select>
            <button class="btn-login">Sign In</button>
        </div>
    </header>

    <div class="hero">
        <div class="hero-banner" id="banner">
            </div>
    </div>

    <div class="container">
        <h2>Movies - Now Showing</h2>
        <div class="grid">
            <div class="card">
                <div style="position: relative;">
                    <img src="https://via.placeholder.com/300x450/000000/FFFFFF?text=The+Batman" class="card-img" alt="Movie">
                    <span class="rating-badge"><i class="fas fa-star" style="color:#f84464"></i> 8.5/10</span>
                </div>
                <div class="card-body">
                    <div class="card-title">The Batman</div>
                    <div class="card-info">Action/Crime • English</div>
                    <button class="btn-book" onclick="alert('Booking Flow Triggered!')">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <div style="position: relative;">
                    <img src="https://via.placeholder.com/300x450/000000/FFFFFF?text=Interstellar" class="card-img" alt="Movie">
                    <span class="rating-badge"><i class="fas fa-star" style="color:#f84464"></i> 9.1/10</span>
                </div>
                <div class="card-body">
                    <div class="card-title">Interstellar</div>
                    <div class="card-info">Sci-Fi/Drama • English</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <div style="position: relative;">
                    <img src="https://via.placeholder.com/300x450/000000/FFFFFF?text=Inception" class="card-img" alt="Movie">
                    <span class="rating-badge"><i class="fas fa-star" style="color:#f84464"></i> 8.8/10</span>
                </div>
                <div class="card-body">
                    <div class="card-title">Inception</div>
                    <div class="card-info">Action/Sci-Fi • English</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            <div class="card">
                <div style="position: relative;">
                    <img src="https://via.placeholder.com/300x450/000000/FFFFFF?text=Pathaan" class="card-img" alt="Movie">
                    <span class="rating-badge"><i class="fas fa-star" style="color:#f84464"></i> 7.5/10</span>
                </div>
                <div class="card-body">
                    <div class="card-title">Pathaan</div>
                    <div class="card-info">Action • Hindi</div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
        </div>

        <h2>Live Events</h2>
        <div class="grid">
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Comedy+Night" class="card-img" style="height:200px;">
                <div class="card-body">
                    <div class="card-title">Stand-up Comedy</div>
                    <div class="card-info">Comedy • Multi Language</div>
                </div>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Rock+Concert" class="card-img" style="height:200px;">
                <div class="card-body">
                    <div class="card-title">Rock in City</div>
                    <div class="card-info">Concert • English/Hindi</div>
                </div>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=IPL+2026" class="card-img" style="height:200px;">
                <div class="card-body">
                    <div class="card-title">Cricket League</div>
                    <div class="card-info">Sports • Outdoor</div>
                </div>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Hamlet+Play" class="card-img" style="height:200px;">
                <div class="card-body">
                    <div class="card-title">Theatre: Hamlet</div>
                    <div class="card-info">Plays • English</div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="social-icons">
            <i class="fab fa-facebook"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-youtube"></i>
        </div>
        <div class="footer-links">
            <a href="#">About Us</a>
            <a href="#">Contact Us</a>
            <a href="#">Terms & Conditions</a>
            <a href="#">Privacy Policy</a>
        </div>
        <p>&copy; 2026 ShowTime Entertainment Pvt. Ltd. All Rights Reserved.</p>
    </footer>

    <script>
        // Minimal JavaScript for Banner Rotation effect
        const banners = [
            "https://via.placeholder.com/1200x300/333545/ffffff?text=Exclusive+Concert+Tickets+Available",
            "https://via.placeholder.com/1200x300/1f212a/ffffff?text=Up+To+50+Percent+Off+On+First+Movie",
            "https://via.placeholder.com/1200x300/f84464/ffffff?text=Book+Your+Valentine+Specials"
        ];
        let current = 0;
        setInterval(() => {
            current = (current + 1) % banners.length;
            document.getElementById('banner').style.backgroundImage = `url('${banners[current]}')`;
        }, 4000);
    </script>
</body>
</html>
