/******************************************************************************/
/* PRIMEROS PASOS */
select first_name, last_name, salary as "Salario Empleado" from employees;


/* LITERALES */
select 'NOMBRE: ',first_name from employees;

select 'NOMBRE: '||first_name||' '||last_name as "Nombre Empleado" from employees;


/* NULOS */
select first_name, salary, commission_pct, salary*commission_pct as "SALARIO TOTAL" from employees;


/* DISTINCT */
select distinct department_id from employees;

select distinct department_id, job_id from employees;