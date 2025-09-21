-- ENTREGA CODER HOUSE 2025- GERMAN VINISKY--
-- OBJETIVO: CREAR UNA BASE DE DATOS RELACIONAL PARA UNA MARCA DE ROPA--
-- CREACIÓN DE FUNCIONES--

USE gv_indumentaria;

# Función para determinar cuanto stock hay de un producto determinado.

DROP FUNCTION  IF EXISTS buscar_stock_por_producto;

DELIMITER //
CREATE FUNCTION buscar_stock_por_producto(codigo_producto INT, codigo_talle INT, codigo_color INT)  RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE stock_producto INT;
  SELECT stock into stock_producto	
  FROM stock
  WHERE id_producto=codigo_producto AND id_talle=codigo_talle AND id_color=codigo_color;
  
  RETURN stock_producto;
END //
DELIMITER ;

# Caso de prueba.

select gv_indumentaria.buscar_stock_por_producto(1, 1, 1);

# Función para determinar cuantas compras hizo un cliente.

DROP FUNCTION IF EXISTS compras_cliente;

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

# Caso de prueba.

select gv_indumentaria.compras_cliente(3);
