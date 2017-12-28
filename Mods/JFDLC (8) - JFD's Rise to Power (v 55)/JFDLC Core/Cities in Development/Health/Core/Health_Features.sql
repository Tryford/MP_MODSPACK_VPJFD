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
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_FALLOUT',			'YIELD_JFD_DISEASE',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_FLOOD_PLAINS',		'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_FOUNTAIN_YOUTH',	'YIELD_JFD_HEALTH',		6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH' AND Value = 1);

UPDATE Feature_YieldChanges SET Yield = 4 WHERE FeatureType = 'FEATURE_LAKE_VICTORIA' AND YieldType = 'YIELD_FOOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_LAKE_VICTORIA',	'YIELD_JFD_HEALTH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_FEATURE_CHANGES_LAKE_VICTORIA' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_JUNGLE',			'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_MARSH',			'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Feature_YieldChanges
		(FeatureType,				YieldType,				Yield)
SELECT	'FEATURE_OASIS',			'YIELD_JFD_HEALTH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================