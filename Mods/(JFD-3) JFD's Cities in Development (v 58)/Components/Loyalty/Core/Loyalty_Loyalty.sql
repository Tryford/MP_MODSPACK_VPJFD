--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_LOYALTY', IconString = '[ICON_JFD_BLUE_FIST]', ColorString = '[COLOR_LOYALTY_JFD_PATRIOTIC]'
WHERE Type = 'YIELD_JFD_LOYALTY';
--==========================================================================================================================	
-- LOYALTIES
--==========================================================================================================================			
-- JFD_Loyalties
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Loyalties
		(Type,						BuildingType,						RevoltRate,	Threshold,	WLTKDRate,	ShortDescription,								Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_SEPARATIST',	'BUILDING_JFD_LOYALTY_SEPARATIST',	2,			15,			-2,			'TXT_KEY_LOYALTY_JFD_SEPARATIST_SHORT_DESC',	'TXT_KEY_LOYALTY_JFD_SEPARATIST_DESC',	'TXT_KEY_LOYALTY_JFD_SEPARATIST_HELP',	'AS2D_EVENT_NOTIFICATION_VERY_BAD',		'NOTIFICATION_CITY_LOST',				'TXT_KEY_JFD_CITY_BECOMES_SEPARATIST_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_SEPARATIST_NOTIFICATION',			'[ICON_JFD_RED_FIST]',		'[COLOR_LOYALTY_JFD_SEPARATIST]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,						BuildingType,						RevoltRate,	Threshold,	WLTKDRate,	ShortDescription,								Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_REBELLIOUS',	'BUILDING_JFD_LOYALTY_REBELLIOUS',	1,			35,			-1,			'TXT_KEY_LOYALTY_JFD_REBELLIOUS_SHORT_DESC',	'TXT_KEY_LOYALTY_JFD_REBELLIOUS_DESC',	'TXT_KEY_LOYALTY_JFD_REBELLIOUS_HELP',	'AS2D_EVENT_NOTIFICATION_BAD',			'NOTIFICATION_CITY_LOST',				'TXT_KEY_JFD_CITY_BECOMES_REBELLIOUS_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_REBELLIOUS_NOTIFICATION',			'[ICON_JFD_YELLOW_FIST]',	'[COLOR_LOYALTY_JFD_REBELLIOUS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,						BuildingType,						RevoltRate,	Threshold,	WLTKDRate,	ShortDescription,								Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_NEUTRAL',		'BUILDING_JFD_LOYALTY_NEUTRAL',		0,			65,			0,			'TXT_KEY_LOYALTY_JFD_NEUTRAL_SHORT_DESC',		'TXT_KEY_LOYALTY_JFD_NEUTRAL_DESC',		'TXT_KEY_LOYALTY_JFD_NEUTRAL_HELP',		'AS2D_EVENT_NOTIFICATION_NEUTRAL',		'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_NEUTRAL_NOTIFICATION_SHORT',		'TXT_KEY_JFD_CITY_BECOMES_NEUTRAL_NOTIFICATION',			'[ICON_SILVER_FIST]',		'[COLOR_LOYALTY_JFD_NEUTRAL]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,						BuildingType,						RevoltRate,	Threshold,	WLTKDRate,	ShortDescription,								Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_ALLEGIANT',	'BUILDING_JFD_LOYALTY_ALLEGIANT',	-1,			85,			1,			'TXT_KEY_LOYALTY_JFD_ALLEGIANT_SHORT_DESC',		'TXT_KEY_LOYALTY_JFD_ALLEGIANT_DESC',	'TXT_KEY_LOYALTY_JFD_ALLEGIANT_HELP',	'AS2D_EVENT_NOTIFICATION_GOOD',			'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_ALLEGIANT_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_ALLEGIANT_NOTIFICATION_SHORT',	'[ICON_JFD_GREEN_FIST]',	'[COLOR_LOYALTY_JFD_ALLEGIANT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,						BuildingType,						RevoltRate,	Threshold,	WLTKDRate,	ShortDescription,								Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_PATRIOTIC',	'BUILDING_JFD_LOYALTY_PATRIOTIC',	-2,			100,		2,			'TXT_KEY_LOYALTY_JFD_PATRIOTIC_SHORT_DESC',		'TXT_KEY_LOYALTY_JFD_PATRIOTIC_DESC',	'TXT_KEY_LOYALTY_JFD_PATRIOTIC_HELP',	'AS2D_EVENT_NOTIFICATION_VERY_GOOD',	'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_PATRIOTIC_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_PATRIOTIC_NOTIFICATION_SHORT',	'[ICON_JFD_BLUE_FIST]',		'[COLOR_LOYALTY_JFD_PATRIOTIC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================