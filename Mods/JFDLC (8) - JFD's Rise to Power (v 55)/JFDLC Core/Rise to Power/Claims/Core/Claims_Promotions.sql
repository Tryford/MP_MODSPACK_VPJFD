--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO UnitPromotions
		(Type, 								TradeMissionInfluenceModifier,	RivalTerritory,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_GREAT_DIGNITARY', 	100,							1,				'TXT_KEY_PROMOTION_JFD_GREAT_DIGNITARY',	'TXT_KEY_PROMOTION_JFD_GREAT_DIGNITARY_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT OR REPLACE INTO UnitPromotions
		(Type, 								TradeMissionInfluenceModifier,	RivalTerritory,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_GREAT_MAGISTRATE', 	0,								1,				'TXT_KEY_PROMOTION_JFD_GREAT_MAGISTRATE',	'TXT_KEY_PROMOTION_JFD_GREAT_MAGISTRATE_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_GREAT_MAGISTRATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT OR REPLACE INTO UnitPromotions
		(Type, 								TradeMissionInfluenceModifier,	RivalTerritory,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_GREAT_MERCHANT', 		-100,							0,				'TXT_KEY_PROMOTION_GREAT_MERCHANT',			'TXT_KEY_PROMOTION_GREAT_MERCHANT_HELP',		'AS2D_IF_LEVELUP',	1,				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_GREAT_MERCHANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================