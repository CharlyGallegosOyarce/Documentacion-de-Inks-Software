/*
Estructuración de Base de Datos de DIRAC

by: Ink's Software - CRGO
*/

-- creación y uso de Base de Datos
create database baseDatos_dirac
use baseDatos_dirac

-- Creación de Tablas

alter table Asesores
drop column id_curso

create table Asesores(
	ID_Asesor int primary key,
	nombreAsesor varchar(60) not null,
	celularAsesor int not null
);

create table Cursos(
	ID_curso int primary key identity(1,1),
	Id_asesor int not null,
	nivel_curso varchar(10),
	foreign key (Id_asesor) references Asesores(ID_Asesor)
);

create table Alumnos(
	ID_alumno int primary key,
	Id_curso int not null,
	Id_asesor int not null,
	correoAlumno varchar(50) unique,
	celularAlumno int,
	foreign key (Id_curso) references Cursos(ID_Curso),
	foreign key (Id_asesor) references Asesores(ID_Asesor)
);

create table clientes(
	ID_cliente int primary key,
	celular int,
	Id_alumno int,
	nombre varchar(60),
	foreign key (Id_alumno) references Alumnos(ID_Alumno)
);

create table ventasDirac(
	ID_venta int primary key identity(1,1),
	Id_alumno int not null,
	Id_cliente int not null,
	Id_curso int not null,
	Id_asesor int not null,
	Id_desc int not null,
	ciclo int,
	numSemana int,
	cantHoras int,
	mes int,
	subTotal decimal(10,2),
	Total decimal(10,2),
	foreign key (Id_alumno) references Alumnos(ID_Alumno),
	foreign key (Id_cliente) references Clientes(ID_Cliente),
	foreign key (Id_curso) references Cursos(ID_Curso),
	foreign key (Id_asesor) references Asesores(ID_Asesor),
	foreign key (Id_desc) references Descuento(ID_Desc)
);

create table Descuento (
	ID_Desc int primary key identity (1,1),
	montoDescontado decimal(10,2),
	nombreDescuento varchar(50)
);

--
