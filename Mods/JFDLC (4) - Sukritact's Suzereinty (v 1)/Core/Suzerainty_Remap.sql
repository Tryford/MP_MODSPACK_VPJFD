--==========================================================================================================================
-- Remap
--==========================================================================================================================
CREATE TABLE IDRemapper (id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM MinorCivilizations ORDER BY ID;
UPDATE MinorCivilizations SET ID = (SELECT IDRemapper.id-1 FROM IDRemapper WHERE MinorCivilizations.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
--==========================================================================================================================