--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_CRIMES_PER_GREAT_WORKS',		0.25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_CRIMES_ORGANIZED_THRESHOLD',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_CRIMES_PER_SPECIALISTS',		0.34
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_CRIMES_PER_POPULATION',		0.34
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================	
-- Concepts
--------------------------------------------------------------------------------------------------------------------------
UPDATE Concepts
SET Summary = 'TXT_KEY_JFD_BUILDINGS_MAINTENANCE_HEADING2_BODY' 
WHERE Summary = 'TXT_KEY_BUILDINGS_MAINTENANCE_HEADING2_BODY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================



