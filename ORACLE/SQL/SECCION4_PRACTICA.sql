/******************************************************************************/
/***** SELECT - PRACTICAS *****/
/*  1. Visualizar el nombre y el número de teléfono de los empleados  */
select first_name as nombre, phone_number as number_telefono from employees;


/*  2. Visualizar el nombre y el tipo de trabajo de los empleados (FIRST_NAME, JOB_ID). Debe aparecer en la cabecera NOMBRE Y Tipo de Trabajo.  */
select first_name as nombre, job_id as "Tipo de Trabajo" from employees;

/*  3. Selecciona todas las columnas de la tabla REGIONS  */
select * from regions;

/*  4. Indicar los nombres de los países de la tabla COUNTRIES  */
select country_name as nombre from countries;

/*  5. Seleccionar las columnas STREET_ADDRESS, CITY, STATE_PROVINCE de la table LOCATIONS. Debemos poner las columnas como dirección, Ciudad y Estado  */
select street_address as direccion, city as ciudad, state_province as estado from locations;


/******************************************************************************/
/***** OPERADORES ARITMETICOS - PRACTICAS *****/
/*  1. Realizar una SELECT para visualizar el siguiente resultado. El impuesto es el 20% del salario.  */
select first_name, salary as bruto, ((salary*20)/100) impuesto, (salary-((salary*20)/100)) as neto from employees order by first_name;

/*  2. Visualizar el salario anual de cada empleado, por 14 pagas. Debemos visualizar las columnas como Nombre, Salario y Salario Anual */
select first_name as nombre, salary as salario, (salary*14) as "Salario Anual" from employees;


/******************************************************************************/
/***** LITERALES - PRACTICAS *****/
/*  1. Crear la consulta para visualizar los siguientes datos, usando el operador de concatenación ||  */
select 'El empleado '||first_name||' del departamento '||department_id||' tiene un salario de '||salary as datos from employees;

/*  3. Crear la siguiente consulta  */
select 'la calle '||street_address||' pertenece a la ciudad '||city from locations;