# Componentes visuales para la aplicación web

## 1. Objetivo

Este documento define la identidad visual y los componentes reutilizables de la aplicación web del Sistema de Gestión de Gimnasio. Su propósito es mantener una interfaz clara, coherente y fácil de usar para administradores, recepcionistas, entrenadores y clientes.

## 2. Identidad visual

### 2.1. Paleta de colores

| Uso | Color | Código hexadecimal |
|---|---|---|
| Color principal | Azul oscuro | `#16324F` |
| Color secundario | Azul | `#2563EB` |
| Color de énfasis | Verde | `#16A34A` |
| Fondo general | Gris muy claro | `#F8FAFC` |
| Superficies y tarjetas | Blanco | `#FFFFFF` |
| Texto principal | Gris oscuro | `#1F2937` |
| Texto secundario | Gris | `#64748B` |
| Bordes | Gris claro | `#CBD5E1` |
| Advertencia | Ámbar | `#D97706` |
| Error o acción peligrosa | Rojo | `#DC2626` |

El azul identifica las acciones principales y la navegación. El verde comunica operaciones exitosas o estados activos; el ámbar advierte sobre vencimientos y el rojo se reserva para errores, cancelaciones y estados inactivos.

### 2.2. Tipografía

- Fuente principal: `Inter`, con respaldo `Arial, sans-serif`.
- Título principal: 32 px, peso 700.
- Título de sección: 24 px, peso 600.
- Subtítulo o título de tarjeta: 18 px, peso 600.
- Texto normal y campos: 16 px, peso 400.
- Texto auxiliar: 14 px, peso 400.
- Altura de línea recomendada: 1.5 para facilitar la lectura.

## 3. Botones y campos

### 3.1. Botones

| Variante | Uso | Apariencia |
|---|---|---|
| Primario | Guardar, registrar, iniciar sesión o confirmar | Fondo azul, texto blanco |
| Secundario | Volver, cerrar o realizar una acción alternativa | Fondo blanco, borde azul, texto azul |
| Éxito | Renovar o completar una operación positiva | Fondo verde, texto blanco |
| Peligro | Cancelar inscripción, desactivar o eliminar | Fondo rojo, texto blanco |
| Solo texto | Acciones de baja importancia | Sin fondo, texto azul |

Los botones deben tener texto que explique la acción, por ejemplo, `Guardar cliente` en lugar de `Aceptar`. El estado deshabilitado usa fondo gris y no permite interacción. Durante una operación muestra un indicador y un texto como `Guardando...`.

### 3.2. Campos de formulario

Cada campo debe mostrar:

1. Etiqueta visible encima del control.
2. Indicador `*` cuando sea obligatorio.
3. Texto de ayuda cuando el formato pueda generar dudas.
4. Mensaje de validación debajo del campo.

Los controles reutilizables son campo de texto, contraseña con opción de mostrar u ocultar, correo, teléfono, número, precio, fecha, hora, selector, área de texto, casilla y buscador. El foco se identifica con borde azul y los errores con borde rojo y un mensaje concreto.

Ejemplos de mensajes: `El documento es obligatorio`, `La hora de fin debe ser posterior a la hora de inicio` y `Ya existe un cliente con este documento`.

## 4. Componentes reutilizables

### 4.1. Tablas

Las tablas se utilizan para clientes, membresías, entrenadores, programaciones e inscripciones. Deben incluir:

- Encabezados claros y alineación consistente.
- Buscador y filtros cuando el listado lo necesite.
- Paginación y cantidad total de resultados.
- Columna de acciones con opciones según el permiso del usuario.
- Mensaje cuando no existan resultados.
- Vista adaptable en pantallas pequeñas mediante desplazamiento horizontal o tarjetas.

### 4.2. Tarjetas

Las tarjetas muestran información resumida. En el panel de control presentan clientes activos, membresías activas, vencidas, próximas a vencer y actividades programadas. También sirven para mostrar una membresía o una actividad disponible al cliente.

Cada tarjeta contiene título, dato principal, información complementaria y, cuando corresponda, una acción. Usa fondo blanco, borde gris claro, esquinas redondeadas y sombra suave.

### 4.3. Formularios

Los formularios agrupan los campos por tema y mantienen un orden lógico. Las acciones principales se ubican al final: primero `Cancelar` y después `Guardar`. Antes de abandonar un formulario con cambios sin guardar, el sistema debe pedir confirmación.

### 4.4. Alertas y notificaciones

| Tipo | Color | Ejemplo |
|---|---|---|
| Éxito | Verde | `Cliente registrado correctamente.` |
| Información | Azul | `La fecha de vencimiento se calculará automáticamente.` |
| Advertencia | Ámbar | `La membresía vence en 5 días.` |
| Error | Rojo | `No fue posible guardar los cambios.` |

