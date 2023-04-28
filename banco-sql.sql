DROP DATABASE IF EXISTS banco;
CREATE DATABASE IF NOT EXISTS banco;
USE banco;

# --------- Creando las tablas ---------#
create table zona(
id_zona integer not null,
nombre varchar(50),
primary key(id_zona));

create table colonia(
id_colonia integer not null,
nombre varchar(50),
primary key(id_colonia));

create table municipio(
id_municipio integer not null,
nombre varchar(50),
primary key(id_municipio));

create table departamento(
id_departamento integer not null,
nombre varchar(50),
primary key(id_departamento));

create table tipo_de_cuenta(
id_tipoCuenta integer not null,
nombre_tipo_cuenta varchar(50),
primary key(id_tipoCuenta));

create table tipoTransaccion(
id_tipoTransaccion integer not null,
tipo varchar(50),
primary key(id_tipoTransaccion));

create table tipoTarjeta(
id_tipoTarjeta integer not null,
tipo varchar(50),
primary key(id_tipoTarjeta));

create table cuenta(
id_cuenta integer not null,
id_tipoCuenta integer,
primary key (id_cuenta),
foreign key(id_tipoCuenta)references tipo_de_cuenta(id_tipoCuenta));

create table interes(
id_interes integer not null,
porcentaje float,
id_tipoTarjeta integer,
primary key(id_interes),
foreign key(id_tipoTarjeta)references tipoTarjeta(id_tipoTarjeta));

create table tarjeta(
id_tarjeta integer not null,
id_tipoTarjeta integer,
codigo int,
agencia varchar(50),
fecha_de_vencimiento date,
primary key(id_tarjeta),
foreign key(id_tipoTarjeta)references tipoTarjeta(id_tipoTarjeta));

create table sucursal(
id_sucursal integer not null,
id_zona integer,
id_colonia integer,
id_municipio integer,
id_departamento integer,
nombre varchar(50),
primary key(id_sucursal),
foreign key(id_zona)references zona(id_zona),
foreign key(id_colonia)references colonia(id_colonia),
foreign key(id_municipio)references municipio(id_municipio),
foreign key(id_departamento)references departamento(id_departamento));

create table trabajador(
id_trabajador integer not null,
id_sucursal integer,
nombre varchar(50),
apellido varchar(50),
edad int,
direccion varchar(50),
primary key(id_trabajador),
foreign key(id_sucursal)references sucursal(id_sucursal));

create table asignacion_tarjeta(
id_asignacionTarjeta integer not null,
id_sucursal integer,
id_tarjeta integer,
primary key(id_asignacionTarjeta),
foreign key(id_sucursal)references sucursal(id_sucursal),
foreign key(id_tarjeta)references tarjeta(id_tarjeta));


create table asignacionCuenta(
id_asignacionCuenta integer not null,
id_sucursal integer,
id_tipoCuenta integer,
id_cuenta integer,
primary key(id_asignacionCuenta),
foreign key(id_sucursal)references sucursal(id_sucursal),
foreign key(id_tipoCuenta)references tipo_de_cuenta(id_tipoCuenta),
foreign key(id_cuenta)references cuenta(id_cuenta));

create table CuentaHabiente(
id_cuentaHabiente integer not null,
id_sucursal integer,
id_asignacionCuenta integer,
nombre varchar(50),
apellido varchar(50),
edad int,
telefono int,
direccion varchar(50),
primary key(id_cuentaHabiente),
foreign key(id_sucursal)references sucursal(id_sucursal),
foreign key(id_asignacionCuenta)references asignacionCuenta(id_asignacionCuenta));

create table cuentaMancomunada(
id_cuentaM integer not null,
id_asignacionCuenta integer,
primary key(id_cuentaM),
foreign key(id_asignacionCuenta)references asignacionCuenta(id_asignacionCuenta));

create table asignacionMancomunada(
id_asignacionM integer not null,
id_cuentaHabiente integer,
id_tipoCuenta integer,
id_cuentaM integer,
primary key(id_asignacionM),
foreign key(id_cuentaHabiente)references CuentaHabiente(id_cuentaHabiente),
foreign key(id_tipoCuenta)references tipo_de_cuenta(id_tipoCuenta),
foreign key(id_cuentaM)references cuentaMancomunada(id_cuentaM));


