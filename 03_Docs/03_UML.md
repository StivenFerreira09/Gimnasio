# 14. Diagrama de casos de uso:

![Diagrama de casos de uso - Gestión de Clientes](media/image1.png)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-01 | Módulo 1: Gestión de Clientes | Registrar un nuevo cliente con sus datos básicos (nombre, documento, contacto), validando campos obligatorios y confirmando el guardado. |
| RF-02 |  | Consultar el listado de clientes registrados y el detalle de un cliente seleccionado. |
| RF-03 |  | Buscar un cliente por nombre o documento, informando si no hay coincidencias. |
| RF-04 |  | Editar los datos de un cliente existente y guardar los cambios con confirmación. |
| RF-05 |  | Cambiar el estado de un cliente (activo/inactivo), con confirmación previa. |
| RF-06 |  | Consultar la membresía propia (tipo, estado y fecha de vencimiento). |

![Diagrama de casos de uso - Gestión de Membresías](media/image2.png)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-07 | Módulo 2: Gestión de Membresías | Crear tipos de membresía definiendo nombre, precio y duración. |
| RF-08 |  | Consultar el catálogo de membresías registradas. |
| RF-09 |  | Asignar una membresía a un cliente, calculando automáticamente la fecha de vencimiento según la duración. |
| RF-10 |  | Consultar membresías activas, vencidas y próximas a vencer, con sus fechas. |
| RF-11 |  | Renovar la membresía de un cliente, extendiendo el vencimiento desde la fecha actual, con confirmación. |

![Diagrama de casos de uso - Gestión de Clases](media/image3.png)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-12 | Módulo 3: Gestión de Clases | Crear una clase con nombre, horario y capacidad máxima. |
| RF-13 |  | Asignar un entrenador a una clase. |
| RF-14 |  | Consultar las clases disponibles, con horario, cupo restante y entrenador asignado. |
| RF-15 |  | Inscribirse en una clase disponible, validando que exista cupo. |
| RF-16 |  | Cancelar la propia inscripción, liberando el cupo. |
| RF-17 |  | Consultar los clientes inscritos en una clase y su cantidad total. |
| RF-18 |  | Consultar las clases y horarios propios asignados. |
| RF-19 |  | Consultar las clases en las que el cliente está inscrito. |

![Diagrama de casos de uso - Gestión de Entrenadores](media/image4.png)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-20 | Módulo 4: Gestión de Entrenadores | Registrar un entrenador con su información básica. |
| RF-21 |  | Editar la información de un entrenador. |
| RF-22 |  | Consultar a los entrenadores registrados y su detalle. |
| RF-23 |  | Consultar qué entrenador está asignado a cada clase. |

![Diagrama de casos de uso - Panel de Control](media/image5.jpg)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-24 | Módulo 5: Panel de Control | Mostrar un panel con: clientes activos, membresías activas/vencidas, membresías próximas a vencer y clases programadas. |

![Diagrama de casos de uso - Autenticación y Permisos](media/image6.png)

| **RF** | **Módulo** | **Descripción** |
| --- | --- | --- |
| RF-25 | Módulo 6: Autenticación y Permisos | Iniciar sesión validando usuario y contraseña; mostrar solo las funciones permitidas según el rol. |
| RF-26 |  | Cerrar sesión, bloqueando el acceso a funciones protegidas sin re-autenticación. |
| RF-27 |  | Recuperar contraseña mediante un proceso de verificación de identidad. |
| RF-28 |  | Restringir el acceso a las funcionalidades según 4 roles fijos: administrador, recepcionista, entrenador, cliente. |

# 15. Diagrama de clases:

![Diagrama de clases](media/diagrama_de_clases.drawio.png)

# 16. Diagrama de secuencia:

## GESTIÓN DE CLIENTES:

![Diagrama de secuencia - Gestión de Clientes](media/image8.png)

## GESTIÓN DE MEMBRESÍAS:

![Diagrama de secuencia - Gestión de Clientes (detalle)](media/image9.png)

## GESTIÓN DE CLASES:

![Diagrama de secuencia - Gestión de Clases](media/image10.png)

## GESTIÓN DE ENTRENADORES:

![Diagrama de secuencia - Gestión de Entrenadores](media/image11.png)

## DASHBOARD Y REPORTES:

![Diagrama de secuencia - Dashboard y Reportes](media/image12.png)

## AUTENTICACIÓN Y PERMISOS:

![Diagrama de secuencia - Autenticación y Permisos](media/image13.png)

# 17. Diagrama de actividades:

![Diagrama de actividades](media/image14.png)

[Ver diagrama de actividades en Google Drive](https://drive.google.com/file/d/1INYt-NLiz86tPXzoBqL4U4n0PhBwj6iL/view?usp=drive_link)
