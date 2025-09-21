-- ENTREGA CODER HOUSE 2025- GERMAN VINISKY--
-- OBJETIVO: CREAR UNA BASE DE DATOS RELACIONAL PARA UNA MARCA DE ROPA--
-- CREACIÓN DE LA BASE DE DATOS gv_indumentaria--

DROP DATABASE IF EXISTS gv_indumentaria;
CREATE DATABASE IF NOT EXISTS gv_indumentaria;
USE gv_indumentaria;


-- PROCESO DE CREACIÓN DE LAS TABLAS DEL MODELO--

-- Eliminación de tablas  por si ya fueron creadas. 

DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS  venta;
DROP TABLE IF EXISTS  costo_producto;
DROP TABLE IF EXISTS precio_producto;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS tipo_prenda;
DROP TABLE IF EXISTS temporada; 
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS talle;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS log_cliente; 


-- Creación de tablas para base de datos gv_indumentaria.

CREATE TABLE IF NOT EXISTS tipo_prenda(
id_tipo_prenda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion_tipo_prenda VARCHAR (50));

CREATE TABLE IF NOT EXISTS temporada(
id_temporada  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion_temporada VARCHAR (20));

CREATE TABLE IF NOT EXISTS color(
id_color INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion_color VARCHAR (20));

CREATE TABLE IF NOT EXISTS talle(
id_talle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion_talle VARCHAR (20));

CREATE TABLE IF NOT EXISTS producto (
  id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre_producto VARCHAR(30),
  id_tipo_prenda INT NOT NULL,
  id_temporada INT NOT NULL,
  FOREIGN KEY (id_tipo_prenda) REFERENCES tipo_prenda(id_tipo_prenda),
  FOREIGN KEY (id_temporada) REFERENCES temporada(id_temporada)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    fecha_nacimiento DATE
);

