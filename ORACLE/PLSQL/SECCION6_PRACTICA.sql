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

/******************************************************************************/
/***** BUCLES - PRACTICA *****/
/* 1. PRACTICA 1
      • Vamos a crear la tabla de multiplicar del 1 al 10, con los tres tipos 
        de bucles: LOOP, WHILE y FOR
*/
/***** BUCLE LOOP *****/
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER := 1;
  Y NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('BUCLE LOOP');
  LOOP
    EXIT WHEN X=11;
    DBMS_OUTPUT.PUT_LINE('Tabla de multiplicar del : '||X);
    LOOP
      EXIT WHEN Y=11;
      DBMS_OUTPUT.PUT_LINE(X||' x '||(X*Y));
      Y := Y+1;
    END LOOP;
    Y := 0;
    X := X+1;
  END LOOP;
END;

/***** BUCLE WHILE *****/
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER := 1;
  Y NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('BUCLE WHILE');
  WHILE X < 11 LOOP
    DBMS_OUTPUT.PUT_LINE('Tabla de multiplicar del : '||X);
    WHILE Y < 11 LOOP
      DBMS_OUTPUT.PUT_LINE(X||' x '||(X*Y));
      Y := Y+1;
    END LOOP;
    Y := 0;
    X := X+1;
  END LOOP;
END;

/***** BUCLE FOR *****/
SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('BUCLE FOR');
  FOR X IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Tabla de multiplicar del : '||X);
    FOR Y IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE(X||' x '||(X*Y));
    END LOOP;
  END LOOP;
END;

/* 2. PRACTICA 2-
      • Crear una variable llamada TEXTO de tipo VARCHAR2(100).
      • Poner alguna frase
      • Mediante un bucle, escribir la frase al revés, Usamos el bucle WHILE
*/
SET SERVEROUTPUT ON;

DECLARE
  TEXTO     VARCHAR2(100);
  CONTADOR  NUMBER := 0;
  AL_REVES  TEXTO%TYPE;
BEGIN
  TEXTO := 'PROGRAMADORES';
  CONTADOR := LENGTH(TEXTO);
  WHILE CONTADOR > 0 LOOP
    AL_REVES := AL_REVES||SUBSTR(TEXTO,CONTADOR,1);
    CONTADOR := CONTADOR-1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('FRASE: '||TEXTO);
  DBMS_OUTPUT.PUT_LINE('FRASE AL REVES: '||AL_REVES);
END;

/* 3. PRACTICA 3
      • Usando la práctica anterior, si en el texto aparece el carácter "x" 
        debe salir del bucle. Es igual en mayúsculas o minúsculas.
      • Debemos usar la cláusula EXIT.
*/
SET SERVEROUTPUT ON;

DECLARE
  TEXTO     VARCHAR2(100);
  CONTADOR  NUMBER := 0;
  AL_REVES  TEXTO%TYPE;
BEGIN
  TEXTO := 'ESTO ES UNA PRUEBA DE XRSE';
  CONTADOR := LENGTH(TEXTO);
  WHILE CONTADOR > 0 LOOP
    EXIT WHEN SUBSTR(TEXTO,CONTADOR,1)='X';
    AL_REVES := AL_REVES||SUBSTR(TEXTO,CONTADOR,1);
    CONTADOR := CONTADOR-1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('FRASE: '||TEXTO);
  DBMS_OUTPUT.PUT_LINE('FRASE AL REVES: '||AL_REVES);
END;

/* 4. PRACTICA 4
      • Debemos crear una variable llamada NOMBRE
      • Debemos pintar tantos asteriscos como letras tenga el nombre.
        Usamos un bucle FOR
      • Por ejemplo Alberto → *******
      • O por ejemplo Pedro → *****
*/
SET SERVEROUTPUT ON;

DECLARE
  NOMBRE      VARCHAR2(100);
  ASTERISCOS  NOMBRE%TYPE;
BEGIN
  NOMBRE := 'JOLBERTH';
  FOR I IN 1..LENGTH(NOMBRE) LOOP
    ASTERISCOS := ASTERISCOS||'*';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(NOMBRE||' => '||ASTERISCOS);
END;

/* 5. PRACTICA 5
      • Creamos dos variables numéricas, "inicio y fin"
      • Las inicializamos con algún valor:
      • Debemos sacar los números que sean múltiplos de 4 de ese rango
*/
SET SERVEROUTPUT ON;

DECLARE
  INICIO NUMBER;
  FINAL NUMBER;
BEGIN
  INICIO:=10;
  FINAL:=200;
  FOR I IN INICIO..FINAL LOOP
    IF MOD(I,4)=0 THEN
      DBMS_OUTPUT.PUT_LINE(I);
    END IF;
  END LOOP;
END;

