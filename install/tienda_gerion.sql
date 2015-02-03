-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2014 a las 11:18:07
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `2daw1415_josue01`
--
CREATE DATABASE IF NOT EXISTS `2daw1415_josue01` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `2daw1415_josue01`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorías`
--

CREATE TABLE IF NOT EXISTS `categorías` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anuncio` tinytext,
  `Enlace` text NOT NULL,
  `Visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `categorías`
--

INSERT INTO `categorías` (`Id`, `Nombre`, `Codigo`, `Descripcion`, `Anuncio`, `Enlace`, `Visible`) VALUES
(1, 'Consolas y Videojuegos', 1, 'Consolas y Videojuegos', 'Los mejores videojuegos y las mejores plataformas las tendrás aquí en esta seccion', 'index.php/2daw1415_josue01/productos/1', 1),
(2, 'Peliculas', 2, 'Peliculas', 'Las peliculas que quieres en los formatos que necesitas', 'index.php/2daw1415_josue01/productos/2', 1),
(3, 'Informatica', 3, 'Dispositivos y componentes', 'Los mejores productos informáticos a su mejor precio', 'index.php/2daw1415_josue01/productos/3', 1),
(4, 'Moda', 4, 'Ropa actual', 'Los mejores diseñadores a precios nunca antes visto', 'index.php/2daw1415_josue01/productos/4', 1),
(5, 'Electronica', 5, 'Productos de electronica', 'Los productos de electrónicas que necesitas los tienes aqui', 'index.php/2daw1415_josue01/productos/5', 1),
(6, 'Tablets y Smarthphones', 6, 'Tablets y Smarthphones', 'Tablets y Smarthphones con las características y los precios que tu necesitas', 'index.php/2daw1415_josue01/productos/6', 1),
(7, 'Musica', 7, 'musica', 'La mejor musica en todos los formatos', 'index.php/2daw1415_josue01/productos/7', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Tlf` int(11) NOT NULL,
  `Movil` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `Pseudonimo` varchar(45) DEFAULT NULL,
  `Sexo` varchar(1) NOT NULL,
  `FecNan` date NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Provincias_idProvincias` int(11) NOT NULL,
  PRIMARY KEY (`idClientes`,`Provincias_idProvincias`),
  KEY `fk_Clientes_Provincias1_idx` (`Provincias_idProvincias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineadepedido`
--

CREATE TABLE IF NOT EXISTS `lineadepedido` (
  `IdLineaDePedido` int(11) NOT NULL,
  `Productos_idProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Pedido_id` int(11) NOT NULL,
  `Pedido_Clientes_idClientes` int(11) NOT NULL,
  `Pecio` decimal(6,3) DEFAULT NULL,
  `IVA` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdLineaDePedido`,`Productos_idProducto`),
  KEY `fk_Compra_Productos1_idx` (`Productos_idProducto`),
  KEY `fk_LineaDePedido_Pedido1_idx` (`Pedido_id`,`Pedido_Clientes_idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Clientes_idClientes` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Clientes1_idx` (`Clientes_idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Precio` decimal(6,3) NOT NULL,
  `Descuento` int(11) NOT NULL,
  `Imagen` varchar(100) NOT NULL,
  `Iva` int(11) NOT NULL,
  `Descripción` tinytext NOT NULL,
  `Anuncio` tinytext,
  `categorías_Id` int(11) NOT NULL,
  `Visible` tinyint(1) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`categorías_Id`),
  KEY `fk_Productos_categorías1_idx` (`categorías_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `Nombre`, `Precio`, `Descuento`, `Imagen`, `Iva`, `Descripción`, `Anuncio`, `categorías_Id`, `Visible`, `Stock`) VALUES
