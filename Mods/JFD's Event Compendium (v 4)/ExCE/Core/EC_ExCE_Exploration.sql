--==========================================================================================================================
-- EVENTS
--==========================================================================================================================
-- Events
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Events
		(Type,											Description,													Help,													EventArt,				EventAudio,					NumChoices,	RandomChance,	RandomChanceDelta,	EventCooldown,	RequiredEra)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER',		'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_DESCRIPTION',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_HELP',	'Event_Venturer.dds',	'AS2D_EVENT_JFD_FANFARE',	2,			10,				0,					50,				'ERA_MEDIEVAL');
--------------------------------------------------------------------------------------------------------------------------
-- EventChoices
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoices
		(Type,												EraScaling,	 EventDuration,	EventChoiceAudio,						Description,															Help)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_1',	0,			 30,			NULL,									'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_DESCRIPTION_CHOICE_1',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_HELP_CHOICE_1'),
		('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	1,			 30,			'AS2D_INTERFACE_CITY_SCREEN_PURCHASE',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_DESCRIPTION_CHOICE_2',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Event_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Event_ParentEvents
		(EventType,											EventChoiceType)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER',			'PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_1'),		
		('PLAYER_EVENT_JFD_EXPLORATION_VENTURER',			'PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2');
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_EventCostYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_EventCostYield
		(EventChoiceType,									YieldType,		Yield)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	'YIELD_GOLD',	250);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_MinimumStartYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_MinimumStartYield
		(EventChoiceType,									YieldType,		Yield)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	'YIELD_GOLD',	250);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoiceFlavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoiceFlavors
		(EventChoiceType,									FlavorType,		Flavor)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	'FLAVOR_RECON',	5);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_Notification
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO EventChoice_Notification
		(EventChoiceType,									NotificationType,					Description,															ShortDescription,												IsWorldEvent)
VALUES	('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_1',	'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_1',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_DESCRIPTION',	0),
		('PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	'NOTIFICATION_EVENT_CHOICE_FIN',	'TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2',	'TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_DESCRIPTION',	0);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 		 PediaEntry)
VALUES	('PROMOTION_EVENTS_JFD_VENTURER', 	'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER',	'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER_HELP',	'AS2D_IF_LEVELUP',	NULL,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_SHARED',	 'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitPromotions_YieldFromScouting
		(PromotionType,						YieldType,		Yield)
VALUES	('PROMOTION_EVENTS_JFD_VENTURER',	'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================
