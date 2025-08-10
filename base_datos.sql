-- ENTREGA CODER HOUSE 2025- GERMAN VINISKY
-- OBJETIVO: CREAR UNA BASE DE DATOS RELACIONAL PARA UNA MARCA DE ROPA

-- CREACIÓN DE LA BASE DE DATOS gv_indumentaria
CREATE DATABASE IF NOT EXISTS gv_indumentaria;
USE gv_indumentaria;

-- CREACION DE LAS TABLAS DEL MODELO

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
  id_color INT NOT NULL,
  id_talle INT NOT NULL,
  FOREIGN KEY (id_tipo_prenda) REFERENCES tipo_prenda(id_tipo_prenda),
  FOREIGN KEY (id_talle) REFERENCES talle(id_talle),
  FOREIGN KEY (id_color) REFERENCES color(id_color),
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
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    moneda VARCHAR(10) DEFAULT 'ARS',
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE cost_producto (
    id_costo INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    moneda VARCHAR(10) DEFAULT 'ARS',
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

drop table detalle_venta;
drop table venta;
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
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);