create table transacciones(
id_transaccion integer not null,
id_sucursal integer,
id_asignacionCuenta integer,
id_asignacionTarjeta integer,
id_cuentaHabiente integer,
id_tipoTransaccion integer,
hora time,
primary key(id_transaccion),
foreign key(id_sucursal)references sucursal(id_sucursal),
foreign key(id_asignacionCuenta)references asignacionCuenta(id_asignacionCuenta),
foreign key(id_asignacionTarjeta)references asignacion_tarjeta(id_asignacionTarjeta),
foreign key(id_tipoTransaccion)references tipoTransaccion(id_tipoTransaccion));

# ----------- Agregando Datos ----------- #

#- - - - Datos de Zona - - - -#
insert into zona(id_zona, nombre)
values(1, 'zona 1');
insert into zona(id_zona, nombre)
values(2, 'zona 2');
insert into zona(id_zona, nombre)
values(3, 'zona 4');
insert into zona(id_zona, nombre)
values(4, 'zona 6');
insert into zona(id_zona, nombre)
values(5, 'zona 7');
insert into zona(id_zona, nombre)
values(6, 'zona 8');
insert into zona(id_zona, nombre)
values(7, 'zona 9');
insert into zona(id_zona, nombre)
values(8, 'zona 12');
insert into zona(id_zona, nombre)
values(9, 'zona 14');
insert into zona(id_zona, nombre)
values(10, 'zona 18');

# - - - - Datos de Colonia - - - - #
insert into colonia(id_colonia, nombre)
values(1, 'Bosques de San Nicolas');
insert into colonia(id_colonia, nombre)
values(2, 'La Reformita');
insert into colonia(id_colonia, nombre)
values(3, 'El Naranjito');
insert into colonia(id_colonia, nombre)
values(4, 'Sacoj');
insert into colonia(id_colonia, nombre)
values(5, 'El Campanero');
insert into colonia(id_colonia, nombre)
values(6, 'El Montadito');
insert into colonia(id_colonia, nombre)
values(7, 'Landivar');
insert into colonia(id_colonia, nombre)
values(8, 'El Caracol');
insert into colonia(id_colonia, nombre)
values(9, 'El Frutal');
insert into colonia(id_colonia, nombre)
values(10, 'Santa Clara');

# - - - - Datos de Municipio - - - - #
insert into municipio(id_municipio, nombre)
values(1, 'Guatemala');
insert into municipio(id_municipio, nombre)
values(2, 'Amatitlan');
insert into municipio(id_municipio, nombre)
values(3, 'Fraijanes');
insert into municipio(id_municipio, nombre)
values(4, 'Mixco');
insert into municipio(id_municipio, nombre)
values(5, 'Palencia');
insert into municipio(id_municipio, nombre)
values(6, 'San Jose Pinula');
insert into municipio(id_municipio, nombre)
values(7, 'Santa Catalina');
insert into municipio(id_municipio, nombre)
values(8, 'San Miguel');
insert into municipio(id_municipio, nombre)
values(9, 'San Pedro');
insert into municipio(id_municipio, nombre)
values(10, 'Sacatepequez');

# - - - - Datos de Departamento - - - - #
insert into departamento(id_departamento, nombre)
values(1, 'Guatemala');
insert into departamento(id_departamento, nombre)
values(2, 'Huehuetenango');
insert into departamento(id_departamento, nombre)
values(3, 'Peten');
insert into departamento(id_departamento, nombre)
values(4, 'Escuintla');
insert into departamento(id_departamento, nombre)
values(5, 'Quetzaltenango');
insert into departamento(id_departamento, nombre)
values(6, 'Sacatepequez');
insert into departamento(id_departamento, nombre)
values(7, 'Suchitepequez');
insert into departamento(id_departamento, nombre)
values(8, 'Solola');
insert into departamento(id_departamento, nombre)
values(9, 'Quiche');
insert into departamento(id_departamento, nombre)
values(10, 'Zacapa');

