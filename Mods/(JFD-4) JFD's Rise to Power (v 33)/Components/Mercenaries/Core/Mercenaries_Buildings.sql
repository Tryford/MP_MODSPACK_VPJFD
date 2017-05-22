--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 			Description, 				MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_JIAYUGUAN', 		'BUILDING_JFD_JIAYUGUAN', 	'TXT_KEY_JFD_JIAYUGUAN', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 				CivilizationType, 			BuildingType)
SELECT	'BUILDINGCLASS_JFD_JIAYUGUAN', 		Type, 						NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 						BuildingClass, 					Cost, 	PrereqTech, 			MaxStartEra, 		SpecialistType, 		GreatPeopleRateChange, 	Defense,	Description, 						Help, 									Civilopedia, 							Quote, 									NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 								PortraitIndex, 	WonderSplashAudio,					WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'BUILDINGCLASS_JFD_JIAYUGUAN',	225,	'TECH_CONSTRUCTION',	'ERA_CLASSICAL', 	'SPECIALIST_MERCHANT',	1,						900,		'TXT_KEY_BUILDING_JFD_JIAYUGUAN', 	'TXT_KEY_WONDER_JFD_JIAYUGUAN_HELP',	'TXT_KEY_WONDER_JFD_JIAYUGUAN_PEDIA',	'TXT_KEY_WONDER_JFD_JIAYUGUAN_QUOTE',	1,			-1,					-1,				100,			'JFD_POUAKAI_MERCENARY_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_JIAYUGUAN',	'Wonder_Jiayuguan.dds',		'L,B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);

--Jiayuguan Fort
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MERCENARIES'
WHERE Type = 'BUILDING_JFD_JIAYUGUAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

--Terracotta Army
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MERCENARIES'
WHERE Type = 'BUILDING_TERRACOTTA_ARMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_CHANGES_TERRACOTTA' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ContractModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_ContractMods
		(BuildingType, 				TurnsMod)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'FLAVOR_GOLD',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'FLAVOR_WONDER',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType, 						Yield)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'YIELD_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType, 						Yield)
SELECT	'BUILDING_JFD_JIAYUGUAN', 	'YIELD_GOLD',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================