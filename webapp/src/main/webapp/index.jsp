<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Shop - Premium E-Commerce Platform</title>
    <style>
        /* ===================== GLOBAL STYLES ===================== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }
        body {
            background-color: #f5f5f5;
            color: #0f1111;
            line-height: 1.5;
        }
        a {
            text-decoration: none;
            color: inherit;
        }

        /* ===================== NAVBAR ===================== */
        .navbar {
            position: sticky;
            top: 0;
            background-color: #131921;
            color: white;
            padding: 10px 15px;
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .navbar .logo {
            font-size: 28px;
            font-weight: bold;
            color: #febd69;
        }
        .navbar .search-bar {
            flex: 1;
            display: flex;
            max-width: 700px;
        }
        .navbar .search-bar input {
            flex: 1;
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 4px 0 0 4px;
            outline: none;
        }
        .navbar .search-bar button {
            padding: 0 15px;
            background-color: #febd69;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
            font-size: 18px;
        }
        .navbar .icons {
            display: flex;
            align-items: center;
            gap: 20px;
            font-size: 14px;
        }
        .navbar .icons .cart {
            position: relative;
            cursor: pointer;
        }
        .navbar .icons .cart span {
            position: absolute;
            top: -8px;
            right: -10px;
            background: #c7511f;
            color: white;
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 50%;
        }

        /* ===================== HERO BANNER ===================== */
        .hero {
            height: 450px;
            background: url('https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg') no-repeat center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            margin-bottom: 20px;
            position: relative;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.35);
            border-radius: 0 0 8px 8px;
        }
        .hero-content {
            position: relative;
            z-index: 2;
        }
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.7);
        }
        .hero p {
            font-size: 1.5rem;
            text-shadow: 1px 1px 6px rgba(0,0,0,0.7);
        }

        /* ===================== CATEGORIES ===================== */
        .categories {
            background: white;
            padding: 20px;
            display: flex;
            overflow-x: auto;
            gap: 25px;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }
        .category {
            text-align: center;
            min-width: 120px;
            transition: transform 0.3s ease;
        }
        .category:hover {
            transform: scale(1.08);
        }
        .category img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ddd;
        }
        .category p {
            margin-top: 8px;
            font-weight: 500;
        }

        /* ===================== PRODUCT SECTIONS ===================== */
        .product-section {
            padding: 20px 30px;
            background: white;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .product-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #0f1111;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
        }
        .product-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.3s ease;
            position: relative;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
        }
        .product-card img {
            width: 100%;
            height: 220px;
            object-fit: contain;
            padding: 20px;
            background: #f9f9f9;
        }
        .product-info {
            padding: 15px;
        }
        .product-name {
            font-size: 16px;
            margin-bottom: 6px;
            color: #0066c0;
        }
        .product-price {
            font-size: 20px;
            font-weight: bold;
            color: #b12704;
            margin-bottom: 4px;
        }
        .product-rating {
            color: #ffa41c;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .discount-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #cc0c39;
            color: white;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }
        .add-to-cart {
            background: #ffd814;
            border: none;
            padding: 10px;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
            border-radius: 0 0 8px 8px;
            transition: background 0.3s;
        }
        .add-to-cart:hover {
            background: #f7ca00;
        }

        /* ===================== DEALS OF THE DAY ===================== */
        .deals-section .deals-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .countdown {
            font-size: 18px;
            font-weight: bold;
            color: #c7511f;
        }

        /* ===================== FOOTER ===================== */
        footer {
            background: #232f3e;
            color: #ddd;
            padding: 40px 20px;
            text-align: center;
        }
        .footer-links {
            display: flex;
            justify-content: center;
            gap: 60px;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        .footer-links div h4 {
            color: white;
            margin-bottom: 12px;
        }
        .footer-links ul {
            list-style: none;
        }
        .footer-links li {
            margin-bottom: 8px;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 25px;
            font-size: 28px;
            margin: 20px 0;
        }

        /* ===================== RESPONSIVE ===================== */
        @media (max-width: 1024px) {
            .navbar { flex-wrap: wrap; justify-content: center; }
            .search-bar { width: 100%; max-width: none; }
        }
        @media (max-width: 768px) {
            .hero { height: 350px; }
            .hero h1 { font-size: 2.5rem; }
            .hero p { font-size: 1.2rem; }
            .categories { gap: 15px; }
            .product-grid { grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); }
        }
        @media (max-width: 480px) {
            .navbar .icons { gap: 12px; font-size: 13px; }
            .hero { height: 280px; }
            .hero h1 { font-size: 2rem; }
        }
    </style>
