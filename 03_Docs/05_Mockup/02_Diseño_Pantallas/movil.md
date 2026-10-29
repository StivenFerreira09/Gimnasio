# Diseño de Pantallas — Móvil

Prototipo móvil del Sistema de Gestión de Gimnasio, adaptado a pantalla táctil y uso con una mano.

## Características de la interfaz móvil

| Elemento | Comportamiento |
|----------|----------------|
| Navegación Admin / Recepcionista | Menú lateral tipo drawer (ícono hamburguesa) |
| Navegación Cliente | Tab Bar inferior: Mi membresía · Actividades · Inscripciones · Salir |
| Navegación Entrenador | Tab Bar inferior: Mis actividades · Mi horario · Salir |
| Formularios | Una sola columna vertical. Botones fijos en la parte inferior (sticky) |
| Listados | Cards apiladas |
| Header | Título de la sección + avatar del usuario o botón de regreso |

---

## Grupos de pantallas

### Grupo A · Acceso
| Código | Pantalla | Descripción |
|--------|----------|-------------|
| A1 | Iniciar sesión | Formulario de usuario y contraseña |
| A2 | Error de credenciales | Mensaje de error en el login |
| A3 | Recuperar contraseña | Solicitar código por teléfono o correo |
| A4 / A5 | Ingresar código | Validación del código de 6 dígitos |
| A6 | Nueva contraseña | Crear y confirmar nueva contraseña |
| A7 | Confirmación | Contraseña actualizada correctamente |

### Grupo B · Inicio y menús
| Código | Pantalla | Roles |
|--------|----------|-------|
| B1 | Dashboard / Inicio Administrador | Administrador |
| B2 | Inicio Recepcionista (buscar cliente / próximas a vencer) | Recepcionista |

### Grupo C · Clientes
| Código | Pantalla |
|--------|----------|
| C1 | Listado de clientes |
| C2 | Sin resultados |
| C3 | Registrar cliente |
| C4 | Detalle de cliente |
| C5 | Desactivar cliente |

### Grupo D · Membresías y Beneficios
| Código | Pantalla |
|--------|----------|
| D1 | Tipos de membresía |
| D2 | Crear / configurar tipo de membresía |
| D3 / D4 | Asignar membresía |
| D5 | Membresías por estado |
| D6 | Renovar membresía |
| D7 | Beneficios |

### Grupo E · Actividades, Espacios y Programación
| Código | Pantalla |
|--------|----------|
| E1 | Catálogo de actividades |
| E2 | Espacios |
| E3 | Programación semanal |
| E4 | Programar actividad |
| E5 | Detalle e inscritos |
| E6 | Cancelar programación |

### Grupo F · Entrenadores
| Código | Pantalla |
|--------|----------|
| F1 | Listado de entrenadores |
| F2 | Registrar entrenador |
| F3 | Detalle de entrenador |
| F4 | Desactivar entrenador |

### Grupo G · Usuarios, Permisos y Configuración
| Código | Pantalla |
|--------|----------|
| G1 | Listado de usuarios |
| G2 | Registrar administrador o recepcionista |
| G3 | Roles y permisos |
| G4 | Crear credenciales |
| G5 | Configuración (días de aviso) |

### Grupo H · Vistas del Cliente
| Código | Pantalla |
|--------|----------|
| H1 | Mi membresía |
| H2 | Actividades disponibles |
| H3 | Confirmar inscripción |
| H4 | Límite de cupos alcanzado |
| H5 | Mis inscripciones |
| H6 | Cancelar inscripción |

### Grupo I · Vistas del Entrenador
| Código | Pantalla |
|--------|----------|
| I1 | Mis actividades |
| I2 | Mi horario |

---

## Evidencias gráficas

### Componentes
![Componentes](../../media/movil/capturas/00_Componentes.png)

### Mapa de navegación
![Mapa de navegación](../../media/movil/capturas/01_Mapa_de_navegacion.png)

### Acceso
![Acceso](../../media/movil/capturas/02_Acceso.png)

### Inicio y menús
![Inicio y menús](../../media/movil/capturas/03_Inicio_y_menus.png)

### Clientes
![Clientes](../../media/movil/capturas/04_Clientes.png)

### Membresías y beneficios
![Membresías](../../media/movil/capturas/05_Membresias_y_beneficios.png)

### Actividades, espacios y programación
![Actividades](../../media/movil/capturas/06_Actividades_espacios_y_programacion.png)

### Entrenadores
![Entrenadores](../../media/movil/capturas/07_Entrenadores.png)

### Usuarios, permisos y configuración
![Usuarios](../../media/movil/capturas/08_Usuarios_permisos_y_configuracion.png)

### Vistas del Cliente
![Vistas del Cliente](../../media/movil/capturas/09_Vistas_del_Cliente.png)

### Vistas del Entrenador
![Vistas del Entrenador](../../media/movil/capturas/10_Vistas_del_Entrenador.png)
