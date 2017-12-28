--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================			
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	Visible,		Description, 						Help, 									  DisabledHelp, 									 EntityEventType,			 IconAtlas,							IconIndex)
SELECT  'MISSION_JFD_JOIN_COUNCIL', 	25,		199,			1,				'TXT_KEY_MISSION_JFD_JOIN_COUNCIL', 'TXT_KEY_MISSION_JFD_JOIN_COUNCIL_HELP',  'TXT_KEY_MISSION_JFD_JOIN_COUNCIL_DISABLED_HELP',  'ENTITY_EVENT_GREAT_EVENT', 'JFD_SOVEREIGNTY_MISSION_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Mission_Conditions 
		(MissionType,					RequiresCity,	RequiresGovernment,		RequiresUnitFullHP)
SELECT	'MISSION_JFD_JOIN_COUNCIL',		1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================	
-- REMAPPER
--==========================================================================================================================	
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Missions ORDER BY ID;
UPDATE Missions SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Missions.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
--==========================================================================================================================