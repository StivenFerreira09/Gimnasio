# 1. Descripción del problema

Actualmente, la gestión de un gimnasio puede realizarse de manera manual o utilizando diferentes herramientas para controlar clientes, membresías, pagos, clases y entrenadores. Esto puede generar problemas como:

Información de clientes desorganizada.

Dificultad para controlar las membresías activas y vencidas.

Problemas para llevar un registro de los pagos.

Dificultad para organizar las clases y horarios.

Falta de información centralizada.

Mayor cantidad de trabajo manual para el personal administrativo.

### Problema central

El gimnasio necesita un sistema centralizado que permita gestionar de manera eficiente clientes, membresías, pagos, clases y entrenadores, reduciendo el trabajo manual y facilitando el acceso a la información.

# 2. Objetivo del sistema

Desarrollar un Sistema de Gestión de Gimnasio que permita administrar de manera centralizada la información de los clientes, membresías, pagos, clases y entrenadores, facilitando las actividades administrativas y mejorando la organización del gimnasio.

### Objetivos específicos

Registrar y administrar clientes.

Gestionar los diferentes tipos de membresías.

Controlar pagos y vencimientos.

Administrar las clases y sus horarios.

Gestionar entrenadores.

Permitir la inscripción de clientes a clases.

Generar reportes sobre la información del gimnasio.

Proporcionar diferentes permisos dependiendo del tipo de usuario.

# 3. Usuarios del sistema

El sistema tendrá principalmente cuatro tipos de usuarios:

# 4. Épicas

## 4.1 Gestión de clientes

El sistema permitirá administrar la información de los clientes del gimnasio, facilitando su registro, consulta y actualización.

El sistema permitirá:

Registrar nuevos clientes.

Consultar la información de los clientes.

Editar los datos de los clientes.

Buscar clientes registrados.

Desactivar clientes cuando ya no hagan parte del gimnasio.

Consultar la información de la membresía asociada a cada cliente.

## 4.2 Gestión de membresías

El sistema permitirá administrar las diferentes membresías ofrecidas por el gimnasio y controlar su asignación, vigencia y renovación.

El sistema permitirá:

Crear diferentes tipos de membresía.

Definir el precio de cada membresía.

Definir la duración de cada membresía.

Asignar una membresía a un cliente.

Consultar las membresías activas.

Consultar las membresías vencidas.

Renovar membresías.

Consultar las fechas de vencimiento.

## 4.3 Gestión de pagos

El sistema permitirá administrar los pagos realizados por los clientes y relacionarlos con las membresías correspondientes.

El sistema permitirá:

Registrar pagos.

Consultar el historial de pagos.

Asociar pagos con una membresía.

Consultar ingresos.

Generar reportes de pagos.

## 4.4 Gestión de clases

El sistema permitirá administrar las clases ofrecidas por el gimnasio y controlar la inscripción de los clientes.

El sistema permitirá:

Crear clases.

Definir horarios.

Definir la capacidad máxima.

Asignar un entrenador.

Consultar clases disponibles.

Inscribir clientes.

Cancelar inscripciones.

Consultar los alumnos inscritos.

## 4.5 Gestión de entrenadores

El sistema permitirá administrar la información de los entrenadores y su asignación a las diferentes clases del gimnasio.

El sistema permitirá:

Registrar entrenadores.

Editar información.

Consultar entrenadores.

Asignar entrenadores a clases.

Consultar horarios de los entrenadores.

## 4.6 Dashboard y reportes

El sistema proporcionará al administrador un panel con información resumida sobre la operación del gimnasio.

El administrador podrá consultar:

Cantidad de clientes activos.

Membresías activas.

Membresías vencidas.

Membresías próximas a vencer.

Pagos realizados.

Ingresos por período.

Clases programadas.

## 4.7 Autenticación y permisos

El sistema permitirá controlar el acceso de los usuarios y administrar los permisos de acuerdo con el rol asignado.

El sistema contará con:

Inicio de sesión.

Cierre de sesión.

Recuperación de contraseña.

Administración de roles.

Permisos según el tipo de usuario.

Los roles contemplados serán:

Administrador.

Personal del gimnasio.

Entrenador.

Cliente.

# 5. Historias de usuario

## Épica 4.1 Gestión de clientes

### HU-01: Registrar cliente

Como administrador o personal del gimnasio, quiero registrar un nuevo cliente, para almacenar su información y poder gestionarla desde el sistema.

### Criterios de aceptación:

El sistema debe permitir ingresar la información requerida del cliente.

El sistema debe validar los campos obligatorios.

El sistema debe guardar correctamente la información.

