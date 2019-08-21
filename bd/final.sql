/*
Navicat MariaDB Data Transfer

Source Server         : local
Source Server Version : 100406
Source Host           : localhost:3306
Source Database       : taller2

Target Server Type    : MariaDB
Target Server Version : 100406
File Encoding         : 65001

Date: 2019-07-24 16:40:03
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `tarea` (`tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignacion
-- ----------------------------
INSERT INTO `asignacion` VALUES ('1563461846384', '1563461873922', '1', '1', '0', '2019-7-18 10:0:0', '1563488421360', '1563488445170', '43', '2');
INSERT INTO `asignacion` VALUES ('1563554759370', '1563977997774', '2', '4', '1', '2019-7-20 8:0:0', '1564004279808', '1564004329214', '44', '2');
INSERT INTO `asignacion` VALUES ('1563566773850', '1564002741612', '5', '4', '1', '2019-7-20 9:0:0', '1564004312365', '1564004332298', '45', '2');
INSERT INTO `asignacion` VALUES ('1563977100684', '1564003182481', '6', '4', '1', '2019-7-24 8:30:0', '1564004321671', '1564004335089', '46', '2');

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrito
-- ----------------------------
INSERT INTO `carrito` VALUES ('1554173867044', '1563549700805', '1', '5', null, null);
INSERT INTO `carrito` VALUES ('1554173876685', '1563549703310', '2', '5', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES ('1550070563607', '1550070563607', '1', '1', 'lavados');

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
  `vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
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
  `porcentaje_descuento` double DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `base_cero` double DEFAULT NULL,
  `cotizacion` int(11) DEFAULT NULL,
  `variante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
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
  UNIQUE KEY `id` (`id`)
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
INSERT INTO `marca` VALUES ('1551110914650', '1551110914650', '1', '1', 'chevrolet');

-- ----------------------------
-- Table structure for marcaproducto
-- ----------------------------
DROP TABLE IF EXISTS `marcaproducto`;
CREATE TABLE `marcaproducto` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marcaproducto
-- ----------------------------
INSERT INTO `marcaproducto` VALUES ('1548602096063', '1548602096063', '1', '1', 'chevrolet');
INSERT INTO `marcaproducto` VALUES ('1548602103492', '1548602103492', '2', '1', 'mazda');
INSERT INTO `marcaproducto` VALUES ('1548602115892', '1548602115892', '3', '1', 'kia');
INSERT INTO `marcaproducto` VALUES ('1548602130762', '1548602130762', '4', '1', 'audi');

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES ('1563549843750', '1563549843750', '3', '1', 'Susuki fors 3000', '2010', '1', '3');
INSERT INTO `modelo` VALUES ('1563549875415', '1563549875415', '4', '1', 'Gan vitara', '1992', '1', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motivo
-- ----------------------------
INSERT INTO `motivo` VALUES ('1551144220021', '1551144220021', '1', '1', 'falta de repuestos');
INSERT INTO `motivo` VALUES ('1551144269150', '1551144296794', '2', '1', 'otro trabajo 2');
INSERT INTO `motivo` VALUES ('1554171015418', '1554171015418', '3', '1', 'Almuerzo');

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordenproducto
-- ----------------------------
INSERT INTO `ordenproducto` VALUES ('1563553987602', '1563568778361', '44', '12', '1', '15', '3600', '0', '', '0', '3', '11');
INSERT INTO `ordenproducto` VALUES ('1563566718805', '1563568778363', '45', '12', '1', '15', '3600', '0', '', '0', '3', '11');
INSERT INTO `ordenproducto` VALUES ('1563977100655', '1563977100655', '46', '12', '1', '20', '7200', '0', '', '0', '4', '12');

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordentrabajo
-- ----------------------------
INSERT INTO `ordentrabajo` VALUES ('1563553986504', '1563568776871', '3', '2019-07-19 11:33:06.504', '5', '7', null);
INSERT INTO `ordentrabajo` VALUES ('1563977099638', '1563977099638', '4', '2019-07-24 09:04:59.638', '4', '6', null);

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pausa
-- ----------------------------
INSERT INTO `pausa` VALUES (null, null, '1', '1564000344365', '1564000348595', '6', '3');
INSERT INTO `pausa` VALUES (null, null, '2', '1564000397994', '1564000402152', '6', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1549763582107', '1551110251207', '2', '1', '1723713556', 'Gabriel Salazar', 'quito sur', '2456123', 'gabrielsalazar@outlook.com', '0', '1', '1', '1', '1', '1');
INSERT INTO `persona` VALUES ('1550070826768', '1561300562006', '4', '1', '1231321321321', 'Andres Ortiz', '', '', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `persona` VALUES ('1550671413130', '1561300573176', '5', '1', '23123123123', 'Mario Salazar', '170615, Quito Sur', '123123123', 'gasalazaror5@gmail.com', '1', '0', '1', '1', '1', '1');
INSERT INTO `persona` VALUES ('1563977624126', '1563977624126', '6', '1', '17012345123', 'Erika Ortiz', 'La Ofelia', '2456123', 'ericcaa@gmail.com', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for persona_productos__tipoproducto_personas
-- ----------------------------
DROP TABLE IF EXISTS `persona_productos__tipoproducto_personas`;
CREATE TABLE `persona_productos__tipoproducto_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_productos` int(11) DEFAULT NULL,
  `tipoproducto_personas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of persona_productos__tipoproducto_personas
-- ----------------------------
INSERT INTO `persona_productos__tipoproducto_personas` VALUES ('11', '5', '3');
INSERT INTO `persona_productos__tipoproducto_personas` VALUES ('12', '5', '5');
INSERT INTO `persona_productos__tipoproducto_personas` VALUES ('13', '5', '5');

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
  `ice` varchar(255) DEFAULT NULL,
  `pvp_manual` tinyint(1) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1563549968751', '1563549968751', '9', '1', '2123', 'Cambio de aceite', '', '12', 'NAP', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo
-- ----------------------------
INSERT INTO `tipo` VALUES ('1563549767309', '1563549767309', '3', '1', 'Motocicleta');
INSERT INTO `tipo` VALUES ('1563549780535', '1563549780535', '4', '1', 'Vehiculo 4x4');

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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipoproducto
-- ----------------------------
INSERT INTO `tipoproducto` VALUES ('1563549969672', '1563549969672', '11', '15', '1', '3600', '3', '9');
INSERT INTO `tipoproducto` VALUES ('1563549969675', '1563549969675', '12', '20', '1', '7200', '4', '9');

-- ----------------------------
-- Table structure for unidad
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of unidad
-- ----------------------------
INSERT INTO `unidad` VALUES ('1548708760107', '1548708760107', '1', '1', 'unidad');

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
  UNIQUE KEY `persona` (`persona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1548955679112', '1564003938216', '1', '1', 'gasalazaror@gmail.com', '$2b$10$xH.wcokpiXA959OCNBgXf.vG08JcpQXAQGFtGfFK1b01QhgdLW18O', 'cmlqaheqarU:APA91bH0vbDzFDeOxGHi6wZyJjMbIoQ0IV7bLhJ4BE3irv9OoWS8k23eBFM4PxtHZ274aYDPVF21QfAtfoFDcJwalMPAv5A758_VUfPxA1T8_NsBTnTZyURlr8e3N37duSVcP4aNZsiP', '2');
INSERT INTO `usuario` VALUES ('1552104522001', '1564004223745', '2', '1', 'gasalazaror5@gmail.com', '$2b$10$xH.wcokpiXA959OCNBgXf.vG08JcpQXAQGFtGfFK1b01QhgdLW18O', 'cjXg-hSfLLI:APA91bFOTbOGCsiin6cSeduMZR_M3jkikzNPB9iDNguRMqYnodnwj7htsgniVvHegxYX_1Bv3To8SzU7Pnq70b8pDQ_BbZsHX6C1hNVyTU1y35W50DHtRb09LSchX0VzcM_bVNLGgfMo', '5');
INSERT INTO `usuario` VALUES ('1563977639808', '1563977639808', '3', '1', 'ericcaa@gmail.com', '$2b$10$TDHTh5bmVzpftRZEDc/PdezUX23TTN5QuPpL2M/Jzo5XYZcGtbKtS', '', '6');

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
  UNIQUE KEY `placa` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES ('1563550016152', '1563550016152', '6', '1', 'ABC123', '321321321', '321321', '1992', '4', '4');
INSERT INTO `vehiculo` VALUES ('1563550044948', '1563550044948', '7', '1', 'BCD231', '3231', '1321', '1990', '3', '4');

-- ----------------------------
-- View structure for rgterger
-- ----------------------------
DROP VIEW IF EXISTS `rgterger`;
CREATE VIEW `rgterger` AS select `asignacion`.`estado` AS `estado`,`asignacion`.`aprobado` AS `aprobado` from `asignacion` ;

DROP VIEW IF EXISTS `vista_pausas`;
CREATE   VIEW `vista_pausas` AS select `pausa`.`id` AS `id`,`pausa`.`asignacion` AS `asignacion`,time_to_sec(timediff(cast(convert_tz(from_unixtime((`pausa`.`hora_finalizacion` / 1000)),'UTC','MST') as datetime),cast(convert_tz(from_unixtime((`pausa`.`hora_inicio` / 1000)),'UTC','MST') as datetime))) AS `diferencia` from `pausa` ;

DROP VIEW IF EXISTS `vista_diferencia`;
CREATE   VIEW `vista_diferencia` AS select `asignacion`.`id` AS `id`,time_to_sec(timediff(cast(convert_tz(from_unixtime((`asignacion`.`hora_finalizacion` / 1000)),'UTC','MST') as datetime),cast(convert_tz(from_unixtime((`asignacion`.`hora_inicio_real` / 1000)),'UTC','MST') as datetime))) AS `diferencia` from `asignacion` ;


-- ----------------------------
-- View structure for vista_asignaciones
-- ----------------------------
DROP VIEW IF EXISTS `vista_asignaciones`;
CREATE   VIEW `vista_asignaciones` AS SELECT
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
	format(
		(
			(
				`ordenproducto`.`tiempo_estandar` / (
					(
						SELECT
							`vista_diferencia`.`diferencia`
						FROM
							`vista_diferencia`
						WHERE
							(
								`vista_diferencia`.`id` = `asignacion`.`id`
							)
						LIMIT 1
					) - (
						SELECT
							sum(
								`vista_pausas`.`diferencia`
							)
						FROM
							`vista_pausas`
						WHERE
							(
								`vista_pausas`.`asignacion` = `asignacion`.`id`
							)
					)
				)
			) * 100
		),
		2
	) AS `eficiencia`,
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
	(
		SELECT
			`motivo`.`descripcion`
		FROM
			`motivo`
		WHERE
			(
				`motivo`.`id` = (
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
				)
			)
		LIMIT 1
	) AS `motivo_pausa`
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
CREATE  VIEW `vista_carrito` AS select `carrito`.`id` AS `id`,`persona`.`id` AS `idPersona`,`tipoproducto`.`tiempoEstandar` AS `tiempoEstandar`,`tipoproducto`.`tiempoEstandar` AS `tiempo_estandar`,`tipoproducto`.`pvp` AS `pvp`,`tipoproducto`.`pvp` AS `precio`,`producto`.`iva` AS `porsentaje_iva`,`tipo`.`id` AS `variante`,`producto`.`nombre` AS `producto`,`vehiculo`.`placa` AS `placa` from (((((`carrito` join `persona` on((`persona`.`id` = `carrito`.`persona`))) join `tipoproducto` on((`tipoproducto`.`id` = `carrito`.`tipoProducto`))) join `tipo` on((`tipoproducto`.`tipo` = `tipo`.`id`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) left join `vehiculo` on((`vehiculo`.`id` = `carrito`.`vehiculo`))) ;

-- ----------------------------
-- View structure for vista_cotizaciones
-- ----------------------------
DROP VIEW IF EXISTS `vista_cotizaciones`;
CREATE VIEW `vista_cotizaciones` AS select `cotizacionproducto`.`id` AS `id`,`cotizacion`.`id` AS `cotizacion`,`cotizacionproducto`.`cantidad` AS `cantidad`,`producto`.`id` AS `id_producto`,`producto`.`nombre` AS `producto`,`tipoproducto`.`id` AS `id_variante`,`tipo`.`nombre` AS `variante`,`cotizacionproducto`.`porsentaje_iva` AS `porsentaje_iva`,`cotizacionproducto`.`porcentaje_descuento` AS `porcentaje_descuento`,`cotizacionproducto`.`precio` AS `precio` from ((((`cotizacionproducto` join `tipoproducto` on((`cotizacionproducto`.`variante` = `tipoproducto`.`id`))) join `cotizacion` on((`cotizacion`.`id` = `cotizacionproducto`.`cotizacion`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) join `tipo` on((`tipo`.`id` = `tipoproducto`.`tipo`))) ;

-- ----------------------------
-- View structure for vista_diferencia
-- ----------------------------

-- ----------------------------
-- View structure for vista_ordenes
-- ----------------------------
DROP VIEW IF EXISTS `vista_ordenes`;
CREATE   VIEW `vista_ordenes` AS select `ordenproducto`.`id` AS `id`,`ordentrabajo`.`id` AS `orden`,`ordenproducto`.`cantidad` AS `cantidad`,`producto`.`id` AS `id_producto`,`producto`.`nombre` AS `producto`,`tipoproducto`.`id` AS `id_variante`,`tipo`.`nombre` AS `variante`,`ordenproducto`.`porsentaje_iva` AS `porsentaje_iva`,`ordenproducto`.`porcentaje_descuento` AS `porcentaje_descuento`,`ordenproducto`.`tiempo_estandar` AS `tiempo_estandar`,`ordenproducto`.`precio` AS `precio`,(select `vista_asignaciones`.`hora_inicio` from `vista_asignaciones` where (`vista_asignaciones`.`id_ordenproducto` = `ordenproducto`.`id`)) AS `hora_inicio` from ((((`ordenproducto` join `tipoproducto` on((`ordenproducto`.`variante` = `tipoproducto`.`id`))) join `ordentrabajo` on((`ordentrabajo`.`id` = `ordenproducto`.`orden`))) join `producto` on((`producto`.`id` = `tipoproducto`.`producto`))) join `tipo` on((`tipo`.`id` = `tipoproducto`.`tipo`))) ;

-- ----------------------------
-- View structure for vista_pausas
-- ----------------------------
