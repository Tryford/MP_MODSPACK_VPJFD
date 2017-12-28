--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
-----------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				AdjacentTileHealChange,		CapitalDefenseModifier,	CapitalDefenseFalloff,	FriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_COMMAND_SOVEREIGN',	'TXT_KEY_PROMOTION_JFD_COMMAND_SOVEREIGN',	'TXT_KEY_PROMOTION_JFD_COMMAND_SOVEREIGN_HELP',	'AS2D_IF_LEVELUP', 	0,							25,						-3,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COMMAND_SOVEREIGN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				GoldenAgeValueFromKills,	CapitalDefenseModifier,	CapitalDefenseFalloff,	FriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_COMMAND_STATE',		'TXT_KEY_PROMOTION_JFD_COMMAND_STATE',		'TXT_KEY_PROMOTION_JFD_COMMAND_STATE_HELP',		'AS2D_IF_LEVELUP', 	0,							0,						0,						15,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COMMAND_STATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				AdjacentTileHealChange,		CapitalDefenseModifier,	CapitalDefenseFalloff,	FriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ORDERS_CHARITABLE',	'TXT_KEY_PROMOTION_JFD_ORDERS_CHARITABLE',	'TXT_KEY_PROMOTION_JFD_ORDERS_CHARITABLE_HELP',	'AS2D_IF_LEVELUP', 	5,							0,						0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ORDERS_CHARITABLE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				GoldenAgeValueFromKills,	CapitalDefenseModifier,	CapitalDefenseFalloff,	FriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ORDERS_MILITANT',	'TXT_KEY_PROMOTION_JFD_ORDERS_MILITANT',	'TXT_KEY_PROMOTION_JFD_ORDERS_MILITANT_HELP',	'AS2D_IF_LEVELUP', 	50,							0,						0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ORDERS_MILITANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================