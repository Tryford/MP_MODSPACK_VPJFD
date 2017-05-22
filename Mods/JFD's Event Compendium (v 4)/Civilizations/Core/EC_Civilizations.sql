--==========================================================================================================================
-- EVENTS
--==========================================================================================================================
-- Events
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Events
		(Type,														EventClass,					Description,														Help,														EventArt,					EventAudio,							EventCooldown,	NumChoices,	RandomChance,	RandomChanceDelta,	RequiresWar,	IsOneShot,		RequiredEra)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS',				'EVENT_CLASS_NEUTRAL',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_DESCRIPTION',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_HELP',	'Event_UKConnections.dds',	'AS2D_EVENT_JFD_GENERIC_EVENT',		0,				2,			10,				0,					1,				1,				'ERA_MEDIEVAL'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN',						'EVENT_CLASS_NEUTRAL',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_DESCRIPTION',			'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_HELP',			'Event_UKCousin.dds',		'AS2D_EVENT_JFD_GENERIC_EVENT',		50,				2,			10,				0,					0,				0,				'ERA_MEDIEVAL');
--------------------------------------------------------------------------------------------------------------------------
-- EventChoices
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoices
		(Type,														EventDuration,		CapitalEffectOnly,	ResistanceCounter,	WLTKDTurns,		EraScaling,	 EventChoiceAudio,		Description,																	Help)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',		30,					0,					0,					5,				1,			 'AS2D_EVENT_CHOICE',	'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_DESCRIPTION_CHOICE_1',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1_HELP'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',		30,					0,					0,					0,				1,			 'AS2D_EVENT_CHOICE',	'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_DESCRIPTION_CHOICE_2',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2_HELP'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1',			30,					0,					10,					0,				1,			 'AS2D_EVENT_CHOICE',	'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_DESCRIPTION_CHOICE_1',				'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1_HELP'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',			30,					1,					0,					15,				1,			 'AS2D_EVENT_CHOICE',	'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_DESCRIPTION_CHOICE_2',				'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Event_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Event_ParentEvents
		(EventType,													EventChoiceType)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS',				'PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1'),		
		('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS',				'PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN',						'PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1'),		
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN',						'PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2');
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_MinimumStartYield
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO EventChoice_MinimumStartYield
		(EventChoiceType,													YieldType,						Yield)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',				'YIELD_CULTURE',				50),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',					'YIELD_GOLDEN_AGE_POINTS',		100);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_EventCostYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_EventCostYield
		(EventChoiceType,													YieldType,						Yield)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',				'YIELD_CULTURE',				50),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',					'YIELD_GOLDEN_AGE_POINTS',		100);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_InstantYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_InstantYield
		(EventChoiceType,													YieldType,						Yield)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',				'YIELD_CULTURE',				33),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1',					'YIELD_GOLDEN_AGE_POINTS',		100);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoiceFlavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoiceFlavors
		(EventChoiceType,													FlavorType,						Flavor)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',				'FLAVOR_GROWTH',				20),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',				'FLAVOR_CULTURE',				20),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1',					'FLAVOR_HAPPINESS',				20),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',					'FLAVOR_GROWTH',				20);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_Notification
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_Notification
		(EventChoiceType,													NotificationType,					Description,																	ShortDescription,													IsWorldEvent)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',				'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_DESCRIPTION',		0),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',				'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',		'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_DESCRIPTION',		0),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1',					'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_1',			'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_DESCRIPTION',			0),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',					'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_CHOICE_2',			'TXT_KEY_PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN_DESCRIPTION',			0);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_WorldEvents
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_WorldEvents
		(EventChoiceType,													Description)
VALUES	('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_1',				'TXT_KEY_WORLD_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_1'),
		('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_CHOICE_2',				'TXT_KEY_WORLD_PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS_1');
