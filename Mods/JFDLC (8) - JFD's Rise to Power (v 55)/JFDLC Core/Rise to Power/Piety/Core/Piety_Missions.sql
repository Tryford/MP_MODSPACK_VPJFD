--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================	
-- Missions 
------------------------------	
INSERT INTO Missions	
		(Type, 									ResourceType,				ResourceCount,	Description, 									Help, 												DisabledHelp, 											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, EntityEventType,			IconAtlas)
SELECT	'MISSION_JFD_CLERICS', 					'RESOURCE_JFD_CLERICS',		2,				'TXT_KEY_MISSION_JFD_CLERICS', 					'TXT_KEY_MISSION_JFD_CLERICS_HELP',					'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_DISABLED',			'KB_U',		2,				150,			1,		 0,			'ENTITY_EVENT_GREAT_EVENT',	'JFD_PIETY_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);

INSERT INTO Missions
		(Type,									ResourceType,				ResourceCount,	Description, 									Help,												DisabledHelp,											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, EntityEventType,			IconAtlas)
SELECT	'MISSION_JFD_CONVERT_GREAT_GENERAL',	NULL,						0,				'TXT_KEY_MISSION_JFD_CONVERT_GREAT_GENERAL',	'TXT_KEY_MISSION_JFD_CONVERT_GREAT_GENERAL_HELP',	'TXT_KEY_MISSION_JFD_CONVERT_GREAT_GENERAL_DISABLED',	'KB_U',		2,				150,			1,		 51,		'ENTITY_EVENT_GREAT_EVENT',	'UNIT_ACTION_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Missions
		(Type,									ResourceType,				ResourceCount,	Description, 									Help,												DisabledHelp,											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, EntityEventType,			IconAtlas)
SELECT	'MISSION_JFD_DECLARE_REPENTANCE',		NULL,						0,				'TXT_KEY_MISSION_JFD_DECLARE_REPENTANCE',		'TXT_KEY_MISSION_JFD_DECLARE_REPENTANCE_HELP',		'TXT_KEY_MISSION_JFD_DECLARE_REPENTANCE_DISABLED',		'KB_U',		2,				150,			1,		 0,		    'ENTITY_EVENT_GREAT_EVENT',	'JFD_PIETY_MISSION_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Missions
		(Type,									ResourceType,				ResourceCount,	Description, 									Help,												DisabledHelp,											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, EntityEventType,			IconAtlas)
SELECT	'MISSION_JFD_START_REFORMATION',		NULL,						0,				'TXT_KEY_MISSION_JFD_START_REFORMATION',		'TXT_KEY_MISSION_JFD_START_REFORMATION_HELP',		'TXT_KEY_MISSION_JFD_START_REFORMATION_DISABLED',		'KB_U',		2,				150,			1,		 2,		    'ENTITY_EVENT_GREAT_EVENT',	'UNIT_ACTION_ATLAS_RELIGION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Mission_Conditions 
		(MissionType,							RequiresHolyCity,	RequiresStateReligion,	RequiresUnitFullHP,		RequiresCity)
SELECT	'MISSION_JFD_CONVERT_GREAT_GENERAL',	0,					0,						1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Mission_Conditions 
		(MissionType,							RequiresHolyCity,	RequiresStateReligion,	RequiresUnitFullHP,		RequiresCity)
SELECT	'MISSION_JFD_DECLARE_REPENTANCE',		1,					1,						1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Mission_Conditions 
		(MissionType,							RequiresHolyCity,	RequiresStateReligion,	RequiresUnitFullHP,		RequiresNotPolicyType,			RequiresEnhancedReligionToBeVisible)
SELECT	'MISSION_JFD_START_REFORMATION',		1,					0,						1,						'POLICY_JFD_REFORMATION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================