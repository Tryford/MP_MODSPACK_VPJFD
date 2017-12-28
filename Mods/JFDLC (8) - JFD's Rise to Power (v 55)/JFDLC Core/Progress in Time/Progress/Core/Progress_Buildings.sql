--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
----------------------------------------
-- Buildings
----------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_CINEMA',				'BUILDING_JFD_CINEMA',				'TXT_KEY_BUILDING_JFD_CINEMA'				
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
----------------------------------------
-- National Wonders
----------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_DIRECTORS_GUILD',	'BUILDING_JFD_DIRECTORS_GUILD',		'TXT_KEY_BUILDING_JFD_DIRECTORS_GUILD', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
----------------------------------------
-- Wonders
----------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_CHARTRES',			'BUILDING_JFD_CHARTRES',			'TXT_KEY_BUILDING_JFD_CHARTRES', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_CHARTRES' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_DA_VINCI', 			'BUILDING_JFD_DA_VINCI',			'TXT_KEY_BUILDING_JFD_DA_VINCI', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_GOBEKLI',			'BUILDING_JFD_GOBEKLI',				'TXT_KEY_BUILDING_JFD_GOBEKLI', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_GREAT_ZIGGURAT',		'BUILDING_JFD_GREAT_ZIGGURAT',		'TXT_KEY_BUILDING_JFD_GREAT_ZIGGURAT', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_HAWA',				'BUILDING_JFD_HAWA',				'TXT_KEY_BUILDING_JFD_HAWA', 					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HAWA_MADAL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_HOLLYWOOD',			'BUILDING_JFD_HOLLYWOOD',			'TXT_KEY_BUILDING_JFD_HOLLYWOOD', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_MAHAVEDA',			'BUILDING_JFD_MAHAVEDA',			'TXT_KEY_BUILDING_JFD_MAHAVEDA', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_MAHAVEDA' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_ST_BASILS',			'BUILDING_JFD_ST_BASILS',			'TXT_KEY_BUILDING_JFD_ST_BASILS', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_ST_MARKS',			'BUILDING_JFD_ST_MARKS',			'TXT_KEY_BUILDING_JFD_ST_MARKS', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_VENETIAN_ARSENAL',	'BUILDING_JFD_VENETIAN_ARSENAL',	'TXT_KEY_BUILDING_JFD_VENETIAN_ARSENAL',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_CHARTRES',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_CHARTRES' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	 'BUILDINGCLASS_JFD_DA_VINCI',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_GOBEKLI',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_GREAT_ZIGGURAT',		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_HAWA',				Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HAWA_MADAL' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_HOLLYWOOD',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_MAHAVEDA',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_MAHAVEDA' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_ST_BASILS',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_ST_MARKS',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType,						CivilizationType,		BuildingType)
SELECT	'BUILDINGCLASS_JFD_VENETIAN_ARSENAL',	Type,					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 						
		(Type, 						BuildingClass, 					Cost, 	PrereqTech, 			MaxStartEra, 		GoldMaintenance,	FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	GreatWorkSlotType,					GreatWorkCount,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_CINEMA',		'BUILDINGCLASS_JFD_CINEMA',		450,	'TECH_RADIO',			NULL, 				2,					NULL,							NULL,							0,						'GREAT_WORK_SLOT_JFD_FILM',			2,					'TXT_KEY_BUILDING_JFD_CINEMA',				'TXT_KEY_BUILDING_JFD_CINEMA_HELP',				'TXT_KEY_BUILDING_JFD_CINEMA_TEXT',				NULL,											1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_BUILDING_ATLAS',	0,				NULL,										NULL,								NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);		

UPDATE Buildings
SET Cost = Cost-100
WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--JFDPIT_Progress_Buildings
CREATE TRIGGER JFDPIT_Progress_Buildings
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_MINT') 
BEGIN
	UPDATE Buildings
	SET Cost = Cost-100
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_WINDMILL'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

	DELETE FROM Building_LocalResourceOrs WHERE BuildingType = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_MINT'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT' AND Value = 1);
	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,	ResourceType, 		YieldType,		Yield)
	SELECT	NEW.Type,		'RESOURCE_COPPER',	'YIELD_GOLD', 	1
	FROM Buildings WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_MINT'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT' AND Value = 1);
