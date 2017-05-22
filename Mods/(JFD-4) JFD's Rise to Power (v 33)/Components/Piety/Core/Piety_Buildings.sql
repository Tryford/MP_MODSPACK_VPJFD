--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_ABU_SIMBEL', 			'BUILDING_JFD_ABU_SIMBEL', 			'TXT_KEY_WONDER_JFD_ABU_SIMBEL', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 		'BUILDING_JFD_BUDDHAS_BAMIYAN', 	'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 		'BUILDING_JFD_COLOGNE_CATHEDRAL',	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_DOME_ROCK', 				'BUILDING_JFD_DOME_ROCK', 			'TXT_KEY_WONDER_JFD_DOME_ROCK', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_GRAND_INQUISITION', 		'BUILDING_JFD_GRAND_INQUISITION',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_PANTHEON', 				'BUILDING_JFD_PANTHEON', 			'TXT_KEY_WONDER_JFD_PANTHEON', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 		'BUILDING_JFD_SOLOMONS_TEMPLE', 	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TODAI', 					'BUILDING_JFD_TODAI', 				'TXT_KEY_WONDER_JFD_TODAI', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TEMPLE_HEAVEN', 			'BUILDING_JFD_TEMPLE_HEAVEN', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_ABU_SIMBEL', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_DOME_ROCK', 				Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_PANTHEON', 				Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_TODAI', 					Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_TEMPLE_HEAVEN', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GRAND_INQUISITION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GRAND_INQUISITION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
--Garden
UPDATE Buildings
SET PrereqTech = 'TECH_PHILOSOPHY'
WHERE BuildingClass = 'BUILDINGCLASS_GARDEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_CHANGES_GARDEN' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GARDEN' AND PrereqTech = 'TECH_JFD_MEDICINE');

--Monastery
UPDATE Buildings
SET FaithCost = 0, UnlockedByBelief = 0, Cost = 200, GoldMaintenance = 1, PrereqTech = 'TECH_THEOLOGY', PolicyType = NULL
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_PIETY', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_PIETY'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', SpecialistCount = 2, GoldMaintenance = 1
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);

--Shrine
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MYSTICISM'
WHERE BuildingClass = 'BUILDINGCLASS_SHRINE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Temple
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
WHERE BuildingClass = 'BUILDINGCLASS_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Triggers
CREATE TRIGGER JFDRTP_Piety_Buildings
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_GARDEN', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE')
BEGIN
	UPDATE Buildings
	SET PrereqTech = 'TECH_PHILOSOPHY'
	WHERE NEW.Type = Type AND BuildingClass = 'BUILDINGCLASS_GARDEN'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_CHANGES_GARDEN' AND Value = 1)
	AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GARDEN' AND PrereqTech = 'TECH_JFD_MEDICINE');

	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_MYSTICISM'
	WHERE NEW.Type = Type AND BuildingClass = 'BUILDINGCLASS_SHRINE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
	WHERE NEW.Type = Type AND BuildingClass = 'BUILDINGCLASS_TEMPLE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
--Grand Inquisition
INSERT INTO Buildings
		(Type,								BuildingClass,							PrereqTech,			HolyCity,	Cost,	Description,								Help, 											Strategy,											Civilopedia,									NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 					PortraitIndex)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'BUILDINGCLASS_JFD_GRAND_INQUISITION',	'TECH_THEOLOGY',	1,			125,	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_HELP',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_STRATEGY',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_TEXT',	30,				1,			-1,					-1,				1,				'JFD_PIETY_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

--Grand Temple
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD' 
WHERE Type = 'BUILDING_GRAND_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_CHANGES_GRAND_TEMPLE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Grand Inquisition
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'BUILDING_JFD_GRAND_INQUISITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------
--Abu Simbel
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_ABU_SIMBEL',			'BUILDINGCLASS_JFD_ABU_SIMBEL', 		130,	'TECH_MINING',			'ERA_CLASSICAL', 	4,						'TECH_ARCHAEOLOGY',		NULL,						'SPECIALIST_ENGINEER',	1,						NULL,								0,					0,					0,							'TXT_KEY_WONDER_JFD_ABU_SIMBEL', 			'TXT_KEY_WONDER_JFD_ABU_SIMBEL_HELP',			'TXT_KEY_WONDER_JFD_ABU_SIMBEL_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_ABU_SIMBEL_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	3,				'AS2D_WONDER_SPEECH_JFD_ABU_SIMBEL',		'Wonder_AbuSimbel.dds',			'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);					
	
