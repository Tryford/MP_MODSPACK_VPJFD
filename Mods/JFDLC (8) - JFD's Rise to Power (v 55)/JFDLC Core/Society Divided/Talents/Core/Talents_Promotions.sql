--==========================================================================================================================	
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_1',		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_2', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_3', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_4', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_5', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_6',		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_7', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_8', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_9', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_10',		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_11',		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 							IsTalent,		Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TALENT_12', 		1,				'TXT_KEY_PROMOTION_JFD_TALENT',			'TXT_KEY_PROMOTION_JFD_TALENT_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_TALENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Hide
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Hide
		(PromotionType,	EnemyUnitPanel,	UnitPanel)
SELECT   Type,			1,				1
FROM UnitPromotions WHERE IsTalent = 1;
------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT   Type
FROM UnitPromotions WHERE IsTalent = 1;
--==========================================================================================================================
--==========================================================================================================================