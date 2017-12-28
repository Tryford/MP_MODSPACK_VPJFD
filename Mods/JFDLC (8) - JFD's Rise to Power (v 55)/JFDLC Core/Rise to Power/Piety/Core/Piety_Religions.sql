--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
-- Religions
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Religions 
		(Type, 							Description, 								Civilopedia,									IconAtlas,						PortraitIndex,	IconString)
SELECT  'RELIGION_HERMETICISM',			'TXT_KEY_RELIGION_JFD_HERMETICISM',			'TXT_KEY_RELIGION_JFD_HERMETICISM_PEDIA',		'JFD_PIETY_HERESY_ATLAS',		6,				'[ICON_RELIGION_JFD_HERMETICISM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT OR REPLACE INTO Religions 
		(Type, 							Description, 								Civilopedia,									IconAtlas,						PortraitIndex,	IconString)
SELECT  'RELIGION_TLATEOMATILIZTLI',	'TXT_KEY_RELIGION_JFD_TLATEOMATILIZTLI',	'TXT_KEY_RELIGION_JFD_TLATEOMATILIZTLI_PEDIA',	'JFD_PIETY_RELIGION_ATLAS',		0,				'[ICON_RELIGION_JFD_TLATEOMATILIZTLI]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Religion_FoundingAudios
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Religion_FoundingAudios
		(ReligionType, 								AudioSound)
