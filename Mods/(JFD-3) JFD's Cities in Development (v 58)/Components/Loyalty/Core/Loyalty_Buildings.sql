--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description, 						MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TRAFALGAR', 		'BUILDING_JFD_TRAFALGAR',			'TXT_KEY_BUILDING_JFD_TRAFALGAR', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 				CivilizationType,					BuildingType)
SELECT	'BUILDINGCLASS_JFD_TRAFALGAR', 		Type,								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--==========================================================================================================================
---- BUILDINGS
--==========================================================================================================================	
-- Dummies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_DISLOYALTY',			'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DISLOYALTY',			'TXT_KEY_BUILDING_JFD_DISLOYALTY_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY',				'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_LOYALTY',				'TXT_KEY_BUILDING_JFD_LOYALTY_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY_PATRIOTIC',	'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			0,				'TXT_KEY_BUILDING_JFD_LOYALTY_PATRIOTIC',	'TXT_KEY_BUILDING_JFD_LOYALTY_PATRIOTIC_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY_ALLEGIANT',	'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			0,				'TXT_KEY_BUILDING_JFD_LOYALTY_ALLEGIANT',	'TXT_KEY_BUILDING_JFD_LOYALTY_ALLEGIANT_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY_NEUTRAL',		'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			0,				'TXT_KEY_BUILDING_JFD_LOYALTY_NEUTRAL',		'TXT_KEY_BUILDING_JFD_LOYALTY_NEUTRAL_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY_SEPARATIST',	'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			0,				'TXT_KEY_BUILDING_JFD_LOYALTY_SEPARATIST',	'TXT_KEY_BUILDING_JFD_LOYALTY_SEPARATIST_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 								Help)
SELECT	'BUILDING_JFD_LOYALTY_REBELLIOUS',	'BUILDINGCLASS_JFD_CID',	-1,				-1,		-1,			0,				'TXT_KEY_BUILDING_JFD_LOYALTY_REBELLIOUS',	'TXT_KEY_BUILDING_JFD_LOYALTY_REBELLIOUS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
--Prison
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE Type = 'BUILDING_JFD_PRISON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

--Police Station
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_NATIONALISM'
	WHERE Type = NEW.Type;
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_EAST_JFD_INDIA_COMPANY_STRATEGY', Help = 'TXT_KEY_BUILDING_EAST_JFD_INDIA_COMPANY_LOYALTY_HELP'
WHERE Type = 'BUILDING_JFD_EAST_INDIA_COMPANY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 						BuildingClass, 					Cost, 	PrereqTech, 				MaxStartEra, 	LoyaltyFromNavalUnits,	Water,	GreatPeopleRateChange, 	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 						PortraitIndex, 	WonderSplashImage, 			WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_TRAFALGAR', 	'BUILDINGCLASS_JFD_TRAFALGAR',	750,	'TECH_STEAM_POWER',			'ERA_MODERN',	15,							1,		0,						'TXT_KEY_BUILDING_JFD_TRAFALGAR', 	'TXT_KEY_WONDER_JFD_TRAFALGAR_HELP',	'TXT_KEY_WONDER_JFD_TRAFALGAR_PEDIA',	'TXT_KEY_WONDER_JFD_TRAFALGAR_QUOTE',	1,			-1,					-1,				100,			'JFD_LOYALTY_WONDER_ATLAS',		1,				'Wonder_Trafalgar.dds',		'L,B',					'AS2D_WONDER_SPEECH_JFD_TRAFALGAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE Type = 'BUILDING_JFD_TRAFALGAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);	
-------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType = 'BUILDING_JFD_EAST_INDIA_COMPANY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_TRAFALGAR', 			'YIELD_CULTURE',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_COURTHOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_DRILL_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type,								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building_YieldModifiers
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_COURTHOUSE')
BEGIN
	INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type, 							'YIELD_JFD_LOYALTY',	10
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

	INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type, 							'YIELD_JFD_LOYALTY',	20
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_COURTHOUSE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
END;
-------------------------------------------------------------------------------------------------------------------------
-- Building_GlobalYieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GlobalYieldModifiers 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',		10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_HEROIC_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,						HelpText,										IsWrittenFirst)
SELECT	'BUILDING_HEROIC_EPIC',				'TXT_KEY_WONDER_JFD_HEROIC_EPIC_HELP_LOYALTY',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits
		(BuildingType,						UnitType,										NumUnits)
SELECT	'BUILDING_JFD_TRAFALGAR',			'UNIT_GREAT_ADMIRAL',							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	Type,						25
FROM Buildings WHERE Type IN ('FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	Type,								'FLAVOR_CULTURE',			10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	Type,								'FLAVOR_HAPPINESS',			10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building_Flavors
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
BEGIN
	INSERT INTO Building_Flavors
			(BuildingType,					FlavorType,					Flavor)
	SELECT	Type,							'FLAVOR_CULTURE',			10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
	
	INSERT INTO Building_Flavors
			(BuildingType,					FlavorType,					Flavor)
	SELECT	Type,							'FLAVOR_HAPPINESS',			10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
END;

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================