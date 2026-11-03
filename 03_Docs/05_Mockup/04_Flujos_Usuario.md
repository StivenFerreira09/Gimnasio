# Flujos de Usuario — Sistema de Gestión de Gimnasio

## 1. Objetivo

Explicar cómo navegan el administrador, el recepcionista, el entrenador y el cliente entre las pantallas del sistema, incluyendo los resultados exitosos, las validaciones y los caminos alternativos más importantes.

Los flujos se apoyan en la estructura definida en `01_Estructura_Navegacion.md`, las pantallas de `02_Diseño_Pantallas/web.md`, los requisitos y las historias de usuario del proyecto.

## 2. Reglas generales de navegación

- Todas las funciones protegidas requieren iniciar sesión.
- El sistema muestra únicamente módulos y acciones permitidos para el rol autenticado.
- Las acciones exclusivas del administrador no aparecen para los demás roles.
- Cada formulario permite confirmar o cancelar.
- Las acciones que cambian estados o afectan otros registros solicitan confirmación.
- Los mensajes indican el resultado y orientan al usuario cuando una validación impide continuar.
- Al cerrar sesión se regresa a la pantalla de inicio de sesión.
- Si una persona intenta entrar a una ruta sin permiso, el sistema niega el acceso y la dirige a una opción autorizada.

## 3. Acceso y recuperación de contraseña

### 3.1. Inicio de sesión

**Participantes:** todos los roles.

**Flujo principal:**

1. El usuario abre el sistema y visualiza **Iniciar sesión**.
2. Ingresa su usuario y contraseña.
3. Selecciona **Ingresar**.
4. El sistema verifica que las credenciales sean correctas y que la cuenta esté activa.
5. El sistema identifica el rol y carga sus permisos.
6. Redirige al inicio correspondiente:
   - Administrador: dashboard.
   - Recepcionista: inicio de recepción.
   - Entrenador: mis actividades.
   - Cliente: mi membresía.

**Caminos alternativos:**

- Credenciales incorrectas: permanece en el acceso y muestra un error sin revelar cuál dato falló.
- Cuenta inactiva: niega el acceso e informa que la cuenta no está habilitada.
- Campo vacío: señala el campo obligatorio antes de enviar.
- Ruta no autorizada después de ingresar: niega el acceso y regresa a una sección permitida.

**Secuencia resumida:** `Inicio de sesión → Validar credenciales → Identificar rol → Inicio autorizado`.

### 3.2. Recuperación de contraseña

**Participantes:** todos los roles con una cuenta registrada.

**Flujo principal:**

1. En **Iniciar sesión**, el usuario selecciona **¿Olvidaste tu contraseña?**.
2. Ingresa el teléfono o correo asociado a su cuenta.
3. El sistema verifica la identidad y envía un código de un solo uso.
4. El usuario ingresa el código recibido.
5. El sistema valida que el código sea correcto, no haya sido utilizado y tenga menos de 15 minutos.
6. El usuario escribe y confirma la nueva contraseña.
7. El sistema actualiza la contraseña e invalida el código.
8. Muestra una confirmación y permite volver a **Iniciar sesión**.

**Caminos alternativos:**

- No existe una cuenta asociada: se informa que no fue posible verificar la identidad.
- Código incorrecto: se informa el error y se permite intentar nuevamente.
- Tres intentos fallidos: el código se invalida y debe solicitarse otro.
- Código vencido: se ofrece volver a solicitar la recuperación.
- Contraseñas diferentes o formato no válido: se mantiene el formulario y se muestran las validaciones.

**Secuencia resumida:** `Iniciar sesión → Solicitar recuperación → Ingresar código → Nueva contraseña → Confirmación`.

### 3.3. Cierre de sesión

1. El usuario selecciona **Cerrar sesión** en la parte inferior del menú.
2. El sistema finaliza la sesión.
3. Redirige a **Iniciar sesión**.
4. Si intenta volver a una pantalla protegida, debe autenticarse nuevamente.

## 4. Flujos de clientes

### 4.1. Consultar y buscar clientes

**Roles:** administrador y recepcionista.

1. El usuario entra a **Clientes** desde el menú.
2. El sistema muestra el listado de clientes.
3. Puede escribir un nombre o documento y seleccionar **Buscar**.
4. Si encuentra coincidencias, actualiza la tabla.
5. Selecciona **Ver** para abrir el detalle del cliente y consultar sus datos y membresía.

Si no existen coincidencias, se muestra un estado sin resultados y se permite limpiar la búsqueda. El recepcionista consulta la misma información, pero no ve acciones exclusivas del administrador.

### 4.2. Registrar un cliente

**Roles:** administrador y recepcionista.

1. Desde **Clientes**, selecciona **Registrar cliente**.
2. Ingresa nombre, documento y teléfono; el correo es opcional.
3. Selecciona **Guardar cliente**.
4. El sistema valida los campos y comprueba que el documento no esté registrado.
5. Guarda el cliente y muestra una confirmación.
6. Redirige al detalle o al listado actualizado.

