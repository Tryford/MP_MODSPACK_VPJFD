--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- Buildings
--------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_APOTHECARY',		'BUILDING_JFD_APOTHECARY', 			'TXT_KEY_BUILDING_JFD_APOTHECARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_CISTERN',		'BUILDING_JFD_CISTERN', 			'TXT_KEY_BUILDING_JFD_CISTERN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_GRAIN_SILO',		'BUILDING_JFD_GRAIN_SILO', 			'TXT_KEY_BUILDING_JFD_GRAIN_SILO'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_GROCER',			'BUILDING_JFD_GROCER', 				'TXT_KEY_BUILDING_JFD_GROCER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_HERBALIST', 		'BUILDING_JFD_HERBALIST', 			'TXT_KEY_BUILDING_JFD_HERBALIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description, 							MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_RED_CROSS', 		'BUILDING_JFD_RED_CROSS',			'TXT_KEY_BUILDING_JFD_RED_CROSS', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_SUPERMARKET',	'BUILDING_JFD_SUPERMARKET', 		'TXT_KEY_BUILDING_JFD_SUPERMARKET'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------
-- Wonders
--------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 					Description, 							MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_PONT_DU_GARD',	'BUILDING_JFD_PONT_DU_GARD', 		'TXT_KEY_BUILDING_JFD_PONT_DU_GARD', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 				CivilizationType, 					BuildingType)
SELECT	'BUILDINGCLASS_JFD_PONT_DU_GARD', 	Type, 								NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Dummies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,						BuildingClass,						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help)
SELECT	'BUILDING_JFD_DISEASE',		'BUILDINGCLASS_JFD_CID',			-1,		-1,			0,					-1,				0,			NULL,					100,			'TXT_KEY_BUILDING_JFD_DISEASE',		'TXT_KEY_BUILDING_JFD_DISEASE_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type =			'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,						BuildingClass,						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				NeverCapture,	Description, 						Help)
SELECT	'BUILDING_JFD_HEALTH_FOOD',	'BUILDINGCLASS_JFD_CID',			-1,		-1,			0,					-1,				0,			NULL,					1,				'TXT_KEY_BUILDING_JFD_HEALTH_FOOD',	'TXT_KEY_BUILDING_JFD_HEALTH_FOOD_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_APOTHECARY',	'BUILDINGCLASS_JFD_APOTHECARY',		120,	-1,			2,					0,				0,			'TECH_EDUCATION',		30,				'TXT_KEY_BUILDING_JFD_APOTHECARY',	'TXT_KEY_BUILDING_JFD_APOTHECARY_HELP',		'TXT_KEY_BUILDING_JFD_APOTHECARY_TEXT',		'TXT_KEY_BUILDING_JFD_APOTHECARY_STRATEGY',		0,				0,			'SPECIALIST_JFD_DOCTOR',	1,					-1,				25,					0,				0,			0,				'JFD_HEALTH_BUILDING_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_CISTERN',		'BUILDINGCLASS_JFD_CISTERN',		100,	-1,			2,					0,				0,			'TECH_MATHEMATICS',		30,				'TXT_KEY_BUILDING_JFD_CISTERN',		'TXT_KEY_BUILDING_JFD_CISTERN_HELP',		'TXT_KEY_BUILDING_JFD_CISTERN_TEXT',		'TXT_KEY_BUILDING_JFD_CISTERN_STRATEGY',		1,				40,			NULL,						0,					-1,				25,					0,				0,			0,				'JFD_HEALTH_BUILDING_ATLAS',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_GRAIN_SILO',	'BUILDINGCLASS_JFD_GRAIN_SILO',		500  ,	-1,			4,					0,				0,			'TECH_RAILROAD',		66,				'TXT_KEY_BUILDING_JFD_GRAIN_SILO',	'TXT_KEY_BUILDING_JFD_GRAIN_SILO_HELP',		'TXT_KEY_BUILDING_JFD_GRAIN_SILO_TEXT',		'TXT_KEY_BUILDING_JFD_GRAIN_SILO_STRATEGY',		0,				0,			NULL,						0,					-1,				25,					0,				0,			0,				'JFD_HEALTH_BUILDING_ATLAS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO' AND Value = 1);

INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_GROCER',		'BUILDINGCLASS_JFD_GROCER',			100,	-1,			1,					0,				0,			'TECH_GUILDS',			30,				'TXT_KEY_BUILDING_JFD_GROCER',		'TXT_KEY_BUILDING_JFD_GROCER_HELP',			'TXT_KEY_BUILDING_JFD_GROCER_TEXT',			'TXT_KEY_BUILDING_JFD_GROCER_STRATEGY',			0,				0,			NULL,						0,					-1,				25,					0,				0,			0,				'BW_ATLAS_1',					17
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_HERBALIST',	'BUILDINGCLASS_JFD_HERBALIST',		50,		-1,			1,					0,				0,			'TECH_CALENDAR',		30,				'TXT_KEY_BUILDING_JFD_HERBALIST',	'TXT_KEY_BUILDING_JFD_HERBALIST_HELP',		'TXT_KEY_BUILDING_JFD_HERBALIST_TEXT',		'TXT_KEY_BUILDING_JFD_HERBALIST_STRATEGY',		0,				0,			NULL,						0,					-1,				25,					0,				0,			0,				'JFD_HEALTH_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 						BuildingClass, 						Cost,	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,				ConquestProb,	Description, 						Help, 										Civilopedia,								Strategy,										IsNoRiver,		FoodKept,	SpecialistType,				SpecialistCount,	MinAreaSize,	HurryCostModifier,	NumCityCostMod,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_SUPERMARKET',	'BUILDINGCLASS_JFD_SUPERMARKET',	500,	-1,			3,					0,				0,			'TECH_REFRIGERATION',	30,				'TXT_KEY_BUILDING_JFD_SUPERMARKET',	'TXT_KEY_BUILDING_JFD_SUPERMARKET_HELP',	'TXT_KEY_BUILDING_JFD_SUPERMARKET_TEXT',	'TXT_KEY_BUILDING_JFD_SUPERMARKET_STRATEGY',	0,				0,			NULL,						0,					-1,				25,					0,				0,			0,				'BW_ATLAS_1',					41
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MEDICINE'
WHERE Type = 'BUILDING_JFD_APOTHECARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DOCTOR', SpecialistCount = 2, Help = 'TXT_KEY_BUILDING_JFD_HOSPITAL_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_HOSPITAL_STRATEGY'
WHERE Type = 'BUILDING_HOSPITAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Aqueduct
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_AQUEDUCT_STRATEGY'
WHERE Type = 'BUILDING_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Buildings
SET River = 1
WHERE Type = 'BUILDING_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Garden
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MEDICINE'
WHERE BuildingClass = 'BUILDINGCLASS_GARDEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN' AND Value = 1);

--Longhouse
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_LONGHOUSE_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_LONGHOUSE_STRATEGY'
WHERE Type = 'BUILDING_LONGHOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE' AND Value = 1);

--Monastery
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_HEALTH', Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_HEALTH'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY' AND Value = 1);

