--==========================================================================================================================	
-- LOYALTIES
--==========================================================================================================================			
-- JFD_Loyalties
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Loyalties
		(Type,								RevoltRate,		Threshold,	WLTKDRate,	ShortDescription,									Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_SEPARATIST',			100,			15,			-100,		'TXT_KEY_LOYALTY_JFD_SEPARATIST_SHORT_DESC',		'TXT_KEY_LOYALTY_JFD_SEPARATIST_DESC',	'TXT_KEY_LOYALTY_JFD_SEPARATIST_HELP',	'AS2D_EVENT_NOTIFICATION_VERY_BAD',		'NOTIFICATION_CITY_LOST',				'TXT_KEY_JFD_CITY_BECOMES_SEPARATIST_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_SEPARATIST_NOTIFICATION',			'[ICON_JFD_RED_FIST]',		'[COLOR_LOYALTY_JFD_SEPARATIST]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,								RevoltRate,		Threshold,	WLTKDRate,	ShortDescription,									Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_REBELLIOUS',			50,				35,			-50,		'TXT_KEY_LOYALTY_JFD_REBELLIOUS_SHORT_DESC',		'TXT_KEY_LOYALTY_JFD_REBELLIOUS_DESC',	'TXT_KEY_LOYALTY_JFD_REBELLIOUS_HELP',	'AS2D_EVENT_NOTIFICATION_BAD',			'NOTIFICATION_CITY_LOST',				'TXT_KEY_JFD_CITY_BECOMES_REBELLIOUS_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_REBELLIOUS_NOTIFICATION',			'[ICON_JFD_YELLOW_FIST]',	'[COLOR_LOYALTY_JFD_REBELLIOUS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,								RevoltRate,		Threshold,	WLTKDRate,	ShortDescription,									Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_NEUTRAL',				0,				65,			0,			'TXT_KEY_LOYALTY_JFD_NEUTRAL_SHORT_DESC',			'TXT_KEY_LOYALTY_JFD_NEUTRAL_DESC',		'TXT_KEY_LOYALTY_JFD_NEUTRAL_HELP',		'AS2D_EVENT_NOTIFICATION_NEUTRAL',		'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_NEUTRAL_NOTIFICATION_SHORT',		'TXT_KEY_JFD_CITY_BECOMES_NEUTRAL_NOTIFICATION',			'[ICON_SILVER_FIST]',		'[COLOR_LOYALTY_JFD_NEUTRAL]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,								RevoltRate,		Threshold,	WLTKDRate,	ShortDescription,									Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_ALLEGIANT',			-50,			85,			50,			'TXT_KEY_LOYALTY_JFD_ALLEGIANT_SHORT_DESC',			'TXT_KEY_LOYALTY_JFD_ALLEGIANT_DESC',	'TXT_KEY_LOYALTY_JFD_ALLEGIANT_HELP',	'AS2D_EVENT_NOTIFICATION_GOOD',			'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_ALLEGIANT_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_ALLEGIANT_NOTIFICATION_SHORT',	'[ICON_JFD_GREEN_FIST]',	'[COLOR_LOYALTY_JFD_ALLEGIANT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Loyalties
		(Type,								RevoltRate,		Threshold,	WLTKDRate,	ShortDescription,									Description,							Help,									SoundEffect,							NotificationType,						NotificationShortDesc,										NotificationDesc,											IconString,					TextColour)
SELECT	'LOYALTY_JFD_PATRIOTIC',			-100,			100,		100,		'TXT_KEY_LOYALTY_JFD_PATRIOTIC_SHORT_DESC',			'TXT_KEY_LOYALTY_JFD_PATRIOTIC_DESC',	'TXT_KEY_LOYALTY_JFD_PATRIOTIC_HELP',	'AS2D_EVENT_NOTIFICATION_VERY_GOOD',	'NOTIFICATION_CAPITAL_RECOVERED',		'TXT_KEY_JFD_CITY_BECOMES_PATRIOTIC_NOTIFICATION_SHORT',	'TXT_KEY_JFD_CITY_BECOMES_PATRIOTIC_NOTIFICATION_SHORT',	'[ICON_JFD_BLUE_FIST]',		'[COLOR_LOYALTY_JFD_PATRIOTIC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- JFD_Loyalty_CrimeMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_PATRIOTIC',			'CRIME_JFD_GAP',		-50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_PATRIOTIC',			'CRIME_JFD_HAPPINESS',	-50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_ALLEGIANT',			'CRIME_JFD_GAP',		-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_ALLEGIANT',			'CRIME_JFD_HAPPINESS',	-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_REBELLIOUS',			'CRIME_JFD_GAP',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_REBELLIOUS',			'CRIME_JFD_HAPPINESS',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_SEPARATIST',			'CRIME_JFD_GAP',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Loyalty_CrimeMods
		(LoyaltyType,						CrimeType,				CrimeMod)
SELECT	'LOYALTY_JFD_SEPARATIST',			'CRIME_JFD_HAPPINESS',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================