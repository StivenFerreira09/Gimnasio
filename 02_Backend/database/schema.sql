-- Sistema de Gestion de Gimnasio
-- DDL compatible con MySQL 8.0.16 o superior.

CREATE DATABASE IF NOT EXISTS gimnasio
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE gimnasio;

-- ============================================================
-- Nivel 1: tablas raiz
-- ============================================================

CREATE TABLE rol (
    id_rol BIGINT AUTO_INCREMENT,
    nombre ENUM('Administrador', 'Recepcionista', 'Entrenador', 'Cliente') NOT NULL,
    descripcion VARCHAR(255) NULL,
    CONSTRAINT pk_rol PRIMARY KEY (id_rol),
    CONSTRAINT uq_rol_nombre UNIQUE (nombre)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE permiso (
    id_permiso BIGINT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL,
    CONSTRAINT pk_permiso PRIMARY KEY (id_permiso),
    CONSTRAINT uq_permiso_nombre UNIQUE (nombre)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE tipo_membresia (
    id_tipo_membresia BIGINT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion INT NOT NULL,
    unidad_duracion ENUM('Dias', 'Meses') NOT NULL,
    CONSTRAINT pk_tipo_membresia PRIMARY KEY (id_tipo_membresia),
    CONSTRAINT uq_tipo_membresia_nombre UNIQUE (nombre),
    CONSTRAINT chk_tipo_membresia_precio CHECK (precio >= 0),
    CONSTRAINT chk_tipo_membresia_duracion CHECK (duracion > 0)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE beneficio (
    id_beneficio BIGINT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
    CONSTRAINT pk_beneficio PRIMARY KEY (id_beneficio),
    CONSTRAINT uq_beneficio_nombre UNIQUE (nombre)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE actividad (
    id_actividad BIGINT AUTO_INCREMENT,
    nombre_actividad VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    capacidad_maxima INT NOT NULL,
    estado ENUM('Activa', 'Inactiva') NOT NULL DEFAULT 'Activa',
    CONSTRAINT pk_actividad PRIMARY KEY (id_actividad),
    CONSTRAINT chk_actividad_capacidad CHECK (capacidad_maxima > 0)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE espacio (
    id_espacio BIGINT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    CONSTRAINT pk_espacio PRIMARY KEY (id_espacio),
    CONSTRAINT chk_espacio_capacidad CHECK (capacidad > 0)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE configuracion (
    id_configuracion BIGINT NOT NULL,
    dias_aviso_vencimiento INT NOT NULL,
    CONSTRAINT pk_configuracion PRIMARY KEY (id_configuracion),
    CONSTRAINT chk_configuracion_unica CHECK (id_configuracion = 1),
    CONSTRAINT chk_configuracion_dias CHECK (dias_aviso_vencimiento >= 1)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ============================================================
-- Nivel 2: seguridad y relaciones entre catalogos
-- ============================================================

CREATE TABLE rol_permiso (
    id_rol BIGINT NOT NULL,
    id_permiso BIGINT NOT NULL,
    CONSTRAINT pk_rol_permiso PRIMARY KEY (id_rol, id_permiso),
    CONSTRAINT fk_rol_permiso_rol
        FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_rol_permiso_permiso
        FOREIGN KEY (id_permiso) REFERENCES permiso (id_permiso)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE usuario (
    id_usuario BIGINT AUTO_INCREMENT,
    id_rol BIGINT NOT NULL,
    nombre_usuario VARCHAR(50) NULL,
    contrasena VARCHAR(255) NULL,
    nombre VARCHAR(150) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(150) NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuario_nombre_usuario UNIQUE (nombre_usuario),
    CONSTRAINT uq_usuario_documento UNIQUE (documento),
    CONSTRAINT chk_usuario_credenciales CHECK (
        (nombre_usuario IS NULL) = (contrasena IS NULL)
    ),
    CONSTRAINT fk_usuario_rol
        FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_usuario_nombre (nombre)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE tipo_membresia_actividad (
    id_tipo_membresia BIGINT NOT NULL,
    id_actividad BIGINT NOT NULL,
    limite INT NULL,
    periodo_limite ENUM('Semana', 'Mes', 'Vigencia') NULL,
    CONSTRAINT pk_tipo_membresia_actividad
        PRIMARY KEY (id_tipo_membresia, id_actividad),
    CONSTRAINT chk_tma_limite_periodo CHECK (
        (limite IS NULL AND periodo_limite IS NULL)
        OR (limite IS NOT NULL AND periodo_limite IS NOT NULL)
    ),
    CONSTRAINT chk_tma_limite_positivo CHECK (limite IS NULL OR limite > 0),
    CONSTRAINT fk_tma_tipo_membresia
        FOREIGN KEY (id_tipo_membresia)
        REFERENCES tipo_membresia (id_tipo_membresia)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_tma_actividad
        FOREIGN KEY (id_actividad) REFERENCES actividad (id_actividad)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE tipo_membresia_beneficio (
    id_tipo_membresia BIGINT NOT NULL,
    id_beneficio BIGINT NOT NULL,
    cantidad VARCHAR(50) NULL,
    CONSTRAINT pk_tipo_membresia_beneficio
        PRIMARY KEY (id_tipo_membresia, id_beneficio),
    CONSTRAINT fk_tmb_tipo_membresia
        FOREIGN KEY (id_tipo_membresia)
        REFERENCES tipo_membresia (id_tipo_membresia)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_tmb_beneficio
        FOREIGN KEY (id_beneficio) REFERENCES beneficio (id_beneficio)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ============================================================
-- Nivel 3: subtipos de usuario
-- ============================================================

CREATE TABLE cliente (
    id_usuario BIGINT NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_usuario),
    CONSTRAINT fk_cliente_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE entrenador (
    id_usuario BIGINT NOT NULL,
    CONSTRAINT pk_entrenador PRIMARY KEY (id_usuario),
    CONSTRAINT fk_entrenador_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ============================================================
-- Nivel 4: operacion principal
-- ============================================================

CREATE TABLE horario_entrenador (
    id_horario_entrenador BIGINT AUTO_INCREMENT,
    id_entrenador BIGINT NOT NULL,
    dia_semana ENUM(
        'Lunes', 'Martes', 'Miercoles', 'Jueves',
        'Viernes', 'Sabado', 'Domingo'
    ) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT pk_horario_entrenador PRIMARY KEY (id_horario_entrenador),
    CONSTRAINT chk_horario_horas CHECK (hora_fin > hora_inicio),
    CONSTRAINT fk_horario_entrenador_entrenador
        FOREIGN KEY (id_entrenador) REFERENCES entrenador (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_horario_entrenador_dia (id_entrenador, dia_semana)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE membresia (
    id_membresia BIGINT AUTO_INCREMENT,
    id_cliente BIGINT NOT NULL,
    id_tipo_membresia BIGINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado ENUM('Activa', 'Vencida', 'Cancelada', 'Reemplazada')
        NOT NULL DEFAULT 'Activa',
    CONSTRAINT pk_membresia PRIMARY KEY (id_membresia),
    CONSTRAINT chk_membresia_fechas CHECK (fecha_vencimiento > fecha_inicio),
    CONSTRAINT fk_membresia_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_membresia_tipo_membresia
        FOREIGN KEY (id_tipo_membresia)
        REFERENCES tipo_membresia (id_tipo_membresia)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_membresia_estado_vencimiento (estado, fecha_vencimiento)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ============================================================
-- Triggers de unicidad condicional
-- ============================================================

DELIMITER $$

CREATE TRIGGER trg_membresia_bi
BEFORE INSERT ON membresia
FOR EACH ROW
BEGIN
    DECLARE v_cliente BIGINT;
    DECLARE v_vigentes INT;

    IF NEW.estado NOT IN ('Reemplazada', 'Cancelada') THEN
        SELECT id_usuario
          INTO v_cliente
          FROM cliente
         WHERE id_usuario = NEW.id_cliente
           FOR UPDATE;

        SELECT COUNT(*)
          INTO v_vigentes
          FROM membresia
         WHERE id_cliente = NEW.id_cliente
           AND estado NOT IN ('Reemplazada', 'Cancelada');

        IF v_vigentes > 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                    'El cliente ya tiene una membresia vigente';
        END IF;
    END IF;
END$$

DELIMITER ;

CREATE TABLE programacion (
    id_programacion BIGINT AUTO_INCREMENT,
    id_actividad BIGINT NOT NULL,
    id_espacio BIGINT NOT NULL,
    id_entrenador BIGINT NOT NULL,
    dia_semana ENUM(
        'Lunes', 'Martes', 'Miercoles', 'Jueves',
        'Viernes', 'Sabado', 'Domingo'
    ) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado ENUM('Programada', 'Cancelada') NOT NULL DEFAULT 'Programada',
    CONSTRAINT pk_programacion PRIMARY KEY (id_programacion),
    CONSTRAINT chk_programacion_horas CHECK (hora_fin > hora_inicio),
    CONSTRAINT fk_programacion_actividad
        FOREIGN KEY (id_actividad) REFERENCES actividad (id_actividad)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_programacion_espacio
        FOREIGN KEY (id_espacio) REFERENCES espacio (id_espacio)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_programacion_entrenador
        FOREIGN KEY (id_entrenador) REFERENCES entrenador (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_programacion_espacio_dia
        (id_espacio, dia_semana, hora_inicio),
    INDEX idx_programacion_entrenador_dia
        (id_entrenador, dia_semana, hora_inicio)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ============================================================
-- Nivel 5: entidad asociativa cliente-programacion
-- ============================================================

CREATE TABLE inscripcion (
    id_inscripcion BIGINT AUTO_INCREMENT,
    id_cliente BIGINT NOT NULL,
    id_programacion BIGINT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado ENUM('Activa', 'Cancelada') NOT NULL DEFAULT 'Activa',
    es_activa TINYINT
        GENERATED ALWAYS AS (IF(estado = 'Activa', 1, NULL)) STORED,
    CONSTRAINT pk_inscripcion PRIMARY KEY (id_inscripcion),
    CONSTRAINT uq_inscripcion_una_activa
        UNIQUE (id_cliente, id_programacion, es_activa),
    CONSTRAINT fk_inscripcion_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inscripcion_programacion
        FOREIGN KEY (id_programacion) REFERENCES programacion (id_programacion)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_inscripcion_programacion_estado (id_programacion, estado),
    INDEX idx_inscripcion_cliente_estado_fecha
        (id_cliente, estado, fecha_inscripcion)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
