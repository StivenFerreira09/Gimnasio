# Fase 4 — Base de datos: modelo conceptual

El modelo conceptual se construyó a partir de las épicas e historias de usuario (01), los requisitos, reglas de negocio y restricciones (02) y el modelo UML (03). El motor de base de datos definido para el proyecto es **MySQL** (RES-03).

## 18. Identificación de entidades

### 18.1. Entidades del modelo

| **Entidad** | **Tipo** | **Qué representa** | **Justificación** | **Fuente** |
| --- | --- | --- | --- | --- |
| USUARIO | Fuerte | Cuenta de acceso y datos personales de cualquier persona que usa el sistema | Todos los roles inician sesión y tienen datos personales; el documento y el nombre de usuario deben ser únicos | RF-25 a RF-28, RF-38, RF-39 · RN-02, RN-30, RN-51 |
| ROL | Fuerte | Perfil de acceso: Administrador, Recepcionista, Entrenador o Cliente | Cada usuario tiene un rol y los permisos dependen del rol | RF-28, RF-37 · RN-31, RN-32, RN-33 · RES-01 |
| PERMISO | Fuerte | Funcionalidad del sistema que puede concederse a un rol | El administrador configura los permisos de cada rol | RF-37 · RN-32, RN-33 · RNF-02 |
| CLIENTE | Especialización de USUARIO | Persona que usa los servicios del gimnasio | Tiene membresías e inscripciones propias | RF-01 a RF-06, RF-15, RF-19 · RN-01 a RN-05 |
| ENTRENADOR | Especialización de USUARIO | Persona que dirige actividades programadas | Tiene horario fijo y actividades asignadas | RF-20 a RF-23, RF-34, RF-35 · RN-22 a RN-25, RN-48 |
| HORARIO_ENTRENADOR | Débil en existencia (depende de ENTRENADOR) | Bloque de horario fijo de un entrenador (día, hora de inicio y fin) | Las programaciones deben quedar dentro del horario fijo del entrenador | RF-34 · RN-24, RN-52 |
| TIPO_MEMBRESIA | Fuerte | Plan que ofrece el gimnasio, parametrizado por el administrador | Define precio, duración, actividades incluidas y beneficios | RF-07, RF-08, RF-30 · RN-06, RN-07, RN-39 |
| BENEFICIO | Fuerte | Servicio informativo que puede incluir un plan (proteína, sauna, etc.) | El administrador gestiona un catálogo propio de beneficios | RF-29, RF-30 · RN-46, RN-47, RN-55 |
| MEMBRESIA | Fuerte | Plan asignado a un cliente, con su vigencia | Se asigna, renueva, reemplaza y consulta por cliente; guarda historial | RF-06, RF-09, RF-10, RF-11 · RN-08 a RN-12, RN-38 |
| ACTIVIDAD | Fuerte | Catálogo de actividades del gimnasio (Yoga, Spinning, Natación…) | Define qué se ofrece y su capacidad máxima; los planes incluyen actividades | RF-31 · RN-13, RN-21, RN-39, RN-55 |
| PROGRAMACION | Fuerte | Realización concreta de una actividad: día, horario, espacio y entrenador | Es lo que el cliente consulta y en lo que se inscribe | RF-12 a RF-14, RF-18, RF-23, RF-33 · RN-13 a RN-16, RN-43 |
| ESPACIO | Fuerte | Lugar del gimnasio donde se realizan las actividades | Evita cruces de programaciones en el mismo lugar | RF-32 · RN-14, RN-44 |
| INSCRIPCION | Asociativa (CLIENTE – PROGRAMACION) | Registro de un cliente en una actividad programada | Resuelve la relación N:M entre clientes y programaciones, con fecha, estado e historial propios | RF-15 a RF-17, RF-19 · RN-17 a RN-21, RN-40 a RN-42 |
| CONFIGURACION | Fuerte (registro único) | Parámetros generales del gimnasio | Guarda los días de aviso de vencimiento que define el administrador | RF-36 · RN-49, RN-54 |

### 18.2. Elementos que no son entidades

| **Elemento** | **Por qué no es una entidad** |
| --- | --- |
| Administrador y Recepcionista | Son usuarios que se distinguen por su ROL; no tienen datos propios adicionales. |
| Dashboard y reportes | Su información se calcula a partir de clientes, membresías y programaciones (RN-27); no se almacena. |
| Cupo disponible | Es un dato derivado: capacidad máxima de la actividad menos inscripciones activas (RN-45). |
| Estado "próxima a vencer" | Es una clasificación calculada con la fecha de vencimiento y los días de aviso (RN-10). |
| Código de recuperación de contraseña | No se almacena en la base de datos; el servidor lo conserva temporalmente (RN-53, RES-12). |
| Sesión de usuario | El inicio y cierre de sesión no requieren persistencia en el modelo. |

