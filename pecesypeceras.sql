-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2022 a las 12:37:43
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pecesypeceras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pecera`
--

CREATE TABLE `pecera` (
  `codPecera` int(11) NOT NULL,
  `tipoAgua` char(1) DEFAULT NULL CHECK (`tipoAgua` = 'S' or `tipoAgua` = 'D')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pecera`
--

INSERT INTO `pecera` (`codPecera`, `tipoAgua`) VALUES
(15, 'S'),
(16, 'D'),
(17, 'D'),
(18, 'S'),
(19, 'S'),
(20, 'D'),
(21, 'D'),
(22, 'D'),
(23, 'D'),
(24, 'D'),
(25, 'D'),
(26, 'D'),
(27, 'D'),
(28, 'D'),
(29, 'D'),
(30, 'D'),
(31, 'D'),
(32, 'D'),
(33, 'D'),
(34, 'D'),
(35, 'D'),
(36, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pez`
--

CREATE TABLE `pez` (
  `codPez` int(11) NOT NULL,
  `nomPez` varchar(20) NOT NULL,
  `imgPez` varchar(100) NOT NULL DEFAULT 'imagen pez',
  `codTipo` int(11) NOT NULL,
  `codPecera` int(11) NOT NULL,
  `pesoPez` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pez`
--

INSERT INTO `pez` (`codPez`, `nomPez`, `imgPez`, `codTipo`, `codPecera`, `pesoPez`) VALUES
(6, 'perico', './images/mero.png', 1, 15, 5),
(7, 'pericof', './images/mero.png', 1, 15, 5),
(9, 'pericoffdf', './images/mero.png', 1, 15, 5),
(11, 'Periquito', './images/trucha.png', 3, 15, 5),
(12, 'Periquitoo', './images/trucha.png', 3, 15, 5),
(13, 'Periquitooo', './images/trucha.png', 3, 15, 5),
(15, 'dffdsfsdf', './images/mero.png', 1, 15, 5),
(16, 'dffdsfsdfefew', './images/mero.png', 1, 15, 5),
(17, 'fdsfsfdsfds', './images/atun.png', 2, 15, 5),
(20, 'efef', './images/mero.png', 1, 15, 5),
(21, 'oioioio', './images/atun.png', 2, 15, 5),
(22, 'paquito', './images/atun.png', 2, 15, 5),
(23, 'cfef', 'imagen pez', 2, 16, 5),
(24, 'fefok', './images/mero.png', 1, 16, 5),
(25, 'egeriognroe', './images/trucha.png', 3, 15, 5),
(26, 'Arturo', './images/mero.png', 1, 15, 5),
(27, 'palor', './images/mero.png', 1, 15, 5),
(28, 'Roberto', './images/trucha.png', 3, 15, 5),
(29, 'Antoniofd', './images/mero.png', 1, 15, 5),
(32, 'Pepe', './images/trucha.png', 3, 15, 5),
(33, 'opus', './images/atun.png', 2, 15, 5),
(34, 'Correo', './images/atun.png', 2, 15, 5),
(36, 'ioioir', './images/mero.png', 1, 15, 5),
(38, 'Topor', './images/atun.png', 2, 15, 5),
(40, 'Paquitoo', './images/atun.png', 2, 15, 5),
(41, 'ioior', './images/mero.png', 1, 32, 5),
(42, 'oooooooooooo', './images/mero.png', 1, 33, 5),
(45, 'eeeeeeeeeeeeeeeeeee', './images/mero.png', 1, 34, 5),
(50, 'hgjfj', './images/mero.png', 1, 36, 5),
(51, 'alfonso', './images/mero.png', 1, 36, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopez`
--

CREATE TABLE `tipopez` (
  `codTipo` int(11) NOT NULL,
  `nomTipo` varchar(20) NOT NULL,
  `tipoAgua` char(1) DEFAULT NULL CHECK (`tipoAgua` = 'S' or `tipoAgua` = 'D')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipopez`
--

INSERT INTO `tipopez` (`codTipo`, `nomTipo`, `tipoAgua`) VALUES
(1, 'Mero', 'S'),
(2, 'Atun', 'S'),
(3, 'Trucha', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codUsuario` int(11) NOT NULL,
  `nomUsuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `codPecera` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codUsuario`, `nomUsuario`, `contrasena`, `codPecera`) VALUES
(15, 'AleCueto', 'contraseña', 15),
(17, 'usuario2', 'contraseña', 16),
(18, 'NuevoUsuario', 'contraseña', 35),
(19, 'NuevoUsuario2', 'NuevoUsuario2', 36);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pecera`
--
ALTER TABLE `pecera`
  ADD PRIMARY KEY (`codPecera`);

--
-- Indices de la tabla `pez`
--
ALTER TABLE `pez`
  ADD PRIMARY KEY (`codPez`),
  ADD UNIQUE KEY `nomPez` (`nomPez`),
  ADD KEY `codTipo` (`codTipo`),
  ADD KEY `codPecera` (`codPecera`);

--
-- Indices de la tabla `tipopez`
--
ALTER TABLE `tipopez`
  ADD PRIMARY KEY (`codTipo`),
  ADD UNIQUE KEY `nomTipo` (`nomTipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codUsuario`),
  ADD UNIQUE KEY `nomUsuario` (`nomUsuario`),
  ADD KEY `codPecera` (`codPecera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pecera`
--
ALTER TABLE `pecera`
  MODIFY `codPecera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `pez`
--
ALTER TABLE `pez`
  MODIFY `codPez` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `tipopez`
--
ALTER TABLE `tipopez`
  MODIFY `codTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pez`
--
ALTER TABLE `pez`
  ADD CONSTRAINT `pez_ibfk_1` FOREIGN KEY (`codTipo`) REFERENCES `tipopez` (`codTipo`),
  ADD CONSTRAINT `pez_ibfk_2` FOREIGN KEY (`codPecera`) REFERENCES `pecera` (`codPecera`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codPecera`) REFERENCES `pecera` (`codPecera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
