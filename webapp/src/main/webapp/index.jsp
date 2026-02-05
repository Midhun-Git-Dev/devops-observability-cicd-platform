<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime - Book Movie & Event Tickets Online</title>
    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
        /* ==================== Global Styles ==================== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #1a1a1a;
            color: #ffffff;
            line-height: 1.6;
        }
        
        a {
            text-decoration: none;
            color: inherit;
        }
        
        /* ==================== Header / Navbar ==================== */
        .navbar {
            background-color: #0f0f0f;
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #dc2626;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .logo i {
            font-size: 32px;
        }
        
        .nav-center {
            display: flex;
            align-items: center;
            gap: 20px;
            flex: 1;
            max-width: 700px;
        }
        
        .location-selector {
            position: relative;
        }
        
        .location-selector select {
            background-color: #2a2a2a;
            color: #ffffff;
            border: 1px solid #444;
            padding: 10px 35px 10px 15px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            outline: none;
            appearance: none;
        }
        
        .location-selector i {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #dc2626;
            pointer-events: none;
        }
        
        .search-bar {
            flex: 1;
            position: relative;
        }
        
        .search-bar input {
            width: 100%;
            padding: 12px 45px 12px 20px;
            border: 1px solid #444;
            border-radius: 5px;
            background-color: #2a2a2a;
            color: #ffffff;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }
        
        .search-bar input:focus {
            border-color: #dc2626;
        }
        
        .search-bar i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        
        .nav-right {
            display: flex;
            gap: 15px;
        }
        
        .btn-login {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #dc2626;
            padding: 10px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-login:hover {
            background-color: #dc2626;
        }
        
        /* ==================== Hero Section ==================== */
        .hero-section {
            position: relative;
            height: 500px;
            overflow: hidden;
            margin-bottom: 50px;
        }
        
        .hero-slider {
            display: flex;
            transition: transform 0.5s ease-in-out;
            height: 100%;
        }
        
        .hero-slide {
            min-width: 100%;
            height: 100%;
            position: relative;
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
        }
        
        .hero-slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to top, #1a1a1a 0%, transparent 100%);
        }
        
        /* Gradient backgrounds for hero slides */
        .hero-slide:nth-child(1) {
            background: linear-gradient(135deg, #1a1a1a 0%, #dc2626 100%);
        }
        
        .hero-slide:nth-child(2) {
            background: linear-gradient(135deg, #1a1a1a 0%, #7c2d12 100%);
        }
        
        .hero-slide:nth-child(3) {
            background: linear-gradient(135deg, #1a1a1a 0%, #991b1b 100%);
        }
        
        .hero-content {
            position: absolute;
            bottom: 60px;
            left: 50px;
            z-index: 10;
            max-width: 600px;
        }
        
        .hero-content h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 15px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.8);
        }
        
        .hero-content p {
            font-size: 18px;
            margin-bottom: 25px;
            color: #e0e0e0;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.8);
        }
        
        .btn-hero {
            background-color: #dc2626;
            color: #ffffff;
            padding: 15px 40px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn-hero:hover {
            background-color: #b91c1c;
        }
        
        .slider-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 10;
        }
        
        .dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .dot.active {
            background-color: #dc2626;
        }
        
        /* ==================== Section Styles ==================== */
        .section {
            max-width: 1400px;
            margin: 0 auto 60px;
            padding: 0 20px;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 28px;
            font-weight: 700;
            color: #ffffff;
            position: relative;
            padding-bottom: 10px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 60px;
            height: 3px;
            background-color: #dc2626;
        }
        
        .see-all {
            color: #dc2626;
            font-weight: 500;
            cursor: pointer;
            transition: color 0.3s;
        }
        
        .see-all:hover {
            color: #b91c1c;
        }
        
        /* ==================== Movie/Event Cards Grid ==================== */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
        }
        
        .card {
            background-color: #262626;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(220, 38, 38, 0.3);
        }
        
        .card-image {
            width: 100%;
            height: 320px;
            object-fit: cover;
            background: linear-gradient(135deg, #2a2a2a 0%, #1a1a1a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }
        
        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .card-content {
            padding: 15px;
        }
        
        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #ffffff;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .card-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 10px;
        }
        
        .tag {
            background-color: #3a3a3a;
            padding: 4px 10px;
            border-radius: 3px;
            font-size: 12px;
            color: #b0b0b0;
        }
        
        .rating {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 12px;
        }
        
        .rating i {
            color: #fbbf24;
        }
        
        .rating span {
            font-weight: 600;
            color: #ffffff;
        }
        
        .btn-book {
            width: 100%;
            background-color: #dc2626;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn-book:hover {
            background-color: #b91c1c;
        }
        
        /* ==================== Event Cards (Slightly Different) ==================== */
        .event-card {
            background-color: #262626;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            position: relative;
        }
        
        .event-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(220, 38, 38, 0.3);
        }
        
        .event-image {
            width: 100%;
            height: 280px;
            object-fit: cover;
            background: linear-gradient(135deg, #2a2a2a 0%, #1a1a1a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }
        
        .event-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .event-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: #dc2626;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
            z-index: 10;
        }
        
        .event-content {
            padding: 15px;
        }
        
        .event-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #ffffff;
        }
        
        .event-info {
            color: #b0b0b0;
            font-size: 13px;
            margin-bottom: 12px;
        }
        
        .event-info i {
            color: #dc2626;
            margin-right: 5px;
        }
        
        /* ==================== Footer ==================== */
        .footer {
            background-color: #0f0f0f;
            padding: 50px 20px 20px;
            border-top: 1px solid #333;
        }
        
        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .footer-section h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #dc2626;
        }
        
        .footer-section ul {
            list-style: none;
        }
        
        .footer-section ul li {
            margin-bottom: 12px;
        }
        
        .footer-section ul li a {
            color: #b0b0b0;
            transition: color 0.3s;
        }
        
        .footer-section ul li a:hover {
            color: #ffffff;
        }
        
        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }
        
        .social-icons a {
            width: 40px;
            height: 40px;
            background-color: #2a2a2a;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s;
        }
        
        .social-icons a:hover {
            background-color: #dc2626;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid #333;
            color: #666;
            font-size: 14px;
        }
        
        /* ==================== Responsive Design ==================== */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                align-items: stretch;
            }
            
            .nav-center {
                flex-direction: column;
                max-width: 100%;
            }
            
            .logo {
                justify-content: center;
            }
            
            .nav-right {
                justify-content: center;
            }
            
            .hero-section {
                height: 350px;
            }
            
            .hero-content {
                left: 20px;
                bottom: 40px;
            }
            
            .hero-content h1 {
                font-size: 32px;
            }
            
            .hero-content p {
                font-size: 16px;
            }
            
            .section-title {
                font-size: 22px;
            }
            
            .cards-grid {
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                gap: 15px;
            }
            
            .card-image,
            .event-image {
                height: 240px;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
                gap: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- ==================== Navigation Bar ==================== -->
    <nav class="navbar">
        <div class="nav-container">
            <!-- Logo -->
            <div class="logo">
                <i class="fas fa-ticket-alt"></i>
                <span>ShowTime</span>
            </div>
            
            <!-- Center: Location & Search -->
            <div class="nav-center">
                <div class="location-selector">
                    <select>
                        <option value="bangalore">Bangalore</option>
                        <option value="chennai">Chennai</option>
                        <option value="hyderabad">Hyderabad</option>
                        <option value="mumbai">Mumbai</option>
                    </select>
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                
                <div class="search-bar">
                    <input type="text" placeholder="Search for Movies, Events, Plays, Sports">
                    <i class="fas fa-search"></i>
                </div>
            </div>
            
            <!-- Right: Login Button -->
            <div class="nav-right">
                <button class="btn-login">Login / Signup</button>
            </div>
        </div>
    </nav>

    <!-- ==================== Hero Section / Banner Slider ==================== -->
    <section class="hero-section">
        <div class="hero-slider" id="heroSlider">
            <!-- Slide 1 -->
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Now Showing</h1>
                    <p>Book tickets for the latest blockbuster movies in theatres near you</p>
                    <button class="btn-hero">Explore Movies</button>
                </div>
            </div>
            
            <!-- Slide 2 -->
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Live Concerts</h1>
                    <p>Experience the best live music performances and concerts</p>
                    <button class="btn-hero">Book Now</button>
                </div>
            </div>
            
            <!-- Slide 3 -->
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Comedy Shows</h1>
                    <p>Laugh out loud with the funniest comedians in town</p>
                    <button class="btn-hero">Get Tickets</button>
                </div>
            </div>
        </div>
        
        <!-- Slider Dots -->
        <div class="slider-dots">
            <span class="dot active" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
        </div>
    </section>

    <!-- ==================== Movies Section ==================== -->
    <section class="section">
        <div class="section-header">
            <h2 class="section-title">Recommended Movies</h2>
            <a href="#" class="see-all">See All <i class="fas fa-arrow-right"></i></a>
        </div>
        
        <div class="cards-grid">
            <!-- Movie Card 1 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=1" alt="Movie 1" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">The Dark Knight Returns</h3>
                    <div class="card-meta">
                        <span class="tag">Action</span>
                        <span class="tag">English</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>8.9/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            
            <!-- Movie Card 2 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=2" alt="Movie 2" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">Inception Dreams</h3>
                    <div class="card-meta">
                        <span class="tag">Thriller</span>
                        <span class="tag">English</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>9.2/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            
            <!-- Movie Card 3 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=3" alt="Movie 3" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">Mumbai Diaries</h3>
                    <div class="card-meta">
                        <span class="tag">Drama</span>
                        <span class="tag">Hindi</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>8.5/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            
            <!-- Movie Card 4 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=4" alt="Movie 4" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">Chennai Express 2</h3>
                    <div class="card-meta">
                        <span class="tag">Comedy</span>
                        <span class="tag">Tamil</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>7.8/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            
            <!-- Movie Card 5 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=5" alt="Movie 5" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">Mission Impossible 8</h3>
                    <div class="card-meta">
                        <span class="tag">Action</span>
                        <span class="tag">English</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>8.7/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
            
            <!-- Movie Card 6 -->
            <div class="card">
                <div class="card-image">
                    <img src="https://picsum.photos/220/320?random=6" alt="Movie 6" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-film\' style=\'font-size:48px\'></i>';">
                </div>
                <div class="card-content">
                    <h3 class="card-title">Bangalore Days Redux</h3>
                    <div class="card-meta">
                        <span class="tag">Romance</span>
                        <span class="tag">Kannada</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <span>8.3/10</span>
                    </div>
                    <button class="btn-book">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <!-- ==================== Events Section ==================== -->
    <section class="section">
        <div class="section-header">
            <h2 class="section-title">Live Events</h2>
            <a href="#" class="see-all">See All <i class="fas fa-arrow-right"></i></a>
        </div>
        
        <div class="cards-grid">
            <!-- Comedy Show Event -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=7" alt="Comedy Show" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-microphone\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">COMEDY</span>
                <div class="event-content">
                    <h3 class="event-title">Stand-Up Comedy Night</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Feb 15, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> Phoenix Marketcity, Bangalore
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
            
            <!-- Live Concert Event -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=8" alt="Live Concert" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-music\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">CONCERT</span>
                <div class="event-content">
                    <h3 class="event-title">Rock Music Festival</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Feb 20, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> Jayamahal Palace, Bangalore
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
            
            <!-- Sports Event -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=9" alt="Sports Event" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-baseball-ball\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">SPORTS</span>
                <div class="event-content">
                    <h3 class="event-title">IPL 2026: RCB vs MI</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Mar 5, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> M. Chinnaswamy Stadium
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
            
            <!-- Theatre Play Event -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=10" alt="Theatre Play" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-theater-masks\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">THEATRE</span>
                <div class="event-content">
                    <h3 class="event-title">Shakespeare's Hamlet</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Feb 18, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> Ranga Shankara Theatre
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
            
            <!-- Music Concert Event -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=11" alt="EDM Concert" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-headphones\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">CONCERT</span>
                <div class="event-content">
                    <h3 class="event-title">EDM Night ft. DJ Snake</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Mar 1, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> Palace Grounds, Bangalore
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
            
            <!-- Comedy Show Event 2 -->
            <div class="event-card">
                <div class="event-image">
                    <img src="https://picsum.photos/220/280?random=12" alt="Comedy Show 2" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-laugh\' style=\'font-size:48px\'></i>';">
                </div>
                <span class="event-badge">COMEDY</span>
                <div class="event-content">
                    <h3 class="event-title">The Laughter Factory</h3>
                    <p class="event-info">
                        <i class="fas fa-calendar"></i> Feb 25, 2026<br>
                        <i class="fas fa-map-marker-alt"></i> Lalit Ashok Hotel, Bangalore
                    </p>
                    <button class="btn-book">Book Now</button>
                </div>
            </div>
        </div>
    </section>

    <!-- ==================== Footer ==================== -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-content">
                <!-- About Section -->
                <div class="footer-section">
                    <h3>About ShowTime</h3>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Press Release</a></li>
                    </ul>
                </div>
                
                <!-- Help Section -->
                <div class="footer-section">
                    <h3>Help & Support</h3>
                    <ul>
                        <li><a href="#">FAQs</a></li>
                        <li><a href="#">Customer Support</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
                
                <!-- Booking Section -->
                <div class="footer-section">
                    <h3>Book Tickets</h3>
                    <ul>
                        <li><a href="#">Movies</a></li>
                        <li><a href="#">Events</a></li>
                        <li><a href="#">Plays</a></li>
                        <li><a href="#">Sports</a></li>
                    </ul>
                </div>
                
                <!-- Social Media Section -->
                <div class="footer-section">
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2026 ShowTime. All Rights Reserved. | Designed for Entertainment Booking</p>
            </div>
        </div>
    </footer>

    <!-- ==================== JavaScript for Hero Slider ==================== -->
    <script>
        let currentSlideIndex = 0;
        const slides = document.querySelectorAll('.hero-slide');
        const dots = document.querySelectorAll('.dot');
        const slider = document.getElementById('heroSlider');
        
        // Function to show specific slide
        function showSlide(index) {
            if (index >= slides.length) {
                currentSlideIndex = 0;
            } else if (index < 0) {
                currentSlideIndex = slides.length - 1;
            } else {
                currentSlideIndex = index;
            }
            
            slider.style.transform = `translateX(-${currentSlideIndex * 100}%)`;
            
            // Update dots
            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === currentSlideIndex);
            });
        }
        
        // Function to navigate to specific slide (called by dots)
        function currentSlide(index) {
            showSlide(index);
        }
        
        // Auto-play slider
        setInterval(() => {
            showSlide(currentSlideIndex + 1);
        }, 5000);
    </script>

</body>
</html>
