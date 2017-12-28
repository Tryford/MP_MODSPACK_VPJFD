--==========================================================================================================================
-- CRIMES
--==========================================================================================================================
-- JFD_OrganizedCrimes
------------------------------------------------------------
INSERT INTO JFD_OrganizedCrimes
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_CULTURE',		'TXT_KEY_CRIME_ORGANIZED_JFD_CULTURE_DESC',			'CRIME_JFD_CULTURE',		'YIELD_CULTURE',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_CULTURE_HELP',				'TXT_KEY_JFD_CULTURE_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);			
			
INSERT INTO JFD_OrganizedCrimes		
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_FAITH',		'TXT_KEY_CRIME_ORGANIZED_JFD_FAITH_DESC',			'CRIME_JFD_FAITH',			'YIELD_FAITH',				-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_FAITH_HELP',				'TXT_KEY_JFD_FAITH_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);			
		
INSERT INTO JFD_OrganizedCrimes			
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_FOOD',			'TXT_KEY_CRIME_ORGANIZED_JFD_FOOD_DESC',			'CRIME_JFD_FOOD',			'YIELD_FOOD',				-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_FOOD_HELP',				'TXT_KEY_JFD_FOOD_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);		
	
INSERT INTO JFD_OrganizedCrimes		
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_GAP',			'TXT_KEY_CRIME_ORGANIZED_JFD_GAP_DESC',				'CRIME_JFD_GAP',			'YIELD_GOLDEN_AGE_POINTS',	-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_GAP_HELP',					'TXT_KEY_JFD_GAP_EMERGES_NOTIFICATION',					'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);		
		
INSERT INTO JFD_OrganizedCrimes			
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_GOLD',			'TXT_KEY_CRIME_ORGANIZED_JFD_GOLD_DESC',			'CRIME_JFD_GOLD',			'YIELD_GOLD',				-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_GOLD_HELP',				'TXT_KEY_JFD_GOLD_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);		
			
INSERT INTO JFD_OrganizedCrimes			
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_HAPPINESS',	'TXT_KEY_CRIME_ORGANIZED_JFD_HAPPINESS_DESC',		'CRIME_JFD_HAPPINESS',		'YIELD_HAPPINESS',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_HAPPINESS_HELP',			'TXT_KEY_JFD_HAPPINESS_EMERGES_NOTIFICATION',			'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);			
			
INSERT INTO JFD_OrganizedCrimes			
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_HEALTH',		'TXT_KEY_CRIME_ORGANIZED_JFD_HEALTH_DESC',			'CRIME_JFD_HEALTH',			'YIELD_JFD_HEALTH',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_HEALTH_HELP',				'TXT_KEY_JFD_HEALTH_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);			
		
INSERT INTO JFD_OrganizedCrimes		
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_PRODUCTION',	'TXT_KEY_CRIME_ORGANIZED_JFD_PRODUCTION_DESC',		'CRIME_JFD_PRODUCTION',		'YIELD_PRODUCTION',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_PRODUCTION_HELP',			'TXT_KEY_JFD_PRODUCTION_EMERGES_NOTIFICATION',			'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);		
		
INSERT INTO JFD_OrganizedCrimes		
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_SCIENCE',		'TXT_KEY_CRIME_ORGANIZED_JFD_SCIENCE_DESC',			'CRIME_JFD_SCIENCE',		'YIELD_SCIENCE',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_SCIENCE_HELP',				'TXT_KEY_JFD_SCIENCE_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);		
		
INSERT INTO JFD_OrganizedCrimes		
		(Type,								Description,										CrimeType,					YieldType,					YieldMod,	Help,													NotificationDesc,										NotificationShortDesc)
SELECT	'CRIME_ORGANIZED_JFD_TOURISM',		'TXT_KEY_CRIME_ORGANIZED_JFD_TOURISM_DESC',			'CRIME_JFD_TOURISM',		'YIELD_TOURISM',			-10,		'TXT_KEY_CRIME_ORGANIZED_JFD_TOURISM_HELP',				'TXT_KEY_JFD_TOURISM_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================



