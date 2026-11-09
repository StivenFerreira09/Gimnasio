**# 1. Descripción del problema**

Actualmente, la gestión de un gimnasio puede realizarse de manera manual o utilizando diferentes herramientas para controlar clientes, membresías, actividades y entrenadores. Esto puede generar problemas como:

- Información de clientes desorganizada.
- Dificultad para controlar las membresías activas y vencidas.
- Dificultad para organizar las actividades, sus horarios y los espacios donde se realizan.
- Dificultad para controlar qué actividades y beneficios incluye cada plan de membresía.
- Falta de información centralizada.
- Mayor cantidad de trabajo manual para el personal administrativo.

**## 1.1. Problema central**

El gimnasio necesita un sistema centralizado que permita gestionar de manera eficiente clientes, membresías, actividades y entrenadores, reduciendo el trabajo manual y facilitando el acceso a la información.

**# 2. Objetivo del sistema**

Desarrollar un Sistema de Gestión de Gimnasio que permita administrar de manera centralizada la información de los clientes, membresías, actividades y entrenadores, facilitando las actividades administrativas y mejorando la organización del gimnasio.

**## 2.1. Objetivos específicos**

- Registrar y administrar clientes.
- Permitir que el administrador parametrice los tipos de membresía, las actividades que incluyen y sus beneficios, según el modelo de negocio del gimnasio.
- Administrar las actividades del gimnasio, su programación y los espacios donde se realizan.
- Gestionar entrenadores y sus horarios.
- Permitir la inscripción de clientes a las actividades incluidas en su membresía.
- Generar reportes sobre la información del gimnasio.
- Controlar el acceso a las funcionalidades según el rol y los permisos asignados.

**# 3. Usuarios del sistema**

El sistema tendrá principalmente cuatro tipos de usuarios:

| **Usuario** | **Función** |
| --- | --- |
| **Administrador** | Es el usuario encargado de administrar y supervisar la información general del gimnasio y de parametrizar el sistema según su modelo de negocio. Tiene todas las capacidades operativas del Recepcionista y, además, las funciones exclusivas de administración.<br><br>Podrá:<br>• Registrar y consultar clientes; editar y desactivar clientes.<br>• Parametrizar tipos de membresía, sus actividades incluidas y sus beneficios.<br>• Administrar membresías: consultar, asignar y renovar.<br>• Gestionar actividades, espacios y la programación de actividades.<br>• Gestionar entrenadores, editar y cambiar su estado, y administrar sus horarios.<br>• Consultar el dashboard y configurar los días de aviso de vencimiento.<br>• Registrar usuarios de los cuatro roles con sus datos y credenciales en un único flujo; la primera cuenta Administrador se crea mediante configuración inicial controlada.<br>• Administrar roles y configurar los permisos de cada rol. |
| **Recepcionista** | Es el usuario encargado de realizar las actividades operativas y de atención del gimnasio mediante el sistema.<br><br>Podrá:<br>• Registrar, consultar y editar clientes.<br>• Consultar el catálogo, asignar y renovar membresías.<br>• Consultar actividades programadas, sus inscritos y entrenadores.<br>• Registrar y consultar entrenadores.<br>• Definir el horario fijo de los entrenadores.<br>• Registrar clientes y entrenadores con sus datos y credenciales en un único flujo.<br>No podrá acceder a las funciones exclusivas de administración. |
| **Entrenador** | Es el usuario encargado de dirigir las actividades programadas que le sean asignadas.<br><br>Podrá:<br>• Iniciar sesión.<br>• Consultar las actividades que tiene asignadas.<br>• Consultar sus horarios.<br>• Consultar la información de las actividades correspondientes. |
| **Cliente** | Es el usuario que utiliza los servicios del gimnasio y que tendrá acceso al sistema mediante una cuenta personal.<br><br>Podrá:<br>• Iniciar sesión.<br>• Consultar su información personal.<br>• Consultar su membresía, las actividades y beneficios que incluye y sus límites.<br>• Consultar el estado y vencimiento de su membresía.<br>• Consultar las actividades programadas disponibles.<br>• Inscribirse en actividades incluidas en su membresía.<br>• Cancelar sus inscripciones.<br>• Consultar sus actividades inscritas. |

