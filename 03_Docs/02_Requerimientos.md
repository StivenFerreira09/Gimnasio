# Sistema de Gestión de Gimnasio

## 8. Requisitos Funcionales (RF)

### 8.1. Gestión de clientes

| ID     | Descripción                                                                 | Roles autorizados                                              |
|--------|-----------------------------------------------------------------------------|----------------------------------------------------------------|
| RF-01  | Registrar un nuevo cliente con nombre, documento y teléfono (obligatorios) y correo (opcional), validando los campos obligatorios y que el documento no exista, y confirmando el guardado. | Administrador, Recepcionista |
| RF-02  | Consultar el listado de clientes registrados y el detalle de un cliente seleccionado. | Administrador, Recepcionista |
| RF-03  | Buscar un cliente por nombre o documento, informando si no hay coincidencias. | Administrador, Recepcionista |
| RF-04  | Editar los datos de un cliente existente y guardar los cambios con confirmación. | Administrador, Recepcionista (según los permisos de su rol) |
| RF-05  | Cambiar el estado de un cliente (activo/inactivo), con confirmación previa. Un cliente inactivo no puede iniciar sesión. | Administrador |
| RF-06  | Consultar la membresía propia: tipo, actividades incluidas con sus límites, beneficios, estado y fecha de vencimiento. | Cliente (la propia) · Administrador/Recepcionista (cualquier cliente) |

### 8.2. Gestión de membresías

| ID     | Descripción                                                                 | Roles autorizados                    |
|--------|-----------------------------------------------------------------------------|--------------------------------------|
| RF-07  | Crear tipos de membresía definiendo nombre, precio, duración y unidad de duración (días o meses). | Administrador |
| RF-08  | Consultar el catálogo de membresías registradas con su precio, duración, actividades incluidas con sus límites y beneficios. | Administrador, Recepcionista |
| RF-09  | Asignar una membresía a un cliente, calculando automáticamente la fecha de vencimiento según la duración y su unidad. Si el cliente tiene una membresía activa, la nueva la reemplaza previa confirmación. | Administrador, Recepcionista |
| RF-10  | Consultar membresías activas, vencidas y próximas a vencer (según los días de aviso configurados), con sus fechas. | Administrador, Recepcionista |
| RF-11  | Renovar la membresía de un cliente registrando una nueva membresía con vigencia desde la fecha actual; la anterior queda en estado reemplazada. Requiere confirmación. | Administrador, Recepcionista |
| RF-29  | Gestionar el catálogo de beneficios del gimnasio: registrar, editar, activar y desactivar beneficios. | Administrador |
| RF-30  | Configurar las actividades que incluye cada tipo de membresía, con su límite de inscripciones y el período del límite (o sin límite), y los beneficios informativos que incluye. | Administrador |

### 8.3. Gestión de actividades

| ID     | Descripción                                                                 | Roles autorizados                          |
|--------|-----------------------------------------------------------------------------|--------------------------------------------|
| RF-12  | Programar una actividad definiendo la actividad, el día de la semana, la hora de inicio, la hora de fin, el espacio y el entrenador, validando que la hora de fin sea posterior a la de inicio, que no haya cruce en el espacio y que el entrenador esté activo, sin cruces de horario y dentro de su horario fijo. | Administrador |
| RF-13  | Asignar o cambiar el entrenador de una actividad programada, validando que el entrenador esté activo, que no tenga cruces de horario y que la programación esté dentro de su horario fijo. Si el entrenador está inactivo, el sistema rechaza la asignación. | Administrador |
| RF-14  | Consultar las actividades programadas disponibles con actividad, día, horario, espacio, cupo restante y entrenador asignado, indicando si están incluidas en la membresía del cliente y, si tienen límite, cuántas inscripciones le quedan. | Cliente, Recepcionista, Administrador |
| RF-15  | Inscribirse en una actividad programada, validando que el cliente tenga una membresía activa cuyo tipo incluya la actividad, que no haya agotado el límite del período (si existe), que no tenga una inscripción activa en la misma programación y que exista cupo. | Cliente |
| RF-16  | Cancelar la propia inscripción, liberando el cupo. La inscripción cancelada deja de contar para el límite del plan. | Cliente |
| RF-17  | Consultar los clientes inscritos en una actividad programada y su cantidad total. | Administrador, Recepcionista |
| RF-18  | Consultar las actividades programadas y los horarios propios asignados. | Entrenador |
| RF-19  | Consultar las actividades programadas en las que el cliente está inscrito. | Cliente |
| RF-31  | Gestionar el catálogo de actividades: registrar, editar, activar y desactivar actividades con nombre, descripción y capacidad máxima. | Administrador |
| RF-32  | Gestionar los espacios del gimnasio: registrar y editar espacios con nombre y capacidad. | Administrador |
| RF-33  | Cancelar una actividad programada, cancelando automáticamente sus inscripciones activas. | Administrador |

### 8.4. Gestión de entrenadores

