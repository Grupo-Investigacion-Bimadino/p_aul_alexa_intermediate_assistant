-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2023 a las 04:55:30
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myapi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_alum`
--

CREATE TABLE `t_alum` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `ape` varchar(50) NOT NULL,
  `cod_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_alum`
--

INSERT INTO `t_alum` (`id`, `nom`, `ape`, `cod_curso`) VALUES
(1, 'Carlos', 'Pérez', 2),
(2, 'Julio', 'Perez', 1),
(3, 'Ernesto ', 'Santos', 1),
(4, 'Luis', 'Peralta', 3),
(5, 'Elizabeth ', 'Avila ', 5),
(6, 'Alex ', 'Banda ', 5),
(7, 'Shaira ', 'Barrios ', 5),
(8, 'Mariana ', 'Bedoya ', 5),
(9, 'Juan ', 'Diaz ', 1),
(10, 'Valeria ', 'Diaz', 1),
(11, 'Maria ', 'Florez ', 1),
(12, 'Alan ', 'Galarcio ', 2),
(13, 'Samantha ', 'Hernandez ', 2),
(14, 'Valeria ', 'Jimenez ', 2),
(15, 'Grabriela ', 'López ', 3),
(16, 'Isabella ', 'López ', 3),
(17, 'Samir ', 'Márquez ', 3),
(18, 'Julián ', 'Olivero ', 4),
(19, 'Andrés ', 'Ospino ', 4),
(20, 'Víctor ', 'Pérez ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_curso`
--

CREATE TABLE `t_curso` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_curso`
--

INSERT INTO `t_curso` (`cod`, `nombre`, `tema`) VALUES
(1, 'Matemática', 'Números enteros '),
(2, 'Español', 'Uso de la S'),
(3, 'Sociales', 'Los departamentos '),
(4, 'Sociales', 'Los municipios '),
(5, 'Informática', 'El hardware'),
(6, 'Matemática ', 'Expresiones Algebraicas '),
(7, 'Español ', 'Sinónimos y antónimos '),
(8, 'Sociales ', 'Los mitos y leyendas '),
(9, 'Informática ', 'El Software '),
(10, 'Informática ', 'El internet '),
(11, 'Matemática ', 'Teoría de conjuntos '),
(12, 'Español ', 'El dialogo ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_evaluacion`
--

CREATE TABLE `t_evaluacion` (
  `id` int(11) NOT NULL,
  `nota_1` int(11) NOT NULL,
  `nota_2` int(11) NOT NULL,
  `nota_3` int(11) NOT NULL,
  `definitiva` int(11) NOT NULL,
  `id_alum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_evaluacion`
--

INSERT INTO `t_evaluacion` (`id`, `nota_1`, `nota_2`, `nota_3`, `definitiva`, `id_alum`) VALUES
(456, 4, 5, 3, 4, 1),
(457, 3, 3, 3, 3, 3),
(458, 2, 3, 3, 3, 2),
(459, 4, 4, 4, 4, 4),
(460, 5, 3, 3, 4, 5),
(461, 3, 3, 4, 3, 6),
(462, 1, 3, 4, 3, 7),
(463, 4, 4, 4, 4, 8),
(464, 5, 4, 4, 4, 9),
(465, 4, 3, 4, 4, 10),
(466, 5, 5, 4, 5, 11),
(467, 5, 4, 3, 4, 12),
(468, 4, 3, 5, 4, 13),
(469, 5, 4, 4, 4, 14),
(470, 3, 4, 4, 4, 15),
(471, 5, 5, 5, 5, 16),
(472, 4, 4, 4, 4, 17),
(473, 4, 2, 1, 2, 18),
(474, 1, 2, 2, 2, 19),
(475, 1, 1, 1, 1, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_alum`
--
ALTER TABLE `t_alum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_curso` (`cod_curso`);

--
-- Indices de la tabla `t_curso`
--
ALTER TABLE `t_curso`
  ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `t_evaluacion`
--
ALTER TABLE `t_evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alum` (`id_alum`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_alum`
--
ALTER TABLE `t_alum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT de la tabla `t_curso`
--
ALTER TABLE `t_curso`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `t_evaluacion`
--
ALTER TABLE `t_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_alum`
--
ALTER TABLE `t_alum`
  ADD CONSTRAINT `t_alum_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `t_curso` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `t_evaluacion`
--
ALTER TABLE `t_evaluacion`
  ADD CONSTRAINT `t_evaluacion_ibfk_1` FOREIGN KEY (`id_alum`) REFERENCES `t_alum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
