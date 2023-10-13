/******************************************************************************/
/***** CREAR UN REF CURSOR *****/
SET SERVEROUTPUT ON;

DECLARE
  TYPE CURSOR_VARIABLE IS REF CURSOR;
  V1 CURSOR_VARIABLE;
  X1 CURSOR_VARIABLE;
  
  EMPLEADOS EMPLOYEES%ROWTYPE;
BEGIN
  OPEN V1 FOR SELECT * FROM EMPLOYEES;
  FETCH V1 INTO EMPLEADOS;
    DBMS_OUTPUT.PUT_LINE(EMPLEADOS.SALARY);
  CLOSE V1;
END;