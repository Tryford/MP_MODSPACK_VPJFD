--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					FaithFromKills,		Description,					ShortDescription)
SELECT	'TRAIT_JFD_AZTECS',		100,				'TXT_KEY_TRAIT_JFD_AZTECS',		'TXT_KEY_TRAIT_CULTURE_FROM_KILLS_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Leader_Traits
SET TraitType = 'TRAIT_JFD_AZTECS'
WHERE LeaderType = 'LEADER_MONTEZUMA' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS' AND Value = 1);
--==========================================================================================================================	
-- FLAVORS
--==========================================================================================================================			
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	--Vanilla
		('LEADER_ALEXANDER',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_ALEXANDER',			'FLAVOR_JFD_STATE_RELIGION',			4),
		('LEADER_ASKIA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_ASKIA',				'FLAVOR_JFD_STATE_RELIGION',			6),
		('LEADER_AUGUSTUS',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_AUGUSTUS',				'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_BISMARCK',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_BISMARCK',				'FLAVOR_JFD_STATE_RELIGION',			0),
		('LEADER_CATHERINE',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_CATHERINE',			'FLAVOR_JFD_STATE_RELIGION',			8),
		('LEADER_DARIUS',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_DARIUS',				'FLAVOR_JFD_STATE_RELIGION',			4),
		('LEADER_ELIZABETH',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_ELIZABETH',			'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_GANDHI',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_GANDHI',				'FLAVOR_JFD_STATE_RELIGION',			0),
		('LEADER_HARUN_AL_RASHID',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_HARUN_AL_RASHID',		'FLAVOR_JFD_STATE_RELIGION',			9),
		('LEADER_HIAWATHA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_HIAWATHA',				'FLAVOR_JFD_STATE_RELIGION',			0),
		('LEADER_MONTEZUMA',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		10),
		('LEADER_MONTEZUMA',			'FLAVOR_JFD_STATE_RELIGION',			10),
		('LEADER_NAPOLEON',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_NAPOLEON',				'FLAVOR_JFD_STATE_RELIGION',			0),
		('LEADER_ODA_NOBUNAGA',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_ODA_NOBUNAGA',			'FLAVOR_JFD_STATE_RELIGION',			4),
		('LEADER_RAMESSES',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		10),
		('LEADER_RAMESSES',				'FLAVOR_JFD_STATE_RELIGION',			10),
		('LEADER_RAMKHAMHAENG',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_RAMKHAMHAENG',			'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_SULEIMAN',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_SULEIMAN',				'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_WASHINGTON',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_WASHINGTON',			'FLAVOR_JFD_STATE_RELIGION',			0),
		('LEADER_WU_ZETIAN',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_WU_ZETIAN',			'FLAVOR_JFD_STATE_RELIGION',			5),
		--DLC
		('LEADER_GENGHIS_KHAN',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_GENGHIS_KHAN',			'FLAVOR_JFD_STATE_RELIGION',			2),
		('LEADER_ISABELLA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		12),
		('LEADER_ISABELLA',				'FLAVOR_JFD_STATE_RELIGION',			12),
		('LEADER_PACHACUTI',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_PACHACUTI',			'FLAVOR_JFD_STATE_RELIGION',			8),
		('LEADER_KAMEHAMEHA',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_KAMEHAMEHA',			'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_HARALD',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7),
		('LEADER_HARALD',				'FLAVOR_JFD_STATE_RELIGION',			7),
		('LEADER_SEJONG',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_SEJONG',				'FLAVOR_JFD_STATE_RELIGION',			3),
		('LEADER_NEBUCHADNEZZAR',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_NEBUCHADNEZZAR',		'FLAVOR_JFD_STATE_RELIGION',			6),
		--Gods and Kings
		('LEADER_ATTILA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_ATTILA',				'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_BOUDICCA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7),
		('LEADER_BOUDICCA',				'FLAVOR_JFD_STATE_RELIGION',			7),
		('LEADER_DIDO',					'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_DIDO',					'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_GUSTAVUS_ADOLPHUS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_GUSTAVUS_ADOLPHUS',	'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_MARIA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8),
		('LEADER_MARIA',				'FLAVOR_JFD_STATE_RELIGION',			8),
		('LEADER_PACAL',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_PACAL',				'FLAVOR_JFD_STATE_RELIGION',			6),
		('LEADER_THEODORA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_THEODORA',				'FLAVOR_JFD_STATE_RELIGION',			8),
		('LEADER_SELASSIE',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_SELASSIE',				'FLAVOR_JFD_STATE_RELIGION',			6),
		('LEADER_WILLIAM',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_WILLIAM',				'FLAVOR_JFD_STATE_RELIGION',			4),
		---Brave New World
		('LEADER_AHMAD_ALMANSUR',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_AHMAD_ALMANSUR',		'FLAVOR_JFD_STATE_RELIGION',			6),
		('LEADER_ASHURBANIPAL',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_ASHURBANIPAL',			'FLAVOR_JFD_STATE_RELIGION',			3),
		('LEADER_CASIMIR',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_CASIMIR',				'FLAVOR_JFD_STATE_RELIGION',			7),
		('LEADER_ENRICO_DANDOLO',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_ENRICO_DANDOLO',		'FLAVOR_JFD_STATE_RELIGION',			4),
		('LEADER_GAJAH_MADA',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_GAJAH_MADA',			'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_MARIA_I',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7),
		('LEADER_MARIA_I',				'FLAVOR_JFD_STATE_RELIGION',			8),
		('LEADER_PEDRO',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_PEDRO',				'FLAVOR_JFD_STATE_RELIGION',			5),
		('LEADER_POCATELLO',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_POCATELLO',			'FLAVOR_JFD_STATE_RELIGION',			2),
		('LEADER_SHAKA',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_SHAKA',				'FLAVOR_JFD_STATE_RELIGION',			4);
--==========================================================================================================================
--==========================================================================================================================