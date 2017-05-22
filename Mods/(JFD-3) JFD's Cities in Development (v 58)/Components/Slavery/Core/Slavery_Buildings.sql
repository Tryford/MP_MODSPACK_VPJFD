--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 							 DefaultBuilding, 				Description, 						MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_STONE_TOWN',	 'BUILDING_JFD_STONE_TOWN', 	'TXT_KEY_BUILDING_JFD_STONE_TOWN', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 			 CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_STONE_TOWN',	 Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass, 						NumTradeRouteBonus,	Cost, 	Water,	PrereqTech, 		MaxStartEra, 	SpecialistType, 		GreatPeopleRateChange, 	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 					PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 		WonderSplashAnchor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'BUILDINGCLASS_JFD_STONE_TOWN',		1,					600,	1,		'TECH_NAVIGATION',	'ERA_MODERN',   'SPECIALIST_MERCHANT',	2,						'TXT_KEY_BUILDING_JFD_STONE_TOWN',	'TXT_KEY_WONDER_JFD_STONE_TOWN_HELP',	'TXT_KEY_WONDER_JFD_STONE_TOWN_PEDIA',	'TXT_KEY_WONDER_JFD_STONE_TOWN_QUOTE',	1,			-1,					-1,				100,			'JFD_SLAVERY_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_STONE_TOWN',	'Wonder_StoneTown.dds',	'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PYRAMID_HELP'
WHERE Type = 'BUILDING_PYRAMID'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_CHANGES_PYRAMIDS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_STONE_TOWN',		'YIELD_GOLD',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_STONE_TOWN',		'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SlaveryMods
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_SlaveryMods 
		(BuildingType, 					TradeRouteMod)
SELECT	'BUILDING_JFD_STONE_TOWN',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,						Flavor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'FLAVOR_GREAT_PEOPLE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,						Flavor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'FLAVOR_TILE_IMPROVEMENT',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,						Flavor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'FLAVOR_I_TRADE_DESTINATION',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,						Flavor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'FLAVOR_I_TRADE_ORIGIN',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,						Flavor)
SELECT	'BUILDING_JFD_STONE_TOWN',		'FLAVOR_WONDER',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================