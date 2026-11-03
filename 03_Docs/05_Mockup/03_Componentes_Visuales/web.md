# Componentes Visuales Web — Sistema de Gestión de Gimnasio

## 1. Objetivo

Definir la identidad visual y los componentes reutilizables de la versión web para PC. Estas reglas permiten que las pantallas de acceso, administración, recepción, entrenador y cliente mantengan una apariencia uniforme y comuniquen claramente el resultado de cada acción.

La definición se basa en las pantallas documentadas en `02_Diseño_Pantallas/web.md` y en las evidencias gráficas guardadas en `03_Docs/media/web/capturas`.

## 2. Identidad visual

La interfaz utiliza una apariencia moderna, limpia y de alto contraste. El menú lateral oscuro identifica la zona de navegación, el fondo gris claro separa el área de trabajo y el amarillo destaca las acciones principales.

### 2.1. Paleta de colores

Los códigos son referencias visuales para mantener la consistencia al implementar el prototipo.

| Uso | Color de referencia | Aplicación |
|---|---|---|
| Primario | Amarillo `#FFB800` | Opción activa del menú, botón principal, logotipo y elementos destacados. |
| Navegación | Negro carbón `#1F1F1F` | Menú lateral y bloque de identidad en el acceso. |
| Fondo general | Gris muy claro `#F5F6F8` | Área principal de todas las pantallas. |
| Superficie | Blanco `#FFFFFF` | Tarjetas, tablas, formularios y ventanas de confirmación. |
| Texto principal | Gris oscuro `#242424` | Títulos, datos importantes y contenido principal. |
| Texto secundario | Gris `#666B73` | Ayudas, descripciones y datos complementarios. |
| Bordes | Gris claro `#D5D8DE` | Separadores, tablas, campos y contornos de tarjetas. |
| Enlace e información | Azul `#0D6EFD` | Acciones como Ver, Editar, Renovar y enlaces de navegación. |
| Éxito o activo | Verde `#169B50` | Estados activos, operaciones exitosas y actividades programadas. |
| Advertencia | Naranja `#B86500` | Membresías próximas a vencer y situaciones que requieren atención. |
| Error o peligro | Rojo `#E3342F` | Validaciones, estados vencidos y acciones de desactivación o cancelación. |
| Inactivo o cancelado | Gris `#6B7078` | Registros inactivos, cancelados o sin membresía. |

El color nunca debe ser el único medio para comunicar un estado. Debe acompañarse de una palabra o mensaje, por ejemplo: **Activa**, **Vencida**, **Cancelada** o **Error**.

### 2.2. Tipografía

- Se utiliza una fuente sans serif legible, similar a **Arial**, **Roboto** o **Inter**, para textos, campos y tablas.
- Los títulos y el nombre del gimnasio pueden usar una variante condensada en negrita para reforzar la identidad deportiva.
- Título principal: 28 a 32 px, negrita.
- Título de sección o tarjeta: 18 a 22 px, seminegrita.
- Texto normal y campos: 14 a 16 px.
- Texto auxiliar y etiquetas pequeñas: 12 a 14 px.
- Los valores principales del dashboard emplean un tamaño mayor y negrita para facilitar la lectura rápida.

## 3. Distribución general

### 3.1. Menú lateral

El menú lateral permanece a la izquierda en las pantallas protegidas y contiene:

- Logotipo y nombre del gimnasio.
- Nombre del rol autenticado.
- Opciones disponibles según el rol y sus permisos.
- Opción activa resaltada con fondo amarillo, texto oscuro e icono.
- Datos básicos del usuario en la parte inferior.
- Acción **Cerrar sesión**.

No se deben mostrar opciones para las cuales el usuario no tenga permiso. El administrador dispone del menú más completo; el recepcionista solo ve sus operaciones autorizadas; el entrenador accede a sus actividades y horario; y el cliente a su membresía, actividades e inscripciones.

### 3.2. Encabezado del contenido

Cada pantalla presenta en la parte superior:

- Título claro de la sección.
- Descripción breve o cantidad de registros, cuando aporta contexto.
- Ruta de navegación o referencia a la sección anterior en formularios y detalles.
- Acción principal alineada a la derecha, por ejemplo **Registrar cliente** o **Programar actividad**.