--==========================================================================================================================
-- CITY EVENTS
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEvents
		(Type,																Description,																	Help,																	CityEventArt,					CityEventAudio,						NumChoices,	RandomChance,	RandomChanceDelta,	EventCooldown,  CapitalOnly,	IsOneShot,	HasAnyReligion,	RequiresAnyStateReligion,	CityHasPlayerMajorityReligion,	RequiredBuildingClass,				RequiredEra)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS',									'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_DESCRIPTION',							'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_HELP',							'Event_Bhutan.dds',				'AS2D_EVENT_JFD_GENERIC_EVENT',		2,			-1,				1,					50,				0,				0,			0,				0,							0,								NULL,								'ERA_MEDIEVAL'),
		('CITY_EVENT_JFD_BHUTAN_MONK',										'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_DESCRIPTION',								'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_HELP',								'Event_BhutanMonk.dds',			'AS2D_CONTRACT_BUDDHISM_ACTIVATE',	2,			-1,				1,					50,				1,				0,			0,				1,							0,								NULL,								'ERA_MEDIEVAL'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS',					'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_DESCRIPTION',			'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_HELP',			'Event_Hippodrome.dds',			'AS2D_EVENT_JFD_JOUSTING',			2,			-1,				1,					30,				0,				1,			0,				0,							0,								'BUILDINGCLASS_CIRCUS_MAXIMUS',		NULL),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT',					NULL,																			NULL,																	'Event_ReligiousDissent.dds',	'AS2D_EVENT_JFD_REBELS',			1,			-1,				2,					30,				0,				0,			1,				0,							1,								NULL,								NULL);
--------------------------------------------------------------------------------------------------------------------------
-- CityEvent_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEvent_ParentEvents
		(CityEventType,														CityEventChoiceType)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS',									'CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1'),		
		('CITY_EVENT_JFD_BHUTAN_MIGRANTS',									'CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2'),
		('CITY_EVENT_JFD_BHUTAN_MONK',										'CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1'),		
		('CITY_EVENT_JFD_BHUTAN_MONK',										'CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_2'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS',					'CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_1'),		
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS',					'CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT',					'CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT_CHOICE_1');
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoices
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoices
		(Type,																EventChoiceAudio,				EventDuration,	EraScaling,		PietyYield,	CityHappiness,	RandomBarbarianSpawn,	WLTKDTurns,		Description,																		Help)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'AS2D_EVENT_CHOICE',			30,				1,				0,			0,				0,						0,				'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_DESCRIPTION_CHOICE_1',						'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1_HELP'),
		('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2',							'AS2D_EVENT_CHOICE',			30,				0,				0,			0,				0,						15,				'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_DESCRIPTION_CHOICE_2',						'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2_HELP'),
		('CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1',								'AS2D_EVENT_CHOICE',			30,				0,				0,			0,				0,						0,				'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_DESCRIPTION_CHOICE_1',							'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1_HELP'),
		('CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_2',								'AS2D_EVENT_CHOICE',			30,				1,				5,			0,				0,						0,				'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_DESCRIPTION_CHOICE_2',							'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_2_HELP'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_1',			'AS2D_EVENT_CHOICE',			30,				0,				0,			0,				0,						0,				'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_DESCRIPTION_CHOICE_1',		'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_1_HELP'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',			'AS2D_EVENT_CHOICE',			30,				0,				0,			2,				0,						0,				'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_DESCRIPTION_CHOICE_2',		'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2_HELP'),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT_CHOICE_1',			'AS2D_EVENT_CHOICE',			30,				0,				0,			0,				3,						0,				'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT_DESCRIPTION_CHOICE_1',		'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT_CHOICE_1_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_EventCostYield
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEventChoice_EventCostYield
		(CityEventChoiceType,												YieldType,						Yield)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'YIELD_CULTURE',				20),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',			'YIELD_GOLD',					400);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_MinimumStartYield
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEventChoice_MinimumStartYield
		(CityEventChoiceType,												YieldType,						Yield)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'YIELD_CULTURE',				30),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',			'YIELD_GOLD',					400);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_InstantYield
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEventChoice_InstantYield
		(CityEventChoiceType,												YieldType,						Yield)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'YIELD_POPULATION',				1);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_FreeUnits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO EventChoice_FreeUnits
		(EventChoiceType,													UnitType,						Quantity)