VALUES 	('RELIGION_AMATONGO', 						'AS2D_JFD_AMATONGO'),
		('RELIGION_LAIBONI', 						'AS2D_JFD_LAIBONI'),
		('RELIGION_NUM', 							'AS2D_JFD_NUM'),
		('RELIGION_CHIMINAGUA', 					'AS2D_JFD_ANDEAN'), --tbd
		('RELIGION_PACHISM', 						'AS2D_JFD_ANDEAN'), --tbd (rename Pachism if other Andean ones are found)
		('RELIGION_WILTRAN_MAPU', 					'AS2D_JFD_WILRAN_MAPU'),
		('RELIGION_INTIISM', 						'AS2D_JFD_ANDEAN'), --tbd
		('RELIGION_SUMA_QAMANA', 					'AS2D_JFD_ANDEAN'), --tbd
		('RELIGION_ANGAKKUQISM', 					'AS2D_JFD_ANGAKKUQISM'),
		('RELIGION_ATENISM', 						'AS2D_JFD_ATENISM'),
		('RELIGION_JFD_ATENISM', 					'AS2D_JFD_ATENISM'),
		('RELIGION_ATANODJUWAJA', 					'AS2D_JFD_ATANODJUWAJA'),
		('RELIGION_BAHAI', 							'AS2D_JFD_BAHAI'),
		('RELIGION_BUDDHISM', 						'AS2D_JFD_BUDDHISM'),
		('RELIGION_MAHAYANA', 						'AS2D_JFD_MAHAYANA'),
		('RELIGION_VAJRAYANA', 						'AS2D_JFD_VAJRAYANA'),
		('RELIGION_CANAANISM', 						'AS2D_JFD_CANAANISM'),
		('RELIGION_CHRISTIAN_ANGLICANISM', 			'AS2D_JFD_ANGLICANISM'),
		('RELIGION_PROTESTANT_CALVINISM', 			'AS2D_JFD_CALVINISM'),
		('RELIGION_CHRISTIANITY', 					'AS2D_JFD_CATHOLICISM'),
		('RELIGION_CHRISTIAN_ARIANISM', 			'AS2D_JFD_CATHOLICISM'), --tbd
		('RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 	'AS2D_JFD_CHURCH_OF_THE_EAST'),
		('RELIGION_PROTESTANTISM', 					'AS2D_JFD_LUTHERISM'),
		('RELIGION_PROTESTANT_BAPTIST', 			'AS2D_JFD_BAPTIST'),
		('RELIGION_PROTESTANT_METHODISM', 			'AS2D_JFD_METHODISM'),
		('RELIGION_ORTHODOXY', 						'AS2D_JFD_ORTHODOXY'),
		('RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX', 	'AS2D_JFD_ORIENTAL_ORTHODOXY'),
		('RELIGION_CHRISTIAN_MORMONISM', 			'AS2D_JFD_MORMONISM'),
		('RELIGION_CATHARISM', 						'AS2D_JFD_CATHARISM'),
		('RELIGION_BOGOMILISM', 					'AS2D_JFD_BOGOMILISM'),
		('RELIGION_HUSSITISM', 						'AS2D_JFD_HUSITISM'),
		('RELIGION_CONFUCIANISM', 					'AS2D_JFD_CONFUCIANISM'),
		('RELIGION_MYSTERIES', 						'AS2D_JFD_DIONYSIANISM'),
		('RELIGION_DRUIDISM', 						'AS2D_JFD_DRUIDISM'),
		('RELIGION_PANTHEON', 						'AS2D_JFD_DRUIDISM'),
		('RELIGION_DRUZE', 							'AS2D_JFD_DRUZE'),
		('RELIGION_FAT_ROOG', 						'AS2D_JFD_FAT_ROOG'),
		('RELIGION_FORN_SIDR', 						'AS2D_JFD_FORN_SIDR'),
		('RELIGION_HELLENISM', 						'AS2D_JFD_HELLENISM'),
		('RELIGION_HERMETICISM', 					'AS2D_JFD_HELLENISM'), 
		('RELIGION_HEROS_KARABAZMOS', 				'AS2D_JFD_HEROS_KARABAZMOS'), 
		('RELIGION_MITHRAISM', 						'AS2D_JFD_HELLENISM'), 
		('RELIGION_NEOPLATONISM', 					'AS2D_JFD_NEOPLATONISM'), 
		('RELIGION_NUMENISM', 						'AS2D_JFD_NUMENISM'),
		('RELIGION_ELEUSINIAN', 					'AS2D_JFD_ELEUSINIAN'), 
		('RELIGION_IMPERIAL_CULT', 					'AS2D_JFD_IMPERIAL_CULT'),
		('RELIGION_HINDUISM', 						'AS2D_JFD_HINDUISM'),
		('RELIGION_VISHNU', 						'AS2D_JFD_VAISHNAVISM'),
		('RELIGION_SHAKTI', 						'AS2D_JFD_SHAKTISM'),
		('RELIGION_SHIVA', 							'AS2D_JFD_SHAIVISM'),
		('RELIGION_VEDIC', 							'AS2D_JFD_VEDISM'),
		('RELIGION_ISLAM', 							'AS2D_JFD_SUNNI'), 
		('RELIGION_AHMADI', 						'AS2D_JFD_SUNNI'), --tbd
		('RELIGION_ISLAM_SHIA', 					'AS2D_JFD_SHIA'),
		('RELIGION_ISLAM_IBADI', 					'AS2D_JFD_IBADI'),
		('RELIGION_MUTAZILA', 						'AS2D_JFD_IBADI'),
		('RELIGION_ITAN', 							'AS2D_JFD_ITAN'),
		('RELIGION_JAIN', 							'AS2D_JFD_JAINISM'),
		('RELIGION_JUDAISM', 						'AS2D_JFD_JUDAISM'),
		('RELIGION_AL_ASNAM', 						'AS2D_JFD_MESOPOTAMIC'), --tbd
		('RELIGION_ASHURISM', 						'AS2D_JFD_MESOPOTAMIC'), --tbd (rename Ashurism if other Meso ones are found)
		('RELIGION_NAPIRTUNIIS', 					'AS2D_JFD_MESOPOTAMIC'), --tbd
		('RELIGION_CHALDEANISM', 					'AS2D_JFD_CHALDEANISM'),
		('RELIGION_LIIM_DINGERMES', 				'AS2D_JFD_LIIM_DINGERMES'),
		('RELIGION_MANICHAEISM', 					'AS2D_JFD_MANICHAEISM'), 
		('RELIGION_AKATTU', 						'AS2D_JFD_ANKATTU'),
		('RELIGION_SAIRIMAISM', 					'AS2D_JFD_MESOPOTAMIC'),  --tbd
		('RELIGION_MANAISM', 						'AS2D_JFD_MANAISM'),
		('RELIGION_PUTA_TUPUNA', 					'AS2D_JFD_MANAISM'),
		('RELIGION_MANDEANISM', 					'AS2D_JFD_MANDEANISM'),
		('RELIGION_MIDEWIWIN', 						'AS2D_JFD_MIDEWIWIN'),
		('RELIGION_KACHINA', 						'AS2D_JFD_KACHINA'),
		('RELIGION_SGAANAANG', 						'AS2D_JFD_MIDEWIWIN'), --tbd
		('RELIGION_NOAIDEVUOHTA', 					'AS2D_JFD_NOAIDEVUOHTA'),
		('RELIGION_MUISM', 							'AS2D_JFD_MUISM'),
		('RELIGION_ORENDA', 						'AS2D_JFD_ORENDA'), 
		('RELIGION_SOUTHERN_CULT', 					'AS2D_JFD_NATIVE_AMERICAN'), 
		('RELIGION_WAKAN_TANKA', 					'AS2D_JFD_WAKAN_TANKA'), 
		('RELIGION_POHAKANTENNA', 					'AS2D_JFD_NATIVE_AMERICAN'), --tbd (rename Pohakantenna if Southern Cult is found)
		('RELIGION_NZAMBIISM', 						'AS2D_JFD_NZAMBIISM'), 
		('RELIGION_BUMUNTU', 						'AS2D_JFD_NZAMBIISM'), --tbd
		('RELIGION_ODINANI', 						'AS2D_JFD_NZAMBIISM'), --tbd
		('RELIGION_ONYAMESOM', 						'AS2D_JFD_NZAMBIISM'), --tbd
		('RELIGION_RAZANA', 						'AS2D_JFD_NZAMBIISM'), --tbd
		('RELIGION_PACHISM', 						'AS2D_JFD_PACHISM'),
		('RELIGION_PAJELANCA', 						'AS2D_JFD_PAJELANCA'),
		('RELIGION_AMANAIISM', 						'AS2D_JFD_PESEDJET'), --tbd
		('RELIGION_PESEDJET', 						'AS2D_JFD_PESEDJET'),
		('RELIGION_ROMUVA', 						'AS2D_JFD_ROMUVA'),
		('RELIGION_SAMAN', 							'AS2D_JFD_SAMAN'),
		('RELIGION_SATSANA_PHI', 					'AS2D_JFD_SATSANA_PHI'),
		('RELIGION_SHINTO', 						'AS2D_JFD_SHINTO'),
		('RELIGION_SIKHISM', 						'AS2D_JFD_SIKHISM'),
		('RELIGION_SLAVIANISM', 					'AS2D_JFD_SLAVIANISM'),
		('RELIGION_TAOISM', 						'AS2D_JFD_TAOISM'),
		('RELIGION_TENGRIISM', 						'AS2D_JFD_TENGRIISM'),
		('RELIGION_TJUKURPA', 						'AS2D_JFD_TJUKURPA'),
		('RELIGION_TLATEOMATILIZTLI', 				'AS2D_JFD_TLATEOMATILIZTLI'),
		('RELIGION_TZOLKIN', 						'AS2D_JFD_TZOLKIN'),
		('RELIGION_VODUN', 							'AS2D_JFD_VOODOO'),
		('RELIGION_SANTERIA', 						'AS2D_JFD_VOODOO'),  --tbd
		('RELIGION_ZEMIISM', 						'AS2D_JFD_ZEMIISM'),
		('RELIGION_WILTRAN_MAPU', 					'AS2D_JFD_WILTRAN_MAPU'),
		('RELIGION_YAZDANISM', 						'AS2D_JFD_YAZDANISM'),
		('RELIGION_ZOROASTRIANISM', 				'AS2D_JFD_ZOROASTRIANISM');
------------------------------------------------------------
-- Religion_MapColors
------------------------------------------------------------
INSERT INTO Religion_MapColors
		(ReligionType, 								ColorType)
VALUES	('RELIGION_PANTHEON', 						'COLOR_PLAYER_WHITE'),
		('RELIGION_BUDDHISM', 						'COLOR_PLAYER_ORANGE'),
		('RELIGION_CHRISTIANITY', 					'COLOR_PLAYER_LIGHT_BROWN'),
		('RELIGION_CONFUCIANISM', 					'COLOR_PLAYER_DARK_PURPLE'),
		('RELIGION_HINDUISM', 						'COLOR_PLAYER_PALE_ORANGE'),
		('RELIGION_ISLAM', 							'COLOR_PLAYER_GREEN'),
		('RELIGION_JUDAISM', 						'COLOR_PLAYER_CYAN'),
		('RELIGION_ORTHODOXY', 						'COLOR_PLAYER_BLUE'),
		('RELIGION_PROTESTANTISM',					'COLOR_PLAYER_LIGHT_YELLOW'),
		('RELIGION_SHINTO', 						'COLOR_PLAYER_RED'),
		('RELIGION_SIKHISM', 						'COLOR_PLAYER_MIDDLE_GREEN'),
		('RELIGION_TAOISM', 						'COLOR_PLAYER_DARK_INDIGO'),
		('RELIGION_TENGRIISM', 						'COLOR_PLAYER_MAROON'),
		('RELIGION_ZOROASTRIANISM',					'COLOR_PLAYER_DARK_LEMON');
			
INSERT INTO Religion_MapColors			
		(ReligionType, 					ColorType)
SELECT	'RELIGION_HERMETICISM', 		'COLOR_PLAYER_DARK_YELLOW'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);
			
