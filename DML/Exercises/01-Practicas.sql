--crea una tabla provincias, en ella ponun codigo (pk) y su nombre obligatorio
create table provincias (
    codigo_provincia char(4) constraint provincias_pk primary key,
    nombre_provincia varchar2(50) not null
);

--vemos que tablas tiene el usuario
select * from user_tables;

--añade a la tabla, dos columnas mas: superficie (entero) y habitantes este debe ser positivo
alter table provincias add (
    superficie integer,
    habitantes integer constraint habitantes_positivo check(habitantes>0)
);
--hacemos una descripcion de la tabla
desc provincias;

--cambia el tipo de datos de la columna superficie
alter table provincias modify
	superficie number(8,2);

--deshabilita la restriccion pk
alter table provincias 
	disable constraints provincias_pk; 

--borra la tabla provincias
drop table provincias;

--crea una tabla persona
create table persona (
    dni varchar2(9),
    nombre varchar2(20),
    apellidos varchar2(50),
    edad integer,
    altura number(3,2),
    fecha_nac date
)

--creamos una nueva tabla con  los vendedores de scott
select * from scott.emp;

create table vendedores_scott (
    num_vendedor,
    nombre,
    trabajo,
    manager,
    contrato,
    salario,
    comision,
    num_departamento
) as 
select emp.empno, emp.ename,emp.job, emp.mgr, emp.hiredate, emp.sal, emp.comm, emp.deptno
from scott.emp
where job like 'SALESMAN';

--comprovamos la tabla
select * from vendedores_scott;


--re haz la tabla personas restricciones y una clave foranea
drop table persona;
create table personas(
    dni varchar2(9),
    nombre varchar2(20),
    apellidos varchar2(50),
    edad integer,
    fecha_nac date default sysdate,
    codigo_provincia char(2),
    constraint personas_pk primary key (dni),
    constraint nombre_req check(nombre is not null),
    constraint apellidos_req check(apellidos is not null),
    constraint edad_positive check(edad > 0),
    constraint provincias_fk foreign key (codigo_provincia) references provincias (codigo_provincia)
    );

--comprobamos la tabla personas nueva que hemos creado, la de provincias debe estar con la pk anteriormente
desc personas;

select * from user_constraints where table_name in ('pesonas', 'provincias') -- vemos todas las restricciones creadas en el usuario