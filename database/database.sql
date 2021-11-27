create database cardio;
use cardio;  

create table users(
id_users int(45) primary key auto_increment,
nombres varchar(45) not null,
apellidos varchar(45) not null,
rut varchar(10) not null unique, 
numero_verificador int(1)not null,
email varchar(60) not null unique,
pass varchar(60) not null,
numero_telefonico varchar(12) not null unique,
numero_telefonico_respaldo varchar(12),
direccion varchar(45) not null,
numero_direccion int(4) not null,
id_profesion int(2) not null,
id_establecimiento int(2) null,
foreign key (id_profesion) references profesion(id_profesion),
foreign key (id_establecimiento) references establecimiento(id_establecimiento)
);

select * from users;
select * from users order by id_users;
alter table users modify id_establecimiento int(2) null;

select id_users,nombres,apellidos,rut,numero_verificador,email,pass,numero_telefonico,
numero_telefonico_respaldo,direccion,numero_direccion,id_profesion
from users,profesion where users.id_profesion = profesion.id_profesion;

select * from users natural join profesion;

select * from users,profesion,establecimiento
where users.id_profesion = profesion.id_profesion
and users.id_establecimiento = establecimiento.id_establecimiento order by id_users;

select id_users,nombres,apellidos,
rut, numero_verificador, email,
pass, numero_telefonico,numero_telefonico_respaldo,
direccion,numero_direccion,id_profesion
from users inner join
profesion on
users.id_profesion = profesion.id_profesion;

insert into users(nombres ,apellidos, rut, numero_verificador, email, pass, numero_telefonico,numero_telefonico_respaldo, direccion, numero_direccion, id_profesion, id_establecimiento) 
values('daniel', 'scarlazzetta', '11921192',2,  'asd@asd.com','11921192', '12345678','98765432','casa 123', 22,24, 6);

insert into users(nombres ,apellidos, rut, numero_verificador, email, pass, numero_telefonico,numero_telefonico_respaldo, direccion, numero_direccion, id_profesion, id_establecimiento) 
values('Daniel', 'scarlazzetta', '11113333',2,  '22222222222@asd.com','22334455', '3212151','84454412','casa 123', 22,24, 6);
select * from users where rut = 11921192;


create table profesion(
id_profesion int(2) not null primary key auto_increment,
nombre_profesion varchar(30) not null unique
);

insert into profesion(nombre_profesion) values('MEDICO');
insert into profesion(nombre_profesion) values('ENFERMARA(O)');
insert into profesion(nombre_profesion) values('PSCICOLOGO');
insert into profesion(nombre_profesion) values('KINESIOLOGO');
insert into profesion(nombre_profesion) values('NUTRICIONISTA');
insert into profesion(nombre_profesion) values('ODONTOLOGO');
insert into profesion(nombre_profesion) values('MATRON(A');
insert into profesion(nombre_profesion) values('ASISTENTE SOCIAL');
insert into profesion(nombre_profesion) values('TECNOLOGO MEDICO');
insert into profesion(nombre_profesion) values('PROFESIONES NO FORMALES');
insert into profesion(nombre_profesion) values('TERAPEUTA OCUPACIONAL');
insert into profesion(nombre_profesion) values('TECNICO ENFERMERIA N. S');
insert into profesion(nombre_profesion) values('LABORATISTA DENTAL');
insert into profesion(nombre_profesion) values('TECNICOS EN SALUD');
insert into profesion(nombre_profesion) values('QUIMICO FARMACEUTICO');
insert into profesion(nombre_profesion) values('PROFESOR DE EDUCACION FISICA');
insert into profesion(nombre_profesion) values('EDUCADORA DE PARVULOS');
insert into profesion(nombre_profesion) values('ASISTENTE DE PARVULO');
insert into profesion(nombre_profesion) values('PODOLOGO(A)');
insert into profesion(nombre_profesion) values('ASISTENTE TECNICO DENTAL');
insert into profesion(nombre_profesion) values('FONOAUDIOLOGO(A)');
insert into profesion(nombre_profesion) values('HIGIENISTA DENTAL');
insert into profesion(nombre_profesion) values('JEFE INFORMATICA');
insert into profesion(nombre_profesion) values('ADMINISTRADOR INFORMATICA');

