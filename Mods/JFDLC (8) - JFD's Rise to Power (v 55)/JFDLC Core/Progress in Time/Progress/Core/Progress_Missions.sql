--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================	
-- Missions 
------------------------------	
INSERT INTO Missions
		(Type,								Description, 								Help,												DisabledHelp,											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, IconAtlas)
SELECT	'MISSION_JFD_HOST_FILM_FESTIVAL',	'TXT_KEY_MISSION_JFD_HOST_FILM_FESTIVAL',	'TXT_KEY_MISSION_JFD_HOST_FILM_FESTIVAL_HELP',		'TXT_KEY_MISSION_JFD_HOST_FILM_FESTIVAL_DISABLED',		'KB_U',		2,				150,			1,		 0,		   'JFD_PROGRESS_MISSION_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Missions
		(Type,								Description, 								Help,												DisabledHelp,											HotKey,		HotKeyPriority, OrderPriority,	Visible, IconIndex, IconAtlas)
SELECT	'MISSION_MULTIPLE_UPGRADE',			'TXT_KEY_COMMAND_UPGRADE',					'TXT_KEY_MISSION_MULTIPLE_UPGRADE_HELP',			'TXT_KEY_MISSION_MULTIPLE_UPGRADE_HELP_DISABLED',		'KB_U',		2,				150,			1,		 44,		'UNIT_ACTION_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================