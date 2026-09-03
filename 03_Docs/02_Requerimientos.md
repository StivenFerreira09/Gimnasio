# Sistema de Gestión de Gimnasio

## 8. Requisitos Funcionales (RF)

### 8.1. Gestión de clientes

| ID     | Descripción                                                                 | Roles autorizados                                              |
|--------|-----------------------------------------------------------------------------|----------------------------------------------------------------|
| RF-01  | Registrar un nuevo cliente con sus datos básicos (nombre, documento, contacto), validando campos obligatorios y confirmando el guardado. | Administrador, Recepcionista |
| RF-02  | Consultar el listado de clientes registrados y el detalle de un cliente seleccionado. | Administrador, Recepcionista |
| RF-03  | Buscar un cliente por nombre o documento, informando si no hay coincidencias. | Administrador, Recepcionista |
| RF-04  | Editar los datos de un cliente existente y guardar los cambios con confirmación. | Administrador, Recepcionista (según permisos) |
| RF-05  | Cambiar el estado de un cliente (activo/inactivo), con confirmación previa. | Administrador |
| RF-06  | Consultar la membresía propia (tipo, estado y fecha de vencimiento). | Cliente (la propia) · Administrador/Recepcionista (cualquier cliente) |

### 8.2. Gestión de membresías

| ID     | Descripción                                                                 | Roles autorizados                    |
|--------|-----------------------------------------------------------------------------|--------------------------------------|
| RF-07  | Crear tipos de membresía definiendo nombre, precio y duración.              | Administrador                        |
| RF-08  | Consultar el catálogo de membresías registradas.                            | Administrador, Recepcionista         |
| RF-09  | Asignar una membresía a un cliente, calculando automáticamente la fecha de vencimiento según la duración. | Administrador, Recepcionista |
| RF-10  | Consultar membresías activas, vencidas y próximas a vencer, con sus fechas. | Administrador, Recepcionista         |
| RF-11  | Renovar la membresía de un cliente, extendiendo el vencimiento desde la fecha actual, con confirmación. | Administrador, Recepcionista |

### 8.3. Gestión de clases

| ID     | Descripción                                                                 | Roles autorizados                          |
|--------|-----------------------------------------------------------------------------|--------------------------------------------|
| RF-12  | Crear una clase con nombre, horario y capacidad máxima.                      | Administrador                              |
| RF-13  | Asignar un entrenador a una clase.                                          | Administrador                              |
| RF-14  | Consultar las clases disponibles, con horario, cupo restante y entrenador asignado. | Cliente, Recepcionista, Administrador |
| RF-15  | Inscribirse en una clase disponible, validando que exista cupo.             | Cliente                                    |
| RF-16  | Cancelar la propia inscripción, liberando el cupo.                          | Cliente                                    |
| RF-17  | Consultar los clientes inscritos en una clase y su cantidad total.          | Administrador, Recepcionista               |
| RF-18  | Consultar las clases y horarios propios asignados.                          | Entrenador                                 |
| RF-19  | Consultar las clases en las que el cliente está inscrito.                   | Cliente                                    |

### 8.4. Gestión de entrenadores

| ID     | Descripción                                      | Roles autorizados                    |
|--------|--------------------------------------------------|--------------------------------------|
| RF-20  | Registrar un entrenador con su información básica. | Administrador                      |
| RF-21  | Editar la información de un entrenador.          | Administrador                        |
| RF-22  | Consultar a los entrenadores registrados y su detalle. | Administrador, Recepcionista   |
| RF-23  | Consultar qué entrenador está asignado a cada clase. | Administrador, Recepcionista, Cliente |

### 8.5. Panel de control

| ID     | Descripción                                                                 | Roles autorizados |
|--------|-----------------------------------------------------------------------------|-------------------|
| RF-24  | Mostrar un panel con: clientes activos, membresías activas/vencidas, membresías próximas a vencer y clases programadas. | Administrador |

### 8.6. Autenticación y permisos

| ID     | Descripción                                                                 | Roles autorizados |
|--------|-----------------------------------------------------------------------------|-------------------|
| RF-25  | Iniciar sesión validando usuario y contraseña; mostrar solo las funciones permitidas según el rol. | Todos |
| RF-26  | Cerrar sesión, bloqueando el acceso a funciones protegidas sin re-autenticación. | Todos |
| RF-27  | Recuperar contraseña mediante un proceso de verificación de identidad.     | Todos             |
| RF-28  | Restringir el acceso a las funcionalidades según 4 roles fijos: administrador, recepcionista, entrenador, cliente. | Sistema (regla transversal) |