--Stadium
UPDATE Buildings
SET PrereqTech = 'TECH_RADIO'
WHERE BuildingClass = 'BUILDINGCLASS_STADIUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Recycling Center
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_RECYCLING_CENTER_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_RECYCLING_CENTER_STRATEGY'
WHERE Type = 'BUILDING_RECYCLING_CENTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_GARDEN', 'BUILDINGCLASS_STADIUM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0)
BEGIN
	UPDATE Buildings
	SET River = 1
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_MEDICINE'
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_GARDEN'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN' AND Value = 1);

	UPDATE Buildings
	SET PrereqTech = 'TECH_RADIO'
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_STADIUM'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,							BuildingClass,						PrereqTech,				MaxStartEra, 		River,	Cost,	TrainedFreePromotion,	SpecialistType, 		GreatPeopleRateChange,  FreeBuildingThisCity,		Description,							Help, 										Civilopedia,								Strategy,									NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 							PortraitIndex)
SELECT	'BUILDING_JFD_RED_CROSS',		'BUILDINGCLASS_JFD_RED_CROSS',		'TECH_BIOLOGY',			NULL,				0,		125,	'PROMOTION_MEDIC',		NULL,					0,						NULL,						'TXT_KEY_BUILDING_JFD_RED_CROSS',		'TXT_KEY_BUILDING_JFD_RED_CROSS_HELP',		'TXT_KEY_BUILDING_JFD_RED_CROSS_TEXT',		'TXT_KEY_BUILDING_JFD_RED_CROSS_STRATEGY',	30,				1,			-1,					-1,				1,				'JFD_HEALTH_NATIONAL_WONDER_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass, 						PrereqTech, 			MaxStartEra, 		River,	Cost, 	TrainedFreePromotion,	SpecialistType, 		GreatPeopleRateChange, 	FreeBuildingThisCity,		Description, 							Help, 										Civilopedia, 								Quote, 										NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 							PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_PONT_DU_GARD',    'BUILDINGCLASS_JFD_PONT_DU_GARD',	'TECH_ENGINEERING',		'ERA_MEDIEVAL',		1,		300,	NULL,					'SPECIALIST_ENGINEER',	2,						'BUILDINGCLASS_AQUEDUCT',	'TXT_KEY_BUILDING_JFD_PONT_DU_GARD',	'TXT_KEY_WONDER_JFD_PONT_DU_GARD_HELP',		'TXT_KEY_WONDER_JFD_PONT_DU_GARD_PEDIA',	'TXT_KEY_WONDER_JFD_PONT_DU_GARD_QUOTE',	0,				1,			-1,					-1,				100,			'JFD_HEALTH_WONDER_ATLAS',			0,				'AS2D_WONDER_SPEECH_JFD_PONT_DU_GARD',	'Wonder_PontDuGard.dds',	'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

--Alhambra
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DOCTOR', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_ALHAMBRA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

--Angkor Wat
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MEDICINE', Cost = 300, GlobalPlotCultureCostModifier = 0, GlobalPlotBuyCostModifier = 0, Help = 'TXT_KEY_BUILDING_JFD_ANGKOR_WAT_HELP'
WHERE Type = 'BUILDING_ANGKOR_WAT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT' AND Value = 1);

--Great Wall
UPDATE Buildings
SET PrereqTech = 'TECH_IRON_WORKING'
WHERE Type = 'BUILDING_GREAT_WALL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_CHANGES_GREAT_WALL' AND Value = 1);

UPDATE Buildings
SET FreeBuilding = 'BUILDINGCLASS_WALLS', FreeBuildingThisCity = NULL, Help = 'TXT_KEY_BUILDING_JFD_GREAT_WALL_HELP', Cost = 300
WHERE Type = 'BUILDING_GREAT_WALL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_GREAT_WALL' AND Value = 1);

--Hanging Gardens
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DOCTOR', GreatPeopleRateChange = 2, Help = 'TXT_KEY_BUILDING_JFD_HANGING_GARDENS_HELP', FreeBuildingThisCity = 'BUILDINGCLASS_GARDEN'
WHERE Type = 'BUILDING_HANGING_GARDEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

--Temple of Artemis
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DOCTOR', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_TEMPLE_ARTEMIS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_TEMPLE_ARTEMIS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HealthMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_HealthMods 
		(BuildingType, 						DiseasePopMod)
SELECT	'BUILDING_HOSPITAL', 				-33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_JFD_HealthMods 
		(BuildingType, 						HealthToFoodMod)
