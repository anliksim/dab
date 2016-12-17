/**
 ---------------------------------------------------
    Drop tables if exists
 ---------------------------------------------------
 */
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Sammelstelle CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Fabrik CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE KaffeSorte CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Abgabe CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Lieferung CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE LieferungMoeglich CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE AbgabeMoeglich CASCADE CONSTRAINTS';
  EXCEPTION
  WHEN OTHERS THEN
  IF SQLCODE != -942
  THEN
    RAISE;
  END IF;
END;

/**
 ---------------------------------------------------
    Create tables
 ---------------------------------------------------
 */
CREATE TABLE Sammelstelle (
  sId   INT         NOT NULL,
  sOrt  VARCHAR(20) NOT NULL,
  sLand VARCHAR(20) NOT NULL,
  CONSTRAINT pk_s_sId PRIMARY KEY (sid),
  CONSTRAINT uq_s_loc UNIQUE (sOrt, sLand)
);

CREATE TABLE Fabrik (
  fId   INT         NOT NULL,
  fOrt  VARCHAR(20) NOT NULL,
  fLand VARCHAR(20) NOT NULL,
  CONSTRAINT pk_f_fId PRIMARY KEY (fid),
  CONSTRAINT uq_f_loc UNIQUE (fOrt, fLand)
);

CREATE TABLE KaffeSorte (
  kId   INT         NOT NULL,
  kName VARCHAR(20) NOT NULL,
  CONSTRAINT pk_ks_kId PRIMARY KEY (kId),
  CONSTRAINT uq_ks_name UNIQUE (kName)
);

CREATE TABLE AbgabeMoeglich (
  sId INT NOT NULL,
  kId INT NOT NULL,
  CONSTRAINT fk_am_sId FOREIGN KEY (sid) REFERENCES Sammelstelle (sId),
  CONSTRAINT fk_am_kId FOREIGN KEY (kid) REFERENCES KaffeSorte (kId),
  CONSTRAINT pk_am_skId PRIMARY KEY (sId, kId)
);

CREATE TABLE Abgabe (
  aId    INT  NOT NULL,
  sId    INT  NOT NULL,
  kId    INT  NOT NULL,
  aAnzKg INT  NOT NULL,
  aDatum DATE NOT NULL,
  CONSTRAINT fk_a_skId FOREIGN KEY (sid, kid) REFERENCES AbgabeMoeglich (sId, kId),
  CONSTRAINT uq_a_askId UNIQUE (aId, sId, kId)
);

CREATE TABLE LieferungMoeglich (
  sId INT NOT NULL,
  fId INT NOT NULL,
  kId INT NOT NULL,
  CONSTRAINT fk_lm_sId FOREIGN KEY (sId) REFERENCES Sammelstelle (sid),
  CONSTRAINT fk_lm_fId FOREIGN KEY (fId) REFERENCES Fabrik (fId),
  CONSTRAINT fk_lm_kId FOREIGN KEY (kId) REFERENCES KaffeSorte (kId),
  CONSTRAINT pk_lm_sfkId PRIMARY KEY (sId, fId, kId)
);

CREATE TABLE Lieferung (
  sId    INT NOT NULL,
  fId    INT NOT NULL,
  kId    INT NOT NULL,
  lId    INT NOT NULL,
  lAnzKg INT NOT NULL,
  lDatum INT NOT NULL,
  CONSTRAINT fk_l_sfkId FOREIGN KEY (sId, fId, kId) REFERENCES LieferungMoeglich (sId, fId, kId),
  CONSTRAINT uq_l_sfklId UNIQUE (sId, fId, kId, lId)
);