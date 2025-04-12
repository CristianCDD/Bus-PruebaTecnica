-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2025 a las 23:23:44
-- Versión del servidor: 8.0.41
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `buses`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bus`
--

CREATE TABLE `bus` (
  `id` int NOT NULL,
  `numero_bus` varchar(50) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `caracteristicas` text,
  `activo` tinyint(1) DEFAULT NULL,
  `marca_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `bus`
--

INSERT INTO `bus` (`id`, `numero_bus`, `placa`, `fecha_creacion`, `caracteristicas`, `activo`, `marca_id`) VALUES
(1, 'BUS-001', 'ABC-123', '2025-04-12 01:47:32', 'Bus con aire acondicionado', 1, 1),
(2, 'BUS-002', 'DEF-456', '2025-04-12 01:47:32', 'Bus doble piso con baño', 1, 2),
(3, 'BUS-003', 'GHI-789', '2025-04-12 01:47:32', 'Bus urbano con rampas para discapacitados', 0, 3),
(4, 'BUS-004', 'JKL-321', '2025-04-12 01:47:32', 'Bus interprovincial con TV y WiFi', 1, 4),
(5, 'BUS-005', 'MNO-654', '2025-04-12 01:47:32', 'Bus escolar', 0, 5),
(6, 'BUS-001', 'ABC-123', '2025-04-12 01:48:06', 'Bus con aire acondicionado', 1, 1),
(7, 'BUS-002', 'DEF-456', '2025-04-12 01:48:06', 'Bus doble piso con baño', 1, 2),
(8, 'BUS-003', 'GHI-789', '2025-04-12 01:48:06', 'Bus urbano con rampas para discapacitados', 0, 3),
(9, 'BUS-004', 'JKL-321', '2025-04-12 01:48:06', 'Bus interprovincial con TV y WiFi', 1, 4),
(10, 'BUS-005', 'MNO-654', '2025-04-12 01:48:06', 'Bus escolar', 0, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_bus`
--

CREATE TABLE `marca_bus` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marca_bus`
--

INSERT INTO `marca_bus` (`id`, `nombre`) VALUES
(1, 'Volvo'),
(2, 'Scania'),
(3, 'Mercedes-Benz'),
(4, 'Fiat'),
(5, 'Hyundai');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `marca_bus`
--
ALTER TABLE `marca_bus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `marca_bus`
--
ALTER TABLE `marca_bus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca_bus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
