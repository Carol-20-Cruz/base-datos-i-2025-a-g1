-- 1. Insertar nuevo usuario
DELIMITER //
CREATE PROCEDURE insertar_usuario(
    IN nombre_usuario VARCHAR(50),
    IN clave VARCHAR(100),
    IN id_persona INT
)
BEGIN
    INSERT INTO user (username, password, id_persona)
    VALUES (nombre_usuario, clave, id_persona);
END;
//

-- 2. Actualizar contraseña
DELIMITER //
CREATE PROCEDURE actualizar_password(
    IN id_usuario INT,
    IN nueva_password VARCHAR(100)
)
BEGIN
    UPDATE user SET password = nueva_password
    WHERE id_user = id_usuario;
END;
//

-- 3. Eliminar usuario
DELIMITER //
CREATE PROCEDURE eliminar_usuario(
    IN id_usuario INT
)
BEGIN
    DELETE FROM user WHERE id_user = id_usuario;
END;
//

-- 4. Consultar todos los alimentos
DELIMITER //
CREATE PROCEDURE obtener_alimentos()
BEGIN
    SELECT * FROM alimento;
END;
//

-- 5. Insertar rutina
DELIMITER //
CREATE PROCEDURE insertar_rutina(
    IN nombre VARCHAR(100),
    IN descripcion TEXT
)
BEGIN
    INSERT INTO rutina (nombre, descripcion)
    VALUES (nombre, descripcion);
END;
//

-- 6. Asignar dieta a usuario
DELIMITER //
CREATE PROCEDURE asignar_dieta(
    IN id_usuario INT,
    IN id_dieta INT,
    IN fecha DATE
)
BEGIN
    INSERT INTO registro_dieta (id_user, id_dieta, fecha)
    VALUES (id_usuario, id_dieta, fecha);
END;
//

-- 7. Insertar progreso
DELIMITER //
CREATE PROCEDURE registrar_progreso(
    IN id_usuario INT,
    IN fecha DATE,
    IN peso DECIMAL(5,2),
    IN altura DECIMAL(4,2),
    IN grasa DECIMAL(5,2)
)
BEGIN
    INSERT INTO progreso (id_user, fecha, peso, altura, grasa_corporal)
    VALUES (id_usuario, fecha, peso, altura, grasa);
END;
//

-- 8. Eliminar rutina
DELIMITER //
CREATE PROCEDURE eliminar_rutina(
    IN id_rutina_eliminar INT
)
BEGIN
    DELETE FROM rutina WHERE id_rutina = id_rutina_eliminar;
END;
//

-- 9. Listar entrenamientos de un usuario
DELIMITER //
CREATE PROCEDURE entrenamientos_usuario(
    IN id_usuario INT
)
BEGIN
    SELECT * FROM entrenamiento
    WHERE id_user = id_usuario;
END;
//

-- 10. Actualizar calorías de alimento
DELIMITER //
CREATE PROCEDURE actualizar_calorias(
    IN id_alimento INT,
    IN nuevas_cal INT
)
BEGIN
    UPDATE alimento SET calorias = nuevas_cal
    WHERE id_alimento = id_alimento;
END;
//
