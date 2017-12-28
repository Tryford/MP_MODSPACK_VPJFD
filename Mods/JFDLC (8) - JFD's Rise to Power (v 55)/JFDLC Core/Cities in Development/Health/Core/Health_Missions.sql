--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================	
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	EntityEventType,				Visible,	Description, 						Help, 									DisabledHelp, 									EntityEventType,				IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_CURE_PLAGUE', 		20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_CURE_PLAGUE', 	'TXT_KEY_MISSION_JFD_CURE_PLAGUE_HELP',	'TXT_KEY_MISSION_JFD_CURE_PLAGUE_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',		'JFD_HEALTH_MISSION_ATLAS_1',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	EntityEventType,				Visible,	Description, 						Help, 									DisabledHelp, 									EntityEventType,				IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_POPULATION', 		20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_POPULATION', 	'TXT_KEY_MISSION_JFD_POPULATION_HELP',	'TXT_KEY_MISSION_JFD_POPULATION_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',		'JFD_HEALTH_MISSION_ATLAS_2',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Mission_Conditions 
		(MissionType,		RequiresCity,	RequiresUnitFullHP)
SELECT	Type,				1,				1
FROM Missions WHERE Type IN ('MISSION_JFD_CURE_PLAGUE', 'MISSION_JFD_POPULATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================