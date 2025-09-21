REM *************** TABLAS ARTICULOS, TIENDAS, FABRICANTES, PEDIDOS y VENTAS:********

DROP TABLE TIENDAS cascade constraints; 
DROP TABLE PEDIDOS cascade constraints; 
DROP TABLE VENTAS cascade constraints; 


CREATE TABLE TIENDAS(
NIF       VARCHAR2(10) NOT NULL,
NOMBRE    VARCHAR2(20),
DIRECCION VARCHAR2(20),
POBLACION VARCHAR2(20),
PROVINCIA VARCHAR2(20),
CODPOSTAL NUMBER(5) );

INSERT INTO TIENDAS VALUES('1111-A','Almacenes Perez', 'C/Toledo, 20',
 'Siguenza','GUADALAJARA',19104); 
INSERT INTO TIENDAS VALUES('5555-B','La gacela', 'C/Santander Rios, 45',
 'Azuqueca','GUADALAJARA', 19209);
INSERT INTO TIENDAS VALUES('2222-A','Comestibles Rodolfo', 
'C/ del Val s/n', 'Alcal� de Henares','MADRID',28804);
INSERT INTO TIENDAS VALUES('4444-A','La Pasta Gansa', 'C/Alcala, 2',
 'Ajalvir','MADRID', 28765);
 INSERT INTO TIENDAS VALUES('3333-N','Ultramarinos Montse',
  'Avda. Pio 10', 'Toledo','TOLEDO',45100);
INSERT INTO TIENDAS VALUES('4141-B','Todo Toledo',
 'C/Avila 24', 'Talavera','TOLEDO',45199);


CREATE TABLE PEDIDOS(
NIF               VARCHAR2(10) NOT NULL,
ARTICULO          VARCHAR2(20) NOT NULL,
COD_FABRICANTE    NUMBER(3) NOT NULL,
PESO              NUMBER(3) NOT NULL,
CATEGORIA         VARCHAR2(10) NOT NULL,
FECHA_PEDIDO      DATE NOT NULL,
UNIDADES_PEDIDAS  NUMBER(4)
) ;

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

INSERT INTO PEDIDOS VALUES ('5555-B','Macarrones',20, 1, 'Primera',
TO_DATE('18/02/2023'), 30);
INSERT INTO PEDIDOS VALUES ('5555-B','Atun',10, 3, 'Primera',
TO_DATE('21/02/2023'), 10);
INSERT INTO PEDIDOS VALUES ('5555-B','Atun',10, 3, 'Segunda',
TO_DATE('11/03/2023'), 4);
INSERT INTO PEDIDOS VALUES ('5555-B','Sardinillas',10, 1, 'Segunda', 
TO_DATE('11/03/2023'), 10);
INSERT INTO PEDIDOS VALUES ('5555-B','Macarrones',25, 1, 'Primera',
TO_DATE('14/04/2023'), 12);
INSERT INTO PEDIDOS VALUES ('5555-B','Fideos',25, 1, 'Segunda', 
TO_DATE('18/05/2023'), 24);
INSERT INTO PEDIDOS VALUES ('5555-B','Fideos',25, 1, 'Segunda', 
TO_DATE('19/05/2023'), 20);
INSERT INTO PEDIDOS VALUES ('5555-B','Galletas Cuadradas',
15, 1, 'Segunda', TO_DATE('20/06/2023'), 15);

INSERT INTO PEDIDOS VALUES ('1111-A','Barquillos',15, 1, 'Primera',
TO_DATE('20/02/2023'), 10);

INSERT INTO PEDIDOS VALUES ('1111-A','Canutillos',15, 2, 'Segunda',
TO_DATE('10/04/2023'), 12);
INSERT INTO PEDIDOS VALUES ('1111-A','Leche semi.',30, 1, 'Primera',
TO_DATE('24/06/2023'), 5);
INSERT INTO PEDIDOS VALUES ('1111-A','Leche semi.',30, 2, 'Primera',
TO_DATE('04/07/2023'), 11);
INSERT INTO PEDIDOS VALUES ('1111-A','Mantequilla',30, 1, 'Primera', 
TO_DATE('10/07/2023'), 10);

