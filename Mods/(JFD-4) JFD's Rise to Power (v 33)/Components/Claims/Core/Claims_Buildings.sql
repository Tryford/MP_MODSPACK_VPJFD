--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_CHANCERY', 			'BUILDING_JFD_CHANCERY',			'TXT_KEY_BUILDING_JFD_CHANCERY',			-1,						-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_HIGH_COURT',			'BUILDING_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT',			-1,						-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'BUILDING_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATES_COURT',	-1,						-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
-------------------------
-- National Wonders
-------------------------
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_COURT_CHANCERY',		'BUILDING_JFD_COURT_CHANCERY',		'TXT_KEY_BUILDING_JFD_COURT_CHANCERY', 		1,						-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_SUPREME_COURT',		'BUILDING_JFD_SUPREME_COURT',		'TXT_KEY_JFD_SUPREME_COURT',				1,						-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
-------------------------
-- Wonders
-------------------------
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_FORUM_ROMANUM', 		'BUILDING_JFD_FORUM_ROMANUM',		'TXT_KEY_BUILDING_JFD_FORUM_ROMANUM', 		-1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 								MaxPlayerInstances,		MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_WESTMINSTER', 		'BUILDING_JFD_WESTMINSTER',			'TXT_KEY_BUILDING_JFD_WESTMINSTER', 		-1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

--Judiciary Court
UPDATE BuildingClasses
SET MaxPlayerInstances = -1
WHERE Type = 'BUILDINGCLASS_DECISIONS_NATIONALCOURT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_FORUM_ROMANUM', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_WESTMINSTER', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CHANCERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHANCERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HIGH_COURT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MAGISTRATES_COURT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SUPREME_COURT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_SUPREME_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type, 								SpecialistType,					SpecialistCount,	BuildingProductionModifier,	MilitaryProductionModifier,	 Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, PrereqTech,				BuildingClass, 							Description, 								Help, 											Civilopedia,									Strategy,											ArtDefineTag,	 MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_CHANCERY',			'SPECIALIST_JFD_DIGNITARY',		2,					0,							15,							 160,	-1,			2,					0,				'TECH_CIVIL_SERVICE',	'BUILDINGCLASS_JFD_CHANCERY',			'TXT_KEY_BUILDING_JFD_CHANCERY',			'TXT_KEY_BUILDING_JFD_CHANCERY_HELP', 			'TXT_KEY_BUILDING_JFD_CHANCERY_TEXT',			'TXT_KEY_BUILDING_JFD_CHANCERY_STRATEGY',			NULL,			 -1,			25,					0,				30,				0,			0,				'TECH_ATLAS_1',					47
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 								SpecialistType,					SpecialistCount,	BuildingProductionModifier,	MilitaryProductionModifier,	 Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, PrereqTech,				BuildingClass, 							Description, 								Help, 											Civilopedia,									Strategy,											ArtDefineTag,	 MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_HIGH_COURT',			'SPECIALIST_JFD_MAGISTRATE',	2,					15,							0,							 160,	-1,			2,					0,				'TECH_BANKING',			'BUILDINGCLASS_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT_HELP', 		'TXT_KEY_BUILDING_JFD_HIGH_COURT_TEXT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT_STRATEGY',			'COURTHOUSE',	 -1,			25,					0,				30,				0,			0,				'JFD_CLAIMS_BUILDING_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 								SpecialistType,					SpecialistCount,	BuildingProductionModifier,	MilitaryProductionModifier,	 Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, PrereqTech,				BuildingClass, 							Description, 								Help, 											Civilopedia,									Strategy,											ArtDefineTag,	 MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_MAGISTRATE_COURT',	'SPECIALIST_JFD_MAGISTRATE',	1,					10,							0,							 80,	-1,			1,					0,				'TECH_WRITING',			'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_HELP', 	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_TEXT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_STRATEGY',	'COURTHOUSE',	 -1,			25,					0,				30,				0,			0,				'JFD_CLAIMS_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--Forge
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_FORGE_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_FORGE_STRATEGY'
WHERE Type = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);

--High Court
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_JURISPRUDENCE'
WHERE Type = 'BUILDING_JFD_HIGH_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

--Magistrate's Court
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE Type = 'BUILDING_JFD_MAGISTRATE_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NOBILITY'
WHERE Type = 'BUILDING_JFD_CHANCERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

--Constabulary
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_JURISPRUDENCE'
WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

--Windmill
UPDATE Buildings
SET BuildingProductionModifier = 0
WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_WINDMILL_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_WINDMILL_STRATEGY'
WHERE Type = 'BUILDING_WINDMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);

