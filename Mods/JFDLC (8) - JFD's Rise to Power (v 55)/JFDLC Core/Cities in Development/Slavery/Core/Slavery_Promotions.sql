--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions	
		(Type, 						ExperiencePercent,			UpgradeDiscount,	Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ENSLAVED', 	-50,						-100,				'TXT_KEY_PROMOTION_JFD_ENSLAVED',	'TXT_KEY_PROMOTION_JFD_ENSLAVED_HELP',	'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_ENSLAVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================