### 3.3. Área de trabajo

- Fondo gris claro con márgenes amplios.
- Contenido organizado en tarjetas blancas.
- Separación constante entre títulos, filtros, tablas y acciones.
- Formularios de dos columnas cuando el ancho lo permite.
- Acciones finales alineadas a la derecha: primero **Cancelar** y luego la acción principal.

## 4. Controles de interacción

### 4.1. Botones

| Tipo | Apariencia | Ejemplos |
|---|---|---|
| Principal | Fondo amarillo, texto oscuro y negrita. | Guardar, Ingresar, Registrar, Confirmar, Programar. |
| Secundario | Fondo blanco, borde gris y texto oscuro. | Cancelar, Volver. |
| Búsqueda | Fondo oscuro y texto blanco. | Buscar. |
| Acción de texto | Texto azul sin fondo. | Ver, Editar, Renovar, Ver todas. |
| Peligro | Texto o fondo rojo, según importancia. | Desactivar, Cancelar programación. |
| Positivo | Texto o fondo verde. | Activar, Confirmar reactivación. |

Reglas de uso:

- Cada formulario debe tener una sola acción principal destacada.
- Los botones deben usar verbos que indiquen el resultado esperado.
- Una acción no disponible debe mostrarse deshabilitada y no solo ocultar el error después del clic.
- Las acciones destructivas deben solicitar confirmación.

### 4.2. Campos y selectores

- Cada campo debe tener una etiqueta visible sobre el control.
- Los campos obligatorios se identifican con un asterisco `*`.
- Los textos de ejemplo se muestran en gris dentro del campo.
- Los selectores incluyen un indicador de despliegue.
- Los campos de contraseña ocultan los caracteres ingresados.
- Los campos relacionados se agrupan, por ejemplo: hora de inicio y hora de fin.
- El foco debe distinguirse mediante un borde visible.
- Si existe un error, el borde cambia a rojo y aparece una explicación debajo.

Ejemplos de validación: campo obligatorio vacío, documento duplicado, correo con formato inválido, hora final anterior a la inicial, cruce de espacio y entrenador fuera de su horario.

### 4.3. Formularios

Los formularios se presentan dentro de una tarjeta blanca e incluyen:

1. Título y explicación breve.
2. Campos organizados de forma lógica.
3. Indicación de obligatoriedad.
4. Validaciones junto al campo correspondiente.
5. Mensaje general cuando varios errores impiden guardar.
6. Botones **Cancelar** y **Guardar/Confirmar** al final.

El sistema conserva los datos válidos cuando aparece un error para evitar que el usuario tenga que escribirlos nuevamente.

## 5. Componentes de información

### 5.1. Tablas

Las tablas se utilizan para clientes, membresías, actividades, entrenadores, usuarios e inscripciones.

- Encabezado con fondo gris muy claro.
- Filas separadas por líneas finas.
- Texto alineado de forma consistente.
- Primera columna destacada cuando contiene el nombre principal.
- Columna final para acciones autorizadas.
- Etiquetas de estado para facilitar la lectura.
- Filtro o buscador encima cuando el listado lo requiere.
- Mensaje de estado vacío cuando no existen resultados.

En pantallas con muchos registros se debe contemplar paginación y mostrar el total de resultados.

### 5.2. Tarjetas

Las tarjetas tienen fondo blanco, borde gris claro y esquinas redondeadas. Se emplean para:

- Indicadores del dashboard.
- Resumen de una membresía.
- Información de clientes o entrenadores.
- Beneficios y actividades incluidas.
- Accesos rápidos del recepcionista.

Una tarjeta de indicador incluye icono, nombre del dato y valor destacado. El color del valor ayuda a diferenciar información normal, positiva, vencida o próxima a vencer.

### 5.3. Indicadores y etiquetas de estado

