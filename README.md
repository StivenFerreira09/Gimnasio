# Sistema de Gestión para Gimnasios

Plataforma diseñada para optimizar y centralizar la gestión operativa y administrativa de un gimnasio. El sistema busca facilitar el control de clientes, membresías, clases y entrenadores, reduciendo la dependencia de registros manuales y mejorando el acceso a la información.

---

## Objetivo del proyecto

El objetivo principal es desarrollar una solución centralizada que permita mejorar la organización y administración de un gimnasio.

El sistema estará orientado a:

* **Optimizar la administración:** Mantener un control claro y actualizado de los clientes, sus membresías y las fechas de vencimiento.
* **Centralizar la información:** Reunir en una sola plataforma la información relacionada con clientes, membresías, clases, entrenadores y otros procesos administrativos.
* **Mejorar la gestión operativa:** Facilitar el registro, consulta y actualización de la información necesaria para el funcionamiento diario del gimnasio.
* **Fortalecer la gestión de clases:** Facilitar la programación de clases, asignación de entrenadores y gestión de inscripciones.
* **Reducir procesos manuales:** Disminuir el uso de registros dispersos y hojas de cálculo, mejorando la organización y eficiencia del personal.

---

## Alcance del sistema

El proyecto contempla el desarrollo de los siguientes módulos y componentes principales:

### Gestión de clientes y membresías

Permitirá registrar y administrar la información de los clientes, así como gestionar los diferentes tipos de membresías, su asignación, vigencia, renovación y fechas de vencimiento.

### Gestión de clases

Permitirá crear y organizar las clases ofrecidas por el gimnasio, definir horarios y capacidad, asignar entrenadores y gestionar la inscripción de los clientes.

### Gestión de entrenadores

Permitirá registrar y consultar la información de los entrenadores, así como asignarlos a las diferentes clases y consultar sus horarios.

### Dashboard y reportes

El sistema contará con un panel de control que proporcionará una visión general de la operación del gimnasio, incluyendo información sobre clientes activos, membresías activas y vencidas, membresías próximas a vencer y clases programadas.

### Autenticación y permisos

Permitirá gestionar el acceso al sistema mediante cuatro roles:

- **Administrador**
- **Personal del gimnasio**
- **Entrenador**
- **Cliente**

Cada tipo de usuario podrá acceder únicamente a las funcionalidades correspondientes a sus permisos.

### Base de datos y modelado

Se diseñará una estructura de base de datos relacional para almacenar y organizar de forma segura la información relacionada con clientes, membresías, tipos de membresía, clases, inscripciones, entrenadores, usuarios y roles.

---

## Roles del sistema

### Administrador

Es el usuario encargado de administrar y supervisar la información general del gimnasio.

Podrá:

- Administrar clientes.
- Administrar membresías.
- Gestionar clases.
- Gestionar entrenadores.
- Consultar el dashboard.
- Administrar roles y permisos.

### Personal del gimnasio

Es el usuario encargado de realizar las actividades operativas del gimnasio mediante el sistema.

Podrá, según los permisos asignados:

- Registrar y consultar clientes.
- Gestionar información de membresías.
- Consultar y gestionar clases.
- Consultar información de entrenadores.

### Entrenador

Es el usuario encargado de dirigir las clases que le sean asignadas.

Podrá:

- Iniciar sesión.
- Consultar las clases que tiene asignadas.
- Consultar sus horarios.
- Consultar la información de las clases correspondientes.

### Cliente

Es el usuario que utiliza los servicios del gimnasio y tendrá acceso al sistema mediante una cuenta personal.

Podrá:

- Iniciar sesión.
- Consultar su información personal.
- Consultar su membresía.
- Consultar el estado y vencimiento de su membresía.
- Consultar las clases disponibles.
- Inscribirse en clases.
- Cancelar sus propias inscripciones.
- Consultar las clases en las que está inscrito.