Si falta un dato, tiene formato inválido o el documento ya existe, el sistema no guarda y explica el error junto al campo.

### 4.3. Editar, desactivar o reactivar un cliente

1. El usuario abre **Clientes → Ver detalle**.
2. Selecciona **Editar**, modifica los datos permitidos y guarda.
3. El sistema valida y muestra el resultado.
4. Para cambiar el estado, el administrador selecciona **Desactivar** o **Activar**.
5. El sistema solicita confirmación y actualiza el estado.

Un cliente inactivo no puede iniciar sesión. La acción de activar o desactivar es exclusiva del administrador y no debe aparecer al recepcionista.

## 5. Flujos de membresías y beneficios

### 5.1. Crear un tipo de membresía

**Rol:** administrador.

1. Entra a **Membresías**.
2. Selecciona **Crear tipo de membresía**.
3. Define nombre, precio, duración y unidad en días o meses.
4. Configura las actividades incluidas y sus límites cuando corresponda.
5. Asocia beneficios informativos.
6. Guarda y regresa al catálogo actualizado.

Los beneficios solo se informan; el sistema no controla su consumo y tampoco procesa pagos.

### 5.2. Asignar una membresía

**Roles:** administrador y recepcionista.

1. Entra a **Membresías → Asignar membresía** o inicia desde el detalle del cliente.
2. Selecciona el cliente y el tipo de membresía.
3. El sistema calcula la fecha de vencimiento según la duración.
4. Verifica si el cliente ya tiene una membresía activa.
5. Si no tiene una activa, el usuario confirma y se registra la asignación.
6. El sistema muestra la nueva vigencia y su estado.

Si ya existe una membresía activa, el sistema muestra una advertencia. Solo continúa cuando el usuario confirma el reemplazo; la anterior queda en estado **Reemplazada** y nunca deben quedar dos membresías activas para el mismo cliente.

### 5.3. Consultar membresías por estado

1. El usuario entra a **Membresías**.
2. Filtra por activas, próximas a vencer o vencidas.
3. El sistema muestra cliente, tipo, fechas y estado.
4. Desde una membresía próxima a vencer puede seleccionar **Renovar**.

La clasificación **Próxima a vencer** utiliza los días de aviso configurados por el administrador.

### 5.4. Renovar una membresía

1. El usuario selecciona **Renovar** en el listado o detalle.
2. El sistema presenta la membresía actual y la nueva vigencia.
3. El usuario confirma la renovación.
4. La membresía anterior queda **Reemplazada**.
5. Se crea la nueva vigencia desde la fecha actual.
6. El sistema muestra la membresía activa actualizada.

## 6. Flujos de actividades, espacios y programación

### 6.1. Gestionar actividades y espacios

**Rol:** administrador.

1. Entra a **Actividades** o **Espacios**.
2. Consulta el catálogo correspondiente.
3. Selecciona crear o editar.
4. Ingresa los datos y la capacidad máxima.
5. El sistema valida y guarda.
6. Regresa al catálogo actualizado.

### 6.2. Programar una actividad

**Rol:** administrador.

1. Entra a **Programación** y selecciona **Programar actividad**.
2. Elige actividad, día, hora inicial, hora final, espacio y entrenador.
3. El sistema verifica:
   - La hora final es posterior a la inicial.
   - El espacio no tiene otro evento en el mismo horario.
   - El entrenador está activo y dentro de su horario fijo.
   - El entrenador no tiene otra actividad que se cruce.
   - La capacidad de la actividad no supera la capacidad del espacio.
4. Si todo es válido, el administrador guarda.
5. La actividad aparece en la programación semanal.

Cuando una validación falla, el sistema resalta los campos, explica el conflicto y no crea la programación.

### 6.3. Consultar detalle, inscritos y cambiar entrenador

1. Desde **Programación semanal**, el usuario abre una actividad.
2. El sistema muestra actividad, día, horario, espacio, entrenador, cupos e inscritos.
3. El administrador puede seleccionar **Cambiar entrenador**.
4. El sistema valida el estado, horario fijo y cruces del nuevo entrenador.
5. Si cumple las reglas, actualiza la asignación.

El recepcionista solo puede consultar el detalle y los inscritos cuando sus permisos lo permitan.

### 6.4. Cancelar una programación

1. El administrador abre el detalle de la programación.
2. Selecciona **Cancelar programación**.
3. El sistema advierte que también cancelará las inscripciones activas.
4. El administrador confirma.
5. La programación queda **Cancelada** y sus inscripciones activas también se cancelan.
6. El sistema actualiza el horario y libera los cupos correspondientes.

## 7. Flujos de inscripciones del cliente

### 7.1. Consultar actividades e inscribirse

