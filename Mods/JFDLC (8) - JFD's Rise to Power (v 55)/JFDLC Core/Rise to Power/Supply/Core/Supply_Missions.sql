--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 						ResourceType,				ResourceCount,	Time,	OrderPriority,	EntityEventType,				Visible,	Description, 						Help, 									DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_CAPTAINS', 	'RESOURCE_JFD_CAPTAINS',	2,				20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_CAPTAINS', 	'TXT_KEY_MISSION_JFD_CAPTAINS_HELP',	'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_SUPPLY_RESOURCE_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Mission_Conditions 
		(MissionType,		RequiresCity,	RequiresUnitFullHP)
SELECT	Type,				1,				1
FROM Missions WHERE Type IN ('MISSION_JFD_CAPTAINS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================