## 19. Definición de atributos

Tipos de dato conceptuales: **Entero**, **Decimal**, **Texto**, **Fecha**, **Hora** y **Lista de valores** (texto restringido a valores definidos). Los tipos físicos de MySQL se definen en el modelo lógico.

### 19.1. USUARIO

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idUsuario | Identificador del usuario | Entero | Sí | Clave primaria |
| nombreUsuario | Nombre para iniciar sesión | Texto | Sí | Único (RN-51) |
| contraseña | Credencial de acceso | Texto | Sí | Se almacena mediante un hash seguro de contraseña, nunca en texto plano ni con cifrado reversible (RNF-01) |
| nombre | Nombre completo | Texto | Sí | RN-01, RN-23 |
| documento | Número de documento | Texto | Sí | Único entre todos los usuarios (RN-02) |
| telefono | Teléfono de contacto | Texto | Sí | También se usa para recuperar la contraseña (RF-27) |
| correo | Correo electrónico | Texto | No | Opcional (RN-01, RN-23); si está registrado, también puede usarse para recuperar la contraseña (RF-27) |
| estado | Estado de la cuenta | Lista de valores | Sí | Activo / Inactivo. Un usuario inactivo no puede iniciar sesión (RN-05, RN-48) |

### 19.2. ROL

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idRol | Identificador del rol | Entero | Sí | Clave primaria |
| nombre | Nombre del rol | Lista de valores | Sí | Administrador, Recepcionista, Entrenador o Cliente (RN-31). Único |
| descripcion | Descripción del rol | Texto | No | Informativo |

### 19.3. PERMISO

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idPermiso | Identificador del permiso | Entero | Sí | Clave primaria |
| nombre | Nombre de la funcionalidad que habilita | Texto | Sí | Único |
| descripcion | Descripción del permiso | Texto | No | Informativo |

### 19.4. CLIENTE y ENTRENADOR

Son especializaciones de USUARIO: heredan su identificador y sus atributos. No tienen atributos propios; existen como entidades porque participan en relaciones exclusivas (el cliente posee membresías y realiza inscripciones; el entrenador tiene horario fijo y dirige programaciones).

| **Entidad** | **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- | --- |
| CLIENTE | idUsuario | Identificador heredado de USUARIO | Entero | Sí | Clave primaria y referencia a USUARIO |
| ENTRENADOR | idUsuario | Identificador heredado de USUARIO | Entero | Sí | Clave primaria y referencia a USUARIO |

### 19.5. HORARIO_ENTRENADOR

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idHorarioEntrenador | Identificador del bloque de horario | Entero | Sí | Clave primaria |
| diaSemana | Día de la semana | Lista de valores | Sí | Lunes a domingo |
| horaInicio | Hora de inicio | Hora | Sí | — |
| horaFin | Hora de fin | Hora | Sí | Posterior a horaInicio (RN-52) |

### 19.6. TIPO_MEMBRESIA

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idTipoMembresia | Identificador del tipo de membresía | Entero | Sí | Clave primaria |
| nombre | Nombre del plan | Texto | Sí | Único (RN-07) |
| precio | Precio del plan | Decimal | Sí | Informativo; el sistema no gestiona pagos (RN-06) |
| duracion | Cantidad de tiempo de vigencia | Entero | Sí | Mayor que cero (RN-06) |
| unidadDuracion | Unidad de la duración | Lista de valores | Sí | Días o meses (RN-06) |

### 19.7. BENEFICIO

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idBeneficio | Identificador del beneficio | Entero | Sí | Clave primaria |
| nombre | Nombre del beneficio | Texto | Sí | Único (RN-47) |
| descripcion | Descripción del beneficio | Texto | No | Informativo |
| estado | Estado del beneficio | Lista de valores | Sí | Activo / Inactivo (RN-55) |

### 19.8. MEMBRESIA

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idMembresia | Identificador de la membresía | Entero | Sí | Clave primaria |
| fechaInicio | Fecha de inicio de la vigencia | Fecha | Sí | En una renovación, es la fecha actual (RF-11) |
| fechaVencimiento | Fecha de fin de la vigencia | Fecha | Sí | Se calcula al registrar: fechaInicio + duración según su unidad (RN-09) |
| estado | Estado formal de la membresía | Lista de valores | Sí | Registra si la membresía fue reemplazada. Activa y vencida se determinan con la fecha de vencimiento; una membresía reemplazada no vuelve a clasificarse como activa ni vencida (RN-10) |

