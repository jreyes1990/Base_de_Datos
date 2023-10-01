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

/******************************************************************************/
/***** COMANDO CASE - PRACTICA *****/
/* • Vamos a crear una variable denominada "usuario", de tipo VARCHAR2(40)
   • Vamos a poner dentro el nombre del usuario con el que nos hemos conectado. 
     Para saberlo, usamos la función USER de Oracle que devuelve el nombre del 
     usuario con el que estamos conectados (Recuerda que en Oracle no hace falta 
     poner paréntesis si una función no tiene argumentos) usuario:=user
     
   • Luego hacermos un CASE para que nos pinte un mensaje del estilo:
     o Si el usuario es SYS ponemos el mensaje "Eres superadministrador"
     o Si el usuario es SYSTEM ponemos el mensaje "Eres un administrador normal"
     o Si el usuario es HR ponemos el mensaje "Eres de Recursos humanos"
     o Cualquier otro usuario ponemos "usuario no autorizado
*/
SET SERVEROUTPUT ON;

DECLARE
  USUARIO VARCHAR2(40);
  MENSAJE VARCHAR2(50);
BEGIN
  USUARIO := USER;
  
  CASE
    WHEN USUARIO = 'SYS' THEN
      MENSAJE := 'Eres Super Administrador';
    WHEN USUARIO = 'SYSTEM' THEN
      MENSAJE := 'Eres un Administrador normal';
    WHEN USUARIO = 'HR' THEN
      MENSAJE := 'Eres de Recursos Humanos';
    ELSE
      MENSAJE := 'Usuario no autorizado';
  END CASE;
  DBMS_OUTPUT.PUT_LINE('MENSAJE: '||MENSAJE);
END;