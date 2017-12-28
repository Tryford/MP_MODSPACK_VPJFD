--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies 
		(Type, 							Cost, 	Description, 								Civilopedia,								Help, 										Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,														PortraitIndex,	IconAtlas,					AudioIntro,						AudioIntroHeader)
SELECT	'TECH_JFD_MYSTICISM', 			35, 	'TXT_KEY_TECH_JFD_MYSTICISM_TITLE',			'TXT_KEY_TECH_JFD_MYSTICISM_DESC',			'TXT_KEY_TECH_JFD_MYSTICISM_HELP',			'ERA_ANCIENT',		1,		1,			1,		2,		'TXT_KEY_TECH_JFD_MYSTICISM_QUOTE',							2,				'JFD_PIETY_TECH_ATLAS',		NULL,							NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);				
				
INSERT INTO Technologies 				
		(Type, 							Cost, 	Description, 								Civilopedia,								Help, 										Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,														PortraitIndex,	IconAtlas,					AudioIntro,						AudioIntroHeader)
SELECT	'TECH_JFD_PRIESTHOOD',			105, 	'TXT_KEY_TECH_JFD_PRIESTHOOD_TITLE',		'TXT_KEY_TECH_JFD_PRIESTHOOD_DESC',			'TXT_KEY_TECH_JFD_PRIESTHOOD_HELP',			'ERA_CLASSICAL',	1,		0,			3,		1,		'TXT_KEY_NEWWORLD_SCENARIO_TECH_RELIGIOUS_ORDERS_QUOTE',	0,				'JFD_PIETY_TECH_ATLAS',		'AS2D_TECH_RELIGIOUS_ORDERS',	'AS2D_TECH_HEADING_RELIGIOUS_ORDERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technologies 
		(Type, 							Cost, 	Description, 								Civilopedia,								Help, 										Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,														PortraitIndex,	IconAtlas,					AudioIntro,						AudioIntroHeader)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 	485, 	'TXT_KEY_TECH_JFD_RELIGIOUS_ORDERS_TITLE',	'TXT_KEY_TECH_JFD_RELIGIOUS_ORDERS_DESC',	'TXT_KEY_TECH_JFD_RELIGIOUS_ORDERS_HELP',	'ERA_MEDIEVAL',		1,		0,			6,		3,		'TXT_KEY_NEWWORLD_SCENARIO_TECH_RELIGIOUS_ORDERS_QUOTE',	1,				'JFD_PIETY_TECH_ATLAS',		'AS2D_TECH_RELIGIOUS_ORDERS',	'AS2D_TECH_HEADING_RELIGIOUS_ORDERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

--Astronomy
UPDATE Technologies
SET GridX = 7, GridY = 1
WHERE Type = 'TECH_ASTRONOMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Education
UPDATE Technologies
SET GridX = 6, GridY = 1
WHERE Type = 'TECH_EDUCATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Pottery
UPDATE Technologies
SET Help = 'TXT_KEY_TECH_JFD_POTTERY_HELP'
WHERE Type = 'TECH_POTTERY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Theology
UPDATE Technologies
SET Help = 'TXT_KEY_TECH_JFD_THEOLOGY_HELP', GridY = 2
WHERE Type = 'TECH_THEOLOGY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Calendar
UPDATE Technologies
SET GridX = 2, GridY = 2
WHERE Type = 'TECH_CALENDAR' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Priesthood
UPDATE Technologies
SET GridX = 3, GridY = 2
WHERE Type = 'TECH_JFD_PRIESTHOOD' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Writing
UPDATE Technologies
SET GridX = 2, GridY = 1
WHERE Type = 'TECH_WRITING' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowStateReligions,	EffectToolTip,							UnitAction)
SELECT	'TECH_PHILOSOPHY',				1,						'TXT_KEY_JFD_ALLOWS_STATE_RELIGIONS',	'MISSION_FOUND_RELIGION'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowStateReligions,	EffectToolTip,							UnitAction)
SELECT	'TECH_JFD_PRIESTHOOD',			1,						'TXT_KEY_JFD_ALLOWS_STATE_RELIGIONS',	'MISSION_FOUND_RELIGION'			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowHolyOrders,		EffectToolTip,							UnitAction)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS',	1,						'TXT_KEY_JFD_ALLOWS_RELIGIOUS_ORDERS',	'MISSION_JFD_MERCENARY'			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowSecularization,	EffectToolTip,							UnitAction)
SELECT  'TECH_SCIENTIFIC_THEORY',		1,						'TXT_KEY_JFD_ALLOWS_SECULARIZATION',	'MISSION_FOUND_RELIGION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
-----------------------------------------------------------------------------------------------------	
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_MYSTICISM', 			'TECH_AGRICULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_PRIESTHOOD', 			'TECH_CALENDAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_PRIESTHOOD', 			'TECH_WRITING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 	'TECH_THEOLOGY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_EDUCATION' AND PrereqTech = 'TECH_CIVIL_SERVICE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 	'TECH_CIVIL_SERVICE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_JFD_PRIESTHOOD' 
WHERE TechType = 'TECH_DRAMA' AND PrereqTech = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_JFD_MYSTICISM' 
WHERE TechType = 'TECH_CALENDAR' AND PrereqTech = 'TECH_POTTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_JFD_PRIESTHOOD' 
WHERE TechType = 'TECH_PHILOSOPHY' AND PrereqTech = 'TECH_CALENDAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE TechType = 'TECH_ACOUSTICS' AND PrereqTech = 'TECH_EDUCATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE TechType = 'TECH_BANKING' AND PrereqTech = 'TECH_EDUCATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_Flavors
-----------------------------------------------------------------------------------------------------	
INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_MYSTICISM', 				Type,			30
FROM Flavors WHERE Type = 'FLAVOR_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_MYSTICISM',				Type,			10
FROM Flavors WHERE Type = 'FLAVOR_WONDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_PRIESTHOOD', 				Type,			50
FROM Flavors WHERE Type = 'FLAVOR_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_PRIESTHOOD',				Type,			15
FROM Flavors WHERE Type = 'FLAVOR_WONDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_PRIESTHOOD', 				Type,			10
FROM Flavors WHERE Type = 'FLAVOR_CULTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 		Type,			20
FROM Flavors WHERE Type = 'FLAVOR_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS',		Type,			15
FROM Flavors WHERE Type = 'FLAVOR_WONDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 							FlavorType,		Flavor)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 		Type,			10
FROM Flavors WHERE Type = 'FLAVOR_MILITARY_TRAINING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================