### 19.9. ACTIVIDAD

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idActividad | Identificador de la actividad | Entero | Sí | Clave primaria |
| nombreActividad | Nombre de la actividad | Texto | Sí | RN-13 |
| descripcion | Descripción de la actividad | Texto | Sí | CA-31 |
| capacidadMaxima | Cupos por cada programación | Entero | Sí | Mayor que cero. Prevalece para calcular el cupo (RN-45) |
| estado | Estado de la actividad | Lista de valores | Sí | Activa / Inactiva (RN-55) |

### 19.10. PROGRAMACION

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idProgramacion | Identificador de la programación | Entero | Sí | Clave primaria |
| diaSemana | Día en que se realiza | Lista de valores | Sí | Lunes a domingo |
| horaInicio | Hora de inicio | Hora | Sí | — |
| horaFin | Hora de fin | Hora | Sí | Posterior a horaInicio (RN-52) |
| estado | Estado de la programación | Lista de valores | Sí | Programada / Cancelada (RN-43) |
| cupoDisponible | Cupos libres | Entero | — | **Derivado, no se almacena**: capacidadMaxima de la actividad menos inscripciones activas (RN-45) |

### 19.11. ESPACIO

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idEspacio | Identificador del espacio | Entero | Sí | Clave primaria |
| nombre | Nombre del espacio | Texto | Sí | — |
| capacidad | Capacidad del espacio | Entero | Sí | Informativa; el administrador verifica que sea adecuada a la actividad (RN-44) |

### 19.12. INSCRIPCION

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idInscripcion | Identificador de la inscripción | Entero | Sí | Clave primaria |
| fechaInscripcion | Fecha en que se registró | Fecha | Sí | Permite contar inscripciones por período (RN-40) |
| estado | Estado de la inscripción | Lista de valores | Sí | Activa / Cancelada. Las canceladas no cuentan para el límite ni el cupo (RN-20, RN-40) |

### 19.13. CONFIGURACION

| **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- |
| idConfiguracion | Identificador del registro | Entero | Sí | Clave primaria. Existe un único registro |
| diasAvisoVencimiento | Días de anticipación para clasificar una membresía como próxima a vencer | Entero | Sí | Mínimo 1 (RN-49, RN-54) |

### 19.14. Atributos de las relaciones N:M

| **Relación** | **Atributo** | **Descripción** | **Tipo** | **Obligatorio** | **Observación** |
| --- | --- | --- | --- | --- | --- |
| permite (TIPO_MEMBRESIA – ACTIVIDAD) | limite | Número máximo de inscripciones en el período | Entero | No | Vacío = actividad ilimitada (RN-39) |
| permite (TIPO_MEMBRESIA – ACTIVIDAD) | periodoLimite | Período en que se cuenta el límite | Lista de valores | Solo si hay límite | Semana, mes o vigencia de la membresía (RN-39) |
| incluye (TIPO_MEMBRESIA – BENEFICIO) | cantidad | Cantidad informativa del beneficio | Texto | No | Solo se muestra; el sistema no controla su uso (RN-46) |
| concede (ROL – PERMISO) | — | — | — | — | Sin atributos propios |

## 20. Definición de claves primarias

Todas las entidades usan un identificador artificial como clave primaria, porque los identificadores naturales disponibles pueden editarse (RF-04, RF-21) o son textos. Los datos que deben ser únicos se registran como **claves candidatas**.

| **Entidad** | **Clave primaria** | **Claves candidatas (únicas)** | **Justificación** |
| --- | --- | --- | --- |
| USUARIO | idUsuario | documento (RN-02), nombreUsuario (RN-51) | El documento y el nombre de usuario son únicos, pero editables |
| ROL | idRol | nombre | Los cuatro roles son fijos (RN-31) |
| PERMISO | idPermiso | nombre | — |
| CLIENTE | idUsuario | — | Clave heredada de USUARIO por la especialización |
| ENTRENADOR | idUsuario | — | Clave heredada de USUARIO por la especialización |
| HORARIO_ENTRENADOR | idHorarioEntrenador | — | Un entrenador puede tener varios bloques el mismo día |
| TIPO_MEMBRESIA | idTipoMembresia | nombre (RN-07) | El nombre es editable |
| BENEFICIO | idBeneficio | nombre (RN-47) | El nombre es editable |
| MEMBRESIA | idMembresia | — | Un cliente acumula varias membresías en su historial |
| ACTIVIDAD | idActividad | — | No hay identificador natural |
| PROGRAMACION | idProgramacion | — | Puede haber varias programaciones de la misma actividad |
| ESPACIO | idEspacio | — | No hay identificador natural |
| INSCRIPCION | idInscripcion | — | Un cliente puede volver a inscribirse en la misma programación después de cancelar (RN-42), por lo que la pareja cliente–programación no es única |
| CONFIGURACION | idConfiguracion | — | Registro único |

