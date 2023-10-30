/******************************************************************************/
/* WHERE - CONDICION */
select * from employees where department_id=50;

select first_name, salary from employees where salary > 5000;

select first_name from employees where department_id<>50;

/* LITERAL - CONDICION */
select first_name, last_name from employees where first_name='John';

/* COMPARAR FECHAS */
select * from employees where hire_date < '21-06-2007';
