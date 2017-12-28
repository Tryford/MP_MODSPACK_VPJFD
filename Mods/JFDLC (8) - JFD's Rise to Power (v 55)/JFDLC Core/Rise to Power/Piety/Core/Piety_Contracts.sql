
--==========================================================================================================================
-- MERCENARY CONTRACTS
--==========================================================================================================================
-- Contracts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_ARJUNA', 			'CONTRACT_JFD_MERCENARY',	'ERA_CLASSICAL',	'ERA_INDUSTRIAL',	1,				'RELIGION_HINDUISM',		2,			4,				10,			2,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_ARJUNA_DESC',			'TXT_KEY_CONTRACT_JFD_ARJUNA_ADJ',			'TXT_KEY_CONTRACT_JFD_ARJUNA_TEXT',			'PROMOTION_JFD_ARJUNA',			'AS2D_CONTRACT_HINDUISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_BEKTASHI', 		'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_ISLAM',			2,			3,				15,			3,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_BEKTASHI_DESC',		'TXT_KEY_CONTRACT_JFD_BEKTASHI_ADJ',		'TXT_KEY_CONTRACT_JFD_BEKTASHI_TEXT',		'PROMOTION_JFD_BEKTASHI',		'AS2D_CONTRACT_ISLAM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_BROTHERHOOD', 	'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_ORTHODOXY',		3,			3,				15,			3,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_BROTHERHOOD_DESC',	'TXT_KEY_CONTRACT_JFD_BROTHERHOOD_ADJ',		'TXT_KEY_CONTRACT_JFD_BROTHERHOOD_TEXT',	'PROMOTION_JFD_BROTHERHOOD',	'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_BUDO', 			'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_SHINTO',			1,			1,				25,			5,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_BUDO_DESC',			'TXT_KEY_CONTRACT_JFD_BUDO_ADJ',			'TXT_KEY_CONTRACT_JFD_BUDO_TEXT',			'PROMOTION_JFD_BUDO',			'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_DEHRADUN', 		'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_SIKHISM',			2,			2,				20,			4,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_DEHRADUN_DESC',		'TXT_KEY_CONTRACT_JFD_DEHRADUN_ADJ',		'TXT_KEY_CONTRACT_JFD_DEHRADUN_TEXT',		'PROMOTION_JFD_DEHRADUN',		'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_EAGLE_WARRIORS', 	'CONTRACT_JFD_MERCENARY',	'ERA_ANCIENT',		'ERA_INDUSTRIAL',	1,				'RELIGION_SHINTO',			2,			2,				20,			4,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_EAGLE_WARRIORS_DESC',	'TXT_KEY_CONTRACT_JFD_EAGLE_WARRIORS_ADJ',	'TXT_KEY_CONTRACT_JFD_EAGLE_WARRIORS_TEXT',	'PROMOTION_JFD_EAGLE_WARRIORS',	'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_GOLDEN_DAWN', 	'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_HERMETICISM',		2,			3,				15,			3,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_GOLDEN_DAWN_DESC',	'TXT_KEY_CONTRACT_JFD_GOLDEN_DAWN_ADJ',		'TXT_KEY_CONTRACT_JFD_GOLDEN_DAWN_TEXT',	'PROMOTION_JFD_GOLDEN_DAWN',	'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_MT_WUDANG', 		'CONTRACT_JFD_MERCENARY',	'ERA_CLASSICAL',	'ERA_INDUSTRIAL',	1,				'RELIGION_TAOISM',			2,			2,				20,			4,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_MT_WUDANG_DESC',		'TXT_KEY_CONTRACT_JFD_MT_WUDANG_ADJ',		'TXT_KEY_CONTRACT_JFD_MT_WUDANG_TEXT',		'PROMOTION_JFD_MT_WUDANG',		'AS2D_CONTRACT_TAOISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_SCHMLKALDIC', 	'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_PROTESTANTISM',	2,			3,				15,			3,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_SCHMLKALDIC_DESC',	'TXT_KEY_CONTRACT_JFD_SCHMLKALDIC_ADJ',		'TXT_KEY_CONTRACT_JFD_SCHMLKALDIC_TEXT',	'PROMOTION_JFD_SCHMLKALDIC',	'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_SICARII', 		'CONTRACT_JFD_MERCENARY',	'ERA_CLASSICAL',	'ERA_INDUSTRIAL',	1,				'RELIGION_JUDAISM',			3,			4,				10,			2,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_SICARII_DESC',		'TXT_KEY_CONTRACT_JFD_SICARII_ADJ',			'TXT_KEY_CONTRACT_JFD_SICARII_TEXT',		'PROMOTION_JFD_SICARII',		'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_SOKO', 			'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_CONFUCIANISM',	2,			1,				25,			5,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_SOKO_DESC',			'TXT_KEY_CONTRACT_JFD_SOKO_ADJ',			'TXT_KEY_CONTRACT_JFD_SOKO_TEXT',			'PROMOTION_JFD_SOKO',			'AS2D_CONTRACT_CONFUCIANISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_SKY_LORDS', 		'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_TENGRIISM',		5,			4,				10,			2,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_SKY_LORDS_DESC',		'TXT_KEY_CONTRACT_JFD_SKY_LORDS_ADJ',		'TXT_KEY_CONTRACT_JFD_SKY_LORDS_TEXT',		'PROMOTION_JFD_SKY_LORDS',		'AS2D_INTERFACE_FAITH_PURCHASE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_ST_GEORGE', 		'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_CHRISTIANITY',	3,			2,				20,			4,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_ST_GEORGE_DESC',		'TXT_KEY_CONTRACT_JFD_ST_GEORGE_ADJ',		'TXT_KEY_CONTRACT_JFD_ST_GEORGE_TEXT',		'PROMOTION_JFD_ST_GEORGE',		'AS2D_CONTRACT_CATHOLICISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_SUN_KNIGHTS', 	'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_INDUSTRIAL',	1,				'RELIGION_ZOROASTRIANISM',	3,			3,				15,			3,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_SUN_KNIGHTS_DESC',	'TXT_KEY_CONTRACT_JFD_SUN_KNIGHTS_ADJ',		'TXT_KEY_CONTRACT_JFD_SUN_KNIGHTS_TEXT',	'PROMOTION_JFD_SUN_KNIGHTS',	'AS2D_CONTRACT_ZOROASTRIANISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contracts 
		(Type, 							Category,					PrereqEra,			ObsoleteEra,		IsHolyOrder,	RequiresReligionFounded,	UnitCount,	Maintenance,	PietyCost,	Rating, ContractTurns,	YieldText,				Description, 								Adjective, 									Civilopedia,								PromotionType,					PurchaseDing)
