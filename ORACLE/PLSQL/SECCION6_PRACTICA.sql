/******************************************************************************/
/***** COMANDO IF - PRACTICA *****/
/* 1. PRÁCTICA 1
   • Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable NUMBER y la ponemos algún valor.
   • Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE para hacer el ejercicio
   • Como pista, recuerda que hay una función en SQL denominada MOD, que permite averiguar el resto de una división.
   • Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4.
*/
SET SERVEROUTPUT ON;

DECLARE
  VALOR   NUMBER;
  NUMERO  NUMBER;
BEGIN
  VALOR := 10;
  NUMERO := MOD(VALOR, 2);
  IF NUMERO = 0 THEN
    DBMS_OUTPUT.PUT_LINE(NUMERO||' => PAR');
  ELSE
    DBMS_OUTPUT.PUT_LINE(NUMERO||' => IMPAR');
  END IF;
END;

/* 2. PRÁCTICA 2
   • Crear una variable CHAR(1) denominada TIPO_PRODUCTO.
   • Poner un valor entre "A" Y "E"
   • Visualizar el siguiente resultado según el tipo de producto
     o 'A' --> Electronica
     o 'B' --> Informática
     o 'C' --> Ropa
     o 'D' --> Música
     o 'E' --> Libros
     o Cualquier otro valor debe visualizar "El código es incorrecto".
*/
SET SERVEROUTPUT ON;

DECLARE
  TIPO_PRODUCTO CHAR(1);
  RESPUESTA VARCHAR2(100);
BEGIN
  TIPO_PRODUCTO := UPPER('Z');
  IF TIPO_PRODUCTO = 'A' THEN
    RESPUESTA := 'Electronica';
  ELSIF TIPO_PRODUCTO = 'B' THEN
    RESPUESTA := 'Informatica';
  ELSIF TIPO_PRODUCTO = 'C' THEN
    RESPUESTA := 'Ropa';
  ELSIF TIPO_PRODUCTO = 'D' THEN
    RESPUESTA := 'Musica';
  ELSIF TIPO_PRODUCTO = 'E' THEN
    RESPUESTA := 'Libros';
  ELSE
    RESPUESTA := 'El codigo es incorrecto';
  END IF;
  DBMS_OUTPUT.PUT_LINE('RESPUESTA: '||RESPUESTA);
END;