INSERT INTO PEDIDOS VALUES ('4141-B','Macarrones',20, 1, 'Primera',
TO_DATE('16/04/2023'), 30);
INSERT INTO PEDIDOS VALUES ('4141-B','Atun',10, 3, 'Primera',
TO_DATE('21/06/2023'), 10);
INSERT INTO PEDIDOS VALUES ('4141-B','Atun',10, 3, 'Segunda',
TO_DATE('12/08/2023'), 9);


INSERT INTO PEDIDOS VALUES ('2222-A','Sardinillas',10, 1,
 'Segunda', TO_DATE('12/08/2023'),20);
INSERT INTO PEDIDOS VALUES ('2222-A','Sardinillas',10, 1, 
'Tercera', TO_DATE('12/08/2023'),22);
INSERT INTO PEDIDOS VALUES('2222-A','Mejillones',10,1,
 'Primera',SYSDATE,1000);

INSERT INTO PEDIDOS VALUES ('3333-A','Macarrones',25, 1,
 'Primera',TO_DATE('10/11/2023'),8);
INSERT INTO PEDIDOS VALUES ('3333-A','Tallarines',25, 1, 
'Primera', TO_DATE('12/11/2023'),9);
 INSERT INTO PEDIDOS VALUES ('3333-A','Fideos',25, 1, 
'Primera', TO_DATE('15/11/2023'),11);
 INSERT INTO PEDIDOS VALUES ('3333-A','Galletas Cuadradas',
15, 1, 'Primera', TO_DATE('20/11/2023'),6);
INSERT INTO PEDIDOS VALUES ('3333-A','Barquillos',15, 1, 
'Segunda', TO_DATE('20/11/2023'),40);
 INSERT INTO PEDIDOS VALUES ('3333-A','Canutillos',15, 2, 
'Segunda', TO_DATE('20/11/2023'),10);



CREATE TABLE VENTAS(
NIF                VARCHAR2(10) NOT NULL,
ARTICULO           VARCHAR2(20) NOT NULL,
COD_FABRICANTE     NUMBER(3) NOT NULL,
PESO               NUMBER(3) NOT NULL,
CATEGORIA          VARCHAR2(10) NOT NULL,
FECHA_VENTA        DATE NOT NULL,
UNIDADES_VENDIDAS  NUMBER(4)
);


INSERT INTO VENTAS VALUES ('5555-B','Macarrones',20, 1, 'Primera',
TO_DATE('19/02/2023'), 5);
INSERT INTO VENTAS VALUES ('5555-B','Atun',10, 3, 'Primera',
TO_DATE('19/02/2023'), 6);
INSERT INTO VENTAS VALUES ('5555-B','Atun',10, 3, 'Segunda',
TO_DATE('20/03/2023'), 15);
INSERT INTO VENTAS VALUES ('5555-B','Sardinillas',10, 1, 'Segunda', 
TO_DATE('20/03/2023'), 8);
INSERT INTO VENTAS VALUES ('5555-B','Macarrones',25, 1, 'Primera',
TO_DATE('17/04/2023'), 2);
INSERT INTO VENTAS VALUES ('5555-B','Fideos',25, 1, 'Segunda', 
TO_DATE('18/05/2023'), 14);
INSERT INTO VENTAS VALUES ('5555-B','Leche semi.',30, 1, 'Primera',
TO_DATE('24/06/2023'), 5);

INSERT INTO VENTAS VALUES ('2222-A','Galletas Cuadradas',
15, 1, 'Segunda', TO_DATE('20/06/2018'), 5);
INSERT INTO VENTAS VALUES ('2222-A','Barquillos',15, 1, 'Primera',
TO_DATE('20/02/2023'), 6);
INSERT INTO VENTAS VALUES ('2222-A','Canutillos',15, 2, 'Segunda',
TO_DATE('10/06/2023'), 2);
INSERT INTO VENTAS VALUES ('2222-A','Sardinillas',10, 1,
 'Segunda', TO_DATE('15/08/2023'),5);
INSERT INTO VENTAS VALUES ('2222-A','Sardinillas',10, 1, 
'Tercera', TO_DATE('15/08/2023'),5);


