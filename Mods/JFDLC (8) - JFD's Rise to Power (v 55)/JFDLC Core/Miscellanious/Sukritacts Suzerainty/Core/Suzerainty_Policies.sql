--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET ExtraHappinessPerLuxury = 2
WHERE Type = 'POLICY_MINOR_CIV_SUK_ORMUS';
------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldChangeWorldWonder
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_YieldChangeWorldWonder
SET Yield = 1
WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_ISANAPURA' AND YieldType = 'YIELD_FOOD';
------------------------------------------------------------------------------------------------------------------------
-- Policy_ArtYieldChanges
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_ArtYieldChanges
SET Yield = 1
WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_NOK' AND YieldType IN ('YIELD_FOOD', 'YIELD_PRODUCTION');
------------------------------------------------------------------------------------------------------------------------
-- Policy_ArtifactYieldChanges
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_ArtifactYieldChanges
SET Yield = 1
WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_NOK' AND YieldType IN ('YIELD_FOOD', 'YIELD_PRODUCTION');
------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,	SpecialistType,				YieldType, Yield)
SELECT	 PolicyType,	'SPECILIAST_JFD_DIRECTOR',	YieldType, Yield
FROM Policy_ResourceYieldChanges WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_AVA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_CapitalYieldPerPopChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_CapitalYieldPerPopChanges
SET PolicyType = 'POLICY_MINOR_CIV_SUK_VARANASI'
WHERE PolicyType = 'MINOR_CIV_SUK_VARANASI';
--==========================================================================================================================
--==========================================================================================================================