--Buddha's of Bamiyan
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN',		'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 	265,	'TECH_CONSTRUCTION',	'ERA_MEDIEVAL', 	0,						NULL,					NULL,						'SPECIALIST_ENGINEER',	1,						NULL,								0,					0,					1,							'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN', 		'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_HELP',		'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_PEDIA',		NULL,												'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_QUOTE',		1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	7,				'AS2D_WONDER_SPEECH_JFD_BUDDHAS_BAMIYAN',	'Wonder_BuddhaBamiyan.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);	
				
--Cologne Cathedral					
INSERT INTO Buildings 					
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 	750,	'TECH_RIFLING',			'ERA_MODERN', 		5,						'TECH_RIFLING',			'BUILDINGCLASS_CATHEDRAL',	'SPECIALIST_ENGINEER',	3,						'GREAT_WORK_SLOT_MUSIC',			1,					0,					0,							'TXT_KEY_BUILDING_JFD_COLOGNE_CATHEDRAL', 	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_HELP',	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_PEDIA',	NULL,												'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_QUOTE',	1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	2,				'AS2D_WONDER_SPEECH_JFD_COLOGNE',			'Wonder_Cologne.dds',			'L,T'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);							
							
--Dome of the Rock							
INSERT INTO Buildings 							
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_DOME_ROCK',			'BUILDINGCLASS_JFD_DOME_ROCK',			350,	'TECH_THEOLOGY',		'ERA_RENAISSANCE',	0,						NULL,					NULL,						NULL,					0,						NULL,								0,					0,					0,							'TXT_KEY_WONDER_JFD_DOME_ROCK', 			'TXT_KEY_WONDER_JFD_DOME_ROCK_HELP',			'TXT_KEY_WONDER_JFD_DOME_ROCK_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_DOME_ROCK_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	4,				'AS2D_WONDER_SPEECH_JFD_DOME_ROCK',			'Wonder_DomeRock.dds',			'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);					
					
--Pantheon					
INSERT INTO Buildings 					
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_PANTHEON', 			'BUILDINGCLASS_JFD_PANTHEON', 			230,	'TECH_CONSTRUCTION',	'ERA_MEDIEVAL', 	0,						NULL,					NULL,						'SPECIALIST_ENGINEER',	2,						NULL,								0,					1,					0,							'TXT_KEY_WONDER_JFD_PANTHEON', 				'TXT_KEY_WONDER_JFD_PANTHEON_HELP',				'TXT_KEY_WONDER_JFD_PANTHEON_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_PANTHEON_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	1,				'AS2D_WONDER_SPEECH_JFD_PANTHEON',			'Wonder_Pantheon.dds',			'R,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

--Solomon's Temple
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 	185,	'TECH_THE_WHEEL',		'ERA_CLASSICAL', 	0,						NULL,					NULL,						NULL,					0,						'GREAT_WORK_SLOT_ART_ARTIFACT',		2,					0,					0,							'TXT_KEY_BUILDING_JFD_SOLOMONS_TEMPLE', 	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_HELP',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_PEDIA',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_THEMING_BONUS',	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_QUOTE',		1,			-1,					-1,				100,			200,					'JFD_PIETY_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_SOLOMON_TEMPLE',	'Wonder_TempleSolomon.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

--Temple of Heaven
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 									 		Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN',		'BUILDINGCLASS_JFD_TEMPLE_HEAVEN',		350,	'TECH_CIVIL_SERVICE',	'ERA_RENAISSANCE',	0,						NULL,					NULL,						NULL,					0,						NULL,								0,					0,					0,							'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_HELP', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_PEDIA',		NULL,												'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_QUOTE',		1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	5,				'AS2D_WONDER_SPEECH_JFD_TEMPLE_HEAVEN',		'Wonder_TempleHeaven.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);			
			
--Todai-Ji			
INSERT INTO Buildings 			
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,		FreeBuildingThisCity,		SpecialistType, 		GreatPeopleRateChange, 	GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	FoundsStateReligion,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_TODAI', 				'BUILDINGCLASS_JFD_TODAI', 				450,	'TECH_ACOUSTICS',		'ERA_RENAISSANCE', 	0,						NULL,					'BUILDINGCLASS_PAGODA',		NULL,					0,						NULL,								0,					0,					0,							'TXT_KEY_BUILDING_JFD_TODAI', 				'TXT_KEY_WONDER_JFD_TODAI_HELP',				'TXT_KEY_WONDER_JFD_TODAI_PEDIA',				NULL,												'TXT_KEY_WONDER_JFD_TODAI_QUOTE',				1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	8,				'AS2D_WONDER_SPEECH_JFD_TODAI',				'Wonder_Todai.dds',				'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