--Triggers
CREATE TRIGGER JFDRTP_Claims_Buildings
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_WINDMILL')
BEGIN
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_JURISPRUDENCE'
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_CONSTABLE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);	

	UPDATE Buildings
	SET BuildingProductionModifier = 0
	WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_WINDMILL'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);	
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,								BuildingClass,						PrereqTech,				Cost,	SpecialistType,					GreatPeopleRateChange,	GoldenAgeModifier,	Description,									Help, 												Strategy, 												Civilopedia,										NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_COURT_CHANCERY',		'BUILDINGCLASS_JFD_COURT_CHANCERY',	'TECH_CHIVALRY',		125,	'SPECIALIST_JFD_DIGNITARY',		3,						25,					'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY',	'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY_HELP',	'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY_STRATEGY',	'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY_TEXT',	30,				1,			-1,					-1,				1,				'TECH_ATLAS_1',					26
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,						PrereqTech,				Cost,	SpecialistType,					GreatPeopleRateChange,	GoldenAgeModifier,	Description,									Help, 												Strategy, 												Civilopedia,										NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_SUPREME_COURT',		'BUILDINGCLASS_JFD_SUPREME_COURT',	'TECH_ARCHITECTURE',	125,	'SPECIALIST_JFD_MAGISTRATE',	3,						25,					'TXT_KEY_BUILDING_JFD_SUPREME_COURT',			'TXT_KEY_BUILDING_JFD_SUPREME_COURT_HELP', 			'TXT_KEY_BUILDING_JFD_SUPREME_COURT_TEXT',				'TXT_KEY_BUILDING_JFD_SUPREME_COURT_STRATEGY',		30,				1,			-1,					-1,				1,				'JFD_CLAIMS_BUILDING_ATLAS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--Code of Laws
UPDATE Buildings
SET Cost = -1, GreatWorkCount = -1, PrereqTech = NULL
WHERE Type = 'BUILDING_DECISIONS_CODEOFLAWS';

--Court of Chancery
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NOBILITY'
WHERE Type = 'BUILDING_JFD_COURT_CHANCERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

--Judiciary Court
UPDATE Buildings
SET Cost = -1, GreatWorkCount = -1, PrereqTech = NULL
WHERE Type = 'BUILDING_DECISIONS_NATIONALCOURT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

--Supreme Court
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_JURISPRUDENCE'
WHERE Type = 'BUILDING_JFD_SUPREME_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass, 							Cost, 	PrereqTech, 		MaxStartEra, 		SpecialistType, 				GreatPeopleRateChange, 	PolicyBranchType,			WLTKDTurns,		FreeBuilding,							Description, 							Help, 										Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 					PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',   'BUILDINGCLASS_JFD_FORUM_ROMANUM',		250,	'TECH_WRITING',		'ERA_CLASSICAL', 	'SPECIALIST_JFD_MAGISTRATE',	2,						'POLICY_BRANCH_LIBERTY',	0,				'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_FORUM_ROMANUM',	'TXT_KEY_WONDER_JFD_FORUM_ROMANUM_HELP',	'TXT_KEY_WONDER_JFD_FORUM_ROMANUM_PEDIA',	'TXT_KEY_WONDER_JFD_FORUM_ROMANUM_QUOTE',	1,			-1,					-1,				100,			'JFD_CLAIMS_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_FORUM_MAGNUM',	'Wonder_ForumRomanum.dds',	'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Buildings 
		(Type, 							BuildingClass, 							Cost, 	PrereqTech, 		MaxStartEra, 		SpecialistType, 				GreatPeopleRateChange,	PolicyBranchType,			WLTKDTurns,		FreeBuilding,							Description, 							Help, 										Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 					PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_WESTMINSTER',		'BUILDINGCLASS_JFD_WESTMINSTER',		350,	'TECH_CHIVALRY',	'ERA_RENAISSANCE', 	'SPECIALIST_ENGINEER',			2,						NULL,						25,				NULL,									'TXT_KEY_BUILDING_JFD_WESTMINSTER',		'TXT_KEY_WONDER_JFD_WESTMINSTER_HELP',		'TXT_KEY_WONDER_JFD_WESTMINSTER_PEDIA',		'TXT_KEY_WONDER_JFD_WESTMINSTER_QUOTE',		1,			-1,					-1,				100,			'JFD_CLAIMS_WONDER_ATLAS',	1,				'AS2D_WONDER_SPEECH_JFD_WESTMINSTER',	'Wonder_Westminster.dds',	'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

--Big Ben
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_BIG_BEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_CHANGES_BIG_BEN' AND Value = 1);

--Forbidden Palace
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_FORBIDDEN_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_CHANGES_FORBIDDEN_PALACE' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_JURISPRUDENCE'
WHERE Type = 'BUILDING_FORBIDDEN_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

--Forum Romanum
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE Type = 'BUILDING_JFD_FORUM_ROMANUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

--Pyramids
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PYRAMIDS_HELP', PolicyBranchType = NULL
WHERE Type = 'BUILDING_PYRAMID'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

--Westminster Abbey
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NOBILITY', Cost = 300
WHERE Type = 'BUILDING_JFD_WESTMINSTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DIGNITARY'
WHERE Type = 'BUILDING_JFD_WESTMINSTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 							BuildingClassType)
SELECT	'BUILDING_JFD_COURT_CHANCERY', 			'BUILDINGCLASS_JFD_CHANCERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 							BuildingClassType)
SELECT	'BUILDING_JFD_HIGH_COURT', 				'BUILDINGCLASS_JFD_MAGISTRATE_COURT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 							BuildingClassType)
SELECT	'BUILDING_JFD_SUPREME_COURT',			'BUILDINGCLASS_JFD_HIGH_COURT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 							BuildingClassType,					NumBuildingNeeded)
SELECT	'BUILDING_JFD_COURT_CHANCERY',			'BUILDINGCLASS_JFD_CHANCERY',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 							BuildingClassType,					NumBuildingNeeded)
SELECT	'BUILDING_JFD_SUPREME_COURT',			'BUILDINGCLASS_JFD_HIGH_COURT',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_DomainProductionModifiers
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_LocalResourceAnds
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_LocalResourceAnds WHERE BuildingType = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,			YieldType,			Yield)
SELECT	'BUILDING_FORGE',		'RESOURCE_COPPER',		'YIELD_PRODUCTION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_LocalResourceOrs
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_LocalResourceOrs 
		(BuildingType, 			ResourceType)