| ID     | Descripción                                      | Roles autorizados                    |
|--------|--------------------------------------------------|--------------------------------------|
| RF-20  | Registrar un entrenador con nombre, documento y teléfono (obligatorios) y correo (opcional), validando que el documento no exista. | Administrador, Recepcionista |
| RF-21  | Editar la información de un entrenador.          | Administrador                        |
| RF-22  | Consultar a los entrenadores registrados y su detalle. | Administrador, Recepcionista |
| RF-23  | Consultar qué entrenador está asignado a cada actividad programada. | Administrador, Recepcionista, Cliente |
| RF-34  | Definir el horario fijo de cada entrenador (día, hora de inicio y hora de fin). | Administrador, Recepcionista |
| RF-35  | Cambiar el estado de un entrenador (activo/inactivo). Para desactivarlo, sus actividades programadas deben haberse reasignado previamente. | Administrador |

### 8.5. Panel de control

| ID     | Descripción                                                                 | Roles autorizados |
|--------|-----------------------------------------------------------------------------|-------------------|
| RF-24  | Mostrar un panel con: clientes activos, membresías activas/vencidas, membresías próximas a vencer (según los días de aviso configurados) y actividades programadas. | Administrador |
| RF-36  | Configurar los días de aviso con los que una membresía se considera próxima a vencer. | Administrador |

### 8.6. Autenticación y permisos

| ID     | Descripción                                                                 | Roles autorizados |
|--------|-----------------------------------------------------------------------------|-------------------|
| RF-25  | Iniciar sesión validando usuario y contraseña de un usuario activo; mostrar solo las funciones permitidas según los permisos de su rol. | Todos |
| RF-26  | Cerrar sesión, bloqueando el acceso a funciones protegidas sin re-autenticación. | Todos |
| RF-27  | Recuperar la contraseña: el usuario solicita la recuperación, el sistema envía un código de un solo uso al teléfono o al correo registrado, y el usuario lo ingresa antes de que venza (15 minutos, máximo 3 intentos fallidos) para establecer una nueva contraseña. | Todos |
| RF-28  | Restringir el acceso a las funcionalidades según 4 roles fijos: Administrador, Recepcionista, Entrenador y Cliente, de acuerdo con los permisos configurados para cada rol. | Sistema (regla transversal) |
| RF-37  | Asignar roles a los usuarios y configurar los permisos de cada rol. | Administrador |
| RF-38  | Crear las credenciales de acceso (nombre de usuario y contraseña) de clientes y entrenadores registrados. | Administrador, Recepcionista |
| RF-39  | Registrar usuarios con rol Administrador o Recepcionista, con sus datos personales y credenciales de acceso. | Administrador |

---

## 9. Requisitos No Funcionales (RNF)

### 9.1. Seguridad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-01  | Las contraseñas de los usuarios deberán almacenarse de forma segura mediante mecanismos de cifrado o hash. |
| RNF-02  | El sistema deberá implementar control de acceso basado en roles (RBAC), de acuerdo con los permisos configurados para cada rol. |
| RNF-11  | Los códigos de recuperación de contraseña no deberán almacenarse en texto plano ni registrarse en los registros (logs) del sistema. |

### 9.2. Usabilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-03  | La interfaz deberá ser sencilla e intuitiva para usuarios no técnicos, especialmente para el recepcionista. |
| RNF-04  | El sistema deberá mostrar mensajes claros de error, advertencia y confirmación después de las operaciones realizadas. |

### 9.3. Disponibilidad

| ID      | Requisito                          |
|---------|------------------------------------|
| RNF-05  | El sistema deberá estar disponible durante el horario de atención del gimnasio. La disponibilidad 24/7 es una meta para un despliegue productivo; en el entorno académico no se garantiza, porque el sistema se despliega en una única instancia de servidor (RES-12). |

### 9.4. Integridad de datos

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-06  | El sistema deberá validar los campos obligatorios antes de guardar cualquier información. |
| RNF-07  | El sistema deberá garantizar que las inscripciones a actividades programadas respeten la capacidad máxima de la actividad y no permitan sobrecupo. |

### 9.5. Rendimiento

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-08  | El sistema deberá proporcionar tiempos de respuesta aceptables en las consultas y listados de clientes, membresías y actividades programadas, incluso cuando aumente la cantidad de datos almacenados. |

### 9.6. Escalabilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-09  | La arquitectura del sistema deberá ser modular, permitiendo incorporar nuevas sedes, tipos de membresía u otros módulos en el futuro. |

### 9.7. Mantenibilidad

| ID      | Requisito                                                                 |
|---------|---------------------------------------------------------------------------|
| RNF-10  | El sistema deberá mantener una estructura modular y separada por dominios, incluyendo clientes, membresías, actividades, entrenadores y autenticación. |

---

## 10. Reglas de Negocio (RN)

### 10.1. Gestión de clientes

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-01 | Todo cliente debe contar con nombre, documento y teléfono antes de ser registrado en el sistema; el correo es opcional. |
| RN-02 | Cada usuario del sistema (cliente, entrenador, recepcionista o administrador) debe tener un número de documento único. |
| RN-03 | Un cliente puede encontrarse en estado activo o inactivo.                        |
| RN-04 | La desactivación de un cliente debe ser realizada por un administrador y requiere confirmación previa. |
| RN-05 | Un cliente inactivo no debe considerarse como cliente activo dentro del sistema y no puede iniciar sesión. |

