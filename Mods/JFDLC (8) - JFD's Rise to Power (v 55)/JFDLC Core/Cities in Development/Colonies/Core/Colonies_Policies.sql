--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_NAVIGATION_SCHOOL_HELP_COLONIES', GreatAdmiralRateModifier = 33
WHERE Type = 'POLICY_NAVIGATION_SCHOOL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_BuildingClassCultureChanges
SET BuildingClassType = 'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY'
WHERE PolicyType = 'POLICY_MERCHANT_NAVY' AND BuildingClassType = 'BUILDINGCLASS_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_BuildingClassYieldChanges
SET BuildingClassType = 'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY'
WHERE PolicyType = 'POLICY_MERCHANT_NAVY' AND BuildingClassType = 'BUILDINGCLASS_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreePromotions
		(PolicyType,				PromotionType,				UnitClassType)
SELECT	'POLICY_NAVIGATION_SCHOOL', 'PROMOTION_FAST_ADMIRAL',	'UNITCLASS_JFD_COLONIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeUnitClasses
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_FreeUnitClasses WHERE PolicyType = 'POLICY_NAVIGATION_SCHOOL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitClassProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_UnitClassProductionModifiers
		(PolicyType,				ProductionModifier,			UnitClassType)
SELECT	'POLICY_NAVIGATION_SCHOOL', 33,							'UNITCLASS_JFD_COLONIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================