---

## 9. Requisitos No Funcionales (RNF)

### 9.1. Seguridad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-01  | Las contraseñas de los usuarios deberán almacenarse de forma segura mediante mecanismos de cifrado o hash. |
| RNF-02  | El sistema deberá implementar control de acceso basado en roles (RBAC), de acuerdo con los permisos asignados a cada usuario. |

### 9.2. Usabilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-03  | La interfaz deberá ser sencilla e intuitiva para usuarios no técnicos, especialmente para el personal de recepción. |
| RNF-04  | El sistema deberá mostrar mensajes claros de error, advertencia y confirmación después de las operaciones realizadas. |

### 9.3. Disponibilidad

| ID      | Requisito                          |
|---------|------------------------------------|
| RNF-05  | El sistema deberá estar disponible 24/7. |

### 9.4. Integridad de datos

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-06  | El sistema deberá validar los campos obligatorios antes de guardar cualquier información. |
| RNF-07  | El sistema deberá garantizar que las inscripciones a clases respeten la capacidad máxima establecida y no permitan sobrecupo. |

### 9.5. Rendimiento

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-08  | El sistema deberá proporcionar tiempos de respuesta aceptables en las consultas y listados de clientes, membresías y clases, incluso cuando aumente la cantidad de datos almacenados. |

### 9.6. Escalabilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-09  | La arquitectura del sistema deberá ser modular, permitiendo incorporar nuevas sedes, tipos de membresía u otros módulos en el futuro. |

### 9.7. Mantenibilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-10  | El sistema deberá mantener una estructura modular y separada por dominios, incluyendo clientes, membresías, clases, entrenadores y autenticación. |

---

## 10. Reglas de Negocio (RN)

### 10.1. Gestión de clientes

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-01 | Todo cliente debe contar con la información básica requerida antes de ser registrado en el sistema. |
| RN-02 | Cada cliente debe tener un número de documento único dentro del sistema.         |
| RN-03 | Un cliente puede encontrarse en estado activo o inactivo.                        |
| RN-04 | La desactivación de un cliente debe ser realizada por un administrador y requiere confirmación previa. |
| RN-05 | Un cliente inactivo no debe considerarse como cliente activo dentro del sistema. |

### 10.2. Gestión de membresías

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-06 | Cada tipo de membresía debe tener un nombre, precio y duración definidos.        |
| RN-07 | El nombre de un tipo de membresía no debe duplicarse dentro del sistema.         |
| RN-08 | Una membresía debe estar asociada a un cliente registrado.                       |
| RN-09 | La fecha de vencimiento de una membresía debe calcularse de acuerdo con su fecha de inicio y la duración definida para el tipo de membresía. |
| RN-10 | El sistema debe clasificar las membresías según su vigencia como activas, vencidas o próximas a vencer. |
| RN-11 | La renovación de una membresía solamente puede ser realizada por el administrador o personal autorizado del gimnasio. |
| RN-12 | No se puede renovar una membresía si el cliente no tiene una membresía previamente asignada. |

### 10.3. Gestión de clases

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-13 | Toda clase debe tener un nombre, horario y capacidad máxima definidos.           |
| RN-14 | El sistema debe evitar la creación de clases que generen conflictos de horario y espacio. |
| RN-15 | Una clase puede tener un entrenador asignado previamente registrado en el sistema. |
| RN-16 | Un entrenador no debe ser asignado a dos clases que se desarrollen en el mismo horario. |
| RN-17 | Un cliente solamente puede inscribirse en una clase cuando existen cupos disponibles. |
| RN-18 | El número de clientes inscritos en una clase no puede superar su capacidad máxima. |
| RN-19 | Un cliente solamente puede cancelar sus propias inscripciones.                   |
| RN-20 | La cancelación de una inscripción debe liberar el cupo correspondiente de la clase. |
| RN-21 | Para inscribirse en una clase, el cliente debe contar con una membresía activa.  |

### 10.4. Gestión de entrenadores

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-22 | Un entrenador debe estar registrado en el sistema antes de poder ser asignado a una clase. |
| RN-23 | La información obligatoria del entrenador debe estar completa para poder registrarlo. |
| RN-24 | La asignación de un entrenador a una clase debe respetar sus horarios disponibles. |
| RN-25 | Un entrenador solamente puede consultar las clases y horarios que le han sido asignados. |

