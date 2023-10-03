/******************************************************************************/
/***** INTRODUCCION A LAS EXCEPCIONES DE PL/SQL *****/
SET SERVEROUTPUT ON;

DECLARE
  EMPL EMPLOYEES%ROWTYPE;
BEGIN
  SELECT * INTO EMPL FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
  DBMS_OUTPUT.PUT_LINE(EMPL.FIRST_NAME);
  
  EXCEPTION --MANEJO DE EXCEPCIONES
    WHEN EX1 THEN
      NULL;
    WHEN EX2 THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
END;

/******************************************************************************/
/***** EXCEPCIONES PREDEFINIDAS DE PL/SQL *****/
SET SERVEROUTPUT ON;

DECLARE
  EMPL EMPLOYEES%ROWTYPE;
BEGIN
  SELECT * INTO EMPL FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
  DBMS_OUTPUT.PUT_LINE(EMPL.FIRST_NAME);
  
  EXCEPTION --MANEJO DE EXCEPCIONES
  -- NO_DATA_FOUND
  -- TOO_MANY_ROWS
  -- ZERO_DIVIDE
  -- DUP_VAL_ON_INDEX
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('ERROR ORA-01403, EMPLEADO INEXISTENTE');
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR ORA-01422, DEMASIADOS EMPLEADOS');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR INDEFINIDO');
END;

/******************************************************************************/
/***** EXCEPCIONES NO PREDEFINIDAS DE PL/SQL *****/
SET SERVEROUTPUT ON;

DECLARE
  MI_EXCEP EXCEPTION;
  PRAGMA EXCEPTION_INIT(MI_EXCEP,-937);
  V1 NUMBER;
  V2 NUMBER;
BEGIN
  SELECT EMPLOYEE_ID, SUM(SALARY) INTO V1,V2 FROM EMPLOYEES;
  DBMS_OUTPUT.PUT_LINE(V1);
  
  EXCEPTION
    WHEN MI_EXCEP THEN
      DBMS_OUTPUT.PUT_LINE('FUNCION DE GRUPO INCORRECTA');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR INDEFINIDO');
END;

/******************************************************************************/
/***** EXCEPCIONES DE PL/SQL - SQLCODE y SQLERRM *****/
CREATE TABLE ERRORS(
  CODE    NUMBER,
  MESSAGE VARCHAR2(200)
);

SELECT * FROM ERRORS;

SET SERVEROUTPUT ON;

DECLARE
  EMPL    EMPLOYEES%ROWTYPE;
  CODE    ERRORS.CODE%TYPE;
  MESSAGE ERRORS.MESSAGE%TYPE;
BEGIN
  SELECT * INTO EMPL FROM EMPLOYEES;
  DBMS_OUTPUT.PUT_LINE(EMPL.SALARY);
  
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      CODE := SQLCODE;
      MESSAGE := SQLERRM;
      INSERT INTO ERRORS VALUES(CODE,MESSAGE);
      COMMIT;
END;

/******************************************************************************/
/***** CONTROLAR SQL A TRAVES DE EXCEPCIONES *****/
SET SERVEROUTPUT ON;

DECLARE
  REG         REGIONS%ROWTYPE;
  REG_CONTROL REGIONS.REGION_ID%TYPE;
BEGIN
  REG.REGION_ID := 100;
  REG.REGION_NAME := 'AFRICA';
  SELECT REGION_ID INTO REG_CONTROL FROM REGIONS WHERE REGION_ID=REG.REGION_ID;
  DBMS_OUTPUT.PUT_LINE('LA REGION YA EXISTE');
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO REGIONS VALUES(REG.REGION_ID, REG.REGION_NAME);
      COMMIT;
END;

/******************************************************************************/
/***** EXCEPCIONES DE USUARIO *****/
SET SERVEROUTPUT ON;

DECLARE
  REG_MAX EXCEPTION;
  REGN    NUMBER;
  REGT    VARCHAR2(200);
BEGIN
  REGN := 101;
  REGT := 'ASIA';
  IF REGN > 100 THEN
    RAISE REG_MAX;
  ELSE
    INSERT INTO REGIONS VALUES(REGN, REGT);
  END IF;
  EXCEPTION
    WHEN REG_MAX THEN
      DBMS_OUTPUT.PUT_LINE('LA REGION NO PUEDE SER MAYOR DE 100.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR INDEFINIDO');
END;

/******************************************************************************/
/***** AMBITO DE EXCEPCIONES *****/
SET SERVEROUTPUT ON;

DECLARE
  REG_MAX EXCEPTION;
  REGN    NUMBER;
  REGT    VARCHAR2(200);
BEGIN
  REGN := 101;
  REGT := 'ASIA';
  BEGIN
    IF REGN > 100 THEN
      RAISE REG_MAX;
    ELSE
      INSERT INTO REGIONS VALUES(REGN, REGT);
      COMMIT;
    END IF;
  END;
  EXCEPTION
    WHEN REG_MAX THEN
      DBMS_OUTPUT.PUT_LINE('LA REGION NO PUEDE SER MAYOR A 100.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR INDEFINIDO');
END;

/******************************************************************************/
/***** COMANDO RAISE_APPLICATION_ERROR *****/
