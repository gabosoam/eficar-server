/*
Navicat MariaDB Data Transfer

Source Server         : local
Source Server Version : 100407
Source Host           : localhost:3306
Source Database       : taller2

Target Server Type    : MariaDB
Target Server Version : 100407
File Encoding         : 65001

Date: 2019-08-26 21:12:22
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
  UNIQUE KEY `tarea` (`tarea`),
  KEY `operador` (`operador`),
  CONSTRAINT `operador` FOREIGN KEY (`operador`) REFERENCES `persona` (`id`),
  CONSTRAINT `tarea` FOREIGN KEY (`tarea`) REFERENCES `ordenproducto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignacion
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoria
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motivo
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordenproducto
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordentrabajo
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pausa
-- ----------------------------

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
INSERT INTO `persona` VALUES ('1566869835303', '1566869835303', '1', '1', '1723713556', 'Gabriel Salazar', 'Ciudadela Quito Sur', '2621561', 'gasalazaror@gmail.com', '0', '1', '1', '0', '0', '0');
INSERT INTO `persona` VALUES ('1566870174398', '1566870186514', '3', '1', '1707385975', 'Erika Ortiz', 'Ciudadela Ibarra', '2621561', 'ericckaa95@gmail.com', '0', '1', '1', '0', '0', '0');
INSERT INTO `persona` VALUES ('1566870373769', '1566870373769', '4', '1', '1726439415', 'Mario Cardenas', 'La Cardenal', '272161', 'mcardenas@gmail.com', '1', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipoproducto
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1566870066794', '1566870066794', '1', '1', 'gasalazaror@gmail.com', '$2b$10$DwyYW573wYgHF8ah8C93s.PuhcoHZGB..zZ.fXOueDA6kqrizkTgC', '', '1');
INSERT INTO `usuario` VALUES ('1566870183175', '1566870183175', '2', '1', 'ericckaa95@gmail.com', '$2b$10$juD9UJFuxBnO7P/HcAmc0et0fLJRi5vSgblLz9N7V8zOqyeqQpiHa', '', '3');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vista_asignaciones` AS SELECT
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
	) ; ;

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