**# 4. Épicas**

**## 4.1. Gestión de clientes**

El sistema permitirá administrar la información de los clientes del gimnasio, facilitando su registro, consulta y actualización.

El sistema permitirá:

- Registrar nuevos clientes.
- Consultar la información de los clientes.
- Editar los datos de los clientes.
- Buscar clientes registrados.
- Desactivar clientes cuando ya no hagan parte del gimnasio, bloqueando su acceso al sistema.
- Consultar la información de la membresía asociada a cada cliente.

**## 4.2. Gestión de membresías**

El sistema permitirá que el administrador parametrice las membresías ofrecidas por el gimnasio según su modelo de negocio, y controlar su asignación, vigencia y renovación.

El sistema permitirá:

- Crear diferentes tipos de membresía.
- Definir el precio de cada membresía.
- Definir la duración de cada membresía y su unidad (días o meses).
- Gestionar el catálogo de beneficios del gimnasio.
- Definir las actividades que incluye cada tipo de membresía, con su límite de inscripciones y el período del límite.
- Definir los beneficios informativos que incluye cada tipo de membresía.
- Asignar una membresía a un cliente.
- Consultar las membresías activas.
- Consultar las membresías vencidas.
- Renovar membresías.
- Consultar las fechas de vencimiento.

**## 4.3. Gestión de actividades**

El sistema permitirá administrar las actividades ofrecidas por el gimnasio, programar cuándo, dónde y con qué entrenador se realizan, y controlar la inscripción de los clientes.

El sistema permitirá:

- Gestionar el catálogo de actividades con su capacidad máxima.
- Gestionar los espacios del gimnasio.
- Programar actividades definiendo día, horario, espacio y entrenador.
- Cambiar el entrenador de una actividad programada.
- Cancelar actividades programadas.
- Consultar actividades programadas disponibles.
- Inscribir clientes según las actividades incluidas en su membresía.
- Cancelar inscripciones.
- Consultar a los clientes inscritos.

**## 4.4. Gestión de entrenadores**

El sistema permitirá administrar la información de los entrenadores, sus horarios y su asignación a las actividades programadas del gimnasio.

El sistema permitirá:

- Registrar entrenadores.
- Editar información.
- Consultar entrenadores.
- Definir el horario fijo de cada entrenador.
- Asignar entrenadores a actividades programadas.
- Cambiar el estado de un entrenador, reasignando previamente sus actividades programadas.
- Consultar horarios de los entrenadores.

**## 4.5. Dashboard y reportes**

El sistema proporcionará al administrador un panel con información resumida sobre la operación del gimnasio.

El administrador podrá consultar:

- Cantidad de clientes activos.
- Membresías activas.
- Membresías vencidas.
- Membresías próximas para vencer, según los días de aviso que él mismo configure.
- Actividades programadas.

**## 4.6. Autenticación y permisos**

El sistema permitirá controlar el acceso de los usuarios y administrar los permisos de acuerdo con el rol asignado.

El sistema contará con:

- Inicio de sesión.
- Cierre de sesión.
- Recuperación de contraseña exclusivamente mediante el correo electrónico registrado.
- Creación de cuentas de usuario.
- Administración de roles.
- Configuración de permisos por rol.

Los roles contemplados serán:

- Administrador.
- Recepcionista.
- Entrenador.
- Cliente.

**## 4.7. User Story Map**

![User Story Map](user-story-map.png)

**# 5. Metodología de Priorización, Estimación y Criterios de Aceptación**

Con base en la retroalimentación recibida, la priorización de las historias de usuario se realizó mediante dos técnicas reconocidas, las cuales se aplican de forma complementaria.