### 10.2. Gestión de membresías

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-06 | Cada tipo de membresía debe tener un nombre, precio, duración y unidad de duración (días o meses) definidos. |
| RN-07 | El nombre de un tipo de membresía no debe duplicarse dentro del sistema.         |
| RN-08 | Una membresía debe estar asociada a un cliente registrado.                       |
| RN-09 | La fecha de vencimiento de una membresía debe calcularse de acuerdo con su fecha de inicio y la duración y unidad definidas para el tipo de membresía. |
| RN-10 | Los estados de una membresía se determinan así: **Reemplazada**, estado formal que el sistema asigna cuando se registra una nueva asignación o una renovación para el mismo cliente; una membresía reemplazada no vuelve a clasificarse como activa ni como vencida, aunque sus fechas lo sugieran. **Activa**, cuando no está reemplazada y su fecha de vencimiento es igual o posterior a la fecha actual. **Vencida**, cuando no está reemplazada y su fecha de vencimiento es anterior a la fecha actual. **Próxima a vencer** no es un estado: es una clasificación de las membresías activas cuya fecha de vencimiento se encuentra dentro de los días de aviso configurados. La vigencia depende únicamente de las fechas; el sistema no gestiona pagos. |
| RN-11 | La renovación de una membresía solamente puede ser realizada por el administrador o el recepcionista. |
| RN-12 | No se puede renovar una membresía si el cliente no tiene una membresía previamente asignada. |
| RN-38 | Un cliente puede tener como máximo una membresía activa. Una nueva asignación o una renovación crea una nueva membresía y la anterior pasa a estado reemplazada. |
| RN-39 | Cada tipo de membresía define las actividades que incluye. Para cada actividad incluida puede definirse un límite de inscripciones y su período (semana, mes o vigencia de la membresía); si no se define un límite, la actividad es ilimitada. Si se define un límite, el período es obligatorio. |
| RN-46 | Los beneficios de un tipo de membresía son informativos: el sistema los muestra, pero no controla su uso. |
| RN-47 | El nombre de un beneficio no debe duplicarse dentro del sistema.                 |
| RN-55 | Solo los beneficios y las actividades en estado activo pueden asociarse a tipos de membresía o programarse. Inactivarlos no elimina las asociaciones ni las programaciones ya registradas. |

### 10.3. Gestión de actividades

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-13 | Toda actividad debe tener un nombre y una capacidad máxima definidos. Toda programación debe tener una actividad, día de la semana, hora de inicio, hora de fin, espacio y entrenador. |
| RN-14 | No pueden existir dos programaciones en el mismo espacio, el mismo día y con horarios superpuestos. |
| RN-15 | Toda programación de una actividad debe tener asignado un entrenador activo, previamente registrado en el sistema. |
| RN-16 | Un entrenador no debe ser asignado a dos programaciones que se realicen el mismo día con horarios superpuestos. |
| RN-17 | Un cliente solamente puede inscribirse en una actividad programada cuando existen cupos disponibles. |
| RN-18 | El número de inscripciones activas de una programación no puede superar la capacidad máxima de la actividad. |
| RN-19 | Un cliente solamente puede cancelar sus propias inscripciones.                   |
| RN-20 | La cancelación de una inscripción debe liberar el cupo correspondiente de la programación. |
| RN-21 | Para inscribirse en una actividad programada, el cliente debe contar con una membresía activa cuyo tipo incluya esa actividad. |
| RN-40 | Si el tipo de membresía define un límite para una actividad, el cliente no puede superar ese número de inscripciones dentro del período definido. Las inscripciones canceladas no cuentan para el límite. |
| RN-41 | Cuando una actividad tiene límite, el sistema debe informar al cliente su límite y las inscripciones que le quedan en el período. |
| RN-42 | Un cliente no puede tener más de una inscripción activa en la misma programación; puede volver a inscribirse después de cancelar. |
| RN-43 | Al cancelar una actividad programada, el sistema debe cancelar todas sus inscripciones activas. |
| RN-44 | El administrador debe asegurar que la capacidad máxima de una actividad sea adecuada a la capacidad del espacio donde se programa. Esta verificación es responsabilidad del administrador y no es validada por el sistema. |
| RN-45 | El cupo disponible de una programación se calcula como la capacidad máxima de la actividad menos las inscripciones activas de esa programación. Para este cálculo prevalece la capacidad máxima de la actividad; la capacidad del espacio es informativa (RN-44). |
| RN-52 | En una programación y en un horario fijo de entrenador, la hora de fin debe ser posterior a la hora de inicio. |

### 10.4. Gestión de entrenadores

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-22 | Un entrenador debe estar registrado en el sistema antes de poder ser asignado a una actividad programada. |
| RN-23 | La información obligatoria del entrenador es nombre, documento y teléfono; el correo es opcional. |
| RN-24 | Una actividad programada solo puede asignarse a un entrenador si su horario está dentro del horario fijo del entrenador definido por el administrador o el recepcionista. |
| RN-25 | Un entrenador solamente puede consultar las actividades programadas y horarios que le han sido asignados. |
| RN-48 | Antes de desactivar a un entrenador, sus actividades programadas deben reasignarse a otro entrenador que cumpla RN-16 y RN-24. Un entrenador inactivo no puede iniciar sesión. |

