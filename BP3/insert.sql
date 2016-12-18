/**
 ---------------------------------------------------
    Remove entries
 ---------------------------------------------------
 */
DELETE LIEFERUNG;
DELETE ABGABE;
DELETE LIEFERUNGMOEGLICH;
DELETE ABGABEMOEGLICH;
DELETE SAMMELSTELLE;
DELETE KAFFESORTE;
DELETE FABRIK;


COMMIT;
/**
 ---------------------------------------------------
    Create entries
 ---------------------------------------------------
 */
INSERT INTO SAMMELSTELLE (SID, SORT, SLAND) VALUES (SAMMELSTELLE_SEQ.nextval, 'Bern', 'Schweiz');
INSERT INTO SAMMELSTELLE (SID, SORT, SLAND) VALUES (SAMMELSTELLE_SEQ.nextval, 'Basel', 'Schweiz');
INSERT INTO SAMMELSTELLE (SID, SORT, SLAND) VALUES (SAMMELSTELLE_SEQ.nextval, 'Genf', 'Schweiz');

INSERT INTO KAFFESORTE (KID, KNAME) VALUES (KAFFESORTE_SEQ.nextval, 'Java');
INSERT INTO KAFFESORTE (KID, KNAME) VALUES (KAFFESORTE_SEQ.nextval, 'Arabica');
INSERT INTO KAFFESORTE (KID, KNAME) VALUES (KAFFESORTE_SEQ.nextval, 'Robusta');

INSERT INTO ABGABEMOEGLICH (SID, KID)
  SELECT
    S.SID,
    K.KID
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Arabica'
        AND S.SORT = 'Basel'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABEMOEGLICH (SID, KID)
  SELECT
    S.SID,
    K.KID
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Robusta'
        AND S.SORT = 'Basel'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABEMOEGLICH (SID, KID)
  SELECT
    S.SID,
    K.KID
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Robusta'
        AND S.SORT = 'Bern'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABEMOEGLICH (SID, KID)
  SELECT
    S.SID,
    K.KID
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    5,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Arabica'
        AND S.SORT = 'Basel'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    5,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Robusta'
        AND S.SORT = 'Bern'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    5,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    20,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    7,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    16,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    22,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO ABGABE (AID, SID, KID, AANZKG, ADATUM)
  SELECT
    ABGABE_SEQ.nextval,
    S.SID,
    K.KID,
    45,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz';

INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIK_SEQ.nextval, 'Peking', 'China');
INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIK_SEQ.nextval, 'Rio', 'Brasilien');
INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIK_SEQ.nextval, 'Buenos Aires', 'Argentinien');

INSERT INTO LIEFERUNGMOEGLICH (SID, FID, KID)
  SELECT
    SID,
    FID,
    KID
  FROM SAMMELSTELLE S, FABRIK F, KAFFESORTE K
  WHERE K.KNAME = 'Robusta'
        AND S.SORT = 'Bern'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Peking'
        AND F.FLAND = 'China';

INSERT INTO LIEFERUNGMOEGLICH (SID, FID, KID)
  SELECT
    SID,
    FID,
    KID
  FROM SAMMELSTELLE S, FABRIK F, KAFFESORTE K
  WHERE K.KNAME = 'Arabica'
        AND S.SORT = 'Basel'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Rio'
        AND F.FLAND = 'Brasilien';

INSERT INTO LIEFERUNGMOEGLICH (SID, FID, KID)
  SELECT
    SID,
    FID,
    KID
  FROM SAMMELSTELLE S, FABRIK F, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Buenos Aires'
        AND F.FLAND = 'Argentinien';

INSERT INTO LIEFERUNGMOEGLICH (SID, FID, KID)
  SELECT
    SID,
    FID,
    KID
  FROM SAMMELSTELLE S, FABRIK F, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Peking'
        AND F.FLAND = 'China';

INSERT INTO LIEFERUNGMOEGLICH (SID, FID, KID)
  SELECT
    SID,
    FID,
    KID
  FROM SAMMELSTELLE S, FABRIK F, KAFFESORTE K
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Rio'
        AND F.FLAND = 'Brasilien';

INSERT INTO LIEFERUNG (SID, FID, KID, LID, LANZKG, LDATUM)
  SELECT
    S.SID,
    F.FID,
    K.KID,
    LIEFERUNG_SEQ.nextval,
    10,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K, FABRIK F
  WHERE K.KNAME = 'Robusta'
        AND S.SORT = 'Bern'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Peking'
        AND F.FLAND = 'China';

INSERT INTO LIEFERUNG (SID, FID, KID, LID, LANZKG, LDATUM)
  SELECT
    S.SID,
    F.FID,
    K.KID,
    LIEFERUNG_SEQ.nextval,
    10,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K, FABRIK F
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Peking'
        AND F.FLAND = 'China';

INSERT INTO LIEFERUNG (SID, FID, KID, LID, LANZKG, LDATUM)
  SELECT
    S.SID,
    F.FID,
    K.KID,
    LIEFERUNG_SEQ.nextval,
    10,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K, FABRIK F
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Buenos Aires'
        AND F.FLAND = 'Argentinien';

INSERT INTO LIEFERUNG (SID, FID, KID, LID, LANZKG, LDATUM)
  SELECT
    S.SID,
    F.FID,
    K.KID,
    LIEFERUNG_SEQ.nextval,
    10,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K, FABRIK F
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Rio'
        AND F.FLAND = 'Brasilien';

INSERT INTO LIEFERUNG (SID, FID, KID, LID, LANZKG, LDATUM)
  SELECT
    S.SID,
    F.FID,
    K.KID,
    LIEFERUNG_SEQ.nextval,
    4,
    sysdate
  FROM SAMMELSTELLE S, KAFFESORTE K, FABRIK F
  WHERE K.KNAME = 'Java'
        AND S.SORT = 'Genf'
        AND S.SLAND = 'Schweiz'
        AND F.FORT = 'Rio'
        AND F.FLAND = 'Brasilien';

COMMIT;