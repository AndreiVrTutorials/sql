
--APUNTES DE CLASE:
--CREACION DE USUARIOS
-- Vemos el tablespace por defecto y temporal de los usuarios de la BD
select * from dba_users;

--vemos el perfil del usuario
select * from dba_profiles; -- solo va a nivel dba

--1. Creamos el usuario "usuario1" contraseña "USUARIO1
--tablespace por defecto y obligacion de cambiar la contraseña al conectarse por primera vez
create user usuario1
identified by USUARIO1
password expire;

--Es necesario darle privilegio para que se conecte 
--y para realizar operaciones (roles connect y resource)
grant connect to usuario1;--damos el privilegio de conectarse, sin ello no deja
--al usuario2 se lo ponemos despues
grant resource to usuario1;
grant resource to usuario2;

--2. Probamos desde sql*Plus
-- en cmd -> docker exec -it oracle-ee sqlplus
--en oracle-ee es el nombre del docker que en este caso es ese
--intentamos en terminal docker exec -it oracle-ee sqlplus / as sysdba
--luego probamos grant connect to usuario1
--no lo reconoce

--pueba con otro usuario
create user usuario2
identified by USUARIO2; --probamos sin el password expire
grant connect to usuario2;--damos el privilegio de conectarse
--no prueba sqlplus, con developer

--bloqueo al usuario "usuario2"
alter user usuario2
account lock; --unLock para desbloquear
--volvemos a desbloquearlo
alter user usuario2
account unlock;
--3. comprovamos el estado de las cuentas
--para saber si estan bloqueadas, expiradas, etc...
select * from dba_users where username in ("USUARIO1", "USUARIO2");

--podemos borrar un usuario siempre y cuando este no tenga ojeto
--4. borramos el usuario dam
drop user dam; --para borrarlo hay que desconectarlo primero

--5. Creamos una tabla en el esqyema del usuario "usuario2", e intentamos borrar el usuario (no deja a no ser que usemos la clausula cascada)
create table usuario2.tabla_a(
col1 integer,
col2 varchar2(10)
);
drop user usuario2; -- error que salta: se debe especificar CASCADE para borrar USUARIO2
drop user usuario2 cascade; -- es necesario cascade ya que tiene tabla

--PRIVILEGIOS DE SISTEMA

--6. Listado de todos los privilegios de sistema
select * from system_privilege_map order by name;

--7. (hemos borrado usuario1) //Trabajamos con la siguiente estructura de usuarios:
-- DBA -->usuario1 -> usuario2
create user usuario1 identified by usuario1;
create user usuario2 identified by usuario2;

--asignamos los privilegios de sustema para conectar
grant create session to usuario1;
grant create session to usuario2;

--ahora tenemos los dos usuarios creados y con privilegios para conectarse
--compruebo que los usuarios han recibido esos privilegios de sistema
select * from dba_sys_privs;

--8. vamos a dar al usuario1 el privilegio para crear usuarios
grant create user to usuario1;

--comprobamos
select * from dba_sys_privs;--usuarios y sus privilegios

--nos conectamso como esos usuarios para comprobar

--Probamos la opcion WITH ADMIN OPTION

--otorgamos al usuario1 peivilegio para crear tablas y que ademas se lo pueda otorgar a un tercer usuario
--otorgamos al usuario1 tambine privilegio para crear secuencias (sin admin options)
grant create table to usuario1 with admin option;

grant create SEQUENCE to usuario1;

--REVOQUE
--10. Vamos a revocar el privilegio de crear tablas al usuario1
revoke create table from usuario1; --privilegios de sistema
select * from dba_sys_privs;-- no hay cascada de privilegios de sistema revoke, en los de objetos si

--probamos ahora sobre los privilegios de objetos

--trabajamos desde el ususario1
--los 2 usuarios necesitan cuota para introducir datos en tablas
alter user usuario1
quota 100m on users;

alter user usuario2
quota 100m on users;

-----------------------
--ROLES
-----------------------
create role andrei; --creamos
grant create session, resource, create any table to andrei; --lo llenamos

grant andrei to usuario1; --se lo damos a usuario1

select * from dba_roles;
select * from role_sys_privs;
select * from role_tab_privs;

-------------------------------------------------------------------------------
--PRACTICAAS POR MI CUENTA
-------------------------------------------------------------------------------
create user usuario3 identified by usuario3;
grant connect, RESOURCE, create table to usuario3;
grant create sequence to usuario3;

alter user usuario3
quota 100m on users;