# - - - - Datos de Tipo de Cuenta - - - - #
insert into tipo_de_cuenta(id_tipoCuenta, nombre_tipo_cuenta)
values(1, 'cuenta de ahorro');
insert into tipo_de_cuenta(id_tipoCuenta, nombre_tipo_cuenta)
values(2, 'cuenta  corriente');
insert into tipo_de_cuenta(id_tipoCuenta, nombre_tipo_cuenta)
values(3, 'cuenta con chequera');
insert into tipo_de_cuenta(id_tipoCuenta, nombre_tipo_cuenta)
values(4, 'cuenta de nomina');
insert into tipo_de_cuenta(id_tipoCuenta, nombre_tipo_cuenta)
values(5, 'mancomunada');

# - - - - Datos de Tipo de Transaccion - - - - #
insert into tipoTransaccion(id_tipoTransaccion, tipo)
values(1, 'Deposito');
insert into tipoTransaccion(id_tipoTransaccion, tipo)
values(2, 'Retiro');
insert into tipoTransaccion(id_tipoTransaccion, tipo)
values(3, 'Creacion de cuenta');
insert into tipoTransaccion(id_tipoTransaccion, tipo)
values(4, 'asignacion de tarjeta');


# - - - - Datos de Tipo de Tarjeta - - - - #
insert into tipoTarjeta(id_tipoTarjeta, tipo)
values(1, 'Credito');
insert into tipoTarjeta(id_tipoTarjeta, tipo)
values(2, 'Debito');
insert into tipoTarjeta(id_tipoTarjeta, tipo)
values(3, 'silver');
insert into tipoTarjeta(id_tipoTarjeta, tipo)
values(4, 'gold');
insert into tipoTarjeta(id_tipoTarjeta, tipo)
values(5, 'premium');

# - - - - Datos de Cuenta - - - - #
insert into cuenta(id_cuenta, id_tipoCuenta)
values(1,1);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(2,5);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(3,2);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(4,3);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(5,4);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(6,1);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(7,2);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(8,2);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(9,3);
insert into cuenta(id_cuenta, id_tipoCuenta)
values(10,4);

# - - - - Datos de intereses - - - - #
insert into interes(id_interes, porcentaje, id_tipoTarjeta)
values(1, 0.50, 1);
insert into interes(id_interes, porcentaje, id_tipoTarjeta)
values(2, 0.35, 2);
insert into interes(id_interes, porcentaje, id_tipoTarjeta)
values(3, 0.12, 3);
insert into interes(id_interes, porcentaje, id_tipoTarjeta)
values(4, 0.18, 4);
insert into interes(id_interes, porcentaje, id_tipoTarjeta)
values(5, 0.23, 5);

# - - - - Datos de Tarjeta - - - - #
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(1, 5, '785912653', 'VISA', '2025-12-15');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(2, 3, '157815496', 'BAC', '2024-10-13');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(3, 1, '410689257', 'MasterCard', '2022-12-31');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(4, 4, '452689012', 'VISA', '2024-06-12');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(5, 2, '741035982', 'VISA', '2025-01-01');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(6, 4, '102094528', 'MasterCard', '2023-06-12');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(7, 5, '745036925', 'BAC', '2021-12-24');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(8, 2, '323265478', 'MasterCard', '2025-12-01');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(9, 5, '567419852', 'VISA', '2022-02-02');
insert into tarjeta(id_tarjeta, id_tipoTarjeta, codigo, agencia, fecha_de_vencimiento)
values(10, 1, '032985012', 'VISA', '2025-02-18');

# - - - - Datos de Sucursal - - - - #
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(1, 10, 1, 10, 1,  'BancoMer');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(2, 1, 10, 1, 10, 'GyT');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(3, 9, 2, 9, 2,  'Banrural');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(4, 2, 9, 2, 9,  'CityBank');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento, nombre)
values(5, 8, 3, 8, 3, 'Bantrab');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(6, 3, 8, 3, 8, 'BBVA');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(7, 7, 4, 7, 4, 'BAC');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(8, 4, 7, 4, 7, 'Citi');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(9, 6, 5, 6, 5,  'Banco Internacional');
insert into sucursal(id_sucursal, id_zona, id_colonia, id_municipio, id_departamento,  nombre)
values(10, 5, 6, 5, 6, 'Banco Cielo');

