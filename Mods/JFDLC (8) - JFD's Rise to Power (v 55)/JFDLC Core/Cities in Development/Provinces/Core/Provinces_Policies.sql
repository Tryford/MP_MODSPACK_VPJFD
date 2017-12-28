--==========================================================================================================================
-- SOCIAL POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_COMMERCE_HELP'
WHERE Type = 'POLICY_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_COMMERCE_HELP'
WHERE Type = 'POLICY_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_FREE_THOUGHT_HELP'
WHERE Type = 'POLICY_FREE_THOUGHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MOBILIZATION_HELP', NumExtraLevies = 1, UnitPurchaseCostModifier = 0
WHERE Type = 'POLICY_MOBILIZATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_POLICY_CHANGES_MOBILIZATION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges	
		(ImprovementType,				PolicyType, YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_TRADING_POST',	PolicyType, YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,				PolicyType, YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_TOWN',			PolicyType, YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,				PolicyType, YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_VILLAGE',		PolicyType, YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
