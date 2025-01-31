<?php
session_start();
require_once 'config.php'; // Połączenie z bazą danych

// Sprawdzanie, czy użytkownik jest zalogowany
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Przetwarzanie formularza
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id'];
    $intake_amount = $_POST['intake_amount'];  // Ilość spożytej wody w ml
    $intake_date = $_POST['intake_date'];      // Data spożycia wody

    // Sprawdzanie, czy użytkownik już dodał wodę na dany dzień
    $stmt = $pdo->prepare("SELECT * FROM water_intake WHERE user_id = :user_id AND intake_date = :intake_date");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':intake_date', $intake_date);
    $stmt->execute();
    $existing_log = $stmt->fetch();

    if ($existing_log) {
        // Jeśli log na ten dzień już istnieje, zaktualizuj ilość spożytej wody
        $new_amount = $existing_log['intake_amount'] + $intake_amount;
        $stmt = $pdo->prepare("UPDATE water_intake SET intake_amount = :intake_amount WHERE intake_id = :intake_id");
        $stmt->bindParam(':intake_amount', $new_amount);
        $stmt->bindParam(':intake_id', $existing_log['intake_id']);
        $stmt->execute();
    } else {
        // Jeśli log na ten dzień nie istnieje, dodaj nowy wpis
        $stmt = $pdo->prepare("INSERT INTO water_intake (user_id, intake_amount, intake_date) 
                               VALUES (:user_id, :intake_amount, :intake_date)");
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':intake_amount', $intake_amount);
        $stmt->bindParam(':intake_date', $intake_date);
        $stmt->execute();
    }

    // Przekierowanie po dodaniu danych
    header('Location: add_water_intake.php');
    exit();
}

// Pobieranie logów spożycia wody użytkownika
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT * FROM water_intake WHERE user_id = :user_id ORDER BY intake_date DESC");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$water_logs = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style/water.css">
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

    <meta charset="UTF-8">
    <title>Tracking Your Water Intake</title>
</head>
<body>
    <h1>Tracking Your Water Intake</h1>

    <form action="add_water_intake.php" method="post">
        <label for="intake_amount">Amount of water consumed (ml):</label>
        <input type="number" class="dane" name="intake_amount" min="1" required><br>

        <label for="intake_date">Date of consumption:</label>
        <input type="date" class="dane" name="intake_date" value="<?php echo date('Y-m-d'); ?>" required><br>

        <button type="submit">Add water intake</button>
    </form>

    <h2>My Water Consumption Logs</h2>
    <?php if (count($water_logs) > 0): ?>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Quantity of Water (ml)</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($water_logs as $log): ?>
                    <tr>
                        <td><?php echo $log['intake_date']; ?></td>
                        <td><?php echo $log['intake_amount']; ?> ml</td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No recorded water consumption logs.</p>
    <?php endif; ?>
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
            <a href="#faq" class="footer-link">Contact Us</a>
          </div>
          
          <div class="footer-column">
            <h4 class="footer-heading">Navigation</h4>
            <a href="#home" class="footer-link">Home</a>
            <a href="#learn" class="footer-link">Learn more</a>
            <a href="#faq" class="footer-link">FAQ</a>
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