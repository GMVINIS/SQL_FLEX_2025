-- ADICIONAR DATOS DE MUESTRA

-- Tipo de prenda disponibles 
INSERT INTO tipo_prenda (descripcion_tipo_prenda) VALUES
('Remera'),
('Pantalón'),
('Camisa'),
('Vestido'),
('Campera');

SELECT * FROM tipo_prenda;

-- 4 estaciones
INSERT INTO temporada (descripcion_temporada) VALUES
('Primavera'),
('Verano'),
('Otoño'),
('Invierno');

SELECT * FROM temporada;

-- Definir la lista de colores disponibles

INSERT INTO color (descripcion_color) VALUES
('Negro'),
('Blanco'),
('Rojo'),
('Azul'),
('Verde');

SELECT * FROM color;

-- Todos los talles que maneja la marca

INSERT INTO talle (descripcion_talle) VALUES
('XS'),
('S'),
('M'),
('L'),
('XL');

SELECT * FROM talle;

-- tabla de Producto

INSERT INTO producto (nombre_producto, id_tipo_prenda, id_temporada, id_color, id_talle) VALUES
('Remera básica', 1, 1, 2, 3),
('Pantalón cargo', 2, 2, 1, 4),
('Campera de jean', 3, 4, 3, 3),
('Vestido floreado', 4, 3, 4, 2),
('Short deportivo', 5, 1, 5, 3),
('Buzo oversize', 1 , 2, 1, 5);

-- Clientes que han comprado en GV indumentaria

INSERT INTO cliente (dni, nombre, apellido, nacionalidad, email, fecha_nacimiento) VALUES
('30456789', 'Lucía', 'Pérez', 'Argentina', 'lucia.perez@email.com', '1995-06-21'),
('28999888', 'Juan', 'Gómez', 'Argentina', 'juan.gomez@email.com', '1990-03-12'),
('41555111', 'María', 'Fernández', 'Uruguaya', 'maria.fernandez@email.com', '1988-11-02'),
('33888999', 'Diego', 'Lopez', 'Chilena', 'diego.lopez@email.com', '1993-09-05');

-- Precio del producto por fecha
INSERT INTO precio_producto (id_producto, precio, fecha_inicio, fecha_fin) VALUES
(1, 4999.99, '2025-01-01', NULL),
(2, 8999.50, '2025-01-01', NULL),
(3, 11999.00, '2025-01-01', NULL),
(4, 7999.00, '2025-01-01', NULL),
(5, 4500.00, '2025-01-01', NULL),
(6, 9999.00, '2025-01-01', NULL);

-- Costo de compra del producto

INSERT INTO cost_producto (id_producto, costo, fecha_inicio, fecha_fin, moneda) VALUES
(1, 3000.00, '2024-12-15', NULL, 'ARS'),
(2, 5500.00, '2024-12-15', NULL, 'ARS'),
(3, 8000.00, '2024-12-15', NULL, 'ARS'),
(4, 5200.00, '2024-12-15', NULL, 'ARS'),
(5, 2800.00, '2024-12-15', NULL, 'ARS'),
(6, 6700.00, '2024-12-15', NULL, 'ARS');


-- Ventas realizadas
INSERT INTO venta (id_cliente, fecha) VALUES
(1, '2025-07-20 14:30:00'),
(2, '2025-07-21 16:45:00'),
(3, '2025-07-22 11:20:00');

-- Detalles de las ventas realizadas

INSERT INTO detalle_venta(id_venta,id_producto,cantidad) VALUES
(1,2,1),
(1,4,2),
(2,3,5),
(3,1,2),
(3,3,1),
(2,2,3);
