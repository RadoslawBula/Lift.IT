<?php
require 'config.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (empty($username) || empty($password)) {
        $error = 'Wszystkie pola są wymagane.';
    } else {
        // Sprawdź, czy użytkownik istnieje
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username");
        $stmt->execute(['username' => $username]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password_hash'])) {
            // Użytkownik zalogowany pomyślnie
            session_start();
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['username'] = $user['username'];
            header('Location: dashboard.php');  // Przekierowanie do panelu użytkownika
            exit();
        } else {
            $error = 'Nieprawidłowa nazwa użytkownika lub hasło.';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logowanie</title>
    <link rel="stylesheet" href="style/login_style.css">
    <link rel="stylesheet" href="style/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="landing-page" id="home">
        <header class="header">
            <div class="header-content">
                <img src="pic/logo.png" alt="LIFT IT Logo" class="logo">
                <nav class="nav-links">
                    <a href="page.html">Home</a>
                    <a href="page.html#learn">Learn more</a>
                    <a href="page.html#faq">FAQ</a>
                </nav>
                <div class="user-actions">
                    <img src="pic/user-icon.png" alt="User profile" class="user-icon">
                    <div class="menu-wrapper">
                        <img src="pic/menu-icon.png" alt="Menu" class="menu-icon">
                        <ul class="dropdown-menu">
                        <li><img src="pic/Login.png" alt="login" class="menu-list-icon"><a href="login.php">Login</a></li>
                        <li><img src="pic/Hand_Held_Tablet_Writing.png" alt="register" class="menu-list-icon"><a href="register.php">Register</a></li>
                        <li><img src="pic/User_Circle_Single.png" alt="profile" class="menu-list-icon"><a href="dashboard.php">Profile</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <main class="login-container">
            <?php if ($error): ?>
                <p style="color: red;"> <?php echo $error; ?> </p>
            <?php endif; ?>
            <form class="login-form" method="POST" action="">
                <h1 class="welcome-heading">Welcome back</h1>
                <div class="form-group">
                    <label for="username" class="form-label" style="color: rgba(16, 20, 25, 1);">User Name</label>
                    <input type="text" id="username" name="username" class="form-input" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label" style="color: rgba(16, 20, 25, 1);">Password</label>
                    <input type="password" id="password" name="password" class="form-input" required>
                </div>
                <div class="form-options">
                    <div class="remember-wrapper">
                        <input type="checkbox" id="remember" class="remember-checkbox">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="#" class="forgot-link">Forgot password</a>
                </div>
                <button type="submit" class="submit-button">Sign in</button>
                <p class="signup-text">Don't have an account? <a href="register.php" class="signup-link">Sign up</a></p>
            </form>
        </main>

        <footer class="footer">
    <div class="footer-content">
      <div class="footer-grid">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/12f60b77fd228d0416cd17fded1f05755baac15e6fc1136fe16237ac8dbe53d6?placeholderIfAbsent=true&apiKey=36d99834ec054334af6f078ae6b73b5b" alt="LIFT IT Logo" class="footer-logo">
        
        <div class="footer-links">
          <div class="footer-column">
            <h4 class="footer-heading">Resources</h4>
            <a href="#" class="footer-link">Privacy Policy</a>
            <a href="#" class="footer-link">Terms and Condition</a>
            <a href="page.html #faq" class="footer-link">Contact Us</a>
          </div>
          
          <div class="footer-column">
            <h4 class="footer-heading">Navigation</h4>
            <a href="page.html" class="footer-link">Home</a>
            <a href="page.html #learn" class="footer-link">Learn more</a>
            <a href="page.html #faq" class="footer-link">FAQ</a>
            <a href="login.html" class="footer-link">Login</a>
            <a href="register.html" class="footer-link">Register</a>
          </div>
          
          <div class="footer-column">
            <h4 class="footer-heading">LIFT IT</h4>
            <p class="footer-link">Subscribe to our Newsletter</p>
            <form class="newsletter-form">
              <label for="newsletter-email" class="visually-hidden">Enter your Email</label>
              <input type="email" id="newsletter-email" class="newsletter-input" placeholder="Enter your Email" required>
              <button type="submit" class="newsletter-button">Subscribe</button>
            </form>
          </div>
        </div>
      </div>
      
      <p class="copyright">Copyright © 2024 "LIFT IT" for WSB Academy Interdisciplinary Project, All Rights Reserved</p>
    </div>
  </footer>
    </div>
</body>
</html>
