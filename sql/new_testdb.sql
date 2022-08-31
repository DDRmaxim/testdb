-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Авг 30 2022 г., 22:49
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `NL_LOG`
--

CREATE TABLE `NL_LOG` (
  `ID_NL_LOG` int NOT NULL,
  `NL_LOG_DATE` date NOT NULL,
  `NL_LOG_TIME` time NOT NULL,
  `NL_LOG_IP` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_LOG_IUD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_LOG_TABLE_NAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NL_USER` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `NL_LOG_DETAIL`
--

CREATE TABLE `NL_LOG_DETAIL` (
  `ID_NL_LOG_DETAIL` int NOT NULL,
  `ID_NL_LOG` int NOT NULL,
  `NL_LOG_DETAIL_OLD` varchar(2550) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_LOG_DETAIL_NEW` varchar(2550) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_LOG_DETAIL_FIELD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `NL_PROP_RESALE`
--

CREATE TABLE `NL_PROP_RESALE` (
  `ID_NL_PROP_RESALE` int NOT NULL,
  `ID_NL_VIEW` int DEFAULT NULL,
  `ID_NL_HOUSES` int DEFAULT NULL,
  `ID_NL_MATERIAL` int DEFAULT NULL,
  `NL_PROP_RESALE_FLOOR` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NL_PROP_RESALE_AREA_FULL` decimal(6,2) NOT NULL,
  `NL_PROP_RESALE_PHOTO_URLS` varchar(5100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NL_PROP_RESALE_COST_TOTAL` int DEFAULT NULL,
  `NL_PROP_RESALE_ADDRESS` varchar(2550) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NL_PROP_RESALE_DESCRIPTION` varchar(5100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_NL_USER` int DEFAULT NULL,
  `NL_PROP_RESALE_PHONE` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NL_PROP_RESALE_PHONE_OWNER` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NL_PROP_RESALE_DATE_INSERT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NL_PROP_RESALE_DATE_UPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `NL_PROP_RESALE`
--

INSERT INTO `NL_PROP_RESALE` (`ID_NL_PROP_RESALE`, `ID_NL_VIEW`, `ID_NL_HOUSES`, `ID_NL_MATERIAL`, `NL_PROP_RESALE_FLOOR`, `NL_PROP_RESALE_AREA_FULL`, `NL_PROP_RESALE_PHOTO_URLS`, `NL_PROP_RESALE_COST_TOTAL`, `NL_PROP_RESALE_ADDRESS`, `NL_PROP_RESALE_DESCRIPTION`, `ID_NL_USER`, `NL_PROP_RESALE_PHONE`, `NL_PROP_RESALE_PHONE_OWNER`, `NL_PROP_RESALE_DATE_INSERT`, `NL_PROP_RESALE_DATE_UPDATE`) VALUES
(3, NULL, NULL, NULL, '1', '555.00', '[\"/img/prop_resale/PHOTO_URLS_3_191201_024304.jpg\"]', 1000000, 'Россия, Краснодарский край, Анапа, Советская улица ', '%7B%22ops%22%3A%5B%7B%22insert%22%3A%22%D0%A5%D0%BE%D1%80%D0%BE%D1%88%D0%B0%D1%8F%20%D0%BA%D0%B2%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%5Cn%22%7D%5D%7D', 1, '+79282601474', NULL, '2019-12-01 14:44:02', '2019-12-01 14:44:02');

-- --------------------------------------------------------

--
-- Структура таблицы `NL_USER`
--

CREATE TABLE `NL_USER` (
  `ID_NL_USER` int NOT NULL,
  `ID_NL_USER_PERMISSION` int NOT NULL,
  `NL_USER_LOGIN` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_USER_PASSWORD` blob NOT NULL,
  `NL_USER_SHORT` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_USER_FULL` varchar(2550) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_USER_PHONE` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `NL_USER`
--

INSERT INTO `NL_USER` (`ID_NL_USER`, `ID_NL_USER_PERMISSION`, `NL_USER_LOGIN`, `NL_USER_PASSWORD`, `NL_USER_SHORT`, `NL_USER_FULL`, `NL_USER_PHONE`) VALUES
(1, 2, 'admin', 0xaeb0c38af6fce07e40349cec2c17388f, 'Администратор', 'Администратор', '+79282601474');

-- --------------------------------------------------------

--
-- Структура таблицы `NL_USER_PERMISSION`
--

CREATE TABLE `NL_USER_PERMISSION` (
  `ID_NL_USER_PERMISSION` int NOT NULL,
  `NL_USER_PERMISSION_SHORT` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `NL_USER_PERMISSION_FULL` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `NL_USER_PERMISSION`
--

INSERT INTO `NL_USER_PERMISSION` (`ID_NL_USER_PERMISSION`, `NL_USER_PERMISSION_SHORT`, `NL_USER_PERMISSION_FULL`) VALUES
(1, 'Пользователь', 'Пользователь'),
(2, 'Администратор', 'Администратор'),
(3, 'Гость', 'Гость');

-- --------------------------------------------------------

--
-- Структура таблицы `NL_VIEW`
--

CREATE TABLE `NL_VIEW` (
  `ID_NL_VIEW` int NOT NULL,
  `NL_VIEW_SHORT` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Структура таблицы `NL_HOUSES`
--

CREATE TABLE `NL_HOUSES` (
  `ID_NL_HOUSES` int NOT NULL,
  `ID_NL_MATERIAL` int DEFAULT NULL,
  `NL_HOUSES_SHORT` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Структура таблицы `NL_MATERIAL`
--

CREATE TABLE `NL_MATERIAL` (
  `ID_NL_MATERIAL` int NOT NULL,
  `NL_MATERIAL_SHORT` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `NL_VIEW`
--

INSERT INTO `NL_VIEW` (`ID_NL_VIEW`, `NL_VIEW_SHORT`) VALUES
(1, 'На море'),
(2, 'В город');

--
-- Дамп данных таблицы `NL_HOUSES`
--

INSERT INTO `NL_HOUSES` (`ID_NL_HOUSES`, `ID_NL_MATERIAL`, `NL_HOUSES_SHORT`) VALUES
(1, NULL, 'Железобетонный'),
(2, NULL, 'Блочный'),
(3, NULL, 'Кирпичный');

--
-- Дамп данных таблицы `NL_MATERIAL`
--

INSERT INTO `NL_MATERIAL` (`ID_NL_MATERIAL`, `NL_MATERIAL_SHORT`) VALUES
(1, 'Панель'),
(2, 'Газоблок'),
(3, 'Кирпич');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `NL_LOG`
--
ALTER TABLE `NL_LOG`
  ADD PRIMARY KEY (`ID_NL_LOG`) USING BTREE,
  ADD KEY `ID_NL_USER` (`ID_NL_USER`) USING BTREE;

--
-- Индексы таблицы `NL_LOG_DETAIL`
--
ALTER TABLE `NL_LOG_DETAIL`
  ADD PRIMARY KEY (`ID_NL_LOG_DETAIL`) USING BTREE,
  ADD KEY `ID_NL_LOG` (`ID_NL_LOG`) USING BTREE;

--
-- Индексы таблицы `NL_PROP_RESALE`
--
ALTER TABLE `NL_PROP_RESALE`
  ADD PRIMARY KEY (`ID_NL_PROP_RESALE`) USING BTREE,
  ADD KEY `ID_NL_VIEW` (`ID_NL_VIEW`) USING BTREE,
  ADD KEY `ID_NL_HOUSES` (`ID_NL_HOUSES`) USING BTREE,
  ADD KEY `ID_NL_MATERIAL` (`ID_NL_MATERIAL`) USING BTREE;

--
-- Индексы таблицы `NL_USER`
--
ALTER TABLE `NL_USER`
  ADD PRIMARY KEY (`ID_NL_USER`) USING BTREE,
  ADD KEY `ID_NL_USER_PERMISSION` (`ID_NL_USER_PERMISSION`) USING BTREE;

--
-- Индексы таблицы `NL_USER_PERMISSION`
--
ALTER TABLE `NL_USER_PERMISSION`
  ADD PRIMARY KEY (`ID_NL_USER_PERMISSION`) USING BTREE;

--
-- Индексы таблицы `NL_VIEW`
--
ALTER TABLE `NL_VIEW`
  ADD PRIMARY KEY (`ID_NL_VIEW`) USING BTREE;

--
-- Индексы таблицы `NL_HOUSES`
--
ALTER TABLE `NL_HOUSES`
  ADD PRIMARY KEY (`ID_NL_HOUSES`) USING BTREE,
  ADD KEY `ID_NL_MATERIAL` (`ID_NL_MATERIAL`) USING BTREE;

--
-- Индексы таблицы `NL_MATERIAL`
--
ALTER TABLE `NL_MATERIAL`
  ADD PRIMARY KEY (`ID_NL_MATERIAL`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `NL_LOG`
--
ALTER TABLE `NL_LOG`
  MODIFY `ID_NL_LOG` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `NL_LOG_DETAIL`
--
ALTER TABLE `NL_LOG_DETAIL`
  MODIFY `ID_NL_LOG_DETAIL` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `NL_PROP_RESALE`
--
ALTER TABLE `NL_PROP_RESALE`
  MODIFY `ID_NL_PROP_RESALE` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `NL_USER`
--
ALTER TABLE `NL_USER`
  MODIFY `ID_NL_USER` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `NL_USER_PERMISSION`
--
ALTER TABLE `NL_USER_PERMISSION`
  MODIFY `ID_NL_USER_PERMISSION` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `NL_VIEW`
--
ALTER TABLE `NL_VIEW`
  MODIFY `ID_NL_VIEW` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `NL_HOUSES`
--
ALTER TABLE `NL_HOUSES`
  MODIFY `ID_NL_HOUSES` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `NL_MATERIAL`
--
ALTER TABLE `NL_MATERIAL`
  MODIFY `ID_NL_MATERIAL` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `NL_LOG`
--
ALTER TABLE `NL_LOG`
  ADD CONSTRAINT `NL_LOG_IBFK_1` FOREIGN KEY (`ID_NL_USER`) REFERENCES `NL_USER` (`ID_NL_USER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `NL_LOG_DETAIL`
--
ALTER TABLE `NL_LOG_DETAIL`
  ADD CONSTRAINT `NL_LOG_DETAIL_IBFK_1` FOREIGN KEY (`ID_NL_LOG`) REFERENCES `NL_LOG` (`ID_NL_LOG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `NL_HOUSES`
--
ALTER TABLE `NL_HOUSES` 
  ADD CONSTRAINT `nl_houses_ibfk_1` FOREIGN KEY (`ID_NL_MATERIAL`) REFERENCES `NL_MATERIAL` (`ID_NL_MATERIAL`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `NL_PROP_RESALE`
--
ALTER TABLE `NL_PROP_RESALE`
  ADD CONSTRAINT `nl_prop_resale_ibfk_1` FOREIGN KEY (`ID_NL_VIEW`) REFERENCES `NL_VIEW` (`ID_NL_VIEW`) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  ADD CONSTRAINT `nl_prop_resale_ibfk_2` FOREIGN KEY (`ID_NL_HOUSES`) REFERENCES `NL_HOUSES` (`ID_NL_HOUSES`) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  ADD CONSTRAINT `nl_prop_resale_ibfk_3` FOREIGN KEY (`ID_NL_MATERIAL`) REFERENCES `NL_MATERIAL` (`ID_NL_MATERIAL`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `NL_USER`
--
ALTER TABLE `NL_USER`
  ADD CONSTRAINT `NL_USER_IBFK_1` FOREIGN KEY (`ID_NL_USER_PERMISSION`) REFERENCES `NL_USER_PERMISSION` (`ID_NL_USER_PERMISSION`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;