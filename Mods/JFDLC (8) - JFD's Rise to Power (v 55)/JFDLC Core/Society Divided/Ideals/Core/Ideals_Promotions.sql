
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						NearbyImprovementBonusRange,	NearbyImprovementCombatBonus,	CombatBonusImprovement,		NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_BANTU_2',		NULL,								2,								10,								'IMPROVEMENT_PASTURE',		0,					0,				'TXT_KEY_PROMOTION_JFD_BANTU_2',		'TXT_KEY_PROMOTION_JFD_BANTU_2_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_BANTU_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						ExperiencePercent,				ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_BHARATA_2',		NULL,								15,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_BHARATA_2',		'TXT_KEY_PROMOTION_JFD_BHARATA_2_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_BHARATA_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						StrongerDamaged,				ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_GREAT_PLAINS_2',	NULL,								0,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_GREAT_PLAINS_1',	'TXT_KEY_PROMOTION_JFD_GREAT_PLAINS_1_HELP',	'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_GREAT_PLAINS_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						AlwaysHeal,						ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_IRANIAN_1',		NULL,								1,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_IRANIAN_1',		'TXT_KEY_PROMOTION_JFD_IRANIAN_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_IRANIAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						MovesChange,					ExtraAttacks,					EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_ISLAMIC_2',		NULL,								1,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_ISLAMIC_2',		'TXT_KEY_PROMOTION_JFD_ISLAMIC_2_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_ISLAMIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						CanMoveAfterAttacking,			ExtraAttacks,					EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_KATUJE_1',		NULL,								1,								1,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_KATUJE_1',		'TXT_KEY_PROMOTION_JFD_KATUJE_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_KATUJE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						HPHealedIfDestroyEnemy,			ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_KATUJE_3',		NULL,								20,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_KATUJE_3',		'TXT_KEY_PROMOTION_JFD_KATUJE_3_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_KATUJE_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						HeavyCharge,					GreatGeneral,					EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_MESOAMERICAN_2',	NULL,								1,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_MESOAMERICAN_2',	'TXT_KEY_PROMOTION_JFD_MESOAMERICAN_2_HELP',	'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_MESOAMERICAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						StrongerDamaged,				ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_NORTHERN_3',		NULL,								1,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_NORTHERN_3',		'TXT_KEY_PROMOTION_JFD_NORTHERN_3_HELP',		'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_NORTHERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						VisibilityChange,				ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_OCEANIC_3',		NULL,								0,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_OCEANIC_3',		'TXT_KEY_PROMOTION_JFD_OCEANIC_3_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_OCEANIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						CanCrossIce,					ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_POLAR_1',		NULL,								0,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_POLAR_1',		'TXT_KEY_PROMOTION_JFD_POLAR_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_POLAR_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						MovesChange,					VisibilityChange,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_POLAR_2',		NULL,								1,								1,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_POLAR_2',		'TXT_KEY_PROMOTION_JFD_POLAR_2_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_POLAR_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						GreatGeneralModifier,			ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_SAHARAN_1',		NULL,								33,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_SAHARAN_1',		'TXT_KEY_PROMOTION_JFD_SAHARAN_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_SAHARAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						MovesChange,					GATurnsExpended,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_SEMITIC_2',		NULL,								2,								4,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_SEMITIC_2',		'TXT_KEY_PROMOTION_JFD_SEMITIC_2_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_SEMITIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						CityAttackPlunderModifier,		FreePillageMoves,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_SOUTHERN_1',		NULL,								50,								1,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_SOUTHERN_1',		'TXT_KEY_PROMOTION_JFD_SOUTHERN_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_SOUTHERN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						VisibilityChange,				ExtraWithdrawal,				EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_STEPPE_1',		NULL,								1,								0,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_STEPPE_1',		'TXT_KEY_PROMOTION_JFD_STEPPE_1_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_STEPPE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							PolicyPrereq,						UpgradeDiscount,				OutsideFriendlyLandsModifier,	EnemyHealChange,			NeutralHealChange,	DefenseMod,		Description, 							Help, 											Sound, 				PromotionPrereqOr1,		CannotBeChosen,		PortraitIndex,  IconAtlas, 			PediaType, 				PediaEntry)
SELECT	'PROMOTION_JFD_WESTERN_3',		NULL,								-33,							20,								0,							0,					0,				'TXT_KEY_PROMOTION_JFD_WESTERN_3',		'TXT_KEY_PROMOTION_JFD_WESTERN_3_HELP',			'AS3D_IF_LEVELUP', 	NULL,					1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_JFD_WESTERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	
------------------------------
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType)
SELECT	'PROMOTION_SCOUTING_2',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType)
SELECT	'PROMOTION_SCOUTING_3',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_BANTU_2',		'UNITCOMBAT_MELEE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_BHARATA_2',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_SIEGE', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_KATUJE_3',		'UNITCOMBAT_MELEE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_OCEANIC_3',		UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_SUPPLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_STEPPE_1',		'UNITCOMBAT_MOUNTED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 				UnitCombatType)
SELECT	'PROMOTION_JFD_WESTERN_3',		UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_SUPPLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------
-- UnitPromotions_Terrains
------------------------------
INSERT INTO UnitPromotions_Terrains 
		(PromotionType, 				TerrainType,			DoubleHeal)
SELECT	'PROMOTION_JFD_POLAR_1',		'TERRAIN_SNOW',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO UnitPromotions_Terrains 
		(PromotionType, 				TerrainType,			DoubleMove)
SELECT	'PROMOTION_JFD_GREAT_PLAINS_2',	Type,					1
FROM Terrains WHERE Type IN ('TERRAIN_PLAINS', 'TERRAIN_GRASS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	
------------------------------
-- UnitPromotions_YieldFromScouting
------------------------------
INSERT INTO UnitPromotions_YieldFromScouting 
		(PromotionType, 				YieldType,				Yield)
SELECT	'PROMOTION_JFD_OCEANIC_3',		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------
-- UnitPromotions_YieldModifiers
------------------------------
INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType,				Yield)
SELECT	'PROMOTION_JFD_BHARATA_2',		'YIELD_JFD_LOYALTY',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================