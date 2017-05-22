--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Beliefs
		(Type,						Description,							ShortDescription,							Pantheon)
SELECT	'BELIEF_JFD_GOD_WAR',		'TXT_KEY_BELIEF_JFD_GOD_WAR_DESC',		'TXT_KEY_BELIEF_JFD_GOD_WAR_SHORT_DESC',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_HUMAN_SACRIFICES_SHORT_DESC'
WHERE Type = 'BELIEF_GOD_WAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Belief_JFD_SlaveryMods
		(BeliefType,				CivilianCaptureMod,		EncampmentMod)
SELECT	'BELIEF_JFD_GOD_WAR',		50,						50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================