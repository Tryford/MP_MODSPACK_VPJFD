--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_AMER_FORT', 			'BUILDING_JFD_AMER_FORT',				'TXT_KEY_BUILDING_JFD_AMER_FORT', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_DOGES_PALACE', 		'BUILDING_JFD_DOGES_PALACE',			'TXT_KEY_BUILDING_JFD_DOGES_PALACE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_DUR_SHARRIKUN', 		'BUILDING_JFD_DUR_SHARRIKUN',			'TXT_KEY_BUILDING_JFD_DUR_SHARRIKUN', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_HOFBURG_PALACE', 	'BUILDING_JFD_HOFBURG_PALACE',			'TXT_KEY_BUILDING_JFD_HOFBURG_PALACE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_ST_PETERS', 			'BUILDING_JFD_ST_PETERS',				'TXT_KEY_BUILDING_JFD_ST_PETERS', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 						Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_VERSAILLES', 		'BUILDING_JFD_VERSAILLES', 				'TXT_KEY_BUILDING_JFD_VERSAILLES', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	 'BUILDINGCLASS_JFD_AMER_FORT', 		Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	 'BUILDINGCLASS_JFD_DOGES_PALACE', 		Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	'BUILDINGCLASS_JFD_DUR_SHARRIKUN', 		Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	'BUILDINGCLASS_JFD_HOFBURG_PALACE', 	Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	'BUILDINGCLASS_JFD_ST_PETERS', 			Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 					BuildingType)
SELECT	'BUILDINGCLASS_JFD_VERSAILLES', 		Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 									BuildingClass, 						Cost, 		FreePromotion,						FreeBuildingThisCity,		PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange, 	Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_AMER_FORT', 				'BUILDINGCLASS_JFD_AMER_FORT', 		500,		'PROMOTION_HIMEJI_CASTLE',			'BUILDINGCLASS_CASTLE',		'TECH_GUNPOWDER',					NULL,							'ERA_INDUSTRIAL', 	'SPECIALIST_MERCHANT',		2,						'TXT_KEY_BUILDING_JFD_AMER_FORT', 		'TXT_KEY_WONDER_JFD_AMER_FORT_HELP',		NULL,											'TXT_KEY_WONDER_JFD_AMER_FORT_PEDIA',		'TXT_KEY_WONDER_JFD_AMER_FORT_QUOTE',		1,			-1,					-1,				100,			'JFD_SOVEREIGNTY_WONDER_ATLAS',		3,				'Wonder_AmerFort.dds',			'L,B',					'AS2D_WONDER_SPEECH_JFD_AMER_FORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);	

INSERT INTO Buildings 
		(Type, 									BuildingClass, 						Cost, 		AllowsProductionTradeRoutesGlobal,	FoundsGovernment,			PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange, 	Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_DOGES_PALACE', 			'BUILDINGCLASS_JFD_DOGES_PALACE', 	500,		0,									0,							'TECH_BANKING',						'GOVERNMENT_JFD_REPUBLIC',		'ERA_INDUSTRIAL', 	'SPECIALIST_MERCHANT',		2,						'TXT_KEY_BUILDING_JFD_DOGES_PALACE', 	'TXT_KEY_WONDER_JFD_DOGES_PALACE_HELP',		NULL,											'TXT_KEY_WONDER_JFD_DOGES_PALACE_PEDIA',	'TXT_KEY_WONDER_JFD_DOGES_PALACE_QUOTE',	1,			-1,					-1,				100,			'JFD_SOVEREIGNTY_WONDER_ATLAS',		1,				'Wonder_DogesPalace.dds',		'L,B',					'AS2D_WONDER_SPEECH_JFD_DOGES_PALACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);					
		
INSERT INTO Buildings 		
		(Type, 									BuildingClass, 						 Cost, 		AllowsProductionTradeRoutesGlobal,	FoundsGovernment,			PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange,  Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',			'BUILDINGCLASS_JFD_DUR_SHARRIKUN',	 200,		1,									1,							'TECH_THE_WHEEL',					NULL,							'ERA_CLASSICAL', 	'SPECIALIST_MERCHANT',		1,						'TXT_KEY_BUILDING_JFD_DUR_SHARRIKUN',	'TXT_KEY_WONDER_JFD_DUR_SHARRIKUN_HELP',	NULL,											'TXT_KEY_WONDER_JFD_DUR_SHARRIKUN_PEDIA',	'TXT_KEY_WONDER_JFD_DUR_SHARRIKUN_QUOTE',	1,			-1,					-1,				100,			'JFD_SOVEREIGNTY_WONDER_ATLAS',		4,				'Wonder_SargonsPalace.dds',		'L,B',					'AS2D_WONDER_SPEECH_JFD_SARGONS_PALACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);				
		
