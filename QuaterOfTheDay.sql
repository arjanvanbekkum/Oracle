SELECT
  TO_NUMBER( TO_CHAR(MAX(MTBL.TIMESTAMP),'HH24')) * 4 + TO_NUMBER( TO_CHAR(MAX(MTBL.TIMESTAMP),'MI')) / 15
FROM
  MYTABLE MTBL
WHERE MTBL.TIMESTAMP = TO_DATE('0308111615','DDMMYYHH24MI')
;



