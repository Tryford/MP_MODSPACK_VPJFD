--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_BLAST_FURNACE', 	'BUILDING_JFD_BLAST_FURNACE', 				'TXT_KEY_BUILDING_JFD_BLAST_FURNACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_COAL_PLANT', 	'BUILDING_JFD_COAL_PLANT', 					'TXT_KEY_BUILDING_JFD_COAL_PLANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_HORSE_MILL', 	'BUILDING_JFD_HORSE_MILL', 					'TXT_KEY_BUILDING_JFD_HORSE_MILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_OIL_REFINERY', 	'BUILDING_JFD_OIL_REFINERY', 				'TXT_KEY_BUILDING_JFD_OIL_REFINERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_WIND_FARM',		'BUILDING_JFD_WIND_FARM', 					'TXT_KEY_BUILDING_JFD_WIND_FARM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 								DefaultBuilding, 							Description, 							MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_THREE_GORGES',	'BUILDING_JFD_THREE_GORGES', 				'TXT_KEY_BUILDING_JFD_THREE_GORGES', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 							BuildingType)
SELECT	Type, 								'BUILDINGCLASS_JFD_THREE_GORGES', 			NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type, 								Cost, 	GoldMaintenance,	SpecialistCount,	SpecialistType,			PrereqTech,					BuildingClass, 						Description, 							Help, 										Civilopedia,								Strategy,										MinAreaSize,	HurryCostModifier,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_COAL_PLANT',			330,	2,					0,					NULL,					'TECH_STEAM_POWER',			'BUILDINGCLASS_JFD_COAL_PLANT',		'TXT_KEY_BUILDING_JFD_COAL_PLANT',		'TXT_KEY_BUILDING_JFD_COAL_PLANT_HELP',		'TXT_KEY_BUILDING_JFD_COAL_PLANT_TEXT',		'TXT_KEY_BUILDING_JFD_COAL_PLANT_STRATEGY',		-1,				0,					66,				0,			0,				'BW_ATLAS_1',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Buildings
		(Type, 								Cost, 	GoldMaintenance,	SpecialistCount,	SpecialistType,			PrereqTech,					BuildingClass, 						Description, 							Help, 										Civilopedia,								Strategy,										MinAreaSize,	HurryCostModifier,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_BLAST_FURNACE',		330,	1,					2,					'SPECIALIST_ENGINEER',	'TECH_INDUSTRIALIZATION',	'BUILDINGCLASS_JFD_BLAST_FURNACE',	'TXT_KEY_BUILDING_JFD_BLAST_FURNACE',	'TXT_KEY_BUILDING_JFD_BLAST_FURNACE_HELP',	'TXT_KEY_BUILDING_JFD_BLAST_FURNACE_TEXT',	'TXT_KEY_BUILDING_JFD_BLAST_FURNACE_STRATEGY',	-1,				0,					66,				0,			0,				'JFD_POWER_BUILDING_ATLAS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

INSERT INTO Buildings
		(Type, 								Cost, 	GoldMaintenance,	SpecialistCount,	SpecialistType,			PrereqTech,					BuildingClass, 						Description, 							Help, 										Civilopedia,								Strategy,										MinAreaSize,	HurryCostModifier,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_HORSE_MILL',			200,	1,					0,					NULL,					'TECH_MACHINERY',			'BUILDINGCLASS_JFD_HORSE_MILL',		'TXT_KEY_BUILDING_JFD_HORSE_MILL',		'TXT_KEY_BUILDING_JFD_HORSE_MILL_HELP',		'TXT_KEY_BUILDING_JFD_HORSE_MILL_TEXT',		'TXT_KEY_BUILDING_JFD_HORSE_MILL_STRATEGY',		-1,				0,					66,				0,			0,				'JFD_POWER_BUILDING_ATLAS',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL' AND Value = 1);

INSERT INTO Buildings
		(Type, 								Cost, 	GoldMaintenance,	SpecialistCount,	SpecialistType,			PrereqTech,					BuildingClass, 						Description, 							Help, 										Civilopedia,								Strategy,										MinAreaSize,	HurryCostModifier,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_OIL_REFINERY',		330,	2,					0,					NULL,					'TECH_STEAM_POWER',			'BUILDINGCLASS_JFD_OIL_REFINERY',	'TXT_KEY_BUILDING_JFD_OIL_REFINERY',	'TXT_KEY_BUILDING_JFD_OIL_REFINERY_HELP',	'TXT_KEY_BUILDING_JFD_OIL_REFINERY_TEXT',	'TXT_KEY_BUILDING_JFD_OIL_REFINERY_STRATEGY',	-1,				0,					66,				0,			0,				'JFD_POWER_BUILDING_ATLAS',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Buildings
		(Type, 								Cost, 	GoldMaintenance,	SpecialistCount,	SpecialistType,			PrereqTech,					BuildingClass, 						Description, 							Help, 										Civilopedia,								Strategy,										MinAreaSize,	HurryCostModifier,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_WIND_FARM',			250,	1,					0,					NULL,					'TECH_REPLACEABLE_PARTS',	'BUILDINGCLASS_JFD_WIND_FARM',		'TXT_KEY_BUILDING_JFD_WIND_FARM',		'TXT_KEY_BUILDING_JFD_WIND_FARM_HELP',		'TXT_KEY_BUILDING_JFD_WIND_FARM_TEXT',		'TXT_KEY_BUILDING_JFD_WIND_FARM_STRATEGY',		-1,				0,					66,				0,			0,				'JFD_POWER_BUILDING_ATLAS',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM' AND Value = 1);

--Coal Plant
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_COAL_PLANT_HELP_HEALTH', GoldMaintenance = 1
WHERE Type = 'BUILDING_JFD_COAL_PLANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Factory
UPDATE Buildings
SET SpecialistType = NULL, SpecialistCount = 0, GoldMaintenance = 2
WHERE BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

CREATE TRIGGER JFDCID_Power_Building
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass = 'BUILDINGCLASS_FACTORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET SpecialistType = NULL, SpecialistCount = 0, GoldMaintenance = 2
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_FACTORY';
END;

--Oil Refinery
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_OIL_REFINERY_HELP_HEALTH', GoldMaintenance = 1
WHERE Type = 'BUILDING_JFD_OIL_REFINERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass, 							FreeBuildingThisCity,			Cost, 	River,	PrereqTech, 		MaxStartEra, 	SpecialistType, 		GreatPeopleRateChange, 	Description, 							Help, 									Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 		PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 					WonderSplashAnchor)
SELECT	'BUILDING_JFD_THREE_GORGES',	'BUILDINGCLASS_JFD_THREE_GORGES',		'BUILDINGCLASS_HYDRO_PLANT',	1250,	1,		'TECH_ECOLOGY',		'ERA_FUTURE',   'SPECIALIST_ENGINEER',	3,						'TXT_KEY_BUILDING_JFD_THREE_GORGES',	'TXT_KEY_WONDER_JFD_THREE_GORGES_HELP',	'TXT_KEY_WONDER_JFD_THREE_GORGES_PEDIA',	'TXT_KEY_WONDER_JFD_THREE_GORGES_QUOTE',	1,			-1,					-1,				100,			'BW_ATLAS_2',	28,				'AS2D_WONDER_SPEECH_JFD_THREE_GORGES',	'WonderConceptThreeGeorgesDam.dds',	'L,T'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);

--Big Ben
UPDATE Buildings
SET PrereqTech = 'TECH_RIFLING'
WHERE BuildingClass = 'BUILDINGCLASS_BIG_BEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_TECH_CHANGES_BIG_BEN' AND Value = 1);

