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

/***** CREAR UN TRIGGER DE PL/SQL *****/
-- CREANDO LA TABLA LOG_TABLE
CREATE TABLE LOG_TABLE(
  LOG_COLUMN  VARCHAR2(200 BYTE),
  USER_NAME   VARCHAR2(200 BYTE)
);

CREATE OR REPLACE TRIGGER TR_INS_EMPL
AFTER INSERT ON REGIONS --Se diparara despues de la operacion
BEGIN
  INSERT INTO LOG_TABLE VALUES('INSERCION EN LA TABLA REGIONS', USER);
END;

-- REALIZANDO UN INSERT EN LA TABLA REGIONS
INSERT INTO REGIONS VALUES(1000,'TEST_REGIONS');

-- EJECUTANDO EL LOG_TABLE
SELECT * FROM LOG_TABLE;

/***** CONTROLAR COMANDOS CON TRIGGER DE PL/SQL *****/
CREATE OR REPLACE TRIGGER TR_REGION
BEFORE INSERT ON REGIONS
BEGIN
  IF USER <> 'HR' THEN
    RAISE_APPLICATION_ERROR(-20000,'SOLO HR PUEDE INSERTAR EN REGIONS');
  END IF;
END;

--INSERTANDO CON EL USUARIO HR
INSERT INTO REGIONS VALUES(1002,'REGIONS3');

/***** TRIGGERS CON EVENTOS MULTIPLES DE PL/SQL *****/
CREATE OR REPLACE TRIGGER TR_REGION
BEFORE INSERT OR UPDATE OF REGION_NAME OR DELETE
ON REGIONS
BEGIN
  IF USER <> 'HR' THEN
    RAISE_APPLICATION_ERROR(-20000,'SOLO HR PUEDE TRABAJAR EN REGIONS');
  END IF;
END;

UPDATE REGIONS SET REGION_ID='PRUEBA' WHERE REGION_ID=1000;
UPDATE HR.REGIONS SET REGION_NAME='PROGRAMANDO PLSQL' WHERE REGION_ID=1015;

