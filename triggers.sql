USE gv_indumentaria;

# Creación de la tabla para  trigger, almecena información de cambios en la tabla cliente
CREATE TABLE IF NOT EXISTS log_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(150) NOT NULL
);

# creación de trigger para la tabla log cliente
# Almacena la información luego de ingresado un nuevo cliente

DROP TRIGGER tr_after_cliente;

DELIMITER //

CREATE TRIGGER tr_after_cliente_new
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_cliente (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), CONCAT('Se ha ingresado un cliente nuevo. ID: ', NEW.id_cliente)); #Se inserta el usuario actual, la fecha y la hora actual, junto con una descripción de la acción que se realizó.
END//

DELIMITER ;

# Creación de trigger para la tabla log cliente
# Almacena la información luego de eliminar un nuevo cliente

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


# Creación de trigger para validar el stock antes de crear vender un producto

DELIMITER //
CREATE TRIGGER tr_before_detalle_venta_insert
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;

    -- Consultar el stock actual del producto
    SELECT stock INTO v_stock
    FROM producto
    WHERE id_producto = NEW.id_producto;

    -- Verificar si hay suficiente stock
    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    ELSE
        -- Opcional: descontar el stock automáticamente
        UPDATE producto
        SET stock = stock - NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    END IF;
END;
//
DELIMITER ;



