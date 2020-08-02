CREATE DATABASE ToolingDB
GO

USE [toolingDB]

GO

CREATE TABLE Operario(
    id_operario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre varchar(255) NOT NULL
    )

CREATE TABLE Tipo_reparacion (
    id_tipo_reparacion INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nom_tipo_reparacion VARCHAR (50) NOT NULL
)

CREATE TABLE Elemento_reparado(
    id_elemento_reparado INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nom_elemento_reparado VARCHAR(50) NOT NULL
)

--CREATE TABLE Herramienta_reparacion(
--    id_herramienta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--    nom_herramienta VARCHAR(50) NOT NULL)

CREATE TABLE  Medida(
    id_medida INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nom_medida VARCHAR(50) NOT NULL
)

CREATE TABLE Disenio(
    id_disenio INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nom_disenio VARCHAR(50) NOT NULL
)

CREATE TABLE Intervencion(
    id_intervencion INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    operario INT NOT NULL,
    nro_serie INT NOT NULL,
    detalle VARCHAR(MAX) NULL,
    tiempo time NOT NULL,
    fecha DATE NOT NULL, --Segun el relevamiento las intervenciones no duran mas de un dia
    tipo_reparacion INT NOT NULL,
    elemento_reparado INT NOT NULL,
    --herramienta_reparacion INT NOT NULL,
    medida INT NOT NULL,
    disenio INT NOT NULL,
    CONSTRAINT FK_tipo_reparacion FOREIGN KEY (tipo_reparacion) REFERENCES Tipo_reparacion(id_tipo_reparacion),
    CONSTRAINT FK_elemento_reparado FOREIGN KEY (elemento_reparado) REFERENCES Elemento_reparacion(id_tipo_reparacion),
    --CONSTRAINT FK_herramienta_reparacion FOREIGN KEY (herramienta_reparacion) REFERENCES Herramienta_reparacion(id_herramienta),
    CONSTRAINT FK_medida FOREIGN KEY (medida) REFERENCES Medida(id_medida),
    CONSTRAINT FK_disenio FOREIGN KEY (disenio) REFERENCES Disenio(id_disenio) 
)

--Nombre prueba
INSERT INTO Operario(nombre)
VALUES('Juan Perez'),
('Pedro Peligro'),
('Juan Carlos'),
('Roberto Rubino'),
('Tatiana Tutei'),
('Alfonso rivero'),
('Jorge Rodriguez')

INSERT INTO Tipo_reparacion(nom_tipo_reparacion)
VALUES('ASIENTO DE ARO'),
('FLASH'),
('CAMBIO DE ESTAMPADO'),
('MOLDE NUEVO'),
('REPERFILADO'),
('GRABADO'),
('AJUSTE'),
('REPARACIÓN GENERAL'),
('COLOCAR INSERTO'),
('PREVENTIVO'),
('TORNEADO'),
('FRESADO'),
('SOLDADO'),
('AGREGADO DE VENTILACIONES'),
('3S'),
('KAIZEN'),
('OTRO')


INSERT INTO Elemento_reparado(nom_elemento_reparado)
VALUES ('MOLDE'),
('ARO'),
('TAMBOR'),
('TOOLING ARMADO'),
('STEELASTIC'),
('TUO'),
('KOKUSAI'),
('RIM FLOW'),
('MONOWIRE'),
('CONTENEDOR'),
('OTRO DEPARTAMENTO'),
('OTROS')

--INSERT INTO Herramienta_reparacion(nom_herramienta)
--VALUES 

INSERT INTO Medida(nom_medida)
VALUES('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('20'),
('21'),
('22'),
('24'),
('26'),
('28'),
('30'),
('32'),
('34'),
('36'),
('38'),
('40'),
('42'),
('44'),
('46')

INSERT INTO Disenio(nom_medida)
VALUES ('C104'),
('C104V'),
('C105'),
('C105V'),
('C203'),
('C203V')