INSERT INTO VENTAS VALUES ('3333-A','Leche semi.',30, 2, 'Primera',
TO_DATE('06/07/2023'), 11);
INSERT INTO VENTAS VALUES ('3333-A','Mantequilla',30, 1, 'Primera', 
TO_DATE('16/07/2023'), 10);
INSERT INTO VENTAS VALUES ('3333-A','Macarrones',20, 1, 'Primera',
TO_DATE('26/04/2023'), 30);
INSERT INTO VENTAS VALUES ('3333-A','Atun',10, 3, 'Primera',
TO_DATE('26/04/2023'), 10);
INSERT INTO VENTAS VALUES ('3333-A','Barquillos',15, 1, 
'Segunda', TO_DATE('25/11/2023'),4);
 INSERT INTO VENTAS VALUES ('3333-A','Canutillos',15, 2, 
'Segunda', TO_DATE('25/11/2023'),4);

INSERT INTO VENTAS VALUES ('4141-B','Atun',10, 3, 'Segunda',
TO_DATE('12/08/2023'), 2);

INSERT INTO VENTAS VALUES ('4141-B','Macarrones',25, 1,
 'Primera',TO_DATE('10/11/2023'),2);
INSERT INTO VENTAS VALUES ('4141-B','Tallarines',25, 1, 
'Primera', TO_DATE('11/11/2023'),3);
INSERT INTO VENTAS VALUES ('4141-B','Canutillos',15, 2, 
'Segunda', TO_DATE('11/11/2023'),8);

commit;

REM *************** FIN *******************************

select * from pedidos;
select * from tiendas;

-- Modifica las columnas de la tabla PEDIDOS para que las UNIDADES_PEDIDAS puedan almacenar 
--cantidades numéricas de 6 dígitos. 
alter table pedidos
modify unidades_perdidas number(6);

--A partir de la tabla TIENDAS impide que se den de alta más tiendas en la provincia de 'TOLEDO'
alter table tiendas
add constraint toledo_ch check(poblacion != 'TOLEDO');

--prueba
insert into tiendas 
values ('33333','Prueba','C/falsa,123','Toledo','TOLEDO',67567);

desc tiendas;

----3. Añade a las tablas PEDIDOS y VENTAS una nueva columna para que almacenen el PVP del artículo.
alter table pedidos add PVP number(100,2);
alter table ventas add PVP number (20,2);
    
----4. Crea una vista llamada NOMBRES con los campos ENAME, JOB, DEPTNO de la tabla EMP
create or replace view NOMBRES (ENAME, JOB, DEPTNO) 
as select ename,job, deptno from scott.emp;

--5. Crea una vista como la del punto anterior, pero que se llame NOMBRES2 y las 
--columnas de la vista se llamen NOMBRE, PUESTO y DEPARTAMENTO.
create or replace view NOMBRES2 as
select emp.ename "NOMBRE", emp.job "PUESTO", emp.deptno "DEPARTAMENTO"
from scott.emp;

--7. Modifica la tabla EMP, aumentando el tamaño de la columna ENAME a 30 caracteres.
alter table scott.emp
modify ename varchar2(30);

--6. Crea una vista llamada NOMBRES3, con los campos NOMBRE, PUESTO, DESC_DEPARTAMENTO y 
--LOCALIZACION, pero solo de los empleados de Nueva York.
create view NOMBRES3 as
select emp.ename "NOMBRE", emp.job "PUESTO", dept.dname "DESC_DEPARTAMENTO", dept.loc "LOCALIZACION" 
from scott.emp, scott.dept
where emp.deptno = dept.deptno
and dept.loc = 'NEW YORK';
--8. Utilizando la vista NOMBRES3, realiza las siguientes operaciones:
-- - Inserta un nuevo analista llamado PEPE, con código 7000, en el departamento de Ventas.
-- - Modifica el nombre de los empleados, añadiéndoles el sufijo ‘(NY)’.
-- - Elimina a todos los empleados menos al presidente.
--A
insert into NOMBRES3 (empno, ename, job, deptno) 
values (7000,'PEPE', 'ANALISTA',(select deptno from scott.dept where deptno where dname = 'SALES'));
--B
update NOMBRES3
set ename = ename || '(NY)';
--C
delete NOMBRES3
where job !='PRESIDENT';

--crea una secuencia
create sequence id_estudiante 
minvalue 1
maxvalue 100
increment by 1
cycle;

create table pruebaIndex(
 nombre varchar2(20) constraint nombre_pk primary key,
 edad number(10,3)
);

select * from pruebaIndex;

alter index nombre MONITORING usage;
create index nombre on pruebaIndex nombre;










