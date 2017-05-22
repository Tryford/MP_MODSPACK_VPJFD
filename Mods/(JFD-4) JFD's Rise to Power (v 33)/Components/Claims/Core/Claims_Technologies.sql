--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies 
		(Type, 						Cost, 	OpenBordersTradingAllowed,	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	105, 	0,							'TXT_KEY_TECH_JFD_CODE_OF_LAWS_TITLE',	'TXT_KEY_TECH_JFD_CODE_OF_LAWS_DESC',	'TXT_KEY_TECH_JFD_CODE_OF_LAWS_HELP',	'ERA_CLASSICAL',	1,		0,			3,		2,		'TXT_KEY_TECH_JFD_CODE_OF_LAWS_QUOTE',		3,				'JFD_CLAIMS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

INSERT INTO Technologies 
		(Type, 						Cost, 	OpenBordersTradingAllowed,	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_JURISPRUDENCE', 	700, 	0,							'TXT_KEY_TECH_JFD_JURISPRUDENCE_TITLE',	'TXT_KEY_TECH_JFD_JURISPRUDENCE_DESC',	'TXT_KEY_TECH_JFD_JURISPRUDENCE_HELP',	'ERA_RENAISSANCE',	1,		0,			8,		6,		'TXT_KEY_TECH_JFD_JURISPRUDENCE_QUOTE',		0,				'JFD_CLAIMS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technologies 
		(Type, 						Cost, 	OpenBordersTradingAllowed,	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_NOBILITY', 		275, 	1,							'TXT_KEY_TECH_JFD_NOBILITY_TITLE',		'TXT_KEY_TECH_JFD_NOBILITY_DESC',		'TXT_KEY_TECH_JFD_NOBILITY_HELP',		'ERA_MEDIEVAL',		1,		0,			5,		5,		'TXT_KEY_TECH_JFD_NOBILITY_QUOTE',			1,				'JFD_CLAIMS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

--Banking
UPDATE Technologies
SET Help = 'TXT_KEY_TECH_JFD_BANKING_HELP'
WHERE Type = 'TECH_BANKING';

--Civil Service
UPDATE Technologies
SET OpenBordersTradingAllowed = 0
WHERE Type IN ('TECH_CIVIL_SERVICE', 'TECH_GUILDS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

--Currency
UPDATE Technologies
SET GridY = 5
WHERE Type = 'TECH_CURRENCY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'TECH_WRITING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_CHIVALRY', 			'TECH_JFD_NOBILITY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'TECH_PRINTING_PRESS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_NOBILITY', 		'TECH_CURRENCY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_RIFLING', 			'TECH_JFD_JURISPRUDENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

UPDATE Technology_PrereqTechs
SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
WHERE TechType IN ('TECH_DRAMA') AND PrereqTech = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

UPDATE Technology_PrereqTechs
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE TechType IN ('TECH_PHILOSOPHY') AND PrereqTech = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_HAPPINESS',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_WONDER',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_CULTURE',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'FLAVOR_HAPPINESS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'FLAVOR_ESPIONAGE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'FLAVOR_WONDER',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'FLAVOR_CULTURE',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_NOBILITY', 		'FLAVOR_MILITARY_TRAINING',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_NOBILITY', 		'FLAVOR_GOLD',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_NOBILITY', 		'FLAVOR_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_NOBILITY', 		'FLAVOR_WONDER',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
