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