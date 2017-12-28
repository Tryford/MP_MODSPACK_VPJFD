--==========================================================================================================================	
-- CONCEPTS
--==========================================================================================================================			
-- Concepts
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Concepts 
		(Type, 							Topic,					Description, 								Summary, 								AdvisorQuestion,			Advisor,	CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROSPERITY',		'TXT_KEY_TOPIC_GOLD',	'TXT_KEY_JFD_PROSPERITY_HEADING1_TITLE',	'TXT_KEY_JFD_PROSPERITY_HEADING1_BODY',	'TXT_KEY_GOLD_ADV_QUEST',	'ECONOMIC', 'HEADER_GOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
-- CITY EVENTS
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEvents
		(Type,							Description,										Help,										CityEventArt,				NumChoices,	RandomChance,	EventCooldown)
SELECT	'CITY_EVENT_JFD_MIGRATION',		'TXT_KEY_CITY_EVENT_JFD_MIGRATION_DESCRIPTION',		'TXT_KEY_CITY_EVENT_JFD_MIGRATION_HELP',	'Event_Migration.dds',		1,			-1,				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEvent_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEvent_ParentEvents
		(CityEventType,					CityEventChoiceType)
SELECT	'CITY_EVENT_JFD_MIGRATION',		'CITY_EVENT_JFD_MIGRATION_CHOICE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoices
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoices
		(Type,									Description,												Help)
SELECT	'CITY_EVENT_JFD_MIGRATION_CHOICE_1',	'TXT_KEY_CITY_EVENT_JFD_MIGRATION_DESCRIPTION_CHOICE_1',	'TXT_KEY_CITY_EVENT_JFD_MIGRATION_HELP_CHOICE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_InstantYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoice_InstantYield
		(CityEventChoiceType,					YieldType,						Yield)
SELECT	'CITY_EVENT_JFD_MIGRATION_CHOICE_3',	'YIELD_POPULATION',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO UnitClasses 	
		(Type)
VALUES	('UNITCLASS_JFD_NOTIFICATION');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,							ShowInPedia, 	Cost,	FaithCost,	Description, 					PortraitIndex,	IconAtlas)									
VALUES	('UNIT_JFD_PROSPERITY',	'UNITCLASS_JFD_NOTIFICATION',	0,				-1,		-1,			'TXT_KEY_UNIT_JFD_PROSPERITY',	0,				'JFD_PROSPERITY_NOTIFICATION_ATLAS');
--==========================================================================================================================
--==========================================================================================================================