SELECT	'BUILDING_JFD_PONT_DU_GARD', 		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_APOTHECARY', 			'BUILDINGCLASS_JFD_HERBALIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_HOSPITAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_HOSPITAL', 				'BUILDINGCLASS_JFD_APOTHECARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_GRAIN_SILO', 			'BUILDINGCLASS_GRANARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_RED_CROSS', 			'BUILDINGCLASS_HOSPITAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HealthMods
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_HealthMods 
		(BuildingType, 						GlobalPlagueMod)
SELECT	'BUILDING_JFD_RED_CROSS',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 						BuildingClassType,			NumBuildingNeeded)
SELECT	'BUILDING_JFD_RED_CROSS',			'BUILDINGCLASS_HOSPITAL',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_PONT_DU_GARD',		'YIELD_JFD_HEALTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,					Yield)
SELECT	'BUILDING_JFD_HEALTH_FOOD',			'YIELD_FOOD',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DISEASE',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_STONE_WORKS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DISEASE',		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DISEASE',		3
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building_YieldChanges
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_STONE_WORKS', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL', 'BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,					Yield)
	SELECT	Type,							'YIELD_JFD_DISEASE',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_STONE_WORKS');

	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,					Yield)
	SELECT	Type,							'YIELD_JFD_DISEASE',		2
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL');

	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,					Yield)
	SELECT	Type,							'YIELD_JFD_DISEASE',		3
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AIRPORT');
END;

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_ALHAMBRA',				'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_ANGKOR_WAT',				'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_ANGKOR_WAT',				'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_APOTHECARY',			'YIELD_JFD_HEALTH',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_CISTERN',				'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_CHICHEN_ITZA',			'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_CHICHEN_ITZA' AND Value = 1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_HANGING_GARDEN' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS' AND Value = 1);
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_HANGING_GARDEN',			'YIELD_JFD_HEALTH',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_HERBALIST',			'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Building_YieldChanges
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE BuildingType = 'BUILDING_HOSPITAL' and YieldType = 'YIELD_FOOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_FLOATING_GARDENS',		'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_FLOATING_GARDENS' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_GRAIN_SILO',			'YIELD_FOOD',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_MEDICAL_LAB',				'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_PONT_DU_GARD',		'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_PONT_DU_GARD',		'YIELD_FOOD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_TEMPLE_ARTEMIS',			'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_TEMPLE_ARTEMIS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_LONGHOUSE' AND YieldType = 'YIELD_FOOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE' AND Value = 1);
INSERT INTO Building_FeatureYieldChanges		
		(BuildingType, 					FeatureType,				YieldType,					Yield)
SELECT	'BUILDING_LONGHOUSE',			'FEATURE_FOREST',			'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE' AND Value = 1);

INSERT INTO Building_FeatureYieldChanges		
		(BuildingType, 					FeatureType,				YieldType,					Yield)
SELECT	'BUILDING_JFD_HERBALIST',		'FEATURE_FLOOD_PLAINS',		'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_FeatureYieldChanges		
		(BuildingType, 					FeatureType,				YieldType,					Yield)
SELECT	'BUILDING_JFD_HERBALIST',		'FEATURE_JUNGLE',			'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChangesGlobal
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChangesGlobal		
		(BuildingType, 					ImprovementType,			YieldType,					Yield)
SELECT	'BUILDING_ANGKOR_WAT',			'IMPROVEMENT_HOLY_SITE',	'YIELD_JFD_HEALTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassYieldChanges		
		(BuildingType, 					BuildingClassType,			YieldType,					YieldChange)
SELECT	'BUILDING_HANGING_GARDEN',		'BUILDINGCLASS_GARDEN',		'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_LocalResourceOrs
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_LocalResourceOrs 
		(BuildingType, 					ResourceType)
