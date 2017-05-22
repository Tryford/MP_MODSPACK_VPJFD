--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
INSERT OR REPLACE INTO Religions 
		(Type, 						Description, 							Civilopedia,								IconAtlas,						PortraitIndex,	IconString)
SELECT  'RELIGION_HERMETICISM',		'TXT_KEY_RELIGION_JFD_HERMETICISM',		'TXT_KEY_RELIGION_JFD_HERMETICISM_PEDIA',	'JFD_PIETY_RELIGION_ATLAS',		6,				'[ICON_RELIGION_JFD_HERMETICISM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);
------------------------------------------------------------
-- Amatongo
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_AMATONGO'
WHERE Type IN ('RELIGION_AMATONGO', 'RELIGION_LAIBONI', 'RELIGION_NUM');
------------------------------------------------------------
-- Andean
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ANDEAN'
WHERE Type IN ('RELIGION_CHIMINAGUA', 'RELIGION_PACHISM', 'RELIGION_WILTRAN_MAPU', 'RELIGION_INTIISM', 'RELIGION_SUMA_QAMANA');
------------------------------------------------------------
-- Angakkuqism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ANGAKKUQISM'
WHERE Type IN ('RELIGION_ANGAKKUQISM');
------------------------------------------------------------
-- Atenism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ATENISM'
WHERE Type IN ('RELIGION_ATENISM', 'RELIGION_JFD_ATENISM', 'RELIGION_ATANODJUWAJA');
------------------------------------------------------------
-- Baha'i
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_BAHAI'
WHERE Type IN ('RELIGION_BAHAI');
------------------------------------------------------------
-- Buddhism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_BUDDHISM'
WHERE Type IN ('RELIGION_BUDDHISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MAHAYANA'
WHERE Type IN ('RELIGION_MAHAYANA');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_VAJRAYANA'
WHERE Type IN ('RELIGION_VAJRAYANA');
------------------------------------------------------------
-- Canaanism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CANAANISM'
WHERE Type IN ('RELIGION_CANAANISM');
------------------------------------------------------------
-- Christianity
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ANGLICANISM'
WHERE Type IN ('RELIGION_CHRISTIAN_ANGLICANISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CALVINISM'
WHERE Type IN ('RELIGION_PROTESTANT_CALVINISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CATHOLICISM'
WHERE Type IN ('RELIGION_CHRISTIANITY', 'RELIGION_CHRISTIAN_ARIANISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CHURCH_OF_THE_EAST'
WHERE Type IN ('RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_LUTHERISM'
WHERE Type IN ('RELIGION_PROTESTANTISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_PROTESTANT_METHODISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ORTHODOXY'
WHERE Type IN ('RELIGION_ORTHODOXY', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MORMONISM'
WHERE Type IN ('RELIGION_CHRISTIAN_MORMONISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CATHARISM'
WHERE Type IN ('RELIGION_CATHARISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_BOGOMILISM'
WHERE Type IN ('RELIGION_BOGOMILISM');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_HUSITISM'
WHERE Type IN ('RELIGION_HUSSITISM');
------------------------------------------------------------
-- Confucianism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_CONFUCIANISM'
WHERE Type IN ('RELIGION_CONFUCIANISM');
------------------------------------------------------------
-- Dionysianism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_DIONYSIANISM'
WHERE Type IN ('RELIGION_MYSTERIES');
------------------------------------------------------------
-- Druidism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_DRUIDISM'
WHERE Type IN ('RELIGION_DRUIDISM', 'RELIGION_PANTHEON');
------------------------------------------------------------
-- Druze
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_DRUZE'
WHERE Type IN ('RELIGION_DRUZE');
------------------------------------------------------------
-- Fat Roog
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_FAT_ROOG'
WHERE Type IN ('RELIGION_FAT_ROOG');
------------------------------------------------------------
-- Forn Sidr
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_FORN_SIDR'
WHERE Type IN ('RELIGION_FORN_SIDR');
------------------------------------------------------------
-- Hellenism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_HELLENISM'
WHERE Type IN ('RELIGION_HELLENISM', 'RELIGION_HERMETICISM', 'RELIGION_HEROS_KARABAZMOS', 'RELIGION_MITHRAISM', 'RELIGION_NEOPLATONISM', 'RELIGION_NUMENISM', 'RELIGION_ELEUSINIAN', 'RELIGION_IMPERIAL_CULT');
------------------------------------------------------------
-- Hinduism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_HINDUISM'
WHERE Type IN ('RELIGION_HINDUISM', 'RELIGION_VISHNU', 'RELIGION_SHIVA', 'RELIGION_SHAKTI', 'RELIGION_VEDIC');
------------------------------------------------------------
-- Islam
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SUNNI'
WHERE Type IN ('RELIGION_ISLAM', 'RELIGION_AHMADI');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SHIA'
WHERE Type IN ('RELIGION_ISLAM_SHIA');

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_IBADI'
WHERE Type IN ('RELIGION_ISLAM_IBADI', 'RELIGION_MUTAZILA');
------------------------------------------------------------
-- Itan
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ITAN'
WHERE Type IN ('RELIGION_ITAN');
------------------------------------------------------------
-- Jainism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_JAINISM'
WHERE Type IN ('RELIGION_JAIN');
------------------------------------------------------------
-- Judaism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_JUDAISM'
WHERE Type IN ('RELIGION_JUDAISM');
------------------------------------------------------------
-- Mesopotamic
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MESOPOTAMIC'
WHERE Type IN ('RELIGION_AL_ASNAM', 'RELIGION_ASHURISM', 'RELIGION_NAPIRTUNIIS', 'RELIGION_CHALDEANISM', 'RELIGION_LIIM_DINGERMES', 'RELIGION_MANICHAEISM', 'RELIGION_AKATTU', 'RELIGION_SAIRIMAISM');
------------------------------------------------------------
-- Manaism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MANAISM'
WHERE Type IN ('RELIGION_MANAISM', 'RELIGION_PUTA_TUPUNA');
------------------------------------------------------------
-- Mandeanism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MANDEANISM'
WHERE Type IN ('RELIGION_MANDEANISM');
------------------------------------------------------------
-- Midewiwin
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MIDEWIWIN'
WHERE Type IN ('RELIGION_MIDEWIWIN', 'RELIGION_KACHINA', 'RELIGION_SGAANAANG', 'RELIGION_NOAIDEVUOHTA');
------------------------------------------------------------
-- Muism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_MUISM'
WHERE Type IN ('RELIGION_MUISM');
------------------------------------------------------------
-- Native Americans
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_NATIVE_AMERICAN'
WHERE Type IN ('RELIGION_ORENDA', 'RELIGION_SOUTHERN_CULT', 'RELIGION_WAKAN_TANKA', 'RELIGION_POHAKANTENNA');
------------------------------------------------------------
-- Nzambiism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_NZAMBIISM'
WHERE Type IN ('RELIGION_NZAMBIISM', 'RELIGION_BUMUNTU', 'RELIGION_ODINANI', 'RELIGION_ONYAMESOM', 'RELIGION_RAZANA');
------------------------------------------------------------
-- Pachism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_PACHISM'
WHERE Type IN ('RELIGION_PACHISM');
------------------------------------------------------------
-- Pajelanca
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_PAJELANCA'
WHERE Type IN ('RELIGION_PAJELANCA');
------------------------------------------------------------
-- Pesedjet
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_PESEDJET'
WHERE Type IN ('RELIGION_AMANAIISM', 'RELIGION_PESEDJET');
------------------------------------------------------------
-- Romuva
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ROMUVA'
WHERE Type IN ('RELIGION_ROMUVA');
------------------------------------------------------------
-- Saman
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SAMAN'
WHERE Type IN ('RELIGION_SAMAN');
------------------------------------------------------------
-- Satsana Phi
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SATSANA_PHI'
WHERE Type IN ('RELIGION_SATSANA_PHI');
------------------------------------------------------------
-- Shinto
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SHINTO'
WHERE Type IN ('RELIGION_SHINTO');
------------------------------------------------------------
-- Sikhism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SIKHISM'
WHERE Type IN ('RELIGION_SIKHISM');
------------------------------------------------------------
-- Slavianism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_SLAVIANISM'
WHERE Type IN ('RELIGION_SLAVIANISM');
------------------------------------------------------------
-- Taoism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_TAOISM'
WHERE Type IN ('RELIGION_TAOISM');
------------------------------------------------------------
-- Tengriism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_TENGRIISM'
WHERE Type IN ('RELIGION_TENGRIISM');
------------------------------------------------------------
-- Tjukurpa
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_TJUKURPA'
WHERE Type IN ('RELIGION_TJUKURPA');
------------------------------------------------------------
-- Tlatoematiliztli
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_TLATEOMATILIZTLI'
WHERE Type IN ('RELIGION_TLATEOMATILIZTLI');
------------------------------------------------------------
-- Tzolkin
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_TZOLKIN'
WHERE Type IN ('RELIGION_TZOLKIN');
------------------------------------------------------------
-- Voodoo
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_VOODOO'
WHERE Type IN ('RELIGION_VODUN', 'RELIGION_SANTERIA', 'RELIGION_ZEMIISM');
------------------------------------------------------------
-- Wiltran Mapu
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_WILTRAN_MAPU'
WHERE Type IN ('RELIGION_WILTRAN_MAPU');
------------------------------------------------------------
-- Yazdanism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_YAZDANISM'
WHERE Type IN ('RELIGION_YAZDANISM');
------------------------------------------------------------
-- Zoroastrianism
------------------------------------------------------------
UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_ZOROASTRIANISM'
WHERE Type IN ('RELIGION_ZOROASTRIANISM');
------------------------------------------------------------
-- Religion_MapColors
------------------------------------------------------------
INSERT INTO Religion_MapColors
		(ReligionType, 					ColorType)
VALUES	('RELIGION_PANTHEON', 			'COLOR_PLAYER_WHITE'),
		('RELIGION_BUDDHISM', 			'COLOR_PLAYER_ORANGE'),
		('RELIGION_CHRISTIANITY', 		'COLOR_PLAYER_LIGHT_BROWN'),
		('RELIGION_CONFUCIANISM', 		'COLOR_PLAYER_DARK_PURPLE'),
		('RELIGION_HINDUISM', 			'COLOR_PLAYER_PALE_ORANGE'),
		('RELIGION_ISLAM', 				'COLOR_PLAYER_GREEN'),
		('RELIGION_JUDAISM', 			'COLOR_PLAYER_CYAN'),
		('RELIGION_SHINTO', 			'COLOR_PLAYER_RED'),
		('RELIGION_SIKHISM', 			'COLOR_PLAYER_MIDDLE_GREEN'),
		('RELIGION_TAOISM', 			'COLOR_PLAYER_DARK_INDIGO'),
		('RELIGION_TENGRIISM', 			'COLOR_PLAYER_MAROON'),
		('RELIGION_ZOROASTRIANISM',		'COLOR_PLAYER_DARK_LEMON'),
		('RELIGION_ORTHODOXY', 			'COLOR_PLAYER_BLUE'),
		('RELIGION_PROTESTANTISM',		'COLOR_PLAYER_LIGHT_YELLOW');

INSERT INTO Religion_MapColors
		(ReligionType, 					ColorType)
SELECT	'RELIGION_HERMETICISM', 		'COLOR_PLAYER_DARK_YELLOW'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);
------------------------------------------------------------	
-- Religion_SchismReligions
------------------------------------------------------------
INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_BUDDHISM',			Type
FROM Religions WHERE Type IN ('RELIGION_VAJRAYANA', 'RELIGION_MAHAYANA');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_CHRISTIANITY',		Type
FROM Religions WHERE Type IN ('RELIGION_PROTESTANTISM', 'RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_MORMONISM', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX', 'RELIGION_CATHARISM', 'RELIGION_HUSITISM', 'RELIGION_CHRISTIAN_ARIANISM', 'RELIGION_ORTHODOXY');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_HINDUISM',			Type
FROM Religions WHERE Type IN ('RELIGION_VISHNU', 'RELIGION_SHIVA', 'RELIGION_SHAKTI', 'RELIGION_VEDIC');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ISLAM',				Type
FROM Religions WHERE Type IN ('RELIGION_DRUZE', 'RELIGION_MUTAZILA', 'RELIGION_ISLAM_IBADI', 'RELIGION_ISLAM_SHIA');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ORTHODOXY',			Type
FROM Religions WHERE Type IN ('RELIGION_BOGOMILISM', 'RELIGION_PROTESTANTISM', 'RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_ARIANISM', 'RELIGION_CHRISTIAN_MORMONISM', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ZOROASTRIANISM',		Type
FROM Religions WHERE Type IN ('RELIGION_BAHAI');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_PROTESTANTISM',		Type
FROM Religions WHERE Type IN ('RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_MORMONISM', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX');
--==========================================================================================================================
--==========================================================================================================================