Las notificaciones breves aparecen después de una operación. Los errores que requieren una decisión deben permanecer visibles hasta que el usuario los atienda.

### 4.5. Indicadores de estado

Los estados se presentan como etiquetas con texto y color; el color nunca debe ser la única forma de diferenciarlos.

| Entidad | Estado | Presentación sugerida |
|---|---|---|
| Cliente o entrenador | Activo | Verde |
| Cliente o entrenador | Inactivo | Gris o rojo |
| Membresía | Activa | Verde |
| Membresía | Próxima a vencer | Ámbar |
| Membresía | Vencida | Rojo |
| Membresía | Cancelada | Gris oscuro |
| Membresía | Reemplazada | Azul grisáceo |
| Programación | Programada | Azul |
| Programación | Cancelada | Rojo |
| Inscripción | Activa | Verde |
| Inscripción | Cancelada | Gris |

`Próxima a vencer` es una clasificación visual calculada con la fecha de vencimiento y los días de aviso configurados; no reemplaza el estado almacenado de la membresía.

### 4.6. Ventanas de confirmación

Las acciones de riesgo muestran una ventana con título, explicación y botones claros. Por ejemplo: `¿Cancelar la inscripción?` con las opciones `Volver` y `Sí, cancelar`. Se requiere confirmación para desactivar usuarios, reemplazar o renovar membresías y cancelar programaciones o inscripciones.

## 5. Navegación web

### 5.1. Encabezado

El encabezado contiene el logotipo o nombre del gimnasio, título de la página, acceso al perfil y opción `Cerrar sesión`. En pantallas pequeñas incluye el control para abrir el menú.

### 5.2. Menú lateral

Las opciones se muestran según el rol y los permisos:

| Rol | Opciones principales |
|---|---|
| Administrador | Panel, clientes, membresías, actividades, programaciones, entrenadores, usuarios, roles y configuración |
| Recepcionista | Clientes, membresías, actividades programadas, inscripciones y entrenadores |
| Entrenador | Mi agenda y mis horarios |
| Cliente | Mi perfil, mi membresía, actividades disponibles y mis inscripciones |

La opción activa debe estar resaltada. En dispositivos móviles el menú permanece oculto hasta que el usuario lo abra.

### 5.3. Otros elementos de navegación

- Migas de pan para indicar la ubicación, por ejemplo: `Clientes / Detalle / Membresía`.
- Pestañas para separar información relacionada dentro de un detalle.
- Enlace `Volver` cuando una pantalla dependa de la anterior.
- Paginación en listados extensos.

## 6. Estados de la interfaz

### 6.1. Carga

- Mostrar un indicador dentro del área que está cargando.
- Usar esqueletos en tarjetas y tablas cuando la espera sea visible.
- Deshabilitar temporalmente el botón que envió la operación para evitar registros duplicados.
- Informar la acción con textos como `Cargando clientes...` o `Guardando membresía...`.

### 6.2. Sin resultados

La pantalla explica qué ocurrió y ofrece una salida. Ejemplos: `No hay clientes registrados` con el botón `Registrar cliente`, o `No se encontraron coincidencias` con la opción `Limpiar filtros`.

### 6.3. Error

El mensaje indica el problema en lenguaje sencillo y permite reintentar cuando sea posible. Los errores de permisos muestran `No tienes permiso para acceder a esta función`; una sesión vencida dirige al inicio de sesión.

### 6.4. Confirmación

Después de una operación exitosa se muestra una notificación y se actualiza la información visible. El sistema no debe afirmar que guardó, renovó o canceló hasta recibir una respuesta exitosa.

### 6.5. Validación

La validación se realiza al salir del campo y al enviar el formulario. Se conserva la información correcta para que el usuario no tenga que escribirla otra vez. El resumen de errores se muestra al inicio cuando existan varios campos inválidos.

## 7. Accesibilidad y adaptación

- Mantener contraste suficiente entre texto y fondo.
- Permitir navegación por teclado y mostrar claramente el foco.
- Asociar cada etiqueta con su campo.
- Incluir texto en los iconos de acciones o una descripción accesible.
- No depender únicamente del color para comunicar estados.
- Adaptar tablas, formularios, menú y tarjetas a computador, tableta y celular.

## 8. Criterio de reutilización

Botones, campos, tablas, tarjetas, alertas, etiquetas de estado y ventanas de confirmación deben implementarse como componentes comunes. Así se evita crear un diseño diferente para cada módulo y se facilita el mantenimiento de la aplicación.
