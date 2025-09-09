USE gv_indumentaria;

#CREACIÓN DE VISTAS PROJECT gv_indumentaria

# Vista detallada de la tabla producto ya que la tabla producto contiene los codigos pero no contiene las descripciones. 

DROP VIEW vista_producto;

CREATE VIEW vista_producto as
SELECT p.id_producto, p.nombre_producto , c.descripcion_color, t.descripcion_talle, temp.descripcion_temporada, tipo.descripcion_tipo_prenda
FROM producto p
LEFT JOIN color c on p.id_color=c.id_color
LEFT JOIN  talle t on p.id_talle=t.id_talle
LEFT JOIN temporada temp on p.id_temporada=temp.id_temporada
LEFT JOIN tipo_prenda tipo on p.id_tipo_prenda=tipo.id_tipo_prenda;

SELECT *
FROM vista_producto;

# Vista para identificar que productos estan con poco stock 

DROP VIEW bajo_stock;

CREATE VIEW bajo_stock as
SELECT id_producto, nombre_producto, stock
FROM producto
WHERE stock<=3;

SELECT *
FROM bajo_stock;

# Vista para entender la valorización del stock por producto

DROP VIEW stock_valorizado;

CREATE VIEW stock_valorizado as
SELECT  p.id_producto, p.nombre_producto, p.stock, costo.costo , (p.stock * costo.costo) as total
FROM producto p
LEFT JOIN cost_producto costo on p.id_producto=costo.id_producto;

SELECT *
FROM stock_valorizado;

# Vista para poder tener una visión detallada de las ventas con el nombre de cliente, el precio, el costo asociado y el margen generado en cada transacción

DROP VIEW venta_analisis;

CREATE VIEW venta_analisis as 
SELECT v.id_venta, v.id_cliente , concat ( c.nombre," ",c.apellido) as nombre , v.fecha , det.cantidad, det.id_producto, prod.nombre_producto, p.precio, cost.costo , (det.cantidad*(p.precio-cost.costo)) as margen_total
FROM venta v
LEFT JOIN detalle_venta det on v.id_venta=det.id_venta
LEFT JOIN cliente c on v.id_cliente=c.id_cliente
LEFT JOIN precio_producto p on det.id_producto=p.id_producto
LEFT JOIN producto prod on det.id_producto=prod.id_producto
LEFT JOIN cost_producto cost on det.id_producto=cost.id_producto;

SELECT *
FROM venta_analisis;

# Vista para identificar cuantas ventas se hicieron a clientes que no son argentinos 

DROP VIEW venta_internacional;

CREATE VIEW venta_internacional as
SELECT  c.nacionalidad, count(v.id_venta) as ventas
FROM cliente c
LEFT JOIN venta v on c.id_cliente=v.id_cliente
GROUP BY c.nacionalidad
ORDER BY c.nacionalidad desc;

SELECT *
FROM venta_internacional;

#Vista identificar varidad de productos y cantidad

DROP VIEW variedad_productos; 

CREATE VIEW  variedad_productos as
SELECT tipo.descripcion_tipo_prenda,t.descripcion_talle,count(p.id_producto) as cantidad
FROM producto p
JOIN tipo_prenda tipo on tipo.id_tipo_prenda=p.id_tipo_prenda
JOIN talle t on t.id_talle=p.id_talle
GROUP BY  tipo.tipo_prenda, t.descripcion_talle;

SELECT *
FROM variedad_productos;

#Vista para adentificar si tengo ventas sin detalle_venta completado

CREATE VIEW detalle_venta_check as 
SELECT v.id_venta, v.id_cliente , v.fecha , det.id_detalle
FROM venta v
LEFT JOIN detalle_venta det on v.id_venta=det.id_venta
WHERE isnull(det.id_detalle);

SELECT *
FROM detalle_venta_check;