### 10.5. Dashboard y reportes

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-26 | El dashboard debe estar disponible únicamente para el administrador.             |
| RN-27 | La información mostrada en el dashboard debe corresponder a los datos registrados actualmente en el sistema. |
| RN-28 | Las membresías próximas a vencer deben identificarse utilizando la fecha de vencimiento registrada. |
| RN-29 | Cuando una categoría del dashboard no tenga información registrada, el sistema debe mostrar el valor correspondiente sin generar errores. |

### 10.6. Autenticación y permisos

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-30 | Todo usuario debe autenticarse antes de acceder a las funcionalidades protegidas del sistema. |
| RN-31 | Cada usuario debe tener uno de los cuatro roles definidos: Administrador, Personal del gimnasio, Entrenador o Cliente. |
| RN-32 | Los permisos de acceso deben depender del rol asignado al usuario.               |
| RN-33 | El administrador es el único usuario autorizado para administrar roles y permisos. |
| RN-34 | Un usuario no puede acceder a funcionalidades que no estén permitidas para su rol. |
| RN-35 | Al cerrar sesión, el usuario debe perder el acceso a las funcionalidades protegidas hasta volver a autenticarse. |
| RN-36 | El cliente solamente puede consultar y gestionar la información correspondiente a su propia cuenta, membresía e inscripciones. |
| RN-37 | El entrenador solamente puede consultar la información relacionada con sus propias clases y horarios asignados. |

---

## 11. Restricciones (RES)

| Código  | Restricción                                                                 |
|---------|-----------------------------------------------------------------------------|
| RES-01  | La solución tecnológica operará exclusivamente bajo cuatro perfiles de usuario: Administrador, Recepcionista (Personal del gimnasio), Entrenador y Cliente. |
| RES-02  | La disponibilidad de módulos y operaciones dentro de la plataforma estará restringida según el rol de la cuenta autenticada. |
| RES-03  | El sistema utilizará un motor de base de datos relacional para el almacenamiento persistente de clientes, planes, clases, instructores e inscripciones. |
| RES-04  | La información personal y credenciales deben estar resguardadas mediante controles de seguridad y encriptación de acceso. |
| RES-05  | La etapa de desarrollo abarcará la construcción completa de las 27 historias de usuario aprobadas en la Fase 1 del proyecto. |
| RES-06  | El nivel de prioridad asignado en el backlog servirá solo para ordenar el flujo de trabajo, sin eliminar ninguna función del alcance total. |
| RES-07  | Para vincular un plan de entrenamiento es condición necesaria la existencia previa en base de datos del cliente y de la membresía. |
| RES-08  | Inscribirse a una sesión de entrenamiento exige contar con una clase configurada, un cliente registrado, una membresía activa y cupo libre. |
| RES-09  | El rol Cliente solo operará sobre su propia información y reservas; el Entrenador solo consultará sus clases y agenda asignada. |
| RES-10  | Cualquier funcionalidad fuera de las 27 historias originales será tratada como un requerimiento adicional y requerirá solicitud de cambio. |

---

## 12. Criterios de Aceptación (CA)

