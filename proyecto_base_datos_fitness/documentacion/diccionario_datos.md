### Tabla: persona

| Campo      | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|------------|--------------|----------|-----------------------|----------------------------------|
| id_persona | INT          | -        | PK, AI, NOT NULL      | Identificador único de persona   |
| nombre     | VARCHAR      | 100      | NOT NULL              | Nombre de la persona             |
| apellido   | VARCHAR      | 100      | NOT NULL              | Apellido de la persona           |
| correo     | VARCHAR      | 150      | UNIQUE, NOT NULL      | Correo electrónico de la persona|

---

### Tabla: user

| Campo       | Tipo de Dato | Longitud | Restricciones           | Descripción                          |
|-------------|--------------|----------|--------------------------|--------------------------------------|
| id_user     | INT          | -        | PK, AI, NOT NULL         | Identificador del usuario            |
| username    | VARCHAR      | 50       | UNIQUE, NOT NULL         | Nombre de usuario                    |
| password    | VARCHAR      | 100      | NOT NULL                 | Contraseña del usuario               |
| id_persona  | INT          | -        | FK → persona.id_persona  | Relación con la persona              |
| id_objetivo | INT          | -        | FK → objetivo.id_objetivo| Objetivo asignado al usuario         |

---

### Tabla: objetivo

| Campo        | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|--------------|--------------|----------|-----------------------|----------------------------------|
| id_objetivo  | INT          | -        | PK, AI, NOT NULL      | Identificador del objetivo       |
| descripcion  | TEXT         | -        | NOT NULL              | Descripción del objetivo físico  |

---

### Tabla: rol

| Campo      | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|------------|--------------|----------|-----------------------|----------------------------------|
| id_rol     | INT          | -        | PK, AI, NOT NULL      | Identificador del rol            |
| nombre_rol | VARCHAR      | 50       | NOT NULL              | Nombre del rol                   |

---

### Tabla: rol_user

| Campo    | Tipo de Dato | Longitud | Restricciones                      | Descripción                      |
|----------|--------------|----------|-------------------------------------|----------------------------------|
| id_user  | INT          | -        | PK, FK → user.id_user               | Usuario asignado a un rol        |
| id_rol   | INT          | -        | PK, FK → rol.id_rol                 | Rol asignado al usuario          |

---

### Tabla: modulo

| Campo        | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|--------------|--------------|----------|-----------------------|----------------------------------|
| id_modulo    | INT          | -        | PK, AI, NOT NULL      | Identificador del módulo         |
| nombre_modulo| VARCHAR      | 50       | NOT NULL              | Nombre del módulo del sistema    |

---

### Tabla: modulo_rol

| Campo      | Tipo de Dato | Longitud | Restricciones                   | Descripción                      |
|------------|--------------|----------|----------------------------------|----------------------------------|
| id_modulo  | INT          | -        | PK, FK → modulo.id_modulo       | Módulo habilitado para el rol    |
| id_rol     | INT          | -        | PK, FK → rol.id_rol             | Rol con permiso sobre el módulo |

---

### Tabla: formulario

| Campo            | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|------------------|--------------|----------|-----------------------|----------------------------------|
| id_formulario    | INT          | -        | PK, AI, NOT NULL      | Identificador del formulario     |
| nombre_formulario| VARCHAR      | 50       | NOT NULL              | Nombre del formulario            |

---

### Tabla: form_modulo

| Campo         | Tipo de Dato | Longitud | Restricciones                           | Descripción                                |
|---------------|--------------|----------|------------------------------------------|--------------------------------------------|
| id_formulario | INT          | -        | PK, FK → formulario.id_formulario        | Formulario asignado al módulo              |
| id_modulo     | INT          | -        | PK, FK → modulo.id_modulo                | Módulo al que pertenece el formulario      |

---

### Tabla: rutina

| Campo       | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|-------------|--------------|----------|-----------------------|----------------------------------|
| id_rutina   | INT          | -        | PK, AI, NOT NULL      | Identificador de la rutina       |
| nombre      | VARCHAR      | 100      | NOT NULL              | Nombre de la rutina              |
| descripcion | TEXT         | -        |                       | Descripción de los ejercicios    |

---

### Tabla: entrenamiento

| Campo            | Tipo de Dato | Longitud | Restricciones                        | Descripción                          |
|------------------|--------------|----------|---------------------------------------|--------------------------------------|
| id_entrenamiento | INT          | -        | PK, AI, NOT NULL                      | ID del entrenamiento                 |
| id_user          | INT          | -        | FK → user.id_user                     | Usuario que entrena                  |
| id_rutina        | INT          | -        | FK → rutina.id_rutina                 | Rutina realizada                     |
| fecha            | DATE         | -        | NOT NULL                              | Fecha del entrenamiento              |
| duracion         | INT          | -        |                                       | Duración en minutos                  |

---

### Tabla: alimento

| Campo       | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|-------------|--------------|----------|-----------------------|----------------------------------|
| id_alimento | INT          | -        | PK, AI, NOT NULL      | ID del alimento                  |
| nombre      | VARCHAR      | 100      | NOT NULL              | Nombre del alimento              |
| calorias    | INT          | -        |                       | Calorías aproximadas             |

---

### Tabla: dieta

| Campo       | Tipo de Dato | Longitud | Restricciones        | Descripción                      |
|-------------|--------------|----------|-----------------------|----------------------------------|
| id_dieta    | INT          | -        | PK, AI, NOT NULL      | Identificador de la dieta        |
| nombre      | VARCHAR      | 100      | NOT NULL              | Nombre de la dieta               |
| descripcion | TEXT         | -        |                       | Descripción general de la dieta  |

---

### Tabla: alimento_dieta

| Campo       | Tipo de Dato | Longitud | Restricciones                             | Descripción                      |
|-------------|--------------|----------|--------------------------------------------|----------------------------------|
| id_alimento | INT          | -        | PK, FK → alimento.id_alimento              | Alimento que forma parte de dieta|
| id_dieta    | INT          | -        | PK, FK → dieta.id_dieta                    | Dieta a la que pertenece el alimento |

---

### Tabla: registro_dieta

| Campo            | Tipo de Dato | Longitud | Restricciones                         | Descripción                             |
|------------------|--------------|----------|----------------------------------------|-----------------------------------------|
| id_registro_dieta| INT          | -        | PK, AI, NOT NULL                       | Identificador del registro              |
| id_user          | INT          | -        | FK → user.id_user                      | Usuario que registró la dieta           |
| id_dieta         | INT          | -        | FK → dieta.id_dieta                    | Dieta registrada                        |
| fecha            | DATE         | -        | NOT NULL                               | Fecha de registro                       |

---

### Tabla: progreso

| Campo          | Tipo de Dato  | Longitud | Restricciones                      | Descripción                      |
|----------------|---------------|----------|-------------------------------------|----------------------------------|
| id_progreso    | INT           | -        | PK, AI, NOT NULL                    | Identificador del progreso       |
| id_user        | INT           | -        | FK → user.id_user                   | Usuario del progreso             |
| fecha          | DATE          | -        | NOT NULL                            | Fecha del registro               |
| peso           | DECIMAL(5,2)  | -        |                                     | Peso en kg                       |
| altura         | DECIMAL(4,2)  | -        |                                     | Altura en metros                 |
| grasa_corporal | DECIMAL(5,2)  | -        |                                     | % de grasa corporal              |
