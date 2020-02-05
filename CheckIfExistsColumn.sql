DECLARE
  V_COLUMN_EXISTS NUMBER := 0;  
BEGIN
  SELECT COUNT(*) 
  INTO V_COLUMN_EXISTS
  FROM ALL_TAB_COLS
  WHERE OWNER = 'OWNER'
  AND TABLE_NAME = 'TABLE_NAME'
  AND COLUMN_NAME = 'COL_NAME'
;

  IF (V_COLUMN_EXISTS = 0) THEN
    EXECUTE IMMEDIATE 'ALTER TABLE OWNER.TABLE_NAME ADD COL_NAME VARCHAR2(1)';
  END IF;
END;
/
