-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 11 2024 г., 12:22
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
-- База данных: `Компания`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `master_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id_comment`, `message`, `master_id`, `request_id`) VALUES
(1, 'Интересно...', 2, 1),
(2, 'Будем разбираться!', 3, 2),
(3, 'Сделаем все на высшем уровне!', 3, 3);

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
  `startDate` date NOT NULL,
  `orgTechType` int(11) NOT NULL,
  `orgTechModel` varchar(255) NOT NULL,
  `ProblemDecryption` varchar(255) NOT NULL,
  `requestStatus_id` int(11) NOT NULL,
  `CompletionDate` date NOT NULL,
  `repairParts` varchar(255) NOT NULL,
  `master_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id_request`, `startDate`, `orgTechType`, `orgTechModel`, `ProblemDecryption`, `requestStatus_id`, `CompletionDate`, `repairParts`, `master_id`, `client_id`) VALUES
(1, '2023-05-06', 1, 'DEXP Aquilon O286', 'Перестал работать ', 1, '2023-05-06', '', 2, 7),
(2, '2023-05-05', 1, 'DEXP Atlas H388', 'Перестал работать', 1, '2023-05-05', '', 3, 8),
(3, '2022-07-07', 2, 'MISI GF76 Katana 11UC-879XRU черный', 'Выключается', 2, '2023-01-01', '', 3, 9),
(4, '2023-08-02', 2, 'MSI Modern 15 B12M-211RU черный', 'Выключается', 3, '2023-08-02', '', 2, 8),
(5, '2023-08-02', 3, 'HP LaserJet Pro M404dn', 'Перестала включаться', 3, '2023-08-02', '', 3, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatuses`
--

CREATE TABLE `requestStatuses` (
  `id_requestStatuses` int(11) NOT NULL,
  `requestStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatuses`
--

INSERT INTO `requestStatuses` (`id_requestStatuses`, `requestStatus`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готова к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id_type` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id_type`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `phone`, `username`, `password`, `type_id`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'a722c63db8ec8625af6cf71cb8c2d939', 1),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'c1572d05424d0ecb2a65ec6a82aeacbf', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', '3afc79b597f88a72528e864cf81856d2', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'fc2921d9057ac44e549efaf0048b2512', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'd35f6fa9a79434bcd17f8049714ebfcb', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', '0102812fbd5f73aa18aa0bae2cd8f79f', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', '0bd0fe6372c64e09c4ae81e056a9dbda', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'c868bff94e54b8eddbdbce22159c0299', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'd1f38b569c772ebb8fa464e1a90c5a00', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'b279786ec5a7ed00dbe4d3fe1516c121', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
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
  ADD KEY `orgTechType` (`orgTechType`),
  ADD KEY `requestStatus_id` (`requestStatus_id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD PRIMARY KEY (`id_requestStatuses`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_id` (`type_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  MODIFY `id_orgTechTypes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  MODIFY `id_requestStatuses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
