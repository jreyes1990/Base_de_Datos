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