## 21. Definición de relaciones

La participación se expresa como **(mínimo, máximo)** de cada entidad en la relación.

| **Entidad A** | **Relación** | **Entidad B** | **Cardinalidad** | **Participación** | **Justificación** |
| --- | --- | --- | --- | --- | --- |
| ROL | se asigna a | USUARIO | 1:N | Rol (0,N) · Usuario (1,1) | Cada usuario tiene exactamente un rol (RN-31) |
| ROL | concede | PERMISO | N:M | Rol (0,N) · Permiso (0,N) | Un rol tiene varios permisos y un permiso puede estar en varios roles (RF-37, RN-32) |
| ENTRENADOR | tiene | HORARIO_ENTRENADOR | 1:N | Entrenador (1,N) · Horario (1,1) | Todo entrenador tiene horario fijo (RN-24) |
| CLIENTE | posee | MEMBRESIA | 1:N | Cliente (0,N) · Membresía (1,1) | Historial de membresías; máximo una activa (RN-08, RN-38) |
| TIPO_MEMBRESIA | clasifica | MEMBRESIA | 1:N | Tipo (0,N) · Membresía (1,1) | Toda membresía es de un tipo (RES-07) |
| TIPO_MEMBRESIA | permite | ACTIVIDAD | N:M | Tipo (0,N) · Actividad (0,N) | Actividades incluidas en cada plan, con límite y período (RN-21, RN-39) |
| TIPO_MEMBRESIA | incluye | BENEFICIO | N:M | Tipo (0,N) · Beneficio (0,N) | Beneficios informativos de cada plan (RN-46) |
| ACTIVIDAD | se programa en | PROGRAMACION | 1:N | Actividad (0,N) · Programación (1,1) | Toda programación es de una actividad (RN-13) |
| ESPACIO | se realiza en | PROGRAMACION | 1:N | Espacio (0,N) · Programación (1,1) | Toda programación ocurre en un espacio (RN-13, RN-14) |
| ENTRENADOR | dirige | PROGRAMACION | 1:N | Entrenador (0,N) · Programación (1,1) | Toda programación tiene un entrenador activo (RN-15, RN-16) |
| CLIENTE | realiza | INSCRIPCION | 1:N | Cliente (0,N) · Inscripción (1,1) | Un cliente se inscribe en varias programaciones (RF-15, RF-19) |
| PROGRAMACION | recibe | INSCRIPCION | 1:N | Programación (0,N) · Inscripción (1,1) | Las inscripciones activas no superan la capacidad (RN-18) |

**Especialización de USUARIO.** USUARIO se especializa en CLIENTE y ENTRENADOR de forma **disjunta** (un usuario no puede ser cliente y entrenador a la vez, porque tiene un solo rol, RN-31) y **parcial** (los usuarios con rol Administrador o Recepcionista no se especializan).

**Restricción de correspondencia entre rol y subtipo.** El subtipo de cada usuario depende de su rol (RN-31):

- Un usuario con rol **Cliente** debe tener su registro en CLIENTE, y solo él puede tenerlo.
- Un usuario con rol **Entrenador** debe tener su registro en ENTRENADOR, y solo él puede tenerlo.
- Un usuario con rol **Administrador** o **Recepcionista** no tiene registro en ninguno de los dos subtipos.

Esta regla no se puede expresar solo con la notación de la especialización. Se deberá garantizar en el modelo lógico o en la capa de servicio al crear un usuario y asignarle su rol.

**Relación N:M entre CLIENTE y PROGRAMACION.** Un cliente puede inscribirse en muchas programaciones y una programación recibe muchos clientes. Se resuelve con la entidad asociativa INSCRIPCION porque cada inscripción tiene identidad, fecha y estado propios y debe conservarse en el historial.

**Relaciones N:M sin entidad propia.** «concede», «permite» e «incluye» se representan como relaciones (las dos últimas con atributos). En el modelo lógico se convertirán en tablas intermedias.

## 22. Modelo entidad-relación

![Modelo entidad-relación](media/images/24_Diagrama_modelo_ER.drawio.png)

Archivo editable: [08_Modelo_Entidad_Relacion.drawio](media/diagrams/08_Diagrama_modelo_ER.drawio)

