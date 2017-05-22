--==========================================================================================================================
-- CRIMES
--==========================================================================================================================
-- JFD_Crimes
------------------------------------------------------------
INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_CULTURE',	'BUILDING_CRIMES_JFD_CULTURE',		'TXT_KEY_CRIME_JFD_CULTURE_DESC',		'TXT_KEY_CULTURE_FROM_CRIME',		'YIELD_CULTURE',	'[ICON_JFD_CRIME_PURPLE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_DEFENSE',	'BUILDING_CRIMES_JFD_DEFENSE',		'TXT_KEY_CRIME_JFD_DEFENSE_DESC',		'TXT_KEY_DEFENSE_FROM_CRIME',		'YIELD_DEFENSE',	'[ICON_JFD_CRIME_GRAY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_FAITH',		'BUILDING_CRIMES_JFD_FAITH',		'TXT_KEY_CRIME_JFD_FAITH_DESC',			'TXT_KEY_FAITH_FROM_CRIME',			'YIELD_FAITH',		'[ICON_JFD_CRIME_WHITE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_FOOD',		'BUILDING_CRIMES_JFD_FOOD',			'TXT_KEY_CRIME_JFD_FOOD_DESC',			'TXT_KEY_FOOD_FROM_CRIME',			'YIELD_FOOD',		'[ICON_JFD_CRIME_GREEN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_GOLD',		'BUILDING_CRIMES_JFD_GOLD',			'TXT_KEY_CRIME_JFD_GOLD_DESC',			'TXT_KEY_GOLD_FROM_CRIME',			'YIELD_GOLD',		'[ICON_JFD_CRIME_YELLOW]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_HAPPINESS',	'BUILDING_CRIMES_JFD_HAPPINESS',	'TXT_KEY_CRIME_JFD_HAPPINESS_DESC',		'TXT_KEY_HAPPINESS_FROM_CRIME',		'YIELD_HAPPINESS',	'[ICON_JFD_CRIME_RED]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_HEALTH',		'BUILDING_CRIMES_JFD_HEALTH',		'TXT_KEY_CRIME_JFD_HEALTH_DESC',		'TXT_KEY_HEALTH_FROM_CRIME',		'YIELD_JFD_HEALTH',	'[ICON_JFD_CRIME_PINK]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_PRODUCTION',	'BUILDING_CRIMES_JFD_PRODUCTION',	'TXT_KEY_CRIME_JFD_PRODUCTION_DESC',	'TXT_KEY_PRODUCTION_FROM_CRIME',	'YIELD_PRODUCTION',	'[ICON_JFD_CRIME_ORANGE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_SCIENCE',	'BUILDING_CRIMES_JFD_SCIENCE',		'TXT_KEY_CRIME_JFD_SCIENCE_DESC',		'TXT_KEY_SCIENCE_FROM_CRIME',		'YIELD_SCIENCE',	'[ICON_JFD_CRIME_BLUE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Crimes
		(Type,					BuildingType,						Description,							Help,								YieldType,			IconString)
SELECT	'CRIME_JFD_TOURISM',	'BUILDING_CRIMES_JFD_TOURISM',		'TXT_KEY_CRIME_JFD_TOURISM_DESC',		'TXT_KEY_TOURISM_FROM_CRIME',		'YIELD_TOURISM',	'[ICON_JFD_CRIME_CYAN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------
-- JFD_OrganizedCrimes
------------------------------------------------------------
INSERT INTO JFD_OrganizedCrimes
		(Type,									BuildingType,							Description,										Help,												NotificationDesc,										NotificationShortDesc,											IconString,										CrimeIconString)
SELECT	'CRIME_ORGANIZED_JFD_ANARCHISTS',		'BUILDING_CRIMES_JFD_ANARCHISTS',		'TXT_KEY_CRIME_ORGANIZED_JFD_ANARCHISTS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_ANARCHISTS_HELP',		'TXT_KEY_JFD_ANARCHISTS_EMERGES_NOTIFICATION',			'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT',		'[ICON_JFD_ORGANIZED_CRIME_ANARCHISTS]',		'[ICON_JFD_CRIME_RED]+[ICON_JFD_CRIME_PURPLE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrimes
		(Type,									BuildingType,							Description,										Help,												NotificationDesc,										NotificationShortDesc,											IconString,										CrimeIconString)
SELECT	'CRIME_ORGANIZED_JFD_COUNTERFEITERS',	'BUILDING_CRIMES_JFD_COUNTERFEITERS',	'TXT_KEY_CRIME_ORGANIZED_JFD_COUNTERFEITERS_DESC',	'TXT_KEY_CRIME_ORGANIZED_JFD_COUNTERFEITERS_HELP',	'TXT_KEY_JFD_COUNTERFEITERS_EMERGES_NOTIFICATION',		'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT',		'[ICON_JFD_ORGANIZED_CRIME_COUNTERFEITERS]',	'[ICON_JFD_CRIME_WHITE]+[ICON_JFD_CRIME_BLUE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrimes
		(Type,									BuildingType,							Description,										Help,												NotificationDesc,										NotificationShortDesc,											IconString,										CrimeIconString)
SELECT	'CRIME_ORGANIZED_JFD_MAFIA',			'BUILDING_CRIMES_JFD_MAFIA',			'TXT_KEY_CRIME_ORGANIZED_JFD_MAFIA_DESC',			'TXT_KEY_CRIME_ORGANIZED_JFD_MAFIA_HELP',			'TXT_KEY_JFD_MAFIA_EMERGES_NOTIFICATION',				'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT',		'[ICON_JFD_ORGANIZED_CRIME_MAFIA]',				'[ICON_JFD_CRIME_YELLOW]+[ICON_JFD_CRIME_ORANGE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrimes
		(Type,									BuildingType,							Description,										Help,												NotificationDesc,										NotificationShortDesc,											IconString,										CrimeIconString)
SELECT	'CRIME_ORGANIZED_JFD_SMUGGLERS',		'BUILDING_CRIMES_JFD_SMUGGLERS',		'TXT_KEY_CRIME_ORGANIZED_JFD_SMUGGLERS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_SMUGGLERS_HELP',		'TXT_KEY_JFD_SMUGGLERS_EMERGES_NOTIFICATION',			'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT',		'[ICON_JFD_ORGANIZED_CRIME_SMUGGLERS]',			'[ICON_JFD_CRIME_PINK]+[ICON_JFD_CRIME_CYAN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrimes
		(Type,									BuildingType,							Description,										Help,												NotificationDesc,										NotificationShortDesc,											IconString,										CrimeIconString)
SELECT	'CRIME_ORGANIZED_JFD_TERRORISTS',		'BUILDING_CRIMES_JFD_TERRORISTS',		'TXT_KEY_CRIME_ORGANIZED_JFD_TERRORISTS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_TERRORISTS_HELP',		'TXT_KEY_JFD_TERRORISTS_EMERGES_NOTIFICATION',			'TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT',		'[ICON_JFD_ORGANIZED_CRIME_TERRORISTS]',		'[ICON_JFD_CRIME_GREEN]+[ICON_JFD_CRIME_GRAY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);
------------------------------------------------------------
-- JFD_OrganizedCrime_CrimeTypes
------------------------------------------------------------
INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_ANARCHISTS',		'CRIME_JFD_HAPPINESS',	'YIELD_HAPPINESS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_ANARCHISTS',		'CRIME_JFD_CULTURE',	'YIELD_CULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_COUNTERFEITERS',	'CRIME_JFD_FAITH',		'YIELD_FAITH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_COUNTERFEITERS',	'CRIME_JFD_SCIENCE',	'YIELD_SCIENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_MAFIA',			'CRIME_JFD_GOLD',		'YIELD_GOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_MAFIA',			'CRIME_JFD_PRODUCTION',	'YIELD_PRODUCTION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_SMUGGLERS',		'CRIME_JFD_TOURISM',	'YIELD_TOURISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_SMUGGLERS',		'CRIME_JFD_HEALTH',		'YIELD_JFD_HEALTH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_TERRORISTS',		'CRIME_JFD_FOOD',		'YIELD_FOOD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO JFD_OrganizedCrime_CrimeTypes
		(OrganizedCrimeType,					CrimeType,				YieldType)
SELECT	'CRIME_ORGANIZED_JFD_TERRORISTS',		'CRIME_JFD_DEFENSE',	'YIELD_DEFENSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_CRIMES',			'BUILDING_JFD_CRIME_TOURISM',		'TXT_KEY_CRIME_JFD_TOURISM_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------
INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_CULTURE',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_CULTURE_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Defense,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_DEFENSE',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			-100,						0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_DEFENSE_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_FAITH',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_FAITH_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
INSERT INTO Buildings	
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_FOOD',				'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_FOOD_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_HAPPINESS',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			-1,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_HAPPINESS_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_HEALTH',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_HEALTH_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_GOLD',				'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_GOLD_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_PRODUCTION',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_PRODUCTION_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_SCIENCE',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_SCIENCE_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description)
SELECT	'BUILDING_CRIMES_JFD_TOURISM',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_TOURISM_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------
-- Buildings
------------------------------------------------------------
INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description,										Help,													LocalUnhappinessModifier)
SELECT	'BUILDING_CRIMES_JFD_ANARCHISTS',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_ANARCHISTS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_ANARCHISTS_HELP',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description,										Help,													LocalUnhappinessModifier)
SELECT	'BUILDING_CRIMES_JFD_COUNTERFEITERS',	'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_COUNTERFEITERS_DESC',	'TXT_KEY_CRIME_ORGANIZED_JFD_COUNTERFEITERS_HELP',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description,										Help,													LocalUnhappinessModifier)
SELECT	'BUILDING_CRIMES_JFD_MAFIA',			'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_MAFIA_DESC',			'TXT_KEY_CRIME_ORGANIZED_JFD_MAFIA_HELP',				0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		BuildingDefenseModifier,	LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description,										Help,													LocalUnhappinessModifier)
SELECT	'BUILDING_CRIMES_JFD_SMUGGLERS',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			-10,						10,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_SMUGGLERS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_SMUGGLERS_HELP',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,					PrereqTech,		Happiness,					LocalUnhappinessModifier,	GreatWorkCount, Cost, 	FaithCost, 	Description,										Help,													LocalUnhappinessModifier)
SELECT	'BUILDING_CRIMES_JFD_TERRORISTS',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			0,							0,							-1,				-1,		-1,			'TXT_KEY_BUILDING_CRIME_JFD_TERRORISTS_DESC',		'TXT_KEY_CRIME_ORGANIZED_JFD_TERRORISTS_HELP',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT	Type
FROM Buildings WHERE Type IN ('BUILDING_CRIMES_JFD_CULTURE', 'BUILDING_CRIMES_JFD_DEFENSE', 'BUILDING_CRIMES_JFD_FAITH', 'BUILDING_CRIMES_JFD_FOOD', 'BUILDING_CRIMES_JFD_HAPPINESS', 'BUILDING_CRIMES_JFD_HEALTH', 'BUILDING_CRIMES_JFD_GOLD', 'BUILDING_CRIMES_JFD_PRODUCTION', 'BUILDING_CRIMES_JFD_SCIENCE', 'BUILDING_CRIMES_JFD_TOURISM', 'BUILDING_CRIMES_JFD_ANARCHISTS', 'BUILDING_CRIMES_JFD_COUNTERFEITERS', 'BUILDING_CRIMES_JFD_MAFIA', 'BUILDING_CRIMES_JFD_SMUGGLERS', 'BUILDING_CRIMES_JFD_TERRORISTS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers 
		(BuildingType, 							YieldType,	Yield)
SELECT	'BUILDING_CRIMES_JFD_ANARCHISTS',		Type,		-10
FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_JFD_HEALTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 							YieldType,	Yield)
SELECT	'BUILDING_CRIMES_JFD_COUNTERFEITERS',	Type,		-10
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 							YieldType,	Yield)
SELECT	'BUILDING_CRIMES_JFD_MAFIA',			Type,		-10
FROM Yields WHERE Type IN ('YIELD_GOLD', 'YIELD_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 							YieldType,	Yield)
SELECT	'BUILDING_CRIMES_JFD_TERRORISTS',		Type,		-10
FROM Yields WHERE Type IN ('YIELD_TOURISM', 'YIELD_FOOD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_CULTURE',		'YIELD_CULTURE',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_FAITH',		'YIELD_FAITH',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_FOOD',			'YIELD_FOOD',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_HEALTH',		'YIELD_JFD_HEALTH',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_GOLD',			'YIELD_GOLD',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_PRODUCTION',	'YIELD_PRODUCTION',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_SCIENCE',		'YIELD_SCIENCE',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
SELECT	'BUILDING_CRIMES_JFD_TOURISM',		'YIELD_TOURISM',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
--Crime
UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_CRIME', IconString = '[ICON_JFD_CRIME_BLACK]', ColorString = '[COLOR_JFD_CRIME_BLACKS]'
WHERE Type = 'YIELD_JFD_CRIME';

--Culture
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_CULTURE',	'CRIME_JFD_CULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Defense
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_DEFENSE',	'CRIME_JFD_DEFENSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Faith
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_FAITH',		'CRIME_JFD_FAITH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Food
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_FOOD',		'CRIME_JFD_FOOD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Gold
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_GOLD',		'CRIME_JFD_GOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Happiness
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_HAPPINESS',	'CRIME_JFD_HAPPINESS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Production
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_PRODUCTION',	'CRIME_JFD_PRODUCTION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Science
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_SCIENCE',	'CRIME_JFD_SCIENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Tourism
INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,			CrimeType)
SELECT	'YIELD_TOURISM',	'CRIME_JFD_TOURISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================