select * from profesion order by id_profesion;


create table establecimiento(
id_establecimiento int(2) not null primary key auto_increment,
nombre_establecimiento varchar(40) not null unique,
direccion_establecimiento varchar(50) not null
);

SELECT * FROM establecimiento;
drop table establecimiento;

insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('CESFAM Arrau Méndez','calle a');
insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('CECOSF Los Olivos','calle b');
insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('USAF Viña del Mar','calle c');
insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('USAF Buenos Aires','calle d');
insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('Servicio de urgencia (SAPU)','calle e');
insert into establecimiento(nombre_establecimiento, direccion_establecimiento) values('Departamento de Salud','calle f');



select * from paciente order by id_paciente;
select rut,poblacion_inmigrante,presion_s from paciente;

alter table paciente modify fecha_nacimiento date null;
use cardio;

select id_paciente,rut, nombre, fecha_nacimiento, telefono, trans_del_humor,sus_psicotropicas,transt_comport,trans_ansiedad	from paciente order by id_paciente;
select id_paciente,rut, nombre, fecha_nacimiento, telefono,prog_mas,fecha_p5, EMPAM, vig, time_up_and_go from paciente;
select id_paciente,rut, nombre, fecha_nacimiento, telefono, peso,talla	from paciente order by id_paciente;
select id_paciente,rut, nombre, fecha_nacimiento, telefono, TACO from paciente order by id_paciente;
select id_paciente,rut, nombre, TAB,OBES,SEDENT, Antec_IAM,antec_enf_CV,tto_con_aspirina,tto_con_estatina,TACO from paciente;
select id_paciente,rut, nombre, ultimo_control,est,ultimo_control_presenc_tel,proximo_control,proximo_control,proximo_profesional,control_a_distancia_efectivo,profesional_que_realizo_aten_dist from paciente;
select id_paciente,rut, nombre, fecha_rescate,rescate_telefonico_efectivo, rescate_domiciliario_efectivo from paciente order by id_paciente;
select id_paciente,rut, nombre, derivado_a_QF,q_farmac_presencial,fecha_atencion_a_distancia, atencion_a_distancia, Proximo_control_Q_farmaceutico, fecha_citacion, via_citacion, confirmacion_de_cita, inasistencia from paciente order by id_paciente;
select id_paciente,rut, nombre, hta,DM,DLP,Artrosis,HipoT,Park,Epil,Glauc,GAA,INT_GLUC,INS_RESIST,Alzh,Otras_patologias from paciente order by id_paciente;
select id_paciente,rut, Hb,valor_H_Glicos from paciente order by id_paciente;
select id_paciente,rut,fecha,total,LDL from paciente order by id_paciente;
select id_paciente,rut,fecha_fondo_ojo,resultado,proximo_fondo_de_ojo from paciente order by id_paciente;
select id_paciente,rut,nombre,telefono from paciente order by id_paciente;
select * from paciente where id_paciente = 1;
select * from paciente where id_paciente = 5;
SELECT TAB,OBES,SEDENT, Antec_IAM,antec_enf_CV,tto_con_aspirina,tto_con_estatina,TACO FROM paciente;
select fecha_PA from paciente;
 
alter table paciente modify fecha_nacimiento varchar(20);
alter table paciente modify diali varchar(20);

insert into paciente(rut, nombre) value('123123', 'dasdasdasd');

use cardio;
select peso,talla from paciente where id_paciente = 82;
select * from paciente order by id_paciente;

