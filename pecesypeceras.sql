-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2022 a las 12:09:38
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
(45, 'D'),
(46, 'D'),
(47, 'D');

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
(80, 'Dory', './images/cirujanoAzul.png', 8, 15, 5),
(81, 'Nemo', './images/pezPayaso.png', 6, 15, 5),
(82, 'Tam kecnch', './images/siluro.png', 5, 15, 5),
(83, 'Alfonso', './images/mero.png', 1, 15, 5),
(84, 'Pipo', './images/atun.png', 2, 15, 5),
(85, 'Burbujas', './images/atun.png', 2, 15, 5),
(86, 'Perico', './images/lubina.png', 4, 15, 5),
(87, 'Smithers', './images/mariposaNarizona.png', 7, 15, 5),
(88, 'Marina', './images/lubina.png', 4, 15, 5),
(89, 'Turucha', './images/trucha.png', 3, 15, 5),
(90, 'Lily', './images/cirujanoAzul.png', 8, 45, 5),
(91, 'Manzana', './images/pezPayaso.png', 6, 46, 5),
(92, 'Pepillo', './images/siluro.png', 5, 15, 5),
(94, 'PezPruebas', './images/mariposaNarizona.png', 7, 47, 5);

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
(3, 'Trucha', 'D'),
(4, 'Lubina', 'S'),
(5, 'Siluro', 'D'),
(6, 'Payaso', 'D'),
(7, 'Mariposa Narizona', 'D'),
(8, 'Cirujano Azul', 'D');

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
(28, 'Profesor', 'contraseña', 45),
(29, 'JorgePerez', 'contraseña', 46),
(30, 'UsuarioPruebas', 'contraseña', 47);

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
  MODIFY `codPecera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `pez`
--
ALTER TABLE `pez`
  MODIFY `codPez` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `tipopez`
--
ALTER TABLE `tipopez`
  MODIFY `codTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