| Estado | Presentación recomendada |
|---|---|
| Activo, Activa o Programada | Etiqueta verde clara con texto verde. |
| Próxima a vencer o Por vencer | Etiqueta naranja clara con texto naranja. |
| Vencida o Error | Etiqueta roja clara con texto rojo. |
| Inactivo, Sin membresía o Cancelada | Etiqueta gris clara con texto gris. |
| Cupos disponibles | Texto o etiqueta verde. |
| Cupos agotados o límite alcanzado | Texto o etiqueta roja. |

Los estados deben conservar el mismo nombre y color en tablas, detalles y tarjetas.

### 5.4. Alertas y mensajes

| Tipo | Uso | Ejemplo |
|---|---|---|
| Éxito | Confirmar que la operación terminó correctamente. | Cliente registrado correctamente. |
| Error | Informar que la operación no se realizó. | El documento ya se encuentra registrado. |
| Advertencia | Avisar sobre una consecuencia o condición especial. | Esta asignación reemplazará la membresía activa. |
| Información | Dar contexto sin bloquear la operación. | Los beneficios son informativos; consúltalos en recepción. |

Los mensajes deben explicar qué ocurrió y, cuando sea posible, qué debe hacer el usuario para continuar.

### 5.5. Ventanas de confirmación

Se utilizan antes de acciones con consecuencias importantes:

- Desactivar un cliente.
- Reemplazar o renovar una membresía.
- Cancelar una programación y sus inscripciones.
- Cancelar una inscripción.

La ventana debe indicar el registro afectado, explicar la consecuencia y ofrecer dos opciones claras: regresar sin cambios o confirmar la acción.

## 6. Estados de la interfaz

### 6.1. Carga

- Mostrar un indicador de progreso mientras se consultan o guardan datos.
- Deshabilitar temporalmente el botón que inició la operación para evitar envíos duplicados.
- Usar textos como **Cargando información...** o **Guardando...**.
- No mostrar tablas vacías antes de conocer el resultado de la consulta.

### 6.2. Sin resultados

- Indicar claramente que no existen registros o coincidencias.
- Mantener visible el criterio de búsqueda.
- Permitir limpiar los filtros o volver al listado completo.
- Cuando corresponda, ofrecer la acción para crear el primer registro.

### 6.3. Error

- Mostrar el error cerca del campo o proceso que lo produjo.
- Conservar la información ya ingresada.
- No completar parcialmente una operación que incumpla las reglas de negocio.
- Para errores inesperados, informar que no fue posible completar la acción y permitir reintentar.

### 6.4. Confirmación y éxito

- Mostrar un aviso breve después de guardar, actualizar, activar, renovar o cancelar.
- Actualizar la tabla, tarjeta o estado afectado.
- Redirigir al detalle o listado cuando sea útil para verificar el resultado.

### 6.5. Validaciones principales

- Campos obligatorios completos y con formato válido.
- Documento y nombre de usuario únicos.
- Hora final posterior a la hora inicial.
- Ausencia de cruces de espacio y entrenador.
- Entrenador activo y dentro de su horario fijo.
- Máximo una membresía activa por cliente.
- Membresía activa, actividad incluida, límite disponible y cupo antes de inscribir.
- Código de recuperación vigente y dentro del máximo de tres intentos.

## 7. Accesibilidad y consistencia

- Mantener contraste suficiente entre texto y fondo.
- Permitir navegación mediante teclado y mostrar el foco.
- Asociar cada etiqueta con su campo.
- Incluir texto alternativo en iconos informativos e imágenes.
- Evitar depender únicamente del color.
- Utilizar nombres sencillos y consistentes en todas las pantallas.
- Presentar fechas, horas, documentos y valores monetarios con el mismo formato.

## 8. Reutilización por rol

Los cuatro roles comparten los mismos componentes base: menú lateral, títulos, tarjetas, tablas, campos, etiquetas, alertas y confirmaciones. Lo que cambia es la información y las acciones disponibles:

- **Administrador:** todos los módulos administrativos y de configuración.
- **Recepcionista:** operaciones de atención autorizadas, sin acciones exclusivas del administrador.
- **Entrenador:** consulta de sus propias actividades y horarios.
- **Cliente:** consulta de su membresía, actividades disponibles y sus inscripciones.

Esta reutilización reduce diferencias innecesarias y facilita el aprendizaje del sistema.
