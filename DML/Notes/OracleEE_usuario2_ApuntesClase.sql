--Probamos que NO tiene privilegio para crear el usuario "usuario4"
create user usuario4 identified by usuario4;

--probamos que puede crear tablas
create table tabla1(
col1 number,
col2 varchar2(100)
);
--si deja
--borramos la tabla
drop table tabla1;
--el que es propietario de sus objetos, puede borrarlo
-- intentamos hacer un select sobre la tabla1 de usuario1
select * from usuario1.tabla1; --nos dice que no existe la tabla o vista-> no permite el acceso
--hay qyue dar un privilegio
--probamos ahora
select * from usuario1.tabla1; --ahora si deja(no hay datos)

--intentamos hacer una insert sobre la tabla1 de usuario1 (no va a dejar)
insert into usuario1.tabla1 (col1, col2) values(2,'user');--privilegios insuficientes -- tabien hay que dar cuota
--como podemos ver, el mensaje de error cambia
--se puede dar el privilegio a nivel columna
--intentamos modificar la columna1 'col1' de la tabla1 de usuario1
--solo debe dejar en la col2 ya que solo dimos prvilegios a este (col2)
update usuario1.tabla1 set col1=999;
--intentamos modificar la columna2 'col2' de la tabla1 de usuario1
update usuario1.tabla1 set col2='prueba';


-------------------------------------------------------------------------------
--PRACTICAAS POR MI CUENTA
-------------------------------------------------------------------------------
--actualizamoss la col3 de tabla1
update usuario1.tabla1 set col3=10;

--vemos la tabla
select * from usuario1.tabla1;

