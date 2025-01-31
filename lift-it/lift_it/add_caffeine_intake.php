<?php
session_start();
require 'config.php';



if (!isset($_SESSION['user_id'])) {
	
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];



if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['drink_type']) && isset($_POST['intake'])) {
    $drink_type = $_POST['drink_type'];
    $amount_ml = $_POST['intake'];
    $date = $_POST['date'];
	
	
	
    
    $caffeine_content = 0;
    

    switch ($drink_type) {
        case 'espresso':
            $caffeine_content = 75; 
            break;
        case 'kawa_parzona':
            $caffeine_content = 70; 
            break;
        case 'kawa_rozpuszczalna':
            $caffeine_content = 90; 
            break;
        case 'americano':
            $caffeine_content = 30; 
            break;
        case 'cappuccino_latte':
            $caffeine_content = 75; 
            break;
        case 'cold_brew':
            $caffeine_content = 100; 
            break;
        case 'kawa_mokka':
            $caffeine_content = 60; 
            break;
        case 'ekspres_przelewowy':
            $caffeine_content = 120; 
            break;
        case 'energetyk':
            $caffeine_content = 32;
    }
	

  
    if ($caffeine_content > 0) {
        $caffeine_content = ($caffeine_content * $amount_ml) / 100; 
    }

   
    $stmt = $pdo->prepare("INSERT INTO caffeine_intake (user_id, drink_type, amount_ml, caffeine_content, date) 
                           VALUES (:user_id, :drink_type, :amount_ml, :caffeine_content, :date)");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':drink_type', $drink_type);
    $stmt->bindParam(':amount_ml', $amount_ml);
    $stmt->bindParam(':caffeine_content', $caffeine_content);
    $stmt->bindParam(':date', $date);
    $stmt->execute();


  
}


$stmt = $pdo->prepare("SELECT date, drink_type, SUM(amount_ml) AS total_ml, SUM(caffeine_content) AS total_caffeine 
                       FROM caffeine_intake WHERE user_id = :user_id GROUP BY date, drink_type ORDER BY date DESC, total_caffeine DESC");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$caffeine_logs = $stmt->fetchAll();
?>




    <!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style/add_caffeine_intake.css">
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/water.css">
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

  

  <h1 class="tracker-title">Coffeine Log</h1>

  <form class="input-container" action="add_caffeine_intake.php" method="POST">
    <div class="intake-field">
      <label for="intake" class="input-label">Intake size (ml)</label>
	
      <div class="input-wrapper">
        
 
		
          <input type="number" class="dane" id="intake" aria-label="Enter intake size in milliliters" name="intake"/>
		  
        </div>

	<div class="intake-field">
		<label for="drink-type" class="input-label">Type of drink </label>
		<div class="input-wrapper">

				<select name="drink_type" class="dane"  id="drink-type" required>
					<option value="espresso">Espresso</option>
					<option value="Brewed">Brewed coffee</option>
					<option value="Instant">Instant coffee</option>
					<option value="americano">Americano</option>
					<option value="cappuccino_latte">Cappuccino/Latte</option>
					<option value="cold_brew">Cold Brew</option>
					<option value="Mokka">Mokka coffe</option>
					<option value="Drip">Drip coffee</option>
					<option value="Energy">Energy drink</option>
				</select><br><br>
				
			</div>
		</div>


    <div class="date-field">
      <label for="date" class="input-label" class="dane">Date</label>

        <input type="date" id="date" class="dane" aria-label="Select date" name="date"/>
      </div>
    </div>
	
	<button type="submit">Add intake</button>
		</div>
	
	
  </form>

	
 



	<h2>Your caffeine intake</h2>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Beverage type</th>
                <th>Total quantity (ml)</th>
                <th>Total caffeine (mg)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <?php 
            $current_date = '';
            foreach ($caffeine_logs as $log): 
               
                if ($current_date !== $log['date']) {
                    $current_date = $log['date'];
                    echo "<td><strong>Data: " . htmlspecialchars($log['date']) . "</strong></td>";
                }
            ?>
                

                    <td><?php echo htmlspecialchars($log['drink_type']); ?></td>
                    <td><?php echo $log['total_ml']; ?> ml</td>
                    <td><?php echo $log['total_caffeine']; ?> mg</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
 
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
  </body>
</html>