### 10.5. Dashboard y reportes

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-26 | El dashboard debe estar disponible únicamente para el administrador.             |
| RN-27 | La información mostrada en el dashboard debe corresponder a los datos registrados actualmente en el sistema. |
| RN-28 | Las membresías próximas a vencer deben identificarse con la fecha de vencimiento registrada y los días de aviso configurados. |
| RN-29 | Cuando una categoría del dashboard no tenga información registrada, el sistema debe mostrar el valor correspondiente sin generar errores. |
| RN-49 | Los días de aviso de vencimiento los define el administrador y aplican a todas las membresías del gimnasio. |
| RN-54 | Los días de aviso de vencimiento deben ser un número entero mayor o igual a 1; el valor cero se rechaza. |

### 10.6. Autenticación y permisos

| ID    | Regla de negocio                                                                 |
|-------|----------------------------------------------------------------------------------|
| RN-30 | Todo usuario debe autenticarse antes de acceder a las funcionalidades protegidas del sistema. |
| RN-31 | Cada usuario debe tener uno de los cuatro roles definidos: Administrador, Recepcionista, Entrenador o Cliente. |
| RN-32 | Los permisos de acceso deben depender del rol asignado al usuario.               |
| RN-33 | El administrador es el único usuario autorizado para asignar roles y configurar los permisos de cada rol. |
| RN-34 | Un usuario no puede acceder a funcionalidades que no estén permitidas para su rol. |
| RN-35 | Al cerrar sesión, el usuario debe perder el acceso a las funcionalidades protegidas hasta volver a autenticarse. |
| RN-36 | El cliente solamente puede consultar y gestionar la información correspondiente a su propia cuenta, membresía e inscripciones. |
| RN-37 | El entrenador solamente puede consultar la información relacionada con sus propias actividades programadas y horarios asignados. |
| RN-50 | Solo el administrador y el recepcionista pueden crear credenciales de acceso para clientes y entrenadores. Solo el administrador puede registrar usuarios con rol Administrador o Recepcionista. |
| RN-51 | El nombre de usuario de cada cuenta debe ser único dentro del sistema.           |
| RN-53 | El código de recuperación de contraseña es de un solo uso, vence a los 15 minutos y admite máximo 3 intentos fallidos; al agotarlos o vencerse, el código queda invalidado y el usuario debe solicitar uno nuevo. El código no se almacena en la base de datos. |

---

## 11. Restricciones (RES)

| Código  | Restricción                                                                 |
|---------|-----------------------------------------------------------------------------|
| RES-01  | La solución tecnológica operará exclusivamente bajo cuatro perfiles de usuario: Administrador, Recepcionista, Entrenador y Cliente. |
| RES-02  | La disponibilidad de módulos y operaciones dentro de la plataforma estará restringida según el rol de la cuenta autenticada. |
| RES-03  | El sistema utilizará el motor de base de datos relacional MySQL para el almacenamiento persistente de usuarios, roles, permisos, clientes, entrenadores, horarios de entrenadores, tipos de membresía, beneficios, membresías, actividades, espacios, programaciones e inscripciones. |
| RES-04  | La información personal y credenciales deben estar resguardadas mediante controles de seguridad y encriptación de acceso. |
| RES-05  | La etapa de desarrollo abarcará la construcción completa de las 38 historias de usuario aprobadas: 27 de la Fase 1 y 11 incorporadas mediante la solicitud de cambio realizada en la Fase 4. |
| RES-06  | El nivel de prioridad asignado en el backlog servirá solo para ordenar el flujo de trabajo, sin eliminar ninguna función del alcance total. |
| RES-07  | Para asignar una membresía es condición necesaria la existencia previa en base de datos del cliente y del tipo de membresía. |
| RES-08  | Inscribirse en una actividad programada exige contar con una programación activa, un cliente registrado, una membresía activa cuyo tipo incluya la actividad, el límite del período disponible y cupo libre. |
| RES-09  | El rol Cliente solo operará sobre su propia información e inscripciones; el Entrenador solo consultará sus actividades programadas y su agenda asignada. |
| RES-10  | Cualquier funcionalidad fuera de las 38 historias aprobadas será tratada como un requerimiento adicional y requerirá solicitud de cambio. |
| RES-11  | La primera cuenta con rol Administrador se crea mediante una configuración inicial controlada del sistema (carga de datos iniciales). Las demás cuentas de administradores y recepcionistas se registran desde el sistema mediante RF-39. |
| RES-12  | El sistema se desplegará en una única instancia de servidor, ya que los códigos de recuperación de contraseña se conservan temporalmente en la memoria del servidor (RN-53). Si el servidor se reinicia, los códigos pendientes se pierden y el usuario debe solicitar uno nuevo. |

---

## 12. Criterios de Aceptación (CA)

