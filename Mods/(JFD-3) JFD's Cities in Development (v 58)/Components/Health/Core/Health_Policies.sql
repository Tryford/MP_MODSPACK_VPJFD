--==========================================================================================================================
-- SOCIAL POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP_HEALTH'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

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
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

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
-- Policy_FaithPurchaseUnitClasses
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
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
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
------------------------------------------------------------
-- Policy_JFD_CrimeMods
------------------------------------------------------------	
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_DECRIMINALIZATION_HELP_HEALTH'
WHERE Type = 'POLICY_JFD_DECRIMINALIZATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);

UPDATE Policy_JFD_CrimeMods
SET CrimeType = 'CRIME_JFD_HEALTH'
WHERE PolicyType = 'POLICY_JFD_DECRIMINALIZATION' AND CrimeType = 'CRIME_JFD_TOURISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
-- Piety Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] increases the [ICON_PEACE] Faith of empires.[NEWLINE][NEWLINE]Adopting Piety allows you to build Shrines and Temples in half the usual time. Unlocks building the Great Mosque of Djenne.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree causes a Great Prophet to appear and Holy Sites provide +3 [ICON_CULTURE] Culture. It also allows the purchase of Great Doctors with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

-- Tradition Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Tradition[ENDCOLOR] is best for small empires.[NEWLINE][NEWLINE]Adopting Tradition greatly increases the rate of border expansion in cities and also grants 3 culture Culture in the capital Capital. Unlocks building the Hanging Gardens.[NEWLINE][NEWLINE]Adopting all Policies in the Tradition tree will grant +15% [ICON_FOOD] Growth and a free Aqueduct or Cistern in your first 4 cities (up to 2 of each). It also allows the purchase of Great Engineers with peace Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================