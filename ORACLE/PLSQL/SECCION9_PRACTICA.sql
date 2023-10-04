/******************************************************************************/
/***** COLECCIONES Y RECORDS - PRACTICA *****/
/* Creamos un TYPE RECORD que tenga las siguientes columnas
    NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
    
   • Creamos un TYPE TABLE basado en el RECORD anterior
   • Mediante un bucle cargamos en la colección los empleados. 
     El campo NAME debe contener FIRST_NAME y LAST_NAME concatenado.
   • Para cargar las filas y siguiendo un ejemplo parecido que hemos visto 
     en el vídeo usamos el EMPLOYEE_ID que va de 100 a 206
   • A partir de este momento y ya con la colección cargada, 
     hacemos las siguientes operaciones, usando métodos de la colección.
     • Visualizamos toda la colección
     • Visualizamos el primer empleado
     • Visualizamos el último empleado
     • Visualizamos el número de empleados
     • Borramos los empleados que ganan menos de 7000 y visualizamos de
       nuevo la colección
     • Volvemos a visualizar el número de empleados para ver cuantos se han
       borrado
*/
SET SERVEROUTPUT ON;

DECLARE
  TYPE EMPL_RECORD IS RECORD(
    NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE
  );
  
  TYPE EMPL_TABLE IS TABLE OF
    EMPL_RECORD
  INDEX BY PLS_INTEGER;
  
  EMPL EMPL_TABLE;
BEGIN
  FOR I in 100..206 LOOP
    SELECT FIRST_NAME||' '||LAST_NAME, SALARY, DEPARTMENT_ID INTO EMPL(I) FROM EMPLOYEES WHERE EMPLOYEE_ID=I;
  END LOOP;
  
  FOR I IN EMPL.FIRST..EMPL.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(EMPL(I).NAME||' '||EMPL(I).SAL||' '||EMPL(I).COD_DEPT);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('EL PRIMERO');
  DBMS_OUTPUT.PUT_LINE(EMPL(EMPL.FIRST).NAME);
  DBMS_OUTPUT.PUT_LINE('EL ÚLTIMO');
  DBMS_OUTPUT.PUT_LINE(EMPL(EMPL.LAST).NAME);
  DBMS_OUTPUT.PUT_LINE('BORRAMOS LOS EMPLEADOS QUE GANEN MENOS DE 7000');
  DBMS_OUTPUT.PUT_LINE('ANTES');
  DBMS_OUTPUT.PUT_LINE(EMPL.COUNT);
  
  FOR I IN EMPL.FIRST..EMPL.LAST LOOP
    IF EMPL(I).SAL < 7000 THEN
      EMPL.DELETE(I) ;
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('DESPUES');
  DBMS_OUTPUT.PUT_LINE(EMPL.COUNT);
END;