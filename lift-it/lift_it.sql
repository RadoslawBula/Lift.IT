-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 31, 2025 at 04:31 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lift_it`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievements`
--

CREATE TABLE `achievements` (
  `achievement_id` int(11) NOT NULL,
  `achievement_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `exercise_name` varchar(255) NOT NULL,
  `target_weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`achievement_id`, `achievement_name`, `description`, `exercise_id`, `exercise_name`, `target_weight`) VALUES
(1, 'Sztanga na ławce 20 kg', 'Podniesienie 20 kg na ławce', 1, 'bench_press', 20),
(2, 'Sztanga na ławce 30 kg', 'Podniesienie 30 kg na ławce', 1, 'bench_press', 30),
(3, 'Sztanga na ławce 40 kg', 'Podniesienie 40 kg na ławce', 1, 'bench_press', 40),
(4, 'Sztanga na ławce 50 kg', 'Podniesienie 50 kg na ławce', 1, 'bench_press', 50),
(5, 'Sztanga na ławce 60 kg', 'Podniesienie 60 kg na ławce', 1, 'bench_press', 60),
(6, 'Sztanga na ławce 70 kg', 'Podniesienie 70 kg na ławce', 1, 'bench_press', 70),
(7, 'Sztanga na ławce 80 kg', 'Podniesienie 80 kg na ławce', 1, 'bench_press', 80),
(8, 'Sztanga na ławce 90 kg', 'Podniesienie 90 kg na ławce', 1, 'bench_press', 90),
(9, 'Sztanga na ławce 100 kg', 'Podniesienie 100 kg na ławce', 1, 'bench_press', 100),
(10, 'Sztanga na ławce 110 kg', 'Podniesienie 110 kg na ławce', 1, 'bench_press', 110),
(11, 'Sztanga na ławce 120 kg', 'Podniesienie 120 kg na ławce', 1, 'bench_press', 120),
(12, 'Sztanga na ławce 130 kg', 'Podniesienie 130 kg na ławce', 1, 'bench_press', 130),
(13, 'Sztanga na ławce 140 kg', 'Podniesienie 140 kg na ławce', 1, 'bench_press', 140),
(14, 'Sztanga na ławce 150 kg', 'Podniesienie 150 kg na ławce', 1, 'bench_press', 150),
(15, 'Sztanga na ławce 160 kg', 'Podniesienie 160 kg na ławce', 1, 'bench_press', 160),
(16, 'Sztanga na ławce 170 kg', 'Podniesienie 170 kg na ławce', 1, 'bench_press', 170),
(17, 'Sztanga na ławce 180 kg', 'Podniesienie 180 kg na ławce', 1, 'bench_press', 180),
(18, 'Sztanga na ławce 190 kg', 'Podniesienie 190 kg na ławce', 1, 'bench_press', 190),
(19, 'Sztanga na ławce 200 kg', 'Podniesienie 200 kg na ławce', 1, 'bench_press', 200),
(20, 'Sztanga na ławce 210 kg', 'Podniesienie 210 kg na ławce', 1, 'bench_press', 210),
(21, 'Sztanga na ławce 220 kg', 'Podniesienie 220 kg na ławce', 1, 'bench_press', 220),
(22, 'Sztanga na ławce 230 kg', 'Podniesienie 230 kg na ławce', 1, 'bench_press', 230),
(23, 'Sztanga na ławce 240 kg', 'Podniesienie 240 kg na ławce', 1, 'bench_press', 240),
(24, 'Sztanga na ławce 250 kg', 'Podniesienie 250 kg na ławce', 1, 'bench_press', 250),
(25, 'Przysiad ze sztangą 20 kg', 'Wykonanie przysiadu ze sztangą o wadze 20 kg', 2, 'squat', 20),
(26, 'Przysiad ze sztangą 30 kg', 'Wykonanie przysiadu ze sztangą o wadze 30 kg', 2, 'squat', 30),
(27, 'Przysiad ze sztangą 40 kg', 'Wykonanie przysiadu ze sztangą o wadze 40 kg', 2, 'squat', 40),
(28, 'Przysiad ze sztangą 50 kg', 'Wykonanie przysiadu ze sztangą o wadze 50 kg', 2, 'squat', 50),
(29, 'Przysiad ze sztangą 60 kg', 'Wykonanie przysiadu ze sztangą o wadze 60 kg', 2, 'squat', 60),
(30, 'Przysiad ze sztangą 70 kg', 'Wykonanie przysiadu ze sztangą o wadze 70 kg', 2, 'squat', 70),
(31, 'Przysiad ze sztangą 80 kg', 'Wykonanie przysiadu ze sztangą o wadze 80 kg', 2, 'squat', 80),
(32, 'Przysiad ze sztangą 90 kg', 'Wykonanie przysiadu ze sztangą o wadze 90 kg', 2, 'squat', 90),
(33, 'Przysiad ze sztangą 100 kg', 'Wykonanie przysiadu ze sztangą o wadze 100 kg', 2, 'squat', 100),
(34, 'Przysiad ze sztangą 110 kg', 'Wykonanie przysiadu ze sztangą o wadze 110 kg', 2, 'squat', 110),
(35, 'Przysiad ze sztangą 120 kg', 'Wykonanie przysiadu ze sztangą o wadze 120 kg', 2, 'squat', 120),
(36, 'Przysiad ze sztangą 130 kg', 'Wykonanie przysiadu ze sztangą o wadze 130 kg', 2, 'squat', 130),
(37, 'Przysiad ze sztangą 140 kg', 'Wykonanie przysiadu ze sztangą o wadze 140 kg', 2, 'squat', 140),
(38, 'Przysiad ze sztangą 150 kg', 'Wykonanie przysiadu ze sztangą o wadze 150 kg', 2, 'squat', 150),
(39, 'Przysiad ze sztangą 160 kg', 'Wykonanie przysiadu ze sztangą o wadze 160 kg', 2, 'squat', 160),
(40, 'Przysiad ze sztangą 170 kg', 'Wykonanie przysiadu ze sztangą o wadze 170 kg', 2, 'squat', 170),
(41, 'Przysiad ze sztangą 180 kg', 'Wykonanie przysiadu ze sztangą o wadze 180 kg', 2, 'squat', 180),
(42, 'Przysiad ze sztangą 190 kg', 'Wykonanie przysiadu ze sztangą o wadze 190 kg', 2, 'squat', 190),
(43, 'Przysiad ze sztangą 200 kg', 'Wykonanie przysiadu ze sztangą o wadze 200 kg', 2, 'squat', 200),
(44, 'Przysiad ze sztangą 210 kg', 'Wykonanie przysiadu ze sztangą o wadze 210 kg', 2, 'squat', 210),
(45, 'Przysiad ze sztangą 220 kg', 'Wykonanie przysiadu ze sztangą o wadze 220 kg', 2, 'squat', 220),
(46, 'Przysiad ze sztangą 230 kg', 'Wykonanie przysiadu ze sztangą o wadze 230 kg', 2, 'squat', 230),
(47, 'Przysiad ze sztangą 240 kg', 'Wykonanie przysiadu ze sztangą o wadze 240 kg', 2, 'squat', 240),
(48, 'Przysiad ze sztangą 250 kg', 'Wykonanie przysiadu ze sztangą o wadze 250 kg', 2, 'squat', 250),
(49, 'Przysiad ze sztangą 260 kg', 'Wykonanie przysiadu ze sztangą o wadze 260 kg', 2, 'squat', 260),
(50, 'Przysiad ze sztangą 270 kg', 'Wykonanie przysiadu ze sztangą o wadze 270 kg', 2, 'squat', 270),
(51, 'Przysiad ze sztangą 280 kg', 'Wykonanie przysiadu ze sztangą o wadze 280 kg', 2, 'squat', 280),
(52, 'Przysiad ze sztangą 290 kg', 'Wykonanie przysiadu ze sztangą o wadze 290 kg', 2, 'squat', 290),
(53, 'Przysiad ze sztangą 300 kg', 'Wykonanie przysiadu ze sztangą o wadze 300 kg', 2, 'squat', 300),
(54, 'Martwy ciąg 20 kg', 'Wykonanie martwego ciągu o wadze 20 kg', 3, 'deadlift', 20),
(55, 'Martwy ciąg 30 kg', 'Wykonanie martwego ciągu o wadze 30 kg', 3, 'deadlift', 30),
(56, 'Martwy ciąg 40 kg', 'Wykonanie martwego ciągu o wadze 40 kg', 3, 'deadlift', 40),
(57, 'Martwy ciąg 50 kg', 'Wykonanie martwego ciągu o wadze 50 kg', 3, 'deadlift', 50),
(58, 'Martwy ciąg 60 kg', 'Wykonanie martwego ciągu o wadze 60 kg', 3, 'deadlift', 60),
(59, 'Martwy ciąg 70 kg', 'Wykonanie martwego ciągu o wadze 70 kg', 3, 'deadlift', 70),
(60, 'Martwy ciąg 80 kg', 'Wykonanie martwego ciągu o wadze 80 kg', 3, 'deadlift', 80),
(61, 'Martwy ciąg 90 kg', 'Wykonanie martwego ciągu o wadze 90 kg', 3, 'deadlift', 90),
(62, 'Martwy ciąg 100 kg', 'Wykonanie martwego ciągu o wadze 100 kg', 3, 'deadlift', 100),
(63, 'Martwy ciąg 110 kg', 'Wykonanie martwego ciągu o wadze 110 kg', 3, 'deadlift', 110),
(64, 'Martwy ciąg 120 kg', 'Wykonanie martwego ciągu o wadze 120 kg', 3, 'deadlift', 120),
(65, 'Martwy ciąg 130 kg', 'Wykonanie martwego ciągu o wadze 130 kg', 3, 'deadlift', 130),
(66, 'Martwy ciąg 140 kg', 'Wykonanie martwego ciągu o wadze 140 kg', 3, 'deadlift', 140),
(67, 'Martwy ciąg 150 kg', 'Wykonanie martwego ciągu o wadze 150 kg', 3, 'deadlift', 150),
(68, 'Martwy ciąg 160 kg', 'Wykonanie martwego ciągu o wadze 160 kg', 3, 'deadlift', 160),
(69, 'Martwy ciąg 170 kg', 'Wykonanie martwego ciągu o wadze 170 kg', 3, 'deadlift', 170),
(70, 'Martwy ciąg 180 kg', 'Wykonanie martwego ciągu o wadze 180 kg', 3, 'deadlift', 180),
(71, 'Martwy ciąg 190 kg', 'Wykonanie martwego ciągu o wadze 190 kg', 3, 'deadlift', 190),
(72, 'Martwy ciąg 200 kg', 'Wykonanie martwego ciągu o wadze 200 kg', 3, 'deadlift', 200),
(73, 'Martwy ciąg 210 kg', 'Wykonanie martwego ciągu o wadze 210 kg', 3, 'deadlift', 210),
(74, 'Martwy ciąg 220 kg', 'Wykonanie martwego ciągu o wadze 220 kg', 3, 'deadlift', 220),
(75, 'Martwy ciąg 230 kg', 'Wykonanie martwego ciągu o wadze 230 kg', 3, 'deadlift', 230),
(76, 'Martwy ciąg 240 kg', 'Wykonanie martwego ciągu o wadze 240 kg', 3, 'deadlift', 240),
(77, 'Martwy ciąg 250 kg', 'Wykonanie martwego ciągu o wadze 250 kg', 3, 'deadlift', 250),
(78, 'Martwy ciąg 260 kg', 'Wykonanie martwego ciągu o wadze 260 kg', 3, 'deadlift', 260),
(79, 'Martwy ciąg 270 kg', 'Wykonanie martwego ciągu o wadze 270 kg', 3, 'deadlift', 270),
(80, 'Martwy ciąg 280 kg', 'Wykonanie martwego ciągu o wadze 280 kg', 3, 'deadlift', 280),
(81, 'Martwy ciąg 290 kg', 'Wykonanie martwego ciągu o wadze 290 kg', 3, 'deadlift', 290),
(82, 'Martwy ciąg 300 kg', 'Wykonanie martwego ciągu o wadze 300 kg', 3, 'deadlift', 300),
(83, 'Martwy ciąg 310 kg', 'Wykonanie martwego ciągu o wadze 310 kg', 3, 'deadlift', 310),
(84, 'Martwy ciąg 320 kg', 'Wykonanie martwego ciągu o wadze 320 kg', 3, 'deadlift', 320),
(85, 'Martwy ciąg 330 kg', 'Wykonanie martwego ciągu o wadze 330 kg', 3, 'deadlift', 330),
(86, 'Martwy ciąg 340 kg', 'Wykonanie martwego ciągu o wadze 340 kg', 3, 'deadlift', 340),
(87, 'Martwy ciąg 350 kg', 'Wykonanie martwego ciągu o wadze 350 kg', 3, 'deadlift', 350);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `caffeine_intake`
--

