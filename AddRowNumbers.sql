SELECT 
  MTBL.ID,
  MTBL.CODE,
  MTBL.DESCRIPTION,
  ROW_NUMBER() over (PARTITION BY MTBL.ID order by  HIST.STARTDATE) AS NR,
  HIST.STARTDATE,
  HIST.ENDDATE,
  HIST.SETTINGS
FROM MYTABLE MTBL
LEFT JOIN MYHISTRORIE HIST ON HIST.ID_MYTABLE = MTBL.ID
