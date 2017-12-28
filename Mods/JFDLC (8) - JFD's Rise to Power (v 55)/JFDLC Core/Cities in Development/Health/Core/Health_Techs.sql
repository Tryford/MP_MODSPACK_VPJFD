--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies 
		(Type, 					Cost, 	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,									PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_MEDICINE', 	275, 	'TXT_KEY_TECH_JFD_MEDICINE_TITLE',		'TXT_KEY_TECH_JFD_MEDICINE_DESC',		'TXT_KEY_TECH_JFD_MEDICINE_HELP',		'ERA_MEDIEVAL',		1,		0,			5,		1,		'TXT_KEY_TECH_JFD_MEDICINE_QUOTE',		0,				'JFD_HEALTH_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

--Biology
UPDATE Technologies
SET InternationalTradeRoutesChange = 0
WHERE Type = 'TECH_BIOLOGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Steam Power
UPDATE Technologies
SET InternationalTradeRoutesChange = 1
WHERE Type = 'TECH_STEAM_POWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Theology
UPDATE Technologies
SET Help = 'TXT_KEY_TECH_JFD_THEOLOGY_HELP', GridY = 2
WHERE Type = 'TECH_THEOLOGY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_TradeRouteDomainExtraRange
------------------------------------------------------------------------------------------------------------------------	
UPDATE Technology_TradeRouteDomainExtraRange SET TechType = 'TECH_JFD_MEDICINE' WHERE TechType = 'TECH_COMPASS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_COMPASS' AND PrereqTech = 'TECH_THEOLOGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_COMPASS', 			'TECH_JFD_MEDICINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_EDUCATION', 			'TECH_JFD_MEDICINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_MEDICINE', 		'TECH_PHILOSOPHY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_MEDICINE', 		'FLAVOR_MILITARY_TRAINING',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_MEDICINE', 		'FLAVOR_GOLD',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_MEDICINE', 		'FLAVOR_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_MEDICINE', 		'FLAVOR_WONDER',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================