Los criterios de aceptación se numeran por requisito funcional: una historia puede tener varios criterios y un requisito puede tener más de un criterio. La correspondencia entre historias, requisitos y criterios se encuentra en la matriz de trazabilidad de la sección 13.

| Código | RF Relacionado | Criterio de Aceptación (Given / When / Then) |
|--------|----------------|----------------------------------------------|
| CA-01  | RF-01          | **GIVEN** que el Administrador o el Recepcionista está en el formulario de registro, **WHEN** ingresa nombre, documento y teléfono válidos (y opcionalmente correo) con un documento que no existe en el sistema y los envía, **THEN** el sistema guarda el cliente y confirma el registro exitoso. |
| CA-02  | RF-02          | **GIVEN** que un Administrador o Recepcionista accede a la sección de clientes, **WHEN** solicita el listado general o selecciona un cliente específico, **THEN** la plataforma despliega la lista o el expediente detallado del cliente. |
| CA-03  | RF-03          | **GIVEN** que un usuario autorizado ingresa un nombre o documento en el buscador, **WHEN** ejecuta la consulta, **THEN** el sistema proyecta los resultados coincidentes o informa que no hay registros asociados. |
| CA-04  | RF-04          | **GIVEN** que un usuario autorizado modifica la información de un cliente, **WHEN** guarda los cambios con datos válidos, **THEN** la base de datos actualiza el expediente y confirma la operación. |
| CA-05  | RF-05          | **GIVEN** que el Administrador selecciona cambiar el estado de un cliente, **WHEN** confirma la acción en la alerta de seguridad, **THEN** el sistema modifica el estado a Activo o Inactivo; si queda inactivo, le impide iniciar sesión, y si se reactiva, le restablece el acceso. |
| CA-06  | RF-06          | **GIVEN** que un Cliente (o un Administrador/Recepcionista consultando un cliente) entra al perfil, **WHEN** consulta la membresía, **THEN** el sistema muestra el tipo de membresía, las actividades incluidas con sus límites, los beneficios, su estado y la fecha de vencimiento. |
| CA-07  | RF-07          | **GIVEN** que el Administrador parametriza un nuevo tipo de membresía, **WHEN** asigna nombre, precio, duración y unidad de duración válidos sin repetir el nombre, **THEN** el sistema crea el tipo de membresía y lo añade al catálogo. |
| CA-08  | RF-08          | **GIVEN** que el Administrador o el Recepcionista entra al módulo de membresías, **WHEN** carga la vista principal, **THEN** el sistema muestra el catálogo completo con precios, duraciones, actividades incluidas con sus límites y beneficios. |
| CA-09  | RF-09          | **GIVEN** que se vincula una membresía a un cliente registrado, **WHEN** se procesa la asignación, **THEN** el sistema calcula la fecha de vencimiento sumando la duración del tipo de membresía, según su unidad, a la fecha de inicio; si el cliente tenía una membresía activa y se confirma la asignación, la anterior queda en estado reemplazada. |
| CA-10  | RF-10          | **GIVEN** que un usuario autorizado ingresa a la consulta de membresías, **WHEN** solicita el reporte, **THEN** el sistema lista las membresías clasificadas en Activas, Vencidas o Próximas a vencer según RN-10 y los días de aviso configurados, sin incluir las reemplazadas como activas ni vencidas. |
| CA-11  | RF-11          | **GIVEN** que un cliente con una membresía asignada solicita renovarla, **WHEN** el usuario autorizado procesa la renovación, **THEN** el sistema registra una nueva membresía con vigencia desde la fecha actual y deja la anterior en estado reemplazada, conservando el historial. |
| CA-12  | RF-12          | **GIVEN** que el Administrador programa una actividad con día, horario, espacio y entrenador, **WHEN** guarda la información con una hora de fin posterior a la de inicio, sin cruce en el espacio, con un entrenador activo, sin otra actividad superpuesta y dentro de su horario fijo, **THEN** la programación queda publicada; si alguna validación falla, el sistema informa el motivo y no la guarda. |
| CA-13  | RF-13          | **GIVEN** que el Administrador asigna o cambia el entrenador de una actividad programada, **WHEN** el entrenador está activo, no presenta cruces de horario y la programación está dentro de su horario fijo, **THEN** el sistema vincula al entrenador con la programación; si el entrenador está inactivo, el sistema rechaza la asignación e informa el motivo. |
| CA-14  | RF-14          | **GIVEN** que un usuario autenticado ingresa a la consulta de actividades, **WHEN** consulta las actividades programadas no canceladas, **THEN** la plataforma despliega cada una con actividad, día, horario, espacio, cupos libres y entrenador asignado. Si el usuario es **Cliente**, el sistema indica además si la actividad está incluida en su membresía (si no lo está, informa que no puede inscribirse con su plan actual) y, si tiene límite, cuántas inscripciones le quedan. Si el usuario es **Administrador** o **Recepcionista**, el listado se muestra sin validación de membresía. |
| CA-15  | RF-15          | **GIVEN** que un cliente tiene una membresía activa cuyo tipo incluye la actividad, no ha agotado su límite del período (si existe), no tiene una inscripción activa en esa programación y la programación tiene cupo, **WHEN** solicita su inscripción, **THEN** el sistema confirma la inscripción, descuenta un cupo libre y, si la actividad tiene límite, informa las inscripciones restantes; si alguna condición no se cumple, rechaza la inscripción indicando el motivo. |
| CA-16  | RF-16          | **GIVEN** que un cliente tiene una inscripción activa en una actividad programada, **WHEN** solicita cancelar la inscripción, **THEN** la plataforma cancela la inscripción, incrementa un cupo libre y deja de contarla para su límite. |
| CA-17  | RF-17          | **GIVEN** que el Administrador o el Recepcionista abre el detalle de una actividad programada, **WHEN** consulta la lista de participantes, **THEN** el sistema lista los nombres de los clientes inscritos y el total de cupos ocupados. |
| CA-18  | RF-18          | **GIVEN** que un Entrenador autenticado ingresa a su panel, **WHEN** consulta su agenda de trabajo, **THEN** el sistema le presenta únicamente sus actividades programadas con día, horario y espacio. |
| CA-19  | RF-19          | **GIVEN** que un Cliente autenticado ingresa a su perfil, **WHEN** abre la opción de inscripciones, **THEN** el sistema despliega las actividades programadas en las que se encuentra inscrito. |
| CA-20  | RF-20          | **GIVEN** que el Administrador o el Recepcionista ingresa los datos de un nuevo entrenador, **WHEN** guarda el registro con nombre, documento y teléfono válidos y un documento que no existe en el sistema, **THEN** el sistema crea la ficha del entrenador en la plataforma. |
| CA-21  | RF-21          | **GIVEN** que el Administrador modifica la información de un entrenador, **WHEN** valida y guarda los cambios, **THEN** el sistema actualiza el expediente del entrenador. |
| CA-22  | RF-22          | **GIVEN** que el Administrador o el Recepcionista accede al módulo de entrenadores, **WHEN** solicita el directorio, **THEN** la plataforma despliega la lista de entrenadores y permite ver el detalle de cada uno. |
| CA-23  | RF-23          | **GIVEN** que un usuario consulta el detalle de una actividad programada, **WHEN** revisa la ficha informativa, **THEN** el sistema muestra con claridad el entrenador asignado. |
| CA-24  | RF-24          | **GIVEN** que el Administrador ingresa al cuadro de mando (Dashboard), **WHEN** finaliza la carga de datos, **THEN** la plataforma presenta las métricas actuales de clientes activos, membresías activas, vencidas y próximas a vencer según los días de aviso configurados, y actividades programadas. |
| CA-25  | RF-25          | **GIVEN** que un usuario activo ingresa sus credenciales en el formulario de inicio de sesión, **WHEN** el sistema valida el usuario y contraseña, **THEN** autoriza el ingreso y muestra únicamente las funciones permitidas para su rol. |
| CA-26  | RF-26          | **GIVEN** que un usuario autenticado selecciona la opción de cerrar sesión, **WHEN** confirma el cierre de sesión, **THEN** el sistema destruye la sesión y bloquea las vistas privadas hasta un nuevo inicio de sesión. |
| CA-27  | RF-27          | **GIVEN** que un usuario inicia el proceso de recuperación de contraseña, **WHEN** el sistema envía un código de un solo uso a su teléfono o correo registrado y el usuario lo ingresa antes de 15 minutos y dentro de 3 intentos, **THEN** el sistema permite restablecer y guardar la nueva contraseña; si el código vence o se agotan los intentos, lo invalida y solicita generar uno nuevo; si los datos no corresponden a una cuenta registrada, informa que no fue posible verificar la identidad. |
| CA-28  | RF-28          | **GIVEN** que un usuario intenta realizar una operación o acceder a una ruta, **WHEN** el sistema valida su perfil contra los 4 roles fijos, **THEN** restringe o concede el acceso según los permisos configurados para su rol. |
| CA-29  | RF-29          | **GIVEN** que el Administrador registra o edita un beneficio, o cambia su estado, **WHEN** ingresa un nombre y una descripción válidos sin repetir el nombre de otro beneficio, o confirma la activación o desactivación, **THEN** el sistema guarda los cambios; solo los beneficios activos quedan disponibles para nuevas asociaciones, y desactivar un beneficio no elimina las asociaciones existentes. |
| CA-30  | RF-30          | **GIVEN** que existen un tipo de membresía y actividades registradas, **WHEN** el Administrador asocia actividades indicando límite y período (o sin límite) y, opcionalmente, beneficios, **THEN** el sistema guarda la configuración y la aplica a los clientes con ese tipo de membresía; si define un límite sin período, el sistema no guarda la configuración. |
| CA-31  | RF-31          | **GIVEN** que el Administrador registra o edita una actividad, o cambia su estado, **WHEN** ingresa nombre, descripción y capacidad máxima válidos, o confirma la activación o desactivación, **THEN** el sistema guarda los cambios; solo las actividades activas quedan disponibles para programarlas y asociarlas a los tipos de membresía, y desactivar una actividad no elimina sus asociaciones ni sus programaciones existentes. |
| CA-32  | RF-32          | **GIVEN** que el Administrador registra o edita un espacio, **WHEN** ingresa nombre y capacidad válidos, **THEN** el sistema guarda el espacio y lo deja disponible para programar actividades. |
| CA-33  | RF-33          | **GIVEN** que una actividad programada tiene inscripciones activas, **WHEN** el Administrador confirma su cancelación, **THEN** el sistema cambia su estado a cancelada y cancela todas sus inscripciones activas. |
| CA-34  | RF-34          | **GIVEN** que un entrenador está registrado, **WHEN** el Administrador o el Recepcionista registra los días y las horas de inicio y fin de su horario fijo, con hora de fin posterior a la de inicio, **THEN** el sistema guarda el horario del entrenador. |
| CA-35  | RF-35          | **GIVEN** que el Administrador desea desactivar a un entrenador, **WHEN** el entrenador no tiene actividades programadas asignadas y se confirma la acción, **THEN** el sistema lo desactiva y bloquea su acceso; si tiene actividades asignadas, el sistema exige reasignarlas antes de continuar. Al reactivarlo, el sistema restablece su acceso sin asignarle actividades. |
| CA-36  | RF-36          | **GIVEN** que el Administrador está en la configuración del sistema, **WHEN** ingresa un número de días de aviso válido (mayor o igual a 1) y guarda, **THEN** el sistema aplica el valor a la clasificación de membresías próximas a vencer en todo el gimnasio. |
| CA-37  | RF-37          | **GIVEN** que el Administrador consulta los roles disponibles, **WHEN** asigna un rol a un usuario o modifica los permisos de un rol, **THEN** el sistema actualiza el acceso de los usuarios según los permisos de su rol. |
| CA-38  | RF-38          | **GIVEN** que un cliente o entrenador está registrado y no tiene credenciales, **WHEN** el Administrador o el Recepcionista asigna un nombre de usuario disponible y una contraseña, **THEN** el sistema guarda las credenciales de forma segura y la persona puede iniciar sesión con su rol. |
| CA-39  | RF-39          | **GIVEN** que el Administrador está en el módulo de usuarios, **WHEN** registra a una persona con sus datos, un documento que no existe, el rol Administrador o Recepcionista y sus credenciales, **THEN** el sistema guarda el usuario y le permite iniciar sesión con los permisos de su rol. |
| CA-40  | RF-10          | **GIVEN** que existen membresías activas cuya fecha de vencimiento está dentro de los días de aviso configurados, **WHEN** el Administrador o el Recepcionista consulta las membresías próximas a vencer, **THEN** el sistema muestra el cliente asociado y la fecha de vencimiento de cada una; si no hay ninguna, informa que no hay membresías en esa clasificación. |

