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
--==========================================================================================================================