--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP_HEALTH'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR' AND Value = 1);

UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_TRADITION_HELP_HEALTH'
WHERE Type = 'POLICY_BRANCH_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP_HEALTH'
WHERE Type = 'POLICY_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_ORGANIZED_RELIGION_HELP_HEALTH'
WHERE Type = 'POLICY_ORGANIZED_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_TRADITION_HELP_HEALTH'
WHERE Type = 'POLICY_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

UPDATE Policies
SET NumCitiesFreeFoodBuilding = 0
WHERE Type = 'POLICY_TRADITION_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_UNIVERSAL_HEALTHCARE_HELP'
WHERE Type IN ('POLICY_UNIVERSAL_HEALTHCARE_A', 'POLICY_UNIVERSAL_HEALTHCARE_F', 'POLICY_UNIVERSAL_HEALTHCARE_O')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_HealthMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_HealthMods 
		(PolicyType, 					DiseasePopMod)
SELECT	Type, 							-22
FROM Policies WHERE Type IN ('POLICY_UNIVERSAL_HEALTHCARE_A', 'POLICY_UNIVERSAL_HEALTHCARE_F', 'POLICY_UNIVERSAL_HEALTHCARE_O')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuilding
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreeBuilding
		(PolicyType,					BuildingClassType,  Count)
SELECT	'POLICY_TRADITION_FINISHER',	BuildingClass,		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_JFD_CISTERN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType IN ('POLICY_UNIVERSAL_HEALTHCARE_A', 'POLICY_UNIVERSAL_HEALTHCARE_F', 'POLICY_UNIVERSAL_HEALTHCARE_O')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FaithPurchaseUnitClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					UnitClassType)
SELECT	'POLICY_PIETY_FINISHER',		'UNITCLASS_JFD_GREAT_DOCTOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FaithPurchaseUnitClasses
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldChanges WHERE YieldType = 'YIELD_CULTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 1);
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,					BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_ORGANIZED_RELIGION',	'BUILDINGCLASS_SHRINE',	'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,					BuildingClassType, 		YieldType,				YieldChange)
SELECT	'POLICY_ORGANIZED_RELIGION',	'BUILDINGCLASS_TEMPLE',	'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================