El sistema debe mostrar una confirmación cuando el registro sea exitoso.

**Prioridad: Alta**

### HU-02: Consultar clientes

Como administrador o personal del gimnasio, quiero consultar los clientes registrados, para acceder fácilmente a su información.

### Criterios de aceptación:

El sistema debe mostrar los clientes registrados.

El sistema debe permitir consultar la información de un cliente.

La información mostrada debe corresponder al cliente seleccionado.

**Prioridad: Alta**

### HU-03: Buscar cliente

Como administrador o personal del gimnasio, quiero buscar un cliente por sus datos identificativos, para encontrar rápidamente su información.

### Criterios de aceptación:

El sistema debe permitir ingresar un criterio de búsqueda.

El sistema debe mostrar los clientes que coincidan con el criterio.

Si no existen coincidencias, el sistema debe informar al usuario.

**Prioridad: Alta**

### HU-04: Editar información del cliente

Como administrador o personal autorizado, quiero editar la información de un cliente, para mantener sus datos actualizados.

### Criterios de aceptación:

El sistema debe permitir seleccionar un cliente.

El sistema debe permitir modificar sus datos.

El sistema debe guardar los cambios realizados.

El sistema debe informar cuando la actualización sea exitosa.

**Prioridad: Media**

### HU-05: Desactivar cliente

Como administrador, quiero desactivar un cliente, para evitar que continúe apareciendo como cliente activo cuando ya no utiliza los servicios del gimnasio.

### Criterios de aceptación:

El sistema debe permitir seleccionar un cliente activo.

El sistema debe solicitar confirmación antes de desactivarlo.

El sistema debe cambiar el estado del cliente.

El cliente desactivado no debe aparecer como cliente activo.

**Prioridad: Media**

### HU-06: Consultar membresía del cliente

Como cliente, quiero consultar la información de mi membresía, para conocer el plan que tengo contratado y su estado.

### Criterios de aceptación:

El cliente debe poder consultar su membresía.

El sistema debe mostrar el tipo de membresía.

El sistema debe mostrar su estado.

El sistema debe mostrar la fecha de vencimiento.

**Prioridad: Alta**

## Épica 4.2 Gestión de membresías

### HU-07: Crear tipo de membresía

Como administrador, quiero crear diferentes tipos de membresía, para ofrecer distintas opciones a los clientes.

### Criterios de aceptación:

El sistema debe permitir registrar una membresía.

Debe permitir definir su nombre.

Debe permitir establecer su precio.

Debe permitir establecer su duración.

El sistema debe guardar la información correctamente.

**Prioridad: Alta**

### HU-08: Consultar membresías

Como administrador o personal autorizado, quiero consultar las membresías disponibles, para conocer las opciones ofrecidas por el gimnasio.

### Criterios de aceptación:

El sistema debe mostrar las membresías registradas.

Debe mostrar el precio y duración.

La información debe ser clara y consultable.

**Prioridad: Alta**

### HU-09: Asignar membresía a cliente

Como administrador o personal autorizado, quiero asignar una membresía a un cliente, para registrar el servicio contratado.

### Criterios de aceptación:

El sistema debe permitir seleccionar un cliente.

El sistema debe permitir seleccionar una membresía.

El sistema debe registrar la fecha de inicio.

El sistema debe establecer la fecha de vencimiento según la duración.

La membresía debe quedar asociada al cliente.

**Prioridad: Alta**

### HU-10: Consultar estado de membresías

Como administrador, quiero consultar las membresías activas, vencidas y próximas a vencer, para realizar un seguimiento de su estado.

### Criterios de aceptación:

El sistema debe permitir consultar membresías activas.

El sistema debe permitir identificar membresías vencidas.

El sistema debe permitir identificar membresías próximas a vencer.

La información debe mostrar las fechas correspondientes.

**Prioridad: Alta**

### HU-11: Renovar membresía

Como cliente, quiero renovar mi membresía, para mantener activo mi acceso a los servicios del gimnasio.

### Criterios de aceptación:

El cliente debe poder seleccionar su membresía.

El sistema debe permitir iniciar el proceso de renovación.

El sistema debe actualizar la vigencia de la membresía.

El sistema debe mostrar la nueva fecha de vencimiento.

**Prioridad: Media**

## Épica 4.3 Gestión de pagos

### HU-12: Registrar pago

Como administrador o personal autorizado, quiero registrar el pago realizado por un cliente, para mantener actualizado su historial de pagos.

### Criterios de aceptación:

El sistema debe permitir seleccionar el cliente.

El sistema debe permitir seleccionar la membresía relacionada.

