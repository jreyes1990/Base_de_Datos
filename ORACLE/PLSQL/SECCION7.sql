SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=100;

/******************************************************************************/
/***** USO DE SELECT DENTRO DE PL/SQL *****/
SET SERVEROUTPUT ON;

DECLARE
  SALARIO   EMPLOYEES.SALARY%TYPE;
  NOMBRE    EMPLOYEES.FIRST_NAME%TYPE;
  APELLIDO  EMPLOYEES.LAST_NAME%TYPE;
BEGIN
  -- SOLO PUEDE DEVOLVER UNA FILA
  SELECT 
  SALARY, FIRST_NAME, LAST_NAME INTO SALARIO, NOMBRE, APELLIDO
  FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
  DBMS_OUTPUT.PUT_LINE('EL SEÑOR '||NOMBRE||' '||APELLIDO||' TIENE UN SALARIO DE: '||SALARIO);
END;

/******************************************************************************/
/***** USO DE %ROWTYPE EN PL/SQL *****/
SET SERVEROUTPUT ON;

DECLARE
  EMPLEADO  EMPLOYEES%ROWTYPE; -- CON SOLO DECLARAR UN OBJETO "EMPLEADO" PUEDO OBTENER LOS CAMPOS DEL A TABLA EMPLOYEES.
BEGIN
  -- SOLO PUEDE DEVOLVER UNA FILA
  SELECT * INTO EMPLEADO
  FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
  DBMS_OUTPUT.PUT_LINE('EL SEÑOR '||EMPLEADO.FIRST_NAME||' '||EMPLEADO.LAST_NAME||' TIENE UN SALARIO DE: '||EMPLEADO.SALARY);
END;