SELECT	'CONTRACT_JFD_TEN_TIGERS',		'CONTRACT_JFD_MERCENARY',	'ERA_MEDIEVAL',		'ERA_MODERN',		1,				'RELIGION_BUDDHISM',		1,			1,				25,			5,		25,				'[ICON_JFD_PIETY]',		'TXT_KEY_CONTRACT_JFD_TEN_TIGERS_DESC',		'TXT_KEY_CONTRACT_JFD_TEN_TIGERS_ADJ',		'TXT_KEY_CONTRACT_JFD_TEN_TIGERS_TEXT',		'PROMOTION_JFD_TEN_TIGERS',		'AS2D_CONTRACT_BUDDHISM_ACTIVATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

UPDATE Contracts
SET YieldText = '[ICON_JFD_PIETY]'
WHERE Type = 'CONTRACT_JFD_VARANGIAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);
-------------------------------------
-- Contract_UnitCombats
-------------------------------------
INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_ARJUNA',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_BEKTASHI',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_BROTHERHOOD',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_MOUNTED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_BUDO',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_DEHRADUN',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_EAGLE_WARRIORS',	Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_GOLDEN_DAWN',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_GUN', 'UNITCOMBAT_MOUNTED', 'UNITCOMBAT_RECON', 'UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_MT_WUDANG',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_SCHMLKALDIC',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MOUNTED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_SICARII',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_SKY_LORDS',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MOUNTED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_ST_GEORGE',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MOUNTED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_SUN_KNIGHTS',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO Contract_UnitCombats 
		(ContractType, 					UnitCombatType)