El sistema debe registrar el valor y la fecha del pago.

El sistema debe guardar correctamente la información.

**Prioridad: Alta**

### HU-13: Consultar historial de pagos

Como cliente, quiero consultar mi historial de pagos, para conocer los pagos que he realizado al gimnasio.

### Criterios de aceptación:

El cliente debe poder consultar sus pagos.

El sistema debe mostrar los pagos registrados.

Cada pago debe mostrar como mínimo la fecha y el valor.

El cliente no debe poder consultar los pagos de otros clientes.

**Prioridad: Alta**

### HU-14: Consultar ingresos

Como administrador, quiero consultar los ingresos generados por los pagos, para conocer el comportamiento económico del gimnasio.

### Criterios de aceptación:

El sistema debe permitir consultar los ingresos.

Debe permitir seleccionar un período.

Debe mostrar el total correspondiente al período seleccionado.

**Prioridad: Media**

### HU-15: Generar reporte de pagos

Como administrador, quiero generar reportes de pagos, para analizar y respaldar la información financiera del gimnasio.

### Criterios de aceptación:

El sistema debe permitir seleccionar un período.

El sistema debe mostrar los pagos correspondientes.

El reporte debe presentar información organizada.

**Prioridad: Baja**

## Épica 4.4: Gestión de clases

### HU-16: Crear clase

Como administrador, quiero crear una clase, para organizar las actividades ofrecidas por el gimnasio.

### Criterios de aceptación:

El sistema debe permitir registrar una clase.

Debe permitir definir su nombre.

Debe permitir establecer el horario.

Debe permitir establecer la capacidad máxima.

**Prioridad: Alta**

### HU-17: Asignar entrenador a clase

Como administrador, quiero asignar un entrenador a una clase, para organizar quién estará encargado de dirigirla.

### Criterios de aceptación:

El sistema debe permitir seleccionar una clase.

Debe permitir seleccionar un entrenador.

El sistema debe registrar la asignación.

**Prioridad: Alta**

### HU-18: Consultar clases disponibles

Como cliente, quiero consultar las clases disponibles, para conocer las actividades a las que puedo inscribirme.

### Criterios de aceptación:

El sistema debe mostrar las clases disponibles.

Debe mostrar el horario.

Debe mostrar la capacidad disponible.

Debe mostrar el entrenador asignado cuando corresponda.

**Prioridad: Alta**

### HU-19: Inscribirse en una clase

Como cliente, quiero inscribirme en una clase disponible, para participar en las actividades del gimnasio.

### Criterios de aceptación:

El sistema debe permitir seleccionar una clase disponible.

El sistema debe verificar que exista cupo.

El sistema debe registrar la inscripción.

El sistema debe informar cuando la inscripción sea exitosa.

**Prioridad: Alta**

### HU-20: Cancelar inscripción

Como cliente, quiero cancelar mi inscripción en una clase, para liberar el cupo cuando no pueda participar.

### Criterios de aceptación:

El sistema debe permitir seleccionar una inscripción propia.

Debe solicitar confirmación.

El sistema debe cancelar la inscripción.

El cupo debe quedar disponible nuevamente.

**Prioridad: Media**

### HU-21: Consultar alumnos inscritos

Como administrador o personal autorizado, quiero consultar los clientes inscritos en una clase, para conocer la cantidad de participantes.

### Criterios de aceptación:

El sistema debe permitir seleccionar una clase.

Debe mostrar los clientes inscritos.

Debe mostrar la cantidad de inscritos.

**Prioridad: Media**

## Épica 4.5: Gestión de entrenadores

### HU-22: Registrar entrenador

Como administrador, quiero registrar entrenadores, para mantener organizada la información del personal encargado de las clases.

### Criterios de aceptación:

El sistema debe permitir registrar un entrenador.

Debe permitir ingresar su información básica.

El sistema debe guardar correctamente los datos.

**Prioridad: Alta**

### HU-23: Editar información del entrenador

Como administrador, quiero editar la información de un entrenador, para mantener sus datos actualizados.

### Criterios de aceptación:

El sistema debe permitir seleccionar un entrenador.

Debe permitir modificar su información.

Debe guardar los cambios realizados.

**Prioridad: Media**

### HU-24: Consultar entrenadores

Como administrador o personal autorizado, quiero consultar los entrenadores registrados, para conocer la información del personal disponible.

### Criterios de aceptación:

El sistema debe mostrar los entrenadores registrados.

Debe permitir consultar su información.

La información debe corresponder al entrenador seleccionado.

**Prioridad: Media**

### HU-25: Consultar horarios del entrenador

