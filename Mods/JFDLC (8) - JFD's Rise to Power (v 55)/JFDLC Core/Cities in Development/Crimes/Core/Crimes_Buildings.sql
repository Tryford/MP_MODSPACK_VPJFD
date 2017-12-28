--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_JAIL', 				'BUILDING_JFD_JAIL',				'TXT_KEY_BUILDING_JFD_JAIL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_PRISON', 			'BUILDING_JFD_PRISON',				'TXT_KEY_BUILDING_JFD_PRISON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 							MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TOWER_LONDON',		'BUILDING_JFD_TOWER_LONDON',		'TXT_KEY_BUILDING_JFD_TOWER_LONDON', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 					BuildingType)
SELECT	Type, 									'BUILDINGCLASS_JFD_TOWER_LONDON', 	NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------	
INSERT INTO Buildings
		(Type, 					Cost, 	FaithCost, 	GoldMaintenance,	EspionageModifier,	PrereqTech,			BuildingClass, 				Description, 					Civilopedia,						Help,								Strategy,								MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_JAIL',	60,		-1,			1,					15,					'TECH_THE_WHEEL',	'BUILDINGCLASS_JFD_JAIL',	'TXT_KEY_BUILDING_JFD_JAIL',	'TXT_KEY_BUILDING_JFD_JAIL_TEXT',	NULL,								'TXT_KEY_BUILDING_JFD_JAIL_STRATEGY',	-1,				25,					0,				30,				0,			0,				'JFD_CRIMES_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type, 					Cost, 	FaithCost, 	GoldMaintenance,	EspionageModifier,	PrereqTech,			BuildingClass, 				Description, 					Civilopedia,						Help,								Strategy,								MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_PRISON',	300,	-1,			1,					0,					'TECH_ELECTRICITY',	'BUILDINGCLASS_JFD_PRISON',	'TXT_KEY_BUILDING_JFD_PRISON',	'TXT_KEY_BUILDING_JFD_PRISON_TEXT',	'TXT_KEY_BUILDING_JFD_PRISON_HELP',	'TXT_KEY_BUILDING_JFD_PRISON_STRATEGY',	-1,				25,					0,				30,				0,			0,				'JFD_CRIMES_BUILDING_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

--Espionage
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_CONSTABULARY_STRATEGY', Help = 'TXT_KEY_BUILDING_JFD_CONSTABULARY_HELP'
WHERE Type = 'BUILDING_CONSTABLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_POLICE_STATION_STRATEGY'
WHERE Type = 'BUILDING_POLICE_STATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

UPDATE Buildings
SET Espionage = 0
WHERE BuildingClass IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Buildings_Espionage
AFTER INSERT ON Buildings 
WHEN NEW.Espionage = 1
BEGIN
	UPDATE Buildings
	SET Espionage = 0
	WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
END;

--Maintenance
UPDATE Buildings
SET GoldMaintenance = 1
WHERE BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_OBSERVATORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

UPDATE Buildings
SET GoldMaintenance = 2
WHERE BuildingClass IN ('BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

UPDATE Buildings
SET GoldMaintenance = 3
WHERE BuildingClass IN ('BUILDING_MILITARY_BASE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Buildings_Defensive
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_AQUEDUCT', 'BUILDING_MILITARY_BASE')
BEGIN
	UPDATE Buildings
	SET GoldMaintenance = 1
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_OBSERVATORY')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	UPDATE Buildings
	SET GoldMaintenance = 2
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_POLICE_STATION', 'BUILDINGCLASS_AQUEDUCT')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	UPDATE Buildings
	SET GoldMaintenance = 3
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDING_MILITARY_BASE')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
END;

--Officers
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_OFFICER', SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_OFFICER', SpecialistCount = 2
WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Buildings_Officers
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_OFFICER', SpecialistCount = 1
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_CONSTABLE';
	
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_OFFICER', SpecialistCount = 3
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_POLICE_STATION';
END;

--Burial Tomb
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD2_BURIAL_TOMB_HELP', Strategy = 'TXT_KEY_BUILDING_JFD2_BURIAL_TOMB_STRATEGY'
WHERE Type = 'BUILDING_BURIAL_TOMB'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB' AND Value = 1);

--Mud Pyramid Mosque
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MUD_PYRAMID_MOSQUE_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_MUD_PYRAMID_MOSQUE_STRATEGY'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID' AND Value = 1);
------------------------------------------------------------
-- Wonders
------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass, 						TechEnhancedTourism,	EnhancedYieldTech,	FreeBuildingThisCity,		Cost, 	Defense,	PrereqTech, 			MaxStartEra, 		SpecialistType, 		GreatPeopleRateChange, 	Description, 							Help, 									Civilopedia, 								Quote, 										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	IconAtlas, 					PortraitIndex, 	WonderSplashAudio,						WonderSplashImage, 			WonderSplashAnchor)
SELECT	'BUILDING_JFD_TOWER_LONDON',    'BUILDINGCLASS_JFD_TOWER_LONDON',	4,						'TECH_ELECTRICITY',	'BUILDINGCLASS_CASTLE',		350,	900,		'TECH_METAL_CASTING',	'ERA_RENAISSANCE', 	'SPECIALIST_MERCHANT',	2,						'TXT_KEY_BUILDING_JFD_TOWER_LONDON',	'TXT_KEY_WONDER_JFD_TOWER_LONDON_HELP',	'TXT_KEY_WONDER_JFD_TOWER_LONDON_PEDIA',	'TXT_KEY_WONDER_JFD_TOWER_LONDON_QUOTE',	1,			-1,					-1,				100,			'JFD_CRIMES_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_TOWER_LONDON',	'Wonder_TowerLondon.dds',	'R,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1);

--Penatgon
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PENTAGON_HELP'
WHERE Type = 'BUILDING_PENTAGON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON' AND Value = 1);

