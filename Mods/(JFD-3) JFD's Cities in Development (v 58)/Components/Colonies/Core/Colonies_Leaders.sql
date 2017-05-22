--==========================================================================================================================	
-- FLAVORS
--==========================================================================================================================			
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	--Vanilla
		('LEADER_ALEXANDER',			'FLAVOR_JFD_DECOLONIZATION',		6),
		('LEADER_ASKIA',				'FLAVOR_JFD_DECOLONIZATION',		6),
		('LEADER_AUGUSTUS',				'FLAVOR_JFD_DECOLONIZATION',		8),
		('LEADER_BISMARCK',				'FLAVOR_JFD_DECOLONIZATION',		6),
		('LEADER_CATHERINE',			'FLAVOR_JFD_DECOLONIZATION',		3),
		('LEADER_DARIUS',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_ELIZABETH',			'FLAVOR_JFD_DECOLONIZATION',		2),
		('LEADER_GANDHI',				'FLAVOR_JFD_DECOLONIZATION',		10),
		('LEADER_HARUN_AL_RASHID',		'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_HIAWATHA',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_MONTEZUMA',			'FLAVOR_JFD_DECOLONIZATION',		6),
		('LEADER_NAPOLEON',				'FLAVOR_JFD_DECOLONIZATION',		7),
		('LEADER_ODA_NOBUNAGA',			'FLAVOR_JFD_DECOLONIZATION',		7),
		('LEADER_RAMESSES',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_RAMKHAMHAENG',			'FLAVOR_JFD_DECOLONIZATION',		4),
		('LEADER_SULEIMAN',				'FLAVOR_JFD_DECOLONIZATION',		2),
		('LEADER_WASHINGTON',			'FLAVOR_JFD_DECOLONIZATION',		7),
		('LEADER_WU_ZETIAN',			'FLAVOR_JFD_DECOLONIZATION',		6),
		--DLC
		('LEADER_GENGHIS_KHAN',			'FLAVOR_JFD_DECOLONIZATION',		7),
		('LEADER_ISABELLA',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_PACHACUTI',			'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_KAMEHAMEHA',			'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_HARALD',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_SEJONG',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_NEBUCHADNEZZAR',		'FLAVOR_JFD_DECOLONIZATION',		5),
		--Gods and Kings
		('LEADER_ATTILA',				'FLAVOR_JFD_DECOLONIZATION',		8),
		('LEADER_BOUDICCA',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_DIDO',					'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_GUSTAVUS_ADOLPHUS',	'FLAVOR_JFD_DECOLONIZATION',		6),
		('LEADER_MARIA',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_PACAL',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_THEODORA',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_SELASSIE',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_WILLIAM',				'FLAVOR_JFD_DECOLONIZATION',		0),
		---Brave New World
		('LEADER_AHMAD_ALMANSUR',		'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_ASHURBANIPAL',			'FLAVOR_JFD_DECOLONIZATION',		7),
		('LEADER_CASIMIR',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_ENRICO_DANDOLO',		'FLAVOR_JFD_DECOLONIZATION',		0),
		('LEADER_GAJAH_MADA',			'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_MARIA_I',				'FLAVOR_JFD_DECOLONIZATION',		9),
		('LEADER_PEDRO',				'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_POCATELLO',			'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_SHAKA',				'FLAVOR_JFD_DECOLONIZATION',		8);
--==========================================================================================================================
--==========================================================================================================================