Como entrenador, quiero consultar mis horarios, para conocer las clases que tengo asignadas.

### Criterios de aceptación:

El sistema debe identificar al entrenador.

Debe mostrar las clases asignadas.

Debe mostrar los horarios correspondientes.

**Prioridad: Media**

## Épica 4.6 Dashboard y reportes

### HU-26: Consultar dashboard

Como administrador, quiero consultar un dashboard con información general del gimnasio, para conocer rápidamente el estado de la operación.

### Criterios de aceptación:

El dashboard debe mostrar información resumida.

Debe mostrar la cantidad de clientes activos.

Debe mostrar las membresías activas y vencidas.

Debe mostrar información relacionada con pagos.

Debe mostrar las clases programadas.

**Prioridad: Alta**

### HU-27: Consultar membresías próximas a vencer

Como administrador, quiero consultar las membresías próximas a vencer, para realizar un seguimiento de los clientes que deben renovar.

### Criterios de aceptación:

El sistema debe identificar las membresías próximas a vencer.

Debe mostrar el cliente asociado.

Debe mostrar la fecha de vencimiento.

**Prioridad: Media**

### HU-28: Consultar ingresos por período

Como administrador, quiero consultar los ingresos por período, para analizar los ingresos generados por el gimnasio.

### Criterios de aceptación:

El sistema debe permitir seleccionar un período.

Debe mostrar los ingresos correspondientes.

El total debe corresponder a los pagos registrados durante el período.

**Prioridad: Media**

## Épica 4.7 Autenticación y permisos

### HU-29: Iniciar sesión

Como usuario del sistema, quiero iniciar sesión con mis credenciales, para acceder a las funcionalidades correspondientes a mi rol.

### Criterios de aceptación:

El sistema debe solicitar las credenciales.

Debe validar el usuario y la contraseña.

Si las credenciales son correctas, debe permitir el acceso.

Si son incorrectas, debe mostrar un mensaje de error.

El sistema debe mostrar únicamente las funcionalidades permitidas para el rol del usuario.

**Prioridad: Alta**

### HU-30: Cerrar sesión

Como usuario del sistema, quiero cerrar sesión, para proteger mi cuenta cuando termine de utilizar el sistema.

### Criterios de aceptación:

El sistema debe permitir cerrar la sesión.

Después de cerrar sesión, el usuario no debe poder acceder a las funciones protegidas sin autenticarse nuevamente.

**Prioridad: Alta**

### HU-31: Recuperar contraseña

Como usuario del sistema, quiero recuperar mi contraseña, para poder volver a acceder a mi cuenta cuando la haya olvidado.

### Criterios de aceptación:

El sistema debe permitir iniciar el proceso de recuperación.

Debe solicitar la información necesaria para identificar la cuenta.

Debe permitir establecer una nueva contraseña.

**Prioridad: Media**

### HU-32: Administrar roles y permisos

Como administrador, quiero administrar los roles y permisos de los usuarios, para controlar el acceso a las funcionalidades del sistema.

### Criterios de aceptación:

El administrador debe poder consultar los roles disponibles.

Debe poder asignar un rol a un usuario.

Los permisos deben determinar las funcionalidades a las que puede acceder cada usuario.

El cliente solamente debe poder acceder a la información y funciones correspondientes a su propia cuenta.

**Prioridad: Alta**



| Usuario | Función |

| --- | --- |

| Administrador | Es el usuario encargado de administrar y supervisar la información general del gimnasio. Podrá: Administrar clientes. Administrar membresías. Gestionar pagos. Gestionar clases. Gestionar entrenadores. Consultar el dashboard. Consultar información y reportes. Administrar roles y permisos. |

| Recepcionista | Es el usuario encargado de realizar las actividades operativas del gimnasio mediante el sistema. Podrá: Registrar y consultar clientes. Gestionar información de membresías según sus permisos. Registrar y consultar pagos. Consultar y gestionar clases según sus permisos. Consultar información de entrenadores. |

| Entrenador | Es el usuario encargado de dirigir las clases que le sean asignadas. Podrá: Iniciar sesión. Consultar las clases que tiene asignadas. Consultar sus horarios. Consultar la información de las clases correspondientes. |

| Cliente | Es el usuario que utiliza los servicios del gimnasio y que tendrá acceso al sistema mediante una cuenta personal. Podrá: Iniciar sesión. Consultar su información personal. Consultar su membresía. Consultar el estado y vencimiento de su membresía. Consultar sus pagos. Consultar las clases disponibles. Inscribirse en clases. Cancelar sus inscripciones. Consultar sus clases inscritas. |