CREATE TABLE `caffeine_intake` (
  `intake_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `drink_type` varchar(255) NOT NULL,
  `amount_ml` int(11) NOT NULL,
  `caffeine_content` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caffeine_intake`
--

INSERT INTO `caffeine_intake` (`intake_id`, `user_id`, `drink_type`, `amount_ml`, `caffeine_content`, `date`) VALUES
(1, 3, 'espresso', 50, 75, '2025-01-27'),
(2, 3, 'energetyk', 500, 36, '2025-01-27'),
(3, 3, 'energetyk', 500, 180, '2025-01-27'),
(4, 3, 'espresso', 100, 75, '2025-01-27'),
(5, 3, 'energetyk', 500, 180, '2025-01-27'),
(6, 3, 'energetyk', 250, 55, '2025-01-27'),
(7, 3, 'energetyk', 500, 180, '2025-01-26'),
(8, 3, 'energetyk', 200, 44, '2025-01-28'),
(9, 3, 'energetyk', 500, 180, '2025-01-29'),
(10, 3, 'espresso', 50, 75, '2025-01-26'),
(11, 3, 'espresso', 50, 75, '2025-01-25'),
(12, 4, 'espresso', 50, 75, '2025-01-27'),
(13, 4, 'energetyk', 500, 180, '2025-01-27'),
(14, 4, 'espresso', 100, 75, '2025-01-26'),
(15, 4, 'espresso', 200, 75, '2025-01-26'),
(16, 3, 'espresso', 100, 75, '2025-01-30'),
(17, 3, 'espresso', 200, 150, '2025-01-28'),
(18, 3, 'espresso', 200, 150, '2025-01-30'),
(19, 3, 'energetyk', 500, 180, '2025-01-30'),
(20, 3, 'cold_brew', 100, 100, '2025-01-30'),
(21, 3, 'cold_brew', 150, 150, '2025-01-30'),
(22, 5, 'espresso', 250, 188, '2025-01-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `exercise_name`, `description`, `created_at`) VALUES
(1, 'Sztanga na ławce', 'Ćwiczenie na mięśnie klatki piersiowej. Wykonywane na ławce poziomej z wykorzystaniem sztangi.', '2025-01-27 17:38:25'),
(2, 'Przysiad ze sztangą', 'Podstawowe ćwiczenie wielostawowe na mięśnie nóg, pośladków i dolnej części pleców. Wykonywane ze sztangą na barkach.', '2025-01-27 17:38:25'),
(3, 'Martwy ciąg', 'Ćwiczenie na mięśnie grzbietu, nóg i całego korpusu. Wykonywane z użyciem sztangi podnoszonej z ziemi.', '2025-01-27 17:38:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exercise_strength_levels`
--

CREATE TABLE `exercise_strength_levels` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL CHECK (`exercise_id` between 1 and 3),
  `gender` enum('m','k') NOT NULL,
  `body_mass` int(11) NOT NULL,
  `lvl_poczatkujacy` decimal(5,2) NOT NULL,
  `lvl_nowicjusz` decimal(5,2) NOT NULL,
  `lvl_sredniozawansowany` decimal(5,2) NOT NULL,
  `lvl_zawansowany` decimal(5,2) NOT NULL,
  `lvl_elita` decimal(5,2) NOT NULL,
  `exercise_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise_strength_levels`
--

INSERT INTO `exercise_strength_levels` (`id`, `exercise_id`, `gender`, `body_mass`, `lvl_poczatkujacy`, `lvl_nowicjusz`, `lvl_sredniozawansowany`, `lvl_zawansowany`, `lvl_elita`, `exercise_name`) VALUES
(1, 1, 'm', 50, 24.00, 38.00, 57.00, 79.00, 103.00, 'Sztanga na ławce'),
(2, 1, 'm', 55, 29.00, 45.00, 64.00, 87.00, 113.00, 'Sztanga na ławce'),
(3, 1, 'm', 60, 34.00, 51.00, 72.00, 96.00, 123.00, 'Sztanga na ławce'),
(4, 1, 'm', 65, 39.00, 57.00, 79.00, 104.00, 132.00, 'Sztanga na ławce'),
(5, 1, 'm', 70, 44.00, 62.00, 85.00, 112.00, 141.00, 'Sztanga na ławce'),
(6, 1, 'm', 75, 49.00, 68.00, 92.00, 119.00, 149.00, 'Sztanga na ławce'),
(7, 1, 'm', 80, 53.00, 74.00, 98.00, 127.00, 157.00, 'Sztanga na ławce'),
(8, 1, 'm', 85, 58.00, 79.00, 105.00, 134.00, 165.00, 'Sztanga na ławce'),
(9, 1, 'm', 90, 62.00, 84.00, 111.00, 141.00, 172.00, 'Sztanga na ławce'),
(10, 1, 'm', 95, 67.00, 89.00, 116.00, 147.00, 180.00, 'Sztanga na ławce'),
(11, 1, 'm', 100, 71.00, 94.00, 122.00, 153.00, 187.00, 'Sztanga na ławce'),
(12, 1, 'm', 105, 75.00, 99.00, 128.00, 160.00, 194.00, 'Sztanga na ławce'),
(13, 1, 'm', 110, 80.00, 104.00, 133.00, 166.00, 200.00, 'Sztanga na ławce'),
(14, 1, 'm', 115, 84.00, 109.00, 138.00, 172.00, 207.00, 'Sztanga na ławce'),
(15, 1, 'm', 120, 88.00, 113.00, 143.00, 177.00, 213.00, 'Sztanga na ławce'),
(16, 1, 'm', 125, 92.00, 118.00, 148.00, 183.00, 219.00, 'Sztanga na ławce'),
(17, 1, 'm', 130, 95.00, 122.00, 153.00, 188.00, 225.00, 'Sztanga na ławce'),
(18, 1, 'm', 135, 99.00, 126.00, 158.00, 194.00, 231.00, 'Sztanga na ławce'),
(19, 1, 'm', 140, 103.00, 130.00, 163.00, 199.00, 236.00, 'Sztanga na ławce'),
(20, 1, 'k', 40, 8.00, 18.00, 32.00, 50.00, 70.00, 'Sztanga na ławce'),
(21, 1, 'k', 45, 10.00, 21.00, 36.00, 55.00, 76.00, 'Sztanga na ławce'),
(22, 1, 'k', 50, 12.00, 24.00, 40.00, 59.00, 82.00, 'Sztanga na ławce'),
(23, 1, 'k', 55, 15.00, 27.00, 43.00, 64.00, 87.00, 'Sztanga na ławce'),
(24, 1, 'k', 60, 17.00, 29.00, 47.00, 68.00, 92.00, 'Sztanga na ławce'),
(25, 1, 'k', 65, 19.00, 32.00, 50.00, 72.00, 96.00, 'Sztanga na ławce'),
(26, 1, 'k', 70, 20.00, 34.00, 53.00, 75.00, 101.00, 'Sztanga na ławce'),
(27, 1, 'k', 75, 22.00, 37.00, 56.00, 79.00, 105.00, 'Sztanga na ławce'),
(28, 1, 'k', 80, 24.00, 39.00, 59.00, 82.00, 109.00, 'Sztanga na ławce'),
(29, 1, 'k', 85, 26.00, 41.00, 62.00, 86.00, 112.00, 'Sztanga na ławce'),
(30, 1, 'k', 90, 28.00, 44.00, 64.00, 89.00, 116.00, 'Sztanga na ławce'),
(31, 1, 'k', 95, 29.00, 46.00, 67.00, 92.00, 119.00, 'Sztanga na ławce'),
(32, 1, 'k', 100, 31.00, 48.00, 69.00, 95.00, 123.00, 'Sztanga na ławce'),
(33, 1, 'k', 105, 33.00, 50.00, 72.00, 98.00, 126.00, 'Sztanga na ławce'),
(34, 1, 'k', 110, 34.00, 52.00, 74.00, 100.00, 129.00, 'Sztanga na ławce'),
(35, 1, 'k', 115, 36.00, 54.00, 76.00, 103.00, 132.00, 'Sztanga na ławce'),
(36, 1, 'k', 120, 37.00, 56.00, 79.00, 106.00, 135.00, 'Sztanga na ławce'),
(37, 2, 'm', 50, 33.00, 52.00, 76.00, 104.00, 136.00, 'Przysiad ze sztangą'),
(38, 2, 'm', 55, 40.00, 60.00, 86.00, 116.00, 149.00, 'Przysiad ze sztangą'),
(39, 2, 'm', 60, 47.00, 68.00, 95.00, 127.00, 161.00, 'Przysiad ze sztangą'),
(40, 2, 'm', 65, 53.00, 76.00, 104.00, 137.00, 173.00, 'Przysiad ze sztangą'),
(41, 2, 'm', 70, 59.00, 83.00, 113.00, 147.00, 184.00, 'Przysiad ze sztangą'),
(42, 2, 'm', 75, 66.00, 91.00, 122.00, 157.00, 195.00, 'Przysiad ze sztangą'),
(43, 2, 'm', 80, 72.00, 98.00, 130.00, 166.00, 205.00, 'Przysiad ze sztangą'),
(44, 2, 'm', 85, 78.00, 105.00, 138.00, 175.00, 215.00, 'Przysiad ze sztangą'),
(45, 2, 'm', 90, 83.00, 112.00, 146.00, 184.00, 225.00, 'Przysiad ze sztangą'),
(46, 2, 'm', 95, 89.00, 118.00, 153.00, 192.00, 234.00, 'Przysiad ze sztangą'),
(47, 2, 'm', 100, 95.00, 125.00, 160.00, 201.00, 243.00, 'Przysiad ze sztangą'),
(48, 2, 'm', 105, 100.00, 131.00, 168.00, 209.00, 252.00, 'Przysiad ze sztangą'),
(49, 2, 'm', 110, 106.00, 137.00, 174.00, 216.00, 260.00, 'Przysiad ze sztangą'),
(50, 2, 'm', 115, 111.00, 143.00, 181.00, 224.00, 269.00, 'Przysiad ze sztangą'),
(51, 2, 'm', 120, 116.00, 149.00, 188.00, 231.00, 277.00, 'Przysiad ze sztangą'),
(52, 2, 'm', 125, 121.00, 155.00, 194.00, 238.00, 284.00, 'Przysiad ze sztangą'),
(53, 2, 'm', 130, 126.00, 160.00, 201.00, 245.00, 292.00, 'Przysiad ze sztangą'),
(54, 2, 'm', 135, 131.00, 166.00, 207.00, 252.00, 299.00, 'Przysiad ze sztangą'),
(55, 2, 'm', 140, 136.00, 171.00, 213.00, 259.00, 307.00, 'Przysiad ze sztangą'),
(56, 2, 'k', 40, 17.00, 31.00, 51.00, 75.00, 101.00, 'Przysiad ze sztangą'),
(57, 2, 'k', 45, 20.00, 36.00, 56.00, 81.00, 109.00, 'Przysiad ze sztangą'),
(58, 2, 'k', 50, 23.00, 39.00, 61.00, 87.00, 115.00, 'Przysiad ze sztangą'),
(59, 2, 'k', 55, 26.00, 43.00, 65.00, 92.00, 122.00, 'Przysiad ze sztangą'),
(60, 2, 'k', 60, 29.00, 47.00, 70.00, 97.00, 128.00, 'Przysiad ze sztangą'),
(61, 2, 'k', 65, 32.00, 50.00, 74.00, 102.00, 133.00, 'Przysiad ze sztangą'),
(62, 2, 'k', 70, 34.00, 53.00, 78.00, 106.00, 138.00, 'Przysiad ze sztangą'),
(63, 2, 'k', 75, 37.00, 56.00, 81.00, 111.00, 143.00, 'Przysiad ze sztangą'),
(64, 2, 'k', 80, 39.00, 59.00, 85.00, 115.00, 148.00, 'Przysiad ze sztangą'),
(65, 2, 'k', 85, 41.00, 62.00, 88.00, 119.00, 152.00, 'Przysiad ze sztangą'),
(66, 2, 'k', 90, 44.00, 65.00, 91.00, 123.00, 157.00, 'Przysiad ze sztangą'),
(67, 2, 'k', 95, 46.00, 68.00, 95.00, 126.00, 161.00, 'Przysiad ze sztangą'),
(68, 2, 'k', 100, 48.00, 70.00, 98.00, 130.00, 165.00, 'Przysiad ze sztangą'),
(69, 2, 'k', 105, 50.00, 73.00, 101.00, 133.00, 169.00, 'Przysiad ze sztangą'),
(70, 2, 'k', 110, 52.00, 75.00, 103.00, 136.00, 172.00, 'Przysiad ze sztangą'),
(71, 2, 'k', 115, 54.00, 77.00, 106.00, 140.00, 176.00, 'Przysiad ze sztangą'),
(72, 2, 'k', 120, 56.00, 80.00, 109.00, 143.00, 179.00, 'Przysiad ze sztangą'),
(73, 3, 'm', 50, 44.00, 65.00, 93.00, 125.00, 160.00, 'Martwy ciąg'),
(74, 3, 'm', 55, 51.00, 74.00, 103.00, 137.00, 174.00, 'Martwy ciąg'),
(75, 3, 'm', 60, 58.00, 83.00, 114.00, 149.00, 187.00, 'Martwy ciąg'),
(76, 3, 'm', 65, 66.00, 92.00, 124.00, 160.00, 200.00, 'Martwy ciąg'),
(77, 3, 'm', 70, 73.00, 100.00, 133.00, 171.00, 212.00, 'Martwy ciąg'),
(78, 3, 'm', 75, 79.00, 108.00, 142.00, 182.00, 224.00, 'Martwy ciąg'),
(79, 3, 'm', 80, 86.00, 116.00, 151.00, 192.00, 235.00, 'Martwy ciąg'),
(80, 3, 'm', 85, 93.00, 123.00, 160.00, 201.00, 245.00, 'Martwy ciąg'),
(81, 3, 'm', 90, 99.00, 131.00, 168.00, 211.00, 256.00, 'Martwy ciąg'),
(82, 3, 'm', 95, 105.00, 138.00, 176.00, 220.00, 266.00, 'Martwy ciąg'),
(83, 3, 'm', 100, 111.00, 145.00, 184.00, 228.00, 275.00, 'Martwy ciąg'),
(84, 3, 'm', 105, 117.00, 151.00, 192.00, 237.00, 284.00, 'Martwy ciąg'),
(85, 3, 'm', 110, 123.00, 158.00, 199.00, 245.00, 293.00, 'Martwy ciąg'),
(86, 3, 'm', 115, 129.00, 164.00, 206.00, 253.00, 302.00, 'Martwy ciąg'),
(87, 3, 'm', 120, 134.00, 171.00, 213.00, 261.00, 311.00, 'Martwy ciąg'),
(88, 3, 'm', 125, 140.00, 177.00, 220.00, 268.00, 319.00, 'Martwy ciąg'),
(89, 3, 'm', 130, 145.00, 183.00, 227.00, 276.00, 327.00, 'Martwy ciąg'),
(90, 3, 'm', 135, 150.00, 188.00, 233.00, 283.00, 335.00, 'Martwy ciąg'),
(91, 3, 'm', 140, 155.00, 194.00, 240.00, 290.00, 342.00, 'Martwy ciąg'),
(92, 3, 'k', 40, 24.00, 40.00, 62.00, 89.00, 118.00, 'Martwy ciąg'),
(93, 3, 'k', 45, 27.00, 45.00, 68.00, 95.00, 126.00, 'Martwy ciąg'),
(94, 3, 'k', 50, 31.00, 49.00, 73.00, 102.00, 133.00, 'Martwy ciąg'),
(95, 3, 'k', 55, 34.00, 53.00, 78.00, 107.00, 140.00, 'Martwy ciąg'),
(96, 3, 'k', 60, 37.00, 57.00, 83.00, 113.00, 146.00, 'Martwy ciąg'),
(97, 3, 'k', 65, 40.00, 61.00, 87.00, 118.00, 152.00, 'Martwy ciąg'),
(98, 3, 'k', 70, 43.00, 64.00, 91.00, 123.00, 157.00, 'Martwy ciąg'),
(99, 3, 'k', 75, 45.00, 67.00, 95.00, 127.00, 163.00, 'Martwy ciąg'),
(100, 3, 'k', 80, 48.00, 71.00, 99.00, 132.00, 168.00, 'Martwy ciąg'),
(101, 3, 'k', 85, 51.00, 74.00, 102.00, 136.00, 172.00, 'Martwy ciąg'),
(102, 3, 'k', 90, 53.00, 77.00, 106.00, 140.00, 177.00, 'Martwy ciąg'),
(103, 3, 'k', 95, 55.00, 79.00, 109.00, 144.00, 181.00, 'Martwy ciąg'),
(104, 3, 'k', 100, 58.00, 82.00, 112.00, 147.00, 185.00, 'Martwy ciąg'),
(105, 3, 'k', 105, 60.00, 85.00, 116.00, 151.00, 189.00, 'Martwy ciąg'),
(106, 3, 'k', 110, 62.00, 87.00, 119.00, 154.00, 193.00, 'Martwy ciąg'),
(107, 3, 'k', 115, 64.00, 90.00, 121.00, 158.00, 197.00, 'Martwy ciąg'),
(108, 3, 'k', 120, 66.00, 92.00, 124.00, 161.00, 200.00, 'Martwy ciąg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `session_exercises`
--

CREATE TABLE `session_exercises` (
  `session_exercise_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `repetitions` int(11) NOT NULL,
  `weight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_exercises`
--

INSERT INTO `session_exercises` (`session_exercise_id`, `session_id`, `exercise_id`, `repetitions`, `weight`) VALUES
(1, 1, 1, 5, NULL),
(2, 1, 2, 5, NULL),
(3, 2, 2, 5, 120.00),
(4, 2, 2, 5, 130.00),
(5, 2, 1, 10, 100.00),
(6, 2, 1, 10, 120.00),
(7, 2, 3, 10, 150.00),
(8, 3, 1, 10, 150.00),
(9, 3, 1, 10, 160.00),
(10, 4, 1, 5, 100.00),
(11, 4, 2, 5, 120.00),
(12, 4, 3, 5, 150.00),
(13, 5, 1, 5, 111.00),
(14, 6, 1, 5, 111.00),
(15, 7, 1, 10, 55.00),
(16, 8, 1, 5, 100.00),
(17, 9, 1, 5, 100.00),
(18, 10, 1, 10, 100.00),
(19, 10, 1, 10, 110.00),
(20, 11, 1, 100, 100.00),
(21, 12, 1, 10, 100.00),
(22, 13, 1, 5, 100.00),
(23, 14, 1, 5, 110.00),
(24, 14, 2, 5, 50.00),
(25, 14, 3, 5, 20.00),
(26, 14, 3, 5, 100.00),
(27, 15, 1, 10, 50.00),
(28, 15, 1, 5, 100.00),
(29, 19, 2, 15, 50.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `created_at`, `profile_picture`) VALUES
(1, 'MatthewMercury', 'mateuszstyperek@gmail.com', '$2y$10$axdYJi8RiEbzX1UmZ7GRte0wTYj2UVfwXed8xqBP680Ql72jU32iq', '2025-01-27 16:52:17', NULL),
(2, 'Qzypex', 'bartekmis2002@gmail.com', '$2y$10$eaM1Yzwg7TCaaNi6R/lweukyIduGxTeEuN.tEWeh13Ck8mcVZPOUK', '2025-01-27 17:10:26', NULL),
(3, 'admin1', 'amin@gmail.com', '$2y$10$HjyzTo.jNj.9YuyXm1AvVeh.YRjhusQKg0zO5TggamgYRu46LJnMy', '2025-01-27 18:19:39', 'uploads/df85899dfacd4fae964366002587e9be.jpg'),
(4, 'RadosławPula', 'radoslawbula02@gmail.com', '$2y$10$EmWPEq/t4DonitI/8oP/euE8itBr/n5l07XQxlNkdJZP4DHStpMAS', '2025-01-27 19:44:32', 'uploads/profile_4.PNG'),
(5, 'admin', 'admin@admin.com', '$2y$10$CLXqmBM2H/ZOLLG7O/RV/u9VSiwioEVQk/ZnKHP8PxB9Gl/EJkG/C', '2025-01-29 11:16:57', 'uploads/309aedac-d603-4a31-b1b2-2a9b7697f36d.jpg'),
(7, 'admin123', 'admin1@admin.com', '$2y$10$.u46wEey1KgX7gQDBhsY2e8aFY2eiUKwhrCDhzgrx4VStVkPc/bFO', '2025-01-29 11:17:40', 'uploads/df85899dfacd4fae964366002587e9be.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_achievements`
--

CREATE TABLE `user_achievements` (
  `user_achievement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `is_achieved` tinyint(1) NOT NULL DEFAULT 0,
  `date_achieved` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_achievements`
--

INSERT INTO `user_achievements` (`user_achievement_id`, `user_id`, `achievement_id`, `is_achieved`, `date_achieved`) VALUES
(1, 3, 1, 0, NULL),
(2, 3, 2, 0, NULL),
(3, 3, 3, 0, NULL),
(4, 3, 4, 0, NULL),
(5, 3, 5, 0, NULL),
(6, 3, 6, 0, NULL),
(7, 3, 7, 0, NULL),
(8, 3, 8, 0, NULL),
(9, 3, 9, 0, NULL),
(10, 3, 1, 0, NULL),
(11, 3, 2, 0, NULL),
(12, 3, 3, 0, NULL),
(13, 3, 4, 0, NULL),
(14, 3, 5, 0, NULL),
(15, 3, 6, 0, NULL),
(16, 3, 7, 0, NULL),
(17, 3, 8, 0, NULL),
(18, 3, 9, 0, NULL),
(19, 3, 10, 0, NULL),
(20, 3, 25, 0, NULL),
(21, 3, 26, 0, NULL),
(22, 3, 27, 0, NULL),
(23, 3, 28, 0, NULL),
(24, 3, 54, 0, NULL),
(25, 3, 54, 0, NULL),
(26, 3, 55, 0, NULL),
(27, 3, 56, 0, NULL),
(28, 3, 57, 0, NULL),
(29, 3, 58, 0, NULL),
(30, 3, 59, 0, NULL),
(31, 3, 60, 0, NULL),
(32, 3, 61, 0, NULL),
(33, 3, 62, 0, NULL),
(34, 7, 1, 0, NULL),
(35, 7, 2, 0, NULL),
(36, 7, 3, 0, NULL),
(37, 7, 4, 0, NULL),
(38, 7, 1, 0, NULL),
(39, 7, 2, 0, NULL),
(40, 7, 3, 0, NULL),
(41, 7, 4, 0, NULL),
(42, 7, 5, 0, NULL),
(43, 7, 6, 0, NULL),
(44, 7, 7, 0, NULL),
(45, 7, 8, 0, NULL),
(46, 7, 9, 0, NULL),
(47, 5, 25, 0, NULL),
(48, 5, 26, 0, NULL),
(49, 5, 27, 0, NULL),
(50, 5, 28, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `water_intake`
--

CREATE TABLE `water_intake` (
  `intake_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `intake_amount` int(11) NOT NULL,
  `intake_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_intake`
--

INSERT INTO `water_intake` (`intake_id`, `user_id`, `intake_amount`, `intake_date`) VALUES
(1, 3, 1700, '2025-01-27'),
(2, 3, 900, '2025-01-28'),
(3, 4, 2400, '2025-01-27'),
(4, 4, 700, '2025-01-26'),
(5, 5, 500, '2025-01-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `workout_sessions`
--

CREATE TABLE `workout_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `workout_name` varchar(255) NOT NULL,
  `session_duration` time NOT NULL,
  `session_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_sessions`
--

INSERT INTO `workout_sessions` (`session_id`, `user_id`, `workout_name`, `session_duration`, `session_date`) VALUES
(1, 1, 'Super dzień nóg i łap', '01:00:00', '2025-01-26 00:00:00'),
(2, 3, 'dzien nog2', '02:30:00', '2025-01-27 00:00:00'),
(3, 3, 'Łapy jak kapary', '01:00:00', '2025-01-28 00:00:00'),
(4, 4, 'Sesja 1', '01:00:00', '2025-01-27 00:00:00'),
(5, 4, 'Super dzień nóg i łap', '01:33:00', '2025-01-26 00:00:00'),
(6, 4, 'Łapy jak kapary', '01:00:00', '2025-01-28 00:00:00'),
(7, 4, 'Łapy jak kapary2', '01:00:00', '2025-01-27 00:00:00'),
(8, 4, 'Super dzień nóg i łap', '01:00:00', '2025-01-27 00:00:00'),
(9, 4, 'Super dzień nóg i łap', '01:00:00', '2025-01-27 00:00:00'),
(10, 3, 'Super dzień nóg i łap3', '01:00:00', '2025-01-28 00:00:00'),
(11, 3, 'Łapy jak kapary11', '01:01:00', '2025-01-28 00:00:00'),
(12, 3, '1111', '01:00:00', '2025-01-28 00:00:00'),
(13, 3, 'Proba generalna', '01:00:00', '2025-01-28 00:00:00'),
(14, 3, '1111', '01:00:00', '2025-01-28 00:00:00'),
(15, 7, 'Sesja 1', '01:00:00', '2025-01-29 00:00:00'),
(16, 5, 'sesja', '01:00:00', '2022-01-25 00:00:00'),
(17, 5, 'Sesja 31', '01:00:00', '2022-01-31 00:00:00'),
(18, 5, 'Sesja 31', '01:00:00', '2022-01-31 00:00:00'),
(19, 5, 'TESTOWA', '01:00:00', '2025-01-31 00:00:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievement_id`);

--
-- Indeksy dla tabeli `caffeine_intake`
--
ALTER TABLE `caffeine_intake`
  ADD PRIMARY KEY (`intake_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`);

--
-- Indeksy dla tabeli `exercise_strength_levels`
--
ALTER TABLE `exercise_strength_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `session_exercises`
--
ALTER TABLE `session_exercises`
  ADD PRIMARY KEY (`session_exercise_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `exercise_id` (`exercise_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD PRIMARY KEY (`user_achievement_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `achievement_id` (`achievement_id`);

--
-- Indeksy dla tabeli `water_intake`
--
ALTER TABLE `water_intake`
  ADD PRIMARY KEY (`intake_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `workout_sessions`
--
ALTER TABLE `workout_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `achievement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `caffeine_intake`
--
ALTER TABLE `caffeine_intake`
  MODIFY `intake_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exercise_strength_levels`
--
ALTER TABLE `exercise_strength_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `session_exercises`
--
ALTER TABLE `session_exercises`
  MODIFY `session_exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_achievements`
--
ALTER TABLE `user_achievements`
  MODIFY `user_achievement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `water_intake`
--
ALTER TABLE `water_intake`
  MODIFY `intake_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workout_sessions`
--
ALTER TABLE `workout_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caffeine_intake`
--
ALTER TABLE `caffeine_intake`
  ADD CONSTRAINT `caffeine_intake_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `session_exercises`
--
ALTER TABLE `session_exercises`
  ADD CONSTRAINT `session_exercises_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `workout_sessions` (`session_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `session_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD CONSTRAINT `user_achievements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_achievements_ibfk_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`) ON DELETE CASCADE;

--
-- Constraints for table `water_intake`
--
ALTER TABLE `water_intake`
  ADD CONSTRAINT `water_intake_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_sessions`
--
ALTER TABLE `workout_sessions`
  ADD CONSTRAINT `workout_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