**## 5.1. MoSCoW - Definiciones**

| **Categoría** | **Significado** |
| --- | --- |
| **M — Must have** | Indispensable. Sin esta funcionalidad el sistema no cumple su propósito. Define el MVP. |
| **S — Should have** | Importante y de alto impacto, pero el sistema puede operar temporalmente sin ella. |
| **C — Could have** | Deseable. Bajo impacto si se pospone. |
| **W — Won't have (por ahora)** | Queda fuera del alcance de esta versión del proyecto. |

**## 5.2. Valor vs. Esfuerzo - Definiciones**

Cada historia se evalúa en dos ejes (Alto / Medio / Bajo) y se ubica en uno de los cuatro cuadrantes de la matriz:

| **Categoría** | **Descripción** | **Acción recomendada** |
| --- | --- | --- |
| **Quick win** | Alto valor, bajo esfuerzo. | Desarrollar primero. |
| **Proyecto mayor** | Alto valor, alto esfuerzo. | Planificar bien; son el núcleo del sistema. |
| **Relleno** | Bajo valor, bajo esfuerzo. | Hacer si sobra tiempo. |
| **Tarea ingrata** | Bajo valor, alto esfuerzo. | Evitar o posponer. |

Cuando el valor o el esfuerzo es **Medio**, el cuadrante se asigna con esta regla:

| **Cuadrante** | **Regla de asignación** |
| --- | --- |
| **Quick win** | Valor Alto o Medio y esfuerzo Bajo. |
| **Proyecto mayor** | Valor Alto y esfuerzo Medio o Alto. |
| **Relleno** | Valor Medio o Bajo y esfuerzo Medio, o valor Bajo y esfuerzo Bajo. |
| **Tarea ingrata** | Valor Medio o Bajo y esfuerzo Alto. |

MoSCoW define qué entra en el proyecto; Valor vs. Esfuerzo define el orden de construcción dentro de lo que ya fue aceptado.

**## 5.3. Formato de criterios de aceptación**

Los criterios de aceptación se expresan mediante escenarios que utilizan la estructura GIVEN (Dado que), WHEN (Cuando) y THEN (Entonces), con el propósito de describir las condiciones necesarias para validar cada historia de usuario.

**# 6. Historias de usuario**

**## 6.1. Gestión de clientes**

**### 6.1.1. HU-01 Registrar cliente**

Como recepcionista o administrador, quiero registrar un cliente con sus datos personales y credenciales de acceso en un único flujo, para que pueda utilizar los servicios del gimnasio y acceder al sistema.

**Dependencias:** Ninguna.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un administrador o recepcionista autorizado está en el formulario de registro | ingresa nombre, documento, correo electrónico obligatorio y único, teléfono opcional, contraseña y confirmación de contraseña | el sistema registra la ficha del cliente y sus credenciales conjuntamente, y permite que inicie sesión con su correo electrónico y contraseña |
| **Alternativo (más relevante)** | el documento o correo ya está registrado, el correo está vacío o tiene un formato inválido, o las contraseñas no coinciden | intenta guardar el registro | el sistema no guarda la información y muestra el mensaje de validación correspondiente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.1.2. HU-02 Consultar clientes**

Como administrador o recepcionista, quiero consultar los clientes registrados, para acceder a su información y gestionar su atención.

**Dependencias:** HU-01.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen clientes registrados | el usuario autorizado ingresa al módulo de clientes | el sistema muestra el listado de clientes |
| **Alternativo (más relevante)** | no existen clientes registrados | el usuario ingresa al módulo de clientes | el sistema muestra un mensaje indicando que no hay clientes registrados |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Bajo | Quick win | 2 |

**### 6.1.3. HU-03 Buscar clientes**

Como administrador o recepcionista, quiero buscar clientes por sus datos, para encontrar rápidamente un registro específico.

