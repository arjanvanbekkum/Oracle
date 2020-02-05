
UPDATE SOMETABLE S
SET ( 
      S.CODE, 
      S.DESCRIPTION
    ) =
    (SELECT 
       T.CODE, 
       T.DESCRIPTION 
      FROM 
       OTHERTABLE T
      WHERE  T.ID = S.ID_OTHERTABLE 
    )
;
