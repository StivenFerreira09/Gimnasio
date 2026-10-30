# Diseño de Pantallas web

## 1. Objetivo

Documentar las pantallas de la versión web del Sistema de Gestión de Gimnasio, describiendo su propósito, los elementos principales que contienen y las funcionalidades disponibles según el rol y los permisos del usuario.

La interfaz web está orientada al uso desde computadores y debe facilitar la consulta y administración de la información del gimnasio mediante formularios, tablas, paneles y elementos de navegación.

## 2. Características de la interfaz web

| Elemento | Descripción |
|---|---|
| Plataforma | Aplicación web para computadores. |
| Navegación | Menú principal con opciones según el rol y los permisos del usuario. |
| Encabezado | Identificación de la sección y acceso a las opciones de la cuenta. |
| Formularios | Campos organizados para registrar y editar información. |
| Listados | Tablas o estructuras de consulta para visualizar los registros. |
| Acciones | Botones para consultar, registrar, editar, confirmar o cancelar operaciones, según corresponda. |
| Mensajes | Avisos de éxito, error, validación y confirmación. |
| Control de acceso | Las funcionalidades visibles y disponibles dependen de los permisos del usuario autenticado. |

La distribución visual específica debe corresponder al prototipo web desarrollado en Figma.

## 3. Grupos de pantallas

### Grupo A. Acceso y recuperación de contraseña

Estas pantallas permiten a los usuarios autenticarse y recuperar el acceso a su cuenta.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| A1 | Iniciar sesión | Formulario para ingresar las credenciales de acceso. | Todos |
| A2 | Error de credenciales | Informa que los datos ingresados no permiten iniciar sesión. | Todos |
| A3 | Recuperar contraseña | Permite solicitar un código de recuperación mediante el teléfono o correo registrado. | Todos |
| A4 | Ingresar código | Permite introducir el código de recuperación enviado al usuario. | Todos |
| A5 | Código inválido o vencido | Informa que el código no es válido o que superó el tiempo permitido. | Todos |
| A6 | Nueva contraseña | Formulario para establecer y confirmar una nueva contraseña. | Todos |
| A7 | Confirmación de recuperación | Informa que la contraseña se actualizó correctamente. | Todos |

**Consideraciones funcionales:**

- Solo los usuarios activos pueden iniciar sesión.
- El código de recuperación es de un solo uso y tiene una vigencia de 15 minutos.
- Se permiten como máximo tres intentos fallidos de validación del código.
- Los mensajes deben indicar claramente los errores y el resultado de la operación.

### Grupo B. Inicio y paneles principales

Estas pantallas presentan las opciones iniciales según el perfil del usuario.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| B1 | Panel de control | Presenta un resumen de clientes activos, membresías activas, vencidas y próximas a vencer, y actividades programadas. | Administrador |
| B2 | Inicio de recepción | Facilita el acceso a las operaciones de atención y consulta de información del gimnasio. | Recepcionista |

**Consideraciones funcionales:**

- El panel de control debe presentar los indicadores definidos en los requerimientos.
- El administrador puede configurar los días de aviso para identificar las membresías próximas a vencer.
- El inicio de recepción debe ofrecer acceso a las funciones autorizadas para el recepcionista.
- No deben mostrarse opciones que el usuario no tenga permiso para utilizar.

### Grupo C. Gestión de clientes

Estas pantallas permiten registrar, consultar y administrar los datos de los clientes.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| C1 | Listado de clientes | Presenta los clientes registrados y permite acceder a sus detalles. | Administrador, Recepcionista |
| C2 | Búsqueda sin resultados | Informa que no se encontraron coincidencias para los criterios de búsqueda. | Administrador, Recepcionista |
| C3 | Registrar cliente | Formulario para ingresar los datos de un nuevo cliente. | Administrador, Recepcionista |
| C4 | Detalle de cliente | Muestra la información del cliente y su membresía asociada. | Administrador, Recepcionista |
| C5 | Editar cliente | Permite actualizar la información autorizada del cliente. | Administrador, Recepcionista según permisos |
| C6 | Confirmar desactivación | Solicita confirmar el cambio de estado del cliente. | Administrador |