(1, 'Metal gear solid', '12.500', 0, 'http://www.guiltybit.com/wp-content/uploads/2013/09/metalgearsolid_car%C3%A1tula.jpg', 21, 'FOXHOUND, una unidad genéticamente mejorada de fuerzas especiales, arma un levantamiento armado en una isla remota ubicada en el Archipiélago Fox de Alaska. Esta isla, con nombre en código Shadow Moses, es el sitio de una instalación de almacenamiento', 'El mejor juego de acción de la historia por primera vez en 4K', 1, 1, 1000),
(2, 'Broken Sword', '10.000', 5, 'http://3.bp.blogspot.com/-73x56Z4eepc/UT_weY_Iu1I/AAAAAAAAALg/DIVvKUhauHY/s1600/brokensword+cover.jp', 21, 'La historia comienza con la presentación de George Stobbart, un turista norteamericano que ve sus vacaciones en París abruptamente interrumpidas por una explosión en un café. A partir de entonces, el protagonista, en compañía de una periodista llama', 'Una de las mejores aventuras graficas de la historia ha vuelto', 1, 1, 100),
(3, 'Broken Sword II', '5.000', 21, 'http://4.bp.blogspot.com/-cvVA-rFbDbA/T0_JXVY6ppI/AAAAAAAACaQ/C5IUmhziIus/s1600/brokencover.jpg', 21, 'La historia versaba sobre un culto a un dios maya en conjunto con una conspiración en torno a un próximo eclipse y causar la destrucción del mundo. Para evitarlo George y Nicole deberán encontrar tres piedras mágicas de origen maya para encerrar para', '¿Quien dijo que las segundas partes nunca eran buenas?', 1, 1, 20),
(4, 'Los Miserables', '7.000', 0, 'http://1.bp.blogspot.com/-z7h8EQbwpzg/UOGQ0S6SGuI/AAAAAAAACBo/Np2W10AjEcw/s1600/Los%2Bmiserables.jpg', 21, 'Jean Valjean, ex convicto que se convierte en el alcalde de una aldea en Francia. Tras ser expuesto, Valjean acepta tomar el cuidado de Cosette, la hija ilegítima de la agonizante Fantine, pero, como un fugitivo, debe a la vez evitar ser capturado por el', 'El musical mas aclamado de la historia por fin en blu-ray y dvd', 2, 1, 100),
(5, 'Blade Runner', '20.000', 10, 'http://i5.minus.com/ikCt3VC7III1g.jpg', 21, 'En la ciudad de Los Ángeles, en noviembre de 2019, Rick Deckard (Harrison Ford) es llamado de su retiro cuando un Blade Runner excesivamente confiado —Holden (Morgan Paul)— recibe un tiro mientras llevaba a cabo la prueba Voight-Kampff a Leon (Brion ', 'He visto cosas que jamas creerias', 2, 1, 20),
(7, 'Terminator', '10.000', 5, 'http://www.new-video.de/co/terminat.jpg', 21, 'En el año 2029, después de devastar la Tierra y esclavizar a la humanidad, las máquinas, gobernadas por la inteligencia artificial conocida como Skynet, están a punto de perder la guerra contra la resistencia humana liderada por John Connor. Frente a ', 'La mejor peliculas de robots de la historia', 2, 1, 20),
(8, 'Asus K55VD-SX523H Portátil', '600.000', 0, 'http://shop.by/images/asus_k53tk_sx023r_1.jpg', 21, 'Procesador: i7-2630QM \r\nMemoria RAM: 4GB\r\nDisco Duro: 500GB\r\nTarjeta Gráfica: Intel HD Graphics 4000\r\nPantalla: 15,6"', 'Un gran ordenador a un pequeño precio', 3, 1, 20),
(9, 'HP G6-2320SS I7/4/500 15,6', '400.000', 0, 'http://www.digitalshoping.com/5051-thickbox/portatil-hp-g6-2320ss-i7-4-500-15-6-w8.jpg', 21, 'Procesador intel core i7-3632qm (2\r\n2 ghz\r\n6 mb de caché l3)\r\nmemoria ram 4gb ddr3 sodimm\r\ndisco duro 500gb (5400 rpm s-ata)\r\nalmacenamiento óptico super multi dual layer (s-ata)\r\ndisplay pantalla hd brightview\r\ncon retroiluminación led de 39\r\n6 cm (15', 'Cuando lo barato no es caro', 3, 1, 2),
(10, 'Lenovo Essential B575e', '200.000', 0, 'http://www.universogeek.es/assets/productos/informatica/portatiles/1452660.jpg', 21, 'Procesador AMD E1-1500 (1.4 GHz, 1 MB)\r\nMemoria RAM 2GB DDR3 SODIMM (1x2GB) MAX 8GB\r\nDisco duro 320 GB (5400 rpm S-ATA)\r\nAlmacenamiento óptico Super Multi Dual Layer (S-ATA)\r\nDisplay 15.6" LED HD (1366 x 768) 16:9 Gloss\r\nControlador gráfico AMD Radeon 7', 'Grandes precios para grandes productos', 3, 1, 5),
(11, 'Le Breve Men''s Adault Jacket -', '40.680', 5, 'http://s3.thcdn.com/productimg/0/600/600/56/10889056-1390840887-169493.jpg', 21, 'Constructed with a lightweight design, the Le Breve Men''s Adault Jacket features long sleeves, zip front fastening and a button overlay for extra protection against cold weather conditions. All over navy, the weather resistant jacket has a large drawstrin', 'Solo England', 4, 1, 100),
(12, 'Boxfresh Men''s Hivochel Crew N', '52.220', 50, 'http://s3.thcdn.com/productimg/0/600/600/79/10789879-1386265244-984678.jpg', 21, 'The Men''s Hivochel Crew Neck Sweatshirt from Boxfresh has been crafted from pure cotton and features long sleeves, a crew neckline and is printed with a Boxfresh emblem to the chest. Ribbed edge detail to collar, cuffs and hem to finish the look. - GG.', 'Made in england', 4, 1, 20),
(13, 'Soul Star Hombre Blk Camiseta ', '8.000', 10, 'http://s1.thcdn.com/productimg/0/600/600/20/10661020-1373883263-828613.jpg', 21, 'For men who like combine comfort with a casual style, this Soul Star Men''s Blk Polo Shirt is the perfect option. With short sleeves, a three button polo neck and a regular fit, this white t-shirt features blue detail on the trim of the collar as well as r', 'Made in england', 4, 1, 10),
(14, 'Toshiba 32L2333DG', '279.000', 10, 'http://www.redcoon.es/res/shop/cataloge/product_450/B447825.jpg', 21, 'Pantalla LED de 80 cm\r\nResolución Full HD 1080p\r\n100 Hz AMR\r\nDiseño delgado y con estilo', 'Deseño y estilo unido', 5, 1, 20),
(15, 'Onkyo PR-SC5509', '999.999', 10, 'http://www.redcoon.es/res/shop/cataloge/product_315/B345659.jpg', 21, 'THX Ultra2 Plus Certified\r\nConversión ascendente de vídeo 4K\r\nVLSC para todos los canales\r\nDiseño de paneles independientes', 'El mejor sonido', 5, 1, 10),
(16, 'Fagor FFK6835X ', '500.000', 30, 'http://www.redcoon.es/res/shop/cataloge/product_315/B290591.jpg', 21, 'Función ECO\r\nCuba antibacterias\r\nCongelador y Frigo No Frost\r\nRecinto Multifresh\r\nEnvío gratis', 'Un precio que te dejara frio', 5, 1, 20),
(17, 'Samsung Galaxy Tab 3 10.1 P521', '270.000', 30, 'http://www.redcoon.es/res/shop/cataloge/product_315/B478068.jpg', 21, 'Pantalla Táctil 10,1"\r\nProcesador 1,6 GHz Dual Core\r\nRAM 1 GB, Flash 16 GB\r\nWi-Fi, Bluetooth\r\nEnvío gratis', '¿Sansumg caro?', 6, 1, 10),
(18, 'Apple iPad Air WiFi 16GB Plata', '450.000', 0, 'http://www.redcoon.es/res/shop/cataloge/product_315/B499267.jpg', 21, 'Cámaras FaceTime y iSight\r\nConexión ultrarrápida\r\nResolución: 2048 x 1536\r\nDiseño fino y ligero', '¿Quien quiere una manzana mordida?', 6, 1, 1000),
(19, 'Sony Xperia Z Negro', '355.000', 10, 'http://www.redcoon.es/res/shop/cataloge/product_450/B436720.jpg', 21, 'Pantalla TFT de 12,7 cm\r\nCámara de 13 MP\r\nGoogle Android 4.1\r\n1,5 GHz Quad Core\r\nEnvío gratis', 'Totalmente sumergible', 6, 1, 20),
(20, 'Los Miserables', '8.000', 1, 'http://sgfm.elcorteingles.es/SGFM/dctm/IMAGENES02/201301/14/00105106126583___P1_1000x1000.jpg', 21, 'Grabacion del elenco original de la nueva produccion del 25º aniversario estrenada en el teatro Lope de Vega de Madrid', 'Mas que un musical una leyenda', 7, 1, 5),
(21, 'Crises', '19.000', 5, 'http://sgfm.elcorteingles.es/SGFM/dctm/MEDIA01/201309/03/00105111148804____1__1000x1000.jpg', 21, 'Reedición remasterizada 30 aniversario del 8º disco de Mike Oldfield. Esta Edición Doble Deluxe contiene 7 bonus tracks conversiones extendidas de Moonlight Shadow, Crimes Of Passion y Shadows Of The Wall así como otras mezclas y temas no incluidos en', 'Uno de los mejores discos pop de Mike Oldfield Por fin totalmente remasterizado ', 7, 1, 5),
(22, 'In A Tidal Wave Of Mystery', '17.000', 1, 'http://sgfm.elcorteingles.es/SGFM/dctm/MEDIA01/201309/19/00105111149026____1__1000x1000.jpg', 21, '''''Capital Cities'''' es un dúo de electro-pop formado por Ryan Merchant y Sebu Simonian en Los Ángeles, CA. Lanzó su primer EP en 2011 y ahora publican su primer y esperadísimo álbum.Han sido confirmados para el festival DCode que se celebra en Madrid ', 'el grupo musical del super exito safe and sound', 7, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
  `idProvincias` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idProvincias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_Clientes_Provincias1` FOREIGN KEY (`Provincias_idProvincias`) REFERENCES `mydb`.`provincias` (`idProvincias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lineadepedido`
--
ALTER TABLE `lineadepedido`
  ADD CONSTRAINT `fk_Compra_Productos1` FOREIGN KEY (`Productos_idProducto`) REFERENCES `mydb`.`productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LineaDePedido_Pedido1` FOREIGN KEY (`Pedido_id`, `Pedido_Clientes_idClientes`) REFERENCES `mydb`.`pedido` (`idPedido`, `Clientes_idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Clientes1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `mydb`.`clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categorías_Id`) REFERENCES `categorías` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


