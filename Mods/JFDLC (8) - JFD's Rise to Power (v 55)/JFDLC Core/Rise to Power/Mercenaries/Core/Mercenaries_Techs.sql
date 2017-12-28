--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies 
		(Type, 						Cost, 	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,												PortraitIndex,	IconAtlas,							AudioIntro,							AudioIntroHeader)
SELECT	'TECH_JFD_MERCENARIES', 	85, 	'TXT_KEY_TECH_JFD_MERCENARIES_TITLE',	'TXT_KEY_TECH_JFD_MERCENARIES_DESC',	'TXT_KEY_TECH_JFD_MERCENARIES_HELP',	'ERA_CLASSICAL',	1,		1,			3,		5,		'TXT_KEY_NEWWORLD_SCENARIO_TECH_PROSOLDIERS_QUOTE',	0,				'JFD_POUAKAI_MERCENARY_TECH_ATLAS',	'AS2D_TECH_PROFESSIONAL_SOLDIERS',	'AS2D_TECH_HEADING_PROFESSIONAL_SOLDIERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

UPDATE Technologies
SET GridY = 5
WHERE Type = 'TECH_CURRENCY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowMercenaryContracts,	EffectToolTip,								UnitAction)
SELECT	'TECH_JFD_MERCENARIES',			1,							'TXT_KEY_JFD_ALLOWS_MERCENARY_CONTRACTS',	'MISSION_JFD_MERCENARY'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowMercenaryContracts,	EffectToolTip,								UnitAction)
SELECT	'TECH_CURRENCY',				1,							'TXT_KEY_JFD_ALLOWS_MERCENARY_CONTRACTS',	'MISSION_JFD_MERCENARY'			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 0);
-----------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
-----------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_HORSEBACK_RIDING' AND PrereqTech = 'TECH_THE_WHEEL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_MERCENARIES', 	Type
FROM Technologies WHERE Type = 'TECH_TRAPPING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_CURRENCY', 			Type
FROM Technologies WHERE Type = 'TECH_JFD_MERCENARIES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_Flavors
-----------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,					Flavor)
SELECT	'TECH_JFD_MERCENARIES', 	Type,						5
FROM Flavors WHERE Type = 'FLAVOR_MILITARY_TRAINING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,					Flavor)
SELECT	'TECH_JFD_MERCENARIES', 	Type,						1
FROM Flavors WHERE Type = 'FLAVOR_WONDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,					Flavor)
SELECT	'TECH_JFD_MERCENARIES', 	Type,						3
FROM Flavors WHERE Type = 'FLAVOR_GOLD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================