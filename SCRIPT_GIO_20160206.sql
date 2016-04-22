/*

Autor: D Unit

*/


CREATE DATABASE GIO 
GO 
USE GIO
GO
if not exists (select top 1 1 from sysobjects where name='Usuarios' and type='U') 
	BEGIN
		--DROP TABLE Usuarios
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
END
GO
if not exists (select top 1 1 from sysobjects where name='Roles' and type='U') 
	BEGIN
		--DROP TABLE Roles
		CREATE TABLE Roles
		(
		idRol bigint identity (1,1) primary key,
		codigoRol varchar(10) not null, 
		descripcion varchar(20) not null
		)
END
go
if not exists (select top 1 1 from sysobjects where name='RolesPorUsuarios' and type='U') 
	BEGIN
		--DROP TABLE RolesPorUsuarios
		CREATE TABLE RolesPorUsuarios
		(
		idRolesPorUsuario bigint identity(1,1) primary key,
		idUsuario bigint foreign key references Usuarios(idUsuario) ,
		idRol bigint foreign key references Roles(idRol)
		)
	END
go
if not exists (select top 1 1 from sysobjects where name='Formularios' and type='U') 
	BEGIN
	--DROP TABLE Formularios
		CREATE TABLE Formularios
		(
		idFormulario bigint identity(1,1) primary key,
		estado char(1), --D:Desarrollo, C:Compilado
		)
END
go 
if not exists (select top 1 1 from sysobjects where name='PermisosPorRoles' and type='U') 
	BEGIN
		--DROP TABLE PermisosPorRoles
		CREATE TABLE PermisosPorRoles
		(
		idPermisosPorRol bigint identity(1,1) primary key,
		idFormulario bigint foreign key references Formularios(idFormulario),
		TipoPermiso char(1) --A:Ingresar/Modificar, B:Ingresar/Modificar/Eliminar, C:Buscar,T:Todos
		)
END
go 
if not exists (select top 1 1 from sysobjects where name='TiposContratos' and type='U') 
	BEGIN
		--DROP TABLE TiposContratos
		CREATE TABLE TiposContratos
				(
				idTipoContrato bigint identity(1,1) primary key,
				codigoTipoContrato varchar(4),
				descripcion varchar(200)
				)
END
go 
if not exists (select top 1 1 from sysobjects where name='Modulos' and type='U') 
	BEGIN
		--DROP TABLE Modulos
		CREATE TABLE Modulos
		(
		idModulo bigint identity(1,1) primary key,
		codigoModulo varchar(4),
		descripcion varchar(200)
		)
	END
go

if not exists (select top 1 1 from sysobjects where name='ProductosOPA' and type='U') 
	BEGIN
	--DROP TABLE ProductosOPA
	CREATE TABLE ProductosOPA
	(
		idProductoOPA int identity(1,1) primary key,
		codigoProductoOPA varchar(4),
		descripcion varchar(150),
		fechaMatricula datetime
	)
	END
GO

if not exists (select top 1 1 from sysobjects where name='Entidades' and type='U') 
	BEGIN
		--DROP TABLE Entidades
		CREATE TABLE Entidades 
		(
		idEntidad bigint identity (1,1) primary key,
		nitEntidad bigint,
		sigla varchar(50),
		nombreEntidad varchar(200),
		numeroEntidad varchar(4),
		tipoEntidad char(2), -- 01:Mutual , 02:Comercial
		estado char(1), --R:Real(Activa), P:Proceso(Pendiente)... de ejemplo
		plataforma char(1), --F:Fox,S:SQL,N:Net
		tipoCooperativa char(1),
		representanteLegal varchar(200),
		cumpleanos datetime,
		contacto varchar(200),
		idPais int,
		iddepartamento int,
		idCiudad int ,
		idZona int,
		direccion varchar(200),
		telefono1 varchar(30),
		telefono2 varchar(150),
		celular varchar(150),
		ext1 varchar(10),
		ext2 varchar(50),
		email varchar(200),
		migracion char(1), --S/N
		defox char(1), --S/N
		nroAsociados int,
		tipoFuente char(1),
		fechaFuente datetime,
		idProducto int foreign key  references ProductosOPA(idProductoOPA), --(Relacion con tabla ProductosOPA)
		fechaMatricula datetime,
		fechaInactivacion datetime
		)
	END
GO

if  not exists (select top 1 1 from sysobjects where name='EstadosProcesos' and type='U') 
	BEGIN
	--DROP TABLE EstadosProcesos
	CREATE TABLE EstadosProcesos
	(
		idEstadoProceso int identity(1,1) primary key,
		codigoEstadoProceso varchar(4),
		descripcion varchar(150),
	)
	END 
GO
if not exists (select top 1 1 from sysobjects where name ='TipoDeServicios' and type='U') BEGIN
	create table TipoDeServicios
	(
	idTipoDeServicios int identity(1,1) primary key,
	Nombre          varchar(50),
	Descripcion     varchar(50),
	ValorxHora      Numeric(18,2)
	)
end
GO
if not exists (select top 1 1 from sysobjects where name ='ServiciosPorEntidades' and type='U') BEGIN
	create table TipoDeServicios
	(
	idServiciosPorEntidad int identity(1,1) primary key,
	horas             int,
	periodo           char(1),
	fechainicio       datetime,
	fechafin          datetime,
	idTipoDeServicios int foreign key references TipoDeServicios (idTipoDeServicios)

	)
end




