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
SET Help = 'TXT_KEY_POLICY_JFD_MOBILIZATION_HELP', JFD_NumExtraLevies = 1, UnitPurchaseCostModifier = 0
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
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
--Commerce Finisher
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Commerce[ENDCOLOR] provides bonuses to empires focused on [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adopting Commerce will boost [ICON_GOLD] Gold output in capital Capital City by 25%. Unlocks building Big Ben.[NEWLINE][NEWLINE]Adopting all Policies in the Commerce tree will grant +1 [ICON_GOLD] Gold from every Trading Post, Village, and Town. It also allows the purchase of Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