| Código | RF Relacionado | Criterio de Aceptación (Given / When / Then) |
|--------|----------------|----------------------------------------------|
| CA-01  | RF-01          | **GIVEN** que el Administrador o Recepcionista está en el formulario de registro, **WHEN** ingresa los datos obligatorios válidos (nombre, documento, contacto) y los envía, **THEN** el sistema guarda el cliente y confirma el registro exitoso. |
| CA-02  | RF-02          | **GIVEN** que un Administrador o Recepcionista accede a la sección de clientes, **WHEN** solicita el listado general o selecciona un afiliado específico, **THEN** la plataforma despliega la lista o el expediente detallado del usuario. |
| CA-03  | RF-03          | **GIVEN** que un usuario autorizado ingresa un nombre o documento en el buscador, **WHEN** ejecuta la consulta, **THEN** el sistema proyecta los resultados coincidentes o informa que no hay registros asociados. |
| CA-04  | RF-04          | **GIVEN** que el personal autorizado modifica la información de un cliente, **WHEN** guarda los cambios con datos válidos, **THEN** la base de datos actualiza el expediente y confirma la operación. |
| CA-05  | RF-05          | **GIVEN** que el Administrador selecciona cambiar el estado de un cliente, **WHEN** confirma la acción en la alerta de seguridad, **THEN** el sistema modifica el estado a Activo o Inactivo. |
| CA-06  | RF-06          | **GIVEN** que un Cliente (o Administrador/Recepcionista consultando un usuario) entra al perfil, **WHEN** consulta el plan contratado, **THEN** el sistema muestra el tipo de membresía, su estado y fecha de vencimiento. |
| CA-07  | RF-07          | **GIVEN** que el Administrador parametriza un nuevo plan, **WHEN** asigna nombre, tarifa y duración válidas sin repetir denominación, **THEN** el sistema crea la membresía y la añade al catálogo. |
| CA-08  | RF-08          | **GIVEN** que el Administrador o Recepcionista entra al módulo de membresías, **WHEN** carga la vista principal, **THEN** el sistema muestra el catálogo completo con precios y vigencias. |
| CA-09  | RF-09          | **GIVEN** que se vincula una membresía a un cliente registrado, **WHEN** se procesa la asignación, **THEN** el sistema calcula la fecha de vencimiento sumando la duración del plan a la fecha actual y lo activa. |
| CA-10  | RF-10          | **GIVEN** que el personal autorizado ingresa a la consulta de membresías, **WHEN** solicita el reporte, **THEN** el sistema lista las suscripciones clasificadas en Activas, Vencidas o Próximas a vencer. |
| CA-11  | RF-11          | **GIVEN** que un cliente solicita extender su suscripción, **WHEN** el personal autorizado procesa la renovación, **THEN** el sistema extiende la vigencia desde la fecha actual y guarda el historial. |
| CA-12  | RF-12          | **GIVEN** que el Administrador programa una nueva clase con nombre, horario y cupo, **WHEN** guarda la información sin que exista cruce de espacio o tiempo, **THEN** la clase queda publicada en el calendario. |
| CA-13  | RF-13          | **GIVEN** que el Administrador asigna un entrenador a una clase, **WHEN** el instructor no presenta choques de agenda en ese horario, **THEN** el sistema vincula al entrenador a la sesión. |
| CA-14  | RF-14          | **GIVEN** que un usuario ingresa al menú de clases, **WHEN** consulta la oferta disponible, **THEN** la plataforma despliega el listado con horarios, cupos libres e instructor asignado. |
| CA-15  | RF-15          | **GIVEN** que un cliente con membresía activa selecciona una clase con aforo disponible, **WHEN** solicita su reserva, **THEN** el sistema confirma la inscripción y descuenta un cupo libre. |
| CA-16  | RF-16          | **GIVEN** que un cliente requiere cancelar una reserva previamente realizada, **WHEN** ejecuta la anulación dentro del tiempo permitido, **THEN** la plataforma retira la inscripción e incrementa un cupo en la clase. |
| CA-17  | RF-17          | **GIVEN** que el Administrador o Recepcionista abre el detalle de una clase, **WHEN** consulta la lista de participantes, **THEN** el sistema lista los nombres de los clientes inscritos y el total de cupos ocupados. |
| CA-18  | RF-18          | **GIVEN** que un Entrenador autenticado ingresa a su panel, **WHEN** consulta su agenda de trabajo, **THEN** el sistema le presenta únicamente sus clases y horarios asignados. |
| CA-19  | RF-19          | **GIVEN** que un Cliente autenticado ingresa a su perfil, **WHEN** abre la opción de reservas, **THEN** el sistema despliega el historial de clases en las que se encuentra inscrito. |
| CA-20  | RF-20          | **GIVEN** que el Administrador ingresa los datos de un nuevo instructor, **WHEN** guarda el registro con la información requerida, **THEN** el sistema crea la ficha del entrenador en la plataforma. |
| CA-21  | RF-21          | **GIVEN** que el Administrador modifica la información de un instructor, **WHEN** valida y guarda los cambios, **THEN** el sistema actualiza el expediente del entrenador. |
| CA-22  | RF-22          | **GIVEN** que el Administrador o Recepcionista accede al módulo de entrenadores, **WHEN** solicita el directorio, **THEN** la plataforma despliega la lista de instructores y permite ver el detalle de cada uno. |
| CA-23  | RF-23          | **GIVEN** que un usuario consulta el detalle de una clase, **WHEN** revisa la ficha informativa, **THEN** el sistema muestra con claridad el entrenador asignado a dicha sesión. |
| CA-24  | RF-24          | **GIVEN** que el Administrador ingresa al cuadro de mando (Dashboard), **WHEN** finaliza la carga de datos, **THEN** la plataforma presenta las métricas en tiempo real de clientes activos, membresías y clases. |
| CA-25  | RF-25          | **GIVEN** que un usuario ingresa sus credenciales en el login, **WHEN** el sistema valida el usuario y contraseña, **THEN** autoriza el ingreso y muestra únicamente las funciones permitidas para su rol. |
| CA-26  | RF-26          | **GIVEN** que un usuario autenticado selecciona la opción de salir, **WHEN** confirma el cierre de sesión, **THEN** el sistema destruye la sesión y bloquea las vistas privadas hasta un nuevo inicio de sesión. |
| CA-27  | RF-27          | **GIVEN** que un usuario inicia el proceso de recuperación de contraseña, **WHEN** supera con éxito la verificación de identidad, **THEN** el sistema permite restablecer y guardar la nueva clave. |
| CA-28  | RF-28          | **GIVEN** que un usuario intenta realizar una operación o acceder a una ruta, **WHEN** el sistema valida su perfil contra los 4 roles fijos, **THEN** restringe o concede el acceso basándose en sus permisos configurados. |

