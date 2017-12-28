--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type, 						DefaultUnit, 				Description)
SELECT	'UNITCLASS_JFD_COLONIST',	'UNIT_JFD_COLONIST',		'TXT_KEY_UNIT_JFD_COLONIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,						PrereqTech,			Cost,	Moves,	FaithCost,	Capture, CivilianAttackPriority, HurryCostModifier, Domain, DefaultUnitAI, Food, Found, FoundMid,  Description, 				Help,								Civilopedia, 						Strategy,								AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoCulturalVariation, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_COLONIST',		'UNITCLASS_JFD_COLONIST',	'TECH_ASTRONOMY',	Cost,	2,		-1,			Capture, CivilianAttackPriority, HurryCostModifier,	Domain, DefaultUnitAI, Food, Found, 1, 		   'TXT_KEY_UNIT_JFD_COLONIST',	'TXT_KEY_UNIT_HELP_JFD_COLONIST',	'TXT_KEY_CIV5_JFD_COLONIST_TEXT', 	'TXT_KEY_UNIT_JFD_COLONIST_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoCulturalVariation, 'ART_DEF_UNIT_JFD_COLONIST',  	0,					'JFD_UNIT_FLAG_COLONIST_ATLAS',	MoveRate, 0, 				'JFD_COLONIES_UNIT_ATLAS'
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
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_WALLS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_SPANISH_CONQUISTADOR', 	BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================