**Notación:** Chen. Rectángulo = entidad; rectángulo con rombo = entidad asociativa; rombo = relación (con su tipo 1:N o N:M); óvalo = atributo; óvalo con texto subrayado = clave primaria; óvalo punteado = atributo derivado; círculo con "d" = especialización disjunta; la línea simple desde USUARIO indica que es parcial. Los valores (mínimo, máximo) junto a cada entidad indican su participación.

# Base de datos: modelo lógico relacional

El modelo lógico se construyó a partir del modelo conceptual de la Fase 4 (secciones 18 a 22), los requisitos, reglas de negocio y restricciones (02) y el modelo UML (03). El motor de base de datos definido para el proyecto es MySQL (RES-03). Este documento continúa la numeración de la Fase 4 y es el insumo directo del DDL de la Persona 3.

## 23. Convenciones y mapeo de tipos de datos

**Nomenclatura física.** Del modelo conceptual (camelCase) al lógico se pasa a **snake\_case en minúsculas, sin tildes ni eñes**, con prefijo `id_` en las claves (`idUsuario` → `id_usuario`, `nombreUsuario` → `nombre_usuario`). La conversión es mecánica y 1 a 1, así que se conserva la trazabilidad con la Fase 4. Además:

- Las claves foráneas se nombran por el **rol que cumplen**, no por la tabla de origen: `membresia.id_cliente`, `inscripcion.id_cliente`, `programacion.id_entrenador`, `horario_entrenador.id_entrenador`. Así se entiende qué representa cada FK aunque apunte a `cliente.id_usuario` o `entrenador.id_usuario`.
- Las restricciones llevan nombre explícito: `uq_<tabla>_<columna>`, `chk_<tabla>_<regla>`, `fk_<tabla>_<padre>` e `idx_<tabla>_<columnas>`.

**Motor y configuración.** MySQL **8.0.16 o superior** (RES-03; antes de esa versión los CHECK se aceptan pero no se aplican). Todas las tablas usan `ENGINE=InnoDB` (obligatorio para claves foráneas) y `CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci`: admite tildes y «ñ» y compara sin distinguir mayúsculas ni tildes, por lo que `nombre_usuario` es único sin importar cómo se escriba (RN-51). Se recomienda fijar la zona horaria de la sesión en `America/Bogota`, porque las comparaciones de vencimiento usan `CURDATE()`.

| Tipo conceptual (Fase 4) | Tipo MySQL | Uso y justificación |
| --- | --- | --- |
| Entero identificador | `BIGINT AUTO_INCREMENT` | Todas las PK artificiales (sección 20 de la Fase 4). Mapea 1 a 1 con `Long` en JPA/Hibernate; las FK usan exactamente el mismo tipo, requisito de InnoDB. |
| Entero (cantidad o conteo) | `INT` | `capacidad_maxima`, `capacidad`, `duracion`, `limite`, `dias_aviso_vencimiento`; los CHECK impiden valores no positivos. |
| Decimal | `DECIMAL(10,2)` | `precio`: valor monetario exacto, sin error de punto flotante. |
| Texto corto | `VARCHAR(n)` | `nombre`, `documento`, `telefono`, `correo`, `nombre_usuario`, con la longitud ajustada a cada atributo. |
| Contraseña | `VARCHAR(255)` | Guarda el hash (bcrypt o Argon2), nunca el texto plano (RNF-01). |
| Texto descriptivo | `VARCHAR(255)` | `descripcion` de rol, permiso, beneficio y actividad. |
| Fecha / Hora | `DATE` / `TIME` | Fechas de membresía e inscripción sin hora; `hora_inicio` y `hora_fin` sin fecha. |
| Lista de valores | `ENUM(...)` | Dominio cerrado del modelo conceptual. Los valores van **sin tildes** (`'Miercoles'`, `'Sabado'`, `'Dias'`) para evitar problemas de codificación en scripts y en el mapeo a enumeraciones del backend; la interfaz muestra la etiqueta con tilde. |
| Bandera auxiliar | `TINYINT` (columna generada) | Solo `membresia.es_actual` e `inscripcion.es_activa`; existen únicamente para sostener un UNIQUE parcial (sección 29.3). |

**Atributos derivados que no se almacenan.** El cupo disponible de una programación, la clasificación de una membresía como Activa, Vencida o Próxima a vencer y el conteo de inscripciones por período se calculan en consulta o en una vista (sección 30.2). Guardarlos obligaría a sincronizarlos y crearía inconsistencias.

## 24. Normalización: 1FN, 2FN y 3FN