--Public Transportation System
UPDATE Buildings
SET PrereqTech = NULL
WHERE BuildingClass = 'BUILDINGCLASS_DECISIONS_PUBLICTRANSPORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_BLAST_FURNACE',	'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_BLAST_FURNACE',	'YIELD_JFD_DISEASE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_COAL_PLANT',		'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_COAL_PLANT',		'YIELD_JFD_DISEASE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_HORSE_MILL',		'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'YIELD_PRODUCTION',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'YIELD_JFD_DISEASE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_WIND_FARM',		'YIELD_PRODUCTION',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_THREE_GORGES',	'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,					Yield)
SELECT	'BUILDING_JFD_THREE_GORGES',	'YIELD_PRODUCTION',			4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 					ResourceType,				YieldType,				Yield)
SELECT	'BUILDING_JFD_COAL_PLANT',		'RESOURCE_COAL',			'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 					ResourceType,				YieldType,				Yield)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'RESOURCE_OIL',				'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_BLAST_FURNACE',	'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COAL_PLANT',		'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COAL_PLANT',		'FLAVOR_GROWTH',			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HORSE_MILL',		'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'FLAVOR_GROWTH',			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_WIND_FARM',		'FLAVOR_PRODUCTION',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_THREE_GORGES',	'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 					FlavorType,					Flavor)
SELECT	'BUILDING_JFD_THREE_GORGES',	'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantityRequirements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	'BUILDING_JFD_BLAST_FURNACE',	'RESOURCE_IRON',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	'BUILDING_JFD_COAL_PLANT',		'RESOURCE_COAL',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	'BUILDING_JFD_HORSE_MILL',		'RESOURCE_HORSE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'RESOURCE_OIL',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	'BUILDING_JFD_WIND_FARM',		'RESOURCE_ALUMINUM',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	Type,							'RESOURCE_JFD_POWER',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_WORKSHOP')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	Type,							'RESOURCE_JFD_POWER',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_EE_CLOTH_MILL', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_JFD_CINEMA', 'BUILDINGCLASS_JFD_PRISON', 'BUILDINGCLASS_JFD_GRAIN_SILO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	Type,							'RESOURCE_JFD_POWER',		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_AIRPORT', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_HOSPITAL', 'BUILDINGCLASS_LABORATORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantityRequirements 
		(BuildingType, 					ResourceType,				Cost)