---

## 13. Matriz de Trazabilidad

La fila **Transversal** corresponde a una regla que el sistema aplica en todas las historias y no a una funcionalidad concreta. La columna **Entidades del modelo ER** relaciona cada historia con las entidades y relaciones del modelo entidad-relación que intervienen en ella. Cuando una historia no requiere persistencia, se indica expresamente.

| Historia | Descripción | Requerimiento funcional | Criterios de aceptación | Reglas de negocio | Entidades del modelo ER |
|----------|-------------|-------------------------|-------------------------|-------------------|-------------------------|
| HU-01    | Registrar cliente | RF-01 | CA-01 | RN-01, RN-02 | USUARIO, CLIENTE |
| HU-02    | Consultar clientes | RF-02 | CA-02 | RN-36 | USUARIO, CLIENTE |
| HU-03    | Buscar cliente | RF-03 | CA-03 | — | USUARIO, CLIENTE |
| HU-04    | Editar información del cliente | RF-04 | CA-04 | RN-01, RN-02 | USUARIO, CLIENTE |
| HU-05    | Desactivar cliente | RF-05 | CA-05 | RN-03, RN-04, RN-05 | USUARIO (estado), CLIENTE |
| HU-06    | Consultar membresía del cliente | RF-06 | CA-06 | RN-10, RN-36, RN-46 | CLIENTE, MEMBRESIA, TIPO_MEMBRESIA, relación «permite» (ACTIVIDAD), relación «incluye» (BENEFICIO) |
| HU-07    | Crear tipo de membresía | RF-07 | CA-07 | RN-06, RN-07 | TIPO_MEMBRESIA |
| HU-08    | Consultar membresías | RF-08 | CA-08 | RN-46 | TIPO_MEMBRESIA, relación «permite» (ACTIVIDAD), relación «incluye» (BENEFICIO) |
| HU-09    | Asignar membresía a cliente | RF-09 | CA-09 | RN-08, RN-09, RN-10, RN-38 | CLIENTE, MEMBRESIA, TIPO_MEMBRESIA |
| HU-10    | Consultar estado de membresías | RF-10 | CA-10 | RN-10, RN-28 | MEMBRESIA, CONFIGURACION |
| HU-11    | Renovar membresía | RF-11 | CA-11 | RN-10, RN-11, RN-12, RN-38 | CLIENTE, MEMBRESIA, TIPO_MEMBRESIA |
| HU-12    | Programar actividad | RF-12 | CA-12 | RN-13, RN-14, RN-15, RN-16, RN-24, RN-44, RN-52 | PROGRAMACION, ACTIVIDAD, ESPACIO, ENTRENADOR, HORARIO_ENTRENADOR |
| HU-13    | Cambiar el entrenador de una actividad programada | RF-13 | CA-13 | RN-15, RN-16, RN-22, RN-24 | PROGRAMACION, ENTRENADOR, HORARIO_ENTRENADOR |
| HU-14    | Consultar actividades programadas disponibles | RF-14, RF-23 | CA-14, CA-23 | RN-39, RN-41, RN-45 | PROGRAMACION, ACTIVIDAD, ESPACIO, ENTRENADOR, INSCRIPCION, MEMBRESIA, relación «permite» |
| HU-15    | Inscribirse en una actividad | RF-15 | CA-15 | RN-17, RN-18, RN-21, RN-39, RN-40, RN-41, RN-42, RN-45 | CLIENTE, INSCRIPCION, PROGRAMACION, ACTIVIDAD, MEMBRESIA, TIPO_MEMBRESIA, relación «permite» |
| HU-16    | Cancelar inscripción | RF-16 | CA-16 | RN-19, RN-20, RN-40 | CLIENTE, INSCRIPCION, PROGRAMACION |
| HU-17    | Consultar clientes inscritos | RF-17 | CA-17 | — | PROGRAMACION, INSCRIPCION, CLIENTE |
| HU-18    | Registrar entrenador | RF-20 | CA-20 | RN-02, RN-23 | USUARIO, ENTRENADOR |
| HU-19    | Editar información del entrenador | RF-21 | CA-21 | RN-02, RN-23 | USUARIO, ENTRENADOR |
| HU-20    | Consultar entrenadores | RF-22 | CA-22 | — | USUARIO, ENTRENADOR |
| HU-21    | Consultar horarios del entrenador | RF-18 | CA-18 | RN-25, RN-37 | ENTRENADOR, PROGRAMACION, ACTIVIDAD, ESPACIO |
| HU-22    | Consultar dashboard | RF-24 | CA-24 | RN-26, RN-27, RN-28, RN-29 | USUARIO, CLIENTE, MEMBRESIA, CONFIGURACION, PROGRAMACION. El resumen se calcula y no se almacena |
| HU-23    | Consultar membresías próximas a vencer | RF-10 | CA-40 | RN-10, RN-28, RN-49 | MEMBRESIA, CLIENTE, CONFIGURACION |
| HU-24    | Iniciar sesión | RF-25 | CA-25 | RN-05, RN-30, RN-32, RN-34, RN-48 | USUARIO, ROL, PERMISO (relación «concede») |
| HU-25    | Cerrar sesión | RF-26 | CA-26 | RN-35 | No requiere persistencia en el modelo |
| HU-26    | Recuperar contraseña | RF-27 | CA-27 | RN-53, RES-12, RNF-11 | USUARIO (telefono, correo, contraseña). El código de verificación no se almacena en la base de datos (RN-53) |
| HU-27    | Administrar roles y permisos | RF-37 | CA-37 | RN-31, RN-32, RN-33 | USUARIO, ROL, PERMISO (relación «concede») |
| HU-28    | Gestionar beneficios | RF-29 | CA-29 | RN-46, RN-47, RN-55 | BENEFICIO |
| HU-29    | Configurar actividades y beneficios de un tipo de membresía | RF-30 | CA-30 | RN-39, RN-46 | TIPO_MEMBRESIA, ACTIVIDAD, BENEFICIO, relaciones «permite» e «incluye» |
| HU-30    | Gestionar actividades | RF-31 | CA-31 | RN-13, RN-55 | ACTIVIDAD |
| HU-31    | Gestionar espacios | RF-32 | CA-32 | RN-44 | ESPACIO |
| HU-32    | Cancelar actividad programada | RF-33 | CA-33 | RN-43 | PROGRAMACION, INSCRIPCION |
| HU-33    | Definir horario fijo del entrenador | RF-34 | CA-34 | RN-24, RN-52 | ENTRENADOR, HORARIO_ENTRENADOR |
| HU-34    | Cambiar estado del entrenador | RF-35 | CA-35 | RN-16, RN-24, RN-48 | USUARIO (estado), ENTRENADOR, PROGRAMACION |
| HU-35    | Configurar días de aviso de vencimiento | RF-36 | CA-36 | RN-49, RN-54 | CONFIGURACION |
| HU-36    | Crear credenciales de acceso | RF-38 | CA-38 | RN-50, RN-51, RNF-01 | USUARIO, ROL, CLIENTE, ENTRENADOR |
| HU-37    | Registrar usuarios administrativos | RF-39 | CA-39 | RN-02, RN-33, RN-50, RN-51, RES-11 | USUARIO, ROL |
| HU-38    | Consultar mis inscripciones | RF-19 | CA-19 | RN-36 | CLIENTE, INSCRIPCION, PROGRAMACION, ACTIVIDAD, ESPACIO |
| Transversal | Control de acceso por rol (aplica a todas las historias) | RF-28 | CA-28 | RN-30, RN-32, RN-34 | USUARIO, ROL, PERMISO (relación «concede») |
