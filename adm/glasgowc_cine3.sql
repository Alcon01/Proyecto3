-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2022 a las 23:23:04
-- Versión del servidor: 10.3.36-MariaDB-cll-lve
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `glasgowc_cine3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartelera`
--

CREATE TABLE `cartelera` (
  `id_cartelera` int(10) NOT NULL,
  `id_pelicula` int(10) NOT NULL,
  `id_sala` int(10) NOT NULL,
  `hora` time(4) NOT NULL,
  `fecha` date NOT NULL,
  `precio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cartelera`
--

INSERT INTO `cartelera` (`id_cartelera`, `id_pelicula`, `id_sala`, `hora`, `fecha`, `precio`) VALUES
(1, 1, 1, '02:10:00.0000', '2022-05-26', 45),
(28, 1, 1, '02:10:00.0000', '2022-05-27', 45),
(29, 1, 2, '08:25:00.0000', '2022-05-27', 45),
(30, 1, 3, '14:15:00.0000', '2022-05-27', 45),
(31, 1, 1, '15:30:00.0000', '2022-05-28', 45),
(32, 4, 4, '16:00:00.0000', '2022-05-27', 50),
(33, 4, 3, '18:00:00.0000', '2022-05-27', 45),
(34, 4, 2, '20:00:00.0000', '2022-05-26', 45),
(35, 2, 1, '14:00:00.0000', '2022-05-27', 45),
(36, 2, 4, '10:00:00.0000', '2022-05-27', 50),
(37, 2, 3, '22:00:00.0000', '2022-05-26', 45),
(38, 3, 3, '23:00:00.0000', '2022-05-27', 45),
(39, 3, 4, '01:20:00.0000', '2022-05-28', 50),
(40, 3, 1, '22:00:00.0000', '2022-05-27', 45),
(41, 1, 1, '08:25:00.0000', '2022-05-27', 45),
(42, 1, 3, '10:00:00.0000', '2022-05-27', 45),
(43, 1, 4, '17:00:00.0000', '2022-05-26', 50),
(44, 5, 1, '19:35:00.0000', '0000-00-00', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartelera_asientos`
--

CREATE TABLE `cartelera_asientos` (
  `id_cartelera_asientos` int(11) NOT NULL,
  `id_asiento` int(11) NOT NULL,
  `id_cartelera` int(11) NOT NULL,
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cartelera_asientos`
--

INSERT INTO `cartelera_asientos` (`id_cartelera_asientos`, `id_asiento`, `id_cartelera`, `estado`) VALUES
(1, 1, 28, 'uso'),
(2, 2, 28, 'sin uso'),
(3, 3, 28, 'uso'),
(4, 4, 28, 'uso'),
(5, 3, 28, 'uso'),
(6, 4, 28, 'uso'),
(7, 5, 28, 'uso'),
(8, 6, 28, 'uso'),
(9, 7, 28, 'uso'),
(10, 8, 28, 'uso'),
(11, 9, 28, 'uso'),
(12, 10, 28, 'uso'),
(13, 11, 28, 'uso'),
(14, 12, 28, 'uso'),
(15, 13, 28, 'uso'),
(16, 14, 28, 'uso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cine`
--

CREATE TABLE `factura_cine` (
  `id_factura` int(11) NOT NULL,
  `id_c_asientos` int(11) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(50) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura_cine`
--

INSERT INTO `factura_cine` (`id_factura`, `id_c_asientos`, `id_usuario`, `cantidad`, `total`, `fecha`) VALUES
(2, 3, 3, 5, 225, '2022-05-26'),
(6, 1, 3, 1, 45, '2022-05-26'),
(8, 16, 1, 4, 180, '2022-05-27'),
(9, 16, 3, 1, 45, '2022-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id_pelicula` int(10) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `imagen` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `duracion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sinopsis` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id_pelicula`, `nombre`, `imagen`, `duracion`, `sinopsis`) VALUES
(1, 'Sonic 2 la pelicula', 'https://www.ecartelera.com/carteles/16600/16674/001_m.jpg', '1:30 hrs', 'Cuando el maniaco Dr. Robotnik regresa a la Tierra con un nuevo aliado, Knuckles the Echidna, Sonic y su nuevo amigo Tails son todo lo que se interpone en su camino.'),
(2, 'Dr Strange: Multiverse of Madness', 'https://dam.smashmexico.com.mx/wp-content/uploads/2022/02/doctor-strange-nuevo-poster.jpg', '2hrs', 'Secuela de la pelicula de Marvel de 2016 Doctor Strange.'),
(3, 'Sin descanso', 'https://comunidaria.com/wp-content/uploads/2022/03/estreno-nacional-de-la-pelicula-sin-descanso-1.jpg', '1:30hrs', 'Un joven estudiante de medicina busca la cura para una enfermedad que te mata de sueno y que afecta a su hermano.'),
(4, 'Spider Man No Way Home', 'https://pics.filmaffinity.com/spider_man_no_way_home-642739124-large.jpg', '2:28 hrs', 'Tras descubrirse la identidad secreta de Peter Parker como Spider-Man, la vida del joven se vuelve una locura. Peter decide pedirle ayuda al Doctor ExtraÃ±o para recuperar su vida. Pero algo sale mal '),
(5, ' Avengers: Infinity War', 'https://es.web.img3.acsta.net/pictures/18/03/16/15/33/3988420.jpg', '2hrs', 'asd'),
(6, 'Porno', 'https://tenor.com/es/ver/%EC%B5%9C%EC%98%88%EB%82%98-choi-yena-%ED%94%84%EB%A1%9C%EB%93%80%EC%8A%A448-produce48-%EC%9C%84%EC%97%90%ED%99%94-gif-5772326760315670358', '2', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(10) NOT NULL,
  `tipo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `capacidad` int(50) NOT NULL,
  `estado` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id_sala`, `tipo`, `capacidad`, `estado`) VALUES
(1, '3D', 50, 'Reparacion'),
(2, 'IMAX', 50, 'nuevo'),
(3, 'IMAX', 75, 'nuevo'),
(4, 'IMAX-3D', 25, 'nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala_asiento`
--

CREATE TABLE `sala_asiento` (
  `id_sala_asiento` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sala_asiento`
--

INSERT INTO `sala_asiento` (`id_sala_asiento`, `id_sala`, `nombre`) VALUES
(1, 4, '4.1'),
(2, 4, '4.2'),
(3, 4, '4.3'),
(4, 4, '4.4'),
(5, 4, '4.5'),
(6, 4, '4.6'),
(7, 4, '4.7'),
(8, 4, '4.8'),
(9, 4, '4.9'),
(10, 4, '4.10'),
(11, 4, '4.11'),
(12, 4, '4.12'),
(13, 4, '4.13'),
(14, 4, '4.14'),
(15, 4, '4.15'),
(16, 4, '4.16'),
(17, 4, '4.17'),
(18, 4, '4.18'),
(19, 4, '4.19'),
(20, 4, '4.20'),
(21, 4, '4.21'),
(22, 4, '4.22'),
(23, 4, '4.23'),
(24, 4, '4.24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `snacks`
--

CREATE TABLE `snacks` (
  `id_snack` int(11) NOT NULL,
  `nombre_snack` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen_s` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `snacks`
--

INSERT INTO `snacks` (`id_snack`, `nombre_snack`, `imagen_s`, `precio`, `cantidad`) VALUES
(1, 'Chips Ahoy', 'https://ecomarket.com.bo/wp-content/uploads/2020/12/chipahoy.png', 15, 100),
(2, 'Coca cola 200 ml', 'https://world-es.openfoodfacts.org/images/products/930/067/500/1113/front_en.9.200.jpg', 5, 48),
(8, 'nachos', 'https://static.vecteezy.com/system/resources/thumbnails/002/651/168/small/delicious-mexican-nachos-detaild-style-icon-free-vector.jpg', 14, 23),
(10, 'pipocas (S)', 'https://roisbros.gr/wp-content/uploads/2019/02/Crepes-and-popcorn-09-scaled-100x100.jpg', 10, 98),
(11, 'pipocas (M)', 'https://roisbros.gr/wp-content/uploads/2019/02/Crepes-and-popcorn-09-scaled-100x100.jpg', 15, 110),
(12, 'pipocas (G)', 'https://roisbros.gr/wp-content/uploads/2019/02/Crepes-and-popcorn-09-scaled-100x100.jpg', 18, 108),
(13, 'snickers', 'https://jumbocolombiafood.vteximg.com.br/arquivos/ids/198499-750-750/40000514251.jpg?v=636246815046700000', 15, 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_snack`
--

CREATE TABLE `stock_snack` (
  `id_snack` int(11) NOT NULL,
  `stock` int(50) NOT NULL,
  `precio` int(50) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stock_snack`
--

INSERT INTO `stock_snack` (`id_snack`, `stock`, `precio`, `fecha`) VALUES
(8, 6, 10, '2022-06-08'),
(12, 10, 20, '2022-06-09'),
(11, 10, 45, '2022-06-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `user` varchar(50) NOT NULL,
  `numero` int(50) NOT NULL,
  `cvc` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`user`, `numero`, `cvc`) VALUES
('joseph@cine.com', 2147483647, 123),
('joseph@cine.com', 2147483647, 333),
('joseph@cine.com', 2147483647, 152),
('joseph@cine.com', 2147483647, 454),
('joseph@cine.com', 2147483647, 152),
('joseph@cine.com', 2147483647, 1),
('joseph@cine.com', 2147483647, 111),
('joseph@cine.com', 2147483647, 111),
('a@gmail.com', 123456789, 142),
('Joseph@cine.com', 2147483647, 555),
('Joseph@cine.com', 407740060, 155),
('Joseph@cine.com', 407740060, 545),
('joseph@cine.com', 78887888, 454),
('a@gmail.com', 2147483647, 666),
('a@gmail.com', 2147483647, 555),
('urrelo@gmail.com', 2147483647, 555),
('urrelo@gmail.com', 2147483647, 555),
('lara@gmail.com', 2147483647, 555),
('prueba@gmail.com', 2147483647, 555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tarjeta` int(50) DEFAULT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nit`, `apellido`, `correo`, `password`, `tarjeta`, `rol`) VALUES
(1, 'a', 'quinteros', 'a@gmail.com', 'a', 2147483647, '1'),
(3, '123', 'barral', 'j', 'j', NULL, '2'),
(4, '123', 'Quinteros', 'h@com', 'q', 2147483647, '3'),
(11, '5', 'q', 'q5', '123', NULL, '2'),
(12, '123455667', 'urrelo', 'urrelo@gmail.com', 'urrelo', 2147483647, '3'),
(13, '74848', 'urrelo', 'urrelo74848', '123', NULL, '2'),
(14, '123', 'Vallejos', 'Vallejos123', 'carlos', NULL, '2'),
(15, '123456789', 'quinteros', 'lara@gmail.com', 'lara', 2147483647, '3'),
(16, '788484', 'emp', 'emp', 'emp', NULL, '2'),
(17, '12345', 'prueba', 'prueba@gmail.com', 'q', 2147483647, '3'),
(18, '7558', 'veliz', 'veliz7558', '123', NULL, '2'),
(19, '', 'b', 'j@gmail.com', 'q', NULL, '3'),
(20, 'pruebanit', 'pruebaape', 'pr@gmail.com', 'q', NULL, '3'),
(21, 'pruebanit', 'pruebaape', 'a2@gmail.com', 'e', NULL, '3'),
(22, 'pruebanit', 'pruebaape', 'adrian@gmail.com', 'adrian', NULL, '3'),
(23, 'pruebanit', 'pruebaape', 'khorel@gmail.com', 'khroel', NULL, '3'),
(24, 'pruebanit', 'pruebaape', 'ps@gmail.com', 'o', NULL, '3'),
(25, 'pruebanit', 'pruebaape', 'fabian@gmail.com', 'j', NULL, '3'),
(26, 'pruebanit', 'pruebaape', 'fabian2@gmail.com', 'l', NULL, '3'),
(27, '123131313', 'pruebaxs', 'empleado1', 'emp1', NULL, '3'),
(28, '1232131231', 'prueba2', 'empleado2', 'emp2', NULL, '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_cine`
--

CREATE TABLE `venta_cine` (
  `id_venta` int(11) NOT NULL,
  `id_cartelera` int(11) DEFAULT NULL,
  `num_tarjeta` int(11) NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `asiento` int(11) NOT NULL,
  `fecha` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pelicula` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hora` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sala` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `venta_cine`
--

INSERT INTO `venta_cine` (`id_venta`, `id_cartelera`, `num_tarjeta`, `correo`, `asiento`, `fecha`, `total`, `estado`, `pelicula`, `hora`, `sala`) VALUES
(14, 1, 123456789, 'a@gmail.com', 12, '2022-06-09', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(15, 1, 2147483647, 'lara@gmail.com', 34, '2022-06-09', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(16, 1, 2147483647, 'prueba@gmail.com', 30, '2022-06-09', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(17, 1, 2147483647, 'prueba@gmail.com', 4, '2022-06-09', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(18, 1, 2147483647, 'prueba@gmail.com', 11, '2022-06-09', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(19, 44, 123456789, 'a@gmail.com', 33, '2022-06-12', 45, 'pendiente', ' Avengers: Infinity War', '19:35:00.0000', '1'),
(20, 44, 123456789, 'a@gmail.com', 4, '2022-06-12', 45, 'pendiente', ' Avengers: Infinity War', '19:35:00.0000', '1'),
(21, 1, 123456789, 'a@gmail.com', 28, '2022-06-14', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(22, 1, 123456789, 'a@gmail.com', 13, '2022-06-14', 45, 'pendiente', 'Sonic 2 la pelicula', '02:10:00.0000', '1'),
(23, 32, 123456789, 'a@gmail.com', 35, '2022-07-24', 45, 'pendiente', 'Spider Man No Way Home', '16:00:00.0000', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_snack`
--

CREATE TABLE `venta_snack` (
  `id` int(11) NOT NULL,
  `num_tarjeta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `detalle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `venta_snack`
--

INSERT INTO `venta_snack` (`id`, `num_tarjeta`, `correo`, `total`, `detalle`, `estado`) VALUES
(3, '123456789', 'a@gmail.com', 30, 'M&M,2;Pipocas (P),2', 'entregado'),
(7, '123456789', 'a@gmail.com', 40, 'Pipocas (P),2;Coca cola 200 ml,2;nachos,1', 'pendiente'),
(24, '123456789', 'a@gmail.com', 40, 'pipocas (M),2;Coca cola 200 ml,2', 'pendiente'),
(25, '123456789', 'a@gmail.com', 30, 'Coca cola 200 ml,2;pipocas (S),2', 'pendiente'),
(29, '123456789', 'a@gmail.com', 78, 'nachos,3;pipocas (G),2', 'pendiente'),
(26, '2147483647', 'urrelo@gmail.com', 15, 'Coca cola 200 ml,1;pipocas (S),1', 'pendiente'),
(27, '2147483647', 'lara@gmail.com', 14, 'nachos,1', 'pendiente'),
(28, '2147483647', 'prueba@gmail.com', 30, 'pipocas (M),2', 'pendiente'),
(21, '123456789', 'a@gmail.com', 24, 'M&M,2;Coca cola 200 ml,2', 'pendiente'),
(19, '123456789', 'a@gmail.com', 7, 'M&M,1', 'pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  ADD PRIMARY KEY (`id_cartelera`),
  ADD KEY `id_pelicula` (`id_pelicula`) USING BTREE,
  ADD KEY `id_sala` (`id_sala`) USING BTREE;

--
-- Indices de la tabla `cartelera_asientos`
--
ALTER TABLE `cartelera_asientos`
  ADD PRIMARY KEY (`id_cartelera_asientos`),
  ADD KEY `id_cartelera` (`id_cartelera`),
  ADD KEY `id_asiento` (`id_asiento`) USING BTREE;

--
-- Indices de la tabla `factura_cine`
--
ALTER TABLE `factura_cine`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_c_asientos` (`id_c_asientos`) USING BTREE;

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indices de la tabla `sala_asiento`
--
ALTER TABLE `sala_asiento`
  ADD PRIMARY KEY (`id_sala_asiento`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indices de la tabla `snacks`
--
ALTER TABLE `snacks`
  ADD PRIMARY KEY (`id_snack`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta_cine`
--
ALTER TABLE `venta_cine`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cartelera` (`id_cartelera`);

--
-- Indices de la tabla `venta_snack`
--
ALTER TABLE `venta_snack`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  MODIFY `id_cartelera` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `cartelera_asientos`
--
ALTER TABLE `cartelera_asientos`
  MODIFY `id_cartelera_asientos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `factura_cine`
--
ALTER TABLE `factura_cine`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id_pelicula` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sala_asiento`
--
ALTER TABLE `sala_asiento`
  MODIFY `id_sala_asiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `snacks`
--
ALTER TABLE `snacks`
  MODIFY `id_snack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `venta_cine`
--
ALTER TABLE `venta_cine`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `venta_snack`
--
ALTER TABLE `venta_snack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cartelera`
--
ALTER TABLE `cartelera`
  ADD CONSTRAINT `cartelera_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartelera_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cartelera_asientos`
--
ALTER TABLE `cartelera_asientos`
  ADD CONSTRAINT `cartelera_asientos_ibfk_1` FOREIGN KEY (`id_asiento`) REFERENCES `sala_asiento` (`id_sala_asiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartelera_asientos_ibfk_2` FOREIGN KEY (`id_cartelera`) REFERENCES `cartelera` (`id_cartelera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura_cine`
--
ALTER TABLE `factura_cine`
  ADD CONSTRAINT `factura_cine_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_cine_ibfk_2` FOREIGN KEY (`id_c_asientos`) REFERENCES `cartelera_asientos` (`id_cartelera_asientos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sala_asiento`
--
ALTER TABLE `sala_asiento`
  ADD CONSTRAINT `sala_asiento_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