INSERT INTO `provincias` (`idProvincias`, `Nombre`) VALUES
('01', 'Alava'),
('02', 'Albacete'),
('03', 'Alicante'),
('04', 'Almera'),
('33', 'Asturias'),
('05', 'Avila'),
('06', 'Badajoz'),
('07', 'Balears (Illes)'),
('08', 'Barcelona'),
('09', 'Burgos'),
('10', 'Cáceres'),
('11', 'Cádiz'),
('39', 'Cantabria'),
('12', 'Castellón'),
('51', 'Ceuta'),
('13', 'Ciudad Real'),
('14', 'Córdoba'),
('15', 'Coruña (A)'),
('16', 'Cuenca'),
('17', 'Girona'),
('18', 'Granada'),
('19', 'Guadalajara'),
('20', 'Guipzcoa'),
('21', 'Huelva'),
('22', 'Huesca'),
('23', 'Jaén'),
('24', 'León'),
('25', 'Lleida'),
('27', 'Lugo'),
('28', 'Madrid'),
('29', 'Málaga'),
('52', 'Melilla'),
('30', 'Murcia'),
('31', 'Navarra'),
('32', 'Ourense'),
('34', 'Palencia'),
('35', 'Palmas (Las)'),
('36', 'Pontevedra'),
('26', 'Rioja (La)'),
('37', 'Salamanca'),
('38', 'Santa Cruz de Tenerife'),
('40', 'Segovia'),
('41', 'Sevilla'),
('42', 'Soria'),
('43', 'Tarragona'),
('44', 'Teruel'),
('45', 'Toledo'),
('46', 'Valencia'),
('47', 'Valladolid'),
('48', 'Vizcaya'),
('49', 'Zamora'),
('50', 'Zaragoza');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