END;
----------------------------------------	
-- National Wonders	
----------------------------------------		
INSERT INTO Buildings 							
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		GoldMaintenance,			SpecialistCount,				SpecialistType,					GreatPeopleRateChange,	HolyCity,							GrantsPantheon,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_DIRECTORS_GUILD',		'BUILDINGCLASS_JFD_DIRECTORS_GUILD',	250,	'TECH_RADIO',			NULL, 				1,							3,								'SPECIALIST_JFD_DIRECTOR',		4,						0,									0,					'TXT_KEY_BUILDING_JFD_DIRECTORS_GUILD',		'TXT_KEY_BUILDING_JFD_DIRECTORS_GUILD_HELP',	'TXT_KEY_BUILDING_JFD_DIRECTORS_GUILD_PEDIA',	NULL,											1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_BUILDING_ATLAS',	1,				NULL,										NULL,								NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);			

--JFDPIT_Progress_NationalWonders
CREATE TRIGGER JFDPIT_Progress_NationalWonders
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_PALACE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FREE_STARTING_TECH' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET FreeTechs = 1
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_PALACE';
END;
----------------------------------------			
-- Wonders			
----------------------------------------		
INSERT INTO Buildings 													
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							GrantsPantheon,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_CHARTRES',			'BUILDINGCLASS_JFD_CHARTRES',			200,	'TECH_EDUCATION',		'ERA_INDUSTRIAL', 	0,							NULL,							'SPECIALIST_ENGINEER',			1,						0,									0,					'TXT_KEY_BUILDING_JFD_CHARTRES',			'TXT_KEY_WONDER_JFD_CHARTRES_HELP',				'TXT_KEY_WONDER_JFD_CHARTRES_PEDIA',			'TXT_KEY_WONDER_JFD_CHARTRES_QUOTE',			1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	8,				'AS2D_WONDER_SPEECH_JFD_CHARTRES',			'Wonder_Chartres.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_CHARTRES' AND Value = 1);	
		
INSERT INTO Buildings 			
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							IsReformation,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_DA_VINCI',			'BUILDINGCLASS_JFD_DA_VINCI',			450,	'TECH_PHYSICS',			'ERA_RENAISSANCE', 	0,							'UNITCOMBAT_SIEGE',				'SPECIALIST_ENGINEER',			1,						0,									0,					'TXT_KEY_BUILDING_JFD_DA_VINCI',			'TXT_KEY_WONDER_JFD_DA_VINCI_HELP',				'TXT_KEY_WONDER_JFD_DA_VINCI_PEDIA',			'TXT_KEY_WONDER_JFD_DA_VINCI_QUOTE',			1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	1,				'AS2D_WONDER_SPEECH_JFD_DA_VINCI',			'Wonder_DaVinci.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)													
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');													
													
INSERT INTO Buildings 													
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							GrantsPantheon,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_GOBEKLI',				'BUILDINGCLASS_JFD_GOBEKLI',			100,	'TECH_AGRICULTURE',		'ERA_CLASSICAL', 	0,							NULL,							'SPECIALIST_JFD_MONK',			1,						0,									1,					'TXT_KEY_BUILDING_JFD_GOBEKLI',				'TXT_KEY_WONDER_JFD_GOBEKLI_HELP',				'TXT_KEY_WONDER_JFD_GOBEKLI_PEDIA',				'TXT_KEY_WONDER_JFD_GOBEKLI_QUOTE',				1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	9,				'AS2D_WONDER_SPEECH_JFD_GOBEKLI',			'Wonder_Gobleki.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);											
											
INSERT INTO Buildings 											
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		GrantsAllEraInnovations,	FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							IsReformation,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT',		'BUILDINGCLASS_JFD_GREAT_ZIGGURAT',		180,	'TECH_CALENDAR',		'ERA_CLASSICAL', 	'ERA_ANCIENT',				NULL,							'SPECIALIST_SCIENTIST',			1,						0,									0,					'TXT_KEY_BUILDING_JFD_GREAT_ZIGGURAT',		'TXT_KEY_WONDER_JFD_GREAT_ZIGGURAT_HELP',		'TXT_KEY_WONDER_JFD_GREAT_ZIGGURAT_PEDIA',		'TXT_KEY_WONDER_JFD_GREAT_ZIGGURAT_QUOTE',		1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	6,				'AS2D_WONDER_SPEECH_JFD_GREAT_ZIGGURAT',	'Wonder_GreatZiggurat.dds',			'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);											
											
