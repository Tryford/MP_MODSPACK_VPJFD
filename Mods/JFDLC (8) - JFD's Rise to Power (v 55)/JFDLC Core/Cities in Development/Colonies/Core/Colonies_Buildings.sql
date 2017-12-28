--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================	
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY',	'BUILDING_JFD_EAST_INDIA_COMPANY',	'TXT_KEY_BUILDING_JFD_EAST_INDIA_COMPANY',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',	'BUILDING_JFD_GOVERNORS_MANSION',	'TXT_KEY_BUILDING_JFD_GOVERNORS_MANSION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_PENA_PALACE', 		'BUILDING_JFD_PENA_PALACE',			'TXT_KEY_BUILDING_JFD_PENA_PALACE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType,						CivilizationType,					BuildingType)
SELECT	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',	Type,								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType,					BuildingType)
SELECT	'BUILDINGCLASS_JFD_PENA_PALACE', 		Type,								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================	
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,								BuildingClass,								Cost,	PrereqTech,					ProvinceUpgradeType,	BombardRange,	GoldMaintenance,	CannotBeSold,	AllowsPuppetPurchase,	Description,								Help, 												Civilopedia,									NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY',		125,	'TECH_ECONOMICS',			NULL,					0,				0,					0,				0,						'TXT_KEY_BUILDING_JFD_EAST_INDIA_COMPANY',	'TXT_KEY_BUILDING_JFD_EAST_INDIA_COMPANY_HELP',		'TXT_KEY_BUILDING_JFD_EAST_INDIA_COMPANY_TEXT',	30,				1,			-1,					-1,				1,				'EXPANSION2_WONDER_ATLAS',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,								Cost,	PrereqTech,					ProvinceUpgradeType,	BombardRange,	GoldMaintenance,	CannotBeSold,	AllowsPuppetPurchase,	Description,								Help, 												Civilopedia,									NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_GOVERNORS_MANSION',	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		-1,		NULL,						'PROVINCE_JFD_COLONY',	2,				4,					1,				1,						'TXT_KEY_BUILDING_JFD_GOVERNORS_MANSION',	'TXT_KEY_BUILDING_JFD_GOVERNORS_MANSION_HELP',		'TXT_KEY_BUILDING_JFD_GOVERNORS_MANSION_TEXT',	0,				1,			-1,					-1,				100,			'JFD_COLONIES_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

--National Treasury
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY', Help = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_STRATEGY', Civilopedia = 'TXT_KEY_CIV5_BUILDINGS_JFD_NATIONAL_TREASURY_TEXT', IconAtlas = 'NEW_BLDG_ATLAS_DLC', PortraitIndex = 1
WHERE Type = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_BANKING', Help = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_CLAIMS_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_CLAIMS_STRATEGY'
WHERE Type = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CLAIMS_TECH_CHANGES_NATIONAL_TREASURY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost,		PrereqTech, 				MaxStartEra, 	SpecialistType, 		UnmoddedHappiness,	GreatPeopleRateChange,	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 						PortraitIndex, 	WonderSplashImage, 			WonderSplashAnchor,		WonderSplashAudio)
SELECT	'BUILDING_JFD_PENA_PALACE',			'BUILDINGCLASS_JFD_PENA_PALACE',		800,		'TECH_SCIENTIFIC_THEORY',	'ERA_MODERN', 	'SPECIALIST_ENGINEER',	1,					2,						'TXT_KEY_BUILDING_JFD_PENA_PALACE',	'TXT_KEY_WONDER_JFD_PENA_PALACE_HELP',	'TXT_KEY_WONDER_JFD_PENA_PALACE_PEDIA',	'TXT_KEY_WONDER_JFD_PENA_PALACE_QUOTE',	1,			-1,					-1,				100,			'JFD_LOYALTY_WONDER_ATLAS',		0,				'Wonder_Pena.dds',			'L,B',					'AS2D_WONDER_SPEECH_JFD_PENA_PALACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassHappiness
		(BuildingType,						BuildingClassType,						Happiness)
SELECT	'BUILDING_JFD_PENA_PALACE',			'BUILDINGCLASS_JFD_GOVERNORS_MANSION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType,						BuildingClassType,							YieldType,			YieldChange)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLD',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType,						BuildingClassType,							YieldType,			YieldChange)
SELECT	'BUILDING_JFD_PENA_PALACE',			'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_CULTURE',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Building_YieldChanges SET BuildingType = 'BUILDING_JFD_EAST_INDIA_COMPANY' WHERE BuildingType = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_PENA_PALACE', 		'YIELD_CULTURE',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	'FLAVOR_EXPANSION',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	'FLAVOR_GOLD',			50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PENA_PALACE',			'FLAVOR_WONDER',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PENA_PALACE',			'FLAVOR_GREAT_PEOPLE',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PENA_PALACE',			'FLAVOR_GOLD',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PENA_PALACE',			'FLAVOR_PRODUCTION',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PENA_PALACE',			'FLAVOR_CULTURE',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================