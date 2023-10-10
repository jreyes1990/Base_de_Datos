/******************************************************************************/
/***** TIPOS EVENTO DML - TRIGGERS DE PL/SQL *****/
/*  * TIPOS:
      - BEFORE: Se dispara antes de la operacion
      - AFTER: Se dispara despues de la operacion
      - INSTEAD OF: Se dispara para determinadas vistas que no sean modificables porque son muy complejas, porque tiene muchas tablas aceptadas.
                    Son vistas que no permiten INSERT, UPDATE o DELETE
                    
    * EVENTOS QUE SE DISPARAN:
      - INSERT
      - UPDATE
      - DELETE
      
    * FILAS AFECTADAS:
      - STATEMENT: Solo se disparan una vez (afecta a toda la operacion), EJEMPLO: DELETE de 1000 filas (orientado a controlar el comando completo).
      - ROW: Se dispara por cada fila afectada, EJEMPLO: DELETE de 1000 filas, el TRIGGER se dispararia 1000 veces (oriendado a controlar cada fila).
*/