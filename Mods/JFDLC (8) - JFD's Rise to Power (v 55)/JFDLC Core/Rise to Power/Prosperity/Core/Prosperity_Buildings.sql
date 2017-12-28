--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_GRAND_CANAL', 			'BUILDING_JFD_GRAND_CANAL', 		'TXT_KEY_WONDER_JFD_GRAND_CANAL', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 							BuildingType)
SELECT	Type, 					'BUILDINGCLASS_JFD_GRAND_CANAL', 			NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 								BuildingClass, 						Cost, 	PrereqTech, 		MaxStartEra, 		SpecialistType, 		GreatPeopleRateChange, 	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_GRAND_CANAL',			'BUILDINGCLASS_JFD_GRAND_CANAL', 	400,	'TECH_COMPASS',		'ERA_RENAISSANCE', 	'SPECIALIST_MERCHANT',	1,						'TXT_KEY_BUILDING_JFD_GRAND_CANAL', 'TXT_KEY_WONDER_JFD_GRAND_CANAL_HELP',	'TXT_KEY_WONDER_JFD_GRAND_CANAL_PEDIA',	'TXT_KEY_WONDER_JFD_GRAND_CANAL_QUOTE',	1,			-1,					-1,				100,			'JFD_PROSPERITY_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_GRAND_CANAL',	'Wonder_GrandCanal.dds',	'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_GRAND_CANAL', 		Type, 				2
FROM Yields WHERE Type IN ('YIELD_GOLD', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 			Flavor)
SELECT	'BUILDING_JFD_GRAND_CANAL', 		Type, 					10
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 			Flavor)
SELECT	'BUILDING_JFD_GRAND_CANAL', 		Type, 					5
FROM Flavors WHERE Type IN ('FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
			