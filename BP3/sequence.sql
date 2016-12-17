/**
 ---------------------------------------------------
    Drop sequences
 ---------------------------------------------------
 */
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SAMMELSTELLE_SEQ';
  EXECUTE IMMEDIATE 'DROP SEQUENCE KAFFESORTE_SEQ';
  EXECUTE IMMEDIATE 'DROP SEQUENCE FABRIC_SEQ';
  EXCEPTION
  WHEN OTHERS THEN
  IF SQLCODE != -2289
  THEN
    RAISE;
  END IF;
END;

/**
 ---------------------------------------------------
    Create sequences
 ---------------------------------------------------
 */
CREATE SEQUENCE SAMMELSTELLE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE KAFFESORTE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE FABRIC_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;