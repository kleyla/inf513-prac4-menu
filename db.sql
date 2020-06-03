CREATE DATABASE menu DEFAULT CHARACTER  SET utf8;
USE menu;

CREATE TABLE administrador
(
   adm_login    character(15) PRIMARY KEY,
   adm_password character(15) NOT NULL,
   adm_padre    character(15) NOT NULL,     
   adm_fech_i   date NOT NULL,
   adm_fech_f   date NOT NULL,
   grup_cod     integer NOT NULL,  
   adm_est      integer,
   usr_cod      character(15) NOT NULL
);
 
CREATE TABLE grupos
(
   grup_cod     serial PRIMARY KEY,
   grup_descrip character(20) NOT NULL,
   grup_observ  character(50) NOT NULL,
   grup_est     integer,
   adm_login    character(15),
   FOREIGN KEY(adm_login) REFERENCES administrador(adm_login)
);

CREATE TABLE persona
(
   usr_cod      character(15) PRIMARY KEY,
   usr_password character(15) NOT NULL,
   usr_nom      character(35) NOT NULL,
   usr_app      character(25) NOT NULL,
   usr_apm      character(25),
   usr_telf     character(18),
   usr_email    character(60),
   usr_dir      character(60),
   usr_fecha_nac date NOT NULL,
   usr_lugar_nac character(60) NOT NULL,
   usr_ci       character(15) NOT NULL,
   usr_prof     character(20) NOT NULL, 
   usr_fech_i   date NOT NULL,  
   usr_fech_f   date NOT NULL,
   usr_est      integer,
   grup_cod     integer,
   FOREIGN KEY(grup_cod) REFERENCES grupos(grup_cod),
   adm_login    character(15),
   FOREIGN KEY(adm_login) REFERENCES administrador(adm_login)  
);


CREATE TABLE modulos
(
   mod_cod     serial PRIMARY KEY,
   mod_descrip character(40) NOT NULL,
   mod_observ  character(40) NOT NULL,
   mod_file    character(60) NOT NULL,
   mod_nivel   integer NOT NULL,
   mod_est     integer,
   adm_login   character(15),
   FOREIGN KEY(adm_login) REFERENCES administrador(adm_login)
);


CREATE TABLE mod_grup
(
   grup_cod    integer,
   FOREIGN KEY(grup_cod)  REFERENCES grupos(grup_cod),
   mod_cod     integer,
   FOREIGN KEY(mod_cod)  REFERENCES modulos(mod_cod),
   PRIMARY KEY(grup_cod,mod_cod),
   mod_grup_fech_install  date NOT NULL
);


CREATE TABLE acciones
(
   mod_cod           integer,
   FOREIGN KEY(mod_cod)  REFERENCES modulos(mod_cod),
   acc_cod            numeric,
   PRIMARY KEY(mod_cod,acc_cod),
   acc_descrip        character(60),
   acc_parametros     character(40),
   acc_est            integer
);

/* INSERTO DOS ADMINISTRADORES */
INSERT INTO administrador VALUES('root','agenda',0,'01/01/2019','01/01/2020',1,0,'1');
INSERT INTO administrador VALUES('evans','evans',0,'01/01/2019','01/01/2020',2,0,'1124389');
 
INSERT INTO grupos VALUES(1,'Super Usuario','Administrar modulos',0,'root');
INSERT INTO grupos VALUES(2,'Amigo','Agrega,quita Aniversariosa',0,'root');
INSERT INTO grupos VALUES(3,'Vip','Cita a Reuniones',0,'root');
INSERT INTO grupos VALUES(4,'Trabajo','comparte',0,'root');
 