**Consideraciones funcionales:**

- El registro requiere nombre, documento y teléfono. El correo electrónico es opcional.
- El sistema debe validar los campos obligatorios y evitar documentos duplicados.
- La búsqueda debe permitir consultar por nombre o documento.
- Las operaciones de guardado y actualización deben informar su resultado.
- Un cliente inactivo no puede iniciar sesión.
- La desactivación debe solicitar confirmación previa.

### Grupo D. Gestión de membresías y beneficios

Estas pantallas permiten configurar los tipos de membresía, administrar sus beneficios y gestionar la vigencia de las membresías asignadas a los clientes.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| D1 | Tipos de membresía | Presenta el catálogo de membresías disponibles. | Administrador, Recepcionista |
| D2 | Crear o configurar membresía | Permite definir el nombre, precio, duración y unidad de duración. | Administrador |
| D3 | Asignar membresía | Permite seleccionar un cliente y una membresía para realizar la asignación. | Administrador, Recepcionista |
| D4 | Confirmar asignación o reemplazo | Informa las condiciones de la asignación y solicita confirmación cuando corresponda. | Administrador, Recepcionista |
| D5 | Membresías por estado | Permite consultar membresías activas, vencidas y próximas a vencer. | Administrador, Recepcionista |
| D6 | Renovar membresía | Permite registrar una nueva vigencia para la membresía de un cliente. | Administrador, Recepcionista |
| D7 | Catálogo de beneficios | Permite consultar y administrar los beneficios del gimnasio. | Administrador |
| D8 | Actividades y beneficios incluidos | Permite configurar las actividades, límites de inscripción y beneficios informativos de cada tipo de membresía. | Administrador |

**Consideraciones funcionales:**

- La duración de una membresía se define en días o meses.
- La fecha de vencimiento se calcula de acuerdo con la duración configurada.
- Un cliente puede tener como máximo una membresía activa.
- Si se asigna una nueva membresía mientras existe otra activa, se debe solicitar confirmación para reemplazarla.
- La renovación registra una nueva vigencia desde la fecha actual y la membresía anterior queda en estado reemplazado.
- Los límites de inscripción pueden definirse por período o configurarse sin límite.
- Los beneficios son informativos; no se debe incorporar un módulo para controlar su utilización.
- La gestión de membresías no incluye el procesamiento de pagos.

### Grupo E. Actividades, espacios y programación

Estas pantallas permiten administrar las actividades del gimnasio, los espacios disponibles y su programación.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| E1 | Catálogo de actividades | Presenta las actividades registradas y sus datos principales. | Administrador |
| E2 | Crear o editar actividad | Permite gestionar el nombre, descripción y capacidad máxima de una actividad. | Administrador |
| E3 | Gestión de espacios | Presenta los espacios registrados y permite consultar sus capacidades. | Administrador |
| E4 | Registrar o editar espacio | Permite registrar un espacio o actualizar su información. | Administrador |
| E5 | Programación de actividades | Permite consultar las actividades programadas por día y horario. | Administrador |
| E6 | Programar actividad | Formulario para definir actividad, día, hora de inicio, hora de fin, espacio y entrenador. | Administrador |
| E7 | Detalle de programación | Muestra los datos de una actividad programada y sus inscripciones. | Administrador, Recepcionista según permisos |
| E8 | Cambiar entrenador | Permite asignar o reemplazar el entrenador de una programación. | Administrador |
| E9 | Confirmar cancelación | Solicita confirmar la cancelación de una actividad programada. | Administrador |

**Consideraciones funcionales:**

- La hora de finalización debe ser posterior a la hora de inicio.
- La programación no puede generar cruces de horario en un mismo espacio.
- El entrenador debe estar activo y disponible dentro de su horario fijo.
- Un entrenador no puede tener programaciones que se crucen entre sí.
- La capacidad de la actividad y la del espacio deben respetarse.
- La consulta de una programación debe permitir identificar el entrenador, el espacio, el horario y las inscripciones.
- Al cancelar una actividad programada, el sistema debe cancelar automáticamente sus inscripciones activas.
- El sistema debe informar los errores de validación antes de completar una operación que incumpla las reglas establecidas.

