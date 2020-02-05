SELECT * FROM
(
SELECT
  MTBL.ID,
  VAL.CODE,
  VAL.VALUE
FROM
  MYTABLE MTBL,
  MYVALUES VAL
WHERE
    MTBL.ID = VAL.ID_MYTABLE
AND VAL.CODE IN ('X', 'Y', 'Z')
)
PIVOT
(
   SUM(VAL.VALUE) FOR CODE IN ('X', 'Y', 'Z' )
)
ORDER BY MTBL.ID
;