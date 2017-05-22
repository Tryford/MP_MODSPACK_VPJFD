--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 					Help, 											Sound, 				CannotBeChosen, 	MaxHitPointsChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_LEVY', 				'TXT_KEY_PROMOTION_JFD_LEVY',	'TXT_KEY_PROMOTION_JFD_LEVY_HELP', 				'AS2D_IF_LEVELUP', 	1, 					-50,				57, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEVY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 					Help, 											Sound, 				CannotBeChosen, 	MaxHitPointsChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_LEVY_DEFENSIVE', 	'TXT_KEY_PROMOTION_JFD_LEVY',	'TXT_KEY_PROMOTION_JFD_LEVY_HELP_DEFENSIVE', 	'AS2D_IF_LEVELUP', 	1, 					-50,				57, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEVY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================