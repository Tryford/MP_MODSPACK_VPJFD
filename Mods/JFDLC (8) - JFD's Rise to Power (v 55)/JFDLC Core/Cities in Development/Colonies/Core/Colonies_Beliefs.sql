--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								Reformation,	MissionaryOnColony)
SELECT	'BELIEF_JFD_MISSION_COLONIES', 		'TXT_KEY_BELIEF_JFD_MISSION_COLONIES', 		'TXT_KEY_BELIEF_JFD_MISSION_COLONIES_SHORT', 	1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================