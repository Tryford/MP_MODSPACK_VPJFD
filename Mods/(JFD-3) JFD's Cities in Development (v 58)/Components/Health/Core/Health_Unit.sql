--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
--INSERT INTO UnitPromotions	
--		(Type, 							DefenseMod,		FriendlyHealChange,	NeutralHealChange,	EnemyHealChange,	PlagueChance,	IsPlague,	Description, 							Help, 											Sound, 				LostWithUpgrade,	CannotBeChosen,		PortraitIndex,	IconAtlas, 						PediaType, 			PediaEntry)
--SELECT	'PROMOTION_JFD_PLAGUED', 		0,				-25,				-10,				-10,				30,				1,			'TXT_KEY_PROMOTION_JFD_PLAGUED',		'TXT_KEY_PROMOTION_JFD_PLAGUED_HELP',			'AS2D_IF_LEVELUP',	1,					1, 					10, 			'JFD_HEALTH_PROMOTION_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_PLAGUED'
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--
--INSERT INTO UnitPromotions	
--		(Type, 							DefenseMod,		PlagueChance,	IsPlague,	Description, 							Help, 											Sound, 				LostWithUpgrade,	CannotBeChosen,		PortraitIndex,	IconAtlas, 						PediaType, 			PediaEntry)
--SELECT	'PROMOTION_JFD_CURE_PLAGUE', 	0,				0,				0,			'TXT_KEY_PROMOTION_JFD_CURE_PLAGUE',	'TXT_KEY_PROMOTION_JFD_CURE_PLAGUE_HELP',		'AS2D_IF_LEVELUP',	0,					0, 					26, 			'PROMOTION_ATLAS',				'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_CURE_PLAGUE'
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
--------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO UnitPromotions_UnitCombats
--		(PromotionType, 				UnitCombatType)
--SELECT	'PROMOTION_JFD_CURE_PLAGUE',	UnitCombatType
--FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================	
-- MISSION
--==========================================================================================================================	
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	EntityEventType,				Visible,	Description, 						Help, 									DisabledHelp, 									EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_CURE_PLAGUE', 		20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_CURE_PLAGUE', 	'TXT_KEY_MISSION_JFD_CURE_PLAGUE_HELP',	'TXT_KEY_MISSION_JFD_CURE_PLAGUE_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_HEALTH_MISSION_ATLAS_1',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	EntityEventType,				Visible,	Description, 						Help, 									DisabledHelp, 									EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_POPULATION', 		20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_POPULATION', 	'TXT_KEY_MISSION_JFD_POPULATION_HELP',	'TXT_KEY_MISSION_JFD_POPULATION_DISABLED',		'ENTITY_EVENT_GREAT_EVENT',	'JFD_HEALTH_MISSION_ATLAS_2',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type, 							DefaultUnit, 				Description)
SELECT	'UNITCLASS_JFD_GREAT_DOCTOR',	'UNIT_JFD_GREAT_DOCTOR',	'TXT_KEY_UNIT_JFD_GREAT_DOCTOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================			
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,							GPExtra,	DontShowYields, Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 					Civilopedia, 							Strategy,									AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GREAT_DOCTOR',	'UNITCLASS_JFD_GREAT_DOCTOR',	3,			1,				Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GREAT_DOCTOR', 'TXT_KEY_CIV5_JFD_GREAT_DOCTOR_TEXT',	'TXT_KEY_UNIT_JFD_GREAT_DOCTOR_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_JFD_GREAT_DOCTOR',	0,					'JFD_UNIT_FLAG_GREAT_DOCTOR_ATLAS',	MoveRate, 0, 				'JFD_HEALTH_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GREAT_DOCTOR',	Type
FROM UnitPromotions WHERE Type IN ('PROMOTION_MEDIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Missions 	
		(UnitType, 					MissionType,				RequiresCity)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	'MISSION_JFD_CURE_PLAGUE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);

INSERT INTO Unit_Missions 	
		(UnitType, 					MissionType,				RequiresCity)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	'MISSION_JFD_POPULATION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 					UniqueName)
SELECT	'UNIT_JFD_GREAT_DOCTOR', 	Tag
FROM Language_en_US WHERE Tag IN ('TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_1', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_2', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_3', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_4', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_5', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_6', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_7', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_8', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_9', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_10', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_11', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_12', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_13', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_14', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_15', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_16', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_17', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_18', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_19', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_20', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_21', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_22', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_23', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_24', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_25', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_26', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_27', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_28', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_29', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_31', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_32', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_33', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_34', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_35', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_36', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_37', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_38', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_39', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_40', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_41', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_42', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_43', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_44', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_45', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_46', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_47', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_48', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_49', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_50', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_51', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_52', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_53', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_54', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_55', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_56', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_57', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_58', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_59', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_60', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_61', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_62', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_63', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_64', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_65', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_66', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_67', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_68', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_69', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_70', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_71', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_72', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_73', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_74', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_75', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_76', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_77', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_78', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_79', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_80', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_81', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_82', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_83', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_84', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DOCTOR_85')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================