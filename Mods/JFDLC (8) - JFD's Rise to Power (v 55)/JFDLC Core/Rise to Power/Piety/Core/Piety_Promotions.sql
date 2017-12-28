--==========================================================================================================================	
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
-----------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									Description, 								Help, 												Sound, 				GoldenAgeValueFromKills,			ExperiencePercent,					NearbyEnemyCombatMod,	LostWithUpgrade,		CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_RELIGIOUS_UNIT', 		'TXT_KEY_PROMOTION_JFD_RELIGIOUS_UNIT',		'TXT_KEY_PROMOTION_JFD_RELIGIOUS_UNIT_HELP', 		'AS2D_IF_LEVELUP', 	0,									0,									0,						1,						1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_RELIGIOUS_UNIT');
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				GreatGeneralModifier,				ExperiencePercent,					NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ALTAR',					'TXT_KEY_PROMOTION_JFD_ALTAR',				'TXT_KEY_PROMOTION_JFD_ALTAR_HELP',					'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);							
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				GoldenAgeValueFromKills,			ExperiencePercent,					NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TODAI',					'TXT_KEY_PROMOTION_JFD_TODAI',				'TXT_KEY_PROMOTION_JFD_TODAI_HELP',					'AS2D_IF_LEVELUP', 	50,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TODAI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				GreatGeneralModifier,				ExperiencePercent,					NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TORII',					'TXT_KEY_PROMOTION_JFD_TORII',				'TXT_KEY_PROMOTION_JFD_TORII_HELP',					'AS2D_IF_LEVELUP', 	33,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				GreatGeneralModifier,				ExperiencePercent,					NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_WAY_WARRIOR',			'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR',		'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR_HELP',			'AS2D_IF_LEVELUP', 	0,									20,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);						
---------------						
--Missionaries						
---------------						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				MovesChange,						VisibilityChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ASCETICS',				'TXT_KEY_PROMOTION_JFD_ASCETICS',			'TXT_KEY_PROMOTION_JFD_ASCETICS_HELP',				'AS2D_IF_LEVELUP', 	2,									1,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ASCETICS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				IgnoreTerrainCost,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_CANTORS',				'TXT_KEY_PROMOTION_JFD_CANTORS',			'TXT_KEY_PROMOTION_JFD_CANTORS_HELP',				'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CANTORS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				IgnoreTerrainCost,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_CELEBRANTS',				'TXT_KEY_PROMOTION_JFD_CELEBRANTS',			'TXT_KEY_PROMOTION_JFD_CELEBRANTS_HELP',			'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CELEBRANTS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				Sapper,								NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_CRUSADERS',				'TXT_KEY_PROMOTION_JFD_CRUSADERS',			'TXT_KEY_PROMOTION_JFD_CRUSADERS_HELP',				'AS2D_IF_LEVELUP', 	1,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CRUSADERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				IgnoreTerrainCost,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_JURISTS',				'TXT_KEY_PROMOTION_JFD_JURISTS',			'TXT_KEY_PROMOTION_JFD_JURISTS_HELP',				'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JURISTS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				IgnoreTerrainCost,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_MASTERS',				'TXT_KEY_PROMOTION_JFD_MASTERS',			'TXT_KEY_PROMOTION_JFD_MASTERS_HELP',				'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MASTERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);				
				
INSERT INTO UnitPromotions 				
		(Type, 									Description, 								Help, 												Sound, 				CombatBonusFromNearbyUnitClass,		NearbyUnitClassBonusRange,			NearbyUnitClassBonus,	AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_MONK_SOLDIERS',			'TXT_KEY_PROMOTION_JFD_MONK_SOLDIERS',		'TXT_KEY_PROMOTION_JFD_MONK_SOLDIERS_HELP',			'AS2D_IF_LEVELUP', 	'UNITCLASS_MISSIONARY',				1,									10,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MONK_SOLDIERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
		
INSERT INTO UnitPromotions 		
		(Type, 									Description, 								Help, 												Sound, 				IgnoreTerrainCost,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SCHOLARS',				'TXT_KEY_PROMOTION_JFD_SCHOLARS',			'TXT_KEY_PROMOTION_JFD_SCHOLARS_HELP',				'AS2D_IF_LEVELUP', 	0,									0,									0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SCHOLARS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				EnemyHealChange,					NeutralHealChange,					FriendlyHealChange,		AdjacentTileHealChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SHAMANS',				'TXT_KEY_PROMOTION_JFD_SHAMANS',			'TXT_KEY_PROMOTION_JFD_SHAMANS_HELP',				'AS2D_IF_LEVELUP', 	10,									10,									10,						10,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHAMANS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);						
						
INSERT INTO UnitPromotions 						
		(Type, 									Description, 								Help, 												Sound, 				GreatGeneralModifier,				ExperiencePercent,					NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ZEALOTS',				'TXT_KEY_PROMOTION_JFD_ZEALOTS',			'TXT_KEY_PROMOTION_JFD_ZEALOTS_HELP',				'AS2D_IF_LEVELUP', 	0,									0,									-5,						1,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ZEALOTS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
SELECT	'PROMOTION_JFD_ALTAR',					Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
SELECT	'PROMOTION_JFD_MONK_SOLDIERS',			UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION' AND NOT UnitCombatType = 'UNITCOMBAT_HELICOPTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
SELECT	'PROMOTION_JFD_TODAI',					UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION' AND NOT UnitCombatType = 'UNITCOMBAT_HELICOPTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
SELECT	'PROMOTION_JFD_TORII',					Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_YieldFromKills
		(PromotionType,					YieldType,		Yield)
SELECT	'PROMOTION_JFD_ALTAR',			'YIELD_FAITH',	100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_YieldChanges 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_CANTORS', 		'YIELD_CULTURE',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldChanges 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_CELEBRANTS', 	'YIELD_FAITH',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldChanges 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_MASTERS', 		'YIELD_GOLDEN_AGE_POINTS',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldChanges 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_JURISTS', 		'YIELD_PRODUCTION',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldChanges 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_SCHOLARS', 		'YIELD_SCIENCE',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_CANTORS', 		'YIELD_CULTURE',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_CELEBRANTS', 	'YIELD_FAITH',					5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_MASTERS', 		'YIELD_GOLDEN_AGE_POINTS',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_JURISTS', 		'YIELD_PRODUCTION',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO UnitPromotions_YieldModifiers 
		(PromotionType, 				YieldType, 						Yield)
SELECT	'PROMOTION_JFD_SCHOLARS', 		'YIELD_SCIENCE',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================