-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 30 2024 г., 10:37
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
-- База данных: `AccountRepair`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_number` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id`, `department_number`, `department_name`) VALUES
(1, 1, 'Цех 1'),
(2, 2, 'Цех 2'),
(3, 3, 'Цех 3'),
(4, 4, 'Цех 4'),
(5, 5, 'Цех 5'),
(6, 6, 'Цех 6'),
(7, 7, 'Цех 7'),
(8, 8, 'Цех 8'),
(9, 9, 'Цех 9'),
(10, 10, 'Цех 10');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `Service_number` varchar(20) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `Service_number`, `FIO`, `role_id`) VALUES
(1, 'T-001', 'Иванов Иван Иванович', 5),
(2, 'T-002', 'Петров Петр Петрович', 6),
(3, 'T-003', 'Сидоров Сидор Сидорович', 6),
(4, 'T-004', 'Кузнецов Николай Николаевич', 2),
(5, 'T-005', 'Фролова Анастасия Сергеевна', 1),
(6, 'T-006', 'Смирнов Алексей Владимирович', 2),
(7, 'T-007', 'Ковалев Игорь Артемович', 3),
(8, 'T-008', 'Соколова Ольга Павловна', 6),
(9, 'T-009', 'Кольцов Руслан Арсланович', 2),
(10, 'T-010', 'Можаев Владислав Николаевич', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `Equipment_number` varchar(20) NOT NULL,
  `Equipment_name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `equipment`
--

INSERT INTO `equipment` (`id`, `Equipment_number`, `Equipment_name`, `department_id`) VALUES
(1, 'EQ-001', 'Станок токарный', 1),
(2, 'EQ-002', 'Станок фрезерный', 1),
(3, 'EQ-003', 'Станок сверлильный', 2),
(4, 'EQ-004', 'Лазерный резак', 2),
(5, 'EQ-005', 'Кран мостовой', 2),
(6, 'EQ-006', 'Погрузчик', 3),
(7, 'EQ-007', 'Насос', 4),
(8, 'EQ-008', 'Генератор', 4),
(9, 'EQ-009', 'Плиткорез', 5),
(10, 'EQ-010', 'Сварочный аппарат', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `FixInfo`
--

CREATE TABLE `FixInfo` (
  `id` int(11) NOT NULL,
  `info_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `FixInfo`
--

INSERT INTO `FixInfo` (`id`, `info_name`) VALUES
(1, 'Годен'),
(2, 'Передать в ремонт'),
(3, 'Списать'),
(4, 'Проводим осмотр');

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--

CREATE TABLE `Request` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `result_id` date NOT NULL DEFAULT current_timestamp(),
  `info_name` int(11) NOT NULL,
  `Reason_rejection` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Request`
--

INSERT INTO `Request` (`id`, `equipment_id`, `result_id`, `info_name`, `Reason_rejection`, `user_id`) VALUES
(1, 1, '2023-01-15', 1, 'Отсутствует', 1),
(2, 2, '2023-01-16', 2, 'Сломан привод', 2),
(3, 3, '2023-02-10', 1, 'Отсутствует', 3),
(11, 2, '2024-10-30', 4, 'Странный звук', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Result`
--

CREATE TABLE `Result` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `Date_refusal` date NOT NULL,
  `Reason_refusal` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Result`
--

INSERT INTO `Result` (`id`, `equipment_id`, `Date_refusal`, `Reason_refusal`, `employee_id`) VALUES
(1, 1, '2023-01-30', 'Износ деталей', 6),
(2, 2, '2023-02-16', 'Поломка привода', 6),
(3, 3, '2023-03-01', 'Заедание механизма', 4),
(4, 4, '2023-04-20', 'Неисправность электроники', 4),
(5, 5, '2023-05-15', 'Утечка масла', 9),
(6, 6, '2023-07-05', 'Разрушение основного корпуса', 9),
(7, 7, '2023-07-05', 'Не работает стартер', 6),
(8, 8, '2023-08-10', 'Техническая неисправность', 4),
(9, 9, '2023-09-15', 'Износ шины', 6),
(10, 10, '2023-10-20', 'Некорректное использование', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `Role`
--

CREATE TABLE `Role` (
  `id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Role`
--

INSERT INTO `Role` (`id`, `position_name`) VALUES
(1, 'Мастер'),
(2, 'Механик'),
(3, 'Электрик'),
(4, 'Администратор'),
(5, 'Инженер'),
(6, 'Грузчик'),
(7, 'Сотрудник');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role_id`) VALUES
(1, 'root', 'admin', 4),
(2, 'employee2', 'pass2', 2),
(3, 'employee3', 'pass3', 2),
(23, 'employee4', 'pass4', 2),
(25, 'Руслан', 'pass123', 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`role_id`);

--
-- Индексы таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `FixInfo`
--
ALTER TABLE `FixInfo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `result_id` (`result_id`),
  ADD KEY `employee_id` (`user_id`),
  ADD KEY `info_name` (`info_name`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `Result`
--
ALTER TABLE `Result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `position_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `FixInfo`
--
ALTER TABLE `FixInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `Result`
--
ALTER TABLE `Result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `Request_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_3` FOREIGN KEY (`info_name`) REFERENCES `FixInfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Result`
--
ALTER TABLE `Result`
  ADD CONSTRAINT `Result_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Result_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
