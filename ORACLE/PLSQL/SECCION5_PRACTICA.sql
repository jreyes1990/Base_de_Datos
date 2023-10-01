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

