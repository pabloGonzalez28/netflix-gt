DROP DATABASE IF EXISTS DBNetflix_gt;
CREATE DATABASE IF NOT EXISTS DBNetflix_gt;

USE DBNetflix_gt;

CREATE TABLE tbl_genero_pelicula(
	id_genero int not null auto_increment,
    nombre_genero varchar(50) not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_genero (id_genero)
);

CREATE TABLE tbl_director(
	id_director int not null auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    fecha_nacimiento date not null,
    sexo enum('Masculino', 'Femenino') not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_director (id_director)
);

CREATE TABLE tbl_actor(
	id_actor int not null auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    fecha_nacimiento date not null,
    sexo enum('Masculino', 'Femenino') not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_actor (id_actor)
);

CREATE TABLE tbl_detalle_pelicula(
	id_detalle_pelicula int not null,
    sinopsis text not null,
    duracion time not null,
    id_genero int not null,
    id_director int not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_detalle_pelicula (id_detalle_pelicula),
    constraint FK_tbl_detalle_pelicula_tbl_genero_pelicula foreign key (id_genero)
		references tbl_genero_pelicula(id_genero),
	constraint FK_tbl_detalle_pelicula_tbl_director foreign key (id_director)
		references tbl_director(id_director)
);

CREATE TABLE tbl_detallePeli_actor(
	id_detallePeli_actor int not null,
	id_detalle_pelicula int not null,
    id_actor int not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_detalle_actor (id_detallePeli_actor),
    constraint FK_tbl_detallePeli_actor_tbl_detalle_pelicula foreign key (id_detalle_pelicula)
		references tbl_detalle_pelicula(id_detalle_pelicula),
	constraint FK_tbl_detallePeli_actor_tbl_actor foreign key (id_actor)
		references tbl_actor(id_actor)
);


CREATE TABLE tbl_pelicula(
	id_pelicula int not null auto_increment,
    titulo varchar(75) not null,
    fecha_estreno date not null,
    id_detalle_pelicula int not null,
    estado tinyint(1) default 1 not null,
    primary key PK_id_pelicula (id_pelicula),
    constraint FK_tbl_pelicula_tbl_detalle_pelicula foreign key (id_detalle_pelicula)
		references tbl_detalle_pelicula(id_detalle_pelicula)
);

/*
select * from tbl_director;

INSERT INTO tbl_director (nombre, apellido, fecha_nacimiento, sexo) VALUES
('Christopher', 'Nolan', '1970-07-30', 'Masculino'),
('Greta', 'Gerwig', '1983-08-04', 'Femenino'),
('Quentin', 'Tarantino', '1963-03-27', 'Masculino');

INSERT INTO tbl_genero_pelicula (nombre_genero, estado) VALUES
('Acción', 1),
('Comedia', 1),
('Drama', 1);

INSERT INTO tbl_actor (nombre, apellido, fecha_nacimiento, sexo, estado) VALUES
('Leonardo', 'DiCaprio', '1974-11-11', 'Masculino', 1),
('Margot', 'Robbie', '1990-07-02', 'Femenino', 1),
('Ryan', 'Gosling', '1980-11-12', 'Masculino', 1);

INSERT INTO tbl_detalle_pelicula (id_detalle_pelicula, sinopsis, duracion, id_genero, id_director, estado) VALUES
(1, 'Un ladrón con la habilidad de entrar en los sueños debe realizar una última misión.', '02:28:00', 1, 1, 1),
(2, 'Una muñeca que vive en Barbieland comienza a cuestionar su mundo.', '01:54:00', 2, 2, 1);

INSERT INTO tbl_pelicula (titulo, fecha_estreno, id_detalle_pelicula, estado) VALUES
('Inception', '2010-07-16', 1, 1),
('Barbie', '2023-07-21', 2, 1);

INSERT INTO tbl_detallePeli_actor (id_detallePeli_actor, id_detalle_pelicula, id_actor) VALUES
(1, 1, 1),  -- Leonardo en Inception
(2, 2, 2),  -- Margot en Barbie
(3, 2, 3);  -- Ryan en Barbie
*/

