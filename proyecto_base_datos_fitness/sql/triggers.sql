-- 1. Trigger: después de insertar un progreso, verifica si bajó de peso

DELIMITER //
CREATE TRIGGER trigger_bajar_peso
AFTER INSERT ON progreso
FOR EACH ROW
BEGIN
    DECLARE mensaje VARCHAR(100);
    SET mensaje = CONCAT('Progreso registrado: peso = ', NEW.peso);
    INSERT INTO registro_dieta (id_user, id_dieta, fecha)
    VALUES (NEW.id_user, 1, CURDATE()); -- Ejemplo de acción
END;
//

-- 2. Trigger: al eliminar un usuario, registra en una tabla de auditoría (ejemplo)

CREATE TABLE auditoria_eliminacion (
    id_user INT,
    fecha_eliminacion DATETIME
);

DELIMITER //
CREATE TRIGGER trigger_auditoria_usuario
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_eliminacion (id_user, fecha_eliminacion)
    VALUES (OLD.id_user, NOW());
END;
//
