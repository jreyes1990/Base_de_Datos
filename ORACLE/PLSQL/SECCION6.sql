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


