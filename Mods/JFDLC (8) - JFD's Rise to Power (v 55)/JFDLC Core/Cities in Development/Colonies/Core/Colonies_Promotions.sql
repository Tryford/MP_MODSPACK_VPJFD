--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions	
		(Type, 								Description, 								Help, 											EnemyDamageChance,	EnemyDamage, NeutralDamageChance,	EnemyHealChange,	NeutralHealChange,	NeutralDamage,	AttackMod,	DefenseMod,	Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_COLONIAL_SETTLER', 	'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER',	'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER_HELP',	0,					0,			0,						0,					0,					0,				0,			0,			'AS2D_IF_LEVELUP',	1, 				42, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_COLONIAL_SETTLER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

UPDATE UnitPromotions
SET MovesChange = 1, Description = 'TXT_KEY_PROMOTION_JFD_FAST_ADMIRAL', Help = 'TXT_KEY_PROMOTION_JFD_FAST_ADMIRAL_HELP'
WHERE Type = 'PROMOTION_FAST_ADMIRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================