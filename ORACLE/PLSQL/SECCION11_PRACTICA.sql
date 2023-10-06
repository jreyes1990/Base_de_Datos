/******************************************************************************/
/***** PROCEDIMIENTOS Y PARAMETROS - PRACTICA *****/
/* 1- Crear un procedimiento llamado “visualizar” que visualice el nombre y
      salario de todos los empleados.
*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE VISUALIZAR
IS
  CURSOR EMPL IS
    SELECT * FROM EMPLOYEES;
BEGIN
  FOR I IN EMPL LOOP
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '||I.FIRST_NAME||', SALARIO: '||I.SALARY);
  END LOOP;
END;

EXECUTE VISUALIZAR;

/* 2- Modificar el programa anterior para incluir un parámetro que pase el
      número de departamento para que visualice solo los empleados de ese
      departamento
      • Debe devolver el número de empleados en una variable de tipo OUT
*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE VISUALIZAR_DEPTO(DEPTO IN NUMBER, NUMERO OUT NUMBER)
IS
  CURSOR EMPL IS
    SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID=DEPTO;
BEGIN
  NUMERO := 0;
  FOR I IN EMPL LOOP
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '||I.FIRST_NAME||', SALARIO: '||I.SALARY);
    NUMERO := NUMERO+1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('EL NUMERO DE EMPLEADOS ES: '||NUMERO);
END;

DECLARE
  X NUMBER;
BEGIN
  VISUALIZAR_DEPTO(80,X);
END;

/* 3- Crear un bloque por el cual se de formato a un número de cuenta
      suministrado por completo, por ejmplo: 11111111111111111111
      • Formateado a: 1111-1111-11-1111111111
      • Debemos usar un parámetro de tipo IN-OUT
*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE FORMATO_CUENTA(NUMERO IN OUT VARCHAR2)
IS
  GUARDA1 VARCHAR2(20);
  GUARDA2 VARCHAR2(20);
  GUARDA3 VARCHAR2(20);
  GUARDA4 VARCHAR2(20);
BEGIN
  GUARDA1 := SUBSTR(NUMERO,1,4);
  GUARDA2 := SUBSTR(NUMERO,5,4);
  GUARDA3 := SUBSTR(NUMERO,9,4);
  GUARDA4 := SUBSTR(NUMERO,10);
  NUMERO := GUARDA1||'-'||GUARDA2||'-'||GUARDA3||'-'||GUARDA4;
  DBMS_OUTPUT.PUT_LINE('CUENTA: '||NUMERO);
END;

DECLARE
  X VARCHAR2(30) := '152104579011111111111';
BEGIN
  FORMATO_CUENTA(X);
END;