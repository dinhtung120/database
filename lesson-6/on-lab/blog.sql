-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: db
-- Thời gian đã tạo: Th2 26, 2022 lúc 12:13 PM
-- Phiên bản máy phục vụ: 8.0.27
-- Phiên bản PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `blog`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `gender` enum('male','female') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `name`, `gender`) VALUES
(25, 'Constancia Igo', NULL),
(26, 'Enos Filchagin', NULL),
(27, 'Florrie Deny', NULL),
(28, 'Iago Jenkerson', NULL),
(29, 'Joseph Buckham', NULL),
(30, 'Oliviero Frisch', NULL),
(31, 'Mylo Harsent', NULL),
(32, 'Olenka Curteis', NULL),
(33, 'Meryl Donaho', NULL),
(34, 'Pammy Pickup', NULL),
(35, 'Talya Summerell', NULL),
(36, 'Nerta Chessor', NULL),
(37, 'Krystal Vasyukov', NULL),
(38, 'Elwira Scorey', NULL),
(39, 'Ulrika Cappell', NULL),
(40, 'Francine Girardeau', NULL),
(41, 'Ansel O\'Lehane', NULL),
(42, 'Stanley Dumbar', NULL),
(43, 'Mariejeanne Sprosson', NULL),
(44, 'Kelly Winspurr', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(4, 'Trai nghiêm'),
(5, 'Blog');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discuss`
--

CREATE TABLE `discuss` (
  `id` int NOT NULL,
  `id_author` int DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  `comment` text NOT NULL,
  `id_parent` int DEFAULT NULL,
  `create_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `discuss`
--

INSERT INTO `discuss` (`id`, `id_author`, `id_post`, `comment`, `id_parent`, `create_at`) VALUES
(1, 44, 1, 'erat fermentum justo nec condimentum', NULL, '2021-08-09'),
(2, 31, 1, 'montes nascetur ridiculus mus etiam', NULL, '2021-04-03'),
(3, 36, 4, 'eu magna vulputate luctus cum sociis', NULL, '2021-03-12'),
(4, 29, 5, 'laoreet ut rhoncus aliquet pulvinar sed nisl', NULL, '2021-04-14'),
(5, 32, 2, 'cum sociis natoque penatibus et', NULL, '2021-12-07'),
(6, 34, 5, 'at velit vivamus vel nulla', NULL, '2021-09-17'),
(7, 40, 1, 'ut dolor morbi vel lectus in', NULL, '2021-12-18'),
(8, 29, 1, 'convallis nulla neque libero convallis', NULL, '2021-04-26'),
(9, 35, 3, 'ligula in lacus curabitur at ipsum', NULL, '2022-01-23'),
(10, 38, 3, 'in blandit ultrices enim lorem ipsum dolor', NULL, '2021-04-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `description` text NOT NULL,
  `thumnail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_category` int DEFAULT NULL,
  `id_author` int DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `status` enum('public','hidden','draft') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `description`, `thumnail`, `id_category`, `id_author`, `create_at`, `status`) VALUES
(1, 'Port of Flowers', 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', NULL, 5, 44, '2020-10-17', 'public'),
(2, 'Bartleby', 'in felis eu sapien cursus vestibulum proin eu mi nulla ac', 'ligula sit amet eleifend pede libero quis orci nullam molestie nibh', NULL, 4, 41, '2020-04-07', 'public'),
(3, 'Noah\'s Ark', 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', NULL, 5, 42, '2020-05-20', 'public'),
(4, 'Steel Helmet, The', 'non interdum in ante vestibulum ante ipsum primis in faucibus', 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', NULL, 5, 39, '2020-03-28', 'public'),
(5, 'Hannah and Her Sisters', 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', NULL, 4, 38, '2021-12-29', 'public');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tag`
--

CREATE TABLE `post_tag` (
  `id_post` int NOT NULL,
  `id_tag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tag`
--

INSERT INTO `post_tag` (`id_post`, `id_tag`) VALUES
(3, 1),
(4, 1),
(1, 2),
(3, 2),
(5, 2),
(2, 4),
(4, 5),
(2, 6),
(5, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'HTML/CSS'),
(3, 'JS'),
(4, 'Spring boot'),
(5, 'Algorimth'),
(6, 'Database');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discuss`
--
ALTER TABLE `discuss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_author` (`id_author`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_parent` (`id_parent`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_author` (`id_author`);

--
-- Chỉ mục cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id_post`,`id_tag`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `discuss`
--
ALTER TABLE `discuss`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `discuss`
--
ALTER TABLE `discuss`
  ADD CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `discuss_ibfk_3` FOREIGN KEY (`id_parent`) REFERENCES `discuss` (`id`);

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`);

--
-- Các ràng buộc cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