--Uffizi
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_UFFIZI_HELP'
WHERE Type = 'BUILDING_UFFIZI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
UPDATE Building_YieldChanges
SET Yield = 2
WHERE BuildingType = 'BUILDING_OXFORD_UNIVERSITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 							YieldType,					Yield)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 		BuildingClassType)
SELECT	Type,				'BUILDINGCLASS_JFD_JAIL'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Building_ClassesNeededInCity
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass = 'BUILDINGCLASS_CONSTABLE'
BEGIN
	INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 		BuildingClassType)
	SELECT	Type,				'BUILDINGCLASS_JFD_JAIL'
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_CONSTABLE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_FreeUnits WHERE BuildingType = 'BUILDING_UFFIZI' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI' AND Value = 0);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_COUNCIL', 'BUILDINGCLASS_JFD_HERBALIST', 'BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_JFD_GROCER', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_COLOSSEUM', 'BUILDINGCLASS_MINT', 'BUILDINGCLASS_CHANCERY', 'BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_ARTISTS_GUILD', 'BUILDINGCLASS_MUSICIANS_GUILD', 'BUILDINGCLASS_WRITERS_GUILD', 'BUILDINGCLASS_JFD_APOTHECARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_PALACE', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_CHURCH', 'BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_MANDIR', 'BUILDINGCLASS_STUPA', 'BUILDINGCLASS_ORDER', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_SYNAGOGUE', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_EE_MANOR', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_EE_MENAGERIE', 'BUILDINGCLASS_EE_TAVERN', 'BUILDINGCLASS_JFD_DRILL_ACADEMY', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_JFD_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		3
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_BANK', 'BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_ACADEMY', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'BUILDINGCLASS_EE_SALON', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_WIRE_SERVICE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		4
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_GOVERNORS_MANSION', 'BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		4
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_HOSPITAL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Burial Tomb
UPDATE Building_YieldChanges
SET Yield = 1
WHERE BuildingType = 'BUILDING_BURIAL_TOMB' AND YieldType = 'YIELD_JFD_CRIME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB' AND Value = 1);

--Mud Pyramid Mosque
UPDATE Building_YieldChanges
SET Yield = 0
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND YieldType = 'YIELD_JFD_CRIME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID' AND Value = 1);

