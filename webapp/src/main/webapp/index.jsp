<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LUXEVOYAGE - Premium Travel Experiences</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --gold: #D4AF37;
            --gold-dark: #B8942F;
            --black: #0A0A0A;
            --dark-gray: #1A1A1A;
            --gray: #2A2A2A;
            --white: #F8F8F8;
            --gradient-gold: linear-gradient(135deg, var(--gold) 0%, var(--gold-dark) 50%, #E6C547 100%);
            --gradient-dark: linear-gradient(135deg, var(--black) 0%, var(--dark-gray) 50%, var(--gray) 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--black);
            color: var(--white);
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* Premium Glass Morphism Effect */
        .glass {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 45px rgba(0,0,0,0.3);
        }

        /* Header */
        header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            padding: 1rem 0;
            background: rgba(10, 10, 10, 0.95);
            backdrop-filter: blur(20px);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            font-weight: 700;
            background: var(--gradient-gold);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-decoration: none;
            letter-spacing: 2px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 3rem;
            align-items: center;
        }

        .nav-links a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient-gold);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .cta-btn {
            background: var(--gradient-gold);
            color: var(--black);
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(212, 175, 55, 0.4);
        }

        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 40px rgba(212, 175, 55, 0.6);
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            background: var(--gradient-dark), 
                        url('https://picsum.photos/1920/1080?random=100') center/cover;
            display: flex;
            align-items: center;
            position: relative;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.4);
        }

        .hero-content {
            max-width: 800px;
            z-index: 2;
            position: relative;
        }

        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: clamp(3rem, 8vw, 6rem);
            margin-bottom: 1.5rem;
            background: var(--gradient-gold);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            max-width: 600px;
        }

        .search-form {
            display: flex;
            gap: 1rem;
            max-width: 700px;
            background: rgba(255,255,255,0.05);
            padding: 1rem;
            border-radius: 50px;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.1);
        }

        .search-input {
            flex: 1;
            background: transparent;
            border: none;
            color: var(--white);
            font-size: 1rem;
            padding: 1rem;
        }

        .search-input::placeholder {
            color: rgba(255,255,255,0.6);
        }

        .search-btn {
            background: var(--gradient-gold);
            color: var(--black);
            border: none;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        /* Sections */
        .section {
            padding: 8rem 0;
        }

        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            text-align: center;
            margin-bottom: 4rem;
            background: var(--gradient-gold);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .destinations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 3rem;
            margin-top: 4rem;
        }

        .destination-card {
            position: relative;
            height: 500px;
            border-radius: 30px;
            overflow: hidden;
            transition: all 0.5s ease;
            cursor: pointer;
        }

        .destination-card:hover {
            transform: translateY(-20px) scale(1.02);
        }

        .destination-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .destination-card:hover img {
            transform: scale(1.1);
        }

        .card-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0,0,0,0.9));
            padding: 3rem 2rem 2rem;
        }

        .card-title {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .card-price {
            font-size: 1.5rem;
            font-weight: 700;
            background: var(--gradient-gold);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Features Section */
        .features {
            background: var(--dark-gray);
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 3rem;
        }

        .feature-card {
            text-align: center;
            padding: 3rem 2rem;
            glass: glass;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: var(--gradient-gold);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: var(--black);
        }

        /* CTA Section */
        .cta-section {
            background: var(--gradient-dark);
            text-align: center;
            padding: 6rem 0;
        }

        .cta-h2 {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        /* Footer */
        footer {
            background: var(--black);
            padding: 4rem 0 2rem;
            text-align: center;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
            margin-bottom: 3rem;
        }

        .footer-section h3 {
            font-family: 'Playfair Display', serif;
            margin-bottom: 1.5rem;
            color: var(--gold);
        }

        .footer-section a {
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            display: block;
            margin-bottom: 0.5rem;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: var(--gold);
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .social-link {
            width: 50px;
            height: 50px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            transition: all 0.3s ease;
        }

        .social-link:hover {
            background: var(--gradient-gold);
            color: var(--black);
            transform: translateY(-5px);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate {
            animation: fadeInUp 1s ease forwards;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .search-form {
                flex-direction: column;
            }
            
            .nav-links {
                display: none;
            }
            
            .destinations-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="container">
            <a href="#" class="logo">LUXEVOYAGE</a>
            <ul class="nav-links">
                <li><a href="#destinations">Destinations</a></li>
                <li><a href="#experiences">Experiences</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#" class="cta-btn">Book Now</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content container animate">
            <h1>Extraordinary Journeys<br>for Discerning Travelers</h1>
            <p>Discover bespoke luxury travel experiences curated by world-class experts. From private islands to exclusive safaris, we craft unforgettable memories.</p>
            <form class="search-form">
                <input type="text" class="search-input" placeholder="Where do you want to go?">
                <button type="submit" class="search-btn">
                    <i class="fas fa-search"></i> Discover
                </button>
            </form>
        </div>
    </section>

    <!-- Destinations -->
    <section id="destinations" class="section">
        <div class="container">
            <h2 class="section-title animate">Featured Destinations</h2>
            <div class="destinations-grid">
                <div class="destination-card animate">
                    <img src="https://picsum.photos/500/500?random=1" alt="Maldives">
                    <div class="card-overlay">
                        <h3 class="card-title">Maldives</h3>
                        <div class="card-price">From $8,500/night</div>
                    </div>
                </div>
                <div class="destination-card animate">
                    <img src="https://picsum.photos/500/500?random=2" alt="Santorini">
                    <div class="card-overlay">
                        <h3 class="card-title">Santorini</h3>
                        <div class="card-price">From $4,200/night</div>
                    </div>
                </div>
                <div class="destination-card animate">
                    <img src="https://picsum.photos/500/500?random=3" alt="Safari">
                    <div class="card-overlay">
                        <h3 class="card-title">Safari</h3>
                        <div class="card-price">From $12,000/trip</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features -->
    <section id="experiences" class="section features">
        <div class="container">
            <h2 class="section-title animate">Why Choose LuxeVoyage?</h2>
            <div class="features-grid">
                <div class="feature-card glass animate">
                    <div class="feature-icon">
                        <i class="fas fa-crown"></i>
                    </div>
                    <h3>Exclusive Properties</h3>
                    <p>Access to the world's most private villas, yachts, and palaces not available on public booking sites.</p>
                </div>
                <div class="feature-card glass animate">
                    <div class="feature-icon">
                        <i class="fas fa-concierge-bell"></i>
                    </div>
                    <h3>24/7 Concierge</h3>
                    <p>Personal travel advisors available around the clock to customize every detail of your journey.</p>
                </div>
                <div class="feature-card glass animate">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Guaranteed Privacy</h3>
                    <p>Complete discretion and security for high-profile clients and celebrities.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container animate">
            <h2 class="cta-h2">Ready for Your Next Extraordinary Journey?</h2>
            <p style="font-size: 1.2rem; margin-bottom: 2rem; opacity: 0.9;">Join 5,000+ discerning travelers who trust LuxeVoyage</p>
            <a href="#" class="cta-btn" style="font-size: 1.2rem; padding: 1.2rem 3rem;">Start Planning <i class="fas fa-arrow-right"></i></a>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>LUXEVOYAGE</h3>
                    <p>Curating extraordinary travel experiences for the world's most discerning travelers.</p>
                </div>
                <div class="footer-section">
                    <h3>Destinations</h3>
                    <a href="#">Europe</a>
                    <a href="#">Asia</a>
                    <a href="#">Africa</a>
                    <a href="#">Americas</a>
                </div>
                <div class="footer-section">
                    <h3>Services</h3>
                    <a href="#">Private Jets</a>
                    <a href="#">Yacht Charters</a>
                    <a href="#">Villas</a>
                    <a href="#">Safaris</a>
                </div>
                <div class="footer-section">
                    <h3>Contact</h3>
                    <p>info@luxevoyage.com</p>
                    <p>+1 (555) 123-4567</p>
                </div>
            </div>
            <div class="social-icons">
                <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p style="margin-top: 3rem; opacity: 0.6;">© 2026 LuxeVoyage. All rights reserved. | Crafted with precision.</p>
        </div>
    </footer>

    <script>
        // Smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Animate on scroll
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        });

        document.querySelectorAll('.animate').forEach(el => observer.observe(el));

        // Search form
        document.querySelector('.search-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const query = document.querySelector('.search-input').value;
            alert(`✨ Searching premium destinations for: "${query}"\n\nWelcome to luxury travel!`);
        });
    </script>
</body>
</html>
