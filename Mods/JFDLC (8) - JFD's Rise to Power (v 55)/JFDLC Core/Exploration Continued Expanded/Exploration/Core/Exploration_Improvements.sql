--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,											Description,						ArtDefineTag)
VALUES	('IMPROVEMENT_FAKE_FARM_FIX',					'TXT_KEY_IMPROVEMENT_JFD_FARM_FIX',	'ART_DEF_IMPROVEMENT_MINE');

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('IMPROVEMENT_FAKE_FARM_FIX');
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FARM' AND TerrainType = 'TERRAIN_DESERT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_EXCE_EXPLORATION_TERRAIN_CHANGES_DESERT' AND Value = 1);
-- INSERT INTO Improvement_ValidTerrains
		-- (ImprovementType,		TerrainType)
-- SELECT	Type,					'TERRAIN_OCEAN'
-- FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_GOODY_SHIP_ASIA', 'IMPROVEMENT_JFD_GOODY_SHIP_AFRI', 'IMPROVEMENT_JFD_GOODY_SHIP_EURO')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TERRAIN_ADDITIONS_SHIPWRECKS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_CEDAR',	'IMPROVEMENT_LUMBERMILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_GINGER',	'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 				ImprovementType)
SELECT 	'RESOURCE_JFD_FEATHERS',	'IMPROVEMENT_TRADING_POST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_MAIZE',	'IMPROVEMENT_FARM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_OAK',		'IMPROVEMENT_LUMBERMILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_OBSIDIAN','IMPROVEMENT_MINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_SULFUR',	'IMPROVEMENT_MINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_RICE',	'IMPROVEMENT_FARM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_RUBBER',	'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_OPIUM',	'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_SAFFRON',	'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
SELECT	'RESOURCE_JFD_VANILLA',	'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ResourceType, 				ImprovementType)
SELECT	'RESOURCE_GOLD',			'IMPROVEMENT_JFD_MACHU_PICCHU'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_BANANA' AND YieldType = 'YIELD_PRODUCTION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_BANANA' AND Value = 1);
INSERT INTO Improvement_ResourceType_Yields	
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_BANANA',		'IMPROVEMENT_PLANTATION',	'YIELD_PRODUCTION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_BANANA' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_CEDAR',	'IMPROVEMENT_LUMBERMILL',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_FEATHERS','IMPROVEMENT_TRADING_POST',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Improvement_ResourceType_Yields 	
		(ResourceType, 			ImprovementType,			YieldType, 				Yield)
SELECT	'RESOURCE_JFD_GINGER',	ImprovementType,			YieldType, 				Yield
FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_DYE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_MAIZE',	'IMPROVEMENT_FARM',			'YIELD_FOOD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_OAK',		'IMPROVEMENT_LUMBERMILL',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_OBSIDIAN','IMPROVEMENT_MINE',			'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields 	
		(ResourceType, 			ImprovementType,			YieldType, 				Yield)
SELECT	'RESOURCE_JFD_OPIUM',	ImprovementType,			YieldType, 				Yield
FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_DYE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_RICE',	'IMPROVEMENT_FARM',			'YIELD_FOOD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_RUBBER',	'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields	
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_RUBBER',	'IMPROVEMENT_PLANTATION',	'YIELD_PRODUCTION',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_SAFFRON',	'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 			ImprovementType,			YieldType,				Yield)
SELECT	'RESOURCE_JFD_SULFUR',	'IMPROVEMENT_MINE',			'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields 	
		(ResourceType, 			ImprovementType,			YieldType, 				Yield)
SELECT	'RESOURCE_JFD_VANILLA',	ImprovementType,			YieldType, 				Yield
FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_SPICES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================		
		
			
		
			