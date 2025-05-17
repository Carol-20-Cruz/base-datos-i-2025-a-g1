
-- DATOS: MODELO DE SEGURIDAD


-- Personas
INSERT INTO persona (nombre, apellido, correo) VALUES
('Carlos', 'Pérez', 'carlos.perez@email.com'),
('Ana', 'Gómez', 'ana.gomez@email.com'),
('Luis', 'Martínez', 'luis.mtz@email.com');

-- Usuarios
INSERT INTO user (username, password, id_persona) VALUES
('carlitosp', '1234', 1),
('anita88', 'abcd', 2),
('luismtz', 'password', 3);

-- Roles
INSERT INTO rol (nombre_rol) VALUES
('Administrador'),
('Usuario');

-- Usuarios con roles
INSERT INTO rol_user (id_user, id_rol) VALUES
(1, 1),
(2, 2),
(3, 2);

-- Módulos
INSERT INTO modulo (nombre_modulo) VALUES
('Seguridad'),
('Nutrición'),
('Entrenamiento');

-- Rol con módulo
INSERT INTO modulo_rol (id_modulo, id_rol) VALUES
(1, 1),
(2, 2),
(3, 2);

-- Formularios
INSERT INTO formulario (nombre_formulario) VALUES
('form_registro'),
('form_dieta'),
('form_entrenamiento');

-- Formularios por módulo
INSERT INTO form_modulo (id_formulario, id_modulo) VALUES
(1, 1),
(2, 2),
(3, 3);


-- DATOS: ENTIDADES FITNESS


-- Objetivos
INSERT INTO objetivo (descripcion) VALUES
('Perder peso'),
('Ganar masa muscular'),
('Mantener estado físico');

-- Rutinas
INSERT INTO rutina (nombre, descripcion) VALUES
('Full Body', 'Entrenamiento completo de cuerpo'),
('Piernas', 'Ejercicios enfocados en piernas'),
('Cardio', 'Sesión aeróbica intensa');

-- Entrenamientos
INSERT INTO entrenamiento (id_user, id_rutina, fecha, duracion) VALUES
(2, 1, '2025-05-10', 45),
(3, 2, '2025-05-11', 60),
(2, 3, '2025-05-12', 30);

-- Alimentos
INSERT INTO alimento (nombre, calorias) VALUES
('Manzana', 52),
('Arroz', 130),
('Pollo', 165),
('Pan integral', 80);

-- Dietas
INSERT INTO dieta (nombre, descripcion) VALUES
('Baja en carbohidratos', 'Enfocada en proteínas y grasas saludables'),
('Hipercalórica', 'Alta en calorías para aumentar masa');

-- Relación alimento-dieta
INSERT INTO alimento_dieta (id_alimento, id_dieta) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1);

-- Registro de dietas
INSERT INTO registro_dieta (id_user, id_dieta, fecha) VALUES
(2, 1, '2025-05-10'),
(3, 2, '2025-05-11');

-- Progreso de usuarios
INSERT INTO progreso (id_user, fecha, peso, altura, grasa_corporal) VALUES
(2, '2025-05-10', 65.5, 1.65, 22.4),
(3, '2025-05-11', 78.0, 1.80, 18.5),
(2, '2025-05-12', 64.8, 1.65, 21.9);