SELECT	'BUILDING_JFD_GROCER',			Type
FROM Resources WHERE Type IN ('RESOURCE_COCOA', 'RESOURCE_SPICES', 'RESOURCE_SUGAR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_LocalResourceOrs 
		(BuildingType, 					ResourceType)
SELECT	'BUILDING_JFD_SUPERMARKET',		Type
FROM Resources WHERE Type IN ('RESOURCE_DEER', 'RESOURCE_FISH', 'RESOURCE_COW', 'RESOURCE_SHEEP', 'RESOURCE_WHEAT', 'RESOURCE_BANANA', 'RESOURCE_BISON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,		HelpText,											IsWrittenFirst)
SELECT	Type,				'TXT_KEY_BUILDING_JFD_AQUEDUCT_HELP_HEALTH',		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,		HelpText)
SELECT	Type,				'TXT_KEY_BUILDING_JFD_AQUEDUCT_HELP_HEALTH_REQ'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,		HelpText)
SELECT	Type,				'TXT_KEY_BUILDING_JFD_FACTORY_HELP_HEALTH'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 0);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,			HelpText,										IsWrittenFirst)
SELECT	Type,					'TXT_KEY_BUILDING_JFD_HARBOUR_HELP',			1
FROM Buildings WHERE Type = Type AND BuildingClass = 'BUILDINGCLASS_HARBOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND NOT EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,		HelpText,											IsWrittenFirst)
SELECT	Type,				'TXT_KEY_BUILDING_JFD_HARBOUR_HELP_ML',				1
FROM Buildings WHERE Type = Type AND BuildingClass = 'BUILDINGCLASS_HARBOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');

CREATE TRIGGER JFDCID_Health_Building_HelpTexts
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_HARBOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_JFD_HelpTexts
			(BuildingType,		HelpText,										IsWrittenFirst)
	SELECT	Type,				'TXT_KEY_BUILDING_JFD_AQUEDUCT_HELP_HEALTH',	1
	FROM Buildings WHERE Type = NEW.Type  AND BuildingClass = 'BUILDINGCLASS_AQUEDUCT';

	INSERT INTO Building_JFD_HelpTexts
			(BuildingType,		HelpText)
	SELECT	Type,				'TXT_KEY_BUILDING_JFD_AQUEDUCT_HELP_HEALTH_REQ'
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

	INSERT INTO Building_JFD_HelpTexts
			(BuildingType,		HelpText)
	SELECT	Type,				'TXT_KEY_BUILDING_JFD_FACTORY_HELP_HEALTH'
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_FACTORY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 0);

	INSERT INTO Building_JFD_HelpTexts
			(BuildingType,		HelpText,										IsWrittenFirst)
	SELECT	Type,				'TXT_KEY_BUILDING_JFD_HARBOUR_HELP',			1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR'
	AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');

	INSERT INTO Building_JFD_HelpTexts
			(BuildingType,		HelpText,										IsWrittenFirst)
	SELECT	Type,				'TXT_KEY_BUILDING_JFD_HARBOUR_HELP_ML',			1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR'
	AND NOT EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,		YieldType,				Yield)