--Borobudur
UPDATE Buildings
SET PortraitIndex = 6, IconAtlas = 'JFD_PIETY_WONDER_ATLAS'
WHERE BuildingClass = 'BUILDINGCLASS_BOROBUDUR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_BOROBUDUR' AND Value = 1);

--Hagia Sophia
UPDATE Buildings
SET PrereqTech = 'TECH_DRAMA', Cost = 280
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_CHANGES_HAGIA_SOPHIA' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_HAGIA_SOPHIA_HELP', FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY'
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);

--Mosque of Djenne
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_MOSQUE_OF_DJENNE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_DJENNE' AND Value = 1);

--Pantheon
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
WHERE Type = 'BUILDING_JFD_PANTHEON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Stonehenge
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_STONEHENGE_HELP', FreeBuildingThisCity = 'BUILDINGCLASS_SHRINE'
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MYSTICISM'
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Todai-Ji
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'BUILDING_JFD_TODAI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- GreatWorkFaith
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET GreatWorkYieldType = 'YIELD_FAITH'
WHERE Type IN ('BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_MANDIR', 'BUILDING_MOSQUE', 'BUILDING_JFD_SOLOMONS_TEMPLE', 'BUILDING_JFD_VANK', 'BUILDING_JFD_CHAPEL_ART', 'BUILDING_JFD_CHAPEL_MUSIC', 'BUILDING_JFD_CHAPEL_WRITING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_GREAT_WORK_FAITH_YIELDS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			'BUILDINGCLASS_PALACE',		Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE', 'YIELD_SCIENCE', 'YIELD_PRODUCTION', 'YIELD_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	BuildingClass,				'YIELD_FAITH',		2
FROM Buildings WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_PAGODA', 'BUILDING_MOSQUE', 'BUILDING_JFD_CHAPTER_HOUSE', 'BUILDING_JFD_MANDIR', 'BUILDING_JFD_SYNAGOGUE', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_ALTAR', 'BUILDING_JFD_TORII', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	BuildingClass,				'YIELD_CULTURE', 	1
FROM Buildings WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_PAGODA', 'BUILDING_MOSQUE', 'BUILDING_JFD_CHAPTER_HOUSE', 'BUILDING_JFD_MANDIR', 'BUILDING_JFD_SYNAGOGUE', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_ALTAR', 'BUILDING_JFD_TORII', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_GoldenAgeYieldMod
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GoldenAgeYieldMod 
		(BuildingType, 						YieldType, 		Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		Type, 			15
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_FOOD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_GreatWorkYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GreatWorkYieldChanges 
		(BuildingType, 						YieldType,		Yield)
SELECT	'BUILDING_HAGIA_SOPHIA', 			'YIELD_FAITH',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONASTERY' AND YieldType != 'YIELD_JFD_CRIME' AND YieldType != 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

DELETE FROM Building_YieldChanges WHERE BuildingType IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES' AND Value = 1);

UPDATE Building_YieldChanges
SET Yield = 5
WHERE BuildingType = 'BUILDING_GRAND_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_GRAND_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_DOME_ROCK',			'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_DOME_ROCK', 			'YIELD_FAITH', 		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_PANTHEON', 			'YIELD_FAITH', 		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_PANTHEON', 			'YIELD_CULTURE', 	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN',		'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'YIELD_FOOD', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TODAI',				'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TODAI', 				'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_FreeUnits WHERE BuildingType = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);
INSERT INTO Building_FreeUnits 
		(BuildingType, 						UnitType,						NumUnits)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'UNIT_PROPHET',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_GRAND_INQUISITION', 	'BUILDINGCLASS_MONASTERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 						BuildingClassType,				NumBuildingNeeded)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'BUILDINGCLASS_MONASTERY',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ThemingBonuses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ThemingBonuses
		(BuildingType,						Description,									MustBeArtifact, Bonus,	AIPriority)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'TXT_KEY_THEMING_BONUS_JFD_SOLOMONS_TEMPLE',	1,				3,		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_PietyMods
		(BuildingType,						PietyYieldMod)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_JFD_PietyMods
		(BuildingType,						PietyYieldMod)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 							2
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 							3
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 							2
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GREAT_PEOPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 							10
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL',	Type, 							15
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_DOME_ROCK',			Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_MILITARY_TRAINING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_GRAND_INQUISITION', 	Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_PANTHEON', 			Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_WONDER', 				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_RELIGION', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TODAI', 				'FLAVOR_RELIGION', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TODAI', 				'FLAVOR_MILITARY_TRAINING', 	30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'FLAVOR_WONDER', 				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		Type, 							25
FROM Flavors WHERE Type IN ('FLAVOR_GROWTH', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
			