SELECT	'CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1',								Type,							1
FROM Units WHERE Type = 'UNIT_DECISIONS_JFD_BHUTAN_MONK'; 
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoiceFlavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoiceFlavors
		(CityEventChoiceType,												FlavorType,						Flavor)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'FLAVOR_GROWTH',				20),
		('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2',							'FLAVOR_CULTURE',				20),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_1',			'FLAVOR_GOLD',					20),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',			'FLAVOR_HAPPINESS',				20);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_Notification
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoice_Notification
		(CityEventChoiceType,												NotificationType,						Description,																		ShortDescription,														NeedCityCoordinates)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',						'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_DESCRIPTION',					1),
		('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2',							'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2',						'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MIGRANTS_DESCRIPTION',					1),
		('CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1',								'NOTIFICATION_EVENT_CHOICE_FIN',		'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1',							'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_DESCRIPTION',						0),
		('CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_2',								'NOTIFICATION_EVENT_CHOICE_FIN',		'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_2',							'TXT_KEY_CITY_EVENT_JFD_BHUTAN_MONK_DESCRIPTION',						0),
		('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',			'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_CHOICE_2',		'TXT_KEY_CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS_DESCRIPTION',	1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_WorldEvents
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoice_WorldEvents
		(CityEventChoiceType,												Description)
VALUES	('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_1',							'TXT_KEY_WORLD_PLAYER_EVENT_JFD_EPITHETS_BHUTAN_MIGRANTS_1'),
		('CITY_EVENT_JFD_BHUTAN_MIGRANTS_CHOICE_2',							'TXT_KEY_WORLD_PLAYER_EVENT_JFD_EPITHETS_BHUTAN_MIGRANTS_2');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------	
--Bhutan
UPDATE CityEvents
SET RequiredCiv = 'CIVILIZATION_JFD_BHUTAN', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
WHERE Type IN ('CITY_EVENT_JFD_BHUTAN_MIGRANTS')
AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_BHUTAN');

--Rome (Constantine)
UPDATE CityEvents
SET RequiredCiv = 'CIVILIZATION_JFD_ROME_CONSTANTINE', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
WHERE Type IN ('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS', 'CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT')
AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_ROME_CONSTANTINE');

--UK (George V)
UPDATE CityEvents
SET RequiredCiv = 'CIVILIZATION_JFD_GE_UNITED_KINGDOM', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
WHERE Type IN ('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS', 'PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN')
AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GE_UNITED_KINGDOM');

CREATE TRIGGER JFDEC_Civilizatons
AFTER INSERT ON Civilizations 
WHEN NEW.Type IN ('CIVILIZATION_JFD_BHUTAN', 'CIVILIZATION_JFD_ROME_CONSTANTINE', 'CIVILIZATION_JFD_GE_UNITED_KINGDOM')
BEGIN
	--Bhutan
	UPDATE CityEvents
	SET RequiredCiv = 'CIVILIZATION_JFD_BHUTAN', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
	WHERE Type IN ('CITY_EVENT_JFD_BHUTAN_MIGRANTS')
	AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_BHUTAN');

	--Rome (Constantine)
	UPDATE CityEvents
	SET RequiredCiv = 'CIVILIZATION_JFD_ROME_CONSTANTINE', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
	WHERE Type IN ('CITY_EVENT_JFD_ROME_CONSTANTINE_CIRCUS_MAXIMUS', 'CITY_EVENT_JFD_ROME_CONSTANTINE_PAGAN_DISSENT')
	AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_ROME_CONSTANTINE');

	--UK (George V)
	UPDATE CityEvents
	SET RequiredCiv = 'CIVILIZATION_JFD_GE_UNITED_KINGDOM', RandomChance = 20, EventClass = 'EVENT_CLASS_CIV_SPECIFIC'
	WHERE Type IN ('PLAYER_EVENT_JFD_UK_GEORGE_V_CONNECTIONS', 'PLAYER_EVENT_JFD_UK_GEORGE_V_COUSIN')
	AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GE_UNITED_KINGDOM');
END;
--==========================================================================================================================
--==========================================================================================================================