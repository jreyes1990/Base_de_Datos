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

/******************************************************************************/
/***** FUNCIONES - PRACTICA *****/
/* 1. Crear una función que tenga como parámetro un número de
      departamento y que devuelve la suma de los salarios de dicho
      departamento. La imprimimos por pantalla.
      • Si el departamento no existe debemos generar una excepción con dicho mensaje
      • Si el departamento existe, pero no hay empleados dentro,
        también debemos generar una excepción para indicarlo
*/
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID=100;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION SUM_SALARIO(P_DEPTO_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER
IS
  RESULTADO     NUMBER := 0;
BEGIN
  IF P_DEPTO_ID > 0 THEN
    SELECT SUM(SALARY) INTO RESULTADO FROM EMPLOYEES WHERE DEPARTMENT_ID=P_DEPTO_ID GROUP BY DEPARTMENT_ID;
    DBMS_OUTPUT.PUT_LINE('EL SALARIO TOTAL DEL DEPARTAMENTO '||P_DEPTO_ID||' ES '||RESULTADO);
  ELSE
    RAISE_APPLICATION_ERROR(-20730,'EL DEPARTAMENTO EXISTE, PERO NO HAY EMPLEADOS');
  END IF;
  
  RETURN RESULTADO;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20730,'NO EXISTE EL DEPARTAMENTO '||P_DEPTO_ID);
END;

DECLARE
  SALARIO   NUMBER;
  DEPTO_ID  NUMBER := 100;
BEGIN
  SALARIO := SUM_SALARIO(DEPTO_ID);
END;


/* 2. Modificar el programa anterior para incluir un parámetro de tipo OUT por
      el que vaya el número de empleados afectados por la query. Debe ser
      visualizada en el programa que llama a la función. De esta forma vemos
      que se puede usar este tipo de parámetros también en una función
*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION SUM_SALARIO_IN_OUT(P_DEPTO_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE, NUM_EMPLEADO OUT NUMBER)
RETURN NUMBER
IS
  RESULTADO     NUMBER := 0;
BEGIN
  IF P_DEPTO_ID > 0 THEN
    SELECT SUM(SALARY), COUNT(*) INTO RESULTADO, NUM_EMPLEADO FROM EMPLOYEES WHERE DEPARTMENT_ID=P_DEPTO_ID GROUP BY DEPARTMENT_ID;
    DBMS_OUTPUT.PUT_LINE('EL SALARIO TOTAL DEL DEPARTAMENTO '||P_DEPTO_ID||' ES '||RESULTADO);
    DBMS_OUTPUT.PUT_LINE('EL NUMERO DE EMPLEADOS RECABADOS DEL DEPARTAMENTO_ID '||P_DEPTO_ID||' ES '||NUM_EMPLEADO);
  ELSE
    RAISE_APPLICATION_ERROR(-20730,'EL DEPARTAMENTO EXISTE, PERO NO HAY EMPLEADOS');
  END IF;
  
  RETURN RESULTADO;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20730,'NO EXISTE EL DEPARTAMENTO '||P_DEPTO_ID);
END;

DECLARE
  SALARIO   NUMBER;
  N_EMPL    NUMBER;
  DEPTO_ID  NUMBER := 100;
BEGIN
  SALARIO := SUM_SALARIO_IN_OUT(DEPTO_ID,N_EMPL);
END;

/* 3. Crear una función llamada CREAR_REGION,
      • A la función se le debe pasar como parámetro un nombre de
        región y debe devolver un número, que es el código de región
        que calculamos dentro de la función
      • Se debe crear una nueva fila con el nombre de esa REGION
      • El código de la región se debe calcular de forma automática.
        Para ello se debe averiguar cual es el código de región más
        alto que tenemos en la tabla en ese momento, le sumamos 1 y
        el resultado lo ponemos como el código para la nueva región que estamos creando.
      • Si tenemos algún problema debemos generar un error
      • La función debe devolver el número que ha asignado a la región
*/
SELECT * FROM REGIONS;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION FN_CREAR_REGION(NOM_REGION IN REGIONS.REGION_NAME%TYPE)
RETURN NUMBER
IS
  NOMBRE_REGION VARCHAR2(100);
  CORRELATIVO   NUMBER := 0;
BEGIN
  --AVERIGUAR SI EXISTE LA REGIÓN. SI YA EXISTE DAMOS ERROR. SI NO EXISTE PASAMOS A EXCEPTION Y SEGUIMOS CON EL PROGRAMA
  SELECT REGION_NAME INTO NOMBRE_REGION FROM REGIONS WHERE UPPER(REGION_NAME)=UPPER(NOM_REGION);
  RAISE_APPLICATION_ERROR(-20321, 'ESTA REGION YA EXISTE');
  EXCEPTION
    -- SI LA REGION NO EXISTE LA INSERTAMOS. ES UN EJEMPLO DE COMO PODEMOS USAR LA EXCEPCION PARA HACER ALGO CORRECTO
    WHEN NO_DATA_FOUND THEN
      SELECT MAX(REGION_ID)+1 INTO CORRELATIVO FROM REGIONS;
      INSERT INTO REGIONS (REGION_ID,REGION_NAME) VALUES(CORRELATIVO,NOM_REGION);
      COMMIT;
      RETURN CORRELATIVO;
END;

DECLARE
  CONSULTA_REGION NUMBER;
BEGIN
  CONSULTA_REGION := FN_CREAR_REGION('NORMANDIA');
END;