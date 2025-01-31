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
    $workout_name = $_POST['workout_name'];
    $session_duration = $_POST['session_duration'];
    $session_date = $_POST['session_date'];

    // Wstawienie sesji treningowej do tabeli `workout_sessions`
    $stmt = $pdo->prepare("INSERT INTO workout_sessions (user_id, workout_name, session_duration, session_date) 
                           VALUES (:user_id, :workout_name, :session_duration, :session_date)");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':workout_name', $workout_name);
    $stmt->bindParam(':session_duration', $session_duration);
    $stmt->bindParam(':session_date', $session_date);
    $stmt->execute();
    $session_id = $pdo->lastInsertId(); // Pobieranie ID nowej sesji

    // Dodawanie ćwiczeń do tabeli `session_exercises`
    $exercise_ids = $_POST['exercise_id']; // Ćwiczenia wybierane w formularzu
    $repetitions = $_POST['reps']; // Liczba powtórzeń
    $weights = $_POST['weight']; // Obciążenie

    // Przechodzimy po każdym ćwiczeniu i zapisujemy je
    foreach ($exercise_ids as $index => $exercise_id) {
        $stmt = $pdo->prepare("INSERT INTO session_exercises (session_id, exercise_id, repetitions, weight) 
                               VALUES (:session_id, :exercise_id, :repetitions, :weight)");
        $stmt->bindParam(':session_id', $session_id);
        $stmt->bindParam(':exercise_id', $exercise_id);
        $stmt->bindParam(':repetitions', $repetitions[$index]);
        $stmt->bindParam(':weight', $weights[$index]);
        $stmt->execute();

        // Po zapisaniu ćwiczenia sprawdzamy, czy użytkownik zdobył jakieś osiągnięcie
        $stmt = $pdo->prepare("
            SELECT a.achievement_id, a.target_weight 
            FROM achievements a
            WHERE a.exercise_id = :exercise_id AND :weight >= a.target_weight
        ");
        $stmt->bindParam(':exercise_id', $exercise_id);
        $stmt->bindParam(':weight', $weights[$index]);
        $stmt->execute();
        $achievements = $stmt->fetchAll();

        // Jeśli użytkownik spełnia wymagania dla osiągnięcia, dodajemy je do user_achievements
        foreach ($achievements as $achievement) {
            $stmt = $pdo->prepare("
                INSERT INTO user_achievements (user_id, achievement_id)
                VALUES (:user_id, :achievement_id)
            ");
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':achievement_id', $achievement['achievement_id']);
            $stmt->execute();
        }
    }

    // Przekierowanie na tę samą stronę, aby formularz był pusty po zapisaniu sesji
    header('Location: add_workout_session.php');
    exit();
}

// Pobieranie zapisanych sesji użytkownika
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT * FROM workout_sessions WHERE user_id = :user_id ORDER BY session_date DESC");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$sessions = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style/workout_style.css">
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
        <h1 class="page-title">Your Workout Log</h1>
        <form class="workout-form" method="POST" action="">
            <div class="form-grid">
                <div class="exercise-section">
                    <h2 class="section-title">Add New Session</h2>
                    <label for="workout_name" class="session-name-label">Session Name</label>
                    <input type="text" id="workout_name" name="workout_name" class="session-input" required>
                    <label for="exercise" class="select-label">Exercise</label>
                    <select id="exercise" name="exercise_id[]" class="select-dropdown" multiple required>
                        <option value="1">Bench Press</option>
                        <option value="2">Squat</option>
                        <option value="3">Deadlift</option>
                    </select>
                    <label for="reps" class="select-label">Reps</label>
                    <input type="number" id="reps" name="reps[]" class="reps-input" required>
                    <label for="weight" class="select-label">Weight (kg)</label>
                    <input type="number" id="weight" name="weight[]" class="weight-input" step="0.1" required>
                </div>
                <div class="workout-details">
                    <label for="session_date" class="detail-label">Date</label>
                    <input type="date" id="session_date" name="session_date" class="date-picker" required>
                    <label for="session_duration" class="detail-label">Duration</label>
                    <input type="time" id="session_duration" name="session_duration" class="duration-input" required>
                    <button type="submit" class="submit-btn">Add</button>
                </div>
            </div>
        </form>

        <div class="sessions-section">
        <h2>My training sessions</h2>
        <?php if (count($sessions) > 0): ?>
            <table class="sessions-table">
                <thead>
                    <tr>
                        <th>Session name</th>
                        <th>Duration</th>
                        <th>Date</th>
                        <th>Exercise</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($sessions as $session): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($session['workout_name']); ?></td>
                            <td><?php echo $session['session_duration']; ?></td>
                            <td><?php echo $session['session_date']; ?></td>
                            <td>
                                <?php
                                // Wyświetlanie ćwiczeń dla danej sesji
                                $session_id = $session['session_id'];
                                $stmt = $pdo->prepare("SELECT e.exercise_name, se.repetitions, se.weight 
                                                       FROM session_exercises se 
                                                       JOIN exercises e ON e.exercise_id = se.exercise_id 
                                                       WHERE se.session_id = :session_id");
                                $stmt->bindParam(':session_id', $session_id);
                                $stmt->execute();
                                $exercises = $stmt->fetchAll();

                                foreach ($exercises as $exercise) {
                                    echo $exercise['exercise_name'] . " - " . $exercise['repetitions'] . " powtórzeń - " . $exercise['weight'] . " kg<br>";
                                }
                                ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>Brak zapisanych sesji treningowych.</p>
        <?php endif; ?>
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
    </div>
</body>
</html>
