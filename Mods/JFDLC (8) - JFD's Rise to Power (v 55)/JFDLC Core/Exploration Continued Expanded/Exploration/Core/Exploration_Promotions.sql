--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				EmbarkExtraVisibility,			EmbarkDefenseModifier,	CannotBeChosen, PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BELEM', 				'TXT_KEY_PROMOTION_JFD_BELEM',				'TXT_KEY_PROMOTION_JFD_BELEM_HELP',				'AS2D_IF_LEVELUP',	NULL,							1,								20,						1, 				59, 				'ABILITY_ATLAS', 				'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BELEM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

-- INSERT INTO UnitPromotions
		-- (Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				LostWithUpgrade,				NotWithUpgrade,			CannotBeChosen, PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
-- SELECT	'PROMOTION_JFD_GREAT_RECON',		'TXT_KEY_PROMOTION_JFD_GREAT_RECON',		'TXT_KEY_PROMOTION_JFD_GREAT_RECON_HELP',		'AS2D_IF_LEVELUP',	NULL,							0,								0,						1, 				59, 				'ABILITY_ATLAS', 				'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_JFD_GREAT_RECON'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

-- INSERT INTO UnitPromotions
		-- (Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				OutsideFriendlyLandsModifier,	NotWithUpgrade,			CannotBeChosen, PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
-- SELECT	'PROMOTION_JFD_GREAT_RECON_UNIT',	'TXT_KEY_PROMOTION_JFD_GREAT_RECON_UNIT',	'TXT_KEY_PROMOTION_JFD_GREAT_RECON_UNIT_HELP',	'AS2D_IF_LEVELUP',	NULL,							20,								0,						1, 				59, 				'ABILITY_ATLAS', 				'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_JFD_GREAT_RECON_UNIT'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				LostWithUpgrade,				NotWithUpgrade,			CanCrossIce,	PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_INTREPID',			'TXT_KEY_PROMOTION_JFD_INTREPID',			'TXT_KEY_PROMOTION_JFD_INTREPID_HELP',			'AS2D_IF_LEVELUP',	'PROMOTION_SURVIVALISM_3',		0,								0,						0,				0, 					'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_JFD_INTREPID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_INTREPID' AND Value = 1);
		
INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				ExperiencePercent,				NotWithUpgrade,			CannotBeChosen,	PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_NAVAL_TRADITION',	'TXT_KEY_PROMOTION_JFD_NAVAL_TRADITION', 	'TXT_KEY_PROMOTION_JFD_NAVAL_TRADITION_HELP',	'AS2D_IF_LEVELUP',	NULL,							33,								0,						1,				59,					'ABILITY_ATLAS',				'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_NAVAL_TRADITION'	 
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				GainsXPFromScouting,			NotWithUpgrade,			CannotBeChosen, PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_RECON_XP',			'TXT_KEY_PROMOTION_JFD_RECON_XP',			'TXT_KEY_PROMOTION_JFD_RECON_XP_HELP',			'AS2D_IF_LEVELUP',	NULL,							1,								0,						1, 				59, 				'ABILITY_ATLAS', 				'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_JFD_RECON_XP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_RECON_XP' AND Value = 1);

INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,				Sapper,							NotWithUpgrade,			CannotBeChosen,	PortraitIndex,		IconAtlas, 						PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TACTICS',			'TXT_KEY_PROMOTION_JFD_TACTICS',			'TXT_KEY_PROMOTION_JFD_TACTICS_HELP',			'AS2D_IF_LEVELUP',	'PROMOTION_MEDIC_II',			1,								0,						0,				40, 				'PROMOTION_ATLAS',				'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_JFD_TACTICS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_TACTICS' AND Value = 1);
		
--Ignores Terrain Cost
UPDATE UnitPromotions
SET CanCrossMountains = 1, Help = 'TXT_KEY_PROMOTION_JFD_IGNORE_TERRAIN_COST'
WHERE Type = 'PROMOTION_IGNORE_TERRAIN_COST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_PROMOTION_CHANGES_IGNORE_TERRAIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Features
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Features
		(PromotionType,				FeatureType,	DoubleMove)
SELECT	'PROMOTION_JFD_INTREPID', 	Type,			1
FROM Features WHERE Type IN ('FEATURE_JUNGLE', 'FEATURE_FOREST', 'FEATURE_MARSH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_INTREPID' AND Value = 1);			
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,			UnitCombatType)
SELECT	'PROMOTION_JFD_BELEM', 	Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_CIVILIAN' ,'UNITCOMBAT_GREAT_PEOPLE', 'UNITCOMBAT_RELIGIOUS', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_ARMOR', 'UNITCOMBAT_SIEGE', 'UNITCOMBAT_RECON', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER' AND Value = 1);

-- INSERT INTO UnitPromotions_UnitCombats
		-- (PromotionType,			UnitCombatType)
-- SELECT	Type,					'UNITCOMBAT_RECON'
-- FROM UnitCombatInfos WHERE Type IN ('PROMOTION_JFD_GREAT_RECON', 'PROMOTION_JFD_GREAT_RECON_UNIT', 'PROMOTION_JFD_RECON_XP')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,			UnitCombatType)
SELECT	Type,					'UNITCOMBAT_RECON'
FROM UnitPromotions WHERE Type IN ('PROMOTION_JFD_INTREPID', 'PROMOTION_JFD_TACTICS');

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,						UnitCombatType)
SELECT	'PROMOTION_JFD_NAVAL_TRADITION', 	Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_CARRIER', 'UNITCOMBAT_SUBMARINE' ,'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	

