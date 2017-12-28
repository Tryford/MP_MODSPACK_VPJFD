--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- JFD_Epithets
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,									Description,									Help,											PolicyType)
SELECT	'EPITHET_JFD_AMIR_AL_MUMININ',		1,			'TXT_KEY_EPITHET_JFD_AMIR_AL_MUMININ_SHORT_DESC',	'TXT_KEY_EPITHET_JFD_AMIR_AL_MUMININ_DESC',		'TXT_KEY_EPITHET_JFD_AMIR_AL_MUMININ_HELP',		'POLICY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,									Description,									Help,											PolicyType)
SELECT	'EPITHET_JFD_CONQUERING_LION',		1,			'TXT_KEY_EPITHET_JFD_CONQUERING_LION_SHORT_DESC',	'TXT_KEY_EPITHET_JFD_CONQUERING_LION_DESC',		'TXT_KEY_EPITHET_JFD_CONQUERING_LION_HELP',		'POLICY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