SELECT	Type,							'RESOURCE_JFD_POWER',		3
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_RECYCLING_CENTER', 'BUILDINGCLASS_SPACESHIP_FACTORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Power_Building_ResourceQuantityRequirements
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_WORKSHOP', 'BUILDINGCLASS_EE_CLOTH_MILL', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_RECYCLING_CENTER', 'BUILDINGCLASS_SPACESHIP_FACTORY', 'BUILDINGCLASS_AIRPORT', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_HOSPITAL', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_JFD_CINEMA', 'BUILDINGCLASS_JFD_PRISON', 'BUILDINGCLASS_JFD_GRAIN_SILO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_ResourceQuantityRequirements 
			(BuildingType, 					ResourceType,				Cost)
	SELECT	Type,							'RESOURCE_JFD_POWER',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WORKSHOP', 'BUILDINGCLASS_EE_CLOTH_MILL', 'BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_JFD_CINEMA', 'BUILDINGCLASS_JFD_PRISON', 'BUILDINGCLASS_JFD_GRAIN_SILO');
	
	INSERT INTO Building_ResourceQuantityRequirements 
			(BuildingType, 					ResourceType,				Cost)
	SELECT	Type,							'RESOURCE_JFD_POWER',		2
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_AIRPORT', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_HOSPITAL', 'BUILDINGCLASS_LABORATORY');
	
	INSERT INTO Building_ResourceQuantityRequirements 
			(BuildingType, 					ResourceType,				Cost)
	SELECT	Type,							'RESOURCE_JFD_POWER',		3
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_RECYCLING_CENTER', 'BUILDINGCLASS_SPACESHIP_FACTORY');

	INSERT INTO Building_ResourceQuantityRequirements 
			(BuildingType, 					ResourceType,				Cost)
	SELECT	Type,							'RESOURCE_JFD_POWER',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_WORKSHOP'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL' AND Value = 1);
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity 
		(BuildingType, 					ResourceType,				Quantity)
SELECT	'BUILDING_JFD_THREE_GORGES',	'RESOURCE_JFD_POWER',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);

INSERT INTO Building_ResourceQuantity 
		(BuildingType, 					ResourceType,				Quantity)
