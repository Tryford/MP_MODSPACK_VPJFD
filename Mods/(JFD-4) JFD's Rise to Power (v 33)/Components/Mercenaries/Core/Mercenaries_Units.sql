--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================			
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 						Visible,	IconAtlas,								IconIndex)
SELECT	'MISSION_JFD_MERCENARY', 	0,			'JFD_POUAKAI_MERCENARY_MISSION_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,			Description)
VALUES	('UNITCLASS_JFD_GAESATAE',			'UNIT_JFD_GAESATAE',	'TXT_KEY_UNIT_JFD_GAESATAE'),	
		('UNITCLASS_JFD_HESSIAN',			'UNIT_JFD_HESSIAN',		'TXT_KEY_UNIT_JFD_HESSIAN'),	
		('UNITCLASS_JFD_POTSDAM_GIANT',		'UNIT_JFD_HESSIAN',		'TXT_KEY_UNIT_JFD_POTSDAM_GIANT');
		
--Galley
UPDATE UnitClasses
SET DefaultUnit = 'UNIT_GALLEY'
WHERE Type = 'UNITCLASS_GALLEY';

--Text Fixes
UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ANTI_AIRCRAFT_GUN'
WHERE Type = 'UNITCLASS_ANTI_AIRCRAFT_GUN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_AT_GUN'
WHERE Type = 'UNITCLASS_ANTI_TANK_GUN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ATOMIC_BOMB'
WHERE Type = 'UNITCLASS_ATOMIC_BOMB';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_CHARIOT_ARCHER'
WHERE Type = 'UNITCLASS_CHARIOT_ARCHER';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_HELICOPTER_GUNSHIP'
WHERE Type = 'UNITCLASS_HELICOPTER_GUNSHIP';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_HORSEMAN'
WHERE Type = 'UNITCLASS_HORSEMAN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_LANCER'
WHERE Type = 'UNITCLASS_LANCER';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_LONGSWORDSMAN'
WHERE Type = 'UNITCLASS_LONGSWORDSMAN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ROCKET_ARTILLERY'
WHERE Type = 'UNITCLASS_ROCKET_ARTILLERY';

UPDATE UnitClasses
SET Description = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HEADING'
WHERE Type = 'UNITCLASS_KOREAN_TURTLE_SHIP';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_MONGOL_KESHIK'
WHERE Type = 'UNITCLASS_MOUNTED_BOWMAN';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 		
		(Type, 						JFD_OnlyMercenary, Class,					 PolicyType,			 Combat,	Cost,	 FaithCost,		PrereqTech,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia,						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GAESATAE', 		1,				   'UNITCLASS_JFD_GAESATAE', 'POLICY_TRADE_UNIONS',  Combat+2,	Cost+20, FaithCost+40,	NULL,		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GAESATAE', 	'TXT_KEY_UNIT_JFD_GAESATAE_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_GAESATAE',	'TXT_KEY_CIV5_JFD_GAESATAE_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_GAESATAE',	0,					'JFD_GAESATAE_FLAG_ART_ATLAS',	0, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_SPEARMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,					PolicyType,				 Combat, Cost, FaithCost, PrereqTech,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia,						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_HESSIAN', 		1,				   'UNITCLASS_JFD_HESSIAN', 'POLICY_TRADE_UNIONS',	 Combat, Cost, FaithCost, NULL,		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_HESSIAN', 	'TXT_KEY_UNIT_JFD_HESSIAN_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_HESSIAN',	'TXT_KEY_CIV5_JFD_HESSIAN_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_HESSIAN',	0,					'JFD_HESSIAN_FLAG_ART_ATLAS',	1, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,						  PolicyType,			 Combat, Cost, FaithCost,	PrereqTech,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Strategy, 									Help, 									Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	1,				   'UNITCLASS_JFD_POTSDAM_GIANT', 'POLICY_TRADE_UNIONS', Combat, Cost, FaithCost,	NULL,		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_POTSDAM_GIANT', 	'TXT_KEY_UNIT_JFD_POTSDAM_GIANT_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_POTSDAM_GIANT',	'TXT_KEY_CIV5_JFD_POTSDAM_GIANT_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_POTSDAM_GIANT',	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas
FROM Units WHERE Type = 'UNIT_JFD_HESSIAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

--Battering Ram/Siege Tower
UPDATE Units
SET IsSiege = 1
WHERE Type IN ('UNIT_HUN_BATTERING_RAM', 'UNIT_ASSYRIAN_SIEGE_TOWER');

-- Foreign Legion
UPDATE Units
SET Combat = 50, JFD_OnlyMercenary = 1, MoveAfterPurchase = 0, Help = 'TXT_KEY_UNIT_JFD_HELP_FRENCH_FOREIGNLEGION', Strategy = 'TXT_KEY_UNIT_JFD_FRENCH_FOREIGNLEGION_STRATEGY'
WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

-- Galley
UPDATE Units
SET JFD_OnlyMercenary = 1
WHERE Type = 'UNIT_GALLEY';

-- Great Recon Units
UPDATE Units
SET JFD_CannnotBeMercenary = 1
WHERE Class IN ('UNITCLASS_EE_SURVEYOR', 'UNITCLASS_JFD_GREAT_SCOUT', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GALLEASS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

-- Landsneckht
UPDATE Units
SET PrereqTech = NULL, JFD_OnlyMercenary = 1, MoveAfterPurchase = 0, Help = 'TXT_KEY_UNIT_JFD_HELP_GERMAN_LANDSKNECHT', Strategy = 'TXT_KEY_UNIT_JFD_GERMAN_LANDSKNECHT_STRATEGY'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

-- Hessian/Potsdam Giant
UPDATE Units
SET PrereqTech = NULL, Combat = 30, Cost = 185
WHERE Type IN ('UNIT_JFD_HESSIAN', 'UNIT_JFD_POTSDAM_GIANT')
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GAESATAE', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WARRIOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_HESSIAN', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
--------------------------------		
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GAESATAE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WARRIOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_HESSIAN',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_POTSDAM_GIANT',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--------------------------------	
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GAESATAE', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_HESSIAN', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WARRIOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--------------------------------
-- Unit_FreePromotions
--------------------------------	
DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_FRENCH_FOREIGNLEGION', 'UNIT_GERMAN_LANDSKNECHT') AND PromotionType = 'PROMOTION_DOUBLE_PLUNDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GAESATAE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_HESSIAN',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_FRENCH_FOREIGNLEGION',PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_POTSDAM_GIANT',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------	
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('UNIT_JFD_GAESATAE'),
		('UNIT_JFD_HESSIAN'),
		('UNIT_FRENCH_FOREIGNLEGION'),
		('UNIT_JFD_POTSDAM_GIANT');
--==========================================================================================================================
--==========================================================================================================================