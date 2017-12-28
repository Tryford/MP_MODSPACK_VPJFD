--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		TRVisionBoost,				FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_ANDEAN_IDEAL_1',			-1,		-1,			-1,					0,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_ANDEAN_IDEAL_1_DESC',			'TXT_KEY_BUILDING_JFD_ANDEAN_IDEAL_1_HELP', 		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE'	 AND Value = 1);			

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		TRVisionBoost,				FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_ANDEAN_IDEAL_3',			-1,		-1,			-1,					0,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_ANDEAN_IDEAL_3_DESC',			'TXT_KEY_BUILDING_JFD_ANDEAN_IDEAL_3_HELP', 		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE'	 AND Value = 1);

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		TRVisionBoost,				FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_CENTRAL_IDEAL_1',			-1,		-1,			-1,					0,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_CENTRAL_IDEAL_1_DESC',		'TXT_KEY_BUILDING_JFD_CENTRAL_IDEAL_1_HELP', 		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE'	 AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		GreatPeopleRateModifier,	FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_PACIFIC_IDEAL_3',			-1,		-1,			-1,					15,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_PACIFIC_IDEAL_3_DESC',		'TXT_KEY_BUILDING_JFD_PACIFIC_IDEAL_3_HELP', 		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		BuildingProductionModifier,	FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_SEMITIC_IDEAL_3',			-1,		-1,			-1,					10,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_SEMITIC_IDEAL_3_DESC',		'TXT_KEY_BUILDING_JFD_SEMITIC_IDEAL_3_HELP', 		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		MilitaryProductionModifier,	FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_TOTALITARIAN_IDEAL_3',	-1,		-1,			-1,					25,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_TOTALITARIAN_IDEAL_3_DESC',	'TXT_KEY_BUILDING_JFD_TOTALITARIAN_IDEAL_3_HELP', 	1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 									Cost, 	FaithCost, 	GreatWorkCount,		BuildingDefenseModifier,	FreeGreatWork,		PrereqTech,		BuildingClass, 			Description, 										Help, 												NukeImmune,		NeverCapture)
SELECT	'BUILDING_JFD_WEST_AFRICAN_IDEAL_1',	-1,		-1,			-1,					25,							NULL,				NULL,			'BUILDINGCLASS_JFDLC',	'TXT_KEY_BUILDING_JFD_WEST_AFRICAN_IDEAL_1_DESC',	'TXT_KEY_BUILDING_JFD_WEST_AFRICAN_IDEAL_1_HELP', 	1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges	
		(BuildingType,					BuildingClassType,			YieldType,			YieldChange)
SELECT	'BUILDING_JFD_ANDEAN_IDEAL_1',	'BUILDINGCLASS_PALACE',		'YIELD_GOLD',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges	
		(BuildingType,					BuildingClassType,			YieldType,			YieldChange)
SELECT	'BUILDING_JFD_ANDEAN_IDEAL_3',	'BUILDINGCLASS_SHRINE',		'YIELD_FAITH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------
-- Building_DomainFreeExperiences
--------------------------------
INSERT INTO Building_DomainFreeExperiences	
		(BuildingType,					DomainType,					Experience)
SELECT	'BUILDING_JFD_CENTRAL_IDEAL_1',	'DOMAIN_LAND',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_JFD_HelpTexts	
		(BuildingClassType,				PolicyType,							HelpText)
SELECT	'BUILDINGCLASS_CASTLE',			'POLICY_IDEALS_JFD_CENTRAL_1',		'TXT_KEY_BUILDING_JFD_CENTRAL_CASTLE_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================