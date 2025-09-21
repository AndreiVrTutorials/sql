create sequence id_alumno
minvalue 1
maxvalue 35
increment by 1
cycle;
drop sequence id_alumno;
create table alumnos(
id_alumno number(35) constraint id_alumno_pk primary key,
nombre varchar2(20),
apellido varchar2(50)
);

insert into alumnos values (id_alumno.nextval,'Andrei','Vrote');

insert into alumnos values (id_alumno.nextval,'Paula','Izurratgui');

insert into alumnos values (id_alumno.nextval,'Manuel','Perez');

select * from alumnos;

--vistas 
select * from user_tables;
select * from user_cons_columns;
