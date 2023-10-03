/******************************************************************************/
/***** EXCEPCIONES - PRACTICA *****/
/* 1- Crear una SELECT (no un cursor explícito) que devuelva el nombre de un
      empleado pasándole el EMPLOYEE_ID en el WHERE,
      • Comprobar en primer lugar que funciona pasando un empleado existente
      • Pasar un empleado inexistente y comprobar que genera un error
      • Crear una zona de EXCEPTION controlando el NO_DATA_FOUND
        para que pinte un mensaje como “Empleado inexistente”
*/
SET SERVEROUTPUT ON;

DECLARE
  NOMBRE_EMPLEADO EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME INTO NOMBRE_EMPLEADO FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('EMPLEADO INEXISTENTE');
END;

/* 2- Modificar la SELECT para que devuelva más de un empleado, por ejemplo
      poniendo EMPLOYEE_ID> 100. 
      Debe generar un error. Controlar la excepción para que genere un mensaje 
      como “Demasiados empleados en la consulta”
*/
SET SERVEROUTPUT ON;

DECLARE
  NOMBRE_EMPLEADO EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME INTO NOMBRE_EMPLEADO FROM EMPLOYEES WHERE EMPLOYEE_ID>100;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('EMPLEADO INEXISTENTE');
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('DEMASIADOS EMPLEADOS EN LA CONSULTA');
END;


/* 3- Modificar la consulta para que devuelva un error de división por CERO,
      por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos
      por 0. En este caso, en vez de controlar la excepción directamente,
      creamos una sección WHEN OTHERS y pintamos el error con SQLCODE y SQLERRM
*/
SET SERVEROUTPUT ON;

DECLARE
  SALARIO EMPLOYEES.SALARY%TYPE;
  RESULTADO NUMBER;
BEGIN
  SELECT SALARY INTO SALARIO FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
  RESULTADO := SALARIO/0;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('EMPLEADO INEXISTENTE');
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('DEMASIADOS EMPLEADOS EN LA CONSULTA');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('SQLCODE'||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQLERRM'||SQLERRM);
END;

/* 4- El error -00001 es clave primaria duplicada.
      a. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) 
         vamos a crear una excepción no -predefinida que haga lo mismo.
      b. Vamos a usar la tabla REGIONS para hacerlo más fácil
      c. Usamos PRAGMA EXCEPTION_INIT y creamos una excepción denominada “duplicado”.
      d. Cuando se genere ese error debemos pintar “Clave duplicada, intente otra”.
*/
SET SERVEROUTPUT ON;

DECLARE
  DUPLICADO EXCEPTION;
  PRAGMA EXCEPTION_INIT(DUPLICADO,-00001);
BEGIN
  INSERT INTO REGIONS VALUES(1, 'PRUEBA');
  COMMIT;
  EXCEPTION
    WHEN DUPLICADO THEN
      DBMS_OUTPUT.PUT_LINE('REGISTRO DUPLICADO');
END;

/******************************************************************************/
/***** EXCEPCIONES DE USUARIO - PRACTICA *****/
/* 1- Crear una Excepción personalizada denominada CONTROL_REGIONES.
      • Debe dispararse cuando al insertar o modificar una región
        queramos poner una clave superior a 200. Por ejemplo usando una
        variable con ese valor.
      • En ese caso debe generar un texto indicando algo así como
        “Codigo no permitido. Debe ser inferior a 200”
      • Recordemos que las excepciones personalizadas deben
        dispararse de forma manual con el RAISE.
*/
SET SERVEROUTPUT ON;

DECLARE
  CONTROL_REGIONES EXCEPTION;
  CODIGO           NUMBER := 201;
BEGIN
  IF CODIGO > 200 THEN
    RAISE CONTROL_REGIONES;
  ELSE
    INSERT INTO REGIONS VALUES(CODIGO, 'PRUEBA');
  END IF;
  EXCEPTION
    WHEN CONTROL_REGIONES THEN
      DBMS_OUTPUT.PUT_LINE('EL CODIGO DEBE SER INFERIOR A 200');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
