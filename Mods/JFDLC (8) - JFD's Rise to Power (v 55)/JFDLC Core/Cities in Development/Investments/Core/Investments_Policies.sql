--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCANTILISM_HELP', InvestmentModifier = -15
WHERE Type = 'POLICY_MERCANTILISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_HurryModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_HurryModifiers WHERE PolicyType = 'POLICY_MERCANTILISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================