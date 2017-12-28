--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_YELLOW_CRANE',		'BUILDING_JFD_YELLOW_CRANE',		'TXT_KEY_BUILDING_JFD_YELLOW_CRANE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides	
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_YELLOW_CRANE',		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,	FreeUnitCombatUpgrades,		SpecialistType, 			GreatPeopleRateChange,	Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_YELLOW_CRANE',		'BUILDINGCLASS_JFD_YELLOW_CRANE',		300,	'TECH_MATHEMATICS',		'ERA_MEDIEVAL', 	0,			NULL,						'SPECIALIST_SCIENTIST',		1,						'TXT_KEY_BUILDING_JFD_YELLOW_CRANE',		'TXT_KEY_WONDER_JFD_YELLOW_CRANE_HELP',			'TXT_KEY_WONDER_JFD_YELLOW_CRANE_PEDIA',		'TXT_KEY_WONDER_JFD_YELLOW_CRANE_QUOTE',		1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	7,				'AS2D_WONDER_SPEECH_JFD_YELLOW_CRANE',		'Wonder_YellowCrane.dds',			'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_InnovationMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_InnovationMods 
		(BuildingType, 						NumInnovations)
SELECT	'BUILDING_JFD_YELLOW_CRANE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_YELLOW_CRANE', 		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_YELLOW_CRANE', 		'YIELD_SCIENCE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_YELLOW_CRANE',	 	'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_YELLOW_CRANE',	 	'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_YELLOW_CRANE',	 	'FLAVOR_SCIENCE',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_YELLOW_CRANE',	 	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
