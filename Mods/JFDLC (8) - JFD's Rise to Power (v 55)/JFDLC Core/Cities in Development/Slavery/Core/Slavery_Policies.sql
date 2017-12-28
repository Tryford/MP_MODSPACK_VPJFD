--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP_SLAVERY'
WHERE Type = 'POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP_SLAVERY'
WHERE Type = 'POLICY_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER' AND Value = 1);

UPDATE Policies
SET AllowsBarbarianCampShackles = 1
WHERE Type = 'POLICY_HONOR_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================