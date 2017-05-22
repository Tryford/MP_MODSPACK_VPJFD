--==========================================================================================================================
-- SOCIAL POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP_FM'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP'
WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);

UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP_CLAIMS'
WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP'
WHERE Type = 'POLICY_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_LIBERTY_HELP_FM'
WHERE Type = 'POLICY_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP'
WHERE Type = 'POLICY_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_PATRONAGE_HELP_CLAIMS'
WHERE Type = 'POLICY_PATRONAGE'
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
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
--Liberty Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks building the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a free Great Person of your choice near the [ICON_CAPITAL] Capital. It also allows the purchase of Great Magistrates with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks building the Forum Magnum.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a free Great Person of your choice near the [ICON_CAPITAL] Capital. It also allows the purchase of Great Magistrates with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

--Patronage Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause allied City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. It also allows the purchase of Great Dignitaries with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause allied City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. It will also increase the strength of your [ICON_JFD_CLAIM_MEDIUM] Claims. It also allows the purchase of Great Dignitaries with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================