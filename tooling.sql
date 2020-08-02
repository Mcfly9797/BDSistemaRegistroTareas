CREATE DATABASE ToolingDB
GO

USE [toolingDB]

GO

CREATE TABLE Usuario(
    Id INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR (10) NOT NULL,
    Clave VARCHAR(50) NOT NULL,
    Tipo INT NOT NULL
)

CREATE TABLE Tipo_Usuario(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Tipo VARCHAR (10) NOT NULL    
)

CREATE TABLE Usuario_TipoUsuario(
    Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    IdUsuario INT NOT NULL,
    IdTipoUsuario INT NOT NULL,
    CONSTRAINT fk_UsuarioTipoUsuario_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    CONSTRAINT fk_UsuarioTipoUsuario_Tipo FOREIGN KEY (IdTipoUsuario) REFERENCES Tipo_Usuario(Id)
)

CREATE TABLE Usuario_Operario(
    Id INT PRIMARY KEY IDENTITY (1,1),
    IdUsuario INT NOT NULL,
    IdOperario INT NOT NULL,
    CONSTRAINT fk_UsuarioOperario_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    CONSTRAINT fk_UsuarioOperario_Operario FOREIGN KEY (IdOperario) REFERENCES Operario(Id)
)

CREATE TABLE Operario(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre varchar(255) NOT NULL
    )

CREATE TABLE Trabajo (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR (50) NOT NULL
)

CREATE TABLE Elemento_Reparado(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
)

--CREATE TABLE Herramienta_reparacion(
--    id_herramienta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--    nom_herramienta VARCHAR(50) NOT NULL)

CREATE TABLE  Medida(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
)

CREATE TABLE Disenio(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
)

CREATE TABLE Intervencion(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdOperario INT NOT NULL,
    Nro_serie INT NOT NULL,
    Detalle VARCHAR(MAX) NULL,
    Tiempo time NOT NULL,
    Fecha DATE NOT NULL, --Segun el relevamiento las intervenciones no duran mas de un dia
    IdTrabajo INT NOT NULL,
    IdElemento_Reparado INT NOT NULL,
    --herramienta_reparacion INT NOT NULL,
    IdMedida INT NOT NULL,
    IdDisenio INT NOT NULL,
	CONSTRAINT fk_Intervencion_Operario FOREIGN KEY (IdOperario) REFERENCES Operario(Id),
    CONSTRAINT fk_Intervencion_Trabajo FOREIGN KEY (IdTrabajo) REFERENCES Trabajo(Id),
    CONSTRAINT FK_Intervencion_ElementoReparado FOREIGN KEY (IdElemento_Reparado) REFERENCES Elemento_Reparado(Id),
    --CONSTRAINT FK_herramienta_reparacion FOREIGN KEY (herramienta_reparacion) REFERENCES Herramienta_reparacion(id_herramienta),
    CONSTRAINT FK_Intervencion_Medida FOREIGN KEY (Idmedida) REFERENCES Medida(Id),
    CONSTRAINT FK_Intervencion_Disenio FOREIGN KEY (IdDisenio) REFERENCES Disenio(Id) 
)

--USE [toolingDB]

--GO

--CREATE PROCEDURE Crear_Usuario

--@NombreUsuario VARCHAR (50),
--@Clave VARCHAR (50),
--@TipoUser VARCHAR(50)
--AS BEGIN

--DECLARE @TipoUserDB VARCHAR(50) = (
--    SELECT Nombre 
--    FROM USUARIO)
--IF @TipoUser = ()

--END
--GO


--Nombre prueba
INSERT INTO Operario(nombre)
VALUES  ('Juan Perez'),
        ('Pedro Peligro'),
        ('Juan Carlos'),
        ('Roberto Rubino'),
        ('Tatiana Tutei'),
        ('Alfonso rivero'),
        ('Jorge Rodriguez')

INSERT INTO Trabajo(Nombre)
VALUES  ('ASIENTO DE ARO'),
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


INSERT INTO Elemento_Reparado(Nombre)
VALUES  ('MOLDE'),
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

INSERT INTO Medida(Nombre)
VALUES  ('13'),
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

INSERT INTO Disenio(Nombre)
VALUES  ('C104'),
        ('C104V'),
        ('C105'),
        ('C105V'),
        ('C203'),
        ('C203V')