---

## 13. Matriz de Trazabilidad

| Historia | Descripción                              | Requerimiento funcional                                              | Criterios de aceptación |
|----------|------------------------------------------|----------------------------------------------------------------------|-------------------------|
| HU-01    | Registrar cliente                        | RF-01 Registrar un nuevo cliente                                     | CA-01                   |
| HU-02    | Consultar clientes                       | RF-02 Consultar el listado de clientes                               | CA-02                   |
| HU-03    | Buscar cliente                           | RF-03 Buscar un cliente por nombre o documento                       | CA-03                   |
| HU-04    | Editar información del cliente           | RF-04 Editar los datos de un cliente                                 | CA-04                   |
| HU-05    | Desactivar cliente                       | RF-05 Cambiar el estado de un cliente (activo/inactivo)              | CA-05                   |
| HU-06    | Consultar membresía del cliente          | RF-06 Consultar la membresía propia                                  | CA-06                   |
| HU-07    | Crear tipo de membresía                  | RF-07 Crear tipos de membresía                                       | CA-07                   |
| HU-08    | Consultar membresías                     | RF-08 Consultar el catálogo de membresías                            | CA-08                   |
| HU-09    | Asignar membresía a cliente              | RF-09 Asignar una membresía a un cliente                             | CA-09                   |
| HU-10    | Consultar estado de membresías           | RF-10 Consultar membresías activas, vencidas y próximas a vencer     | CA-10                   |
| HU-11    | Renovar membresía                        | RF-11 Renovar la membresía de un cliente                             | CA-11                   |
| HU-12    | Crear clase                              | RF-12 Crear una clase                                                | CA-12                   |
| HU-13    | Asignar entrenador a clase               | RF-13 Asignar un entrenador a una clase                              | CA-13                   |
| HU-14    | Consultar clases disponibles             | RF-14 Consultar las clases disponibles                               | CA-14                   |
| HU-15    | Inscribirse en una clase                 | RF-15 Inscribirse en una clase disponible                            | CA-15                   |
| HU-16    | Cancelar inscripción                     | RF-16 Cancelar la propia inscripción                                 | CA-16                   |
| HU-17    | Consultar alumnos inscritos              | RF-17 Consultar los clientes inscritos en una clase                  | CA-17                   |
| HU-18    | Registrar entrenador                     | RF-20 Registrar un entrenador                                        | CA-20                   |
| HU-19    | Editar información del entrenador        | RF-21 Editar la información de un entrenador                         | CA-21                   |
| HU-20    | Consultar entrenadores                   | RF-22 Consultar a los entrenadores registrados                       | CA-22                   |
| HU-21    | Consultar horarios del entrenador        | RF-18 Consultar las clases y horarios propios asignados              | CA-18                   |
| HU-22    | Consultar dashboard                      | RF-24 Mostrar un panel con métricas del gimnasio                     | CA-24                   |
| HU-23    | Consultar membresías próximas a vencer   | RF-10 Consultar membresías activas, vencidas y próximas a vencer     | CA-10                   |
| HU-24    | Iniciar sesión                           | RF-25 Iniciar sesión                                                 | CA-25                   |
| HU-25    | Cerrar sesión                            | RF-26 Cerrar sesión                                                  | CA-26                   |
| HU-26    | Recuperar contraseña                     | RF-27 Recuperar contraseña                                           | CA-27                   |
| HU-27    | Administrar roles y permisos             | RF-28 Restringir el acceso según roles                               | CA-28                   |