</head>
<body>

    <!-- ===================== NAVBAR ===================== -->
    <header class="navbar">
        <div class="logo">E-Shop</div>
        <div class="search-bar">
            <input type="text" placeholder="Search products, brands and more...">
            <button>🔍</button>
        </div>
        <div class="icons">
            <div class="cart">🛒 <span>0</span></div>
            <span>Login</span>
            <span>Signup</span>
        </div>
    </header>

    <!-- ===================== HERO BANNER ===================== -->
    <section class="hero">
        <div class="hero-content">
            <h1>Big Sale Up to 70% Off!</h1>
            <p>Discover amazing deals on top brands. Shop now!</p>
        </div>
    </section>

    <!-- ===================== CATEGORIES ===================== -->
    <section class="categories">
        <div class="category">
            <img src="https://as1.ftcdn.net/jpg/04/84/54/92/1000_F_484549228_fhG9lFVsZ6nyupl6fHIbqSlrAwBq6pBU.jpg" alt="Mobiles">
            <p>Mobiles</p>
        </div>
        <div class="category">
            <img src="https://thumbs.dreamstime.com/b/digital-smart-devices-infographic-design-template-gadgets-visualization-steps-circle-white-background-portable-electronics-396597891.jpg" alt="Electronics">
            <p>Electronics</p>
        </div>
        <div class="category">
            <img src="https://thumbs.dreamstime.com/b/image-vector-illustration-can-be-scaled-to-any-size-loss-resolution-woman-s-clothing-icons-white-black-202780688.jpg" alt="Fashion">
            <p>Fashion</p>
        </div>
        <div class="category">
            <img src="https://thumbs.dreamstime.com/b/e-commerce-online-shopping-sale-delivery-vector-flat-line-art-concept-icons-modern-website-infographics-illustration-hero-image-71814949.jpg" alt="Home">
            <p>Home</p>
        </div>
        <div class="category">
            <img src="https://as1.ftcdn.net/jpg/04/84/54/92/1000_F_484549228_fhG9lFVsZ6nyupl6fHIbqSlrAwBq6pBU.jpg" alt="Beauty">
            <p>Beauty</p>
        </div>
    </section>

    <!-- ===================== FEATURED PRODUCTS ===================== -->
    <section class="product-section">
        <h2>Featured Products</h2>
        <div class="product-grid">
            <% 
                String[][] products = {
                    {"iPhone 14", "94999", "4.8", "10", "https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-hero-220907.jpg.landing-big_2x.jpg"},
                    {"Dell XPS Laptop", "124999", "4.7", "15", "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/dell-premium/da14250/media-gallery/platinum/touch/notebook-dell-premium-da14250t-sl-gallery-1.psd?fmt=pjpg&pscan=auto&scl=1&wid=3420&hei=2533&qlt=100,1&resMode=sharp2&size=3420,2533&chrss=full&imwidth=5000"},
                    {"Sony WH-1000XM5 Headphones", "29999", "4.9", "20", "https://images.crutchfieldonline.com/ImageHandler/trim/869/652/products/2022/19/158/g158100XM5B-F.jpg"},
                    {"Men's Casual Shirt", "2499", "4.3", "5", "https://www.amedeoexclusive.com/cdn/shop/products/AEBD8596_1200x.jpg?v=1652096103"},
                    {"Women's Elegant Dress", "3999", "4.5", "12", "https://store-of-suhel.myshopify.com/cdn/shop/products/il_794xN.2162397741_ppfv_1024x1024@2x.jpg?v=1580294751"},
                    {"Smartwatch", "7999", "4.6", "8", "https://content.abt.com/image.php/garmin-smartwatch-010-02722-20.jpg?image=/images/products/BDP_Images/garmin-smartwatch-010-02722-20.jpg&canvas=1&width=750&height=550"}
                };
                for (String[] p : products) {
            %>
            <div class="product-card">
                <img src="<%= p[4] %>" alt="<%= p[0] %>">
                <div class="product-info">
                    <div class="product-name"><%= p[0] %></div>
                    <div class="product-price">₹<%= p[1] %></div>
                    <div class="product-rating">★★★★★ <%= p[2] %></div>
                </div>
                <div class="discount-badge"><%= p[3] %>% Off</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <% } %>
        </div>
    </section>

    <!-- ===================== DEALS OF THE DAY ===================== -->
    <section class="product-section deals-section">
        <div class="deals-header">
            <h2>Deals of the Day</h2>
            <div class="countdown" id="countdown">00:00:00 left</div>
        </div>
        <div class="product-grid">
            <% 
                String[][] deals = {
                    {"Samsung Galaxy S23", "74999", "4.8", "25", "https://cdn.cs.1worldsync.com/ac/e2/ace26386-f459-4017-ae9c-c34921eedaaa.jpg"},
                    {"MacBook Air M2", "119999", "4.9", "30", "https://m.media-amazon.com/images/I/81nqNZvyvRL.jpg"},
                    {"Bose QuietComfort Earbuds", "24999", "4.7", "18", "https://m.media-amazon.com/images/I/31WiaqXVpSL.jpg"},
                    {"Premium Jeans", "3499", "4.4", "10", "https://www.cipriani-online.com/media/catalog/product/cache/1/thumbnail/17f82f742ffe127f42dca9de82fb58b1/r/i/richard_j_brown_blue_suede_6_.jpg"}
                };
                for (String[] d : deals) {
            %>
            <div class="product-card">
                <img src="<%= d[4] %>" alt="<%= d[0] %>">
                <div class="product-info">
                    <div class="product-name"><%= d[0] %></div>
                    <div class="product-price">₹<%= d[1] %></div>
                    <div class="product-rating">★★★★★ <%= d[2] %></div>
                </div>
                <div class="discount-badge"><%= d[3] %>% Off</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <% } %>
        </div>
    </section>

    <!-- ===================== FOOTER ===================== -->
    <footer>
        <div class="footer-links">
            <div>
                <h4>Get to Know Us</h4>
                <ul>
                    <li>About Us</li>
                    <li>Careers</li>
                    <li>Press Releases</li>
                    <li>Amazon Science</li>
                </ul>
            </div>
            <div>
                <h4>Make Money with Us</h4>
                <ul>
                    <li>Sell on E-Shop</li>
                    <li>Become an Affiliate</li>
                    <li>Advertise Your Products</li>
                </ul>
            </div>
            <div>
                <h4>Let Us Help You</h4>
                <ul>
                    <li>Your Account</li>
                    <li>Returns Centre</li>
                    <li>100% Purchase Protection</li>
                    <li>Help</li>
                </ul>
            </div>
            <div>
                <h4>Policies</h4>
                <ul>
                    <li>Privacy Policy</li>
                    <li>Terms of Use</li>
                    <li>Security</li>
                </ul>
            </div>
        </div>
        <div class="social-icons">
            <a href="#">📘</a>
            <a href="#">🐦</a>
            <a href="#">📸</a>
            <a href="#">▶️</a>
        </div>
        <p>© 2026 E-Shop. All rights reserved.</p>
    </footer>

    <script>
        // Countdown Timer (ends midnight today)
        function updateCountdown() {
            const now = new Date();
            const end = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1, 0, 0, 0);
            const diff = end - now;

            const h = Math.floor(diff / 3600000);
            const m = Math.floor((diff % 3600000) / 60000);
            const s = Math.floor((diff % 60000) / 1000);

            document.getElementById('countdown').textContent = 
                `${h.toString().padStart(2,'0')}:${m.toString().padStart(2,'0')}:${s.toString().padStart(2,'0')} left`;
            
            if (diff < 0) document.getElementById('countdown').textContent = "Deals Ended!";
        }
        setInterval(updateCountdown, 1000);
        updateCountdown();

        // Dummy Add to Cart
        document.querySelectorAll('.add-to-cart').forEach(btn => {
            btn.addEventListener('click', () => {
                alert('Item added to cart!');
                const count = document.querySelector('.cart span');
                count.textContent = parseInt(count.textContent) + 1;
            });
        });
    </script>
</body>
</html>
