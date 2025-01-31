<?php
require 'config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT email, username, profile_picture FROM users WHERE user_id = :user_id");
$stmt->execute(['user_id' => $user_id]);
$user = $stmt->fetch();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['nickname'])) {
        $new_username = trim($_POST['nickname']);
        $updateStmt = $pdo->prepare("UPDATE users SET username = :username WHERE user_id = :user_id");
        $updateStmt->execute(['username' => $new_username, 'user_id' => $user_id]);
        $_SESSION['username'] = $new_username;
    }

    if (isset($_POST['password']) && isset($_POST['confirm_password'])) {
        if ($_POST['password'] === $_POST['confirm_password']) {
            $password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);
            $updateStmt = $pdo->prepare("UPDATE users SET password_hash = :password WHERE user_id = :user_id");
            $updateStmt->execute(['password' => $password_hash, 'user_id' => $user_id]);
        }
    }

    if (isset($_FILES['profile_picture']) && $_FILES['profile_picture']['error'] === UPLOAD_ERR_OK) {
        $imgPath = 'uploads/' . basename($_FILES['profile_picture']['name']);
        move_uploaded_file($_FILES['profile_picture']['tmp_name'], $imgPath);
        $updateStmt = $pdo->prepare("UPDATE users SET profile_picture = :profile_picture WHERE user_id = :user_id");
        $updateStmt->execute(['profile_picture' => $imgPath, 'user_id' => $user_id]);
    }
    header('Location: dashboard.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style/profile_style.css">
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

        <main class="main-content">
            <div class="profile-grid">
                <section class="profile-card">
                    <form method="POST" enctype="multipart/form-data" class="centered-form">
                        <div class="profile-picture-section">
                            <button type="button" class="change-picture-btn" onclick="document.getElementById('profile_picture').click();">Change Profile Picture</button>
                            <input type="file" name="profile_picture" id="profile_picture" class="profile-picture-input" accept="image/*" hidden>
                            <img src= "<?php echo htmlspecialchars($user['profile_picture'] ?? 'default-pic.png'); ?>" alt="Profile Picture" class="profile-image" style="width: 50%;" height="50%"/>
                        </div>
                        <div class="profile-details">
                            <div class="user-info">
                                <h1 class="welcome-text"><strong>Hello!</strong> <span><?php echo htmlspecialchars($user['username']); ?></span></h1>
                                <div class="nickname-section">
                                    Change nickname
                                    <input type="text" name="nickname" class="info-label" value="<?php echo htmlspecialchars($user['username']); ?>">
                                </div>
                                <div class="password-section">
                                    Change password
                                    <input type="password" name="password" class="info-label" placeholder="New Password">
                                    <input type="password" name="confirm_password" class="info-label" placeholder="Confirm Password">
                                </div>
                            </div>
                            <div class="buttons-container centered-buttons">
                                <button type="submit" class="save-btn">Save Changes</button>
                                <form method="POST" action="logout.php" class="logout-form">
                                    <button type="submit" class="logout-btn">Logout</button>
                                </form>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
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
