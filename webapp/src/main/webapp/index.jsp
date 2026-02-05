<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowTime - Book Movie & Event Tickets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0f0f0f;
            color: #ffffff;
            line-height: 1.6;
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, #1a0000 0%, #2d0000 100%);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 20px rgba(255, 0, 0, 0.3);
        }

        nav {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem;
            flex-wrap: wrap;
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            background: linear-gradient(45deg, #ff0040, #ff4081);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-decoration: none;
        }

        .location-selector select {
            background: #333;
            color: #fff;
            border: 1px solid #555;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-size: 0.9rem;
        }

        .search-container {
            flex: 1;
            max-width: 500px;
            margin: 0 2rem;
            position: relative;
        }

        .search-box {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 3rem;
            border: none;
            border-radius: 25px;
            background: #333;
            color: #fff;
            font-size: 1rem;
        }

        .search-box::placeholder {
            color: #aaa;
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #ff4081;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.7rem 1.5rem;
            border: none;
            border-radius: 25px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-login {
            background: transparent;
            color: #fff;
            border: 2px solid #ff4081;
        }

        .btn-login:hover {
            background: #ff4081;
        }

        .btn-signup {
            background: linear-gradient(45deg, #ff0040, #ff4081);
            color: #fff;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 64, 129, 0.4);
        }

        /* Hero Section */
        .hero {
            margin-top: 80px;
            position: relative;
            height: 70vh;
            overflow: hidden;
        }

        .hero-slider {
            display: flex;
            height: 100%;
            transition: transform 0.5s ease;
        }

        .hero-slide {
            min-width: 100%;
            height: 70vh;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .hero-slide:nth-child(1) { 
            background: linear-gradient(135deg, rgba(255,0,64,0.8), rgba(255,64,129,0.8)), 
                        url('https://picsum.photos/1920/800?random=1') center/cover; 
        }
        .hero-slide:nth-child(2) { 
            background: linear-gradient(135deg, rgba(64,128,255,0.8), rgba(255,64,129,0.8)), 
                        url('https://picsum.photos/1920/800?random=2') center/cover; 
        }
        .hero-slide:nth-child(3) { 
            background: linear-gradient(135deg, rgba(45,0,0,0.9), rgba(255,64,129,0.7)), 
                        url('https://picsum.photos/1920/800?random=3') center/cover; 
        }

        .hero-content {
            position: absolute;
            top: 50%;
            left: 5%;
            transform: translateY(-50%);
            max-width: 500px;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.8);
        }

        .hero-category {
            background: linear-gradient(45deg, #ff0040, #ff4081);
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            display: inline-block;
            margin-bottom: 1rem;
            font-weight: 500;
        }

        /* Sections */
        .section {
            padding: 4rem 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .section h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            background: linear-gradient(45deg, #ff4081, #ff0040);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .card {
            background: #1a1a1a;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(255, 64, 129, 0.3);
        }

        .card-img {
            width: 100%;
            height: 350px;
            background-size: cover;
            background-position: center;
        }

        /* Movie Cards - Fixed with Picsum */
        .card-movie1 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=10') center/cover; 
        }
        .card-movie2 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=11') center/cover; 
        }
        .card-movie3 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=12') center/cover; 
        }
        .card-movie4 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=13') center/cover; 
        }
        .card-movie5 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=14') center/cover; 
        }
        .card-movie6 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/450?random=15') center/cover; 
        }

        /* Event Cards - Fixed with Picsum */
        .card-event1 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/350?random=20') center/cover; 
        }
        .card-event2 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/350?random=21') center/cover; 
        }
        .card-event3 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/350?random=22') center/cover; 
        }
        .card-event4 .card-img { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://picsum.photos/300/350?random=23') center/cover; 
        }

        .card-content {
            padding: 1.5rem;
        }

        .card h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: #fff;
        }

        .card-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            color: #aaa;
        }

        .rating {
            background: #ff4081;
            color: #fff;
            padding: 0.2rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .book-btn {
            width: 100%;
            background: linear-gradient(45deg, #ff0040, #ff4081);
            color: #fff;
            border: none;
            padding: 0.8rem;
            border-radius: 25px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .book-btn:hover {
            transform: scale(1.05);
        }

        /* Footer */
        footer {
            background: #111;
            padding: 3rem 2rem 1rem;
            text-align: center;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: #aaa;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #ff4081;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .social-icons a {
            width: 50px;
            height: 50px;
            background: #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            transition: all 0.3s ease;
        }

        .social-icons a:hover {
            background: #ff4081;
            transform: translateY(-3px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .search-container {
                margin: 0;
                order: -1;
                width: 100%;
            }

            .auth-buttons {
                order: -1;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .section {
                padding: 2rem 1rem;
            }

            .section h2 {
                font-size: 2rem;
            }

            .grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1rem;
            }
        }

        @media (max-width: 480px) {
            .hero {
                height: 50vh;
            }

            .hero-slide {
                height: 50vh;
            }

            .card-img {
                height: 250px;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navbar -->
    <header>
        <nav>
            <a href="#" class="logo">ShowTime</a>
            
            <div class="location-selector">
                <select>
                    <option>Bangalore</option>
                    <option>Chennai</option>
                    <option>Hyderabad</option>
                    <option>Mumbai</option>
                </select>
            </div>

            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-box" placeholder="Search for Movies, Events, Plays, Sports">
            </div>

            <div class="auth-buttons">
                <a href="#" class="btn btn-login">Login</a>
                <a href="#" class="btn btn-signup">Sign Up</a>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-slider" id="heroSlider">
            <div class="hero-slide">
                <div class="hero-content">
                    <div class="hero-category">NOW SHOWING</div>
                    <h1>Blockbuster Season</h1>
                    <p>Experience the biggest movies in theaters near you!</p>
                </div>
            </div>
            <div class="hero-slide">
                <div class="hero-content">
                    <div class="hero-category">UPCOMING</div>
                    <h1>Can't Miss Movies</h1>
                    <p>Get ready for the next big releases!</p>
                </div>
            </div>
            <div class="hero-slide">
                <div class="hero-content">
                    <div class="hero-category">LIVE EVENTS</div>
                    <h1>Concerts & Shows</h1>
                    <p>Live entertainment at its best!</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Movies Section -->
    <section class="section">
        <h2>Now Showing Movies</h2>
        <div class="grid">
            <div class="card card-movie1">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Action Thriller</h3>
                    <div class="card-meta">
                        <span>Action, Thriller</span>
                        <span class="rating">8.5/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">Hindi, English</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card card-movie2">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Romantic Drama</h3>
                    <div class="card-meta">
                        <span>Romance, Drama</span>
                        <span class="rating">7.9/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">Tamil, Telugu</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card card-movie3">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Sci-Fi Adventure</h3>
                    <div class="card-meta">
                        <span>Sci-Fi, Adventure</span>
                        <span class="rating">9.2/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">English, Hindi</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card card-movie4">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Comedy</h3>
                    <div class="card-meta">
                        <span>Comedy</span>
                        <span class="rating">8.1/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">Kannada, Hindi</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card card-movie5">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Horror</h3>
                    <div class="card-meta">
                        <span>Horror, Thriller</span>
                        <span class="rating">7.6/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">Malayalam</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
            <div class="card card-movie6">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Family Drama</h3>
                    <div class="card-meta">
                        <span>Drama, Family</span>
                        <span class="rating">8.7/10</span>
                    </div>
                    <span style="font-size: 0.85rem; color: #aaa;">Telugu, Tamil</span>
                    <button class="book-btn">Book Tickets</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Events Section -->
    <section class="section" style="background: #1a1a1a;">
        <h2>Live Events & Experiences</h2>
        <div class="grid">
            <div class="card card-event1">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Stand-up Comedy</h3>
                    <p>Laugh out loud with top comedians</p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            <div class="card card-event2">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Live Concerts</h3>
                    <p>Top artists performing live</p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            <div class="card card-event3">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Sports Events</h3>
                    <p>Live sports action</p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            <div class="card card-event4">
                <div class="card-img"></div>
                <div class="card-content">
                    <h3>Theatre Plays</h3>
                    <p>Captivating stage performances</p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-links">
                <a href="#">About Us</a>
                <a href="#">Contact</a>
                <a href="#">Terms of Service</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Careers</a>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
            <p style="color: #aaa; margin-top: 2rem;">&copy; 2026 ShowTime. All rights reserved. | Made with ❤️ in Bangalore</p>
        </div>
    </footer>

    <script>
        // Simple hero slider
        let currentSlide = 0;
        const slides = document.querySelectorAll('.hero-slide');
        const totalSlides = slides.length;

        function nextSlide() {
            currentSlide = (currentSlide + 1) % totalSlides;
            document.getElementById('heroSlider').style.transform = `translateX(-${currentSlide * 100}%)`;
        }

        setInterval(nextSlide, 5000);

        // Book button interactions
        document.querySelectorAll('.book-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                alert('🎟️ Redirecting to booking page... (Demo)');
            });
        });

        // Search functionality (demo)
        document.querySelector('.search-box').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                alert('🔍 Searching for: ' + this.value);
            }
        });
    </script>
</body>
</html>
