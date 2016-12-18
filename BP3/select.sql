/* Liste aller Kaffesorten gem. Aufgabe 2 */
SELECT
  K.KID,
  K.KNAME
FROM KAFFESORTE K
  INNER JOIN ABGABE A ON K.KID = A.KID
  LEFT OUTER JOIN LIEFERUNG L ON K.KID = L.KID
WHERE L.KID IS NULL;


/* Liste aller Kaffesorten gem. Aufgabe 3 */
SELECT
  KID,
  KNAME
FROM
  (SELECT DISTINCT
     K.KID,
     K.KNAME,
     F.FID
   FROM KAFFESORTE K
     JOIN LIEFERUNG L ON K.KID = L.KID
     JOIN FABRIK F ON L.FID = F.FID)
GROUP BY KID, KNAME
HAVING COUNT(KID) = (SELECT COUNT(FID)
                     FROM FABRIK);

/* Kaffesorte zu Fabrik */
SELECT DISTINCT
  K.KID,
  F.FID
FROM KAFFESORTE K
  JOIN LIEFERUNG L ON K.KID = L.KID
  JOIN FABRIK F ON L.FID = F.FID;

/* Anzahl Fabriken */
SELECT COUNT(F.FID)
FROM FABRIK F;


/* Liste aller Sammelstellen gem. Aufgabe 4 */
SELECT
  S.SID,
  S.SORT,
  S.SLAND,
  COUNT(S.SID) AS AnzahlAbgaben
FROM SAMMELSTELLE S
  JOIN ABGABE A ON A.SID = S.SID
WHERE S.SID IN (
  SELECT SID
  FROM (
    SELECT
      S.SID,
      COUNT(S.SID) AS AnzS
    FROM SAMMELSTELLE S
      JOIN LIEFERUNG L ON L.SID = S.SID
    GROUP BY S.SID
    HAVING COUNT(S.SID) > 3))
GROUP BY S.SID, S.SORT, S.SLAND
HAVING COUNT(S.SID) > 5;


/* Sammelstelle mit mehr als 5 Abgaben */
SELECT
  S.SID,
  COUNT(S.SID) AS AnzS
FROM SAMMELSTELLE S
  JOIN ABGABE A ON A.SID = S.SID
GROUP BY S.SID
HAVING COUNT(S.SID) > 5;

/* Sammelstelle mit mehr als 3 Fabriklieferungen */
SELECT
  S.SID,
  COUNT(S.SID) AS AnzS
FROM SAMMELSTELLE S
  JOIN LIEFERUNG L ON L.SID = S.SID
GROUP BY S.SID
HAVING COUNT(S.SID) > 3;