--Satraps Court
UPDATE Building_YieldChanges
SET Yield = 2
WHERE BuildingType = 'BUILDING_SATRAPS_COURT' AND YieldType = 'YIELD_JFD_CRIME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT' AND Value = 1);

-- Maintenance
UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_JFD_CRIME')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Building_YieldChanges
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_COUNCIL', 'BUILDINGCLASS_WIRE_SERVICE', 'BUILDINGCLASS_ARTISTS_GUILD', 'BUILDINGCLASS_MUSICIANS_GUILD', 'BUILDINGCLASS_WRITERS_GUILD', 'BUILDINGCLASS_JFD_DIRECTORS_GUILD', 'BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_JFD_GROCER', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_JFD_APOTHECARY', 'BUILDINGCLASS_JFD_HERBALIST', 'BUILDINGCLASS_PALACE', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_COLOSSEUM', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_MINT', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_STUPA', 'BUILDINGCLASS_ORDER', 'BUILDINGCLASS_CHURCH', 'BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_MANDIR', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_SYNAGOGUE', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_EE_TAVERN', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BANK', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_CHANCERY', 'BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_ACADEMY', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_EE_SALON', 'BUILDINGCLASS_EE_MANOR', 'BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_EE_MENAGERIE', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_AIRPORT', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_JFD_MANOR', 'BUILDINGCLASS_JFD_MANSION')
BEGIN
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		1
	FROM Buildings WHERE NEW.Type = Type AND BuildingClass IN ('BUILDINGCLASS_COUNCIL', 'BUILDINGCLASS_JFD_HERBALIST', 'BUILDINGCLASS_JFD_APOTHECARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_PALACE', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_EE_MANOR', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_JFD_GROCER', 'BUILDINGCLASS_JFD_MANOR')
	AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		2
	FROM Buildings WHERE NEW.Type = Type AND BuildingClass IN ('BUILDINGCLASS_ARTISTS_GUILD', 'BUILDINGCLASS_MUSICIANS_GUILD', 'BUILDINGCLASS_WRITERS_GUILD', 'BUILDINGCLASS_JFD_DIRECTORS_GUILD', 'BUILDINGCLASS_JFD_APOTHECARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_PALACE', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_CHURCH', 'BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_MANDIR', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_STUPA', 'BUILDINGCLASS_ORDER', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_SYNAGOGUE', 'BUILDINGCLASS_CHANCERY', 'BUILDINGCLASS_JFD_CHANCERY', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_EE_MANOR', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_MEDICAL_LAB', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_JFD_MANSION')
	AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		3
	FROM Buildings WHERE NEW.Type = Type AND BuildingClass IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BANK', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_ACADEMY', 'BUILDINGCLASS_EE_TAVERN', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'BUILDINGCLASS_EE_SALON', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_EE_MENAGERIE', 'BUILDINGCLASS_WIRE_SERVICE')
	AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		4
	FROM Buildings WHERE NEW.Type = Type AND BuildingClass IN ('BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_AIRPORT')
	AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		4
	FROM Buildings WHERE NEW.Type = Type AND BuildingClass IN ('BUILDINGCLASS_HOSPITAL')
	AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

	UPDATE Buildings
	SET GoldMaintenance = 0
	WHERE NEW.Type = Type AND NEW.Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_JFD_CRIME')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers 
		(BuildingType, 					YieldType,				Yield)
SELECT	Type,							'YIELD_JFD_CRIME',		-10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_JFD_JAIL', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Building_YieldModifiers
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type,							'YIELD_JFD_CRIME',		-10
	FROM Buildings WHERE Type = NEW.Type;
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
------------------------------------------------------------------------------------------------------------------------
-- Buildings
----------------------------------
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					GreatWorkCrimeMod,		IsLocal)
SELECT	'BUILDING_UFFIZI',				-100,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_GAP',		-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CASTLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_HEALTH',		-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOSPITAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_TOURISM',	-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_GOLD',		-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_FAITH',		-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	Type,							'CRIME_JFD_SCIENCE',	-15,		1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_UNIVERSITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	'BUILDING_BURIAL_TOMB',			'CRIME_JFD_CULTURE',	-15,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
SELECT	'BUILDING_JFD_JAIL',			'CRIME_JFD_FOOD',		-15,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_PENTAGON',			'CRIME_JFD_GOLD',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_PENTAGON',			'CRIME_JFD_TOURISM',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_JFD_TOWER_LONDON',	'CRIME_JFD_HAPPINESS',	-100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1);

