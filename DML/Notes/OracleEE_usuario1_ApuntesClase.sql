--Probamos que tiene privilegio para crear el usuario "usuario3"
create user usuario3 identified by usuario3;

--Probamos si tiene privilegio para crear secuencias y tablas
create sequence secuencia1
MINVALUE 1
MAXVALUE 100
INCREMENT by 1
CYCLE;

create table tabla1(
col1 number,
col2 varchar2(100)
);
--no deja como nos esperabamos
--ahora volvemos a probar despues de dar los privilegios

create sequence secuencia1
MINVALUE 1
MAXVALUE 100
INCREMENT by 1
CYCLE;

create table tabla1(
col1 number,
col2 varchar2(100)
);

--probamos el privilegio adquirido WITH ADMIN OPTION,(create table) otorgandoselo a usuario2
grant create table to usuario2 with admin option; --si deja --ojo que tambien se puede otorgar con with admin option, e tercero tambien lo tendria
grant create sequence to usuario2; --no deja

--otorgamos privilegio al usuario2 para hacer SELECT sobre la tabla1
grant select on tabla1 to usuario2;
--vista de objeto para comprobar
select * from user_tab_privs;

--otorgamos privilegios de inserccion y modificacion de la columna2 'col2' de tabla1
grant insert,update(col2) on tabla1 to usuario2; --esa coma para poner varios privilegios
select * from user_tab_privs; -- no sale la de insert
select * from user_col_privs;

--vemos la tabla
select * from tabla1;

--retiramos el privilegio de modificar la col2 de tabla1
revoke update(col2) on tabla1 from usuario2; --se revoka completo no por columnas

revoke update on tabla1 from usuario2;

-------------------------------------------------------------------------------
--PRACTICAAS POR MI CUENTA
-------------------------------------------------------------------------------

--vamos a añadir otra columna a tabla1
alter table tabla1 add col3 number(10,2) default 0;

--damos privilegios a usuario2 para editar esta columna
grant update,insert(col3) on tabla1 to usuario2; 

