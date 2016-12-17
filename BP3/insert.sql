/**
 ---------------------------------------------------
    Remove entries
 ---------------------------------------------------
 */
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

INSERT INTO ABGABEMOEGLICH (SID, KID) VALUES (
  (SELECT S.SID
   FROM SAMMELSTELLE S
   WHERE S.SORT = 'Basel' AND S.SLAND = 'Schweiz'),
  (SELECT F.FID
   FROM FABRIK F
   WHERE F.FORT = 'Peking' AND F.FLAND = 'China')
);

INSERT INTO ABGABEMOEGLICH (SID, KID) VALUES (
  (SELECT S.SID
   FROM SAMMELSTELLE S
   WHERE S.SORT = 'Basel' AND S.SLAND = 'Schweiz'),
  (SELECT F.FID
   FROM FABRIK F
   WHERE F.FORT = 'Rio' AND F.FLAND = 'Brasilien')
);

INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIC_SEQ.nextval, 'Peking', 'China');
INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIC_SEQ.nextval, 'Rio', 'Brasilien');
INSERT INTO FABRIK (FID, FORT, FLAND) VALUES (FABRIC_SEQ.nextval, 'Buenos Aires', 'Argentinien');


COMMIT;