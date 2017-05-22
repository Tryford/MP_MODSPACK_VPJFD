--==========================================================================================================================
-- CITY EVENTS
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEvents
		(Type,												Description,													Help,															CityEventArt,							CityEventAudio,							RequiresTribe,	MinimumCityPopulation,	NumChoices,	RandomChance,	RandomChanceDelta,	EventCooldown)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS',				'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION',			'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION',			'Event_RequestsRuler1.dds',				'AS2D_EVENT_JFD_FANFARE_HEAVY',			1,				5,						3,			20,				1,					20);
--------------------------------------------------------------------------------------------------------------------------
-- CityEvent_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEvent_ParentEvents
		(CityEventType,										CityEventChoiceType)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS',				'CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1'),			
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS',				'CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2'),			
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS',				'CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3');
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoices
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEventChoices
		(Type,													EventChoiceAudio,				EraScaling,		Expires,	IsBenefitsCapital,	EventDuration,	Description,														Help,															DisabledTooltip)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1',			'AS2D_EVENT_CHOICE',			0,				0,			0,					30,				'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION_CHOICE_1',	'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_HELP_CHOICE_1',		NULL),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2',			'AS2D_EVENT_CHOICE',			0,				0,			0,					30,				'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION_CHOICE_2',	'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_HELP_CHOICE_2',		NULL),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3',			'AS2D_EVENT_CHOICE',			1,				0,			0,					30,				'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION_CHOICE_3',	'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_HELP_CHOICE_3',		NULL);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_InstantYield
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO CityEventChoice_InstantYield
		(CityEventChoiceType,									YieldType,						Yield)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3',			'YIELD_GOLDEN_AGE_POINTS',		200);		
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoiceFlavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEventChoiceFlavors
		(CityEventChoiceType,									FlavorType,						Flavor)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1',			'FLAVOR_GROWTH',				10),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2',			'FLAVOR_GROWTH',				5),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3',			'FLAVOR_HAPPINESS',				10);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_Notification
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoice_Notification
		(CityEventChoiceType,									NotificationType,						Description,															ShortDescription,										IsWorldEvent,	NeedCityCoordinates)
VALUES	('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1',			'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1',		'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION',	0,				0),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2',			'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2',		'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION',	0,				0),
		('CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3',			'NOTIFICATION_EVENT_CHOICE_CITY_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2',		'TXT_KEY_CITY_EVENT_JFD_TRIBES_POOR_CROPS_DESCRIPTION',	0,				0);
--==========================================================================================================================
--==========================================================================================================================
