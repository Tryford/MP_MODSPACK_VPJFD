--==========================================================================================================================
-- FEATURES
--==========================================================================================================================
-- Features
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Features
SET InBorderHappiness = 4
WHERE Type = 'FEATURE_FOUNTAIN_YOUTH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Feature_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	'FEATURE_FALLOUT',		'YIELD_JFD_DISEASE',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	'FEATURE_FLOOD_PLAINS',	'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	'FEATURE_JUNGLE',		'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	'FEATURE_MARSH',		'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	'FEATURE_OASIS',		'YIELD_JFD_HEALTH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	Type,					'YIELD_JFD_HEALTH',		6
FROM Features WHERE Type IN ('FEATURE_FOUNTAIN_YOUTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH' AND Value = 1);

UPDATE Feature_YieldChanges
SET Yield = 4
WHERE FeatureType = 'FEATURE_LAKE_VICTORIA' AND YieldType = 'YIELD_FOOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,			YieldType,				Yield)
SELECT	Type,					'YIELD_JFD_HEALTH',		2
FROM Features WHERE Type IN ('FEATURE_LAKE_VICTORIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_LAKE_VICTORIA' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,				Yield)
SELECT	'IMPROVEMENT_POLDER',		'YIELD_JFD_HEALTH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Improvement_Yields
SET Yield = 2
WHERE YieldType = 'YIELD_FOOD' AND ImprovementType = 'IMPROVEMENT_POLDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,					ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_PLANTATION',			Type,				'YIELD_JFD_DISEASE',	1
FROM Resources WHERE Type IN ('RESOURCE_JFD_OPIUM', 'RESOURCE_TOBACCO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,				Yield)
SELECT	'IMPROVEMENT_QUARRY',				'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,					ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_OFFSHORE_PLATFORM',	'RESOURCE_OIL',		'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,					ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_WELL',					'RESOURCE_OIL',		'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Improvement_ResourceType_Yields
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE YieldType = 'YIELD_FOOD' AND ResourceType IN ('RESOURCE_PEARLS', 'RESOURCE_SALT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Resource_YieldChanges
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE YieldType = 'YIELD_GOLD' AND ResourceType IN ('RESOURCE_CITRUS', 'RESOURCE_JFD_GINGER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================