CREATE TABLE precio_producto (
    id_precio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    moneda VARCHAR(10) DEFAULT 'ARS',
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE costo_producto (
    id_costo INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    moneda VARCHAR(10) DEFAULT 'ARS',
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    id_talle INT NOT NULL,
	id_color INT NOT NULL,
	FOREIGN KEY (id_talle) REFERENCES talle(id_talle),
	FOREIGN KEY (id_color) REFERENCES color(id_color),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE stock (
id_stock INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL, 
stock INT NOT NULL,
id_talle INT NOT NULL,
id_color INT NOT NULL,
FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
FOREIGN KEY (id_talle) REFERENCES talle(id_talle),
FOREIGN KEY (id_color) REFERENCES color(id_color)) ;

-- Incorporación de datos a las tablas.

INSERT INTO tipo_prenda (descripcion_tipo_prenda) VALUES
('Superiores'),
('Inferiores'),
('Abrigos'),
('Accesorios');

SELECT * FROM tipo_prenda;

INSERT INTO temporada (descripcion_temporada) VALUES
('Primavera/Verano'),
('Otoño/Invierno');

SELECT * FROM temporada;

INSERT INTO color (descripcion_color) VALUES
('Negro'),
('Blanco'),
('Rojo'),
('Azul'),
('Verde');

SELECT * FROM color;

INSERT INTO talle (descripcion_talle) VALUES
('XS'),
('S'),
('M'),
('L'),
('XL');

SELECT * FROM talle;

INSERT INTO producto (nombre_producto, id_tipo_prenda, id_temporada ) VALUES
('Remera básica liviana', 1, 1),
('Remera básica manga larga', 1, 2),
('Pantalón lino', 2, 1),
('Pantalón corderoi', 2, 2),
('Pantalón cargo', 2, 2),
('Campera de jean', 3, 1),
('Buzo oversize',3,2),
('Anteojos de sol',4,1);

SELECT * FROM producto;

INSERT INTO cliente (dni, nombre, apellido, nacionalidad, email, fecha_nacimiento) VALUES
('30456789', 'Lucía', 'Pérez', 'Argentina', 'lucia.perez@email.com', '1995-06-21'),
('28999888', 'Juan', 'Gómez', 'Argentina', 'juan.gomez@email.com', '1990-03-12'),
('41555111', 'María', 'Fernández', 'Uruguaya', 'maria.fernandez@email.com', '1988-11-02'),
('33888999', 'Diego', 'Lopez', 'Chilena', 'diego.lopez@email.com', '1993-09-05');

SELECT * FROM cliente;

INSERT INTO precio_producto (id_producto, precio) VALUES
(1,20000),
(2,25000),
(3,40000),
(4,30000),
(5,35000),
(6,65000),
(7,50000),
(8,45000);

SELECT * FROM precio_producto;

INSERT INTO costo_producto (id_producto, costo) VALUES
(1,9000),
(2,11250),
(3,12000),
(4,10000),
(5,7000),
(6,29250),
(7,15000),
(8,8100);

SELECT * FROM costo_producto;

INSERT INTO venta (id_cliente, fecha) VALUES
(1, '2025-07-20 14:30:00'),
(2, '2025-07-21 16:45:00'),
(3, '2025-07-22 17:20:00'),
(4, '2025-07-22 11:25:00'),
(1, '2025-08-23 10:20:00'),
(2, '2025-09-22 09:30:00'),
(3, '2025-07-25 20:20:00'),
(4, '2025-09-01 15:30:00'),
(1, '2025-07-10 17:05:00'),
(2, '2025-06-05 12:20:00'),
(3, '2025-07-29 16:40:00'),
(4, '2025-08-15 09:37:00'),
(1, '2025-06-22 11:45:00'),
(2, '2025-09-21 19:19:00'),
(3, '2025-06-22 10:10:00');

SELECT * FROM venta;

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, id_talle, id_color) VALUES
(1, 1, 2, 1, 1),
(1, 2, 1, 3, 4),
(1, 5, 3, 2, 5),
(2, 3, 1, 4, 2),
(2, 6, 2, 5, 3),
(3, 4, 4, 1, 1),
(3, 7, 2, 2, 5),
(4, 8, 1, 3, 2),
(4, 2, 5, 4, 4),
(5, 1, 2, 5, 5),
(5, 5, 3, 1, 2),
(6, 6, 1, 3, 3),
(6, 3, 4, 2, 1),
(7, 4, 2, 5, 4),
(7, 7, 1, 4, 2),
(8, 8, 3, 1, 5),
(8, 2, 2, 3, 1),
(9, 1, 5, 2, 4),
(9, 6, 1, 4, 3),
(10, 3, 2, 5, 5),
(10, 5, 3, 1, 2),
(11, 7, 2, 3, 3),
(11, 8, 1, 2, 4),
(12, 4, 4, 5, 1),
(12, 1, 3, 4, 2),
(13, 6, 2, 2, 5),
(13, 2, 1, 3, 1),
(14, 5, 3, 1, 4),
(14, 7, 2, 2, 3),
(15, 8, 4, 5, 2),
(15, 3, 1, 4, 5);

SELECT * FROM detalle_venta;

INSERT INTO stock (id_producto, stock, id_talle, id_color) VALUES
(1, 16, 1, 1),
(1, 30, 1, 2),
(1, 25, 1, 3),
(1, 22, 1, 4),
(1, 12, 1, 5),
(1, 12, 2, 1),
(1, 29, 2, 2),
(1, 27, 2, 3),
(1, 12, 2, 4),
(1, 15, 2, 5),
(1, 21, 3, 1),
(1, 17, 3, 2),
(1, 15, 3, 3),
(1, 16, 3, 4),
(1, 18, 3, 5),
(1, 17, 4, 1),
(1, 30, 4, 2),
(1, 21, 4, 3),
(1, 23, 4, 4),
(1, 19, 4, 5),
(1, 21, 5, 1),
(1, 17, 5, 2),
(1, 28, 5, 3),
(1, 22, 5, 4),
(1, 21, 5, 5),
(2, 16, 1, 1),
(2, 16, 1, 2),
(2, 23, 1, 3),
(2, 25, 1, 4),
(2, 20, 1, 5),
(2, 22, 2, 1),
(2, 30, 2, 2),
(2, 18, 2, 3),
(2, 27, 2, 4),
(2, 26, 2, 5),
(2, 17, 3, 1),
(2, 15, 3, 2),
(2, 26, 3, 3),
(2, 21, 3, 4),
(2, 23, 3, 5),
(2, 12, 4, 1),
(2, 15, 4, 2),
(2, 28, 4, 3),
(2, 19, 4, 4),
(2, 19, 4, 5),
(2, 24, 5, 1),
(2, 20, 5, 2),
(2, 11, 5, 3),
(2, 20, 5, 4),
(2, 25, 5, 5),
(3, 15, 1, 1),
(3, 16, 1, 2),
(3, 19, 1, 3),
(3, 15, 1, 4),
(3, 15, 1, 5),
(3, 10, 2, 1),
(3, 24, 2, 2),
(3, 28, 2, 3),
(3, 27, 2, 4),
(3, 18, 2, 5),
(3, 25, 3, 1),
(3, 14, 3, 2),
(3, 17, 3, 3),
(3, 24, 3, 4),
(3, 26, 3, 5),
(3, 24, 4, 1),
(3, 18, 4, 2),
(3, 12, 4, 3),
(3, 17, 4, 4),
(3, 27, 4, 5),
(3, 24, 5, 1),
(3, 25, 5, 2),
(3, 15, 5, 3),
(3, 18, 5, 4),
(3, 30, 5, 5),
(4, 22, 1, 1),
(4, 28, 1, 2),
(4, 27, 1, 3),
(4, 21, 1, 4),
(4, 21, 1, 5),
(4, 25, 2, 1),
(4, 12, 2, 2),
(4, 15, 2, 3),
(4, 24, 2, 4),
(4, 28, 2, 5),
(4, 27, 3, 1),
(4, 29, 3, 2),
(4, 23, 3, 3),
(4, 12, 3, 4),
(4, 24, 3, 5),
(4, 28, 4, 1),
(4, 24, 4, 2),
(4, 18, 4, 3),
(4, 13, 4, 4),
(4, 23, 4, 5),
(4, 15, 5, 1),
(4, 27, 5, 2),
(4, 25, 5, 3),
(4, 18, 5, 4),
(4, 25, 5, 5),
(5, 18, 1, 1),
(5, 18, 1, 2),
(5, 27, 1, 3),
(5, 26, 1, 4),
(5, 18, 1, 5),
(5, 23, 2, 1),
(5, 30, 2, 2),
(5, 30, 2, 3),
(5, 28, 2, 4),
(5, 20, 2, 5),
(5, 23, 3, 1),
(5, 20, 3, 2),
(5, 17, 3, 3),
(5, 20, 3, 4),
(5, 28, 3, 5),
(5, 14, 4, 1),
(5, 24, 4, 2),
(5, 13, 4, 3),
(5, 30, 4, 4),
(5, 16, 4, 5),
(5, 18, 5, 1),
(5, 20, 5, 2),
(5, 28, 5, 3),
(5, 20, 5, 4),
(5, 11, 5, 5),
(6, 14, 1, 1),
(6, 18, 1, 2),
(6, 18, 1, 3),
(6, 24, 1, 4),
(6, 26, 1, 5),
(6, 21, 2, 1),
(6, 17, 2, 2),
(6, 26, 2, 3),
(6, 29, 2, 4),
(6, 16, 2, 5),
(6, 26, 3, 1),
(6, 29, 3, 2),
(6, 17, 3, 3),
(6, 30, 3, 4),
(6, 23, 3, 5),
(6, 22, 4, 1),
(6, 22, 4, 2),
(6, 11, 4, 3),
(6, 25, 4, 4),
(6, 28, 4, 5),
(6, 26, 5, 1),
(6, 27, 5, 2),
(6, 23, 5, 3),
(6, 18, 5, 4),
(6, 17, 5, 5),
(7, 15, 1, 1),
(7, 27, 1, 2),
(7, 13, 1, 3),
(7, 22, 1, 4),
(7, 19, 1, 5),
(7, 15, 2, 1),
(7, 18, 2, 2),
(7, 26, 2, 3),
(7, 16, 2, 4),
(7, 27, 2, 5),
(7, 19, 3, 1),
(7, 12, 3, 2),
(7, 11, 3, 3),
(7, 16, 3, 4),
(7, 11, 3, 5),
(7, 29, 4, 1),
(7, 24, 4, 2),
(7, 14, 4, 3),
(7, 11, 4, 4),
(7, 25, 4, 5),
(7, 21, 5, 1),
(7, 17, 5, 2),
(7, 12, 5, 3),
(7, 24, 5, 4),
(7, 29, 5, 5),
(8, 23, 1, 1),
(8, 19, 1, 2),
(8, 12, 1, 3),
(8, 26, 1, 4),
(8, 19, 1, 5),
(8, 23, 2, 1),
(8, 28, 2, 2),
(8, 30, 2, 3),
(8, 23, 2, 4),
(8, 24, 2, 5),
(8, 12, 3, 1),
(8, 12, 3, 2),
(8, 12, 3, 3),
(8, 10, 3, 4),
(8, 29, 3, 5),
(8, 21, 4, 1),
(8, 18, 4, 2),
(8, 27, 4, 3),
(8, 16, 4, 4),
(8, 16, 4, 5),
(8, 21, 5, 1),
(8, 14, 5, 2),
(8, 22, 5, 3),
(8, 26, 5, 4),
(8, 18, 5, 5);

SELECT * FROM stock;