### Grupo F. Gestión de entrenadores

Estas pantallas permiten administrar los datos de los entrenadores, sus horarios y sus asignaciones.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| F1 | Listado de entrenadores | Presenta los entrenadores registrados. | Administrador, Recepcionista |
| F2 | Registrar entrenador | Formulario para crear el registro de un entrenador. | Administrador, Recepcionista |
| F3 | Detalle de entrenador | Muestra los datos del entrenador y las actividades asignadas que corresponda consultar. | Administrador, Recepcionista |
| F4 | Editar entrenador | Permite actualizar la información autorizada del entrenador. | Administrador |
| F5 | Horario fijo del entrenador | Permite definir los días y las horas disponibles del entrenador. | Administrador, Recepcionista |
| F6 | Confirmar desactivación | Solicita confirmar el cambio de estado del entrenador. | Administrador |

**Consideraciones funcionales:**

- El registro requiere nombre, documento y teléfono. El correo electrónico es opcional.
- El documento debe ser único.
- El entrenador debe tener un horario fijo registrado para validar sus programaciones.
- Antes de desactivar un entrenador, sus actividades programadas deben ser reasignadas.
- El entrenador puede consultar las actividades que tiene asignadas y sus horarios, desde las vistas correspondientes a su rol.

### Grupo G. Usuarios, roles, permisos y configuración

Estas pantallas permiten administrar las cuentas de acceso y configurar los permisos del sistema.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| G1 | Listado de usuarios | Presenta las cuentas registradas en el sistema. | Administrador |
| G2 | Registrar usuario administrativo | Permite crear usuarios con rol de administrador o recepcionista. | Administrador |
| G3 | Roles y permisos | Permite consultar los roles y configurar los permisos asociados a cada uno. | Administrador |
| G4 | Crear credenciales | Permite generar credenciales de acceso para clientes y entrenadores. | Administrador, Recepcionista según permisos |
| G5 | Configuración de avisos | Permite establecer los días de anticipación para considerar una membresía próxima a vencer. | Administrador |

**Consideraciones funcionales:**

- El sistema contempla cuatro roles fijos: Administrador, Recepcionista, Entrenador y Cliente.
- El administrador puede configurar los permisos de cada rol.
- Las opciones disponibles deben respetar los permisos asignados.
- La creación de credenciales debe corresponder al usuario registrado.
- La configuración de avisos debe reflejarse en las consultas de membresías y en el panel de control.

### Grupo H. Vistas del cliente

Estas pantallas permiten al cliente consultar su información, revisar las actividades disponibles y administrar sus propias inscripciones.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| H1 | Mi información | Presenta la información personal del cliente que tiene iniciada la sesión. | Cliente |
| H2 | Mi membresía | Muestra el tipo de membresía, estado, vencimiento, actividades incluidas, límites y beneficios. | Cliente |
| H3 | Actividades disponibles | Presenta las actividades programadas, sus horarios, espacios, entrenadores y cupos disponibles. | Cliente |
| H4 | Detalle de actividad | Muestra la información de una actividad y las condiciones de inscripción. | Cliente |
| H5 | Confirmar inscripción | Permite confirmar la inscripción a una actividad permitida por la membresía. | Cliente |
| H6 | Restricción de inscripción | Informa cuando la actividad no está incluida en la membresía, se alcanzó el límite o no hay cupos disponibles. | Cliente |
| H7 | Mis inscripciones | Presenta las actividades en las que el cliente tiene inscripciones activas. | Cliente |
| H8 | Cancelar inscripción | Solicita confirmar la cancelación de una inscripción propia. | Cliente |

**Consideraciones funcionales:**

