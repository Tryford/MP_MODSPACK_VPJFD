--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
-- PolicyBranchTypes
------------------------------------------------------------
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_BRANCH_JFD_BUREAUCRATS_HELP_CLAIMS'
WHERE Type IN ('POLICY_BRANCH_COMMERCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------------------------------------
DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_PATRONAGE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_PATRONAGE',					Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_PATRONAGE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_PATRONAGE',					Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassHappiness
------------------------------------------------------------
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_PATRONAGE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_PATRONAGE_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- PolicyBranchTypes
------------------------------
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_BRANCH_JFD_SCHOLARS_HELP_EE'
WHERE Type IN ('POLICY_BRANCH_RATIONALISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');
------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------------------------------------
DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_RATIONALISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_RATIONALISM',				Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_EE_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_RATIONALISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_RATIONALISM',				Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_EE_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassHappiness
------------------------------------------------------------
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_RATIONALISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_RATIONALISM_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_EE_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================