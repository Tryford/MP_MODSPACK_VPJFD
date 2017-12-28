--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type, 								Description, 								Help, 											Sound, 				PromotionPrereq,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 		 PediaEntry)
VALUES	('PROMOTION_EVENTS_JFD_VENTURER', 	'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER',	'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER_HELP',	'AS2D_IF_LEVELUP',	NULL,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_SHARED',	 'TXT_KEY_PROMOTION_EVENTS_JFD_VENTURER');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitPromotions_YieldFromScouting
		(PromotionType,						YieldType,		Yield)
VALUES	('PROMOTION_EVENTS_JFD_VENTURER',	'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================