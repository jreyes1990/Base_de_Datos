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