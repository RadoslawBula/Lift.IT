<?php
session_start();
require_once 'config.php'; // Połączenie z bazą danych

// Sprawdzenie, czy użytkownik jest zalogowany
if (!isset($_SESSION['user_id'])) {
    die("Musisz być zalogowany, aby zobaczyć osiągnięcia.");
}

// Zapytanie SQL do pobrania osiągnięć i sprawdzenia, czy zostały zdobyte przez użytkownika
$query = "
    SELECT 
        a.achievement_id,
        a.achievement_name,
        a.description,
        CASE 
            WHEN ua.user_id IS NOT NULL THEN 1
            ELSE 0
        END AS is_achieved
    FROM achievements a
    LEFT JOIN user_achievements ua ON a.achievement_id = ua.achievement_id AND ua.user_id = :user_id
";

$stmt = $pdo->prepare($query);
$stmt->bindParam(':user_id', $_SESSION['user_id'], PDO::PARAM_INT);
$stmt->execute();
$achievements = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style/achievements_style.css">
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
</head>
<body>
    <h1>Osiągnięcia</h1>
    <table>
        <thead>
            <tr>
                <th>Osiągnięcie</th>
                <th>Opis</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($achievements as $achievement): ?>
                <tr>
                    <td><?php echo htmlspecialchars($achievement['achievement_name']); ?></td>
                    <td><?php echo htmlspecialchars($achievement['description']); ?></td>
                    <td>
                        <?php echo $achievement['is_achieved'] ? 'Zdobyte' : 'Nie zdobyte'; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table></br>

    <a href="dashboard.php">Powrót do dashboard</a>
</body>
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
</html>