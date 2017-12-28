--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Beliefs SET Description = 'TXT_KEY_BELIEF_JFD_ONE_WITH_NATURE_DESC' WHERE Type = 'BELIEF_ONE_WITH_NATURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE' AND Value = 1);
INSERT INTO Beliefs
		(Type,							Description,								ShortDescription,								Pantheon)
SELECT	'BELIEF_JFD_GOD_MEDICINE',		'TXT_KEY_BELIEF_JFD_GOD_MEDICINE_DESC',		'TXT_KEY_BELIEF_JFD_GOD_MEDICINE_SHORT_DESC',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE' AND Value = 1);

INSERT INTO Beliefs
		(Type,							Description,								ShortDescription,								Pantheon)
SELECT	'BELIEF_JFD_HEALING_VAPORS',	'TXT_KEY_BELIEF_JFD_HEALING_VAPORS_DESC',	'TXT_KEY_BELIEF_JFD_HEALING_VAPORS_SHORT_DESC',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS' AND Value = 1);

INSERT INTO Beliefs
		(Type,							Description,								ShortDescription,								Follower)
SELECT	'BELIEF_JFD_SHAMANISM',			'TXT_KEY_BELIEF_JFD_SHAMANISM_DESC',		'TXT_KEY_BELIEF_JFD_SHAMANISM_SHORT_DESC',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType,					BuildingClassType,					YieldType,				YieldChange)
SELECT	'BELIEF_JFD_GOD_MEDICINE',		'BUILDINGCLASS_JFD_HERBALIST',		'YIELD_FAITH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE' AND Value = 1);

INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType,					BuildingClassType,					YieldType,				YieldChange)
SELECT	'BELIEF_JFD_GOD_MEDICINE',		'BUILDINGCLASS_JFD_HERBALIST',		'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_FeatureYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Belief_FeatureYieldChanges
		(BeliefType,					FeatureType,						YieldType,				Yield)
SELECT	'BELIEF_JFD_HEALING_VAPORS',	'FEATURE_FLOOD_PLAINS',				'YIELD_JFD_HEALTH',		 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS' AND Value = 1);

INSERT INTO Belief_FeatureYieldChanges
		(BeliefType,					FeatureType,						YieldType,				Yield)
SELECT	'BELIEF_JFD_HEALING_VAPORS',	'FEATURE_MARSH',					'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,					SpecialistType,						YieldType,				Yield)
SELECT	'BELIEF_JFD_SHAMANISM',			'SPECIALIST_JFD_DOCTOR',			'YIELD_FAITH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,					SpecialistType,						YieldType,				Yield)
SELECT	'BELIEF_JFD_SHAMANISM',			'SPECIALIST_JFD_DOCTOR',			'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldChangeNaturalWonder
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Belief_YieldChangeNaturalWonder WHERE BeliefType = 'BELIEF_ONE_WITH_NATURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE' AND Value = 1);
INSERT INTO Belief_YieldChangeNaturalWonder
		(BeliefType,					YieldType,				 Yield)
SELECT	'BELIEF_ONE_WITH_NATURE',		'YIELD_FAITH',			 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE' AND Value = 1);

INSERT INTO Belief_YieldChangeNaturalWonder
		(BeliefType,					YieldType,				 Yield)
SELECT	'BELIEF_ONE_WITH_NATURE',		'YIELD_JFD_HEALTH',		 3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================