--==========================================================================================================================
-- BUILDS
--==========================================================================================================================	
-- Builds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,						ImprovementType, 			Kill,	Description,			Help,								CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,					HotKey,		EntityEvent)
SELECT	'BUILD_JFD_ESTATE',			'IMPROVEMENT_JFD_ESTATE',	1,		'TXT_KEY_JFD_ESTATE',	'TXT_KEY_BUILD_JFD_ESTATE_HELP',	1,			96,				0,			'JFD_CLAIMS_BUILD_ATLAS',	'KB_L',		'ENTITY_EVENT_IRRIGATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildFeatures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures
		(BuildType, 				FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_JFD_ESTATE',			FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CUSTOMS_HOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							BuildableOnResources,	CreatedByGreatPerson,	Description,							ArtDefineTag,						Civilopedia,									PillageGold,	PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_JFD_ESTATE',		1,						1,						'TXT_KEY_IMPROVEMENT_JFD_ESTATE',		'ART_DEF_IMPROVEMENT_JFD_ESTATE', 	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_ESTATE_TEXT',	20,				0,				'JFD_CLAIMS_IMPROVEMENT_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,			ResourceType)
SELECT	'IMPROVEMENT_JFD_ESTATE', 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,			TerrainType)
SELECT	'IMPROVEMENT_JFD_ESTATE', 	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,					Yield)
SELECT	'IMPROVEMENT_JFD_ESTATE', 		'YIELD_GOLDEN_AGE_POINTS',  5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_ImprovementYieldChanges
		(ImprovementType,				TraitType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_ESTATE', 		TraitType,	YieldType,	Yield
FROM Trait_ImprovementYieldChanges WHERE TraitType = 'TRAIT_SCHOLARS_JADE_HALL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,				PolicyType,	YieldType,					 Yield)
SELECT	'IMPROVEMENT_JFD_ESTATE', 		PolicyType,	'YIELD_GOLDEN_AGE_POINTS',	 Yield
FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_NEW_DEAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,					YieldType,					Yield)
SELECT	'IMPROVEMENT_JFD_ESTATE',		'TECH_JFD_JURISPRUDENCE',	'YIELD_GOLDEN_AGE_POINTS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================