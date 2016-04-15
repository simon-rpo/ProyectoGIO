/*

Autor: D Unit


*/

CREATE DATABASE GIO 
GO 
USE GIO
GO

CREATE TABLE Usuarios 
(
idUsuario bigint identity (1,1) primary key,
codigoUsuario varchar(10),
clave varbinary not null,
primernombre varchar(50) not null,
segundonombre varchar(50),
primerapellido varchar(50) not null,
segundoapellido varchar(50) not null,
nombrecompleto varchar(200) not null,
correo varchar(200) not null,
estado varchar(1) not null,
fechaingreso datetime not null,
ultimoingreso datetime not null
)
GO
CREATE TABLE Roles
(
idRol bigint identity (1,1) primary key,
codigoRol varchar(10) not null, 
descripcion varchar(20) not null
)
go 
CREATE TABLE RolesPorUsuario
(
idRolesPorUsuario bigint identity(1,1) primary key,
idUsuario bigint foreign key references Usuarios(idUsuario) ,
idRol bigint foreign key references Roles(idRol)
)