**Dependencias:** HU-01, HU-02.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen clientes registrados | el usuario ingresa un criterio de búsqueda válido | el sistema muestra los clientes que coinciden con el criterio |
| **Alternativo (más relevante)** | existen clientes registrados | el usuario ingresa un criterio que no coincide con ningún registro | el sistema informa que no se encontraron resultados |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Medio | Bajo | Quick win | 2 |

**### 6.1.4. HU-04 Editar cliente**

Como administrador o recepcionista, quiero editar la información de un cliente, para mantener sus datos actualizados.

**Dependencias:** HU-01, HU-02.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe un cliente registrado | el usuario autorizado modifica sus datos y guarda los cambios | el sistema actualiza la información del cliente |
| **Alternativo (más relevante)** | el correo electrónico ingresado ya pertenece a otro usuario o el documento está duplicado | el usuario intenta guardar los cambios | el sistema rechaza la actualización y muestra el error correspondiente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Medio | Medio | Proyecto mayor | 5 |

**### 6.1.5. HU-05 Desactivar cliente**

Como administrador, quiero desactivar un cliente, para impedir que continúe utilizando el sistema cuando ya no haga parte del gimnasio.

**Dependencias:** HU-01, HU-02.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe un cliente activo | el administrador confirma su desactivación | el sistema cambia su estado y bloquea su acceso |
| **Alternativo (más relevante)** | el administrador selecciona cancelar la operación | confirma que no desea continuar | el sistema conserva el estado anterior del cliente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**## 6.2. Gestión de membresías**

**### 6.2.1. HU-06 Crear tipos de membresía**

Como administrador, quiero crear tipos de membresía, para ofrecer diferentes planes de servicio a los clientes.

**Dependencias:** Ninguna.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el administrador está en el módulo de membresías | ingresa nombre, precio, duración y unidad de duración | el sistema registra el tipo de membresía |
| **Alternativo (más relevante)** | los datos obligatorios están incompletos o no son válidos | el administrador intenta guardar | el sistema muestra los errores y no registra la membresía |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.2.2. HU-07 Gestionar beneficios**

Como administrador, quiero gestionar el catálogo de beneficios, para definir los beneficios informativos que puede incluir cada tipo de membresía.

**Dependencias:** HU-06.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el administrador está en el catálogo de beneficios | registra o edita un beneficio | el sistema guarda la información del beneficio |
| **Alternativo (más relevante)** | el beneficio tiene información obligatoria incompleta | intenta guardarlo | el sistema muestra el error correspondiente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**### 6.2.3. HU-08 Configurar actividades y beneficios de membresía**

Como administrador, quiero definir las actividades, sus límites de inscripción y los beneficios incluidos en cada tipo de membresía, para configurar los servicios ofrecidos por cada plan.

**Dependencias:** HU-06, HU-07.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe un tipo de membresía | el administrador selecciona actividades, límites, períodos y beneficios | el sistema guarda la configuración del plan |
| **Alternativo (más relevante)** | la configuración contiene datos inválidos | intenta guardar | el sistema muestra los errores correspondientes y conserva la configuración anterior |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Alto | Proyecto mayor | 8 |

**### 6.2.4. HU-09 Asignar membresía**

Como administrador o recepcionista, quiero asignar una membresía a un cliente, para habilitar los servicios incluidos en el plan seleccionado.

**Dependencias:** HU-01, HU-06, HU-08.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe un cliente y un tipo de membresía disponible | el usuario autorizado selecciona el cliente y el tipo de membresía | el sistema asigna la membresía y registra su período de vigencia |
| **Membresía activa existente** | el cliente ya tiene una membresía activa | el usuario intenta asignar una nueva membresía y confirma la operación | el sistema informa que la nueva membresía comienza hoy y que la anterior deja de estar vigente desde hoy; conserva la anterior en el historial con estado Reemplazada |
| **Alternativo (más relevante)** | el cliente o el tipo de membresía no existe o no está disponible | el usuario intenta realizar la asignación | el sistema informa el problema y no realiza la operación |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.2.5. HU-10 Consultar membresías**