SELECT	Type,					'RESOURCE_COAL',	'YIELD_JFD_DISEASE',	2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 0);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,		YieldType,				Yield)
SELECT	'BUILDING_JFD_GROCER',	Type,				'YIELD_JFD_HEALTH',		1
FROM Resources WHERE Type IN ('RESOURCE_COCOA', 'RESOURCE_SPICES', 'RESOURCE_SUGAR', 'RESOURCE_JFD_VANILLA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,		YieldType,				Yield)
SELECT	'BUILDING_HARBOR',		Type,				'YIELD_JFD_HEALTH',		1
FROM Resources WHERE Type IN ('RESOURCE_FISH', 'RESOURCE_CORAL', 'RESOURCE_WHALE', 'RESOURCE_CRAB', 'RESOURCE_PEARLS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,		YieldType,				Yield)
SELECT	'BUILDING_MONASTERY',	Type,				'YIELD_JFD_HEALTH',		1
FROM Resources WHERE Type IN ('RESOURCE_WINE', 'RESOURCE_INCENSE', 'RESOURCE_JFD_SAFFRON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 					ResourceType,		YieldType,				Yield)
SELECT	'BUILDING_JFD_SUPERMARKET',		Type,				'YIELD_JFD_HEALTH',		1
FROM Resources WHERE Type IN ('RESOURCE_DEER', 'RESOURCE_COW', 'RESOURCE_SHEEP', 'RESOURCE_WHEAT', 'RESOURCE_BANANA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building_ResourceYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_HARBOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_COAL',	'YIELD_JFD_DISEASE',	2
	FROM Buildings WHERE NEW.BuildingClass = 'BUILDINGCLASS_FACTORY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 0);

	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_FISH',	'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR';

	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_CORAL',	'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR'
	AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');

	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_PEARLS',	'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR';

	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_CRAB',	'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR';

	INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 		ResourceType,		YieldType,				Yield)
	SELECT	Type,				'RESOURCE_WHALE',	'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HARBOR';
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_LakePlotYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_LakePlotYieldChanges
		(BuildingType,					YieldType,				Yield)
SELECT	'BUILDING_AQUEDUCT',			'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_LakePlotYieldChanges
		(BuildingType,					YieldType,				Yield)
SELECT	'BUILDING_JFD_CISTERN',			'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building_LakePlotYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_JFD_CISTERN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1)
BEGIN
	INSERT INTO Building_LakePlotYieldChanges
			(BuildingType,		YieldType,				Yield)
	SELECT	Type,				'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type;
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_RiverPlotYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_RiverPlotYieldChanges
		(BuildingType,			YieldType,				Yield)
SELECT	Type,					'YIELD_JFD_HEALTH',		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building_RiverPlotYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_RiverPlotYieldChanges
			(BuildingType,		YieldType,				Yield)
	SELECT	Type,				'YIELD_JFD_HEALTH',		1
	FROM Buildings WHERE Type = NEW.Type;
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_GROWTH',			-5
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_STONE_WORKS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_GROWTH',			-15
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_GROWTH',			-20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_CITY_DEFENSE',		20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_TILE_IMPROVEMENT',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	Type,							'FLAVOR_EXPANSION',			10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Health_Building_Flavors
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL', 'BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_GROWTH',			-5
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_FORGE', 'BUILDINGCLASS_STONE_WORKS');

	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_GROWTH',			-15
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_EE_CLOTH_MILL');

	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_GROWTH',			-20
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AIRPORT');

	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_CITY_DEFENSE',		20
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AQUEDUCT');

	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_TILE_IMPROVEMENT',	20
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AQUEDUCT');

	INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
	SELECT	Type,						'FLAVOR_EXPANSION',			10
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AQUEDUCT');
END;

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_APOTHECARY',		'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_APOTHECARY',		'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_APOTHECARY',		'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CISTERN',			'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CISTERN',			'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CISTERN',			'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GRAIN_SILO',		'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HERBALIST',		'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HERBALIST',		'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HERBALIST',		'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GROCER',			'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GROCER',			'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_GROCER',			'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_PONT_DU_GARD',	'FLAVOR_GROWTH',			50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_PONT_DU_GARD',	'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_PONT_DU_GARD',	'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_PONT_DU_GARD',	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_RED_CROSS', 		Type, 						10
FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE', 'FLAVOR_EXPANSION', 'FLAVOR_HAPPINESS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_RED_CROSS', 		Type, 						40
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GROWTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPERMARKET',		'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPERMARKET',		'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPERMARKET',		'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_RECYCLING_CENTER',	'FLAVOR_GROWTH',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_RECYCLING_CENTER',	'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_RECYCLING_CENTER',	'FLAVOR_SCIENCE',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================