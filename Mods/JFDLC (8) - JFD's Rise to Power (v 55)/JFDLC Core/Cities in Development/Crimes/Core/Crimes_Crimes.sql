--==========================================================================================================================
-- CRIMES
--==========================================================================================================================
-- JFD_Crimes
------------------------------------------------------------
INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_CULTURE',	'TXT_KEY_CRIME_JFD_CULTURE_DESC',		'TXT_KEY_CULTURE_FROM_CRIME',		'CRIME_ORGANIZED_JFD_CULTURE',		'YIELD_CULTURE',			'[COLOR_MAGENTA]',				'[ICON_JFD_CRIME_CULTURE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_FAITH',		'TXT_KEY_CRIME_JFD_FAITH_DESC',			'TXT_KEY_FAITH_FROM_CRIME',			'CRIME_ORGANIZED_JFD_FAITH',		'YIELD_FAITH',				'[COLOR_WHITE]',				'[ICON_JFD_CRIME_FAITH]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_FOOD',		'TXT_KEY_CRIME_JFD_FOOD_DESC',			'TXT_KEY_FOOD_FROM_CRIME',			'CRIME_ORGANIZED_JFD_FOOD',			'YIELD_FOOD',				'[COLOR_YIELD_FOOD]',			'[ICON_JFD_CRIME_FOOD]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_GAP',		'TXT_KEY_CRIME_JFD_GAP_DESC',			'TXT_KEY_GAP_FROM_CRIME',			'CRIME_ORGANIZED_JFD_GAP',			'YIELD_GOLDEN_AGE_POINTS',	'[COLOR_GOLDEN_AGE]',			'[ICON_JFD_CRIME_PRESTIGE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_GOLD',		'TXT_KEY_CRIME_JFD_GOLD_DESC',			'TXT_KEY_GOLD_FROM_CRIME',			'CRIME_ORGANIZED_JFD_GOLD',			'YIELD_GOLD',				'[COLOR_YIELD_GOLD]',			'[ICON_JFD_CRIME_GOLD]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_HAPPINESS',	'TXT_KEY_CRIME_JFD_HAPPINESS_DESC',		'TXT_KEY_HAPPINESS_FROM_CRIME',		'CRIME_ORGANIZED_JFD_HAPPINESS',	'YIELD_HAPPINESS',			'[COLOR_UNHAPPINESS]',			'[ICON_JFD_CRIME_HAPPINESS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_HEALTH',		'TXT_KEY_CRIME_JFD_HEALTH_DESC',		'TXT_KEY_HEALTH_FROM_CRIME',		'CRIME_ORGANIZED_JFD_HEALTH',		'YIELD_JFD_HEALTH',			'[COLOR_JFD_HEALTH]',			'[ICON_JFD_CRIME_HEALTH]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_PRODUCTION',	'TXT_KEY_CRIME_JFD_PRODUCTION_DESC',	'TXT_KEY_PRODUCTION_FROM_CRIME',	'CRIME_ORGANIZED_JFD_PRODUCTION',	'YIELD_PRODUCTION',			'[COLOR_YIELD_PRODUCTION]',		'[ICON_JFD_CRIME_PRODUCTION]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_SCIENCE',	'TXT_KEY_CRIME_JFD_SCIENCE_DESC',		'TXT_KEY_SCIENCE_FROM_CRIME',		'CRIME_ORGANIZED_JFD_SCIENCE',		'YIELD_SCIENCE',			'[COLOR_RESEARCH_STORED]',		'[ICON_JFD_CRIME_SCIENCE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					Description,							Help,								OrganizedCrimeType,					YieldType,					TextColour,						IconString)
SELECT	'CRIME_JFD_TOURISM',	'TXT_KEY_CRIME_JFD_TOURISM_DESC',		'TXT_KEY_TOURISM_FROM_CRIME',		'CRIME_ORGANIZED_JFD_TOURISM',		'YIELD_TOURISM',			'[COLOR_LIGHT_GREY]',			'[ICON_JFD_CRIME_TOURISM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================



