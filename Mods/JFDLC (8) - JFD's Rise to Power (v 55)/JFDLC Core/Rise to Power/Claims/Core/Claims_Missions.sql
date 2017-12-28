--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							ResourceType,					ResourceCount,	Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_ASSIMILATE_CITY',	NULL,							0,				20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY', 		'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_HELP',		'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_CLAIMS_MISSION_ATLAS_1',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Missions	
		(Type, 							ResourceType,					ResourceCount,	Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_DIGNITARIES', 		'RESOURCE_JFD_DIGNITARIES',		2,				20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_DIGNITARIES', 			'TXT_KEY_MISSION_JFD_DIGNITARIES_HELP',			'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_CLAIMS_UNIT_ATLAS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Missions	
		(Type, 							ResourceType,					ResourceCount,	Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_MAGISTRATES', 		'RESOURCE_MAGISTRATES',			2,				20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_MAGISTRATES', 			'TXT_KEY_MISSION_JFD_MAGISTRATES_HELP',			'TXT_KEY_MISSION_JFD_ASSIMILATE_CITY_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_CLAIMS_UNIT_ATLAS',		0
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

-- INSERT INTO Missions	
		-- (Type, 							Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
-- SELECT	'MISSION_JFD_RECLAIM_CITY', 	20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_RECLAIM_CITY', 		'TXT_KEY_MISSION_JFD_RECLAIM_CITY_HELP',		'TXT_KEY_MISSION_JFD_RECLAIM_CITY_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_CLAIMS_MISSION_ATLAS_2',	0
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--UPDATE Missions
--SET Help = 'TXT_KEY_MISSION_JFD_CONDUCT_TRADE_MISSION_HELP'
--WHERE Type = 'MISSION_TRADE'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Mission_Conditions 
		(MissionType,		RequiresCity,	RequiresUnitFullHP)
SELECT	Type,				1,				1
FROM Missions WHERE Type IN ('MISSION_JFD_DIGNITARIES', 'MISSION_JFD_MAGISTRATES', 'MISSION_JFD_ASSIMILATE_CITY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================