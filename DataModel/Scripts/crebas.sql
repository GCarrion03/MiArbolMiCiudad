/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     5/18/2016 1:03:19 PM                         */
/*==============================================================*/


drop table if exists APADRINAMIENTO;

drop table if exists ARBOL;

drop table if exists DENUNCIAS;

drop table if exists FOTOGRAFIAARBOL;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: APADRINAMIENTO                                        */
/*==============================================================*/
create table APADRINAMIENTO
(
   CEDULA               varchar(15) not null,
   IDARBOL              int not null,
   FOTOGRAFIA           longblob,
   FECHAREGISTRO        datetime,
   primary key (CEDULA, IDARBOL)
);

/*==============================================================*/
/* Table: ARBOL                                                 */
/*==============================================================*/
create table ARBOL
(
   IDARBOL              int not null,
   COORDENADALAT        double,
   COORDENADALON        double,
   ESPATRIMONIAL        bool,
   FECHAREGISTRO        datetime,
   TIENEPADRINOS        bool,
   primary key (IDARBOL)
);
ALTER TABLE ARBOL CHANGE IDARBOL IDARBOL INT(10)AUTO_INCREMENT;

/*==============================================================*/
/* Table: DENUNCIAS                                             */
/*==============================================================*/
create table DENUNCIAS
(
   IDDENUNCIA           bigint not null,
   CEDULA               varchar(15),
   IDARBOL              int,
   RAZON                varchar(200),
   DESCRIPCION          varchar(1024),
   REFERENCIA           varchar(1024),
   FOTOGRAFIA           longblob,
   FECHAREGISTRO        datetime,
   primary key (IDDENUNCIA)
);
ALTER TABLE DENUNCIAS CHANGE IDDENUNCIA IDDENUNCIA INT(10)AUTO_INCREMENT;
/*==============================================================*/
/* Table: FOTOGRAFIAARBOL                                       */
/*==============================================================*/
create table FOTOGRAFIAARBOL
(
   IDFOTO               bigint not null,
   IDARBOL              int,
   CONTENIDO            longblob,
   NOMBRE               varchar(50),
   FECHAREGISTRO        longblob,
   primary key (IDFOTO)
);
ALTER TABLE FOTOGRAFIAARBOL CHANGE IDFOTO IDFOTO INT(10)AUTO_INCREMENT;

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   CEDULA               varchar(15) not null,
   NOMBRE               varchar(100),
   DIRECCION            varchar(200),
   EMAIL                varchar(50),
   CELULAR              varchar(15),
   PASSWORD             varchar(15),
   FECHAREGISTRO        datetime,
   primary key (CEDULA)
);

alter table APADRINAMIENTO add constraint FK_ARBAPAREL foreign key (IDARBOL)
      references ARBOL (IDARBOL) on delete restrict on update restrict;

alter table APADRINAMIENTO add constraint FK_USUAPAREL foreign key (CEDULA)
      references USUARIO (CEDULA) on delete restrict on update restrict;

alter table DENUNCIAS add constraint FK_ARBDENREL foreign key (IDARBOL)
      references ARBOL (IDARBOL) on delete restrict on update restrict;

alter table DENUNCIAS add constraint FK_USUDENREL foreign key (CEDULA)
      references USUARIO (CEDULA) on delete restrict on update restrict;

alter table FOTOGRAFIAARBOL add constraint FK_ARBFOTREL foreign key (IDARBOL)
      references ARBOL (IDARBOL) on delete restrict on update restrict;

