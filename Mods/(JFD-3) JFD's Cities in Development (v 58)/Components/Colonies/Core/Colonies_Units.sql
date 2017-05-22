--==========================================================================================================================		
-- BUILDS
--==========================================================================================================================	
-- Builds
--------------------------------------------------------------------------------------------------------------------------
UPDATE Builds
SET Help = 'TXT_KEY_BUILD_JFD_FORT_HELP'
WHERE Type = 'BUILD_FORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_FORT' AND Value = 1);
--==========================================================================================================================		
-- IMPROVEMENTS
--==========================================================================================================================	
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
UPDATE Improvements
SET OutsideBorders = 1, Civilopedia = 'TXT_KEY_IMPROVEMENT_JFD_FORT_HELP'
WHERE Type = 'IMPROVEMENT_FORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_DISTANCE_CORE_FORT' AND Value = 1);
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions	
		(Type, 								Description, 								Help, 											EnemyDamageChance,	EnemyDamage, NeutralDamageChance,	EnemyHealChange,	NeutralHealChange,	NeutralDamage,	AttackMod,	DefenseMod,	Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_COLONIAL_SETTLER', 	'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER',	'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER_HELP',	0,					0,			0,						0,					0,					0,				0,			0,			'AS2D_IF_LEVELUP',	1, 				42, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								Description, 								Help, 											EnemyDamageChance,	EnemyDamage, NeutralDamageChance,	EnemyHealChange,	NeutralHealChange,	NeutralDamage,	AttackMod,	DefenseMod,	Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_FORT_COLONY', 		'TXT_KEY_PROMOTION_JFD_FORT_COLONY',		'TXT_KEY_PROMOTION_JFD_FORT_COLONY_HELP',		0,					0,			0,						0,					0,					0,				0,			0,			'AS2D_IF_LEVELUP',	1, 				42, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_FORT_COLONY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	Visible,	Description, 						Help, 										DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_FORT_COLONY',		20,		199,			1,			'TXT_KEY_MISSION_JFD_FORT_COLONY', 	'TXT_KEY_MISSION_JFD_FORT_COLONY_HELP',		'TXT_KEY_MISSION_JFD_FORT_COLONY_HELP_DISABLED',	'ENTITY_EVENT_FOUND',		'JFD_COLONIES_MISSION_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_FORT_COLONIES' AND Value = 1);
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type, 						DefaultUnit, 				Description)
SELECT	'UNITCLASS_JFD_COLONIST',	'UNIT_JFD_COLONIST',		'TXT_KEY_UNIT_JFD_COLONIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 			MissionType,				RequiresColonyPlot)
SELECT	'UNITCLASS_GREAT_GENERAL', 	'MISSION_JFD_FORT_COLONY',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_FORT_COLONIES' AND Value = 1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,						PrereqTech,			Cost,	Moves,	FaithCost,	Capture, CivilianAttackPriority, HurryCostModifier, Domain, DefaultUnitAI, Food, Found, FoundMid,  Description, 				Help,								Civilopedia, 						Strategy,								AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoCulturalVariation, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_COLONIST',		'UNITCLASS_JFD_COLONIST',	'TECH_ASTRONOMY',	10,		2,		-1,			Capture, CivilianAttackPriority, HurryCostModifier,	Domain, DefaultUnitAI, Food, Found, 1, 		   'TXT_KEY_UNIT_JFD_COLONIST',	'TXT_KEY_UNIT_HELP_JFD_COLONIST',	'TXT_KEY_CIV5_JFD_COLONIST_TEXT', 	'TXT_KEY_UNIT_JFD_COLONIST_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoCulturalVariation, 'ART_DEF_UNIT_JFD_COLONIST',  	0,					'JFD_UNIT_FLAG_COLONIST_ATLAS',	MoveRate, 0, 				'JFD_COLONIES_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);

UPDATE Units
SET FoundLate = 1
WHERE Type = 'UNIT_SPANISH_CONQUISTADOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);

UPDATE Units
SET ObsoleteTech = 'TECH_ASTRONOMY'
WHERE Type = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_CHANGES_SETTLER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_COLONIST', 	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_COLONIST', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_COLONIST', 	FlavorType, 45
FROM Unit_Flavors WHERE UnitType = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_COLONIST',			Type
FROM UnitPromotions WHERE Type IN ('PROMOTION_JFD_COLONIAL_SETTLER', 'PROMOTION_EXTRA_SIGHT_I', 'PROMOTION_DEFENSIVE_EMBARKATION', 'PROMOTION_OCEAN_MOVEMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_SPANISH_CONQUISTADOR', 	'PROMOTION_JFD_COLONIAL_SETTLER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_BuildOnFound
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_COLONIST', 			Type
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_WORKSHOP', 'BUILDINGCLASS_HARBOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_SPANISH_CONQUISTADOR', 	BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