SELECT	'CONTRACT_JFD_TEN_TIGERS',		Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ARJUNA', 			'TXT_KEY_CONTRACT_JFD_ARJUNA_DESC',				'TXT_KEY_PROMOTION_JFD_ARJUNA_HELP',			0,						0,						1,						0,						0,					0,				0,				0,							1, 							1,				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_ARJUNA_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BEKTASHI', 			'TXT_KEY_CONTRACT_JFD_BEKTASHI_DESC',			'TXT_KEY_PROMOTION_JFD_BEKTASHI_HELP',			0,						0,						0,						0,						0,					0,				0,				0,							0,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_BEKTASHI_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BROTHERHOOD', 		'TXT_KEY_CONTRACT_JFD_BROTHERHOOD_DESC',		'TXT_KEY_PROMOTION_JFD_BROTHERHOOD_HELP',		0,						0,						0,						20,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_BROTHERHOOD_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUDO', 				'TXT_KEY_CONTRACT_JFD_BUDO_DESC',				'TXT_KEY_PROMOTION_JFD_BUDO_HELP',				0,						0,						0,						0,						0,					0,				0,				15,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_BUDO_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_DEHRADUN', 			'TXT_KEY_CONTRACT_JFD_DEHRADUN_DESC',			'TXT_KEY_PROMOTION_JFD_DEHRADUN_HELP',			0,						5,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_DEHRADUN_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_EAGLE_WARRIORS', 	'TXT_KEY_CONTRACT_JFD_EAGLE_WARRIORS_DESC',		'TXT_KEY_PROMOTION_JFD_EAGLE_WARRIORS_HELP',	0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_EAGLE_WARRIORS_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_GOLDEN_DAWN', 		'TXT_KEY_CONTRACT_JFD_GOLDEN_DAWN_DESC',		'TXT_KEY_PROMOTION_JFD_GOLDEN_DAWN_HELP',		0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_GOLDEN_DAWN_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_MT_WUDANG', 			'TXT_KEY_CONTRACT_JFD_MT_WUDANG_DESC',			'TXT_KEY_PROMOTION_JFD_MT_WUDANG_HELP',			0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_MT_WUDANG_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SCHMLKALDIC', 		'TXT_KEY_CONTRACT_JFD_SCHMLKALDIC_DESC',		'TXT_KEY_PROMOTION_JFD_SCHMLKALDIC_HELP',		0,						0,						0,						0,						0,					1,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_SCHMLKALDIC_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SICARII', 			'TXT_KEY_CONTRACT_JFD_SICARII_DESC',			'TXT_KEY_PROMOTION_JFD_SICARII_HELP',			0,						0,						0,						0,						0,					0,				1,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_SICARII_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SKY_LORDS', 			'TXT_KEY_CONTRACT_JFD_SKY_LORDS_DESC',			'TXT_KEY_PROMOTION_JFD_SKY_LORDS_HELP',			0,						0,						0,						0,						1,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_SKY_LORDS_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SOKO', 				'TXT_KEY_CONTRACT_JFD_SOKO_DESC',				'TXT_KEY_PROMOTION_JFD_SOKO_HELP',				0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_SOKO_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ST_GEORGE', 			'TXT_KEY_CONTRACT_JFD_ST_GEORGE_DESC',			'TXT_KEY_PROMOTION_JFD_ST_GEORGE_HELP',			0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_ST_GEORGE_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_SUN_KNIGHTS', 		'TXT_KEY_CONTRACT_JFD_SUN_KNIGHTS_DESC',		'TXT_KEY_PROMOTION_JFD_SUN_KNIGHTS_HELP',		20,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_SUN_KNIGHTS_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 											AttackFortifiedMod,		AdjacentTileHealChange,	RangeAttackIgnoreLOS,	FlankAttackModifier,	FreePillageMoves,	HeavyCharge,	EnemyRoute,		HPHealedIfDestroyEnemy,		IgnoreGreatGeneralBenefit,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TEN_TIGERS', 		'TXT_KEY_CONTRACT_JFD_TEN_TIGERS_DESC',			'TXT_KEY_PROMOTION_JFD_TEN_TIGERS_HELP',		0,						0,						0,						0,						0,					0,				0,				0,							1,							1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_CONTRACT_JFD_TEN_TIGERS_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);
------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------
INSERT INTO UnitPromotions_UnitCombatMods 
		(PromotionType, 					UnitCombatType, 				Modifier)
SELECT	'PROMOTION_JFD_MT_WUDANG', 			'UNITCOMBAT_MELEE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);
------------------------------
-- UnitPromotions_YieldFromKills
------------------------------
INSERT INTO UnitPromotions_YieldFromKills 
		(PromotionType, 					YieldType, 						Yield)
SELECT	'PROMOTION_JFD_EAGLE_WARRIORS', 	'YIELD_GREAT_GENERAL_POINTS',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO UnitPromotions_YieldFromKills 
		(PromotionType, 					YieldType, 						Yield)
SELECT	'PROMOTION_JFD_GOLDEN_DAWN', 		'YIELD_SCIENCE',				50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO UnitPromotions_YieldFromKills 
		(PromotionType, 					YieldType, 						Yield)
SELECT	'PROMOTION_JFD_SOKO', 				'YIELD_CULTURE',				50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);

INSERT INTO UnitPromotions_YieldFromKills 
		(PromotionType, 					YieldType, 						Yield)
SELECT	'PROMOTION_JFD_TEN_TIGERS', 		'YIELD_GOLDEN_AGE_POINTS',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================