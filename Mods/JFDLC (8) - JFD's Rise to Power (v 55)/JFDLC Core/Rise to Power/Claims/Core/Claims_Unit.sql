--==========================================================================================================================	
-- GREAT PERSONS
--==========================================================================================================================	
-- GreatPersons
-----------------------------------------------------------------------------------------------------
INSERT INTO GreatPersons 
		(Type, 								Class,									Specialist)
SELECT	'GREATPERSON_JFD_DIGNITARY', 		'UNITCLASS_JFD_GREAT_DIGNITARY',		'SPECIALIST_JFD_DIGNITARY'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO GreatPersons 
		(Type, 								Class,									Specialist)
SELECT	'GREATPERSON_JFD_MAGISTRATE', 		'UNITCLASS_JFD_GREAT_MAGISTRATE',		'SPECIALIST_JFD_MAGISTRATE'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type, 									DefaultUnit, 					Description)
SELECT	'UNITCLASS_JFD_GREAT_DIGNITARY',		'UNIT_JFD_GREAT_DIGNITARY',		'TXT_KEY_UNIT_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO UnitClasses 	
		(Type, 									DefaultUnit, 					Description)
SELECT	'UNITCLASS_JFD_GREAT_MAGISTRATE',		'UNIT_JFD_GREAT_MAGISTRATE',	'TXT_KEY_UNIT_JFD_GREAT_MAGISTRATE'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 						MissionType)
SELECT	'UNITCLASS_JFD_GREAT_DIGNITARY', 		'MISSION_JFD_DIGNITARIES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO UnitClass_Missions 	
		(UnitClassType, 						MissionType)
SELECT	'UNITCLASS_JFD_GREAT_MAGISTRATE',		'MISSION_JFD_ASSIMILATE_CITY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO UnitClass_Missions 	
		(UnitClassType, 						MissionType)
SELECT	'UNITCLASS_JFD_GREAT_MAGISTRATE', 		'MISSION_JFD_MAGISTRATES'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 							Class,								GPExtra,	DontShowYields, BaseGold,	Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 								Strategy,										AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 						 	UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GREAT_DIGNITARY',		'UNITCLASS_JFD_GREAT_DIGNITARY',	1,			1,				1,			Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GREAT_DIGNITARY',	'TXT_KEY_CIV5_JFD_GREAT_DIGNITARY_TEXT', 	'TXT_KEY_UNIT_JFD_GREAT_DIGNITARY_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_JFD_GREAT_DIGNITARY',  	0,					'JFD_UNIT_FLAG_GREAT_DIGNITARY_ATLAS',	MoveRate, 4, 				'JFD_CLAIMS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Units 	
		(Type, 							Class,								GPExtra,	DontShowYields, BaseGold,	Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 								Strategy,										AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 							UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE',	'UNITCLASS_JFD_GREAT_MAGISTRATE',	2,			1,				0,			Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GREAT_MAGISTRATE', 'TXT_KEY_CIV5_JFD_GREAT_MAGISTRATE_TEXT',	'TXT_KEY_UNIT_JFD_GREAT_MAGISTRATE_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 1,						'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE',	0,					'JFD_UNIT_FLAG_GREAT_MAGISTRATE_ATLAS',	MoveRate, 3, 				'JFD_CLAIMS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--Great Merchant
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_GREAT_MERCHANT_STRATEGY'
WHERE Type = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--Landsneckht
UPDATE Units
SET PrereqTech = 'TECH_JFD_NOBILITY'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GREAT_DIGNITARY', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_GREAT_DIGNITARY', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds
		(UnitType, 						BuildType)
SELECT	'UNIT_JFD_GREAT_DIGNITARY',		'BUILD_JFD_ESTATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_Builds
		(UnitType, 						BuildType)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE',	'BUILD_JFD_ESTATE'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_GREAT_DIGNITARY',		'PROMOTION_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE',	Type
FROM UnitPromotions WHERE Type IN ('PROMOTION_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	Type, 							'PROMOTION_GREAT_MERCHANT'
FROM Units WHERE Class = 'UNITCLASS_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Claims_Unit_FreePromotions
AFTER INSERT ON Units 
WHEN NEW.Class = 'UNITCLASS_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
BEGIN
	INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
	VALUES	(NEW.Type, 					'PROMOTION_GREAT_MERCHANT');
END;
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,		Flavor)
SELECT	'UNIT_JFD_GREAT_DIGNITARY', 	FlavorType,		Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,		Flavor)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE', 	FlavorType,		Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 						UniqueName)
SELECT	'UNIT_JFD_GREAT_DIGNITARY', 	Tag
FROM Language_en_US WHERE Tag IN ('TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_1', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_2', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_3', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_4', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_5', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_6', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_7', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_8', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_9', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_10', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_11', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_12', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_13', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_14', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_15', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_16', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_17', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_18', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_19', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_20', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_21', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_22', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_23', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_24', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_25', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_26', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_27', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_28', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_29', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_31', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_32', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_33', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_34', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_35', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_36', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_37', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_38', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_39', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_40', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_41', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_42', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_43', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_44', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_45', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_46', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_47', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_48', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_49', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_50', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_51', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_52', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_53', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_54', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_55', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_56', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_57', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_58', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_59', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_60', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_61', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_62', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_63', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_64', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_65', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_66', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_67', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_68', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_69', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_70', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_71', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_72', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_73', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_74', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_75', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_76', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_78', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_79', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_80', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_81', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_82', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_83', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIGNITARY_84')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						UniqueName)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE', 	Tag
FROM Language_en_US WHERE Tag IN ('TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_1', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_2', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_3', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_4', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_5', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_6', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_7', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_8', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_9', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_10', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_11', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_12', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_13', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_14', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_15', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_16', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_17', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_18', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_19', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_20', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_21', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_22', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_23', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_24', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_25', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_26', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_27', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_28', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_29', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_31', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_32', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_33', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_34', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_35', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_36', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_37', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_38', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_39', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_40', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_41', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_42', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_43', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_44', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_45', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_46', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_47', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_48', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_49', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_50', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_51', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_52', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_53', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_54', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_55', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_56', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_57', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_58', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_59', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_60', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_61', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_62', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_63', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_64', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_65', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_66', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_67', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_68', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_69', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_70', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_71', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_72', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_73', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_74', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_75', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_76', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_78', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_79', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_80', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_81', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_82', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_83', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_84', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_85', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_MAGISTRATE_86')
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						UniqueName)
SELECT	'UNIT_SCIENTIST', 				Tag
FROM Language_en_US WHERE Tag IN ('TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_1', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_2', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_3', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_4', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_5', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_6', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_7', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_8', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_9', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_10', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_11', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_12', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_13', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_14', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_15', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_16', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_17', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_18', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_19', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_20', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_21', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_22', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_23', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_24', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_25', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_26', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_27', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_28', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_29', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_SCIENTIST_31')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================