Se verificó cada una de las 17 tablas contra las tres primeras formas normales, en ese orden, partiendo de las 14 entidades de la Fase 4 (sección 18.1) y de sus atributos (sección 19). **Resultado: todas cumplen 3FN.** No fue necesario descomponer ninguna entidad adicional, porque la Fase 4 ya había separado los grupos repetitivos; el trabajo de esta fase fue confirmarlo, resolver las relaciones N:M (sección 26) y fijar qué datos derivables se guardan y cuáles no.

### 24.1. Primera forma normal (1FN)

Se cumple en las 17 tablas: cada atributo es atómico (un solo dato por celda), cada tabla tiene una PK que identifica sus filas y no hay grupos repetitivos. Los casos de «varios valores por entidad» ya están en tablas propias: varios horarios de un entrenador en `horario_entrenador`, el historial de membresías de un cliente en `membresia`, sus inscripciones en `inscripcion`, y las actividades y beneficios de cada plan en tablas intermedias (sección 26). El horario se guarda como **un bloque por fila** (día, `hora_inicio`, `hora_fin`) y no como columnas lunes a domingo.

### 24.2. Segunda forma normal (2FN)

Se cumple porque ningún atributo no clave depende solo de una parte de la clave primaria. En las 14 tablas con PK de una sola columna la 2FN es trivial: no existe una «subparte» de la clave. En las 3 tablas con PK compuesta se revisó cada atributo contra las dos mitades de la clave:

- `tipo_membresia_actividad.limite` y `.periodo_limite` dependen del par completo (plan, actividad): el límite es de *ese* plan aplicado a *esa* actividad, no del plan ni de la actividad por separado.
- `tipo_membresia_beneficio.cantidad` depende igualmente del par (plan, beneficio).
- `rol_permiso` no tiene atributos propios, por lo que no hay dependencia parcial posible.

### 24.3. Tercera forma normal (3FN)

Ningún atributo no clave depende de otro atributo no clave. Los puntos donde la 3FN suele fallar, y la decisión tomada en cada uno:

| Atributo | ¿Se puede derivar? | Decisión | Motivo |
| --- | --- | --- | --- |
| `membresia.fecha_vencimiento` | De `fecha_inicio` y la duración del plan (RN-09), pero solo en el momento del registro | **Se almacena** | Es una fotografía histórica: si el plan cambia, las membresías ya emitidas conservan su vencimiento. |
| Estado Activa o Vencida | Sí, de `fecha_vencimiento` frente a la fecha actual (RN-10) | **No se almacena** | Guardarlo exigiría un proceso diario de sincronización y crearía una dependencia transitiva real. |
| Estado Reemplazada | No: depende de que se haya registrado otra membresía (RN-38) | **Se almacena** en `membresia.estado` | Es el único dato de estado que no sale de las fechas. Valores: `Registrada` y `Reemplazada`. |
| Próxima a vencer | Sí, de `fecha_vencimiento` y `configuracion.dias_aviso_vencimiento` (RN-28, RN-49) | **No se almacena** | Cambia al modificar la configuración y con el paso de los días. |
| Cupo disponible | Sí: `capacidad_maxima` menos las inscripciones Activa (RN-45) | **No se almacena** | Cambiaría con cada alta o cancelación; el sobrecupo se evita con bloqueo (sección 30.1). |
| `es_actual` y `es_activa` | Sí, a partir de `estado` | **Columna generada** por el motor | Solo sostienen un UNIQUE parcial. La dependencia `estado` → bandera es técnicamente transitiva, pero la mantiene MySQL: la aplicación no las escribe y no pueden quedar inconsistentes. |

El nombre `Registrada` es deliberado: es un estado **almacenado** que no dice si la membresía ya venció. La palabra «Activa» se reserva para el estado calculado (RN-10).

### 24.4. Verificación tabla por tabla

Resumen de la verificación de las 17 tablas. «Otras claves únicas» son las claves candidatas además de la PK (sección 20 de la Fase 4); la columna siguiente lista los atributos que dependen de la clave. En todas las tablas el único determinante de esos atributos es la PK o una de esas claves únicas.