Como administrador o recepcionista, quiero consultar las membresías de los clientes, para conocer su estado y vigencia.

**Dependencias:** HU-09.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen membresías asignadas | el usuario autorizado ingresa al módulo | el sistema muestra las membresías y sus estados |
| **Alternativo (más relevante)** | no existen membresías asignadas | el usuario ingresa al módulo | el sistema informa que no hay membresías registradas |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Bajo | Quick win | 2 |

**### 6.2.6. HU-11 Renovar membresía**

Como administrador o recepcionista, quiero renovar una membresía, para mantener disponible el servicio para el cliente.

**Dependencias:** HU-09, HU-10.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe una membresía de un cliente que puede renovarse | el usuario autorizado selecciona la renovación y confirma la operación | el sistema informa las consecuencias, registra la nueva membresía con inicio desde hoy y deja de dar vigencia a la anterior desde hoy, conservándola en el historial con estado Reemplazada |
| **Alternativo (más relevante)** | el usuario decide no continuar con la renovación | cancela la confirmación | el sistema conserva la membresía y su estado anterior |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**## 6.3. Gestión de actividades**

**### 6.3.1. HU-12 Gestionar catálogo de actividades**

Como administrador, quiero gestionar el catálogo de actividades, para definir las actividades que ofrece el gimnasio y su capacidad máxima.

**Dependencias:** Ninguna.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el administrador está en el módulo de actividades | registra o edita una actividad con su capacidad máxima | el sistema guarda la información |
| **Alternativo (más relevante)** | la información obligatoria está incompleta o es inválida | intenta guardar | el sistema muestra los errores correspondientes |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.3.2. HU-13 Gestionar espacios**

Como administrador, quiero gestionar los espacios del gimnasio, para identificar los lugares disponibles para realizar actividades.

**Dependencias:** Ninguna.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el administrador está en el módulo de espacios | registra o edita un espacio | el sistema guarda la información |
| **Alternativo (más relevante)** | el espacio tiene información incompleta | intenta guardar | el sistema muestra los errores correspondientes |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**### 6.3.3. HU-14 Programar actividades**

Como administrador, quiero programar actividades indicando día, horario, espacio y entrenador, para organizar las sesiones que ofrece el gimnasio.

**Dependencias:** HU-12, HU-13, HU-18.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe una actividad, un espacio y un entrenador disponibles | el administrador define día y horario y confirma la programación | el sistema registra la actividad programada |
| **Alternativo (más relevante)** | el espacio o el entrenador ya tiene una programación incompatible | intenta guardar la programación | el sistema informa el conflicto y no registra la programación |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Alto | Proyecto mayor | 8 |

**### 6.3.4. HU-15 Cambiar entrenador de actividad programada**

Como administrador, quiero cambiar el entrenador asignado a una actividad programada, para mantener la continuidad de las sesiones cuando sea necesario.

**Dependencias:** HU-14, HU-18.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe una actividad programada | el administrador selecciona otro entrenador disponible y confirma el cambio | el sistema actualiza la asignación |
| **Alternativo (más relevante)** | el entrenador seleccionado tiene un horario incompatible | intenta confirmar el cambio | el sistema informa el conflicto y conserva el entrenador anterior |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Medio | Proyecto mayor | 5 |

**### 6.3.5. HU-16 Cancelar actividad programada**

Como administrador, quiero cancelar una actividad programada, para informar que la sesión no se realizará.

**Dependencias:** HU-14.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe una actividad programada | el administrador confirma su cancelación | el sistema cambia el estado de la programación y cancela las inscripciones activas asociadas |
| **Alternativo (más relevante)** | el administrador decide no cancelar | cancela la confirmación | el sistema conserva la programación |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Medio | Proyecto mayor | 5 |

**### 6.3.6. HU-17 Consultar actividades disponibles**

