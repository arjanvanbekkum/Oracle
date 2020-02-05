-- Get all tables with 10% changs
SELECT NUM_ROWS
,      LAST_ANALYZED
,      TABLE_NAME
,      TOT_UPDATES
,      INSERTS
,      UPDATES
,      DELETES
,      TIMESTAMP
,      TO_CHAR(PERC_UPDATES, 'FM999,999,999,990.00') PERC_UPDATES
,      PARTITION_NAME
FROM
    (
      SELECT A.*
      ,      NVL(DECODE(NUM_ROWS, 0, '-1', 100 * TOT_UPDATES / NUM_ROWS), -1) PERC_UPDATES
      FROM
          (
            SELECT
              (
               SELECT NUM_ROWS
               FROM   ALL_TABLES DT
               WHERE  DT.TABLE_NAME = ALL_TAB_MODIFICATIONS.TABLE_NAME
               AND    ALL_TAB_MODIFICATIONS.TABLE_OWNER = DT.OWNER
              ) NUM_ROWS
            , (
               SELECT LAST_ANALYZED
               FROM   ALL_TABLES DTA
               WHERE  DTA.TABLE_NAME = ALL_TAB_MODIFICATIONS.TABLE_NAME
               AND ALL_TAB_MODIFICATIONS.TABLE_OWNER = DTA.OWNER
              ) LAST_ANALYZED
            , (INSERTS + UPDATES + DELETES) TOT_UPDATES
            , ALL_TAB_MODIFICATIONS.*
            FROM SYS.ALL_TAB_MODIFICATIONS
          ) A
    ) B
WHERE  PERC_UPDATES > 10;



