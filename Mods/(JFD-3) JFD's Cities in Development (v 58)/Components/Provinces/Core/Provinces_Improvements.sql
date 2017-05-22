--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
------------------------------------------------------------
INSERT INTO Improvements
		(Type,								PillageGold,	UpgradeTime,	ImprovementUpgrade,			Description,							Civilopedia,									ArtDefineTag,								IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_JFD_TRADING_POST',		10,				15,				'IMPROVEMENT_JFD_VILLAGE',	Description,							Civilopedia,									'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	IconAtlas,			PortraitIndex
FROM Improvements WHERE Type = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvements
		(Type,								PillageGold,	UpgradeTime,	ImprovementUpgrade,			Description,							Civilopedia,									ArtDefineTag,								IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_JFD_TOWN',				40,				0,				NULL,						'TXT_KEY_IMPROVEMENT_JFD_TOWN_DESC',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_TOWN_TEXT',		'ART_DEF_IMPROVEMENT_JFD_TOWN',				'TERRAIN_ATLAS',	32
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvements
		(Type,								PillageGold,	UpgradeTime,	ImprovementUpgrade,			Description,							Civilopedia,									ArtDefineTag,								IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_JFD_VILLAGE',			20,				30,				'IMPROVEMENT_JFD_TOWN',		'TXT_KEY_IMPROVEMENT_JFD_VILLAGE_DESC',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_VILLAGE_TEXT',	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'TERRAIN_ATLAS',	32
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE Improvements
SET GrantsVisionXTiles = 3
WHERE Type IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_FEITORIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

UPDATE Improvements
SET ImprovementUpgrade = 'IMPROVEMENT_CITADEL', UpgradeTime = 50, NoTwoAdjacent = 1
WHERE Type IN ('IMPROVEMENT_FORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

UPDATE Improvements
SET GrantsVisionXTiles = 7
WHERE Type IN ('IMPROVEMENT_CITADEL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

UPDATE Improvements
SET ImprovementUpgrade = 'IMPROVEMENT_JFD_VILLAGE', PillageGold = 10, UpgradeTime = 20, GraphicalOnly = 1, ArtDefineTag = 'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET'
WHERE Type = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------------------------------------
-- Improvement_ValidTerrains
------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,					TerrainType)
SELECT	'IMPROVEMENT_JFD_TRADING_POST',		TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_ValidTerrains
		(ImprovementType,					TerrainType)
SELECT	'IMPROVEMENT_JFD_VILLAGE',			TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------------------------------------
-- Improvement_ResourceTypes
------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					ResourceType)
SELECT	'IMPROVEMENT_JFD_TRADING_POST',		ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					ResourceType)
SELECT	'IMPROVEMENT_JFD_TOWN',				ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					ResourceType)
SELECT	'IMPROVEMENT_JFD_VILLAGE',			ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_CITADEL',				'YIELD_DEFENSE',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_CHATEAU',				'YIELD_DEFENSE',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_KASBAH',				'YIELD_DEFENSE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_FORT',					'YIELD_DEFENSE',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_JFD_TRADING_POST',		'YIELD_GOLD',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_JFD_TOWN',				'YIELD_GOLD',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_JFD_VILLAGE',			'YIELD_GOLD',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE Improvement_Yields
SET Yield = 1
WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------------------------------------
-- Improvement_TechYieldChanges
------------------------------------------------------------
DELETE FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
--------------------------------	
UPDATE Builds
SET Time = 600
WHERE Type = 'BUILD_FORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT' AND Value = 1);

UPDATE Builds
SET Recommendation = 'TXT_KEY_BUILD_JFD_TRADING_POST_REC', Help = 'TXT_KEY_BUILD_JFD_TRADING_POST_HELP', PrereqTech = 'TECH_TRAPPING', ImprovementType = 'IMPROVEMENT_JFD_TRADING_POST'
WHERE Type = 'BUILD_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================