INSERT INTO Buildings 											
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							IsReformation,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_HAWA',				'BUILDINGCLASS_JFD_HAWA',				625,	'TECH_ARCHITECTURE',	'ERA_INDUSTRIAL', 	0,							NULL,							'SPECIALIST_ENGINEER',			1,						0,									0,					'TXT_KEY_BUILDING_JFD_HAWA',				'TXT_KEY_WONDER_JFD_HAWA_HELP',					'TXT_KEY_WONDER_JFD_HAWA_PEDIA',				'TXT_KEY_WONDER_JFD_HAWA_QUOTE',				1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	13,				'AS2D_WONDER_SPEECH_JFD_HAWA',				'Wonder_Hawa.dds',					'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HAWA_MADAL' AND Value = 1);										
											
INSERT INTO Buildings 											
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		FreeBuildingThisCity,		FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	HolyCity,							IsReformation,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_MAHAVEDA',			'BUILDINGCLASS_JFD_MAHAVEDA',			180,	'TECH_THEOLOGY',		'ERA_RENAISSANCE', 	'BUILDING_JFD_MANDIR',		NULL,							'SPECIALIST_JFD_MONK',			1,						0,									0,					'TXT_KEY_BUILDING_JFD_MAHAVEDA',			'TXT_KEY_WONDER_JFD_MAHAVEDA_HELP',				'TXT_KEY_WONDER_JFD_MAHAVEDA_PEDIA',			'TXT_KEY_WONDER_JFD_MAHAVEDA_QUOTE',			1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	11,				'AS2D_WONDER_SPEECH_JFD_MAHAVEDA',			'Wonder_Mahaveda.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_MAHAVEDA' AND Value = 1);										
											
INSERT INTO Buildings 											
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType, 				GreatPeopleRateChange,	GreatWorkSlotType,					GreatWorkCount,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_HOLLYWOOD',			'BUILDINGCLASS_JFD_HOLLYWOOD',			1250,	'TECH_ATOMIC_THEORY',	'ERA_FUTURE', 		0,							NULL,							'SPECIALIST_JFD_DIRECTOR',		3,						'GREAT_WORK_SLOT_JFD_FILM',			3,					'TXT_KEY_BUILDING_JFD_HOLLYWOOD',			'TXT_KEY_WONDER_JFD_HOLLYWOOD_HELP',			'TXT_KEY_WONDER_JFD_HOLLYWOOD_PEDIA',			'TXT_KEY_WONDER_JFD_HOLLYWOOD_QUOTE',			1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	10,				'AS2D_WONDER_SPEECH_JFD_HOLLYWOOD',			'Wonder_Hollywood.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);							
							
INSERT INTO Buildings 							
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeProphetHasReformation,		SpecialistType, 				GreatPeopleRateChange,	HolyCity,							IsReformation,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_ST_BASILS',			'BUILDINGCLASS_JFD_ST_BASILS',			500,	'TECH_PRINTING_PRESS',	'ERA_INDUSTRIAL', 	0,							1,								'SPECIALIST_ENGINEER',			1,						1,									1,					'TXT_KEY_BUILDING_JFD_ST_BASILS',			'TXT_KEY_WONDER_JFD_ST_BASILS_HELP',			'TXT_KEY_WONDER_JFD_ST_BASILS_PEDIA',			'TXT_KEY_WONDER_KREMLIN_QUOTE',					1,			-1,					-1,				100,			'KREMLIN',		'BW_ATLAS_2',					13,				'AS2D_WONDER_SPEECH_THE_KREMLIN',			'WonderConceptKremlin.dds',			'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);							
							