Como cliente, quiero consultar las actividades programadas disponibles, para conocer las sesiones a las que puedo inscribirme según mi membresía.

**Dependencias:** HU-08, HU-14.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen actividades programadas | el cliente consulta las actividades disponibles | el sistema muestra las actividades compatibles con su membresía y con cupos disponibles |
| **Alternativo (más relevante)** | no hay actividades compatibles o disponibles | el cliente consulta las actividades | el sistema informa que no existen actividades disponibles |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.3.7. HU-18 Registrar entrenador**

Como administrador o recepcionista, quiero registrar un entrenador con sus datos personales y credenciales de acceso en un único flujo, para que pueda consultar las actividades y horarios que tiene asignados.

**Dependencias:** Ninguna.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un administrador o recepcionista autorizado está en el formulario de registro | ingresa nombre, documento, correo electrónico obligatorio y único, teléfono opcional, contraseña y confirmación de contraseña, además de los datos específicos del entrenador | el sistema registra los datos personales, la información del entrenador y sus credenciales conjuntamente |
| **Alternativo (más relevante)** | el documento o correo ya está registrado, el correo está vacío o tiene un formato inválido, o las contraseñas no coinciden | intenta guardar el registro | el sistema no guarda la información y muestra el error correspondiente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**### 6.3.8. HU-19 Inscribir cliente en actividad**

Como cliente, quiero inscribirme en una actividad incluida en mi membresía, para participar en las sesiones disponibles.

**Dependencias:** HU-08, HU-14, HU-17.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el cliente tiene una membresía vigente que incluye la actividad y existe un cupo disponible | selecciona la sesión y confirma la inscripción | el sistema registra la inscripción |
| **Alternativo (más relevante)** | la actividad no está incluida en la membresía, el límite fue alcanzado o no hay cupos | intenta inscribirse | el sistema rechaza la inscripción e informa la razón |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Alto | Proyecto mayor | 8 |

**### 6.3.9. HU-20 Cancelar inscripción**

Como cliente, quiero cancelar una inscripción, para liberar mi cupo cuando no pueda asistir a una actividad.

**Dependencias:** HU-19.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el cliente tiene una inscripción activa | selecciona cancelar y confirma la operación | el sistema cambia el estado de la inscripción y libera el cupo |
| **Alternativo (más relevante)** | la inscripción ya está cancelada o no pertenece al cliente | intenta cancelarla | el sistema informa que no puede realizar la operación |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**### 6.3.10. HU-21 Consultar clientes inscritos**

Como administrador, recepcionista o entrenador asignado, quiero consultar los clientes inscritos en una actividad, para conocer la participación de cada sesión.

**Dependencias:** HU-19.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen clientes inscritos en una actividad | el usuario autorizado consulta la lista de inscritos | el sistema muestra los clientes inscritos, respetando los permisos del rol |
| **Alternativo (más relevante)** | no hay clientes inscritos | el usuario consulta la lista | el sistema informa que no hay inscripciones registradas |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**## 6.4. Gestión de entrenadores**

**### 6.4.1. HU-22 Consultar entrenadores**

Como administrador o recepcionista, quiero consultar los entrenadores registrados, para conocer su información y disponibilidad.

**Dependencias:** HU-18.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen entrenadores registrados | el usuario autorizado ingresa al módulo | el sistema muestra el listado de entrenadores |
| **Alternativo (más relevante)** | no existen entrenadores registrados | el usuario ingresa al módulo | el sistema informa que no hay entrenadores registrados |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Bajo | Quick win | 2 |

**### 6.4.2. HU-23 Administrar horarios de entrenadores**

Como administrador o recepcionista, quiero definir y consultar el horario fijo de los entrenadores, para organizar su disponibilidad.

**Dependencias:** HU-18.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existe un entrenador registrado | el usuario autorizado define o consulta su horario fijo | el sistema guarda o muestra el horario correspondiente |
| **Alternativo (más relevante)** | el horario presenta información inválida o incompatible | intenta guardarlo | el sistema informa el conflicto y no guarda el horario |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Medio | Proyecto mayor | 5 |