SELECT	'BUILDING_FORGE',		Type
FROM Resources WHERE Type IN ('RESOURCE_COPPER', 'RESOURCE_IRON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_COURT_CHANCERY',	'YIELD_CULTURE',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_FORUM_ROMANUM', 	'YIELD_CULTURE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_FORUM_ROMANUM', 	'YIELD_GOLD',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_WESTMINSTER', 	'YIELD_CULTURE',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_WESTMINSTER', 	'YIELD_FAITH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 		YieldType,				Yield)
SELECT	Type, 				'YIELD_FOOD',			10
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType, 		FlavorType,				Flavor)
SELECT	Type, 				'FLAVOR_GROWTH',		10
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);

CREATE TRIGGER JFDRTP_Claims_Building_YieldModifiers
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass = 'BUILDINGCLASS_WINDMILL'
BEGIN
	INSERT INTO Building_YieldModifiers
			(BuildingType, 		YieldType,			Yield)
	SELECT	Type, 				'YIELD_FOOD',		10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);

	INSERT INTO Building_Flavors
			(BuildingType, 		FlavorType,			Flavor)
	SELECT	Type, 				'FLAVOR_GROWTH',	10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL' AND Value = 1);
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_WLTKDYieldMod
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_WLTKDYieldMod 
		(BuildingType, 					YieldType,						Yield)
SELECT	'BUILDING_JFD_WESTMINSTER', 	'YIELD_CULTURE',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

INSERT INTO Building_WLTKDYieldMod 
		(BuildingType, 					YieldType,						Yield)
SELECT	'BUILDING_JFD_WESTMINSTER', 	'YIELD_FAITH',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	'BUILDING_JFD_COURT_CHANCERY',	'RESOURCE_JFD_DIGNITARIES',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	Type,							'RESOURCE_JFD_DIGNITARIES',		2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	Type,							'RESOURCE_MAGISTRATES',			2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	'BUILDING_JFD_SUPREME_COURT',	'RESOURCE_MAGISTRATES',			2
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_FORGE' AND FlavorType = 'FLAVOR_MILITARY_TRAINING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES' AND Value = 1);
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CHANCERY',			'FLAVOR_MILITARY_TRAINING',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CHANCERY',			'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CHANCERY',			'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_CHANCERY',			'FLAVOR_GROWTH',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',		'FLAVOR_WONDER',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',		'FLAVOR_GREAT_PEOPLE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',		'FLAVOR_CULTURE',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',		'FLAVOR_GROWTH',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',		'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',		'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',		'FLAVOR_GOLD',				30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',		'FLAVOR_PRODUCTION',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_FORUM_ROMANUM',		'FLAVOR_CULTURE',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_HIGH_COURT',			'FLAVOR_PRODUCTION',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_MAGISTRATE_COURT',	'FLAVOR_PRODUCTION',		40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPREME_COURT',		'FLAVOR_WONDER',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPREME_COURT',		'FLAVOR_GREAT_PEOPLE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPREME_COURT',		'FLAVOR_CULTURE',			40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_SUPREME_COURT',		'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_WESTMINSTER',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_WESTMINSTER',			'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_WESTMINSTER',			'FLAVOR_RELIGION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_WESTMINSTER',			'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================