--==========================================================================================================================
-- SOCIAL POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP' WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

UPDATE PolicyBranchTypes SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP_FM' WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

UPDATE PolicyBranchTypes SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP' WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);

UPDATE PolicyBranchTypes SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP_CLAIMS' WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP' WHERE Type = 'POLICY_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

UPDATE Policies SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP_FM' WHERE Type = 'POLICY_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

UPDATE Policies SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP' WHERE Type = 'POLICY_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);

UPDATE Policies SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP_CLAIMS' WHERE Type = 'POLICY_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_ClaimMods
		(PolicyType,					CauseChange)
SELECT	'POLICY_PATRONAGE_FINISHER',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FaithPurchaseUnitClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					UnitClassType)
SELECT	'POLICY_LIBERTY_FINISHER',		'UNITCLASS_JFD_GREAT_MAGISTRATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					UnitClassType)
SELECT	'POLICY_PATRONAGE_FINISHER',	'UNITCLASS_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================