CREATE TRIGGER JFDCID_Crimes_Building_CrimeMods
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_HOSPITAL', 'BUILDINGCLASS_HOTEL', 'BUILDINGCLASS_MINT', 'BUILDINGCLASS_MONASTERY', 'BUILDINGCLASS_UNIVERSITY')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_GAP',		-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_CASTLE';
	
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_HEALTH',		-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HOSPITAL'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
	
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_TOURISM',	-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_HOTEL';
	
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_GOLD',		-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_MINT';
	
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_FAITH',		-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_MONASTERY';
	
	INSERT INTO Building_JFD_CrimeMods
			(BuildingType,					CrimeType,				CrimeMod,	IsLocal)
	SELECT	Type,							'CRIME_JFD_SCIENCE',	-15,		1
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_UNIVERSITY';
END;
----------------------------------
-- National Wonders
----------------------------------
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_ARTISTS_GUILD',		'CRIME_JFD_CULTURE',	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,					CrimeType,				GlobalCrimeMod,		CrimeMod)
--SELECT	'BUILDING_CIRCUS_MAXIMUS',		'CRIME_JFD_FOOD',		-5,					-10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,					CrimeType,				GlobalCrimeMod,		CrimeMod)
--SELECT	'BUILDING_IRONWORKS',			'CRIME_JFD_DEFENSE',	-5,					-10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_MUSICIANS_GUILD',		'CRIME_JFD_CULTURE',	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,					CrimeType,				GlobalCrimeMod,		CrimeMod)
--SELECT	'BUILDING_NATIONAL_TREASURY',	'CRIME_JFD_GOLD',		-5,					-10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,					CrimeType,				GlobalCrimeMod,		CrimeMod)
--SELECT	'BUILDING_OXFORD_UNIVERSITY',	'CRIME_JFD_SCIENCE',	-5,					-10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,					CrimeType,				GlobalCrimeMod,	CrimeMod)
--SELECT	'BUILDING_TOURIST_CENTER',		'CRIME_JFD_TOURISM',	-5,				-10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_WRITERS_GUILD',		'CRIME_JFD_CULTURE',	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_OrganizedCrimeMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_OrganizedCrimeMods
		(BuildingType,					ThresholdMod,			IsLocal)
SELECT	'BUILDING_JFD_PRISON',			5,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_JFD_OrganizedCrimeMods
		(BuildingType,					ThresholdMod)
SELECT	'BUILDING_INTELLIGENCE_AGENCY',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
-- National Wonders
----------------------------------
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_CIRCUS_MAXIMUS',		'TXT_KEY_WONDER_JFD_CIRCUS_MAXIMUS_HELP_CRIME',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText)
SELECT	'BUILDING_INTELLIGENCE_AGENCY',	'TXT_KEY_WONDER_JFD_INTELLIGENCE_AGENCY_HELP_CRIME'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_IRONWORKS',			'TXT_KEY_WONDER_JFD_IRONWORKS_HELP_CRIME',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_NATIONAL_TREASURY',	'TXT_KEY_WONDER_JFD_NATIONAL_TREASURY_HELP_CRIME',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_OXFORD_UNIVERSITY',	'TXT_KEY_WONDER_JFD_OXFORD_UNIVERSITY_HELP_CRIME',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_TOURIST_CENTER',		'TXT_KEY_WONDER_JFD_TOURIST_CENTER_HELP_CRIME',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_CONSTABLE',					Type,						15
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_SCIENCE', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_JAIL',					Type,						15
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_SCIENCE', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_PRISON',					Type,						10
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_SCIENCE', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_POLICE_STATION',				Type,						20
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_SCIENCE', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_WONDER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_GREAT_PEOPLE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_HAPPINESS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_CITY_DEFENSE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_TOWER_LONDON',			'FLAVOR_CULTURE',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_UFFIZI',						Type,						20
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_SCIENCE', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================