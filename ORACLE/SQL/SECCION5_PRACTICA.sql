/******************************************************************************/
/***** WHERE CONDICIONES - PRACTICAS *****/
--  1. Averigua los empleados que trabajen en el departamento 100
select first_name, last_name from employees where department_id=100;

--  2. Usando la tabla LOCATIONS, averigua el nombre de la Ciudad (city) y la
--     dirección (Street_address) de los departamentos situados en Estados Unidos (COUNTRY_ID=US)
select city as ciudad, street_address as direccion from locations where country_id='US';

--  3. Visualiza los países que están en la región 3. (REGION_ID de la tabla COUNTRIES
select country_name from countries where region_id=3;

--  4. Averiguar el nombre y salario de los empleados que NO tengan como jefe al MANAGER 114 (columna MANAGER_ID)
select first_name, last_name, salary from employees where manager_id <> 114;

--  5. Visualizar los empleados que empezaron a trabajar a partir del año 2006
select first_name, last_name from employees where hire_date >= '01-01-2006';

--  6. Seleccionar los empleados que tenga como tipo de trabajo ‘ST_CLERK’
select first_name, last_name from employees where job_id='ST_CLERK';

--  7. Indicar los datos de los empleados que tengan como apellidos “Smith” (LAST_NAME)
select first_name, last_name from employees where last_name='Smith';