INSERT INTO Buildings 							
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		Defense,					FreeProphetHasReformation,		SpecialistType, 				GreatPeopleRateChange,	GreatWorkSlotType,					GreatWorkCount,		Description, 								Help, 											Civilopedia, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_ST_MARKS',			'BUILDINGCLASS_JFD_ST_MARKS',			300,	'TECH_GUILDS',			'ERA_RENAISSANCE', 	0,							0,								'SPECIALIST_MERCHANT',			1,						'GREAT_WORK_SLOT_ART_ARTIFACT',		1,					'TXT_KEY_BUILDING_JFD_ST_MARKS',			'TXT_KEY_WONDER_JFD_ST_MARKS_HELP',				'TXT_KEY_WONDER_JFD_ST_MARKS_PEDIA',			'TXT_KEY_WONDER_JFD_ST_MARKS_QUOTE',			1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	5,				'AS2D_WONDER_SPEECH_JFD_ST_MARKS',			'Wonder_StMarks.dds',				'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);							
							
INSERT INTO Buildings							
		(Type,								BuildingClass,							Cost,	PrereqTech,				MaxStartEra, 		Defense,					FreeUnitCombatUpgrades,			SpecialistType,					GreatPeopleRateChange,	HolyCity,							Water,				Description,								Help, 											Civilopedia,									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex,	WonderSplashAudio,							WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL',	'BUILDINGCLASS_JFD_VENETIAN_ARSENAL',	350,	'TECH_STEEL',			'ERA_RENAISSANCE', 	600,						NULL,							'SPECIALIST_MERCHANT',			1,						0,									1,					'TXT_KEY_BUILDING_JFD_VENETIAN_ARSENAL',	'TXT_KEY_WONDER_JFD_VENETIAN_ARSENAL_HELP',		'TXT_KEY_WONDER_JFD_VENETIAN_ARSENAL_TEXT',		'TXT_KEY_WONDER_JFD_VENETIAN_ARSENAL_QUOTE',	1,			-1,					-1,				100,			NULL,			'JFD_PROGRESS_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_VENETIAN_ARSENAL',	'Wonder_VenetianArsenal.dds',		'L,B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);

--Great Wall
UPDATE Buildings
SET FreeBuilding = 'BUILDINGCLASS_WALLS', FreeBuildingThisCity = NULL, Help = 'TXT_KEY_BUILDING_JFD_GREAT_WALL_HELP', Cost = 300
WHERE Type = 'BUILDING_GREAT_WALL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_WALL' AND Value = 1);

--Mint
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MINT_HELP_PROGRESS', Strategy = 'TXT_KEY_BUILDING_JFD_MINT_STRATEGY_PROGRESS'
WHERE Type = 'BUILDING_MINT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT' AND Value = 1);

--Motherland Calls
UPDATE Buildings
SET IconAtlas = 'JFD_PROGRESS_WONDER_ATLAS', WonderSplashAudio = 'AS2D_WONDER_SPEECH_JFD_MOTHERLAND_CALLS', PortraitIndex = 2, WonderSplashImage = 'Wonder_MotherlandCalls.dds', Description =	'TXT_KEY_BUILDING_JFD_MOTHERLAND_CALLS', Civilopedia = 'TXT_KEY_WONDER_JFD_MOTHERLAND_CALLS_PEDIA', Quote = 'TXT_KEY_WONDER_JFD_MOTHERLAND_CALLS_QUOTE', ArtDefineTag = NULL
WHERE Type = 'BUILDING_KREMLIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_MOTHERLAND_CALLS_HELP', GreatWorkSlotType = 'GREAT_WORK_SLOT_JFD_FILM', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_JFD_MOTHERLAND_CALLS'
WHERE Type = 'BUILDING_KREMLIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_MOTHERLAND_CALLS' AND Value = 1);

--National Treasury
UPDATE Buildings
SET PrereqTech = 'TECH_BANKING', Help = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_HELP_PROGRESS', Strategy = 'TXT_KEY_BUILDING_JFD_NATIONAL_TREASURY_STRATEGY_PROGRESS'
WHERE Type = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY' AND Value = 1);

--Palace
UPDATE Buildings
SET FreeTechs = 1
WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FREE_STARTING_TECH' AND Value = 1);

--Pyramid
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PYRAMID_HELP_CHARGES', WorkerSpeedModifier = 20
WHERE Type = 'BUILDING_PYRAMID'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
---------------------------
-- Great People Points
---------------------------
--ANCIENT
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_JFD_SOLOMONS_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