- El cliente solo puede consultar su propia información.
- Para inscribirse, debe tener una membresía activa que incluya la actividad.
- Debe disponer de límites de inscripción, cuando estos apliquen, y existir cupos disponibles.
- No se permite mantener más de una inscripción activa en la misma programación.
- El cliente puede cancelar sus propias inscripciones.
- La cancelación libera el cupo y deja de contar para el límite de inscripciones.
- Los mensajes deben explicar por qué no se permite una inscripción cuando no se cumplen las condiciones.

### Grupo I. Vistas del entrenador

Estas pantallas permiten al entrenador consultar sus actividades asignadas y sus horarios.

| Código | Pantalla | Descripción | Roles |
|---|---|---|---|
| I1 | Mis actividades | Presenta las actividades programadas que tiene asignadas el entrenador autenticado. | Entrenador |
| I2 | Mi horario | Permite consultar los días y horarios de sus actividades programadas. | Entrenador |
| I3 | Detalle de actividad asignada | Presenta la información de una actividad que tiene asignada. | Entrenador |

**Consideraciones funcionales:**

- El entrenador solo debe acceder a las funcionalidades autorizadas para su perfil.
- Las consultas deben corresponder a sus propias asignaciones.
- La interfaz es de consulta para las funciones descritas; no debe asumir que el entrenador puede modificar la programación si los requerimientos no le conceden esa facultad.

## 4. Reglas generales de las pantallas web

- Las pantallas protegidas requieren que el usuario haya iniciado sesión.
- La navegación y las acciones deben respetar el rol y los permisos configurados.
- Los formularios deben identificar los campos obligatorios y mostrar mensajes de validación comprensibles.
- Las operaciones importantes deben informar el resultado y solicitar confirmación cuando corresponda.
- Los listados deben facilitar la consulta de los registros y el acceso a las acciones autorizadas.
- Las pantallas deben mantener una presentación coherente en títulos, botones, formularios, tablas y mensajes.
- Las acciones de modificación o desactivación deben estar disponibles únicamente para los roles autorizados.
- No deben agregarse funcionalidades de pagos ni de control de asistencia, ya que no forman parte del alcance funcional definido para esta documentación.

## 5. Evidencias gráficas del prototipo web

### 5.1. Acceso y recuperación de contraseña

#### 5.1.1. Inicio de sesión

![](../../media/web/capturas/A1-Iniciar_sesión.png)

#### 5.1.2. Inicio de sesión con error

![](../../media/web/capturas/A2-Iniciar_sesión_error.png)

#### 5.1.3. Solicitar recuperación de contraseña

![](../../media/web/capturas/A3-Recuperar_contraseña_solicitar.png)

#### 5.1.4. Ingresar código de recuperación

![](../../media/web/capturas/A4-Recuperar_contraseña_código.png)

#### 5.1.5. Código de recuperación inválido

![](../../media/web/capturas/A5-Recuperar_contraseña_código_inválido.png)

#### 5.1.6. Establecer nueva contraseña

![](../../media/web/capturas/A6-Recuperar_contraseña_nueva.png)

#### 5.1.7. Inicio de sesión con contraseña actualizada

![](../../media/web/capturas/A7-Iniciar_sesión_contraseña_actualizada.png)

### 5.2. Paneles de inicio

#### 5.2.1. Dashboard del administrador

![](../../media/web/capturas/B1-Dashboard_(Administrador).png)

#### 5.2.2. Inicio del recepcionista

![](../../media/web/capturas/B2-Inicio_(Recepcionista).png)

### 5.3. Gestión de clientes

#### 5.3.1. Listado de clientes

![](../../media/web/capturas/C1-Clientes_listado.png)

#### 5.3.2. Búsqueda de clientes sin resultados

![](../../media/web/capturas/C2-Clientes_búsqueda_sin_resultados.png)

#### 5.3.3. Formulario de registro de cliente

![](../../media/web/capturas/C3-Registrar_cliente_formulario.png)

#### 5.3.4. Detalle del cliente

![](../../media/web/capturas/C4-Cliente_detalle.png)

#### 5.3.5. Confirmación de desactivación de cliente

![](../../media/web/capturas/C5-Cliente_confirmar_desactivación.png)

### 5.4. Gestión de membresías y beneficios

