-- Creamos el Esquema

create schema Entrega_SQL1_KC;

-- A continuación, creamos todas las tablas con sus claves primarias


create table Entrega_SQL1_KC.coches(
	id int primary key,
	id_color int NOT null, 
	id_aseguradora int NOT null, 
	id_modelo int NOT null, 
	matricula varchar(8) NOT null, 
	numkm int NOT NULL,
	fecha_compra Date NOT null
);

create table Entrega_SQL1_KC.colores(
	id int primary key,
	nombre_color varchar(20) NOT null 
);


create table Entrega_SQL1_KC.grupoempresarial(
	id int primary key,
	nombre_grupo varchar(20) NOT NULL 
);


create table Entrega_SQL1_KC.marcas(
	id int primary key,
	nombre_marca varchar(30) NOT null,
	id_grupo int not null
);

create table Entrega_SQL1_KC.modelos(
	id int primary key,
	nombre_modelo varchar(30) NOT NULL,
	id_marca int NOT NULL 
);

create table Entrega_SQL1_KC.aseguradoras(
	id int primary key,
	nombre_aseguradora varchar(50) NOT NULL 
);

create table Entrega_SQL1_KC.revisiones(
	id int primary key,
	id_coche int NOT NULL,
	km_revision int NOT null,
	importe float NOT NULL,
	id_divisa int NOT NULL,
	fecha_revision date NOT NULL
);

create table Entrega_SQL1_KC.divisas(
	id int primary key,
	nombre_divisa varchar(30) NOT null 
);

create table Entrega_SQL1_KC.polizas(
	id int primary key,
	id_coche int NOT NULL, 
	id_aseguradora int NOT NULL,
	fecha_alta date NOT NULL, 
	num_poliza int NOT NULL
);

-- Una vez creadas las tablas, podemos proceder a crear las relaciones

alter table Entrega_SQL1_KC.coches  add constraint pk_coches_aseguradoras foreign key (id_aseguradora) references Entrega_SQL1_KC.aseguradoras(id);
alter table Entrega_SQL1_KC.coches  add constraint pk_coches_modelo  foreign key (id_modelo) references Entrega_SQL1_KC.modelos(id);
alter table Entrega_SQL1_KC.coches  add constraint pk_coches_colores foreign key (id_color)  references Entrega_SQL1_KC.colores(id);
 
alter table Entrega_SQL1_KC.modelos add constraint pk_modelos_marca foreign key (id_marca) references Entrega_SQL1_KC.marcas(id);

alter table Entrega_SQL1_KC.marcas  add constraint pk_marca_grupo foreign key (id_grupo) references Entrega_SQL1_KC.grupoempresarial(id);

alter table Entrega_SQL1_KC.revisiones add constraint pk_revisones_coche  foreign key (id_coche)  references Entrega_SQL1_KC.coches(id);
alter table Entrega_SQL1_KC.revisiones add constraint pk_revisones_divisa foreign key (id_divisa) references Entrega_SQL1_KC.divisas(id);

alter table Entrega_SQL1_KC.polizas add constraint pk_poliza_coche foreign key (id_coche) references Entrega_SQL1_KC.coches(id);
alter table Entrega_SQL1_KC.polizas add constraint pk_poliza_aseguradora foreign key (id_aseguradora) references Entrega_SQL1_KC.aseguradoras(id);


INSERT INTO Entrega_SQL1_KC.colores (id, nombre_color)
VALUES
    (1, 'Rojo'),
    (2, 'Verde'),
    (3, 'Azul'),
    (4, 'Amarillo'),
    (5, 'Blanco');
    
INSERT INTO Entrega_SQL1_KC.grupoempresarial (id, nombre_grupo)
VALUES
    (1, 'Grupo A'),
    (2, 'Grupo B'),
    (3, 'Grupo C'),
    (4, 'Grupo D'),
    (5, 'Grupo E');
    
INSERT INTO Entrega_SQL1_KC.marcas (id, nombre_marca, id_grupo)
VALUES
    (1, 'Marca 1', 1),
    (2, 'Marca 2', 1),
    (3, 'Marca 3', 2),
    (4, 'Marca 4', 3),
    (5, 'Marca 5', 4);
    
INSERT INTO Entrega_SQL1_KC.modelos (id, nombre_modelo, id_marca)
VALUES
    (1, 'Modelo 1', 1),
    (2, 'Modelo 2', 1),
    (3, 'Modelo 3', 2),
    (4, 'Modelo 4', 2),
    (5, 'Modelo 5', 3);
    
   
INSERT INTO Entrega_SQL1_KC.aseguradoras (id, nombre_aseguradora)
VALUES
    (1, 'Aseguradora A'),
    (2, 'Aseguradora B'),
    (3, 'Aseguradora C'),
    (4, 'Aseguradora D'),
    (5, 'Aseguradora E');
    
   
INSERT INTO Entrega_SQL1_KC.divisas (id, nombre_divisa)
VALUES
    (1, 'Dólar estadounidense'),
    (2, 'Euro'),
    (3, 'Libra esterlina');
    
   
INSERT INTO Entrega_SQL1_KC.coches (id, id_color, id_aseguradora, id_modelo, matricula, numkm, fecha_compra)
VALUES
    (1, 1, 1, 1, 'ABC12345', 50000, '2022-05-15'),
    (2, 2, 2, 3, 'XYZ67890', 75000, '2021-09-10'),
    (3, 3, 3, 5, 'DEF54321', 60000, '2020-12-20'),
    (4, 4, 4, 2, 'GHI98765', 80000, '2022-02-25'),
    (5, 5, 5, 4, 'JKL24680', 55000, '2023-03-30');
   
   
INSERT INTO Entrega_SQL1_KC.revisiones (id, id_coche, km_revision, importe, id_divisa, fecha_revision)
VALUES
    (1, 1, 55000, 150.75, 1, '2023-01-10'),
    (2, 2, 80000, 200.50, 2, '2023-02-15'),
    (3, 3, 60000, 180.25, 1, '2023-03-20'),
    (4, 4, 75000, 210.30, 3, '2023-04-25'),
    (5, 5, 90000, 225.75, 2, '2023-05-30');
   
   
INSERT INTO Entrega_SQL1_KC.polizas (id, id_coche, id_aseguradora, fecha_alta, num_poliza)
VALUES
    (1, 1, 1, '2023-01-05', 1001),
    (2, 2, 2, '2023-02-10', 1002),
    (3, 3, 3, '2023-03-15', 1003),
    (4, 4, 4, '2023-04-20', 1004),
    (5, 5, 5, '2023-05-25', 1005);
   


select coches.matricula, coches.fecha_compra, coches.numkm, modelos.nombre_modelo, colores.nombre_color, marcas.nombre_marca, grupo.nombre_grupo as "Grupo Empresarial", aseguradoras.nombre_aseguradora as "asegurado con", polizas.num_poliza as "Numero de Poliza"
 from entrega_sql1_kc.coches 
    join entrega_sql1_kc.colores on coches.id_color  = colores.id 
    join entrega_sql1_kc.modelos on coches.id_modelo = modelos.id
    join entrega_sql1_kc.marcas  on modelos.id_marca = marcas.id
    join entrega_sql1_kc.grupoempresarial grupo on marcas.id_grupo = grupo.id
    join entrega_sql1_kc.aseguradoras on aseguradoras.id = coches.id_aseguradora
    join entrega_sql1_kc.polizas on polizas.id_aseguradora = aseguradoras.id
;
   

