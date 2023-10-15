/******************************************************************************/
/***** CREAR COLUMNAS TIPO LOB *****/
CREATE TABLE PRU_LOB(
  CODIGO NUMBER,
  NOMBRE VARCHAR2(100),
  DATOS CLOB
);

DESC PRU_LOB;

ALTER TABLE PRU_LOB ADD(FOTO BLOB);

DESC PRU_LOB;