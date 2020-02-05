DECLARE
  V_ROW_EXISTS NUMBER := 0;  
BEGIN
  SELECT COUNT(*) 
  INTO V_ROW_EXISTS
  FROM TABLE_NAME 
  WHERE COLUMN01 = 'WHERE_SOMETHING';
  
  IF (V_ROW_EXISTS = 0) THEN
    EXECUTE IMMEDIATE 'INSERT INTO TABLE_NAME(COLUMN01, COLUMN02) VALUES(VALUE01, VALUE02)';
  END IF;
END;
/