1. El cliente entra a **Actividades disponibles**.
2. Consulta horarios, espacios, entrenadores y cupos.
3. Abre el detalle de una actividad.
4. Selecciona **Inscribirme**.
5. El sistema verifica que:
   - La membresía esté activa.
   - La actividad esté incluida en su plan.
   - No haya alcanzado el límite del período.
   - Existan cupos disponibles.
   - No tenga otra inscripción activa en la misma programación.
6. El cliente confirma.
7. El sistema registra la inscripción, descuenta un cupo y la muestra en **Mis inscripciones**.

Si alguna condición no se cumple, no registra la inscripción y explica si se debe a membresía inactiva, actividad no incluida, límite alcanzado, falta de cupos o inscripción duplicada.

### 7.2. Consultar y cancelar una inscripción

1. El cliente entra a **Mis inscripciones**.
2. El sistema muestra sus inscripciones activas con actividad, día, horario y espacio.
3. Selecciona **Cancelar inscripción**.
4. El sistema solicita confirmación.
5. El cliente confirma.
6. La inscripción queda cancelada, se libera el cupo y deja de contar para el límite del período.

El cliente solo puede consultar y cancelar sus propias inscripciones.

## 8. Recorridos por rol

### 8.1. Administrador

**Inicio:** `Iniciar sesión → Dashboard`.

Recorrido habitual:

1. Revisa indicadores de clientes, membresías y actividades.
2. Consulta membresías próximas a vencer y puede renovarlas.
3. Administra clientes, tipos de membresía y beneficios.
4. Gestiona actividades, espacios, programación y entrenadores.
5. Administra usuarios, roles y permisos.
6. Configura los días de aviso de vencimiento.
7. Cierra sesión.

Es el único rol que puede ejecutar todas las acciones administrativas, incluidas desactivaciones, configuración y gestión de permisos.

### 8.2. Recepcionista

**Inicio:** `Iniciar sesión → Inicio de recepción`.

Recorrido habitual:

1. Busca o registra clientes.
2. Consulta el detalle y la membresía del cliente.
3. Asigna o renueva membresías según sus permisos.
4. Consulta membresías próximas a vencer.
5. Registra y consulta entrenadores, y define horarios si está autorizado.
6. Consulta actividades programadas e inscritos según sus permisos.
7. Crea credenciales para clientes y entrenadores cuando tenga autorización.
8. Cierra sesión.

No puede desactivar clientes, administrar roles ni cambiar configuraciones exclusivas del administrador.

### 8.3. Entrenador

**Inicio:** `Iniciar sesión → Mis actividades`.

Recorrido habitual:

1. Consulta las actividades programadas que le fueron asignadas.
2. Revisa día, hora, espacio y estado.
3. Entra a **Mi horario** para organizar su semana.
4. Cierra sesión.

Su interfaz es de consulta. No modifica la programación ni accede a datos administrativos que no le correspondan.

### 8.4. Cliente

**Inicio:** `Iniciar sesión → Mi membresía`.

Recorrido habitual:

1. Consulta el estado, vigencia, actividades, límites y beneficios de su membresía.
2. Entra a **Actividades disponibles**.
3. Revisa el detalle y se inscribe si cumple las condiciones.
4. Consulta **Mis inscripciones**.
5. Cancela una inscripción propia cuando lo requiere.
6. Cierra sesión.

Solo puede consultar su propia información y realizar operaciones sobre sus propias inscripciones.

## 9. Matriz resumida de navegación

| Pantalla o módulo | Administrador | Recepcionista | Entrenador | Cliente |
|---|---|---|---|---|
| Inicio de sesión y recuperación | Sí | Sí | Sí | Sí |
| Dashboard | Sí | No | No | No |
| Inicio de recepción | No | Sí | No | No |
| Clientes | Gestión completa | Gestión según permisos | No | Solo sus datos cuando estén habilitados |
| Membresías | Gestión completa | Asignación, consulta y renovación autorizadas | No | Consulta la propia |
| Actividades y espacios | Gestión completa | Consulta autorizada | Consulta asignaciones | Consulta disponibles |
| Programación | Gestión completa | Consulta autorizada | Consulta la propia | Consulta para inscribirse |
| Entrenadores | Gestión completa | Registro y consulta autorizados | Consulta propia | No |
| Usuarios, roles y configuración | Sí | Funciones limitadas | No | No |
| Inscripciones | Consulta de programación | Consulta autorizada | No especificado | Gestiona las propias |

## 10. Estados comunes en los flujos

- **Cargando:** se informa que la consulta o acción está en proceso y se evita repetir el envío.
- **Sin resultados:** se explica que no existen datos y se permite limpiar filtros o regresar.
- **Validación:** se conserva lo ingresado y se indica cómo corregir cada campo.
- **Confirmación:** se explican las consecuencias antes de reemplazar, desactivar o cancelar.
- **Éxito:** se actualiza la información visible y se confirma el resultado.
- **Error inesperado:** no se aplica un cambio parcial; se informa el problema y se permite reintentar.