# - - - - Datos de Trabajador - - - - #
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(1, 1,'Pedro', 'Bento', '23', 'Mixco');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(2, 3,'Maria', 'Angeles', '42', 'Carretera al Salvador');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(3, 5,'Diego', 'Lopez', '33', 'Villas de Minerva');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(4, 1,'Juan', 'Morales', '21', 'Colinas');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(5, 4,'Jose', 'Avila', '38', 'La Reforma');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(6, 2,'Gabriel', 'Calvillo', '40', 'Primero de Julio');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(7, 10,'Maite', 'Zapata', '22', 'Chimaltenango');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(8, 9,'Jason', 'Montie', '34', 'Villa Canales');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(9, 2,'Carlos', 'Flores', '23', 'Amatitlan');
insert into trabajador(id_trabajador, id_sucursal, nombre, apellido, edad, direccion)
values(10, 7,'Josue', 'Salvatierra', '42', 'Peten');


# - - - - Datos de Asignar Tarjeta - - - - #
insert into asignacion_tarjeta(id_asignacionTarjeta, id_sucursal, id_tarjeta)
values(1, 1, 1);
insert into asignacion_tarjeta(id_asignacionTarjeta, id_sucursal, id_tarjeta)
values(2, 2, 2);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(3, 3, 10);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(4, 4,9);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(5, 5, 8);
insert into asignacion_tarjeta(id_asignacionTarjeta, id_sucursal, id_tarjeta)
values(6, 6, 3);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(7, 7, 7);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(8, 8, 4);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(9, 9, 6);
insert into asignacion_tarjeta(id_asignacionTarjeta,  id_sucursal, id_tarjeta)
values(10, 10, 5);    

# - - - - Datos de Asignacion de Cuenta - - - - #
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(1, 10, 1, 1);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(2, 9, 2, 3);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(3, 8, 3,2);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(4, 7, 4, 5);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(5, 6, 5, 4);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(6, 9, 2, 7);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(7, 4, 1, 6);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(8, 3, 3, 9);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta) 
values(9, 1, 5, 10);
insert into asignacionCuenta(id_asignacionCuenta, id_sucursal, id_tipoCuenta, id_cuenta)
values(10, 2, 5, 8);

# - - - - Datos de CuentaHabiente - - - - #
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(1, 3 ,1, 'Carla', 'Archila', '24', '32456548', 'Mixco');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(2, 2,9, 'David', 'Qinonez', '23', '45467841', 'Mixco');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(3, 2,8, 'Angel', 'Morales', '32', '43424242', 'Huehuetenango');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(4, 3,7, 'Maite', 'Davila', '21', '45467433', 'Ville Nueva');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(5, 4,6, 'Carlos', 'Pedraza', '53', '2357831', 'Villa Canales');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(6, 5,5,'Mario', 'Juarez', '33', '34523564', 'El Progreso');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(7,  7,4, 'Oscar', 'Mendez', '18', '47861618', 'Mixco');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(8, 6,3,'Renata', 'Zapata', '23', '78468944', 'Zona 5');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(9, 8,2,'Alejandro', 'Veliz', '42', '45641164', 'Zona 18');
insert into CuentaHabiente(id_cuentaHabiente, id_sucursal, id_asignacionCuenta, nombre, apellido, edad, telefono, direccion)
values(10, 10,1, 'Andres', 'Zeta', '33', '75131810', 'Fraijanes');

# - - - - Datos de Mancomunada - - - - #
insert into cuentaMancomunada(id_cuentaM, id_asignacionCuenta)
values(1, 2);
insert into cuentaMancomunada(id_cuentaM, id_asignacionCuenta)
values(2, 1);
insert into cuentaMancomunada(id_cuentaM, id_asignacionCuenta)
values(3,3);
insert into cuentaMancomunada(id_cuentaM, id_asignacionCuenta)
values(4, 5);
insert into cuentaMancomunada(id_cuentaM, id_asignacionCuenta)
values(5, 5);