| Tabla | Clave primaria | Otras claves únicas | Atributos que dependen de la clave | 1FN | 2FN | 3FN |
| --- | --- | --- | --- | --- | --- | --- |
| `rol` | `id_rol` | `nombre` | `descripcion` | ✓ | ✓ | ✓ |
| `permiso` | `id_permiso` | `nombre` | `descripcion` | ✓ | ✓ | ✓ |
| `rol_permiso` | (`id_rol`, `id_permiso`) | — | ninguno | ✓ | ✓ | ✓ |
| `usuario` | `id_usuario` | `documento`, `nombre_usuario` | `id_rol`, `contrasena`, `nombre`, `telefono`, `correo`, `estado` | ✓ | ✓ | ✓ |
| `cliente` | `id_usuario` | — | ninguno | ✓ | ✓ | ✓ |
| `entrenador` | `id_usuario` | — | ninguno | ✓ | ✓ | ✓ |
| `horario_entrenador` | `id_horario_entrenador` | — | `id_entrenador`, `dia_semana`, `hora_inicio`, `hora_fin` | ✓ | ✓ | ✓ |
| `tipo_membresia` | `id_tipo_membresia` | `nombre` | `precio`, `duracion`, `unidad_duracion` | ✓ | ✓ | ✓ |
| `beneficio` | `id_beneficio` | `nombre` | `descripcion`, `estado` | ✓ | ✓ | ✓ |
| `actividad` | `id_actividad` | — | `nombre_actividad`, `descripcion`, `capacidad_maxima`, `estado` | ✓ | ✓ | ✓ |
| `espacio` | `id_espacio` | — | `nombre`, `capacidad` | ✓ | ✓ | ✓ |
| `configuracion` | `id_configuracion` | — | `dias_aviso_vencimiento` | ✓ | ✓ | ✓ |
| `tipo_membresia_actividad` | (`id_tipo_membresia`, `id_actividad`) | — | `limite`, `periodo_limite` | ✓ | ✓ | ✓ |
| `tipo_membresia_beneficio` | (`id_tipo_membresia`, `id_beneficio`) | — | `cantidad` | ✓ | ✓ | ✓ |
| `membresia` | `id_membresia` | — | `id_cliente`, `id_tipo_membresia`, `fecha_inicio`, `fecha_vencimiento`, `estado` | ✓ | ✓ | ✓ |
| `programacion` | `id_programacion` | — | `id_actividad`, `id_espacio`, `id_entrenador`, `dia_semana`, `hora_inicio`, `hora_fin`, `estado` | ✓ | ✓ | ✓ |
| `inscripcion` | `id_inscripcion` | — | `id_cliente`, `id_programacion`, `fecha_inscripcion`, `estado` | ✓ | ✓ | ✓ |

Como todo determinante es una clave, el modelo tampoco viola la forma normal de Boyce-Codd, así que no hace falta ir más allá de la 3FN. Las columnas generadas `es_actual` y `es_activa` no figuran en la tabla: las calcula MySQL a partir de `estado` (sección 24.3).

## 25. Mapeo de la especialización USUARIO → CLIENTE / ENTRENADOR

**Estrategia elegida: una tabla por subtipo, cuya PK es a la vez FK al supertipo** («class table inheritance»). Es la que ya insinúa la Fase 4 (sección 19.4), donde CLIENTE y ENTRENADOR solo declaran `idUsuario` como clave primaria y referencia a USUARIO.

```
usuario     (id_usuario PK, id_rol FK, nombre_usuario, contrasena, nombre, documento, telefono, correo, estado)
cliente     (id_usuario PK, FK → usuario.id_usuario)
entrenador  (id_usuario PK, FK → usuario.id_usuario)
```

| Alternativa | Por qué se descarta o se elige |
| --- | --- |
| Una sola tabla `usuario` con todos los atributos | No aplica: ni CLIENTE ni ENTRENADOR tienen atributos propios, así que no hay columnas que fusionar. Además se perdería la tabla precisa a la que apuntan las FK de `membresia` e `inscripcion` (cliente) y de `programacion` y `horario_entrenador` (entrenador), que es lo que impide asignar una membresía a un administrador o poner a un cliente a dirigir una clase. |
| Una tabla por subtipo **sin** tabla `usuario` | Rompería la unicidad de `documento` y `nombre_usuario` entre todos los usuarios (RN-02, RN-51) y Administrador y Recepcionista quedarían sin tabla donde existir. |
| **Subtipo con PK = FK (la elegida)** | `usuario` sigue siendo el único punto de unicidad e inicio de sesión, sin columnas nulas por subtipo, y las FK de las demás tablas apuntan con precisión a `cliente` o a `entrenador`. |

**Disyunción y parcialidad** (la restricción de la Fase 4 «disjunta y parcial»):

- *Disjunta:* un `id_usuario` puede estar en `cliente` **o** en `entrenador`, nunca en ambas.
- *Parcial:* puede no estar en ninguna; es el caso de Administrador y Recepcionista.

**Correspondencia rol ↔ subtipo (RN-31).** PK y FK por sí solas no impiden insertar en `cliente` a un usuario con rol Entrenador, ni que un usuario con rol Cliente se quede sin su fila en `cliente`. La Fase 4 dejó esa garantía «en el modelo lógico o en la capa de servicio» (sección 21); aquí se resuelve en el motor con cuatro triggers, probados en MySQL 8:

| Trigger | Evento | Qué hace |
| --- | --- | --- |
| `trg_cliente_bi` | BEFORE INSERT en `cliente` | Rechaza la fila (SQLSTATE 45000) si el usuario no tiene rol Cliente. |
| `trg_entrenador_bi` | BEFORE INSERT en `entrenador` | Rechaza la fila si el usuario no tiene rol Entrenador. |
| `trg_usuario_ai` | AFTER INSERT en `usuario` | Crea la fila del subtipo según el rol: Cliente → `cliente`, Entrenador → `entrenador`; Administrador y Recepcionista no tienen subtipo. |
| `trg_usuario_au` | AFTER UPDATE en `usuario` | Si cambia `id_rol`, elimina la fila del subtipo anterior y crea la del nuevo. Si el subtipo anterior ya tiene membresías, inscripciones o programaciones, el DELETE falla por las FK RESTRICT y **todo el cambio de rol se revierte**; los bloques de `horario_entrenador` no lo impiden, porque se eliminan en cascada junto con el subtipo. |

Así el servicio solo inserta en `usuario` y el subtipo aparece solo; el cambio de rol de un usuario con historial queda bloqueado por la propia base de datos. El código completo de los cuatro triggers está en `triggers.sql` (referencia validada, sección 33.4).

## 26. Descomposición de las relaciones N:M en tablas intermedias

Las relaciones N:M del modelo conceptual se convierten en tablas intermedias. En las tres relaciones puras, la clave primaria es **compuesta** por las dos claves foráneas que hereda de las entidades que relaciona; es el estándar para resolver N:M y garantiza que el mismo par no se repita. La cuarta, INSCRIPCION, sigue otro patrón por una razón que se explica más abajo.

| Relación conceptual | Tabla resultante | Atributos propios | Clave primaria | Claves foráneas |
| --- | --- | --- | --- | --- |
| ROL **concede** PERMISO | `rol_permiso` | — (relación pura) | (`id_rol`, `id_permiso`) | `id_rol` → `rol` · `id_permiso` → `permiso` |
| TIPO\_MEMBRESIA **permite** ACTIVIDAD | `tipo_membresia_actividad` | `limite`, `periodo_limite` | (`id_tipo_membresia`, `id_actividad`) | `id_tipo_membresia` → `tipo_membresia` · `id_actividad` → `actividad` |
| TIPO\_MEMBRESIA **incluye** BENEFICIO | `tipo_membresia_beneficio` | `cantidad` | (`id_tipo_membresia`, `id_beneficio`) | `id_tipo_membresia` → `tipo_membresia` · `id_beneficio` → `beneficio` |
| CLIENTE — PROGRAMACION, mediante INSCRIPCION | `inscripcion` | `fecha_inscripcion`, `estado` | `id_inscripcion` (simple, artificial) | `id_cliente` → `cliente` · `id_programacion` → `programacion` |

**Por qué INSCRIPCION no usa clave compuesta.** En las otras tres el par (A, B) es irrepetible. INSCRIPCION ya nació en la Fase 4 como **entidad asociativa con identidad propia** (sección 18.1) porque un mismo cliente puede volver a inscribirse en la misma programación después de cancelar (RN-42): el par (`id_cliente`, `id_programacion`) **sí puede repetirse**, en filas con estados distintos. Por eso lleva PK simple `id_inscripcion`.

Lo que sí se prohíbe es tener dos inscripciones **activas** del mismo cliente en la misma programación. Se logra con `UNIQUE (id_cliente, id_programacion, es_activa)`, donde `es_activa` es una columna generada que vale 1 si el estado es Activa y NULL en cualquier otro caso. MySQL permite varios NULL en un índice único, así que conviven muchas canceladas pero solo una activa (sección 29.3).

**Atributos propios de las relaciones** (confirmados contra la sección 19.14 de la Fase 4):

- `limite` es **NULL cuando el plan no limita** esa actividad (RN-39). Si tiene valor, `periodo_limite` (`Semana`, `Mes` o `Vigencia`) es obligatorio, y viceversa; lo refuerzan dos CHECK.
- `cantidad` es solo informativa (RN-46): el sistema no controla su consumo, así que es texto libre y no un contador que se descuente.

**Borrado.** Las tres tablas intermedias usan `ON DELETE CASCADE`: sus filas no tienen sentido sin alguno de sus dos padres. En la práctica los catálogos con `estado` se desactivan en lugar de eliminarse (RN-55), y un plan con membresías emitidas no se puede borrar porque `membresia` lo referencia con RESTRICT.
