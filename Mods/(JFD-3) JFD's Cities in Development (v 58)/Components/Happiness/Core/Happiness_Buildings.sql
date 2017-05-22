--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Dummies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,									BuildingClass,				GreatWorkCount,		Cost, 	FaithCost, 	NeverCapture,	Description, 									Help)
SELECT	'BUILDING_JFD_HAPPINESS_PRODUCTION',	'BUILDINGCLASS_JFD_CID',	-1,					-1,		-1,			1,				'TXT_KEY_BUILDING_JFD_HAPPINESS_PRODUCTION',	'TXT_KEY_BUILDING_JFD_HAPPINESS_PRODUCTION_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				GreatWorkCount,		Cost, 	FaithCost, 	ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_UNHAPPINESS',				'BUILDINGCLASS_JFD_CID',	-1,					-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_UNHAPPINESS',				'TXT_KEY_BUILDING_JFD_UNHAPPINESS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PALACE' AND YieldType = 'YIELD_PRODUCTION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_BUILDING_CHANGES_PALACE' AND Value = 1);
INSERT INTO Building_YieldChanges
		(BuildingType,							YieldType,				Yield)
SELECT	'BUILDING_JFD_HAPPINESS_PRODUCTION',	'YIELD_PRODUCTION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================