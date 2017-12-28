--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,							Description)
SELECT	'UNITCLASS_JFD_DRAGOON',			'UNIT_JFD_DRAGOON',						'TXT_KEY_UNIT_JFD_DRAGOON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);
INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,							Description)
SELECT	'UNITCLASS_JFD_GALLEY',				'UNIT_JFD_GALLEY',						'TXT_KEY_UNIT_JFD_GALLEY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,							Description)
SELECT	'UNITCLASS_JFD_MOUNTED_BOW',		'UNIT_JFD_MOUNTED_BOW',					'TXT_KEY_UNIT_JFD_MOUNTED_BOW'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,							Description)
SELECT	'UNITCLASS_JFD_PISTOLIER',			'UNIT_JFD_PISTOLIER',					'TXT_KEY_UNIT_JFD_PISTOLIER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,							Description)
SELECT	'UNITCLASS_JFD_SLINGER',			'UNIT_JFD_SLINGER',						'TXT_KEY_UNIT_JFD_SLINGER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

INSERT INTO UnitClasses 
		(Type,								Description,							DefaultUnit)
SELECT	'UNITCLASS_JFD_WORKER',				'TXT_KEY_UNIT_JFD_WORKER', 				'UNIT_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);	
--------------------------------
-- Great People
--------------------------------
INSERT INTO UnitClasses 	
		(Type, 								Description, 							DefaultUnit)
SELECT	'UNITCLASS_JFD_GREAT_DIRECTOR',		'TXT_KEY_UNIT_JFD_GREAT_DIRECTOR', 		'UNIT_JFD_GREAT_DIRECTOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_UnitClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType,					UnitClassType,				UnitType)
SELECT	'CIVILIZATION_BARBARIAN',			'UNITCLASS_JFD_SLINGER', 	NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_JFD_BuildCharges
		(UnitClassType,						NumCharges)
SELECT	'UNITCLASS_JFD_SLAVE',				4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

INSERT INTO UnitClass_JFD_BuildCharges
		(UnitClassType,						NumCharges)
SELECT	'UNITCLASS_WORKER',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitClass_JFD_BuildCharges
		(UnitClassType,						NumCharges)
SELECT	'UNITCLASS_JFD_WORKER',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

INSERT INTO UnitClass_JFD_BuildCharges
		(UnitClassType,						NumCharges)
SELECT	'UNITCLASS_WORKBOAT',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 					MissionType)
SELECT	'UNITCLASS_JFD_GREAT_DIRECTOR', 	'MISSION_JFD_JOIN_COUNCIL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO UnitClass_Missions 	
		(UnitClassType, 					MissionType)
SELECT	'UNITCLASS_JFD_GREAT_DIRECTOR', 	'MISSION_JFD_HOST_FILM_FESTIVAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Units WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE' AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	

UPDATE Units SET Cost = -1, FaithCost = -1, ShowInPedia = 0 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR'																																																																																																					   										 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);
	
