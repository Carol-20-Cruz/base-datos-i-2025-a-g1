
-- MODELO DE SEGURIDAD OBLIGATORIO


CREATE TABLE persona (
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);

CREATE TABLE rol (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE rol_user (
    id_user INT,
    id_rol INT,
    PRIMARY KEY (id_user, id_rol),
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE modulo (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_modulo VARCHAR(50) NOT NULL
);

CREATE TABLE modulo_rol (
    id_modulo INT,
    id_rol INT,
    PRIMARY KEY (id_modulo, id_rol),
    FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo),
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE formulario (
    id_formulario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_formulario VARCHAR(50) NOT NULL
);

CREATE TABLE form_modulo (
    id_formulario INT,
    id_modulo INT,
    PRIMARY KEY (id_formulario, id_modulo),
    FOREIGN KEY (id_formulario) REFERENCES formulario(id_formulario),
    FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo)
);

-- TABLAS DEL PROYECTO FITNESS


CREATE TABLE objetivo (
    id_objetivo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL
);

CREATE TABLE rutina (
    id_rutina INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE entrenamiento (
    id_entrenamiento INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_rutina INT,
    fecha DATE,
    duracion INT, -- en minutos
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_rutina) REFERENCES rutina(id_rutina)
);

CREATE TABLE alimento (
    id_alimento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    calorias INT
);

CREATE TABLE dieta (
    id_dieta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE registro_dieta (
    id_registro_dieta INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_dieta INT,
    fecha DATE,
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_dieta) REFERENCES dieta(id_dieta)
);

CREATE TABLE alimento_dieta (
    id_alimento INT,
    id_dieta INT,
    PRIMARY KEY (id_alimento, id_dieta),
    FOREIGN KEY (id_alimento) REFERENCES alimento(id_alimento),
    FOREIGN KEY (id_dieta) REFERENCES dieta(id_dieta)
);

CREATE TABLE progreso (
    id_progreso INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    fecha DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(4,2),
    grasa_corporal DECIMAL(5,2),
    FOREIGN KEY (id_user) REFERENCES user(id_user)
);
