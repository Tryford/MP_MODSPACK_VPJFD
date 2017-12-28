--==========================================================================================================================	
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
-----------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						Description, 							Help, 										Sound, 				OutsideFriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BOLD',		'TXT_KEY_PROMOTION_JFD_BOLD',			'TXT_KEY_PROMOTION_JFD_BOLD_HELP',			'AS2D_IF_LEVELUP',  10,								1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 						Description, 							Help, 										Sound, 				ExperiencePercent,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_GREAT',		'TXT_KEY_PROMOTION_JFD_GREAT',			'TXT_KEY_PROMOTION_JFD_GREAT_HELP',			'AS2D_IF_LEVELUP',  20,					1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GREAT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 						Description, 							Help, 										Sound, 				VisibilityChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_NAVIGATOR',	'TXT_KEY_PROMOTION_JFD_NAVIGATOR',		'TXT_KEY_PROMOTION_JFD_NAVIGATOR_HELP',		'AS2D_IF_LEVELUP',  1,					1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_NAVIGATOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 						Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ZEALOT',		'TXT_KEY_PROMOTION_JFD_ZEALOT',			'TXT_KEY_PROMOTION_JFD_ZEALOT_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ZEALOT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
SELECT	'PROMOTION_JFD_BOLD',		UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
SELECT	'PROMOTION_JFD_GREAT',		UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
SELECT	'PROMOTION_JFD_NAVIGATOR',	UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_SUPPLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
SELECT	'PROMOTION_JFD_ZEALOT',		UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_YieldFromKills
		(PromotionType,				YieldType,		Yield)
SELECT	'PROMOTION_JFD_ZEALOT',		'YIELD_FAITH',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--========================================================================================================================================================================
--========================================================================================================================================================================