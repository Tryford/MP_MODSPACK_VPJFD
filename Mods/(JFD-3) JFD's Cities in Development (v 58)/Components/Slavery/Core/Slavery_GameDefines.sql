--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MAX_FROM_CIVILIAN_CAPTURE',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MIN_FROM_CIVILIAN_CAPTURE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MAX_FROM_ENCAMPMENT',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_MIN_FROM_ENCAMPMENT',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_FROM_CS_TRADE_ROUTE',			0.1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_SLAVERY_FROM_TRADE_ROUTE',				0.15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================	
-- FLAVORS
--==========================================================================================================================			
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	--Vanilla
		('LEADER_ALEXANDER',			'FLAVOR_JFD_SLAVERY',		10),
		('LEADER_ASKIA',				'FLAVOR_JFD_SLAVERY',		9),
		('LEADER_AUGUSTUS',				'FLAVOR_JFD_SLAVERY',		9),
		('LEADER_BISMARCK',				'FLAVOR_JFD_SLAVERY',		2),
		('LEADER_CATHERINE',			'FLAVOR_JFD_SLAVERY',		6),
		('LEADER_DARIUS',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_ELIZABETH',			'FLAVOR_JFD_SLAVERY',		4),
		('LEADER_GANDHI',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_HARUN_AL_RASHID',		'FLAVOR_JFD_SLAVERY',		7),
		('LEADER_HIAWATHA',				'FLAVOR_JFD_SLAVERY',		6),
		('LEADER_MONTEZUMA',			'FLAVOR_JFD_SLAVERY',		8),
		('LEADER_NAPOLEON',				'FLAVOR_JFD_SLAVERY',		4),
		('LEADER_ODA_NOBUNAGA',			'FLAVOR_JFD_SLAVERY',		3),
		('LEADER_RAMESSES',				'FLAVOR_JFD_SLAVERY',		3),
		('LEADER_RAMKHAMHAENG',			'FLAVOR_JFD_SLAVERY',		4),
		('LEADER_SULEIMAN',				'FLAVOR_JFD_SLAVERY',		6),
		('LEADER_WASHINGTON',			'FLAVOR_JFD_SLAVERY',		8),
		('LEADER_WU_ZETIAN',			'FLAVOR_JFD_SLAVERY',		5),
		--DLC
		('LEADER_GENGHIS_KHAN',			'FLAVOR_JFD_SLAVERY',		7),
		('LEADER_ISABELLA',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_PACHACUTI',			'FLAVOR_JFD_SLAVERY',		2),
		('LEADER_KAMEHAMEHA',			'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_HARALD',				'FLAVOR_JFD_SLAVERY',		8),
		('LEADER_SEJONG',				'FLAVOR_JFD_SLAVERY',		5),
		('LEADER_NEBUCHADNEZZAR',		'FLAVOR_JFD_SLAVERY',		7),
		--Gods and Kings
		('LEADER_ATTILA',				'FLAVOR_JFD_SLAVERY',		10),
		('LEADER_BOUDICCA',				'FLAVOR_JFD_SLAVERY',		1),
		('LEADER_DIDO',					'FLAVOR_JFD_SLAVERY',		3),
		('LEADER_GUSTAVUS_ADOLPHUS',	'FLAVOR_JFD_SLAVERY',		2),
		('LEADER_MARIA',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_PACAL',				'FLAVOR_JFD_SLAVERY',		7),
		('LEADER_THEODORA',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_SELASSIE',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_WILLIAM',				'FLAVOR_JFD_SLAVERY',		4),
		---Brave New World
		('LEADER_AHMAD_ALMANSUR',		'FLAVOR_JFD_SLAVERY',		5),
		('LEADER_ASHURBANIPAL',			'FLAVOR_JFD_SLAVERY',		6),
		('LEADER_CASIMIR',				'FLAVOR_JFD_SLAVERY',		3),
		('LEADER_ENRICO_DANDOLO',		'FLAVOR_JFD_SLAVERY',		6),
		('LEADER_GAJAH_MADA',			'FLAVOR_JFD_SLAVERY',		5),
		('LEADER_MARIA_I',				'FLAVOR_JFD_SLAVERY',		0),
		('LEADER_PEDRO',				'FLAVOR_JFD_SLAVERY',		2),
		('LEADER_POCATELLO',			'FLAVOR_JFD_SLAVERY',		5),
		('LEADER_SHAKA',				'FLAVOR_JFD_SLAVERY',		8);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CITIZENSHIP_HELP'
WHERE Type = 'POLICY_CITIZENSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_CITIZENSHIP' AND Value = 1);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceUsage,	ResourceClassType, 	AITradeModifier, AIObjective, ConstAppearance, 	Player, IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_SHACKLES',	'TXT_KEY_RESOURCE_JFD_SHACKLES',	'TXT_KEY_CIV5_JFD_SHACKLES_TEXT',	'TXT_KEY_RESOURCE_JFD_SHACKLES_HELP',	ResourceUsage,	ResourceClassType,	AITradeModifier, AIObjective, ConstAppearance,	Player, '[ICON_JFD_SHACKLES]',	0, 				'JFD_SLAVERY_RESOURCE_ATLAS'
FROM Resources WHERE Type = 'RESOURCE_IRON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT	'RESOURCE_JFD_SHACKLES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resource_Flavors
		(ResourceType,				FlavorType,					Flavor)
SELECT	'RESOURCE_JFD_SHACKLES',	'FLAVOR_MILITARY_TRAINING', 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================