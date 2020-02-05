/*
  Using a PRAGMA AUTONOMOUS_TRANSACTION within a transaction will 
  commit the changes even if the transaction has a rollback
*/

CREATE OR REPLACE PROCEDURE LOG (
  SOURCE VARCHAR2,
  CODE NUMBER,
  LOGMESSAGE VARCHAR2
)
AS

PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  /* YOUR CODE HERE */
  COMMIT;
END;



