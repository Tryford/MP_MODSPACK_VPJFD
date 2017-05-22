--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies 
		(Type, 						Cost, 	Description, 							Civilopedia,							Help, 									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,									PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_NATIONALISM',		2350, 	'TXT_KEY_TECH_JFD_NATIONALISM_TITLE',	'TXT_KEY_TECH_JFD_NATIONALISM_DESC',	'TXT_KEY_TECH_JFD_NATIONALISM_HELP',	'ERA_INDUSTRIAL',	1,		1,			10,		4,		'TXT_KEY_TECH_JFD_NATIONALISM_QUOTE',	0,				'JFD_LOYALTY_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

UPDATE Technologies
SET Help = 'TXT_KEY_TECH_JFD_ELECTRICITY_HELP'
WHERE Type = 'TECH_ELECTRICITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_NATIONALISM', 	'TECH_INDUSTRIALIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_NATIONALISM', 	'TECH_SCIENTIFIC_THEORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_REPLACEABLE_PARTS', 	'TECH_JFD_NATIONALISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Technology_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,		Flavor)
SELECT	'TECH_JFD_NATIONALISM', 	Type,			50
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE','FLAVOR_ESPIONAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================