# - - - - Datos de Asignacion de Mancomunada - - - - #
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(1, 2, 3, 1);
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(2, 3, 4, 2);
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(3, 1, 5, 3);
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(4, 4, 2, 4);
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(5, 5, 1, 5);
insert into asignacionMancomunada(id_asignacionM, id_cuentaHabiente, id_tipoCuenta, id_cuentaM)
values(6, 9, 1, 1);


# - - - - Datos de Transacciones - - - - #
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(1, 1, 1, 1, 1, 1, '12:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(2, 2, 2, 2, 2, 2, '14:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(3, 5, 5, 4, 5, 3, '15:30');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(4, 3, 3, 3, 3, 4, '16:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(5, 4, 4, 5, 4, 1, '14:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(6, 7, 6, 7, 6, 2, '12:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(7, 6, 7, 6, 7, 4, '08:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(8, 8, 8, 8, 8, 3, '12:00');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(9, 9, 10, 9, 10, 1, '18:20');
insert into transacciones(id_transaccion, id_sucursal, id_asignacionCuenta, id_asignacionTarjeta, id_cuentaHabiente, id_tipoTransaccion, hora)
values(10, 10, 9, 10, 9, 3, '19:00');

# - - -- - - - - Consultas - - -- --- -- - #
select asignacionMancomunada.id_asignacionM, asignacionMancomunada.id_cuentaM,
CuentaHabiente.nombre from asignacionMancomunada, CuentaHabiente where
id_cuentaM=1 and asignacionMancomunada.id_cuentaHabiente=CuentaHabiente.id_cuentaHabiente;

# - - - - cuentas habientes en sucursal por nombre - - - - #
select count(cuentaHabiente.id_sucursal) as Cuentas_Habiente from cuentaHabiente, sucursal 
where cuentaHabiente.id_sucursal=sucursal.id_sucursal and sucursal.nombre='GyT';

#  Mostrar los datos de los colaboradores de sucursal, ingresando el nombre de la sucursal #
select sucursal.id_sucursal, sucursal.nombre, trabajador.id_trabajador, trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.nombre='GyT' and
sucursal.id_sucursal=trabajador.id_sucursal;

#  Mostrar los datos de los colaboradores de sucursal, ingresando el nombre de la sucursal y ordenarlo por apellido asendeintemente#
select sucursal.id_sucursal, sucursal.nombre, trabajador.id_trabajador, trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.nombre='GyT' and
sucursal.id_sucursal=trabajador.id_sucursal order by apellido asc;

#  Mostrar los datos de los colaboradores de sucursal, ingresando el nombre de la sucursal y ordenarlo por apellido descendientemente#
select sucursal.id_sucursal, sucursal.nombre, trabajador.id_trabajador, trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.nombre='GyT' and
sucursal.id_sucursal=trabajador.id_sucursal order by apellido desc;

# Mostrar la cantidad de cuenta hablantes y el nombre de los cuenta habientes que tienen cuenta de ahorro en la sucursal GyT #
select count(tipo_de_cuenta.nombre_tipo_cuenta)as CuentasHabientes_Con_cuenta_Ahorro from CuentaHabiente, sucursal, tipo_de_cuenta, cuenta,
 asignacionCuenta where tipo_de_cuenta.id_tipoCuenta=1 and CuentaHabiente.id_asignacionCuenta=asignacionCuenta.id_asignacionCuenta
and asignacionCuenta.id_cuenta=cuenta.id_cuenta and cuenta.id_tipoCuenta=tipo_de_cuenta.id_tipoCuenta and
CuentaHabiente.id_sucursal=sucursal.id_sucursal and sucursal.nombre='Banrural';

# Cantitad de tarjetas adquiridas por cuentabiantes en la sucursal x por nombre #
select count(id_tarjeta)from asignacion_tarjeta, CuentaHabiente, sucursal
where asignacion_tarjeta.id_tarjeta=CuentaHabiente.id_cuentaHabiente
and cuentaHabiente.id_sucursal=sucursal.id_sucursal and sucursal.nombre='GyT';
