INSERT INTO Buildings 		
		(Type, 									BuildingClass, 						 Cost, 		AllowsProductionTradeRoutesGlobal,	FreeGovernmentSwitches,		PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange, 	Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 			'BUILDINGCLASS_JFD_HOFBURG_PALACE',  400,		0,									1,							'TECH_GUILDS',						NULL,							'ERA_INDUSTRIAL', 	'SPECIALIST_ARTIST',		2,						'TXT_KEY_BUILDING_JFD_HOFBURG_PALACE', 	'TXT_KEY_WONDER_JFD_HOFBURG_PALACE_HELP',	NULL,											'TXT_KEY_WONDER_JFD_HOFBURG_PALACE_PEDIA',	'TXT_KEY_WONDER_JFD_HOFBURG_PALACE_QUOTE',	1,			-1,					-1,				100,			'JFD_SOVEREIGNTY_WONDER_ATLAS',		0,				'Wonder_HofburgPalace.dds',		'L,B',					'AS2D_WONDER_SPEECH_JFD_HOFBURG_PALACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);	
				
INSERT INTO Buildings 		
		(Type, 									BuildingClass, 						 Cost, 		AllowsProductionTradeRoutesGlobal,	FoundsGovernment,			PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange, 	Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_ST_PETERS', 				'BUILDINGCLASS_JFD_ST_PETERS', 		 625,		0,									0,							'TECH_ACOUSTICS',					'GOVERNMENT_JFD_THEOCRACY',		'ERA_INDUSTRIAL', 	'SPECIALIST_ARTIST',		2,						'TXT_KEY_BUILDING_JFD_ST_PETERS', 		'TXT_KEY_WONDER_JFD_ST_PETERS_HELP',		NULL,											'TXT_KEY_WONDER_JFD_ST_PETERS_PEDIA',		'TXT_KEY_WONDER_JFD_ST_PETERS_QUOTE',		1,			-1,					-1,				100,			'EXPANSION_SCEN_WONDER_ATLAS',		6,				'Wonder_StPeters.dds',			'L,B',					'AS2D_WONDER_SPEECH_JFD_ST_PETERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);					
				
INSERT INTO Buildings 				
		(Type, 									BuildingClass, 						Cost, 		AllowsProductionTradeRoutesGlobal,	FoundsGovernment,			PrereqTech, 						GovernmentType,					MaxStartEra, 		SpecialistType, 			GreatPeopleRateChange, 	Description, 							Help, 										ThemingBonusHelp, 								Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashImage, 				WonderSplashAnchor, 	WonderSplashAudio)
SELECT	'BUILDING_JFD_VERSAILLES', 				'BUILDINGCLASS_JFD_VERSAILLES',		500,		0,									0,							'TECH_PRINTING_PRESS',				'GOVERNMENT_JFD_MONARCHY',		'ERA_INDUSTRIAL',	'SPECIALIST_ENGINEER',		2,						'TXT_KEY_BUILDING_JFD_VERSAILLES', 		'TXT_KEY_WONDER_JFD_VERSAILLES_HELP',		'TXT_KEY_WONDER_JFD_VERSAILLES_THEME_HELP',		'TXT_KEY_WONDER_JFD_VERSAILLES_PEDIA',		'TXT_KEY_WONDER_JFD_VERSAILLES_QUOTE',		1,			-1,					-1,				100,			'JFD_SOVEREIGNTY_WONDER_ATLAS',		5,				'Wonder_Versailles.dds',		'L,B',					'AS2D_WONDER_SPEECH_EE_VERSAILLES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);

--Himeji Castle
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_HIMEJI_HELP', Defense = 500, FreeBuildingThisCity = NULL, FreePromotion = NULL, FreeGovernmentSwitches = 1
WHERE Type = 'BUILDING_HIMEJI_CASTLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_CHANGES_HIMEJI_CASTLE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType,							Help,												IsSovereignty,	SovereigntyWhenPietyLevel,		SovereigntyWhenPietyLevelReq,		SovereigntyWhenGreatWorks,		SovereigntyWhenTradeRoutes)
SELECT	'BUILDING_JFD_DOGES_PALACE',			'TXT_KEY_JFD_SOVEREIGNTY_FROM_TRADE_ROUTES',		1,				0,								NULL,								0,								10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType,							Help,												IsSovereignty,	SovereigntyWhenPietyLevel,		SovereigntyWhenPietyLevelReq,		SovereigntyWhenGreatWorks,		SovereigntyWhenTradeRoutes)
SELECT	'BUILDING_JFD_ST_PETERS',				'TXT_KEY_JFD_SOVEREIGNTY_FROM_PIETY_LEVEL',			1,				10,								'PIETY_LEVEL_JFD_VIRTUOUS',			0,								0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType,							Help,												IsSovereignty,	SovereigntyWhenPietyLevel,		SovereigntyWhenPietyLevelReq,		SovereigntyWhenGreatWorks,		SovereigntyWhenTradeRoutes)
SELECT	'BUILDING_JFD_VERSAILLES',				'TXT_KEY_JFD_SOVEREIGNTY_FROM_GREAT_WORKS',			1,				0,								NULL,								10,								0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 					YieldType,					Yield)
SELECT	Type, 							'YIELD_JFD_SOVEREIGNTY',	20
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_AMER_FORT', 		'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'YIELD_GOLD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN', 	'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN', 	'YIELD_PRODUCTION',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 	'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 	'YIELD_GOLD',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_PETERS', 		'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_PETERS', 		'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_VERSAILLES', 		'YIELD_CULTURE',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ThemingBonuses 
		(BuildingType, 					Description,								Bonus,	MustBeArt,	AIPriority)
SELECT	'BUILDING_JFD_VERSAILLES', 		'TXT_KEY_THEMING_BONUS_JFD_VERSAILLES',		2,		1,			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_AMER_FORT', 		'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_AMER_FORT', 		'FLAVOR_DEFENSE',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_AMER_FORT', 		'FLAVOR_CITY_DEFENSE',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_AMER_FORT', 		'FLAVOR_CULTURE',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_HAPPINESS',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DOGES_PALACE', 	'FLAVOR_GOLD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_CULTURE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_WONDER',			30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DUR_SHARRIKUN',	'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOFBURG_PALACE',	'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 	'FLAVOR_CULTURE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOFBURG_PALACE', 	'FLAVOR_DIPLOMACY',			70
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_PETERS', 		'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_PETERS',		'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_PETERS', 		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_PETERS', 		'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_PETERS', 		'FLAVOR_RELIGION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VERSAILLES', 		'FLAVOR_WONDER',			50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VERSAILLES',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VERSAILLES',		'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VERSAILLES', 		'FLAVOR_CULTURE',			30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================