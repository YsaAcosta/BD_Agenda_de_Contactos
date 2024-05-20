-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 05:28:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_de_contactos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `ID_Contacto` int(10) UNSIGNED NOT NULL,
  `Nombre_Contacto` varchar(250) NOT NULL,
  `Apellido_Contacto` varchar(250) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`ID_Contacto`, `Nombre_Contacto`, `Apellido_Contacto`, `Telefono`, `Email`, `Fecha_nacimiento`) VALUES
(6, 'Mariana', ' Acosta', '12345', 'mariana@gmail.com', '2004-05-11'),
(7, 'Jose ', 'Ollarves', '12345', 'joseandresromeroollarves@gmai.com', '2004-03-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_etiqueta`
--

CREATE TABLE `contacto_etiqueta` (
  `ID_Relacion` int(10) UNSIGNED NOT NULL,
  `ID_Contacto` int(10) UNSIGNED NOT NULL,
  `ID_Etiqueta` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_grupo`
--

CREATE TABLE `contacto_grupo` (
  `ID_Relacion` int(10) UNSIGNED NOT NULL,
  `ID_Contacto` int(10) UNSIGNED NOT NULL,
  `ID_Grupo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `ID_Direccion` int(10) UNSIGNED NOT NULL,
  `Pais` varchar(200) NOT NULL,
  `Estado` varchar(250) NOT NULL,
  `Ciudad` varchar(250) NOT NULL,
  `Calle` varchar(250) NOT NULL,
  `ID_Contacto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `ID_Etiqueta` int(10) UNSIGNED NOT NULL,
  `Nombre_Etiqueta` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `ID_Evento` int(10) UNSIGNED NOT NULL,
  `Nombre_Evento` varchar(250) NOT NULL,
  `Fecha_Evento` date NOT NULL,
  `ID_Contacto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `ID_Grupo` int(10) UNSIGNED NOT NULL,
  `Nombre_Grupo` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_de_comunicacion`
--

CREATE TABLE `historial_de_comunicacion` (
  `ID_Historial` int(10) UNSIGNED NOT NULL,
  `ID_Contacto` int(10) UNSIGNED NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Tipo_de_Comunicacion` enum('Llamada telef?nica','Mensaje de Texto/SMS','Videollamada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`ID_Contacto`);

--
-- Indices de la tabla `contacto_etiqueta`
--
ALTER TABLE `contacto_etiqueta`
  ADD PRIMARY KEY (`ID_Relacion`),
  ADD KEY `ID_Contacto` (`ID_Contacto`),
  ADD KEY `ID_Etiqueta` (`ID_Etiqueta`);

--
-- Indices de la tabla `contacto_grupo`
--
ALTER TABLE `contacto_grupo`
  ADD PRIMARY KEY (`ID_Relacion`),
  ADD KEY `ID_Contacto` (`ID_Contacto`),
  ADD KEY `ID_Grupo` (`ID_Grupo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`ID_Direccion`),
  ADD KEY `ID_Contacto` (`ID_Contacto`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`ID_Etiqueta`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`ID_Evento`),
  ADD KEY `ID_Contacto` (`ID_Contacto`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`ID_Grupo`);

--
-- Indices de la tabla `historial_de_comunicacion`
--
ALTER TABLE `historial_de_comunicacion`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `ID_Contacto` (`ID_Contacto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `ID_Contacto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contacto_etiqueta`
--
ALTER TABLE `contacto_etiqueta`
  MODIFY `ID_Relacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_grupo`
--
ALTER TABLE `contacto_grupo`
  MODIFY `ID_Relacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `ID_Direccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `ID_Etiqueta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `ID_Evento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `ID_Grupo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_de_comunicacion`
--
ALTER TABLE `historial_de_comunicacion`
  MODIFY `ID_Historial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacto_etiqueta`
--
ALTER TABLE `contacto_etiqueta`
  ADD CONSTRAINT `contacto_etiqueta_ibfk_1` FOREIGN KEY (`ID_Contacto`) REFERENCES `contacto` (`ID_Contacto`),
  ADD CONSTRAINT `contacto_etiqueta_ibfk_2` FOREIGN KEY (`ID_Etiqueta`) REFERENCES `etiqueta` (`ID_Etiqueta`);

--
-- Filtros para la tabla `contacto_grupo`
--
ALTER TABLE `contacto_grupo`
  ADD CONSTRAINT `contacto_grupo_ibfk_1` FOREIGN KEY (`ID_Contacto`) REFERENCES `contacto` (`ID_Contacto`),
  ADD CONSTRAINT `contacto_grupo_ibfk_2` FOREIGN KEY (`ID_Grupo`) REFERENCES `grupo` (`ID_Grupo`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`ID_Contacto`) REFERENCES `contacto` (`ID_Contacto`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`ID_Contacto`) REFERENCES `contacto` (`ID_Contacto`);

--
-- Filtros para la tabla `historial_de_comunicacion`
--
ALTER TABLE `historial_de_comunicacion`
  ADD CONSTRAINT `historial_de_comunicacion_ibfk_1` FOREIGN KEY (`ID_Contacto`) REFERENCES `contacto` (`ID_Contacto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
