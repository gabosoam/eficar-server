/*
Navicat MariaDB Data Transfer

Source Server         : local
Source Server Version : 100407
Source Host           : localhost:3306
Source Database       : taller2

Target Server Type    : MariaDB
Target Server Version : 100407
File Encoding         : 65001

Date: 2019-08-27 01:56:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for archive
-- ----------------------------
DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` bigint(20) DEFAULT NULL,
  `fromModel` varchar(255) DEFAULT NULL,
  `originalRecord` longtext DEFAULT NULL,
  `originalRecordId` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archive
-- ----------------------------

-- ----------------------------
-- Table structure for asignacion
-- ----------------------------
DROP TABLE IF EXISTS `asignacion`;
CREATE TABLE `asignacion` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` double DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `hora_inicio` varchar(255) DEFAULT NULL,
  `hora_inicio_real` varchar(255) DEFAULT NULL,
  `hora_finalizacion` varchar(255) DEFAULT NULL,
  `tarea` int(11) DEFAULT NULL,
  `operador` int(11) DEFAULT NULL,
  `eficiencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `tarea` (`tarea`),
  KEY `operador` (`operador`),
  CONSTRAINT `operador` FOREIGN KEY (`operador`) REFERENCES `persona` (`id`),
  CONSTRAINT `tarea` FOREIGN KEY (`tarea`) REFERENCES `ordenproducto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignacion
-- ----------------------------
INSERT INTO `asignacion` VALUES ('1566875531775', '1566886268182', '1', '4', '1', '2019-8-27 9:0:0', '1566886280306', '1566886285962', '1', '1', '0');
INSERT INTO `asignacion` VALUES ('1566879899878', '1566881224868', '2', '4', '1', '2019-8-27 7:0:0', '1566882140678', '1566884580645', '2', '1', '20');
INSERT INTO `asignacion` VALUES ('1566887332667', '1566887378725', '3', '4', '1', '2019-8-27 11:0:0', '1566887397458', '1566887750274', '3', '1', '17600');
INSERT INTO `asignacion` VALUES ('1566887896009', '1566888309122', '4', '4', '1', '2019-8-27 11:30:0', '1566888326436', '1566888343166', '4', '1', '13');
INSERT INTO `asignacion` VALUES ('1566888054541', '1566888068509', '5', '4', '1', '2019-8-27 11:0:2', '1566888080900', '1566888109573', '5', '1', '214');
INSERT INTO `asignacion` VALUES ('1566888450164', '1566888461525', '6', '4', '1', '2019-8-27 12:0:0', '1566888469643', '1566888491173', '6', '1', '286');
INSERT INTO `asignacion` VALUES ('1566888621637', '1566888631567', '7', '4', '1', '2019-8-27 12:30:0', '1566888638766', '1566888700935', '7', '1', '97');
INSERT INTO `asignacion` VALUES ('1566888788386', '1566888798608', '8', '4', '1', '2019-8-27 13:0:0', '1566888877346', '1566888921130', '8', '1', '140');

-- ----------------------------
-- Table structure for carrito
-- ----------------------------
DROP TABLE IF EXISTS `carrito`;
CREATE TABLE `carrito` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) DEFAULT NULL,
  `vehiculo` int(11) DEFAULT NULL,
  `tipoProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `vehiculocarrito` (`vehiculo`),
  KEY `tipoproducto` (`tipoProducto`),
  CONSTRAINT `tipoproducto` FOREIGN KEY (`tipoProducto`) REFERENCES `tipoproducto` (`id`),
  CONSTRAINT `vehiculocarrito` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrito
-- ----------------------------

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES ('1566872301083', '1566872301083', '1', '1', 'categoria');
INSERT INTO `categoria` VALUES ('1566872314350', '1566872314350', '2', '1', 'categoria 2');

-- ----------------------------
-- Table structure for cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE `cotizacion` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` varchar(255) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `vehiculo` int(11) DEFAULT NULL,
  `vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `clientecotizacion` (`cliente`),
  KEY `vehiculocotizacion` (`vehiculo`),
  CONSTRAINT `clientecotizacion` FOREIGN KEY (`cliente`) REFERENCES `persona` (`id`),
  CONSTRAINT `vehiculocotizacion` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cotizacion
-- ----------------------------

-- ----------------------------
-- Table structure for cotizacionproducto
-- ----------------------------
DROP TABLE IF EXISTS `cotizacionproducto`;
CREATE TABLE `cotizacionproducto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porsentaje_iva` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tiempo_estandar` double DEFAULT NULL,
  `porcentaje_descuento` double DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `base_cero` double DEFAULT NULL,
  `cotizacion` int(11) DEFAULT NULL,
  `variante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cotizacion` (`cotizacion`),
  KEY `variantecotizacion` (`variante`),
  CONSTRAINT `cotizacion` FOREIGN KEY (`cotizacion`) REFERENCES `cotizacion` (`id`),
  CONSTRAINT `variantecotizacion` FOREIGN KEY (`variante`) REFERENCES `tipoproducto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cotizacionproducto
-- ----------------------------

-- ----------------------------
-- Table structure for foto
-- ----------------------------
DROP TABLE IF EXISTS `foto`;
CREATE TABLE `foto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `productofoto` (`producto`),
  CONSTRAINT `productofoto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foto
-- ----------------------------

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES ('1566870215871', '1566870215871', '1', '1', 'Chevrolet');

-- ----------------------------
-- Table structure for modelo
-- ----------------------------
DROP TABLE IF EXISTS `modelo`;
CREATE TABLE `modelo` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `anio` varchar(255) DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `marca` (`marca`),
  KEY `tipoid` (`tipo`),
  CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`id`),
  CONSTRAINT `tipoid` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES ('1566870270761', '1566870270761', '1', '1', 'Modelo 1', '1990', '1', '2');

-- ----------------------------
-- Table structure for motivo
-- ----------------------------
DROP TABLE IF EXISTS `motivo`;
CREATE TABLE `motivo` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motivo
-- ----------------------------
INSERT INTO `motivo` VALUES ('1566882229100', '1566882229100', '1', '1', 'Almuerzo');
INSERT INTO `motivo` VALUES ('1566882242236', '1566882242236', '2', '1', 'Fin jornada laboral');

-- ----------------------------
-- Table structure for ordenproducto
-- ----------------------------
DROP TABLE IF EXISTS `ordenproducto`;
CREATE TABLE `ordenproducto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porsentaje_iva` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tiempo_estandar` double DEFAULT NULL,
  `porcentaje_descuento` double DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `base_cero` double DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `variante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `orden` (`orden`),
  KEY `variante` (`variante`),
  CONSTRAINT `orden` FOREIGN KEY (`orden`) REFERENCES `ordentrabajo` (`id`),
  CONSTRAINT `variante` FOREIGN KEY (`variante`) REFERENCES `tipoproducto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordenproducto
-- ----------------------------
INSERT INTO `ordenproducto` VALUES ('1566875531694', '1566875531694', '1', '12', '1', '233', '7200', '0', '', '0', '1', '2');
INSERT INTO `ordenproducto` VALUES ('1566879899730', '1566879899730', '2', '12', '1', '233', '7200', '0', '', '0', '2', '2');
INSERT INTO `ordenproducto` VALUES ('1566887332573', '1566887332573', '3', '12', '1', '1', '2', '0', '', '0', '3', '3');
INSERT INTO `ordenproducto` VALUES ('1566887895899', '1566887895899', '4', '12', '1', '1', '2', '0', '', '0', '4', '3');
INSERT INTO `ordenproducto` VALUES ('1566888054428', '1566888054428', '5', '12', '1', '1', '60', '0', '', '0', '5', '3');
INSERT INTO `ordenproducto` VALUES ('1566888450085', '1566888450085', '6', '12', '1', '1', '60', '0', '', '0', '6', '3');
INSERT INTO `ordenproducto` VALUES ('1566888621556', '1566888621556', '7', '12', '1', '1', '60', '0', '', '0', '7', '3');
INSERT INTO `ordenproducto` VALUES ('1566888788274', '1566888788274', '8', '12', '1', '1', '60', '0', '', '0', '8', '3');

-- ----------------------------
-- Table structure for ordentrabajo
-- ----------------------------
DROP TABLE IF EXISTS `ordentrabajo`;
CREATE TABLE `ordentrabajo` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` varchar(255) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `vehiculo` int(11) DEFAULT NULL,
  `vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cliente` (`cliente`),
  KEY `vehiculo` (`vehiculo`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `persona` (`id`),
  CONSTRAINT `vehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordentrabajo
-- ----------------------------
INSERT INTO `ordentrabajo` VALUES ('1566875531643', '1566875531643', '1', '2019-08-26 22:12:11.643', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566879899529', '1566879899529', '2', '2019-08-26 23:24:59.550', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566887332491', '1566887332491', '3', '2019-08-27 01:28:52.491', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566887895813', '1566887895813', '4', '2019-08-27 01:38:15.816', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566888054364', '1566888054364', '5', '2019-08-27 01:40:54.365', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566888449989', '1566888449989', '6', '2019-08-27 01:47:29.991', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566888621500', '1566888621500', '7', '2019-08-27 01:50:21.500', '4', '1', null);
INSERT INTO `ordentrabajo` VALUES ('1566888788216', '1566888788216', '8', '2019-08-27 01:53:08.216', '4', '1', null);

-- ----------------------------
-- Table structure for pausa
-- ----------------------------
DROP TABLE IF EXISTS `pausa`;
CREATE TABLE `pausa` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` varchar(255) DEFAULT NULL,
  `hora_finalizacion` varchar(255) DEFAULT NULL,
  `asignacion` int(11) DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `asignacion` (`asignacion`),
  KEY `motivo` (`motivo`),
  CONSTRAINT `asignacion` FOREIGN KEY (`asignacion`) REFERENCES `asignacion` (`id`),
  CONSTRAINT `motivo` FOREIGN KEY (`motivo`) REFERENCES `motivo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pausa
-- ----------------------------
INSERT INTO `pausa` VALUES (null, null, '1', '1566883197262', '1566883208186', '2', '2');
INSERT INTO `pausa` VALUES (null, null, '2', '1566883216085', '1566883222885', '2', '2');
INSERT INTO `pausa` VALUES (null, null, '3', '1566883232284', '1566883307678', '2', '1');
INSERT INTO `pausa` VALUES (null, null, '4', '1566883315052', '1566883586912', '2', '2');
INSERT INTO `pausa` VALUES (null, null, '5', '1566883590936', '1566884021975', '2', '1');
INSERT INTO `pausa` VALUES (null, null, '6', '1566884026686', '1566884032516', '2', '2');
INSERT INTO `pausa` VALUES (null, null, '7', '1566884037953', '1566884145926', '2', '1');
INSERT INTO `pausa` VALUES (null, null, '8', '1566884290852', '1566884336475', '2', '2');
INSERT INTO `pausa` VALUES (null, null, '9', '1566884355196', '1566884360544', '2', '2');
INSERT INTO `pausa` VALUES ('1566884421388', '1566884421388', '10', '1566884380068', '1566884421387', '2', null);

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `es_cliente` tinyint(1) DEFAULT NULL,
  `es_empleado` tinyint(1) DEFAULT NULL,
  `es_administrador` tinyint(1) DEFAULT NULL,
  `es_asesor` tinyint(1) DEFAULT NULL,
  `es_jefe` tinyint(1) DEFAULT NULL,
  `es_operador` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1566869835303', '1566876639848', '1', '1', '1723713556', 'Gabriel Salazar', 'Ciudadela Quito Sur', '2621561', 'gasalazaror@gmail.com', '0', '1', '1', '0', '0', '1');
INSERT INTO `persona` VALUES ('1566870174398', '1566870186514', '3', '1', '1707385975', 'Erika Ortiz', 'Ciudadela Ibarra', '2621561', 'ericckaa95@gmail.com', '0', '1', '1', '0', '0', '0');
INSERT INTO `persona` VALUES ('1566870373769', '1566870373769', '4', '1', '1726439415', 'Mario Cardenas', 'La Cardenal', '272161', 'mcardenas@gmail.com', '1', '0', '0', '0', '0', '0');
INSERT INTO `persona` VALUES ('1566876371585', '1566876377438', '7', '1', '213', 'gabo', '23123', '23123', '21312@gmail.com', '0', '1', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `iva` varchar(255) DEFAULT NULL,
  `pvp_manual` tinyint(1) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1566875513951', '1566875513951', '1', '1', '123123', 'Servicio 1', '', '12', '1', '1');
INSERT INTO `producto` VALUES ('1566887299484', '1566888585993', '2', '1', '13213', 'Sercivio2', '', '12', '1', '1');

-- ----------------------------
-- Table structure for tipo
-- ----------------------------
DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo
-- ----------------------------
INSERT INTO `tipo` VALUES ('1566870225719', '1566870225719', '1', '1', 'Motocicleta');
INSERT INTO `tipo` VALUES ('1566870247854', '1566870247854', '2', '1', 'Vehículo 4x4');

-- ----------------------------
-- Table structure for tipoproducto
-- ----------------------------
DROP TABLE IF EXISTS `tipoproducto`;
CREATE TABLE `tipoproducto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvp` double DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tiempoEstandar` double DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tipo` (`tipo`),
  KEY `producto` (`producto`),
  CONSTRAINT `producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`),
  CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipoproducto
-- ----------------------------
INSERT INTO `tipoproducto` VALUES ('1566875514087', '1566875514087', '1', '23', '1', '3600', '1', '1');
INSERT INTO `tipoproducto` VALUES ('1566875514095', '1566875514095', '2', '233', '1', '7200', '2', '1');
INSERT INTO `tipoproducto` VALUES ('1566887299612', '1566888586112', '3', '1', '1', '60', '2', '2');
INSERT INTO `tipoproducto` VALUES ('1566887299619', '1566888586115', '4', '1', '1', '60', '1', '2');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fcm` varchar(255) DEFAULT NULL,
  `persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `persona` (`persona`),
  CONSTRAINT `persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1566870066794', '1566887750600', '1', '1', 'gasalazaror@gmail.com', '$2b$10$DwyYW573wYgHF8ah8C93s.PuhcoHZGB..zZ.fXOueDA6kqrizkTgC', '', '1');
INSERT INTO `usuario` VALUES ('1566870183175', '1566870183175', '2', '1', 'ericckaa95@gmail.com', '$2b$10$juD9UJFuxBnO7P/HcAmc0et0fLJRi5vSgblLz9N7V8zOqyeqQpiHa', '', '3');
INSERT INTO `usuario` VALUES ('1566876658902', '1566882029813', '3', '1', 'mcardenas@gmail.com', '$2b$10$gSKm2HhI0Xa5.lQzaB2Wce7Upvop4ZVOjQrzYbhdrRxSSU2b0rnEC', 'fnDPsBNP_FA:APA91bFaayjPuKdDSqrxtv-2_9yw64zeTthvQH1h-HaIdT8YC45_1tsZycuOBZ2nVo4u8nD98D7cxgUNBw8t_sMQ6FBpEIFhWtDb4mzQCyJgK7PR74aHnTCkEmA40W9yBF2u-cscvi_r', '4');

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE `vehiculo` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `numero_motor` varchar(255) DEFAULT NULL,
  `numero_chasis` varchar(255) DEFAULT NULL,
  `anio_fabricacion` varchar(255) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `propietario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `placa` (`placa`),
  KEY `modelo` (`modelo`),
  KEY `propietario` (`propietario`),
  CONSTRAINT `modelo` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id`),
  CONSTRAINT `propietario` FOREIGN KEY (`propietario`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES ('1566870412453', '1566870412453', '1', '1', 'abc123', '123123', '123123123', '1998', '1', '4');

-- ----------------------------
-- View structure for rgterger
-- ----------------------------
DROP VIEW IF EXISTS `rgterger`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `rgterger` AS select `asignacion`.`estado` AS `estado`,`asignacion`.`aprobado` AS `aprobado` from `asignacion` ; ;

-- ----------------------------
-- View structure for vista_asignaciones
-- ----------------------------
DROP VIEW IF EXISTS `vista_asignaciones`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vista_asignaciones` AS SELECT
	`ordentrabajo`.`cliente` AS `cliente`,
	`asignacion`.`id` AS `id`,
	`persona`.`nombre` AS `nombre`,
	`persona`.`id` AS `id_persona`,
	`ordenproducto`.`tiempo_estandar` AS `tiempo_estandar`,
	`ordenproducto`.`orden` AS `orden`,
vehiculo.placa,
(SELECT nombre FROM modelo WHERE id = vehiculo.modelo LIMIT 1) as modelo,
(SELECT nombre FROM marca WHERE  id = (SELECT marca FROM modelo WHERE id = vehiculo.modelo LIMIT 1)) as marca,
(SELECT nombre FROM tipo WHERE  id = (SELECT tipo FROM modelo WHERE id = vehiculo.modelo LIMIT 1)) as tipo,
	`ordenproducto`.`id` AS `id_ordenproducto`,
	`asignacion`.`aprobado` AS `aprobado`,
	`asignacion`.`estado` AS `estado`,
	asignacion.eficiencia AS `eficiencia`,
	`producto`.`nombre` AS `producto`,
	`tipo`.`nombre` AS `variante`,
	`asignacion`.`hora_inicio` AS `hora_inicio`,
	unix_timestamp(`asignacion`.`hora_inicio`) AS `inicio_unix`,
	`asignacion`.`hora_inicio_real` AS `hora_inicio_real`,
	`asignacion`.`hora_finalizacion` AS `hora_finalizacion`,
	`asignacion`.`hora_inicio` AS `hora_inicio_un`,
	(
		`asignacion`.`hora_inicio` + INTERVAL `ordenproducto`.`tiempo_estandar` SECOND
	) AS `hora_fin`,
	timestampdiff(
		SECOND,
		`asignacion`.`hora_inicio_real`,
		`asignacion`.`hora_finalizacion`
	) AS `tiempo_real`,
	(
		SELECT
			`pausa`.`id`
		FROM
			`pausa`
		WHERE
			(
				(
					`pausa`.`asignacion` = `asignacion`.`id`
				)
				AND isnull(
					`pausa`.`hora_finalizacion`
				)
			)
		LIMIT 1
	) AS `id_pausa`,

(SELECT descripcion FROM motivo WHERE id = (SELECT motivo FROM pausa WHERE asignacion = asignacion.id AND ISNULL(hora_finalizacion) LIMIT 1)) as motivo_pausa
FROM
	(
		(
			(
				(
					(
						(
							`asignacion`
							LEFT JOIN `persona` ON (
								(
									`persona`.`id` = `asignacion`.`operador`
								)
							)
						)
						JOIN `ordenproducto` ON (
							(
								`ordenproducto`.`id` = `asignacion`.`tarea`
							)
						)
					)
					JOIN `tipoproducto` ON (
						(
							`tipoproducto`.`id` = `ordenproducto`.`variante`
						)
					)
				)
				JOIN `tipo` ON (
					(
						`tipo`.`id` = `tipoproducto`.`tipo`
					)
				)
			)
			JOIN `producto` ON (
				(
					`producto`.`id` = `tipoproducto`.`producto`
				)
			)
		)
		JOIN `ordentrabajo` ON (
			(
				`ordentrabajo`.`id` = `ordenproducto`.`orden`
			)
		)
JOIN vehiculo ON vehiculo.id = ordentrabajo.vehiculo
	) ;

-- ----------------------------
-- View structure for vista_carrito
-- ----------------------------
DROP VIEW IF EXISTS `vista_carrito`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_carrito` AS select `carrito`.`id` AS `id`,`persona`.`id` AS `idPersona`,`tipoproducto`.`tiempoEstandar` AS `tiempoEstandar`,`tipoproducto`.`tiempoEstandar` AS `tiempo_estandar`,`tipoproducto`.`pvp` AS `pvp`,`tipoproducto`.`pvp` AS `precio`,`producto`.`iva` AS `porsentaje_iva`,`tipo`.`id` AS `variante`,`producto`.`nombre` AS `producto`,`vehiculo`.`placa` AS `placa` from (((((`carrito` join `persona` on((`persona`.`id` = `carrito`.`persona`))) join `tipoproducto` on((`tipoproducto`.`id` = `carrito`.`tipoProducto`))) join `tipo` on((`tipoproducto`.`tipo` = `tipo`.`id`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) left join `vehiculo` on((`vehiculo`.`id` = `carrito`.`vehiculo`))) ; ;

-- ----------------------------
-- View structure for vista_cotizaciones
-- ----------------------------
DROP VIEW IF EXISTS `vista_cotizaciones`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_cotizaciones` AS select `cotizacionproducto`.`id` AS `id`,`cotizacion`.`id` AS `cotizacion`,`cotizacionproducto`.`cantidad` AS `cantidad`,`producto`.`id` AS `id_producto`,`producto`.`nombre` AS `producto`,`tipoproducto`.`id` AS `id_variante`,`tipo`.`nombre` AS `variante`,`cotizacionproducto`.`porsentaje_iva` AS `porsentaje_iva`,`cotizacionproducto`.`porcentaje_descuento` AS `porcentaje_descuento`,`cotizacionproducto`.`precio` AS `precio` from ((((`cotizacionproducto` join `tipoproducto` on((`cotizacionproducto`.`variante` = `tipoproducto`.`id`))) join `cotizacion` on((`cotizacion`.`id` = `cotizacionproducto`.`cotizacion`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) join `tipo` on((`tipo`.`id` = `tipoproducto`.`tipo`))) ; ;

-- ----------------------------
-- View structure for vista_diferencia
-- ----------------------------
DROP VIEW IF EXISTS `vista_diferencia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_diferencia` AS select `asignacion`.`id` AS `id`,time_to_sec(timediff(cast(convert_tz(from_unixtime((`asignacion`.`hora_finalizacion` / 1000)),'UTC','MST') as datetime),cast(convert_tz(from_unixtime((`asignacion`.`hora_inicio_real` / 1000)),'UTC','MST') as datetime))) AS `diferencia` from `asignacion` ; ;

-- ----------------------------
-- View structure for vista_ordenes
-- ----------------------------
DROP VIEW IF EXISTS `vista_ordenes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_ordenes` AS select `ordenproducto`.`id` AS `id`,`ordentrabajo`.`id` AS `orden`,`ordenproducto`.`cantidad` AS `cantidad`,`producto`.`id` AS `id_producto`,`producto`.`nombre` AS `producto`,`tipoproducto`.`id` AS `id_variante`,`tipo`.`nombre` AS `variante`,`ordenproducto`.`porsentaje_iva` AS `porsentaje_iva`,`ordenproducto`.`porcentaje_descuento` AS `porcentaje_descuento`,`ordenproducto`.`tiempo_estandar` AS `tiempo_estandar`,`ordenproducto`.`precio` AS `precio`,(select `vista_asignaciones`.`hora_inicio` from `vista_asignaciones` where (`vista_asignaciones`.`id_ordenproducto` = `ordenproducto`.`id`)) AS `hora_inicio` from ((((`ordenproducto` join `tipoproducto` on((`ordenproducto`.`variante` = `tipoproducto`.`id`))) join `ordentrabajo` on((`ordentrabajo`.`id` = `ordenproducto`.`orden`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) join `tipo` on((`tipo`.`id` = `tipoproducto`.`tipo`))) ; ;

-- ----------------------------
-- View structure for vista_pausas
-- ----------------------------
DROP VIEW IF EXISTS `vista_pausas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_pausas` AS select `pausa`.`id` AS `id`,`pausa`.`asignacion` AS `asignacion`,time_to_sec(timediff(cast(convert_tz(from_unixtime((`pausa`.`hora_finalizacion` / 1000)),'UTC','MST') as datetime),cast(convert_tz(from_unixtime((`pausa`.`hora_inicio` / 1000)),'UTC','MST') as datetime))) AS `diferencia` from `pausa` ; ;
