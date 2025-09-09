USE gv_indumentaria;

# Store procedure que da detalles de las ventas realizadas de  un producto en particular

DROP PROCEDURE sp_ventasproducto;

DELIMITER //
CREATE PROCEDURE sp_ventasproducto(
    IN p_producto INT
)
BEGIN
    SET @query = CONCAT(
        'SELECT p.nombre_producto, v.id_venta, v.fecha, det.cantidad
         FROM producto p
         JOIN detalle_venta det ON det.id_producto=p.id_producto
         JOIN venta v ON v.id_venta = det.id_venta
         WHERE p.id_producto = ', p_producto, ';'
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

# Store procedure para crear o eliminar registros de la tabla clientes

DROP PROCEDURE sp_InsertarEliminarclientes;

DELIMITER //

CREATE PROCEDURE sp_InsertarEliminarclientes(
    IN p_operacion VARCHAR (10),
    IN p_dni VARCHAR(20),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR (100), 
    IN p_nacionalidad VARCHAR (50),
    IN p_email VARCHAR(100),
    IN p_fecha_nacimiento DATE
)
BEGIN
    IF p_operacion = 'INSERT' THEN
        SET @query = CONCAT(
            'INSERT INTO cliente(dni, nombre, apellido, nacionalidad, email, fecha_nacimiento) VALUES (''',
            p_dni, ''',''',
            p_nombre, ''',''',
            p_apellido, ''',''',
            p_nacionalidad, ''',''',
            p_email, ''',''',
            p_fecha_nacimiento, ''');'
        );

    ELSEIF p_operacion = 'DELETE' THEN
        SET @query = CONCAT(
            'DELETE FROM cliente WHERE dni = ''', p_dni, ''';'
        );
    END IF;

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
