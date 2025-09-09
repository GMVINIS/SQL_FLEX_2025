USE gv_indumentaria;

#Funcion para determinar cuanto stock hay de un producto determinado

DROP FUNCTION buscar_stock_por_producto;

DELIMITER //
CREATE FUNCTION buscar_stock_por_producto(producto_ingresado INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE stock_producto INT;
  SELECT stock into stock_producto	
  FROM producto
  WHERE id_producto=producto_ingresado;
  
  RETURN stock_producto;
END //
DELIMITER ;

#Funcion para determinar cuantas compras hizo un cliente

DROP FUNCTION compras_cliente;

DELIMITER //
CREATE FUNCTION compras_cliente(cliente_seleccionado INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE compras_clientes INT;
  SELECT count(id_venta) into compras_clientes
  FROM venta
  WHERE id_cliente=cliente_seleccionado;
  
  RETURN compras_clientes;
END //
DELIMITER ;