INSERT INTO Units 	
		(Type, 						 Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 		CombatClass,					Domain,			DefaultUnitAI,		Description, 						Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass,	UnitArtInfo, 						MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_DRAGOON', 	 	 'UNITCLASS_JFD_DRAGOON',		1,				1,		Combat-4,	Combat-4,		Cost,	FaithCost,	'TECH_RIFLING',				RequiresFaithPurchaseEnabled,	Moves, 		'UNITCOMBAT_ARCHER',			Domain,			'UNITAI_RANGED',	'TXT_KEY_UNIT_JFD_DRAGOON',			'TXT_KEY_UNIT_JFD_DRAGOON_STRATEGY', 			'TXT_KEY_UNIT_HELP_JFD_DRAGOON',			'TXT_KEY_CIV5_JFD_DRAGOON_TEXT',		MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_BALLISTICS',	XPValueDefense, GoodyHutUpgradeUnitClass,	'ART_DEF_UNIT_JFD_DRAGOON',			MoveRate,	8,					'EXPANSION_UNIT_FLAG_ATLAS',		8,				'EXPANSION_UNIT_ATLAS_1'
FROM Units WHERE Type = 'UNIT_CAVALRY'																																																																																																																														   										 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Units 	
		(Type, 						 Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 		CombatClass,					Domain,			DefaultUnitAI,		Description, 						Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass,	UnitArtInfo, 						MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_GALLEY', 	 		 'UNITCLASS_JFD_GALLEY',		0,				1,		9,			8,				56,		112,		'TECH_SAILING',				RequiresFaithPurchaseEnabled,	3, 			'UNITCOMBAT_NAVALRANGED',		Domain,			DefaultUnitAI,		'TXT_KEY_UNIT_JFD_GALLEY',			'TXT_KEY_UNIT_JFD_GALLEY_STRATEGY', 			'TXT_KEY_UNIT_HELP_JFD_GALLEY',				'TXT_KEY_CIV5_JFD_GALLEY_TEXT',			MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_COMPASS',	XPValueDefense, GoodyHutUpgradeUnitClass,	'ART_DEF_UNIT_JFD_GALLEY',			MoveRate,	23,					UnitFlagAtlas,						2,				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_TRIREME'																																																																																																																														   										 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);		

INSERT INTO Units 			
		(Type, 						 Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 		CombatClass,					Domain,			DefaultUnitAI,		Description, 						Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass,	UnitArtInfo, 						MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_MOUNTED_BOW', 	 'UNITCLASS_JFD_MOUNTED_BOW',	1,				2,		Combat-7,	Combat-2,		Cost,	FaithCost,	'TECH_MACHINERY',			RequiresFaithPurchaseEnabled,	Moves, 		'UNITCOMBAT_ARCHER',			Domain,			'UNITAI_RANGED',	'TXT_KEY_UNIT_JFD_MOUNTED_BOW',		'TXT_KEY_UNIT_JFD_MOUNTED_BOW_STRATEGY', 		'TXT_KEY_UNIT_HELP_JFD_MOUNTED_BOW',		'TXT_KEY_CIV5_JFD_MOUNTED_BOW_TEXT',	MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_METALLURGY',	XPValueDefense, GoodyHutUpgradeUnitClass,	'ART_DEF_UNIT_JFD_MOUNTED_BOW',		MoveRate,	0,					'JFD_MOUNTED_BOW_FLAG_ART_ATLAS',	1,				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_KNIGHT'																																																																																																																														   										 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);																																																																																																								   										 
																																																																																																																																																	
INSERT INTO Units 																																																																																																																																			   										 
		(Type, 						 Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 		CombatClass,					Domain,			DefaultUnitAI,		Description, 						Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 							MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_PISTOLIER', 		 'UNITCLASS_JFD_PISTOLIER',		1,				1,		Combat-5,	Combat-5,		Cost,	FaithCost,	'TECH_METALLURGY',			RequiresFaithPurchaseEnabled,	Moves, 		'UNITCOMBAT_ARCHER',			Domain,			'UNITAI_RANGED',	'TXT_KEY_UNIT_JFD_PISTOLIER',		'TXT_KEY_UNIT_JFD_PISTOLIER_STRATEGY', 			'TXT_KEY_UNIT_HELP_JFD_PISTOLIER',			'TXT_KEY_CIV5_JFD_PISTOLIER_TEXT',		MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_BALLISTICS',	XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_PISTOLIER',			MoveRate,	0,					'JFD_PISTOLIER_FLAG_ART_ATLAS',		4,				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER'																																																																																																																												   										 	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);																																																																																																								   										 	
																																																																																																																																																		
INSERT INTO Units 																																																																																																																																			   										 	
		(Type, 						Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 		CombatClass,					Domain,			DefaultUnitAI,		Description, 						 Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass,	UnitArtInfo, 						MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_SLINGER', 		'UNITCLASS_JFD_SLINGER',		0,				1,		4,			5,				35,		70,			NULL,						RequiresFaithPurchaseEnabled,	Moves, 		'UNITCOMBAT_ARCHER',			Domain,			'UNITAI_RANGED',	'TXT_KEY_UNIT_JFD_SLINGER',			 'TXT_KEY_UNIT_JFD_SLINGER_STRATEGY',			'TXT_KEY_UNIT_HELP_JFD_SLINGER',			'TXT_KEY_CIV5_JFD_SLINGER_TEXT',		MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_ARCHERY',	XPValueDefense, 'UNITCLASS_ARCHER',			'ART_DEF_UNIT_JFD_SLINGER',			MoveRate,	0,					'JFD_SLINGER_FLAG_ART_ATLAS',		0,				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

-- INSERT INTO Units 	
		-- (Type, 						Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, CombatClass,					Domain,			DefaultUnitAI,		Description, 						 Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit,	CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass,	UnitArtInfo, 						MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex,	IconAtlas)
-- SELECT	'UNIT_JFD_SLINGER_BARB', 	'UNITCLASS_JFD_SLINGER',		0,				1,		3,			4,				15,		70,			NULL,						RequiresFaithPurchaseEnabled,	Moves, 'UNITCOMBAT_ARCHER',			Domain,			'UNITAI_RANGED',	'TXT_KEY_UNIT_JFD_SLINGER',			 'TXT_KEY_UNIT_JFD_SLINGER_STRATEGY',			'TXT_KEY_UNIT_HELP_JFD_SLINGER',			'TXT_KEY_CIV5_JFD_SLINGER_TEXT',		MilitarySupport, MilitaryProduction, Pillage, 0,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit,	CombatLimit, 'TECH_ARCHERY',	XPValueDefense, 'UNITCLASS_ARCHER',			'ART_DEF_UNIT_JFD_SLINGER',			MoveRate,	0,					'JFD_SLINGER_FLAG_ART_ATLAS',	0,				'JFD_PROGRESS_UNIT_ATLAS'
-- FROM Units WHERE Type = 'UNIT_ARCHER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

INSERT INTO Units 																																																																																																																																	   										 
		(Type, 						 Class,							IsMounted,		Range,	Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves, 	 	CombatClass,					Domain,			DefaultUnitAI,		Description, 						Strategy, 										Help, 										Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, ShowInPedia, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 							MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_WINDBUCHSE', 		 Class,							0,				0,		Combat,		RangedCombat,	Cost,	FaithCost,	PrereqTech,					RequiresFaithPurchaseEnabled,	Moves+1, 	CombatClass,					Domain,			DefaultUnitAI,		'TXT_KEY_UNIT_JFD_WINDBUCHSE',		'TXT_KEY_UNIT_JFD_WINDBUCHSE_STRATEGY', 		'TXT_KEY_UNIT_HELP_JFD_WINDBUCHSE',			'TXT_KEY_CIV5_JFD_WINDBUCHSE_TEXT',		MilitarySupport, MilitaryProduction, Pillage, 1,		   IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_BALLISTICS',	XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_WINDBUCHSE',		MoveRate,	0,					'JFD_WINDBUCHSE_FLAG_ART_ATLAS',	3,				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN'																																																																																																																										   										 	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Units 
		(Type,						Class,							WorkRate,		CivilianAttackPriority, 			Cost,	FaithCost,	PrereqTech,					ExtraMaintenanceCost,			Moves,		Capture, 					Domain,			DefaultUnitAI,		Description,						Strategy,										Help,										Civilopedia,							UnitArtInfo,						IconAtlas,			AdvancedStartCost, 		PortraitIndex,	UnitFlagAtlas,		UnitFlagIconOffset,	MoveRate)
SELECT	'UNIT_JFD_WORKER',			'UNITCLASS_JFD_WORKER',			150,			'CIVILIAN_ATTACK_PRIORITY_LOW',		300,	0,			'TECH_INDUSTRIALIZATION',	1,								2,			'UNITCLASS_JFD_WORKER',		'DOMAIN_LAND',	'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_WORKER',			'TXT_KEY_UNIT_JFD_WORKER_STRATEGY',				'TXT_KEY_UNIT_HELP_JFD_WORKER', 			'TXT_KEY_CIV5_JFD_WORKER_TEXT',			'ART_DEF_UNIT_JFD_WORKER',			'UNIT_ATLAS_2',		35,						43,				'UNIT_FLAG_ATLAS',	1,					'BIPED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

--Archer
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_ARCHER_STRATEGY'
WHERE Type = 'UNIT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

--Atlatlist
UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_JFD_ATLATLIST', Strategy = 'TXT_KEY_UNIT_JFD_ATLATLIST_STRATEGY', Class = 'UNITCLASS_JFD_SLINGER', PrereqTech = NULL
WHERE Type = 'UNIT_MAYAN_ATLATLIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

--Barbarian Galley
UPDATE Units
SET Range = 1, RangedCombat = 8, Combat = 7, Cost = 56, ShowInPedia = 0
WHERE Type = 'UNIT_GALLEY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

--Bolas Warrior
UPDATE Units
SET Description = 'TXT_KEY_UNIT_JFD_BOLA', Help = 'TXT_KEY_UNIT_HELP_JFD_BOLA', Strategy = 'TXT_KEY_UNIT_JFD_BOLA_STRATEGY', Class = 'UNITCLASS_JFD_SLINGER', PrereqTech = 'TECH_JFD_HUNTING'
WHERE Type = 'UNIT_INCAN_SLINGER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

--Camel Archer
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_CAMEL_ARCHER_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_CAMEL_ARCHER_HELP', Class = 'UNITCLASS_JFD_MOUNTED_BOW'
WHERE Type = 'UNIT_ARABIAN_CAMELARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

--Chariot Archer
UPDATE Units
SET IsMounted = 1
WHERE Class = 'UNITCLASS_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

--Cuirassier
UPDATE Units
SET IsMounted = 1, Class = 'UNITCLASS_JFD_PISTOLIER', ObsoleteTech = 'TECH_RIFLING'
WHERE RangedCombat > 0 AND Class = 'UNITCLASS_EE_CUIRASSIER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

UPDATE Units
SET PrereqTech = 'TECH_METALLURGY'
WHERE RangedCombat > 0 AND Class = 'UNITCLASS_EE_CUIRASSIER' AND PrereqTech = 'TECH_EE_IMPERIALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

--Dromon 
UPDATE Units
SET RangedCombat = RangedCombat+1, Cost = 56, PrereqTech = 'TECH_SAILING', Class = 'UNITCLASS_JFD_GALLEY'
WHERE Type = 'UNIT_BYZANTINE_DROMON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);	

--Keshik
UPDATE Units
SET IsMounted = 1, Strategy = 'TXT_KEY_UNIT_JFD_KESHIK_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_KESHIK_HELP', Class = 'UNITCLASS_JFD_MOUNTED_BOW', RangedCombat = RangedCombat+2
WHERE Type = 'UNIT_MONGOLIAN_KESHIK'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

--Knight
UPDATE Units
SET IsMounted = 1, Class = 'UNITCLASS_JFD_MOUNTED_BOW', ObsoleteTech = 'TECH_METALLURGY'
WHERE RangedCombat > 0 AND Class = 'UNITCLASS_KNIGHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

UPDATE Units
SET PrereqTech = 'TECH_MACHINERY'
WHERE RangedCombat > 0 AND Class = 'UNITCLASS_KNIGHT' AND PrereqTech = 'TECH_CHIVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

--Peasant
UPDATE Units
SET Description = 'TXT_KEY_UNIT_JFD_PEASANT', Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP', Civilopedia = 'TXT_KEY_UNIT_JFD_PEASANT_PEDIA', Capture = 'UNITCLASS_WORKER'
WHERE Type = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

--Trireme
UPDATE Units
SET Combat = Combat+2, Cost = Cost+30, FaithCost = Cost+60
WHERE Class = 'UNITCLASS_TRIREME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

UPDATE Units
SET PrereqTech = 'TECH_OPTICS'
WHERE Class = 'UNITCLASS_TRIREME' AND PrereqTech = 'TECH_SAILING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

--Unique Slingers
UPDATE Units
SET Class = 'UNITCLASS_JFD_SLINGER', Cost = 40, FaithCost = 80, PrereqTech = NULL, Combat = Combat-3, RangedCombat = RangedCombat-3
WHERE Type IN ('UNIT_INCAN_SLINGER', 'UNIT_MAYAN_ATLATLIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

--Worker
UPDATE Units
SET Cost = 50, UnitArtInfoEraVariation = 1, ExtraMaintenanceCost = 0, ObsoleteTech = 'TECH_INDUSTRIALIZATION', PrereqTech = 'TECH_AGRICULTURE', WorkRate = 75
WHERE Class = 'UNITCLASS_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------
-- Great People
--------------------------------
INSERT INTO Units 	
		(Type, 						Class,								GPExtra,	DontShowYields,  Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 							 Strategy,									 UnitArtInfoEraVariation,	AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GREAT_DIRECTOR',	'UNITCLASS_JFD_GREAT_DIRECTOR',		4,			1,				 Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GREAT_DIRECTOR',	'TXT_KEY_CIV5_JFD_GREAT_DIRECTOR_TEXT',  'TXT_KEY_UNIT_JFD_GREAT_DIRECTOR_STRATEGY', 1,							AdvancedStartCost, WorkRate, CombatLimit, DontShowYields, 'ART_DEF_UNIT_JFD_GREAT_DIRECTOR',   0,					'JFD_GREAT_DIRECTOR_FLAG_ART_ATLAS',	MoveRate, 5, 				'JFD_PROGRESS_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				3
FROM Units WHERE Type = 'UNIT_ROMAN_LEGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_DRAGOON', 		SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_GALLEY', 			SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TRIREME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_MOUNTED_BOW', 	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CROSSBOWMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_PISTOLIER', 		SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_EE_CUIRASSIER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_SLINGER', 		SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

-- INSERT INTO UnitGameplay2DScripts 	
		-- (UnitType, 					SelectionSound,		FirstSelectionSound)
-- SELECT	'UNIT_JFD_SLINGER_BARB', 	SelectionSound,		FirstSelectionSound
-- FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARCHER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_WINDBUCHSE', 		SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JFD_WORKER',			SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_JFD_MOUNTED_BOW'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CHARIOT_ARCHER' AND IsMounted = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_JFD_DRAGOON'
WHERE UnitType IN (SELECT Type FROM Units WHERE RangedCombat > 0 AND Class IN ('UNITCLASS_JFD_PISTOLIER', 'UNITCLASS_EE_CUIRASSIER'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_GALLEY',			'UNITCLASS_GALLEASS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_GALLEY',		'UNITCLASS_GALLEASS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_PISTOLIER',	'UNITCLASS_JFD_DRAGOON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_MOUNTED_BOW',	'UNITCLASS_JFD_DRAGOON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

DELETE FROM Unit_ClassUpgrades WHERE UnitType IN ('UNIT_ARABIAN_CAMELARCHER', 'UNIT_MONGOLIAN_KESHIK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	Type, 					'UNITCLASS_JFD_DRAGOON'
FROM Units WHERE Type IN ('UNIT_ARABIAN_CAMELARCHER', 'UNIT_MONGOLIAN_KESHIK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_MOUNTED_BOW',	'UNITCLASS_JFD_PISTOLIER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

DELETE FROM Unit_ClassUpgrades WHERE UnitType IN ('UNIT_ARABIAN_CAMELARCHER', 'UNIT_MONGOLIAN_KESHIK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	Type, 					'UNITCLASS_JFD_PISTOLIER'
FROM Units WHERE Type IN ('UNIT_ARABIAN_CAMELARCHER', 'UNIT_MONGOLIAN_KESHIK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

DELETE FROM Unit_ClassUpgrades WHERE UnitType IN ('UNIT_INCAN_SLINGER', 'UNIT_MAYAN_ATLATLIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	Type, 					'UNITCLASS_ARCHER'
FROM Units WHERE Type IN ('UNIT_JFD_SLINGER', 'UNIT_JFD_SLINGER_BARB', 'UNIT_INCAN_SLINGER', 'UNIT_MAYAN_ATLATLIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	Type, 					'UNITCLASS_SPEARMAN'
FROM Units WHERE Class IN ('UNITCLASS_WARRIOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES' AND Value = 1);	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	Type, 					'UNITCLASS_MUSKETMAN'
FROM Units WHERE Class IN ('UNITCLASS_CROSSBOWMAN', 'UNITCLASS_PIKEMAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES' AND Value = 1);	

INSERT INTO Unit_ClassUpgrades
		(UnitType, 				UnitClassType)
SELECT 	'UNIT_JFD_WINDBUCHSE',	'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_ClassUpgrades
		(UnitType, 				UnitClassType)
SELECT 	'UNIT_WORKER',			'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Unit_ClassUpgrades_Multi
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WARRIOR', 'UNITCLASS_CROSSBOWMAN', 'UNITCLASS_PIKEMAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES' AND Value = 1)
BEGIN
	INSERT INTO Unit_ClassUpgrades
			(UnitType,			UnitClassType)
	SELECT	NEW.Type,			'UNITCLASS_SPEARMAN'
	WHERE NEW.Class = 'UNITCLASS_WARRIOR';

	INSERT INTO Unit_ClassUpgrades
			(UnitType,			UnitClassType)
	SELECT	NEW.Type,			'UNITCLASS_MUSKETMAN'
	WHERE NEW.Class IN ('UNITCLASS_CROSSBOWMAN', 'UNITCLASS_PIKEMAN');
END;
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_JFD_DRAGOON',			ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_JFD_MOUNTED_BOW',		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_JFD_PISTOLIER',		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_EE_CUIRASSIER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);		
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_DRAGOON',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GALLEY',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TRIREME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GREAT_DIRECTOR',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_MOUNTED_BOW',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_PISTOLIER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_SLINGER',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

-- INSERT INTO Unit_AITypes 	
		-- (UnitType, 					UnitAIType)
-- SELECT	'UNIT_JFD_SLINGER_BARB',	UnitAIType
-- FROM Unit_AITypes WHERE UnitType = 'UNIT_ARCHER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

INSERT INTO Unit_AITypes 
		(UnitType,					UnitAIType)
SELECT	'UNIT_JFD_WINDBUCHSE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_AITypes 
		(UnitType,					UnitAIType)
SELECT	'UNIT_JFD_WORKER',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_DRAGOON', 		'FLAVOR_OFFENSE',		16
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_DRAGOON', 		'FLAVOR_RANGED',		24
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_DRAGOON', 		'FLAVOR_MOBILE',		18
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_GALLEY', 			'FLAVOR_NAVAL',			6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_GALLEY', 			'FLAVOR_NAVAL_RECON',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 	FlavorType,				Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_MOUNTED_BOW', 	'FLAVOR_OFFENSE',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_MOUNTED_BOW', 	'FLAVOR_RANGED',		9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_MOUNTED_BOW', 	'FLAVOR_MOBILE',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_PISTOLIER',		'FLAVOR_OFFENSE',		12
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_PISTOLIER', 		'FLAVOR_RANGED',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_PISTOLIER', 		'FLAVOR_MOBILE',		14
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,				Flavor)
SELECT	'UNIT_JFD_SLINGER', 		FlavorType,				Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

-- INSERT INTO Unit_Flavors 	
		-- (UnitType, 					FlavorType,			Flavor)
-- SELECT	'UNIT_JFD_SLINGER_BARB', 	FlavorType,			Flavor
-- FROM Unit_Flavors WHERE UnitType = 'UNIT_ARCHER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);	

INSERT INTO Unit_Flavors 
		(UnitType,					FlavorType,				Flavor)
SELECT	'UNIT_JFD_WINDBUCHSE',		FlavorType,				Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_Flavors 
		(UnitType,					FlavorType,				Flavor)
SELECT	'UNIT_JFD_WORKER',			FlavorType,				Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_DRAGOON',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GALLEY',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_TRIREME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_MOUNTED_BOW',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_PISTOLIER',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHARIOT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	Type,						'PROMOTION_CITY_PENALTY'
FROM Units WHERE IsMounted = 1 AND CombatClass = 'UNITCOMBAT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	Type,						'PROMOTION_JFD_NAVAL_PENALTY'
FROM Units WHERE IsMounted = 1 AND CombatClass = 'UNITCOMBAT_ARCHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROMOTION_ADDITIONS_NAVAL_PENALTY' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT 	'UNIT_JFD_WINDBUCHSE',		'PROMOTION_EXTRA_SIGHT_I'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT 	'UNIT_JFD_WINDBUCHSE',		'PROMOTION_FLANK_ATTACK_BONUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT 	'UNIT_WORKER',				'PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds
		(UnitType,					BuildType)
SELECT	Type,						'BUILD_JFD_WHALE_BOATS'
FROM Units WHERE Class = 'UNITCLASS_WORKBOAT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Unit_Builds_WhalingBoats
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKBOAT') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS' AND Value = 1)
BEGIN
	INSERT INTO Unit_Builds
			(UnitType,		BuildType)
	VALUES	(NEW.Type,		'BUILD_JFD_WHALE_BOATS');
END;

INSERT INTO Unit_Builds 
		(UnitType,					BuildType)
SELECT	'UNIT_JFD_WORKER',			BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Unit_Builds_Workers
AFTER INSERT ON Builds 
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1)
BEGIN
	INSERT INTO Unit_Builds 
			(UnitType,				BuildType)
	SELECT	'UNIT_JFD_WORKER',		BuildType
	FROM Unit_Builds WHERE BuildType = NEW.Type AND UnitType = 'UNIT_WORKER';
END;

INSERT INTO Unit_Builds 
		(UnitType,					BuildType)
SELECT	'UNIT_JFD_WORKER',			'BUILD_JFD_VILLAGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_JFD_WORKER' AND BuildType = 'BUILD_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType = 'BUILD_RAILROAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_01',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_01'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_02',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_02'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_03',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_03'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_04',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_04'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_05',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_05'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_06',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_06'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_07',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_07'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_08',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_08'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_09',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_09'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_10',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_10'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_11',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_11'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_12',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_12'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_13',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_13'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_14',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_14'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_15',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_15'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_16',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_16'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_17',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_17'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_18',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_18'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_19',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_19'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_20',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_20'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_21',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_22',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_23',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_23'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_24',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_24'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_25',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_25'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_26',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_26'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_27',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_27'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_28',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_28'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_29',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_29'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_30',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_30'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_31',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_31'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_32',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_32'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_33',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_33'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_34',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_34'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_35',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_35'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_36',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_36'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_37',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_37'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_38',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_38'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_39',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_39'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_40',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_40'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_41',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_41'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_42',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_42'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_43',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_43'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_44',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_44'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_45',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_45'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_46',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_46'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_47',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_47'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_48',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_48'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_49',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_49'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_50',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_50'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_51',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_51'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_52',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_52'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_53',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_53'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_54',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_54'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_55',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_55'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_56',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_56'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_57',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_57'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_58',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_58'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_59',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_59'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_60',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_60'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_61',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_61'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_62',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_62'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_63',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_63'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_64',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_64'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_66',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_65'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_66',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_66'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_67',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_67'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_68',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_68'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_69',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_69'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_70',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_70'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_71',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_71'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_72',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_72'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_73',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_73'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_74',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_74'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_75',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_75'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_76',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_76'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_77',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_77'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_78',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_78'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_79',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_79'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_80',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_80'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_81',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_81'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_82',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_82'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_83',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_83'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_84',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_84'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_85',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_85'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_86',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_86'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_87',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_87'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_88',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_88'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_89',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_89'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_90',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_90'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_91',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_91'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_92',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_92'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_93',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_93'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_94',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_94'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_95',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_95'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_96',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_96'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_97',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_97'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_98',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_98'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_99',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_99'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Unit_UniqueNames 	
		(UnitType, 						GreatWorkType,				UniqueName)
SELECT	'UNIT_JFD_GREAT_DIRECTOR', 		'GREAT_WORK_JFD_FILM_100',	'TXT_KEY_GREAT_PERSON_JFD_GREAT_DIRECTOR_100'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================
-- CIVILIZATION
--==========================================================================================================================
-- Civilization_UnitClassOverrides
------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_JFD_GALLEY' WHERE UnitType IN ('UNIT_BYZANTINE_DROMON', 'UNIT_GALLEY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY' AND Value = 1);

UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_JFD_MOUNTED_BOW'
WHERE UnitType IN (SELECT Type FROM Units WHERE RangedCombat > 0 AND Class IN ('UNITCLASS_JFD_MOUNTED_BOW', 'UNITCLASS_KNIGHT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_JFD_SLINGER' WHERE UnitType IN ('UNIT_INCAN_SLINGER', 'UNIT_MAYAN_ATLATLIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

UPDATE Civilization_UnitClassOverrides SET UnitType = 'UNIT_JFD_WINDBUCHSE' WHERE UnitType = 'UNIT_AUSTRIAN_HUSSAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Civilization_UnitClassOverrides
AFTER INSERT ON Units
WHEN NEW.RangedCombat > 0 AND NEW.Class IN ('UNITCLASS_CHARIOT_ARCHER', 'UNITCLASS_CAVALRY', 'UNITCLASS_KNIGHT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 1)
BEGIN
	--Knights to Mounted Crossbowman
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_JFD_MOUNTED_BOW' WHERE NEW.Class IN ('UNITCLASS_JFD_MOUNTED_BOW', 'UNITCLASS_KNIGHT');
END;
--==========================================================================================================================	
-- REMAPPER
--==========================================================================================================================	
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER BY ID;
UPDATE Units SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
--==========================================================================================================================