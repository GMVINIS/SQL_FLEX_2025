-- ENTREGA CODER HOUSE 2025- GERMAN VINISKY--
-- OBJETIVO: CREAR UNA BASE DE DATOS RELACIONAL PARA UNA MARCA DE ROPA--
-- CREACIÓN DE TRIGGERS--

USE gv_indumentaria;

# Creación de la tabla para  trigger, almecena información de cambios en la tabla cliente.

DROP TABLE IF EXISTS log_cliente; 

CREATE TABLE IF NOT EXISTS log_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(150) NOT NULL
);

# Creación de trigger para la tabla log cliente
# Almacen la información luego de ingresado un nuevo cliente

DROP TRIGGER IF EXISTS tr_after_cliente_new;

DELIMITER //

CREATE TRIGGER tr_after_cliente_new

AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_cliente (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), CONCAT('Se ha ingresado un cliente nuevo. ID: ', NEW.id_cliente)); #Se inserta el usuario actual, la fecha y la hora actual, junto con una descripción de la acción que se realizó.
END//

DELIMITER ;

# Creación de trigger para la tabla log cliente.
# Almacena la información luego de eliminar un nuevo cliente.

DROP TRIGGER  IF EXISTS tr_after_cliente_delete;

DELIMITER //
CREATE TRIGGER tr_after_cliente_delete
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_cliente (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), CONCAT('Se ha eliminado un cliente. ID: ', OLD.id_cliente))
    ; #Se inserta el usuario actual, la fecha y la hora actual, junto con una descripción de la acción que se realizó.
END//

DELIMITER ;

# Caso de prueba.

call gv_indumentaria.sp_InsertarEliminarclientes('INSERT', '39644583', 'German', 'Vinisky', 'Argentina', 'gvini@gmail.com', '1996-04-30');
call gv_indumentaria.sp_InsertarEliminarclientes('DELETE', '39644583', 'German', 'Vinisky', 'Argentina', 'gvini@gmail.com', '1996-04-30');

select * from log_cliente;

# Creación de trigger para validar el stock antes de vender un producto.

DROP TRIGGER IF EXISTS tr_before_detalle_venta_insert; 

DELIMITER //
CREATE TRIGGER tr_before_detalle_venta_insert
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;

    -- Consultar el stock actual del producto.
    SELECT stock INTO v_stock
    FROM stock
    WHERE id_producto = NEW.id_producto AND Id_talle=NEW.id_talle AND id_color=NEW.id_color;

    -- Verificar si hay suficiente stock.
    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    ELSE
        -- Opcional: descontar el stock automáticamente.
        UPDATE stock
        SET stock = stock - NEW.cantidad
        WHERE id_producto = NEW.id_producto AND Id_talle=NEW.id_talle AND id_color=NEW.id_color;
    END IF;
END;
//
DELIMITER ;

# Caso de prueba.

# Consulto stock.

select gv_indumentaria.buscar_stock_por_producto(1, 1, 1);

# Genero una venta por mayor de 16 para que el trigger de error.

INSERT INTO venta (id_venta,id_cliente) values
(20, 2);
SELECT * FROM venta;
INSERT INTO detalle_venta(id_venta,id_producto,cantidad,id_talle,id_color) values (20, 1,17,1,1);

# Genero una venta por menor de 16 para que el trigger calcule el stock restante.

INSERT INTO detalle_venta(id_venta,id_producto,cantidad,id_talle,id_color) values (20,1,5,1,1);
select * from stock;