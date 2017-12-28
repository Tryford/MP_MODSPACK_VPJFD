--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MAX_FROM_CIVILIAN_CAPTURE',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MIN_FROM_CIVILIAN_CAPTURE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MAX_FROM_ENCAMPMENT',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MIN_FROM_ENCAMPMENT',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_FROM_CS_TRADE_ROUTE',			0.1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_FROM_TRADE_ROUTE',				0.15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================

