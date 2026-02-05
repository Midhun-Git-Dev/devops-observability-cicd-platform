<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Data structures to prevent "Hardcoded Duplication" flags in SonarQube
    List<Map<String, String>> movieData = new ArrayList<>();
    
    String[] movieTitles = {"The Batman", "Interstellar", "Inception", "Pathaan"};
    String[] movieGenres = {"Action/Crime", "Sci-Fi/Drama", "Action/Sci-Fi", "Action/Thriller"};
    String[] movieRatings = {"8.5/10", "9.1/10", "8.8/10", "7.5/10"};
    String[] movieLangs = {"English", "English", "English", "Hindi"};

    for (int i = 0; i < movieTitles.length; i++) {
        Map<String, String> m = new HashMap<>();
        m.put("title", movieTitles[i]);
        m.put("genre", movieGenres[i]);
        m.put("rating", movieRatings[i]);
        m.put("lang", movieLangs[i]);
        movieData.add(m);
    }
%>
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
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Arial, sans-serif; }
        body { background-color: #f5f5f5; color: #222; line-height: 1.6; }

        /* --- Header & Navbar --- */
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

        .logo { font-size: 24px; font-weight: bold; color: var(--primary-red); text-decoration: none; }

        .search-container { flex-grow: 1; max-width: 500px; position: relative; margin: 0 20px; }
        .search-container input { width: 100%; padding: 10px 40px; border-radius: 4px; border: none; outline: none; }
        .search-container i { position: absolute; left: 12px; top: 12px; color: #999; }

        .nav-right { display: flex; align-items: center; gap: 15px; }
        .loc-select { background: transparent; color: white; border: 1px solid #555; border-radius: 4px; padding: 4px; cursor: pointer; }
        .btn-login { background-color: var(--primary-red); color: white; border: none; padding: 8px 18px; border-radius: 4px; cursor: pointer; font-weight: bold; }

        /* --- Hero Section --- */
        .hero { background-color: var(--bg-dark); padding: 20px 0; }
        .banner {
            width: 90%; max-width: 1200px; height: 300px; margin: 0 auto; border-radius: 10px;
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('https://via.placeholder.com/1200x300/333/fff?text=Now+Showing:+Blockbuster+Hits') center/cover;
            display: flex; align-items: center; justify-content: center; color: white; text-align: center;
        }

        /* --- Content Layout --- */
        .container { width: 90%; max-width: 1200px; margin: 40px auto; }
        h2 { margin-bottom: 25px; font-size: 24px; border-left: 5px solid var(--primary-red); padding-left: 15px; }

        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); gap: 25px; margin-bottom: 50px; }

        /* --- Card Styles --- */
        .card { background: white; border-radius: 10px; overflow: hidden; transition: 0.3s; box-shadow: 0 4px 10px rgba(0,0,0,0.1); cursor: pointer; }
        .card:hover { transform: translateY(-8px); }

        .poster-box { position: relative; height: 350px; }
        .poster-box img { width: 100%; height: 100%; object-fit: cover; }
        .rating-badge { position: absolute; bottom: 0; background: rgba(0,0,0,0.8); color: white; width: 100%; padding: 8px; font-size: 13px; }

        .card-body { padding: 15px; }
        .m-title { font-weight: bold; font-size: 18px; margin-bottom: 5px; }
        .m-info { font-size: 14px; color: #666; margin-bottom: 15px; }
        .btn-book { width: 100%; padding: 10px; background: var(--primary-red); color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; }

        /* --- Footer --- */
        footer { background-color: var(--bg-nav); color: var(--text-gray); padding: 40px 5%; text-align: center; }
        .socials { margin-bottom: 20px; font-size: 20px; }
        .socials i { margin: 0 10px; cursor: pointer; }
        .f-links a { color: var(--text-gray); text-decoration: none; margin: 0 10px; font-size: 14px; }

        @media (max-width: 768px) { .search-container { display: none; } .banner { height: 160px; } }
    </style>
</head>
<body>

    <header>
        <a href="#" class="logo">ShowTime</a>
        <div class="search-container">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search for Movies, Events, Plays, Sports">
        </div>
        <div class="nav-right">
            <select class="loc-select">
                <option>Bangalore</option>
                <option>Mumbai</option>
                <option>Chennai</option>
                <option>Hyderabad</option>
            </select>
            <button class="btn-login">Sign In</button>
        </div>
    </header>

    <div class="hero">
        <div class="banner" id="promo-banner">
            <h1>Experience Cinema Like Never Before</h1>
        </div>
    </div>

    <main class="container">
        <h2>Movies - Now Showing</h2>
        <div class="grid">
            <% for(Map<String, String> movie : movieData) { %>
                <article class="card">
                    <div class="poster-box">
                        <img src="https://via.placeholder.com/300x450/111/fff?text=<%= movie.get("title").replace(" ", "+") %>" alt="<%= movie.get("title") %> Poster">
                        <div class="rating-badge">
                            <i class="fas fa-star" style="color:var(--primary-red)"></i> <%= movie.get("rating") %>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="m-title"><%= movie.get("title") %></div>
                        <div class="m-info"><%= movie.get("genre") %> • <%= movie.get("lang") %></div>
                        <button class="btn-book" onclick="alert('Proceeding to seat selection...')">Book Tickets</button>
                    </div>
                </article>
            <% } %>
        </div>

        <h2>Live Events</h2>
        <div class="grid">
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Comedy+Night" style="width:100%; height:200px; object-fit:cover;">
                <div class="card-body">
                    <div class="m-title">Stand-up Sunday</div>
                    <div class="m-info">Comedy • English</div>
                </div>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/300x200/444/fff?text=Live+Music" style="width:100%; height:200px; object-fit:cover;">
                <div class="card-body">
                    <div class="m-title">Rock Concert</div>
                    <div class="m-info">Music • Outdoor</div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <div class="socials">
            <i class="fab fa-facebook"></i> <i class="fab fa-twitter"></i> <i class="fab fa-instagram"></i>
        </div>
        <div class="f-links">
            <a href="#">About Us</a> | <a href="#">Terms of Service</a> | <a href="#">Contact</a>
        </div>
        <p style="margin-top: 15px; font-size: 12px;">&copy; 2026 ShowTime Ticketing. All Rights Reserved.</p>
    </footer>

    <script>
        (function() {
            "use strict";
            const banner = document.getElementById('promo-banner');
            const msgs = ["Experience Cinema Like Never Before", "Get 20% Off on Your First Booking", "Explore Live Events in Your City"];
            let i = 0;
            setInterval(() => {
                i = (i + 1) % msgs.length;
                banner.innerHTML = "<h1>" + msgs[i] + "</h1>";
            }, 5000);
        })();
    </script>
</body>
</html>