INSERT INTO Religion_MapColors			
		(ReligionType, 					ColorType)
SELECT	'RELIGION_TLATEOMATILIZTLI', 	'COLOR_PLAYER_DARK_GREEN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);
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
FROM Religions WHERE Type IN ('RELIGION_VISHNU', 'RELIGION_SHIVA', 'RELIGION_SHAKTI', 'RELIGION_VEDIC', 'RELIGION_BUDDHISM', 'RELIGION_VAJRAYANA', 'RELIGION_MAHAYANA');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ISLAM',				Type
FROM Religions WHERE Type IN ('RELIGION_DRUZE', 'RELIGION_MUTAZILA', 'RELIGION_ISLAM_IBADI', 'RELIGION_ISLAM_SHIA');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_PROTESTANTISM',		Type
FROM Religions WHERE Type IN ('RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_MORMONISM', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ORTHODOXY',			Type
FROM Religions WHERE Type IN ('RELIGION_BOGOMILISM', 'RELIGION_PROTESTANTISM', 'RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_ARIANISM', 'RELIGION_CHRISTIAN_MORMONISM', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX');

INSERT INTO Religion_SchismReligions
		(ReligionType,					SchismReligionType)
SELECT	'RELIGION_ZOROASTRIANISM',		Type
FROM Religions WHERE Type IN ('RELIGION_BAHAI');
------------------------------------------------------------	
-- Religion_YieldTypes
------------------------------------------------------------
INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
VALUES	('RELIGION_CONFUCIANISM',		'YIELD_CULTURE'),
		('RELIGION_JUDAISM',			'YIELD_GOLD'),
		('RELIGION_SHINTO',				'YIELD_PRODUCTION'),
		('RELIGION_SIKHISM',			'YIELD_GREAT_GENERAL_POINTS'),
		('RELIGION_TAOISM',				'YIELD_GOLDEN_AGE_POINTS'),
		('RELIGION_TENGRIISM',			'YIELD_FOOD'),
		('RELIGION_ZOROASTRIANISM',		'YIELD_GOLDEN_AGE_POINTS');
		
INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_GOLDEN_AGE_POINTS'
FROM Religions WHERE Type IN ('RELIGION_BUDDHISM', 'RELIGION_VAJRAYANA', 'RELIGION_MAHAYANA');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_FOOD'
FROM Religions WHERE Type IN ('RELIGION_CHRISTIANITY', 'RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST', 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX', 'RELIGION_CATHARISM', 'RELIGION_HUSITISM', 'RELIGION_CHRISTIAN_ARIANISM');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	'RELIGION_HERMETICISM',			'YIELD_SCIENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_FOOD'
FROM Religions WHERE Type IN ('RELIGION_HINDUISM', 'RELIGION_VISHNU', 'RELIGION_SHIVA', 'RELIGION_SHAKTI', 'RELIGION_VEDIC');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_GOLD'
FROM Religions WHERE Type IN ('RELIGION_ISLAM', 'RELIGION_DRUZE', 'RELIGION_MUTAZILA', 'RELIGION_ISLAM_IBADI', 'RELIGION_ISLAM_SHIA');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_SCIENCE'
FROM Religions WHERE Type IN ('RELIGION_ORTHODOXY', 'RELIGION_BOGOMILISM');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	Type,							'YIELD_CULTURE'
FROM Religions WHERE Type IN ('RELIGION_PROTESTANTISM', 'RELIGION_PROTESTANT_CALVINISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST', 'RELIGION_CHRISTIAN_MORMONISM');

INSERT INTO Religion_YieldTypes
		(ReligionType,					YieldType)
SELECT	'RELIGION_TLATEOMATILIZTLI',	'YIELD_CULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================