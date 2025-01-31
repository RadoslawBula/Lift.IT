<?php
// Łączenie z bazą danych
include('config.php'); // Używamy PDO z pliku config.php

// Inicjalizacja zmiennych
$user_strength_level = "";
$selected_body_mass = null;

// Sprawdzanie, czy formularz został wysłany
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pobieranie wartości z formularza
    $gender = $_POST['gender'];
    $exercise_id = $_POST['exercise_id'];
    $user_weight = isset($_POST['user_weight']) ? (float) $_POST['user_weight'] : 0;
    $user_lift_weight = isset($_POST['user_lift_weight']) ? (float) $_POST['user_lift_weight'] : 0;
    
    try {
        // Pobieranie poziomów siły z tabeli exercise_strength_levels
        $sql = "SELECT body_mass, lvl_poczatkujacy, lvl_nowicjusz, lvl_sredniozawansowany, lvl_zawansowany, lvl_elita 
                FROM exercise_strength_levels 
                WHERE gender = :gender AND exercise_id = :exercise_id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':gender', $gender, PDO::PARAM_STR);
        $stmt->bindParam(':exercise_id', $exercise_id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Znalezienie najbliższego rekordu masy ciała do masy użytkownika
        if ($user_weight > 0 && count($result) > 0) {
            $closest_row = null;
            $min_difference = PHP_INT_MAX;
            foreach ($result as $row) {
                $diff = abs($row['body_mass'] - $user_weight);
                if ($diff < $min_difference) {
                    $min_difference = $diff;
                    $closest_row = $row;
                    $selected_body_mass = $row['body_mass'];
                }
            }

            // Określenie poziomu siły użytkownika
            if ($closest_row) {
                if ($user_lift_weight >= $closest_row['lvl_elita']) {
                    $user_strength_level = "Elita";
                } elseif ($user_lift_weight >= $closest_row['lvl_zawansowany']) {
                    $user_strength_level = "Zaawansowany";
                } elseif ($user_lift_weight >= $closest_row['lvl_sredniozawansowany']) {
                    $user_strength_level = "Średniozaawansowany";
                } elseif ($user_lift_weight >= $closest_row['lvl_nowicjusz']) {
                    $user_strength_level = "Nowicjusz";
                } elseif ($user_lift_weight >= $closest_row['lvl_poczatkujacy']) {
                    $user_strength_level = "Początkujący";
                } else {
                    $user_strength_level = "Poniżej początkującego";
                }
            }
        }
    } catch (PDOException $e) {
        echo "Błąd zapytania: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poziom Siły</title>
</head>
<body>
    <h1>Poziom Siły</h1>

    <!-- Formularz wyboru płci, ćwiczenia oraz podania masy ciała i ciężaru -->
    <form method="POST" action="strength_levels.php">
        <label for="gender">Płeć:</label><br>
        <input type="radio" id="male" name="gender" value="m" required>
        <label for="male">Mężczyzna</label>
        <input type="radio" id="female" name="gender" value="k" required>
        <label for="female">Kobieta</label><br><br>

        <label for="exercise_id">Wybierz ćwiczenie:</label><br>
        <select name="exercise_id" id="exercise_id" required>
            <option value="1">Sztanga na ławce</option>
            <option value="2">Przysiad ze sztangą</option>
            <option value="3">Martwy ciąg</option>
        </select><br><br>

        <label for="user_weight">Twoja masa ciała (kg):</label><br>
        <input type="number" name="user_weight" id="user_weight" step="0.1" required><br><br>

        <label for="user_lift_weight">Ciężar, który podnosisz (kg):</label><br>
        <input type="number" name="user_lift_weight" id="user_lift_weight" step="0.1" required><br><br>

        <input type="submit" value="Sprawdź poziom">
    </form>
</br>
    <?php
    // Wyświetlenie tabeli z poziomami siły
    if (isset($result)) {
        if (count($result) > 0) {
            echo "<table border='1'>";
            echo "<tr><th>Masa Ciała (kg)</th><th>Poziom Początkujący (kg)</th><th>Poziom Nowicjusz (kg)</th><th>Poziom Średniozaawansowany (kg)</th><th>Poziom Zaawansowany (kg)</th><th>Poziom Elita (kg)</th></tr>";
            foreach ($result as $row) {
                echo "<tr>
                        <td>{$row['body_mass']}</td>
                        <td>{$row['lvl_poczatkujacy']}</td>
                        <td>{$row['lvl_nowicjusz']}</td>
                        <td>{$row['lvl_sredniozawansowany']}</td>
                        <td>{$row['lvl_zawansowany']}</td>
                        <td>{$row['lvl_elita']}</td>
                      </tr>";
            }
            echo "</table>";

            // Wyświetlenie poziomu siły użytkownika
            if ($user_strength_level) {
                echo "<h2>Twoja masa ciała: $user_weight kg</h2>";
                echo "<h2>Najbliższy rekord w tabeli: $selected_body_mass kg</h2>";
                echo "<h2>Twój poziom siły: <strong>$user_strength_level</strong></h2>";
            }
        } else {
            echo "Brak wyników dla wybranej płci i ćwiczenia.";
        }
    }
    ?>

<a href="dashboard.php">Powrót do dashboard</a>

</body>
</html>