/*INSERTO 4 USUARIOS */
INSERT INTO persona VALUES('1','1','Super','Administrador','root' ,'710-76685','evansbv@yahoo.com','Av.humberto suarez','01/01/2004','Camiri','1','SC','01/01/2019','01/01/2020',0,1,'root');
INSERT INTO persona VALUES('1124389','3924689','Evans','Balcazar','Veizaga' ,'710-76685','evansbv@yahoo.com','Av. Humberto Suarez Roca #220','29/08/1975','Puerto Suarez - Chiquitos','3924986 SC','Estudiante','01/01/2019','01/01/2020',0,4,'root');
INSERT INTO persona VALUES('1115707','3885821','Erick','Ureña','Inarra'    ,'770-09255','ericksaurio@yahoo.com','Santos Dumont','25/01/1975','Santa Crus de la Sierra','3885821 SC','Estudiante','01/01/2019','01/01/2020',0,4,'root');
INSERT INTO persona VALUES('941022749','1932698','Milton','Sandoval','Salazar','770-73615','tommyltacho@yahoo.com','B. Tusequis','26/07/1975','Trinidad - Beni','1932698 BN','Estudiante','01/01/2019','01/01/2020',0,4,'root');
INSERT INTO persona VALUES('5260868','3201225','Shirley Eulalia','Perez','Delgadillo','709-34360','shirley_p@hotmail.com','B. El Pari','28/04/1976','La Paz - La Paz','3201225 SC','Estudiante','01/01/2019','01/01/2020',0,4,'root');
 
/*INSERTO 4 MODULOS */
INSERT INTO modulos VALUES(1,'Admin. Usuarios'     ,'OK','gestorAdmUsr.php'    ,1,0,'root');
INSERT INTO modulos VALUES(2,'Admin. Aniversarios' ,'OK','gestorAdmAniv.php'    ,1,0,'root');
INSERT INTO modulos VALUES(3,'Admin. Fiestas' ,'OK','gestorAdmFies.php'    ,1,0,'root');
INSERT INTO modulos VALUES(4,'Salir del Sistema' ,'OK','ps_login.php',1,0,'root');
 
/* REALCION ENTRE GRUPOS Y MODULOS */
/* ADMINISTRADOR Y MODULOS */
INSERT INTO mod_grup VALUES(1,1,now());
INSERT INTO mod_grup VALUES(1,2,now());
INSERT INTO mod_grup VALUES(1,3,now());
INSERT INTO mod_grup VALUES(1,4,now());
/* AMIGO Y MODULOS */
INSERT INTO mod_grup VALUES(2,1,now());
INSERT INTO mod_grup VALUES(2,3,now());
INSERT INTO mod_grup VALUES(2,4,now());
/* TRABAJO Y MODULOS */
INSERT INTO mod_grup VALUES(4,3,now());
INSERT INTO mod_grup VALUES(4,4,now());
 
 
/* RELACION ENTRE MODULOS Y ACCIONES*/ 
/* MODULO ADMIN. USUARIOS Y SUS ACCIONES */
INSERT INTO acciones VALUES(1,1,'Registrar'   ,'opcion=1101' ,0);
INSERT INTO acciones VALUES(1,2,'Modificar'   ,'opcion=1102' ,0);
INSERT INTO acciones VALUES(1,3,'Eliminar '   ,'opcion=1103' ,0);
INSERT INTO acciones VALUES(1,4,'Lista  '  ,'opcion=1104' ,0);
 
/* MODULO ADMIN. ANIVERSARIOS Y SUS ACCIONES */
INSERT INTO acciones VALUES(2,1,'Registrar'   ,'opcion=1201' ,0);
INSERT INTO acciones VALUES(2,2,'Modificar'   ,'opcion=1202' ,0);
INSERT INTO acciones VALUES(2,3,'Eliminar '   ,'opcion=1203' ,0);
INSERT INTO acciones VALUES(2,4,'Lista  '  ,'opcion=1204' ,0);
 
 
/* MODULO ADMIN. FIESTAS Y SUS ACCIONES */
INSERT INTO acciones VALUES(3,1,'Registrar'   ,'opcion=1301' ,0);
INSERT INTO acciones VALUES(3,2,'Modificar'   ,'opcion=1302' ,0);
INSERT INTO acciones VALUES(3,3,'Eliminar '   ,'opcion=1303' ,0);
INSERT INTO acciones VALUES(3,4,'Lista  '  ,'opcion=1304' ,0);
 
/* MODULO SALIR DEL SISTEMA Y SUS ACCIONES */
INSERT INTO acciones VALUES(4,1,'Salir del Sistema'  ,'opcion=999' ,0);
