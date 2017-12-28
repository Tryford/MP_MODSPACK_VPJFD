--==========================================================================================================================
-- RESOLUTIONS
--==========================================================================================================================
-- Resolutions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resolutions 
		(Type,						TechPrereqAnyMember,		Description,							Help,										VoterDecision,						ProposerDecision)
SELECT	'RESOLUTION_JFD_SLAVERY',	'TECH_INDUSTRIALIZATION',	'TXT_KEY_RESOLUTION_JFD_HUMAN_RIGHTS',	'TXT_KEY_RESOLUTION_JFD_HUMAN_RIGHTS_HELP',	'RESOLUTION_DECISION_YES_OR_NO',	'RESOLUTION_DECISION_NONE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================