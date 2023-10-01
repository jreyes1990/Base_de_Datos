/* CALCULAR EL IMPUESTO DE UN PRODUCTO
   - El impuesto sera del 21%. Le debemos poner una constante.
   - Creamos una variable de tipo NUMBER(5,2) para poner el precio del producto.
   - Creamos otra variable para el resultado. Le decimos que es del mismo (type) que la anterior.
   - Hacemos el calculo y visualizamos el resultado.
*/
SET SERVEROUTPUT ON;

DECLARE
  IMPUESTO CONSTANT NUMBER := 21;
  PRECIO NUMBER(5,2);
  RESULTADO PRECIO%TYPE;
BEGIN
  PRECIO := 100.50;
  RESULTADO := PRECIO - (PRECIO * (IMPUESTO / 100));
  DBMS_OUTPUT.PUT_LINE('PRECIO: '|| PRECIO);  
  DBMS_OUTPUT.PUT_LINE('IMPUESTO: '|| IMPUESTO ||'%');
  DBMS_OUTPUT.PUT_LINE('RESULTADO: '|| RESULTADO);  
END;

/******************************************************************************/
/***** BLOQUES ANIDADOS - PRACTICAS *****/
/* 1. Indicar que valores visualiza X en los 3 casos de DBMS_OUTPUT.PUT_LINE(x) en este ejemplo */
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER:=10;
BEGIN
  DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 10
  DECLARE
    X NUMBER:=20;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 20
  END;
  DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 10
END;

/* 2 .¿Es este bloque correcto? Si no es así ¿por qué falla?
      Falla porque la variable X está solo en el bloque anidado y por tanto no puede ser vista desde el bloque principal */
SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE(X); -- ERROR: NO EXISTE UNA VARIABLE GLOBAL
DECLARE
  X NUMBER:=20;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 20
  END;
  DBMS_OUTPUT.PUT_LINE(X); -- ERROR: NO EXISTE UNA VARIABLE GLOBAL
END;

/* 3. ¿Es este bloque correcto? Si es así ¿qué valores visualiza X? */
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER:=10;
BEGIN
  DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 10
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 10
  END;
  DBMS_OUTPUT.PUT_LINE(X); -- MUESTRA EL VALOR DE 10
END;

/******************************************************************************/
/***** FUNCIONES - PRACTICAS *****/
/* 1. VISUALIZAR INICIALES DE UN NOMBRE
      • Crea un bloque PL/SQL con tres variables VARCHAR2:
        - Nombre
        - apellido1
        - apellido2
      • Debes visualizar las iniciales separadas por puntos.
      • Además siempre en mayúscula
      • Por ejemplo alberto pérez García debería aparecer--> A.P.G
*/
SET SERVEROUTPUT ON;

DECLARE
  NOMBRE    VARCHAR2(50);
  APELLIDO1 NOMBRE%TYPE;
  APELLIDO2 NOMBRE%TYPE;
  INICIALES NOMBRE%TYPE;
BEGIN
  NOMBRE    := 'alberto';
  APELLIDO1 := 'perez';
  APELLIDO2 := 'garcia';
  INICIALES := UPPER(SUBSTR(NOMBRE,1,1)||'.'||SUBSTR(APELLIDO1,1,1)||'.'||SUBSTR(APELLIDO2,1,1));
  DBMS_OUTPUT.PUT_LINE('INICIALES: '||INICIALES);
END;

/* 2. NOMBRE DEL DIA EN QUE NACESITE
      Averiguar el nombre del día que naciste, por ejemplo "Martes"
      • PISTA (Función TO_CHAR)
*/
SET SERVEROUTPUT ON;

DECLARE
  FECHA           DATE;
  DIA_NACIMIENTO  VARCHAR2(50);
BEGIN
  FECHA := '3/5/1990';
  DIA_NACIMIENTO := TO_CHAR(TO_DATE(FECHA), 'DAY');
  DBMS_OUTPUT.PUT_LINE('DIA NACIMIENTO: '||DIA_NACIMIENTO);
END;

