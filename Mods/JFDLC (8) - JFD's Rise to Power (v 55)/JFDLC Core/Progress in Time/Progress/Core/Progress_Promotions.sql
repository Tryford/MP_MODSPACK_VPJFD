--==========================================================================================================================	
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_1', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_2', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_3', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_4', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_5', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_6', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_7', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_8', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_9', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_10', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_11', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,		Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_12', 	1,					'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								UpgradeDiscount,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_DA_VINCI', 			0,					'TXT_KEY_PROMOTION_JFD_DA_VINCI',			'TXT_KEY_PROMOTION_JFD_DA_VINCI_HELP',			'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',			'TXT_KEY_PROMOTION_JFD_DA_VINCI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND NOT EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_LEONARDOS_WORKSHOP');

INSERT INTO UnitPromotions 
		(Type, 								UpgradeDiscount,	Description, 								Help, 											Sound, 				CannotBeChosen,	PortraitIndex,	IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_NAVAL_PENALTY',		0,					'TXT_KEY_PROMOTION_JFD_NAVAL_PENALTY',		'TXT_KEY_PROMOTION_JFD_NAVAL_PENALTY_HELP',		'AS2D_IF_LEVELUP',  1, 				57, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_NAVAL_PENALTY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROMOTION_ADDITIONS_NAVAL_PENALTY' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								UpgradeDiscount,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_UPGRADE_DISCOUNT', 	50,					'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT',	'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',			'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
------------------------------
-- UnitPromotions_Terrains
------------------------------	
INSERT INTO UnitPromotions_Domains
		(PromotionType,						DomainType,			Modifier)
SELECT	'PROMOTION_JFD_NAVAL_PENALTY',		'DOMAIN_SEA',		-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROMOTION_ADDITIONS_NAVAL_PENALTY' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Hide
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Hide
		(PromotionType,	EnemyUnitPanel,	UnitPanel)
SELECT   Type,			1,				1
FROM UnitPromotions WHERE IsBuildCharge = 1;

INSERT INTO UnitPromotions_Hide
		(PromotionType,						UnitPanel,			EnemyUnitPanel)
SELECT	'PROMOTION_JFD_UPGRADE_DISCOUNT',	1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT   Type
FROM UnitPromotions WHERE IsBuildCharge = 1;
--==========================================================================================================================
--==========================================================================================================================