**## 6.5. Dashboard y reportes**

**### 6.5.1. HU-28 Consultar dashboard**

Como administrador, quiero consultar un panel con indicadores generales del gimnasio, para conocer el estado de la operación.

**Dependencias:** HU-01, HU-09, HU-14.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | existen registros en el sistema | el administrador ingresa al dashboard | el sistema muestra los indicadores de clientes, membresías y actividades |
| **Alternativo (más relevante)** | no existen registros para uno o más indicadores | el administrador consulta el dashboard | el sistema muestra los valores correspondientes sin errores |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Alto | Medio | Proyecto mayor | 5 |

**### 6.5.2. HU-29 Configurar días de aviso de vencimiento**

Como administrador, quiero configurar los días de anticipación para los avisos de vencimiento de membresías, para recibir información oportuna.

**Dependencias:** HU-28.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | el administrador está en la configuración de avisos | ingresa un número válido de días de anticipación | el sistema guarda la configuración y utiliza ese valor para mostrar las membresías próximas a vencer |
| **Alternativo (más relevante)** | el administrador ingresa un valor vacío, no numérico o menor que 1 | intenta guardar | el sistema muestra un error y conserva el valor anterior |

**Nota:** El valor mínimo es 1 día; el valor cero se rechaza.

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| S | Medio | Bajo | Quick win | 2 |

**## 6.6. Autenticación y permisos**

**### 6.6.1. HU-24 Iniciar sesión**

Como usuario del sistema, quiero iniciar sesión con mis credenciales, para acceder a las funcionalidades correspondientes a mi rol.

**Dependencias:** Ninguna (sin dependencias funcionales directas; historia fundacional; no depende de otras, pero es prerrequisito transversal de todas las demás).

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un usuario registrado y activo cuenta con credenciales válidas | ingresa correo electrónico y contraseña correctos | el sistema permite el acceso y muestra únicamente las funcionalidades permitidas para su rol |
| **Alternativo (más relevante)** | un usuario intenta iniciar sesión | ingresa un correo electrónico o contraseña incorrectos | el sistema muestra un mensaje de error y no permite el acceso |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Alto | Proyecto mayor | 8 |

**### 6.6.2. HU-25 Cerrar sesión**

Como usuario del sistema, quiero cerrar sesión, para proteger mi cuenta cuando termine de utilizar el sistema.

**Dependencias:** HU-24 (Requiere una sesión iniciada previamente).

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un usuario tiene una sesión activa | selecciona cerrar sesión | el sistema finaliza la sesión y redirige a la pantalla de inicio de sesión |
| **Alternativo (más relevante)** | un usuario cerró sesión previamente | intenta acceder nuevamente a una funcionalidad protegida | el sistema le solicita autenticarse antes de continuar |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Bajo | Quick win | 2 |

**### 6.6.3. HU-26 Recuperar contraseña**

Como usuario del sistema, quiero recuperar mi contraseña, para poder volver a acceder a mi cuenta cuando la haya olvidado.

**Dependencias:** Ninguna dependencia funcional directa. El usuario debe tener una cuenta registrada para iniciar el proceso de recuperación.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un usuario registrado olvidó su contraseña y solicita recuperarla | el sistema envía un código de un solo uso al correo registrado y el usuario lo ingresa correctamente antes de que venza | el sistema le permite establecer una nueva contraseña |
| **Alternativo (más relevante)** | el usuario recibió un código de recuperación | el código vence o el usuario agota los tres intentos fallidos | el sistema invalida el código e indica que debe solicitar uno nuevo |

