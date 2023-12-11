-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 11 2023 г., 10:28
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lara-task-app`
--

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `original_link` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `private_token` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `links`
--

INSERT INTO `links` (`id`, `user_id`, `original_link`, `token`, `private_token`, `is_private`, `created_at`, `updated_at`) VALUES
(1, 2, 'https://github.com/zhanik228', 'USHdSMEqPX', 'YcP8Bcs5Ek', 1, NULL, NULL),
(2, 2, 'https://github.com/', 'clwmqagIYP', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_12_11_074013_create_links_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api', '8cbde652fee748daae54a922aafe27ca2149c5685503a95dd7fe9c4e5ab7c1b2', '[\"*\"]', '2023-12-11 06:19:50', NULL, '2023-12-11 06:06:01', '2023-12-11 06:19:50'),
(2, 'App\\Models\\User', 3, 'api', '4006a1859393ad753e27ef20802e1052efbbdd058ecd8164b3510d727fcd9b3d', '[\"*\"]', NULL, NULL, '2023-12-11 06:06:35', '2023-12-11 06:06:35'),
(3, 'App\\Models\\User', 2, 'api', 'ede5c3ef956a15f44e8b49760b9bac8a7cb5988e3fcff5888eb2b7e50896e6c3', '[\"*\"]', NULL, NULL, '2023-12-11 06:18:01', '2023-12-11 06:18:01'),
(4, 'App\\Models\\User', 4, 'api', '66787fb5c4d3dc08e725ab5bbcadac96f3d2ad08e4b8097a9c404bf206f88f94', '[\"*\"]', NULL, NULL, '2023-12-11 06:19:51', '2023-12-11 06:19:51'),
(5, 'App\\Models\\User', 2, 'api', 'e7363eceac8c3c59f304c76d481f9b5dbf20d89f1fde48ac858c3abf7bd53436', '[\"*\"]', '2023-12-11 06:21:22', NULL, '2023-12-11 06:20:58', '2023-12-11 06:21:22');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_super` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `is_super`, `created_at`, `updated_at`) VALUES
(1, 'super-user', 'super-user@mail.ru', '$2y$12$HgZoN0HRhhz5DyC7ACnXiOvwBjxrQi77eiiCZiQcznTNq4wMkp5Le', 1, NULL, NULL),
(2, 'just-user', 'just-user@mail.ru', '$2y$12$7wq7HX5ynAilCLE8T0lUBulqe/C3hK/0c9lXKlLsuRO.d8pEPfJwy', 0, NULL, NULL),
(3, 'new-user', 'new-user@gmail.com', '$2y$12$n.OwHnkEiYw1/3kX/s3nIuZkvjeui9BIrkKtX.Qk1B6B4RythLEmm', 0, '2023-12-11 06:06:35', '2023-12-11 06:06:35'),
(4, 'new-use', 'new-user@gmail.com', '$2y$12$MGpakRkqdoNei3Vs/yp4/OYzhGB2C/pHuMoFjqd4/U/rL5GVBaC1u', 0, '2023-12-11 06:19:51', '2023-12-11 06:19:51');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `links_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
