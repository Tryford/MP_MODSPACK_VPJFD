
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_RELIGIOUS_SETTLEMENTS_DESC', PlotCultureCostModifier = 0
WHERE Type = 'BELIEF_RELIGIOUS_SETTLEMENTS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_BELIEF_CHANGES_RELIGIOUS_SETTLEMENTS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType,						ImprovementType,	YieldType,			Yield)
SELECT	'BELIEF_RELIGIOUS_SETTLEMENTS',		Type,				'YIELD_FAITH',		1
FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_TRADING_POST', 'IMPROVEMENT_JFD_VILLAGE', 'IMPROVEMENT_JFD_TOWN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_BELIEF_CHANGES_RELIGIOUS_SETTLEMENTS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================