-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 18 2024 г., 16:43
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Base2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id_commen` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `master_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orgTechTypes`
--

CREATE TABLE `orgTechTypes` (
  `id_orgTechTypes` int(11) NOT NULL,
  `orgTechType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orgTechTypes`
--

INSERT INTO `orgTechTypes` (`id_orgTechTypes`, `orgTechType`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id_request` int(11) NOT NULL,
  `StartDate` date NOT NULL DEFAULT current_timestamp(),
  `orgTechType_id` int(11) NOT NULL,
  `orgTechModel` varchar(255) NOT NULL,
  `ProblemDescryption` varchar(255) NOT NULL,
  `RequestStatus_id` int(11) NOT NULL,
  `CompletionDate` date DEFAULT NULL,
  `RepairParts` varchar(255) DEFAULT NULL,
  `master_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id_request`, `StartDate`, `orgTechType_id`, `orgTechModel`, `ProblemDescryption`, `RequestStatus_id`, `CompletionDate`, `RepairParts`, `master_id`, `client_id`) VALUES
(1, '2023-06-06', 1, 'Dexp Aquilon O286', 'Перестал работать', 1, '2023-06-06', '', 2, 7),
(2, '2023-05-05', 1, 'Dexp Atlas H388', 'Перестал работать ', 1, '2023-05-05', '', 3, 8),
(3, '2022-07-07', 2, 'MISI GF76 Katana 11UC-879XRU черный', 'Выключается', 2, '2023-01-01', '', 3, 9),
(5, '2023-08-02', 2, 'MSI Modern 15 B12M-211RU черный', 'Выключается ', 3, '2023-08-02', '', 2, 6),
(7, '2023-08-02', 3, 'HP LaserJet Pro M404dn', 'Перестал включаться', 3, '2023-08-02', '', 3, 10),
(17, '2024-10-17', 1, 'pc', 'broken', 1, NULL, NULL, NULL, 15),
(18, '2024-10-17', 2, 'asdas', 'asdasd', 1, NULL, NULL, NULL, 16),
(19, '2024-10-18', 2, 'хуета', 'разъебал после катки в доту', 1, NULL, NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatuses`
--

CREATE TABLE `requestStatuses` (
  `id_requestStatuses` int(11) NOT NULL,
  `requestStatuses` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatuses`
--

INSERT INTO `requestStatuses` (`id_requestStatuses`, `requestStatuses`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готова к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id_type`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик'),
(5, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `phone`, `username`, `password`, `type_id`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'pass1', 1),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'pass2', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', 'pass3', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'pass4', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'pass5', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', 'pass11', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', 'pass12', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'pass13', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'pass14', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'pass15', 2),
(11, '1', '1', '1', '1', 1),
(12, '2', '2', '2', '2', 2),
(13, '3', '3', '3', '3', 4),
(14, '3', '3', '3', '3', 5),
(15, 'Вайт Неймон', '+7(977)-566-83-08', 'neimon', 'icefire', 4),
(16, 'Лили Неймон Файрифай', '+7(977)-566-82-08', 'lily', '123456', 4),
(17, 'Высунь Дай Другим', '+7(998)-767-12-12', 'Владанянянян', '562567356', 4),
(18, 'Высунь Дай Мне', '+7(998)-767-12-12', 'Ваданянянянянян', '6256725', 4),
(19, 'Высунь Дай Себе', '+7(998)-767-12-12', 'sdfghjk', '766637732', 4),
(20, 'dfffff', '+7(988)-789-29-29', 'admin', 'admin', 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_commen`),
  ADD UNIQUE KEY `request_id` (`request_id`),
  ADD KEY `master_id` (`master_id`);

--
-- Индексы таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  ADD PRIMARY KEY (`id_orgTechTypes`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `orgTechType_id` (`orgTechType_id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `RequestStatus_id` (`RequestStatus_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD PRIMARY KEY (`id_requestStatuses`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_commen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  MODIFY `id_orgTechTypes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  MODIFY `id_requestStatuses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`id_request`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`RequestStatus_id`) REFERENCES `requestStatuses` (`id_requestStatuses`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`orgTechType_id`) REFERENCES `orgTechTypes` (`id_orgTechTypes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
