--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description, 						MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TRAFALGAR', 		'BUILDING_JFD_TRAFALGAR',			'TXT_KEY_BUILDING_JFD_TRAFALGAR', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 				CivilizationType,					BuildingType)
SELECT	'BUILDINGCLASS_JFD_TRAFALGAR', 		Type,								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--==========================================================================================================================
---- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 						BuildingClass, 					Cost, 	PrereqTech, 			MaxStartEra, 	Water,	GreatPeopleRateChange, 	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 						PortraitIndex, 	WonderSplashImage, 			WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_TRAFALGAR', 	'BUILDINGCLASS_JFD_TRAFALGAR',	750,	'TECH_STEAM_POWER',		'ERA_MODERN',	1,		0,						'TXT_KEY_BUILDING_JFD_TRAFALGAR', 	'TXT_KEY_WONDER_JFD_TRAFALGAR_HELP',	'TXT_KEY_WONDER_JFD_TRAFALGAR_PEDIA',	'TXT_KEY_WONDER_JFD_TRAFALGAR_QUOTE',	1,			-1,					-1,				100,			'JFD_LOYALTY_WONDER_ATLAS',		1,				'Wonder_Trafalgar.dds',		'L,B',					'AS2D_WONDER_SPEECH_JFD_TRAFALGAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE Type = 'BUILDING_JFD_TRAFALGAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);	
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_TRAFALGAR', 			'YIELD_CULTURE',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits
		(BuildingType,						UnitType,					NumUnits)
SELECT	'BUILDING_JFD_TRAFALGAR',			'UNIT_GREAT_ADMIRAL',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType,						ResourceType,					Quantity)
SELECT	Type,								'RESOURCE_JFD_INVENTORS',		2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_GREAT_PEOPLE',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TRAFALGAR',			'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================