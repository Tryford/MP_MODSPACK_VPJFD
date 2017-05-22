--==========================================================================================================================
-- RESOLUTIONS
--==========================================================================================================================
-- Resolutions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resolutions 
		(Type,							UnitMaintenanceGoldPercent,	TechPrereqAnyMember,	Description,							Help,										VoterDecision,						ProposerDecision)
SELECT	'RESOLUTION_JFD_MERCENARIES',	-25,						'TECH_RIFLING',			'TXT_KEY_RESOLUTION_JFD_MERCENARIES',	'TXT_KEY_RESOLUTION_JFD_MERCENARIES_HELP',	'RESOLUTION_DECISION_YES_OR_NO',	'RESOLUTION_DECISION_NONE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_RESOLUTION_ADDITIONS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================