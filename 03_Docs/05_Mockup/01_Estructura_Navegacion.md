# Estructura de Navegación — Sistema de Gestión de Gimnasio

## 1. Objetivo

Definir la estructura de navegación del Sistema de Gestión de Gimnasio, identificando los módulos principales, los roles que acceden a ellos y las relaciones entre las pantallas.

La navegación debe facilitar el acceso a las funcionalidades autorizadas para cada usuario y mantener la coherencia entre las versiones web para PC y móvil.

## 2. Roles del sistema

El sistema contempla cuatro roles principales:

| Rol | Responsabilidad general |
|---|---|
| Administrador | Gestionar la información general del gimnasio, configurar las membresías, administrar actividades, entrenadores, usuarios y permisos, y consultar el panel de control. |
| Recepcionista | Realizar operaciones de atención, registrar y consultar clientes, gestionar membresías y apoyar la gestión de entrenadores y actividades según sus permisos. |
| Entrenador | Consultar las actividades que tiene asignadas y sus horarios. |
| Cliente | Consultar su información personal, membresía, actividades disponibles e inscripciones. |

## 3. Módulos principales

### 3.1. Acceso y autenticación

Incluye las funcionalidades para acceder al sistema y recuperar las credenciales.

- Iniciar sesión.
- Cerrar sesión.
- Recuperar contraseña.
- Ingresar el código de recuperación.
- Registrar una nueva contraseña.
- Mostrar mensajes de error o confirmación.

El sistema debe permitir el acceso únicamente a usuarios activos y mostrar las funcionalidades autorizadas según sus permisos.

### 3.2. Panel de control

Disponible para el administrador.

Permite consultar información resumida sobre:

- Clientes activos.
- Membresías activas.
- Membresías vencidas.
- Membresías próximas a vencer.
- Actividades programadas.

También permite acceder a la configuración de los días de aviso de vencimiento de las membresías.

### 3.3. Gestión de clientes

Permite administrar la información de los clientes registrados.

Incluye:

- Consultar el listado de clientes.
- Buscar clientes por nombre o documento.
- Registrar un cliente.
- Consultar el detalle de un cliente.
- Editar sus datos.
- Consultar la membresía asociada.
- Desactivar o reactivar un cliente, según los permisos correspondientes.

### 3.4. Gestión de membresías y beneficios

Permite administrar los tipos de membresía, su asignación y su vigencia.

Incluye:

- Consultar los tipos de membresía.
- Crear y configurar tipos de membresía.
- Administrar el catálogo de beneficios.
- Definir las actividades incluidas y sus límites.
- Asignar una membresía a un cliente.
- Consultar membresías activas, vencidas y próximas a vencer.
- Renovar una membresía.
- Consultar fechas de inicio y vencimiento.

Los beneficios son informativos y no requieren un módulo para controlar su utilización.

### 3.5. Gestión de actividades, espacios y programación

Permite administrar las actividades ofrecidas por el gimnasio y sus horarios.

Incluye:

- Consultar y administrar el catálogo de actividades.
- Consultar y administrar los espacios.
- Programar actividades.
- Asignar o cambiar entrenadores.
- Consultar las actividades programadas.
- Consultar los clientes inscritos.
- Cancelar una programación.
- Consultar cupos disponibles.

La programación debe respetar los horarios de los entrenadores, la disponibilidad de los espacios y la capacidad máxima de cada actividad.

### 3.6. Gestión de entrenadores

Permite administrar la información de los entrenadores y sus horarios.

Incluye:

- Consultar el listado de entrenadores.
- Registrar un entrenador.
- Consultar su información.
- Editar sus datos, según los permisos.
- Definir su horario fijo.
- Consultar las actividades asignadas.
- Cambiar su estado, respetando las reglas de reasignación de actividades programadas.

### 3.7. Gestión de usuarios, roles y permisos

Permite administrar las cuentas de acceso al sistema.

Incluye:

- Consultar los usuarios registrados.
- Registrar usuarios con rol de administrador o recepcionista.
- Crear credenciales para clientes y entrenadores.
- Consultar los roles.
- Configurar los permisos de cada rol.

### 3.8. Funcionalidades del cliente

El cliente accede a las funcionalidades correspondientes a su propia cuenta.

Incluye:

- Consultar su información personal.
- Consultar su membresía y su vigencia.
- Consultar las actividades y los beneficios incluidos en su membresía.
- Consultar las actividades programadas disponibles.
- Consultar los cupos y límites de inscripción.
- Inscribirse en actividades permitidas.
- Cancelar sus propias inscripciones.
- Consultar sus inscripciones activas.

### 3.9. Funcionalidades del entrenador

El entrenador accede a las funcionalidades relacionadas con sus asignaciones.

Incluye:

- Consultar sus actividades programadas.
- Consultar sus horarios.
- Consultar la información de las actividades asignadas.

## 4. Navegación según el rol

| Módulo | Administrador | Recepcionista | Entrenador | Cliente |
|---|---|---|---|---|
| Acceso y autenticación | Sí | Sí | Sí | Sí |
| Panel de control | Sí | No especificado como acceso general | No | No |
| Gestión de clientes | Sí | Sí, según permisos | No | Consulta sus propios datos según las funcionalidades habilitadas |
| Gestión de membresías | Sí | Sí, según permisos | No | Consulta su propia membresía |
| Actividades y programación | Sí | Consulta las actividades y sus inscritos, según permisos | Consulta sus asignaciones | Consulta, se inscribe y cancela sus propias inscripciones |
| Gestión de entrenadores | Sí | Consulta y registra según permisos | Consulta sus datos y asignaciones disponibles | Consulta el entrenador asignado a las actividades |
| Usuarios, roles y permisos | Sí | Funciones limitadas a las credenciales autorizadas | No | No |
| Configuración de avisos | Sí | No | No | No |

## 5. Organización de la navegación por plataforma

### 5.1. Versión web para PC

La interfaz web organizará las funcionalidades mediante elementos de navegación adecuados para pantallas de computador.

La distribución concreta de los menús, encabezados, paneles y accesos a los módulos se documentará en:

`02_Diseño_Pantallas/web.md`

Los componentes visuales específicos de la plataforma se documentarán en:

`03_Componentes_Visuales/web.md`

### 5.2. Versión móvil

La interfaz móvil adaptará la navegación a pantallas pequeñas y a la interacción táctil.

La distribución concreta de los menús, encabezados y accesos a los módulos se documentará en:

`02_Diseño_Pantallas/movil.md`

Los componentes visuales específicos de la plataforma se documentarán en:

`03_Componentes_Visuales/movil.md`

## 6. Reglas generales de navegación

- El usuario debe iniciar sesión para acceder a las funcionalidades protegidas.
- Las opciones disponibles deben corresponder al rol y a los permisos del usuario autenticado.
- El sistema debe permitir cerrar sesión.
- Las pantallas deben ofrecer mecanismos claros para regresar a los listados o secciones anteriores cuando corresponda.
- Los formularios deben permitir confirmar o cancelar las operaciones según el proceso.
- Las operaciones que requieran confirmación deben informar claramente qué acción se realizará.
- Los errores de validación deben comunicarse mediante mensajes comprensibles.
- La navegación no debe permitir que un usuario consulte o modifique información fuera de los permisos asignados.
- Las funcionalidades de cada plataforma deben respetar las reglas de negocio definidas en los requerimientos del sistema.
