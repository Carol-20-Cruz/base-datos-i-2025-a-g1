-- 1. Usuarios con su nombre completo y rol
SELECT u.username, p.nombre, p.apellido, r.nombre_rol
FROM user u
JOIN persona p ON u.id_persona = p.id_persona
JOIN rol_user ru ON u.id_user = ru.id_user
JOIN rol r ON ru.id_rol = r.id_rol;

-- 2. Entrenamientos realizados por usuarios
SELECT u.username, r.nombre AS rutina, e.fecha, e.duracion
FROM entrenamiento e
JOIN user u ON e.id_user = u.id_user
JOIN rutina r ON e.id_rutina = r.id_rutina;

-- 3. Usuarios y sus progresos
SELECT u.username, p.fecha, p.peso, p.altura
FROM progreso p
JOIN user u ON p.id_user = u.id_user;

-- 4. Alimentos que contiene cada dieta
SELECT d.nombre AS dieta, a.nombre AS alimento, a.calorias
FROM alimento_dieta ad
JOIN alimento a ON ad.id_alimento = a.id_alimento
JOIN dieta d ON ad.id_dieta = d.id_dieta;

-- 5. Registro de dietas por usuario
SELECT u.username, d.nombre, rd.fecha
FROM registro_dieta rd
JOIN user u ON rd.id_user = u.id_user
JOIN dieta d ON rd.id_dieta = d.id_dieta;

-- 6. Módulos disponibles por rol
SELECT r.nombre_rol, m.nombre_modulo
FROM modulo_rol mr
JOIN rol r ON mr.id_rol = r.id_rol
JOIN modulo m ON mr.id_modulo = m.id_modulo;

-- 7. Formularios disponibles por módulo
SELECT m.nombre_modulo, f.nombre_formulario
FROM form_modulo fm
JOIN modulo m ON fm.id_modulo = m.id_modulo
JOIN formulario f ON fm.id_formulario = f.id_formulario;

-- 8. Usuarios y sus dietas asignadas
SELECT u.username, d.nombre AS dieta, rd.fecha
FROM user u
JOIN registro_dieta rd ON u.id_user = rd.id_user
JOIN dieta d ON rd.id_dieta = d.id_dieta;

-- 9. Usuarios con roles múltiples
SELECT u.username, COUNT(ru.id_rol) AS total_roles
FROM user u
JOIN rol_user ru ON u.id_user = ru.id_user
GROUP BY u.username
HAVING COUNT(ru.id_rol) > 1;

-- 10. Total de calorías por dieta
SELECT d.nombre AS dieta, SUM(a.calorias) AS total_calorias
FROM alimento_dieta ad
JOIN alimento a ON ad.id_alimento = a.id_alimento
JOIN dieta d ON ad.id_dieta = d.id_dieta
GROUP BY d.nombre;
