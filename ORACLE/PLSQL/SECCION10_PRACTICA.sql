/******************************************************************************/
/***** CURSORES - PRACTICA *****/
/* 1. Hacer un programa que tenga un cursor que vaya visualizando los salarios de
      los empleados. Si en el cursor aparece el jefe (Steven King) se debe generar un
      RAISE_APPLICATION_ERROR indicando que el sueldo del jefe no se puede ver.
*/
SET SERVEROUTPUT ON;

DECLARE
  CURSOR C1 IS
    SELECT * FROM EMPLOYEES;
BEGIN
  FOR I IN C1 LOOP
    IF I.FIRST_NAME='Steven' AND I.LAST_NAME='King' THEN
      RAISE_APPLICATION_ERROR(-20300, 'EL SALARIO DEL JEFE NO PUEDE SER VISTO');
    ELSE
      DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME||' '||I.LAST_NAME||':'||I.SALARY);
    END IF;
  END LOOP;
END;

/* 2. Vamos averiguar cuales son los JEFES (MANAGER_ID) de cada
      departamento. En la tabla DEPARTMENTS figura el MANAGER_ID de cada
      departamento, que a su vez es también un empleado. Hacemos un bloque con
      dos cursores. (Esto se puede hacer fácilmente con una sola SELECT pero vamos
      a hacerlo de esta manera para probar parámetros en cursores).
      o El primero de todos los empleados
      o El segundo de departamentos, buscando el MANAGER_ID con el
        parámetro que se le pasa.
      o Por cada fila del primero, abrimos el segundo cursor pasando el
        EMPLOYEE_ID
      o Si el empleado es MANAGER_ID en algún departamento debemos
        pintar el Nombre del departamento y el nombre del MANAGER_ID
        diciendo que es el jefe.
      o Si el empleado no es MANAGER de ningún departamento debemos
        poner “No es jefe de nada”
*/
SET SERVEROUTPUT ON;

DECLARE
  CURSOR C1 IS
    SELECT * FROM EMPLOYEES;
  CURSOR C2(J DEPARTMENTS.MANAGER_ID%TYPE) IS
    SELECT * FROM DEPARTMENTS WHERE MANAGER_ID=J;
  DEPARTAMENTO  DEPARTMENTS%ROWTYPE;
  JEFE          DEPARTMENTS.MANAGER_ID%TYPE;
BEGIN
  FOR EMPLEADO IN C1 LOOP
    OPEN C2(EMPLEADO.EMPLOYEE_ID);
    FETCH C2 INTO DEPARTAMENTO;
    IF C2%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME||' NO ES JEFE DE NADA.');
    ELSE
      DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME||' ES EL JEFE DEL DEPARTAMENTO '||DEPARTAMENTO.DEPARTMENT_NAME);
    END IF;
    CLOSE C2;
  END LOOP;
END;

/* 3. Crear un cursor con parámetros que pasando el número de departamento
      visualice el número de empleados de ese departamento
*/
SET SERVEROUTPUT ON;

DECLARE
  CURSOR C1(COD DEPARTMENTS.DEPARTMENT_ID%TYPE) IS
    SELECT COUNT(*) FROM EMPLOYEES WHERE DEPARTMENT_ID=COD;
  CODIGO DEPARTMENTS.DEPARTMENT_ID%TYPE;
  NUM_EMPLE NUMBER;
BEGIN
  CODIGO := 20;
  OPEN C1(CODIGO);
  FETCH C1 INTO NUM_EMPLE;
    DBMS_OUTPUT.PUT_LINE('NUMERO DE EMPLEADOS DE '||CODIGO||' ES '||NUM_EMPLE);
  CLOSE C1;
END;

/* 4. Crear un bucle FOR donde declaramos una subconsulta que nos devuelva el
      nombre de los empleados que sean ST_CLERCK. Es decir, no declaramos el
      cursor sino que lo indicamos directamente en el FOR.
*/
SET SERVEROUTPUT ON;

BEGIN
  FOR I IN (SELECT * FROM EMPLOYEES WHERE JOB_ID='ST_CLERK') LOOP
    DBMS_OUTPUT.PUT_LINE('EMPLEADO: '||I.FIRST_NAME);
  END LOOP;
END;

/* 5. Creamos un bloque que tenga un cursor para empleados. Debemos crearlo con
      FOR UPDATE.
      o Por cada fila recuperada, si el salario es mayor de 8000 incrementamos el
        salario un 2%
      o Si es menor de 8000 lo hacemos en un 3%
      o Debemos modificarlo con la cláusula CURRENT OF
      o Comprobar que los salarios se han modificado correctamente.
*/
SET SERVEROUTPUT ON;

DECLARE
  CURSOR EMP IS
    SELECT * FROM EMPLOYEES FOR UPDATE; 
BEGIN
  FOR I IN EMP LOOP
    IF I.SALARY > 8000 THEN
      UPDATE EMPLOYEES SET SALARY=SALARY*1.02 WHERE CURRENT OF EMP;
      DBMS_OUTPUT.PUT_LINE('SALARIO ANTERIOR: '||I.SALARY||' SALARIO ACTUAL: '||I.SALARY*1.02||' INCREMENTO: 2%');
    ELSE
      UPDATE EMPLOYEES SET SALARY=SALARY*1.03 WHERE CURRENT OF EMP;
      DBMS_OUTPUT.PUT_LINE('SALARIO ANTERIOR: '||I.SALARY||' SALARIO ACTUAL: '||I.SALARY*1.03||' INCREMENTO: 3%');
    END IF;
  END LOOP;
END;