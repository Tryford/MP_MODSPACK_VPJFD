--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_BUILDING_PROD',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_CRIME',			0.5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_DISEASE',			0.5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_HAPPINESS',		0.5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_HEALTH',			0.5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_WONDER_PROD',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_DEVELOPMENT_PER_BUILDING',		0.4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

UPDATE Defines
SET Value = 0
WHERE Name IN ('UNHAPPY_GROWTH_PENALTY', 'VERY_UNHAPPY_GROWTH_PENALTY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE_GROWTH_PENALTY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================



