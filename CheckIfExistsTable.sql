DECLARE
  V_TABLE_EXISTS  NUMBER := 0;  
BEGIN
  SELECT COUNT(*)
  INTO V_TABLE_EXISTS 
  FROM ALL_TABLES
  WHERE OWNER = 'OWNER'
  AND TABLE_NAME = 'TABLE_NAME';

  IF (V_TABLE_EXISTS  = 1) THEN
    EXECUTE IMMEDIATE 'DROP TABLE OWNER.TABLE_NAME';
  END IF;
END;
/
