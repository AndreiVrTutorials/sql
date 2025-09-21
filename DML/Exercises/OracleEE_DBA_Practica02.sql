create table tabla_a (
 a1 number primary key,
 a2 varchar2(10)
);
drop table tabla_a; --borra la tabla
drop table tabla_a cascade constraints;

create table tabla_b(
    b1 char(8) primary key,
    b2 date,
    b3 number references tabla_a(a1)
);
truncate table tabla_b;--esta borra el contenido de la tabla

--creamos una vista EMPLEADOS30 que muestre los empleados del departamento 30
create or replace view EMPLEADOS30(numero_empleado, nombre_empleado, fechacontrato, departamento) 
as 
select emp.empno, emp.ename, emp.hiredate, emp.deptno 
from scott.emp 
where deptno =30; 

select * from user_views;
create or replace view emple30(numero_empleado, nombre_empleado, fecha_contrato, departamentos)
as 
select emp_no, apellido, fecha_alt, dept_no from emple where dept_no =30
with check option;--impide que se inserten, actualicen o modifiquen filas

--indexamos la tabla emple por la columna apellido y comprobamos la creacion del indice
--crear indice:
create index apellido_idx
on emple(apellido);
--comprobar:
select * from user_indexes where table_name('EMPLE','DEPART');

--SINONIMOS
--vistas 
select * from user_synonyms;
select * from all_synonyms;

--borrado de sinonimos: drop synonym
--creamos un sinonimo de las tablas hr.employees y hr.departments
create or replace synonym my_employees for hr.employees;
create or replace synonym my_departs for hr.departments;

--SECUENCIAS
--autoincremento no hay en oracle por lo que usamos secuencias
--vistas
select * from user_sequences;
select * from all_sequences;

-- creamos una secuencias para generar los numeros de los empleados (tabla EMPLE-->EMP_NO)
create sequence emple_autoincrement
start with 1
minvalue 1
maxvalue 9999
increment by 1;

--vemos datos obligatorios de emple
desc emple;
insert into emple (emp_no, apellido, dept_no)
values (emple_autoincrement.nextval, 'Pau', 10);

insert into emple (emp_no, apellido, dept_no)
values (emple_autoincrement, 'VROTE', 10);

select * from user_tables;

-------------------------------------------------
CREATE SEQUENCE seq_vendedor --creacion de secuencia
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100;

CREATE TABLE vendedores ( --creacion tabla
    id_vendedor NUMBER PRIMARY KEY, 
    nombre VARCHAR2(50),
    zona VARCHAR2(50)
);

INSERT INTO vendedores (id_vendedor, nombre, zona) --inserccion de datos
VALUES (seq_vendedor.NEXTVAL, 'Carlos Pérez', 'Zona Norte');

INSERT INTO vendedores (id_vendedor, nombre, zona) 
VALUES (seq_vendedor.NEXTVAL, 'Ana Gómez', 'Zona Sur');

SELECT * FROM vendedores; -- comprobamos 

CREATE INDEX idx_vendedores_nombre --creacion de indice
ON vendedores(nombre);

ALTER INDEX idx_vendedores_nombre MONITORING USAGE; --activamos la monitorizacion

SELECT * FROM vendedores WHERE nombre = 'Ana Gómez'; --usamos indice

ALTER INDEX idx_vendedores_nombre NOMONITORING USAGE; --desactivamos la monitorizacion