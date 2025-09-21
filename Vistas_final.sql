-- ENTREGA CODER HOUSE 2025- GERMAN VINISKY--
-- OBJETIVO: CREAR UNA BASE DE DATOS RELACIONAL PARA UNA MARCA DE ROPA--
-- CREACIÓN DE VISTAS--


USE gv_indumentaria;


# Vista detallada de la tabla producto ya que la tabla producto contiene los codigos pero no contiene las descripciones. 

DROP VIEW IF EXISTS vista_producto;

CREATE VIEW vista_producto as
SELECT p.id_producto, p.nombre_producto, temp.descripcion_temporada, tipo.descripcion_tipo_prenda
FROM producto p
LEFT JOIN temporada temp on p.id_temporada=temp.id_temporada
LEFT JOIN tipo_prenda tipo on p.id_tipo_prenda=tipo.id_tipo_prenda;

SELECT *
FROM vista_producto;

# Vista para identificar que productos estan con poco stock.

DROP VIEW IF EXISTS bajo_stock;

CREATE VIEW bajo_stock as
SELECT p.id_producto, p.nombre_producto, t.descripcion_talle, c.descripcion_color, s.stock
FROM stock s
JOIN producto p on p.id_producto=s.id_producto
JOIN talle t on t.id_talle=s.id_talle
JOIN color c on c.id_color=s.id_color
WHERE s.stock<=15;

SELECT *
FROM bajo_stock;

# Vista para entender la valorización del stock por producto.

DROP VIEW IF EXISTS  stock_valorizado;

CREATE VIEW stock_valorizado as
SELECT  p.id_producto, p.nombre_producto,s.stock, t.descripcion_talle, c.descripcion_color, costo.costo , (s.stock * costo.costo) as total
FROM stock s
JOIN producto p on p.id_producto=s.id_producto
JOIN talle t on t.id_talle=s.id_talle
JOIN color c on c.id_color=s.id_color
JOIN costo_producto costo on costo.id_producto=s.id_producto
ORDER BY total DESC;

SELECT *
FROM stock_valorizado;

# Vista para poder tener una visión detallada de las ventas con el nombre de cliente, el precio, el costo asociado y el margen generado en cada transacción.

DROP VIEW IF EXISTS  venta_analisis;

CREATE VIEW venta_analisis as 
SELECT v.id_venta, v.id_cliente , concat ( c.nombre," ",c.apellido) as nombre , v.fecha , det.cantidad, det.id_producto, prod.nombre_producto, p.precio, cost.costo , (det.cantidad*(p.precio-cost.costo)) as margen_total
FROM venta v
LEFT JOIN detalle_venta det on v.id_venta=det.id_venta
LEFT JOIN cliente c on v.id_cliente=c.id_cliente
LEFT JOIN precio_producto p on det.id_producto=p.id_producto
LEFT JOIN producto prod on det.id_producto=prod.id_producto
LEFT JOIN costo_producto cost on det.id_producto=cost.id_producto;

SELECT *
FROM venta_analisis;

# Vista para identificar cuantas ventas se hicieron a clientes que no son Argentinos. 

DROP VIEW IF EXISTS venta_internacional;

CREATE VIEW venta_internacional as
SELECT  c.nacionalidad, count(v.id_venta) as ventas
FROM cliente c
LEFT JOIN venta v on c.id_cliente=v.id_cliente
GROUP BY c.nacionalidad
ORDER BY c.nacionalidad desc;

SELECT *
FROM venta_internacional;

# Vista identificar varidad de productos y cantidad.

DROP VIEW IF EXISTS  variedad_productos; 

CREATE VIEW  variedad_productos as
SELECT tipo.descripcion_tipo_prenda, t.descripcion_temporada,count(p.id_producto) as cantidad
FROM producto p
JOIN temporada t on t.id_temporada=p.id_temporada
JOIN tipo_prenda tipo on tipo.id_tipo_prenda=p.id_tipo_prenda
GROUP BY  tipo.descripcion_tipo_prenda, t.descripcion_temporada;

SELECT *
FROM variedad_productos;

# Vista para adientificar si Eexisten ventas sin detalle_venta completado.

DROP VIEW IF EXISTS detalle_venta_check; 

CREATE VIEW detalle_venta_check as 
SELECT v.id_venta, v.id_cliente , v.fecha , det.id_detalle
FROM venta v
LEFT JOIN detalle_venta det on v.id_venta=det.id_venta
WHERE isnull(det.id_detalle);

SELECT *
FROM detalle_venta_check;

# Validación de la vista.
# Creación de una venta sin detalle_venta.

INSERT INTO venta  (id_venta, id_cliente, fecha) VALUES
(22,1,'2025-09-21:10:00');
SELECT * FROM venta;

# Verificación si la venta 22 se detalla en la vista detalle_venta_check.

SELECT *
FROM detalle_venta_check;

DELETE FROM venta
WHERE id_venta = 22;


