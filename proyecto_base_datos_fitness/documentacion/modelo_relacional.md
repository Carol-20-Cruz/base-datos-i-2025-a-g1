USUARIO (
    id_user INT PK,
    username VARCHAR(50),
    password VARCHAR(100),
    id_persona INT FK → PERSONA(id_persona),
    id_objetivo INT FK → OBJETIVO(id_objetivo)
)
PERSONA (
    id_persona INT PK,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(150) UNIQUE
)

USUARIO (
    id_user INT PK,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    id_persona INT FK → PERSONA(id_persona),
    id_objetivo INT FK → OBJETIVO(id_objetivo)
)

ROL (
    id_rol INT PK,
    nombre_rol VARCHAR(50)
)

ROL_USER (
    id_user INT FK → USUARIO(id_user),
    id_rol INT FK → ROL(id_rol),
    PK (id_user, id_rol)
)

MODULO (
    id_modulo INT PK,
    nombre_modulo VARCHAR(50)
)

MODULO_ROL (
    id_modulo INT FK → MODULO(id_modulo),
    id_rol INT FK → ROL(id_rol),
    PK (id_modulo, id_rol)
)

FORMULARIO (
    id_formulario INT PK,
    nombre_formulario VARCHAR(50)
)

FORM_MODULO (
    id_formulario INT FK → FORMULARIO(id_formulario),
    id_modulo INT FK → MODULO(id_modulo),
    PK (id_formulario, id_modulo)
)

OBJETIVO (
    id_objetivo INT PK,
    descripcion TEXT
)

RUTINA (
    id_rutina INT PK,
    nombre VARCHAR(100),
    descripcion TEXT
)

ENTRENAMIENTO (
    id_entrenamiento INT PK,
    id_user INT FK → USUARIO(id_user),
    id_rutina INT FK → RUTINA(id_rutina),
    fecha DATE,
    duracion INT
)

ALIMENTO (
    id_alimento INT PK,
    nombre VARCHAR(100),
    calorias INT
)

DIETA (
    id_dieta INT PK,
    nombre VARCHAR(100),
    descripcion TEXT
)

REGISTRO_DIETA (
    id_registro_dieta INT PK,
    id_user INT FK → USUARIO(id_user),
    id_dieta INT FK → DIETA(id_dieta),
    fecha DATE
)

ALIMENTO_DIETA (
    id_alimento INT FK → ALIMENTO(id_alimento),
    id_dieta INT FK → DIETA(id_dieta),
    PK (id_alimento, id_dieta)
)

PROGRESO (
    id_progreso INT PK,
    id_user INT FK → USUARIO(id_user),
    fecha DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(4,2),
    grasa_corporal DECIMAL(5,2)
)