create table paciente(
id_paciente 							int auto_increment primary key,
rut 									varchar(12) not null,
nombre 									varchar(50) not null,
fecha_nacimiento 						date,
telefono	 							varchar(30),


fecha_rescate 							datetime,			
rescate_telefonico_efectivo 			varchar(2),
rescate_domiciliario_efectivo 			varchar(2),


paciente_postrado 						varchar(2),
participa_pueblos_originarios 			varchar(2),
poblacion_inmigrante					varchar(2),
fecha_de_ingreso 						datetime,


ultimo_control 							date,
est 									int,
ultimo_control_presenc_tel 				varchar(20),
proximo_control 						date,
proximo_profesional 					varchar(20),
ultimo_control_a_distancia 				date,
control_a_distancia_efectivo 			varchar(2),
profesional_que_realizo_aten_dist 		varchar(20),


derivado_a_QF 							varchar(2),
q_farmac_presencial						date,
fecha_atencion_a_distancia				date,
atencion_a_distancia					varchar(2),
Proximo_control_Q_farmaceutico			date,
fecha_citacion							date,
via_citacion							varchar(20),
confirmacion_de_cita					varchar(20),
inasistencia							varchar(2),


plan_familiar							varchar(20),
FICHA									varchar(20),


sexo									varchar(20),
edad									int,
dato_sin_nombre							int,


peso									float,
talla									float,
imc										float,
estado_nutricional						varchar(20),	


hta										varchar(20), 
DM										varchar(20),
DLP										varchar(20),
Artrosis								varchar(20),
HipoT									varchar(20),
Park									varchar(20),
Epil									varchar(20),
Glauc									varchar(20),
GAA										varchar(20),
INT_GLUC								varchar(20),
INS_RESIST								varchar(20),
Alzh									varchar(20),
Otras_patologias						varchar(20),

AM_Sano									varchar(20),
AM_SOLO_C_R 							varchar(20), 
AM_SOLO_S_R								varchar(20),


trans_del_humor							varchar(20),
sus_psicotropicas						varchar(20),
transt_comport							varchar(20),
trans_ansiedad							varchar(20), 
otras_demencias							varchar(20),
esquizofrenia							varchar(20),
transt_alimentaria						varchar(20),
retraso_mental							varchar(20),
transt_personalidad						varchar(20),
transt_generalizado_del_desarrollo		varchar(20),
otras_programa_salud_mental				varchar(20),
hospitalizado							varchar(20),
diali									varchar(20),


TAB										varchar(2),
OBES									varchar(2),
SEDENT									varchar(2),
Antec_IAM								varchar(2),
antec_enf_CV							varchar(2),
tto_con_aspirina						varchar(2),
tto_con_estatina						varchar(2),
TACO									varchar(2),


fecha_ERC								date,
pauta_ERC								varchar(20),
fecha_RAC								date,
estado_1								int,
fecha_VFG								date,
estado_2								int ,
fecha_ECG								date,
vigencia_EC								int,
tto_con_IECA_o_ARA_II					varchar(2),
clasif_RCV								varchar(20),
Insulina								varchar(2),
presion_s								int,
presion_d								int, 
fecha_PA								date, 


Hb										date,
valor_H_Glicos							float,


estado_3								int ,
aplicado								varchar(2) ,
fecha_qualidiab							date,
estado_4								int,

fecha									date,
total									int,
LDL										int,

estado_5								int,

fecha_fondo_ojo							date,
resultado								varchar(20),
proximo_fondo_de_ojo					date,


vigencia_fondo_de_ojo					int ,


fecha_pie_diabetico						date,
vigencia_pie_diabetico					int,
riesgo_pie_diabetico					varchar(20) ,
curacion_pie_diabetico					varchar(20) ,
fecha_inicio_curacion					date,
fecha_termino_curacion					date,
amput									varchar(20),
tipo_amputacion							varchar(20) ,
fecha_amutacion							date,
actividad_fis_obs						varchar(2),
control_podologo						varchar(2) ,
fecha_podologo							date,
fecha_atencion_telefonica_podologo		date,
atencion_telefonica_efectiva			varchar(2) ,
proximo_control_podogolo				date,


prog_mas								varchar(2) ,
fecha_P5								date,
EMPAM									varchar(20) ,
vig										int,
time_up_and_go							varchar(20) ,
estacion_unipodal						varchar(20) ,
Minimental								varchar(20) ,
indice_barthel							varchar(20) ,
dependencia_severa						varchar(20),
escaras									varchar(2) ,
sospecha_maltrato						varchar(2) ,
actividad_fisica						varchar(2)
);