#### 5.4.1. Tipos de membresía

![](../../media/web/capturas/D1-Membresías_tipos_de_membresía.png)

#### 5.4.2. Formulario para crear tipo de membresía

![](../../media/web/capturas/D2-Crear_tipo_de_membresía_formulario.png)

#### 5.4.3. Formulario para asignar membresía

![](../../media/web/capturas/D3-Asignar_membresía_formulario.png)

#### 5.4.4. Confirmación de reemplazo de membresía

![](../../media/web/capturas/D4-Asignar_membresía_confirmar_reemplazo.png)

#### 5.4.5. Membresías por estado

![](../../media/web/capturas/D5-Membresías_por_estado.png)

#### 5.4.6. Confirmación de renovación de membresía

![](../../media/web/capturas/D6-Renovar_membresía_confirmar.png)

#### 5.4.7. Beneficios

![](../../media/web/capturas/D7-Beneficios.png)

### 5.5. Gestión de actividades, espacios y programación

#### 5.5.1. Catálogo de actividades

![](../../media/web/capturas/E1-Actividades_catálogo.png)

#### 5.5.2. Gestión de espacios

![](../../media/web/capturas/E2-Espacios.png)

#### 5.5.3. Programación semanal

![](../../media/web/capturas/E3-Programación_semanal.png)

#### 5.5.4. Programación de actividad con validación

![](../../media/web/capturas/E4-Programar_actividad_validación.png)

#### 5.5.5. Detalle de programación e inscritos

![](../../media/web/capturas/E5-Programación_detalle_e%20inscritos.png)

#### 5.5.6. Confirmación de cancelación de programación

![](../../media/web/capturas/E6-Cancelar_programación_confirmar.png)

### 5.6. Gestión de entrenadores

#### 5.6.1. Listado de entrenadores

![](../../media/web/capturas/F1-Entrenadores_listado.png)

#### 5.6.2. Formulario de registro de entrenador

![](../../media/web/capturas/F2-Registrar_entrenador_formulario.png)

#### 5.6.3. Detalle del entrenador

![](../../media/web/capturas/F3-Entrenador_detalle.png)

#### 5.6.4. Desactivación de entrenador no permitida

![](../../media/web/capturas/F4-Desactivar_entrenador_no_permitido.png)

### 5.7. Gestión de usuarios, roles, permisos y configuración

#### 5.7.1. Gestión de usuarios

![](../../media/web/capturas/G1-Usuarios.png)

#### 5.7.2. Formulario de registro de usuario administrativo

![](../../media/web/capturas/G2-Registrar_usuario_administrativo.png)

#### 5.7.3. Gestión de roles y permisos

![](../../media/web/capturas/G3-Roles_y_permisos.png)

#### 5.7.4. Creación de credenciales

![](../../media/web/capturas/G4-Crear_credenciales.png)

#### 5.7.5. Configuración

![](../../media/web/capturas/G5-Configuración.png)

### 5.8. Funcionalidades del cliente

#### 5.8.1. Mi membresía

![](../../media/web/capturas/H1_Mi_membresía_(Cliente).png)

#### 5.8.2. Actividades disponibles

![](../../media/web/capturas/H2-Actividades_disponibles_(Cliente).png)

#### 5.8.3. Confirmación de inscripción

![](../../media/web/capturas/H3-Confirmar_inscripción_(Cliente).png)

#### 5.8.4. Límite de inscripción alcanzado

![](../../media/web/capturas/H4-Límite_alcanzado_(Cliente).png)

#### 5.8.5. Mis inscripciones

![](../../media/web/capturas/H5-Mis_inscripciones_(Cliente).png)

#### 5.8.6. Cancelación de inscripción

![](../../media/web/capturas/H6-Cancelar-inscripción_(Cliente).png)

### 5.9. Funcionalidades del entrenador

#### 5.9.1. Mis actividades

![](../../media/web/capturas/I1-Mis_actividades_(Entrenador).png)

#### 5.9.2. Mi horario

![](../../media/web/capturas/I2-Mi_horario_(Entrenador).png)