SELECT	Type,							'RESOURCE_JFD_POWER',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_WATERMILL')
AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = Type AND ResourceType = 'RESOURCE_JFD_POWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL' AND Value = 1);

INSERT INTO Building_ResourceQuantity 
		(BuildingType, 					ResourceType,				Quantity)
SELECT	Type,							'RESOURCE_JFD_POWER',		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_JFD_HORSE_MILL')
AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = Type AND ResourceType = 'RESOURCE_JFD_POWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL' AND Value = 1);

INSERT INTO Building_ResourceQuantity 
		(BuildingType, 					ResourceType,				Quantity)
SELECT	Type,							'RESOURCE_JFD_POWER',		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_COAL_PLANT', 'BUILDINGCLASS_JFD_WIND_FARM', 'BUILDINGCLASS_JFD_OIL_REFINERY')
AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = Type AND ResourceType = 'RESOURCE_JFD_POWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantity 
		(BuildingType, 					ResourceType,				Quantity)
SELECT	Type,							'RESOURCE_JFD_POWER',		3
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_WIND_PLANT', 'BUILDINGCLASS_COAL_PLANT', 'BUILDINGCLASS_SOLAR_PLANT', 'BUILDINGCLASS_NUCLEAR_PLANT', 'BUILDINGCLASS_HYDRO_PLANT')
AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = Type AND ResourceType = 'RESOURCE_JFD_POWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Power_Building_ResourceQuantity
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_JFD_COAL_PLANT', 'BUILDINGCLASS_WIND_PLANT', 'BUILDINGCLASS_COAL_PLANT', 'BUILDINGCLASS_JFD_OIL_REFINERY', 'BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_JFD_FACTORY', 'BUILDINGCLASS_SOLAR_PLANT', 'BUILDINGCLASS_NUCLEAR_PLANT', 'BUILDINGCLASS_HYDRO_PLANT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_ResourceQuantity 
			(BuildingType, 				ResourceType,				Quantity)
	SELECT	Type,						'RESOURCE_JFD_POWER',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WATERMILL')
	AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = NEW.Type AND ResourceType = 'RESOURCE_JFD_POWER');
	
	INSERT INTO Building_ResourceQuantity 
			(BuildingType, 				ResourceType,				Quantity)
	SELECT	Type,						'RESOURCE_JFD_POWER',		2
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_JFD_COAL_PLANT', 'BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_JFD_WIND_FARM', 'BUILDINGCLASS_JFD_OIL_REFINERY')
	AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = NEW.Type AND ResourceType = 'RESOURCE_JFD_POWER');
	
	INSERT INTO Building_ResourceQuantity 
			(BuildingType, 				ResourceType,				Quantity)
	SELECT	Type,						'RESOURCE_JFD_POWER',		3
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WIND_PLANT', 'BUILDINGCLASS_COAL_PLANT', 'BUILDINGCLASS_SOLAR_PLANT', 'BUILDINGCLASS_NUCLEAR_PLANT', 'BUILDINGCLASS_HYDRO_PLANT')
	AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = NEW.Type AND ResourceType = 'RESOURCE_JFD_POWER');
END;

CREATE TRIGGER JFDCID_Power_Building_ResourceQuantityPreIndustrial
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_WINDMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL' AND Value = 1)
BEGIN
	INSERT INTO Building_ResourceQuantity 
			(BuildingType, 				ResourceType,				Quantity)
	SELECT	Type,						'RESOURCE_JFD_POWER',		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WATERMILL')
	AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = NEW.Type AND ResourceType = 'RESOURCE_JFD_POWER');
	
	INSERT INTO Building_ResourceQuantity 
			(BuildingType, 				ResourceType,				Quantity)
	SELECT	Type,						'RESOURCE_JFD_POWER',		2
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WINDMILL')
	AND NOT EXISTS (SELECT BuildingType FROM Building_ResourceQuantity WHERE BuildingType = NEW.Type AND ResourceType = 'RESOURCE_JFD_POWER');
END;
--==========================================================================================================================
--==========================================================================================================================