--CLASSICAL
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_BUDDHAS_BAMIYAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_PARTHENON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_STATUE_ZEUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_TERRACOTTA_ARMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

--MEDIEVAL
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_BOROBUDUR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_DOME_ROCK'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MUSICIAN', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_NOTRE_DAME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_TODAI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_TEMPLE_HEAVEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_JFD_TOWER_LONDON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_VENETIAN_ARSENAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_LocalResourceOrs
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_MINT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,		ResourceType,		YieldType,		Yield)
SELECT	Type,				'RESOURCE_COPPER',	'YIELD_GOLD',	2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits 
		(BuildingType, 						UnitType,					NumUnits)
SELECT	'BUILDING_JFD_HOLLYWOOD',			'UNIT_JFD_GREAT_DIRECTOR',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Building_FreeUnits 
		(BuildingType, 						UnitType,					NumUnits)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL', 	'UNIT_GALLEASS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainProductionModifiers
		(BuildingType,						DomainType,					Modifier)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL',	'DOMAIN_SEA',				50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_UnitCombatProductionModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_UnitCombatProductionModifiers
WHERE BuildingType = 'BUILDING_KREMLIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_MOTHERLAND_CALLS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType,						ResourceType,				Quantity)
SELECT	'BUILDING_JFD_DA_VINCI',			'RESOURCE_JFD_INVENTORS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_CINEMA', 				'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_DA_VINCI', 			'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_DA_VINCI', 			'YIELD_SCIENCE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_GOBEKLI', 			'YIELD_FAITH',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_GOBEKLI', 			'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT', 		'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT', 		'YIELD_SCIENCE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_HOLLYWOOD', 			'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_HOLLYWOOD', 			'YIELD_TOURISM',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_BASILS', 			'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_BASILS', 			'YIELD_FAITH',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_MARKS', 			'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_MARKS', 			'YIELD_GOLD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_ST_MARKS', 			'YIELD_FAITH',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL', 	'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL', 	'YIELD_PRODUCTION',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL', 	'YIELD_GOLD',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CINEMA', 				'FLAVOR_CULTURE',			80
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_GOLD',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DA_VINCI',			'FLAVOR_MILITARY_TRAINING',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_DIRECTORS_GUILD', 	'FLAVOR_CULTURE',			130
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GOBEKLI', 			'FLAVOR_WONDER',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GOBEKLI', 			'FLAVOR_RELIGION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOLLYWOOD', 			'FLAVOR_WONDER',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOLLYWOOD', 			'FLAVOR_CULTURE',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HOLLYWOOD', 			'FLAVOR_GOLD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD' AND Value = 1);

UPDATE Building_Flavors
SET Flavor = 75
WHERE BuildingType = 'BUILDING_KREMLIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_CHANGES_MOTHERLAND_CALLS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_BASILS',			'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_BASILS',			'FLAVOR_RELIGION',			50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_BASILS',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_MARKS',			'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_MARKS',			'FLAVOR_GOLD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_MARKS',			'FLAVOR_RELIGION',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_ST_MARKS',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT', 		'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT', 		'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT',	 	'FLAVOR_RELIGION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GREAT_ZIGGURAT',	 	'FLAVOR_SCIENCE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL',	'FLAVOR_CITY_DEFENSE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_VENETIAN_ARSENAL',	Type,						30
FROM Buildings WHERE Type IN ('FLAVOR_PRODUCTION', 'FLAVOR_NAVAL', 'FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY' AND Value = 1);
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_NATIONAL_TREASURY', 	'BUILDINGCLASS_BANK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_PrereqBuildingClasses WHERE BuildingType = 'BUILDING_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY' AND Value = 1);
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 					BuildingClassType,			NumBuildingNeeded)
SELECT	'BUILDING_NATIONAL_TREASURY', 	'BUILDINGCLASS_BANK',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_BuildCharges
		(BuildingType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_JFD_WORKER',	1
FROM Buildings WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Building_JFD_BuildCharges
		(BuildingType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_WORKER',		1
FROM Buildings WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Building_JFD_BuildCharges
		(BuildingType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_JFD_SLAVE',	1
FROM Buildings WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================


