/******************************************************************************/
/***** COMANDO IF *****/
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER := 20;
BEGIN
  IF X = 10 THEN
    DBMS_OUTPUT.PUT_LINE('X := ' || X);
  ELSE
    DBMS_OUTPUT.PUT_LINE('X := OTHER VALUE');
  END IF;
END;

/***** COMANDO IF - CALCULO DE BONO *****/
SET SERVEROUTPUT ON;

DECLARE
  SALES NUMBER := 20000;
  BONUS NUMBER := 0;
BEGIN
  IF SALES > 50000 THEN
    BONUS := 1500;
  ELSIF SALES > 35000 THEN
    BONUS := 500;
  ELSE
    BONUS := 100;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('SALES = '||SALES||', BONUS = '||BONUS||'.');
END;

/******************************************************************************/
/***** COMANDO CASE *****/
SET SERVEROUTPUT ON;

DECLARE
  V CHAR(1);
  RESULTADO VARCHAR2(50);
BEGIN
  V := UPPER('f');
  
  CASE V 
    WHEN 'A' THEN
      RESULTADO := 'Excellent';
    WHEN 'B' THEN
      RESULTADO := 'Very Good';
    WHEN 'C' THEN
      RESULTADO := 'Good';
    WHEN 'D' THEN
      RESULTADO := 'Fair';
    WHEN 'F' THEN
      RESULTADO := 'Poor';
    ELSE
      RESULTADO := 'No such value';
  END CASE;
  DBMS_OUTPUT.PUT_LINE('RESULTADO: '||RESULTADO);
END;

/***** COMANDO CASE - SEARCHED *****/
SET SERVEROUTPUT ON;

DECLARE
  BONUS NUMBER;
  RESULTADO VARCHAR2(50);
BEGIN
  BONUS := 101;
  
  CASE
    WHEN BONUS > 500 THEN
      RESULTADO := 'Excellent';
    WHEN BONUS > 250 AND BONUS <= 500 THEN
      RESULTADO := 'Very Good';
    WHEN BONUS > 100 AND BONUS <= 250 THEN
      RESULTADO := 'Good';
    ELSE
      RESULTADO := 'Poor!!!!!';
  END CASE;
  DBMS_OUTPUT.PUT_LINE('RESULTADO: '||RESULTADO);
END;

/******************************************************************************/
/***** BUCLE LOOP *****/
SET SERVEROUTPUT ON;

DECLARE
  X NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('RESULTADO: '||X);
    X := X+1;
    EXIT WHEN X=11;
    /*
    IF X=11 THEN
      EXIT;
    END IF;
    */
  END LOOP;
END;

/***** BUCLE LOOP - ANIDADOS *****/
SET SERVEROUTPUT ON;

DECLARE
  s PLS_INTEGER := 0;
  i PLS_INTEGER := 0;
  j PLS_INTEGER;
BEGIN
  <<parent>> -- Etiqueta: Se esta nombrando el bucle
  LOOP
    -- Print Parent
   i := i+1;
   j := 100;
   DBMS_OUTPUT.PUT_LINE('Parent: '||i);
   <<child>> -- Etiqueta: Se esta nombrando el bucle
   LOOP
    -- Print Child
    EXIT parent WHEN (i > 3);
    DBMS_OUTPUT.PUT_LINE('Child: '||j);
    j := j+1;
    EXIT child WHEN (j > 105);
   END LOOP child;
  END LOOP parent;
  DBMS_OUTPUT.PUT_LINE('Finish!!!!');
END;
