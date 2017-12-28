--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Builds
		(Type,						ImprovementType, 				ShowInTechTree,	PrereqTech,		Time,	Recommendation, Description,				Help,	Kill,	CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey,		EntityEvent)
SELECT	'BUILD_JFD_VILLAGE',		'IMPROVEMENT_JFD_VILLAGE',		1,				NULL,			1100,	NULL,			'TXT_KEY_JFD_VILLAGE',		NULL,	0,		1,			95,				41,			'UNIT_ACTION_ATLAS',	'KB_T',		'ENTITY_EVENT_BUILD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

INSERT INTO Builds
		(Type,						ImprovementType, 				ShowInTechTree,	PrereqTech,		Time,	Recommendation, Description,				Help,	Kill,	CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey,		EntityEvent)
SELECT	'BUILD_JFD_WHALE_BOATS',	'IMPROVEMENT_JFD_WHALE_BOATS',	1,				'TECH_BIOLOGY',	Time,	Recommendation, 'TXT_KEY_JFD_WHALE_BOATS',	Help,	Kill,	CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey,		EntityEvent
FROM Builds WHERE Type = 'BUILD_FISHING_BOATS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);

UPDATE Builds
SET ActionAnimation = 1920
WHERE EntityEvent = 'ENTITY_EVENT_IRRIGATE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE Builds
SET ActionAnimation = 1940
WHERE EntityEvent = 'ENTITY_EVENT_MINE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Builds_Charges
AFTER INSERT ON Builds 
WHEN NEW.EntityEvent IN ('ENTITY_EVENT_MINE', 'ENTITY_EVENT_IRRIGATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
BEGIN
	UPDATE Builds
	SET ActionAnimation = 1920
	WHERE EntityEvent = 'ENTITY_EVENT_IRRIGATE' ;
	
	UPDATE Builds
	SET ActionAnimation = 1940
	WHERE EntityEvent = 'ENTITY_EVENT_MINE' ;
END;

UPDATE Builds
SET Time = NULL, ChargeCost = 1
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_ARCHAEOLOGY_DIG', 'BUILD_LANDMARK'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

UPDATE Builds
SET Time = NULL, ChargeCost = 1
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT', 'BUILD_ARCHAEOLOGY_DIG', 'BUILD_LANDMARK'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

UPDATE Builds
SET Time = NULL, ChargeCost = 2
WHERE Type IN ('BUILD_JFD_VILLAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Unit_Builds_Charges
AFTER INSERT ON Unit_Builds 
WHEN NEW.UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
BEGIN
	UPDATE Builds
	SET Time = NULL, ChargeCost = 1
	WHERE Type = NEW.BuildType;
END;

UPDATE Builds
SET Kill = 0, ChargeCost = 1
WHERE Type = 'BUILD_FISHING_BOATS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ChargeExcludes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Build_JFD_ChargeExcludes
		(BuildType)
SELECT	Type
FROM Builds WHERE Type IN ('BUILD_ROAD', 'BUILD_REPAIR', 'BUILD_REMOVE_ROUTE', 'BUILD_RAILROAD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

INSERT INTO Build_JFD_ChargeExcludes
		(BuildType)
SELECT	Type
FROM Builds WHERE Type IN ('BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- BuildFeatures
------------------------------------------------------------------------------------------------------------------------
DELETE FROM BuildFeatures WHERE BuildType IN ('BUILD_TRADING_POST', 'BUILD_JFD_VILLAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

INSERT INTO BuildFeatures
		(BuildType, 					FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_JFD_VILLAGE',			FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------	
INSERT INTO Improvements
		(Type,								Description,							Civilopedia,										Water, DestroyedWhenPillaged, ArtDefineTag, PillageGold, PortraitIndex, IconAtlas)
SELECT	'IMPROVEMENT_JFD_WHALE_BOATS',		'TXT_KEY_IMPROVEMENT_JFD_WHALE_BOATS',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_WHALE_BOATS_TEXT',	Water, DestroyedWhenPillaged, ArtDefineTag, PillageGold, PortraitIndex, IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_FISHING_BOATS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);
--------------------------------
-- Improvement_ResourceTypes
--------------------------------
DELETE FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND ResourceType = 'RESOURCE_WHALE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					ResourceType)
SELECT	'IMPROVEMENT_JFD_WHALE_BOATS', 		'RESOURCE_WHALE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);
--------------------------------
-- Improvement_ResourceType_Yields
--------------------------------
DELETE FROM Improvement_ResourceType_Yields WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND ResourceType = 'RESOURCE_WHALE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,				ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_WHALE_BOATS',  'RESOURCE_WHALE',	'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,				ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_WHALE_BOATS',  'RESOURCE_WHALE',	'YIELD_PRODUCTION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,				ResourceType,		YieldType,				Yield)
SELECT	'IMPROVEMENT_JFD_WHALE_BOATS',  'RESOURCE_WHALE',	'YIELD_SCIENCE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================