**Nota:** El flujo es: (1) el usuario solicita recuperar su contraseña; (2) el sistema envía un código de un solo uso al correo electrónico registrado; (3) el usuario lo ingresa antes de que venza (15 minutos), con máximo 3 intentos fallidos; (4) si el código es válido, establece una nueva contraseña; (5) si vence o se agotan los intentos, el código queda invalidado y debe solicitarse otro. Si los datos ingresados no corresponden a una cuenta registrada, el sistema informa que no fue posible verificar la identidad. El código no se almacena en la base de datos (RN-53, RES-12).

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| C | Medio | Medio | Relleno | 5 |

**### 6.6.4. HU-27 Administrar roles y permisos**

Como administrador, quiero asignar roles a los usuarios y configurar los permisos de cada rol, para controlar el acceso a las funcionalidades del sistema.

**Dependencias:** HU-24 (Requiere el módulo de autenticación para aplicar los permisos al iniciar sesión).

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un administrador consulta los roles disponibles | asigna un rol a un usuario o modifica los permisos de un rol | el sistema actualiza el acceso de los usuarios según los permisos de su rol |
| **Alternativo (más relevante)** | un usuario tiene el rol de cliente | intenta acceder a una funcionalidad reservada a otro rol | el sistema deniega el acceso y muestra un mensaje correspondiente |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Alto | Proyecto mayor | 8 |

**### 6.6.5. HU-37 Registrar usuarios administrativos**

Como administrador, quiero registrar administradores y recepcionistas con sus datos y credenciales, para gestionar el equipo de trabajo que opera el sistema.

**Dependencias:** HU-24, HU-27 (Requiere el módulo de autenticación y los roles definidos). La primera cuenta de administrador se crea mediante la configuración inicial del sistema (RES-11); a partir de ella se registran los demás administradores y recepcionistas con esta historia.

**Criterios de aceptación:**

| **Escenario** | **GIVEN (Dado que)** | **WHEN (Cuando)** | **THEN (Entonces)** |
| --- | --- | --- | --- |
| **Principal (éxito)** | un administrador está en el módulo de usuarios | ingresa nombre, documento, correo obligatorio y único, teléfono opcional, rol (Administrador o Recepcionista), contraseña y confirmación | el sistema guarda los datos personales y las credenciales conjuntamente y permite iniciar sesión con el correo y los permisos de su rol |
| **Alternativo (más relevante)** | el correo está vacío, mal formado o duplicado, o la confirmación de contraseña no coincide | el administrador intenta guardar el alta | el sistema no guarda y muestra el error correspondiente; también rechaza documentos duplicados |

**Prioridad:**

| **MoSCoW** | **Valor** | **Esfuerzo** | **Cuadrante V/E** | **Puntos de historia** |
| --- | --- | --- | --- | --- |
| M | Alto | Medio | Proyecto mayor | 5 |

**# 7. Alcance del MVP**

| **Épica** | **Funcionalidades incluidas en el MVP** |
| --- | --- |
| **Gestión de clientes** | Registrar clientes · Consultar clientes · Buscar clientes · Editar información · Consultar membresía asociada |
| **Gestión de membresías** | Crear tipos de membresía · Gestionar beneficios · Configurar actividades y beneficios de cada tipo · Consultar membresías · Asignar membresía a clientes · Consultar estado · Consultar fechas de vencimiento |
| **Gestión de actividades** | Gestionar actividades · Gestionar espacios · Programar actividades · Asignar entrenadores · Consultar actividades disponibles · Permitir a los clientes inscribirse según su membresía |
| **Gestión de entrenadores** | Registrar entrenadores · Consultar entrenadores · Definir horario fijo · Asignar entrenadores a actividades programadas |
| **Dashboard y reportes** | Consultar clientes activos · Consultar membresías activas y vencidas · Consultar actividades programadas · Consultar membresías próximas a vencer · Configurar días de aviso |
| **Autenticación y permisos** | Iniciar sesión · Cerrar sesión · Recuperar contraseña por correo · Registrar usuarios con datos y credenciales en un único flujo · Administrar roles y permisos · Demostración visual por perfil en web y móvil · Controlar acceso según el rol del usuario |