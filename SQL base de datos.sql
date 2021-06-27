create database LOSAN;
Use LOSAN;

create table Usuarios(
Id_usuarios int primary key,
Nombre_usuario varchar (20) not null,
Correo_usuario varchar(20) not null,
Nickname varchar (20) not null,
Contraseña varchar (20) not null,
Diagnostico_FK int,
Bitacora_FK int,
Hoja_vida_FK int);


create table Bitacora_sucesos_incidencias(
Contactos int primary key,
Inicio Date not null,
Soporte varchar (20) not null,
Documentacion varchar (20) not null);

create table Diagnosticos(
Id_diagnostico int primary key,
Nombre_usuario varchar (20) not null,
Marca varchar (20) not null,
Fecha_salida Date not null,
Tipo_usuario varchar (20) not null,
Estado_equipo varchar (20) not null,
Condicion_teclado varchar (20) not null,
Condicion_mouse varchar (20) not null,
Estado_pantalla varchar (20) not null,
Contacto varchar (20) not null,
Tipo_pago Double not null);


create table Hoja_vida_cliente(
Hoja_vida int primary key,
Telefono_cliente varchar (20) not null,
Nombre_cliente varchar (20) not null,
Tipo_computador varchar (20) not null,
Marca varchar (20),
Numero_serie int not null,
Hardware_FK int,
Software_FK int);

create table Software(
Id_software int primary key,
SO1 varchar (20) not null,
SO2 varchar (20) not null,
Controladores varchar (20) not null,
SO1C varchar (20) not null,
SO2C varchar (20) not null,
Particiones_disco_duro varchar (20) not null,
Microsoft_office varchar (20) not null,
Navegadores varchar (20) not null,
Lector_PDF varchar (20) not null,
Compresor_archivos varchar (20) not null,
Antivirus varchar (20) not null,
Congelador_DD varchar (20) not null,
Utilidades_grabacion varchar (20) not null,
Otro_software int not null,
Estado_s_FK int,
Equipo_FK int);

create table Hardware(
Id_hardware int primary key,
Marca_board varchar (20) not null,
Referencias varchar (20) not null,
Marca_procesador varchar (20) not null,
Numero_nucleos varchar (15) not null,
Memoria_ram_marca varchar (20) not null,
Disco_duro_marca varchar (20) not null,
Lector_tarjetas varchar (20) not null,
Puerto_paralelos varchar (20) not null,
Serie varchar (20) not null,
USB varchar (15) not null,
Monitor varchar (10) not null,
Tarjeta_RED varchar (20) not null,
Tarjeta_video varchar (20) not null,
Tarjeta_sonido varchar (20) not null,
Teclado varchar (20) not null,
Mouse_o_touchpad varchar (20) not null,
Alimentación varchar (20) not null,
Camara varchar (20) not null,
Cables varchar (20) not null,
Equipo_FK int);


create table Estado_software(
Tipo_software int primary key,
Nombre_software  varchar (20) not null,
Version varchar (20) not null,
Caracteristicas varchar (20) not null,
Licencias varchar (20) not null,
Fecha_licencia Date not null,
Fecha_quiebre Date not null,
Observaciones varchar (20) not null);


create table Equipo(
Id_equipo int primary key,
Tipo_e varchar (20) not null,
Marca varchar (20) not null,
Referencia_e varchar (20) not null);

ALTER TABLE Usuarios
ADD CONSTRAINT FKusuariosbitacora
FOREIGN KEY (Bitacora_FK)
REFERENCES Bitacora_sucesos_incidencias (Contactos);

ALTER TABLE Usuarios
ADD CONSTRAINT FKusuariosdiagnostico
FOREIGN KEY (Diagnostico_FK)
REFERENCES Diagnosticos (Id_diagnostico);

ALTER TABLE Usuarios
ADD CONSTRAINT FKusuarioshoja
FOREIGN KEY (Hoja_vida_FK)
REFERENCES Hoja_vida_cliente (Hoja_vida);

ALTER TABLE Hoja_vida_cliente
ADD CONSTRAINT FKhojahardware
FOREIGN KEY (Hardware_FK)
REFERENCES Hardware (Id_hardware);

ALTER TABLE Hoja_vida_cliente
ADD CONSTRAINT FKhojasoftware
FOREIGN KEY (Software_FK)
REFERENCES Software (Id_software);

ALTER TABLE Hoja_vida_cliente
ADD CONSTRAINT FKhojasoftware
FOREIGN KEY (Software_FK)
REFERENCES Software (Id_software);

ALTER TABLE Software
ADD CONSTRAINT FKsoftwareestado
FOREIGN KEY (Estado_s_FK )
REFERENCES Estado_software (Tipo_software);

ALTER TABLE Software
ADD CONSTRAINT FKsoftwareequipo
FOREIGN KEY (Equipo_FK)
REFERENCES Equipo (Id_equipo);

ALTER TABLE Hardware
ADD CONSTRAINT FKhardwareequipo
FOREIGN KEY (Equipo_FK)
REFERENCES Equipo (Id_equipo);

DRop table Bitacora_sucesos_incidencias;