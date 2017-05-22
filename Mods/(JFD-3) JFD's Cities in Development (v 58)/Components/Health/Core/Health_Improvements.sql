--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================	
-- Builds
------------------------------	
INSERT INTO Builds
		(Type,							ImprovementType, 				Kill,	Description,			  Help,									CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,					HotKey, EntityEvent)
SELECT	'BUILD_JFD_SANATORIUM',			'IMPROVEMENT_JFD_SANATORIUM',	1,		'TXT_KEY_JFD_SANATORIUM', 'TXT_KEY_BUILD_JFD_SANATORIUM_HELP',	1,			96,				0,			'JFD_HEALTH_BUILD_ATLAS',	'KB_L',	'ENTITY_EVENT_IRRIGATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType, 					FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_JFD_SANATORIUM',			FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds
		(UnitType, 						BuildType)
SELECT	'UNIT_JFD_GREAT_DOCTOR',		'BUILD_JFD_SANATORIUM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
------------------------------
INSERT OR REPLACE INTO Improvements
		(Type,								BuildableOnResources,	CreatedByGreatPerson,	Description,								ArtDefineTag, 							GraphicalOnly)
SELECT	'IMPROVEMENT_JFD_PLAGUE',			0,						0,						'TXT_KEY_IMPROVEMENT_JFD_PLAGUE',			'ART_DEF_IMPROVEMENT_JFD_PLAGUE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE_PLAGUE_EFFECT' AND Value = 1);

INSERT INTO Improvements
		(Type,								BuildableOnResources,	CreatedByGreatPerson,	Description,								ArtDefineTag,							Civilopedia,										PillageGold,	PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_JFD_SANATORIUM',		1,						1,						'TXT_KEY_IMPROVEMENT_JFD_SANATORIUM',		'ART_DEF_IMPROVEMENT_JFD_SANATORIUM', 	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_SANATORIUM_TEXT',	20,				0,				'JFD_HEALTH_IMPROVEMENT_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,				ResourceType)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,			 Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	'YIELD_JFD_HEALTH',  5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_ImprovementYieldChanges
		(ImprovementType,				TraitType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	TraitType,		YieldType,				Yield
FROM Trait_ImprovementYieldChanges WHERE TraitType = 'TRAIT_SCHOLARS_JADE_HALL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,				PolicyType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	PolicyType,		'YIELD_JFD_HEALTH',		Yield
FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_NEW_DEAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM',	'TECH_BIOLOGY',	'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================