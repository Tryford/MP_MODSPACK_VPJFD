--==========================================================================================================================
-- RESOLUTIONS
--==========================================================================================================================
-- Resolutions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resolutions 
		(Type,								ScienceyGreatPersonRateMod,	TechPrereqAnyMember,		Description,								Help,											VoterDecision,						ProposerDecision)
SELECT	'RESOLUTION_JFD_SECULARIZATION',	15,							'TECH_SCIENTIFIC_THEORY',	'TXT_KEY_RESOLUTION_JFD_SECULARIZATION',	'TXT_KEY_RESOLUTION_JFD_SECULARIZATION_HELP',	'RESOLUTION_DECISION_YES_OR_NO',	'RESOLUTION_DECISION_NONE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RESOLUTION_ADDITIONS_SECULARIZATION' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================