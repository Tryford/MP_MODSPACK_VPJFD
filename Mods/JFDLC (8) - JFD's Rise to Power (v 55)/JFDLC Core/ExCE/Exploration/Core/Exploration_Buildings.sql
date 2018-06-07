--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------		
INSERT OR REPLACE INTO BuildingClasses
		(Type,								DefaultBuilding,					Description,				MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_BELEM_TOWER',	'BUILDING_JFD_BELEM_TOWER',			'TXT_KEY_JFD_BELEM_TOWER',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Civilization_BuildingClassOverrides
		(CivilizationType, 					BuildingClassType, 					BuildingType)
SELECT	'CIVILIZATION_BARBARIAN',			'BUILDINGCLASS_JFD_BELEM_TOWER', 	NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

INSERT OR REPLACE INTO Civilization_BuildingClassOverrides
		(CivilizationType, 					BuildingClassType, 					BuildingType)
SELECT	'CIVILIZATION_MINOR',				'BUILDINGCLASS_JFD_BELEM_TOWER', 	NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO BuildingClass_JFD_HelpTexts
		(BuildingClassType,					HelpText,										IsWrittenFirst)
SELECT	'BUILDINGCLASS_WATERMILL',			'TXT_KEY_BUILDING_JFD_WATERMILL_EXTRA_HELP',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_WATERMILL' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------				
--Factory
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_FACTORY_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_FACTORY_STRATEGY'
WHERE Type = 'BUILDING_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY' AND Value = 1);

--Granary
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_GRANARY_HELP'
WHERE Type = 'BUILDING_GRANARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1);

--Monastery
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1);
--------------------------
-- Wonders
--------------------------
--Belem Tower
INSERT OR REPLACE INTO  Buildings			
		(Type, 						BuildingClass, 						Cost, 	PrereqTech, 		MaxStartEra, 		Water,	Description, 						 Help, 									Civilopedia, 								TrainedFreePromotion,	Quote, 									 Defense,	ExtraCityHitPoints, NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	NeverCapture,	IconAtlas, 							PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_BELEM_TOWER',	'BUILDINGCLASS_JFD_BELEM_TOWER', 	625, 	'TECH_NAVIGATION',	'ERA_INDUSTRIAL',	1,		'TXT_KEY_BUILDING_JFD_BELEM_TOWER',	 'TXT_KEY_WONDER_JFD_BELEM_TOWER_HELP',	'TXT_KEY_WONDER_JFD_BELEM_TOWER_PEDIA',		'PROMOTION_JFD_BELEM',	'TXT_KEY_WONDER_JFD_BELEM_TOWER_QUOTE',	 1000,		20,					1, 			-1, 				-1, 			100, 			0,				'JFD_EXPLORATION_WONDER_ATLAS', 	0, 				'AS2D_WONDER_SPEECH_JFD_BELEM_TOWER',	'Wonder_BelemTower.dds', 	'L,B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_BELEM_TOWER_HELP_EXPLORER'
WHERE Type = 'BUILDING_JFD_BELEM_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE' AND Value = 1);

-- UPDATE Buildings
-- SET Help = 'TXT_KEY_WONDER_JFD_BELEM_TOWER_HELP_GREAT_EXPLORER'
-- WHERE Type = 'BUILDING_JFD_BELEM_TOWER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

UPDATE Buildings
SET PolicyBranchType = 'POLICY_BRANCH_EXPLORATION'
WHERE Type = 'BUILDING_JFD_BELEM_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

--Louvre
UPDATE Buildings
SET PolicyBranchType = NULL, Help = 'TXT_KEY_WONDER_JFD_LOUVRE_HELP'
WHERE Type = 'BUILDING_LOUVRE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);
----------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,				Yield)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits
		(BuildingType,					UnitType,				NumUnits)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'UNIT_GREAT_ADMIRAL',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

UPDATE Building_FreeUnits
SET UnitType = 'UNIT_JFD_EXPLORER',		 NumUnits = 2
WHERE BuildingType = 'BUILDING_JFD_BELEM_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE' AND Value = 1);

-- UPDATE Building_FreeUnits
-- SET UnitType = 'UNIT_JFD_GREAT_EXPLORER', NumUnits = 1
-- WHERE BuildingType = 'BUILDING_JFD_BELEM_TOWER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,	ResourceType, 				YieldType,				Yield)
SELECT	Type,			'RESOURCE_JFD_RUBBER',		'YIELD_PRODUCTION', 	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,	ResourceType, 				YieldType,				Yield)
SELECT	Type,			'RESOURCE_JFD_SULFUR',		'YIELD_PRODUCTION', 	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,		ResourceType,			YieldType,		Yield)
SELECT	Type,				'RESOURCE_BISON',		'YIELD_FOOD',	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,		ResourceType,			YieldType,		Yield)
SELECT	Type,				'RESOURCE_BISON_MOD',	'YIELD_FOOD',	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_BISON_MOD');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,		ResourceType,			YieldType,		Yield)
SELECT	Type,				'RESOURCE_JFD_MAIZE',	'YIELD_FOOD',	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,		ResourceType,			YieldType,		Yield)
SELECT	Type,				'RESOURCE_JFD_RICE',	'YIELD_FOOD',	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType, 				YieldType,	Yield)
SELECT	'BUILDING_MONASTERY',	'RESOURCE_JFD_SAFFRON',		Type, 		1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

CREATE TRIGGER JFDExCE_Exploration_Buildings
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_WATERMILL')
BEGIN
	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,		ResourceType, 				YieldType,				Yield)
	SELECT	Type,				'RESOURCE_JFD_RUBBER',		'YIELD_PRODUCTION', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_FACTORY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,		ResourceType, 				YieldType,				Yield)
	SELECT	Type,				'RESOURCE_JFD_SULFUR',		'YIELD_PRODUCTION', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_FACTORY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,		ResourceType, 				YieldType,			Yield)
	SELECT	Type,				'RESOURCE_JFD_SAFFRON',		'YIELD_FAITH', 		1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_MONASTERY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,		ResourceType, 				YieldType,			Yield)
	SELECT	Type,				'RESOURCE_JFD_SAFFRON',		'YIELD_CULTURE', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_MONASTERY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,	ResourceType, 			YieldType,		Yield)
	SELECT	Type,			'RESOURCE_BISON',		'YIELD_FOOD', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_GRANARY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,	ResourceType, 			YieldType,		Yield)
	SELECT	Type,			'RESOURCE_BISON_MOD',	'YIELD_FOOD', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_GRANARY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY' AND Value = 1)
	AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_BISON_MOD');

	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,	ResourceType, 			YieldType,		Yield)
	SELECT	Type,			'RESOURCE_JFD_MAIZE',	'YIELD_FOOD', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_WATERMILL'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_WATERMILL' AND Value = 1);

	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,	ResourceType, 			YieldType,		Yield)
	SELECT	Type,			'RESOURCE_JFD_RICE',	'YIELD_FOOD', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_WATERMILL'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_WATERMILL' AND Value = 1);
END;
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'FLAVOR_WONDER',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'FLAVOR_RECON',			30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'FLAVOR_GREAT_PEOPLE',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
SELECT	'BUILDING_JFD_BELEM_TOWER',		'FLAVOR_CITY_DEFENSE',	30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================