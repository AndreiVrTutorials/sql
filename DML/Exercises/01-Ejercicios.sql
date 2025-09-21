--Tablas PEDIDOS, TIENDAS Y VENTAS (TABLAS_DDL_1.sql)
select* from pedidos;
select * from tiendas;
select * from ventas;
--1. Modifica las columnas de la tabla PEDIDOS para que las UNIDADES_PEDIDAS puedan almacenar 
--cantidades numéricas de 6 dígitos.
alter table pedidos
    modify unidades_perdidas number(6);

--2. A partir de la tabla TIENDAS impide que se den de alta más tiendas en la provincia de 'TOLEDO'.
select * from tiendas;
desc tiendas;

alter table tiendas 
add constraint chk_toledo 
check (provincia != 'TOLEDO');

insert into TIENDAS (id_tienda, nombre, provincia) 
value (101, 'Tienda Prueba', 'TOLEDO');--probamos
///////////////////////
insert into tiendas(NIF, provincia) values('00000000A', 'Toledo2'); --comprobar si deja

UPDATE TIENDAS SET PROVINCIA = 'OTRA_PROVINCIA' WHERE PROVINCIA = 'Toledo'; -- las que tienen provincia toledo, cambiamos valor, da error

alter table tiendas add constraint direc_Toledo check (provincia != 'Toledo');-- restriccion

--3. Añade a las tablas PEDIDOS y VENTAS una nueva columna para que almacenen el PVP del artículo.
alter table pedidos
add pvp number (10,2);

alter table ventas
add pvp number (10,2);

desc pedidos;
desc ventas;
--Tablas EMP y DEPT (esquema SCOTT)
select * from scott.emp;
select * from scott.dept;

--4. Crea una vista llamada NOMBRES con los campos ENAME, JOB, DEPTNO de la tabla EMP.
create view NOMBRES (ename, job, deptno)as
select ename, job, deptno
from scott.emp;

select * from nombres;

--5. Crea una vista como la del punto anterior, pero que se llame NOMBRES2 y las 
--columnas de la vista se llamen NOMBRE, PUESTO y DEPARTAMENTO.
create view NOMBRES2 as
select ename"NOMBRE", job"PUESTO", deptno"DEPARTAMENTO"
from scott.emp;
select * from nombres2;

--6. Crea una vista llamada NOMBRES3, con los campos NOMBRE, PUESTO, DESC_DEPARTAMENTO y 
--LOCALIZACION, pero solo de los empleados de Nueva York.
create or replace view NOMBRES3 as
select emp.ename"NOMBRE", emp.job"PUESTO", dept.dname"DESC_DEPARTAMENTO", dept.loc"LOCALIZACION"
from scott.emp, scott.dept
where emp.deptno = dept.deptno
and dept.loc = 'NEW YORK';

--7. Modifica la tabla EMP, aumentando el tamaño de la columna ENAME a 30 caracteres.
create table emp as select * from scott.emp; --esta tabla para hacer lo que hariamos en el de scott pero no tenemos permisos y asi podemos 
--comprobar
select * from scott.emp;
desc emp;

alter table scott.emp
modify ename varchar2(30);
--8. Utilizando la vista NOMBRES3, realiza las siguientes operaciones:
-- - Inserta un nuevo analista llamado PEPE, con código 7000, en el departamento de Ventas.
-- - Modifica el nombre de los empleados, añadiéndoles el sufijo ‘(NY)’.
-- - Elimina a todos los empleados menos al presidente.
--operaciones en una vista: depende
--a
insert into NOMBRES3 (empno, ename, job, deptno)
values (7000, 'PEPE', 'ANALYST', (select deptno from scott.dept where dname = 'SALES'));
select * from nombres3;--no deja
--b
update nombres3
    set ename = ename || '(NY)';
--c
delete nombres3
where job != 'PRESIDENT';
select * from emp;
--9. Crea una vista llamada NOMBRES4 con los totales de salario por departamento.
select * from scott.emp;

create or replace view NOMBRES4 as 
select deptno, sum(sal) "Suma salario"
from scott.emp
group by deptno;
-- algo extra
create or replace view NOMBRES4 (nombre_departamento, total_salario)as 
select dname, sum(sal) "Suma salario"
from scott.emp, scott.dept
where emp.
group by dname;
select * from nombres4;
--10. Busca las vistas creadas en el diccionario de datos.
select view_name
from user_views;

--Tablas PERSONAL,  PROFESORES Y CENTROS (TABLAS_DDL_2.sql) 
select * from personal;
select * from profesores;
select * from centros;
--11.Crea una vista que se llame CONSERJES que contenga el nombre del centro y el nombre de sus 
--conserjes. 
create or replace view CONSERJES as
select centros.nombre, personal.apellidos, personal.funcion
from personal, centros
where personal.cod_centro = centros.cod_centro
and personal.funcion= 'CONSERJE';

select * from conserjes;

--12. Crea un sinónimo llamado CONSER asociado a la vista creada antes.
create or replace synonym CONSER for CONSERJES;

select * from conser;

--13. Añade a la tabla PROFESORES una columna llamada COD_ASIG con dos posiciones numéricas 
alter table profesores
add( COD_ASIG number(2)
    );

desc profesores;
--14. Crea la tabla TASIG con las siguientes columnas: COD_ASIG numérico de 2 posiciones y NOM_ASIG
--cadena de 20 caracteres. 
create table TASIG (
    COD_ASIG number(2),
    NOM_ASIG varchar2(20)
);

desc tasig;

--15. Añade la  restricción de clave primaria a la columna COD_ASIG de la tabla TASIG.
alter table tasig 
add constraint (PK_COD_ASIG primary key (COD_ASIG)
    );

select * from user_constraints WHERE table_name IN ('TASIG');
--16. Añade la restricción de clave foránea a la columna COD_ASIG de la tabla PROFESORES. Visualiza el 
--nombre de las restricciones y las columnas afectadas para las tablas TASIG y PROFESORES.
alter table PROFESORES 
add constraint (fk_profesores foreing key(cod_asig)references  tasig(cod_asig)
    );
--Base de datos EMPRESA
--17. Se considera que la tabla PRODUCTOS sufre pocas operaciones de alta de nuevos registros o 
--eliminación de registros, y el único campo que sufre actualizaciones frecuentes es el campo 
--EXISTENCIAS. Por otro lado, es frecuente consultar los productos por el campo DESCRIPCION 
--(aunque varios productos puedan tener la misma descripción). ¿Se podría mejorar la base de datos? 
--Si es así, indica de qué forma y escribe la instrucción correspondiente. En cualquier caso justifica la 
--respuesta.
--crear un indice?, idex por restriccion?