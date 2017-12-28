
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag,			CultureType,							DefeatScreenEarlyTag,				DefeatScreenMidTag,				DefeatScreenLateTag,					IdealsTag,				SplashScreenTag,				SoundtrackTag,				UnitDialogueTag)
VALUES	('CIVILIZATION_AMERICA',		'_JFD_WESTERN',			'CULTURE_JFD_COLONIAL',					NULL,								NULL,							'DefeatScreenLateAmerica.dds',			'JFD_Colonial',			'JFD_Colonial',					'JFD_Colonial',				'AS2D_SOUND_JFD_AMERICAN'),
		('CIVILIZATION_ARABIA',			'_JFD_ISLAMIC',			'CULTURE_JFD_ISLAMIC',					NULL,								NULL,							NULL,									'JFD_Islamic',			'JFD_Islamic',					'JFD_Islamic',				'AS2D_SOUND_JFD_ARABIC'),
		('CIVILIZATION_ASSYRIA',		'_JFD_MESOPOTAMIC',		'CULTURE_JFD_MESOPOTAMIC',				NULL,								NULL,							NULL,									'JFD_Mesopotamic',		'JFD_Mesopotamic',				'JFD_Mesopotamic',			'AS2D_SOUND_JFD_BABYLONIAN'),	
		('CIVILIZATION_AUSTRIA',		'_JFD_CENTRAL',			'CULTURE_JFD_CENTRAL',					NULL,								NULL,							NULL,									'JFD_Central',			'JFD_Central',					'JFD_Central',				'AS2D_SOUND_JFD_GERMAN'),	
		('CIVILIZATION_AZTEC',			'_JFD_MESOAMERICAN',	'CULTURE_JFD_MESOAMERICAN',				NULL,								NULL,							'DefeatScreenLateAztecs.dds',			'JFD_Mesoamerican',		'JFD_Mesoamerican',				'JFD_Mesoamerican',			'AS2D_SOUND_JFD_AZTEC'),	
		('CIVILIZATION_BABYLON',		'_JFD_MESOPOTAMIC',		'CULTURE_JFD_MESOPOTAMIC',				'DefeatScreenEarlyBabylon.dds',		'DefeatScreenEarlyBabylon.dds',	NULL,									'JFD_Mesopotamic',		'JFD_Mesopotamic',				'JFD_Mesopotamic',			'AS2D_SOUND_JFD_BABYLONIAN'),	
		('CIVILIZATION_BRAZIL',			'_JFD_WESTERN',			'CULTURE_JFD_COLONIAL',					NULL,								NULL,							'DefeatScreenLateBrazil.dds',			'JFD_Colonial',			'JFD_ColonialLatin',			'JFD_ColonialLatin',		'AS2D_SOUND_JFD_PORTUGUESE'),	
		('CIVILIZATION_BYZANTIUM',		'_JFD_EASTERN',			'CULTURE_JFD_EASTERN',					NULL,								NULL,							NULL,									'JFD_Eastern',			'JFD_EasternByzantine',			'JFD_EasternByzantine',		'AS2D_SOUND_JFD_BYZANTINE'),	
		('CIVILIZATION_CARTHAGE',		'_JFD_CLASSICAL',		'CULTURE_JFD_CLASSICAL',				NULL,								NULL,							NULL,									'JFD_Classical',		'JFD_Classical',				'JFD_Classical',			'AS2D_SOUND_JFD_CARTHAGINIAN'),	
		('CIVILIZATION_CELTS',			'_JFD_NORTHERN',		'CULTURE_JFD_NORTHERN',					NULL,								NULL,							NULL,									'JFD_Northern',			'JFD_NorthernCeltic',			'JFD_NorthernCeltic',		'AS2D_SOUND_JFD_CELTIC'),	
		('CIVILIZATION_CHINA',			'_JFD_ORIENTAL',		'CULTURE_JFD_ORIENTAL',					NULL,								'DefeatScreenMidChina.dds',		'DefeatScreenLateChina.dds',			'JFD_Oriental',			'JFD_Oriental',					'JFD_Oriental',				'AS2D_SOUND_JFD_CHINESE'),	
		('CIVILIZATION_DENMARK',		'_JFD_NORTHERN',		'CULTURE_JFD_NORTHERN',					NULL,								NULL,							NULL,									'JFD_Northern',			'JFD_Northern',					'JFD_Northern',				'AS2D_SOUND_JFD_VIKING'),	
		('CIVILIZATION_EGYPT',			'_JFD_EGYPTIAN',		'CULTURE_JFD_MESOPOTAMIC',				'DefeatScreenEarlyEgypt.dds',		NULL,							NULL,									'JFD_Mesopotamic',		'JFD_MesopotamicEgyptian',		'JFD_MesopotamicEgyptian',	'AS2D_SOUND_JFD_EGYPTIAN'),	
		('CIVILIZATION_ENGLAND',		'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							'DefeatScreenLateBritain.dds',			'JFD_Western',			'JFD_WesternBritish',			'JFD_WesternBritish',		'AS2D_SOUND_JFD_ENGLISH'),	
		('CIVILIZATION_ETHIOPIA',		'_JFD_SEMITIC',			'CULTURE_JFD_SEMITIC',					NULL,								NULL,							NULL,									'JFD_Semitic',			'JFD_SemiticEthiopic',			'JFD_SemiticEthiopic',		'AS2D_SOUND_JFD_ETHIOPIAN'),	
		('CIVILIZATION_FRANCE',			'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							'DefeatScreenLateFrance.dds',			'JFD_Western',			'JFD_Western',					'JFD_Western',				'AS2D_SOUND_JFD_FRENCH'),	
		('CIVILIZATION_GERMANY',		'_JFD_CENTRAL',			'CULTURE_JFD_CENTRAL',					NULL,								NULL,							'DefeatScreenLateGermany.dds',			'JFD_Central',			'JFD_Central',					'JFD_Central',				'AS2D_SOUND_JFD_GERMAN'),	
		('CIVILIZATION_GREECE',			'_JFD_CLASSICAL',		'CULTURE_JFD_CLASSICAL',				NULL,								NULL,							NULL,									'JFD_Classical',		'JFD_Classical',				'JFD_Classical',			'AS2D_SOUND_JFD_GREEK'),	
		('CIVILIZATION_HUNS',			'_JFD_STEPPE',			'CULTURE_JFD_STEPPE',					NULL,								NULL,							NULL,									'JFD_Steppe',			'JFD_Steppe',					'JFD_Steppe',				'AS2D_SOUND_JFD_HUNNIC'),	
		('CIVILIZATION_INCA',			'_JFD_ANDEAN',			'CULTURE_JFD_ANDEAN',					NULL,								NULL,							NULL,									'JFD_Andean',			'JFD_Andean',					'JFD_Andean',				'AS2D_SOUND_JFD_INCAN'),	
		('CIVILIZATION_INDIA',			'_JFD_BHARATA',			'CULTURE_JFD_BHARATA',					NULL,								NULL,							NULL,									'JFD_Bharata',			'JFD_Bharata',					'JFD_Bharata',				'AS2D_SOUND_JFD_INDIAN'),	
		('CIVILIZATION_INDONESIA',		'_JFD_EAST_INDIES',		'CULTURE_JFD_EAST_INDIES',				NULL,								NULL,							NULL,									'JFD_EastIndies',		'JFD_EastIndies',				'JFD_EastIndies',			NULL),	
		('CIVILIZATION_IROQUOIS',		'_JFD_WOODLANDS',		'CULTURE_JFD_WOODLANDS',				NULL,								NULL,							NULL,									'JFD_Woodlands',		'JFD_Woodlands',				'JFD_Woodlands',			'AS2D_SOUND_JFD_MOHAWK'),	
		('CIVILIZATION_JAPAN',			'_JFD_JAPANESE',		'CULTURE_JFD_ORIENTAL',					NULL,								NULL,							'DefeatScreenLateJapan.dds',			'JFD_Oriental',			'JFD_OrientalJapanese',			'JFD_OrientalJapanese',		'AS2D_SOUND_JFD_JAPANESE'),	
		('CIVILIZATION_KOREA',			'_JFD_ORIENTAL',		'CULTURE_JFD_ORIENTAL',					NULL,								NULL,							NULL,									'JFD_Oriental',			'JFD_Oriental',					'JFD_Oriental',				'AS2D_SOUND_JFD_KOREAN'),	
		('CIVILIZATION_MAYA',			'_JFD_MESOAMERICAN',	'CULTURE_JFD_MESOAMERICAN',				NULL,								NULL,							NULL,									'JFD_Mesoamerican',		'JFD_Mesoamerican',				'JFD_Mesoamerican',			'AS2D_SOUND_JFD_MAYAN'),	
		('CIVILIZATION_MONGOL',			'_JFD_STEPPE',			'CULTURE_JFD_STEPPE',					NULL,								NULL,							NULL,									'JFD_Steppe',			'JFD_Steppe',					'JFD_Steppe',				'AS2D_SOUND_JFD_MONGOL'),	
		('CIVILIZATION_MOROCCO',		'_JFD_ISLAMIC',			'CULTURE_JFD_ISLAMIC',					NULL,								NULL,							NULL,									'JFD_Islamic',			'JFD_Islamic',					'JFD_Islamic',				'AS2D_SOUND_JFD_ARABIC'),	
		('CIVILIZATION_NETHERLANDS',	'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							NULL,									'JFD_Western',			'JFD_Western',					'JFD_Western',				'AS2D_SOUND_JFD_DUTCH'),	
		('CIVILIZATION_OTTOMAN',		'_JFD_ISLAMIC',			'CULTURE_JFD_ISLAMIC',					NULL,								NULL,							NULL,									'JFD_Islamic',			'JFD_IslamicTurkic',			'JFD_IslamicTurkic',		'AS2D_SOUND_JFD_OTTOMAN'),	
		('CIVILIZATION_PERSIA',			'_JFD_IRANIAN',			'CULTURE_JFD_IRANIAN',					NULL,								NULL,							NULL,									'JFD_Iranian',			'JFD_Iranian',					'JFD_Iranian',				'AS2D_SOUND_JFD_PERSIAN'),	
		('CIVILIZATION_POLAND',			'_JFD_CENTRAL',			'CULTURE_JFD_CENTRAL',					NULL,								NULL,							'DefeatScreenLatePoland.dds',			'JFD_Central',			'JFD_Central',					'JFD_Central',				'AS2D_SOUND_JFD_POLISH'),	
		('CIVILIZATION_POLYNESIA',		'_JFD_OCEANIC',			'CULTURE_JFD_OCEANIC',					NULL,								NULL,							NULL,									'JFD_Oceanic',			'JFD_Oceanic',					'JFD_Oceanic',				NULL),	
		('CIVILIZATION_PORTUGAL',		'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							'DefeatScreenLatePortugal.dds',			'JFD_Western',			'JFD_Western',					'JFD_ColonialLatin',		'AS2D_SOUND_JFD_PORTUGUESE'),	
		('CIVILIZATION_ROME',			'_JFD_CLASSICAL',		'CULTURE_JFD_CLASSICAL',				'DefeatScreenEarlyRome.dds',		NULL,							'DefeatScreenLateRome.dds',				'JFD_Classical',		'JFD_ClassicalRoman',			'JFD_ClassicalRoman',		'AS2D_SOUND_JFD_ROMAN'),	
		('CIVILIZATION_RUSSIA',			'_JFD_EASTERN',			'CULTURE_JFD_EASTERN',					NULL,								NULL,							'DefeatScreenLateRussia.dds',			'JFD_Eastern',			'JFD_Eastern',					'JFD_Eastern',				'AS2D_SOUND_JFD_RUSSIAN'),	
		('CIVILIZATION_SHOSHONE',		'_JFD_GREAT_PLAINS',	'CULTURE_JFD_GREAT_PLAINS',				NULL,								NULL,							NULL,									'JFD_GreatPlains',		'JFD_GreatPlains',				'JFD_GreatPlains',			'AS2D_SOUND_JFD_SIOUX'),	
		('CIVILIZATION_SIAM',			'_JFD_MANDALA',			'CULTURE_JFD_MANDALA',					NULL,								NULL,							NULL,									'JFD_Mandala',			'JFD_Mandala',					'JFD_Mandala',				'AS2D_SOUND_JFD_SIAMESE'),	
		('CIVILIZATION_SONGHAI',		'_JFD_SAHARAN',			'CULTURE_JFD_SAHARAN',					NULL,								NULL,							NULL,									'JFD_Saharan',			'JFD_Saharan',					'JFD_Saharan',				'AS2D_SOUND_JFD_MALINESE'),	
		('CIVILIZATION_SPAIN',			'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							'DefeatScreenLateSpain.dds',			'JFD_Western',			'JFD_Western',					'JFD_Southern',				'AS2D_SOUND_JFD_SPANISH'),	
		('CIVILIZATION_SWEDEN',			'_JFD_WESTERN',			'CULTURE_JFD_WESTERN',					NULL,								NULL,							'DefeatScreenLateSweden.dds',			'JFD_Western',			'JFD_Western',					'JFD_Western',				'AS2D_SOUND_JFD_SWEDISH'),	
		('CIVILIZATION_VENICE',			'_JFD_SOUTHERN',		'CULTURE_JFD_SOUTHERN',					NULL,								NULL,							NULL,									'JFD_Southern',			'JFD_Southern',					'JFD_Southern',				'AS2D_SOUND_JFD_ITALIAN'),	
		('CIVILIZATION_ZULU',			'_JFD_BANTU',			'CULTURE_JFD_BANTU',					NULL,								NULL,							NULL,									'JFD_Bantu',			'JFD_Bantu',					'JFD_Bantu',				'AS2D_SOUND_JFD_ZULU');

--Brazil
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_GRECO_ROMAN'
WHERE Type = 'CIVILIZATION_BRAZIL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_BRAZIL' AND Value = 1);

--Huns
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_EUROPEAN'
WHERE Type IN ('CIVILIZATION_HUNS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_HUNS' AND Value = 1);

--India
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_MIDDLE_EAST'
WHERE Type = 'CIVILIZATION_INDIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_INDIA' AND Value = 1);

--Ottomans
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_GRECO_ROMAN'
WHERE Type = 'CIVILIZATION_OTTOMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_OTTOMAN' AND Value = 1);

--Portugal/Spain
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_GRECO_ROMAN'
WHERE Type IN ('CIVILIZATION_PORTUGAL', 'CIVILIZATION_SPAIN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_PORTUGAL_SPAIN' AND Value = 1);

--Zulu
UPDATE Civilizations
SET ArtStyleType = 'ARTSTYLE_SOUTH_AMERICA'
WHERE Type = 'CIVILIZATION_ZULU'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_ARCHITECTURE_CHANGES_ZULU' AND Value = 1);
--==========================================================================================================================
-- CIVILIZATIONS (MODDED SUPPORT)
--========================================================================================================================== 
-- Civilization_JFD_CultureTypes
------------------------
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						CultureType,					SplashScreenTag,			SoundtrackTag)
VALUES	('CIVILIZATION_AUSTRALIA_LS_MOD',		'CULTURE_JFD_ABORIGINAL',		NULL,						NULL),
		('CIVILIZATION_KULINNATION',			'CULTURE_JFD_ABORIGINAL',		NULL,						NULL),
		('CIVILIZATION_AYMARA',					'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_CHIMOR',					'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_CHIMU_MOD',				'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_MAPUCHE',				'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_MUISCA',					'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_TIWANAKU',				'CULTURE_JFD_ANDEAN',			NULL,						NULL),
		('CIVILIZATION_MAASAI',					'CULTURE_JFD_BANTU',			NULL,						NULL),
		('CIVILIZATION_MONOMOTAPA',				'CULTURE_JFD_BANTU',			NULL,						NULL),
		('CIVILIZATION_ZIMBABWE_LS_MOD',		'CULTURE_JFD_BANTU',			NULL,						NULL),
		('CIVILIZATION_HARAPPAN',				'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_MARATHA',				'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_MAURYA_LS_MOD',			'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_MAURYA',					'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_SIKH',					'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_SRI_LANKA',				'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_VIJAYANAGAR',			'CULTURE_JFD_BHARATA',			NULL,						NULL),
		('CIVILIZATION_BOHEMIA',				'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_CROATIA',				'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_FRANKS_LS_MOD',			'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_HUNGARY_LS_MOD',			'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_LITHUANIA_LS_MOD',		'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_POLAND_LS_MOD',			'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_SWITZERLAND',			'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_SWITZERLAND_LS_MOD',		'CULTURE_JFD_CENTRAL',			NULL,						NULL),
		('CIVILIZATION_MINOA_LS_MOD',			'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_MINOAN',					'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_SELEUCID',				'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_SPARTA_LS_MOD',			'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_TCM_BACTRIA',			'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_TCM_PTOLEMAIC',			'CULTURE_JFD_CLASSICAL',		NULL,						NULL),
		('CIVILIZATION_BOER',					'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_CARIBBEAN_LS_MOD',		'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_COLONIALCANADA',			'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_CSA',					'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_PIRATE',					'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_RHODESIA',				'CULTURE_JFD_COLONIAL',			NULL,						NULL),
		('CIVILIZATION_ARGENTINA',				'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_BOLIVIA',				'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_CHILE',					'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_GRANCOLOMBIA',			'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_LEUGI_CUBA',				'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_MEXICO',					'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_MEXICOREPUBLIC',			'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_PARAGUAY',				'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_PERU',					'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_VENEZUELA',				'CULTURE_JFD_COLONIAL',			'JFD_ColonialLatin',		'JFD_ColonialLatin'),
		('CIVILIZATION_ALBANIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_ARMENIA',				'CULTURE_JFD_EASTERN',			'JFD_EasternByzantine',		'JFD_EasternByzantine'),
		('CIVILIZATION_AZERBAIJAN',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_BOSNIA',					'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_BULGARIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_BULGARIA_LS_MOD',		'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_CROATIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_GE_SLAVS',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_HETMANATE_LS_MOD',		'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_KDMBOSNIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_LATVIA',					'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_MACEDONIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_MOLDAVIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_MONTENEGRO',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_ROMANIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_ROMANIA_LS_MOD',			'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_WALLACHIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_YUGOSLAVIA',				'CULTURE_JFD_EASTERN',			NULL,						NULL),
		('CIVILIZATION_PAPUA',					'CULTURE_JFD_EAST_INDIES',		NULL,						NULL),
		('CIVILIZATION_BLACKFOOTFIRSTNATION',	'CULTURE_JFD_GREAT_PLAINS',		NULL,						NULL),
		('CIVILIZATION_NIITSITAPI_LS_MOD',		'CULTURE_JFD_GREAT_PLAINS',		NULL,						NULL),
		('CIVILIZATION_SIOUX',					'CULTURE_JFD_GREAT_PLAINS',		NULL,						NULL),
		('CIVILIZATION_SIOUX_LS_MOD',			'CULTURE_JFD_GREAT_PLAINS',		NULL,						NULL),
		('CIVILIZATION_NEPAL',					'CULTURE_JFD_HIMALAYAN',		NULL,						NULL),
		('CIVILIZATION_NEPAL_LS_MOD',			'CULTURE_JFD_HIMALAYAN',		NULL,						NULL),
		('CIVILIZATION_TIBET_LS_MOD',			'CULTURE_JFD_HIMALAYAN',		NULL,						NULL),
		('CIVILIZATION_BANE_TIBET',				'CULTURE_JFD_HIMALAYAN',		NULL,						NULL),
		('CIVILIZATION_PARTHIA',				'CULTURE_JFD_IRANIAN',			NULL,						NULL),
		('CIVILIZATION_SASANIAN',				'CULTURE_JFD_IRANIAN',			NULL,						NULL),
		('CIVILIZATION_ALGERIA',				'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_BERBER',					'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_CORDOBA',				'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_DURANNI_LS_MOD',			'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_HAFEZ_SYRIA',			'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_IRAN',					'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_KUWAIT',					'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_LIBYA',					'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_SADAT_EGYPT',			'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_UAE',					'CULTURE_JFD_ISLAMIC',			NULL,						NULL),
		('CIVILIZATION_DJSH_AFSHARID',			'CULTURE_JFD_ISLAMIC',			'JFD_IslamicTurkic',		'JFD_IslamicTurkic'),
		('CIVILIZATION_MC_MUGHAL',				'CULTURE_JFD_ISLAMIC',			'JFD_IslamicTurkic',		'JFD_IslamicTurkic'),
		('CIVILIZATION_SAFAVIDS',				'CULTURE_JFD_ISLAMIC',			'JFD_IslamicTurkic',		'JFD_IslamicTurkic'),
		('CIVILIZATION_TCM_WW1_OTTOMAN',		'CULTURE_JFD_ISLAMIC',			'JFD_IslamicTurkic',		'JFD_IslamicTurkic'),
		('CIVILIZATION_UC_TURKEY',				'CULTURE_JFD_ISLAMIC',			'JFD_IslamicTurkic',		'JFD_IslamicTurkic'),
		('CIVILIZATION_TUPI',					'CULTURE_JFD_KATUJE',			NULL,						NULL),
		('CIVILIZATION_CARIB',					'CULTURE_JFD_KATUJE',			NULL,						NULL),
		('CIVILIZATION_KUHIKUGU',				'CULTURE_JFD_KATUJE',			NULL,						NULL),
		('CIVILIZATION_BURMA',					'CULTURE_JFD_MANDALA',			NULL,						NULL),
		('CIVILIZATION_CAMBODIA',				'CULTURE_JFD_MANDALA',			NULL,						NULL),
		('CIVILIZATION_KHMER',					'CULTURE_JFD_MANDALA',			NULL,						NULL),
		('CIVILIZATION_KHMER_LS_MOD',			'CULTURE_JFD_MANDALA',			NULL,						NULL),
		('CIVLIZATION_LAOS',					'CULTURE_JFD_MANDALA',			NULL,						NULL),
		('CIVILIZATION_OLMEC_LS_MOD',			'CULTURE_JFD_MESOAMERICAN',		NULL,						NULL),
		('CIVILIZATION_ZAPOTEC',				'CULTURE_JFD_MESOAMERICAN',		NULL,						NULL),
		('CIVILIZATION_AKKADIA',				'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_HITTITE_LS_MOD',			'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_MITANNI',				'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_NUBIA',					'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_NUMIDIA_LS_MOD',			'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_SUMERIA_LS_MOD',			'CULTURE_JFD_MESOPOTAMIC',		NULL,						NULL),
		('CIVILIZATION_FINLAND',				'CULTURE_JFD_NORTHERN',			NULL,						NULL),
		('CIVILIZATION_KDMLITHUANIA',			'CULTURE_JFD_NORTHERN',			NULL,						NULL),
		('CIVILIZATION_TCM_SUEBI',				'CULTURE_JFD_NORTHERN',			NULL,						NULL),
		('CIVILIZATION_VIKING_LS_MOD',			'CULTURE_JFD_NORTHERN',			NULL,						NULL),
		('CIVILIZATION_CALC_MANX',				'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_CORNWALL',				'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_DALRIATA',				'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_GALLIA_LS_MOD',			'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_GE_PICTS',				'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_ICENI',					'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_IRELAND',				'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_NORTHUMBRIA',			'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_PICTS',					'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_WALES',					'CULTURE_JFD_NORTHERN',			'JFD_NorthernCeltic',		'JFD_NorthernCeltic'),
		('CIVILIZATION_TAHITI_LS_MOD',			'CULTURE_JFD_OCEANIC',			NULL,						NULL),
		('CIVILIZATION_QIN_LS_MOD',				'CULTURE_JFD_ORIENTAL',			NULL,						NULL),
		('CIVILIZATION_VIETNAM',				'CULTURE_JFD_ORIENTAL',			NULL,						NULL),
		('CIVILIZATION_RYUKYU',					'CULTURE_JFD_ORIENTAL',			NULL,						NULL),
		('CIVILIZATION_VIETNAM_LS_MOD',			'CULTURE_JFD_ORIENTAL',			NULL,						NULL),
		('CIVILIZATION_ALTJAPAN',				'CULTURE_JFD_ORIENTAL',			'JFD_OrientalJapanese',		'JFD_OrientalJapanese'),
		('CIVILIZATION_MC_CHINOOK',				'CULTURE_JFD_PACIFIC',			NULL,						NULL),
		('CIVILIZATION_HAIDA_LS_MOD',			'CULTURE_JFD_PACIFIC',			NULL,						NULL),
		('CIVILIZATION_HAIDA_LS_MOD',			'CULTURE_JFD_PACIFIC',			NULL,						NULL),
		('CIVILIZATION_SIBIR',					'CULTURE_JFD_POLAR',			NULL,						NULL),
		('CIVILIZATION_SAMI',					'CULTURE_JFD_POLAR',			NULL,						NULL),
		('CIVILIZATION_INUIT',					'CULTURE_JFD_POLAR',			NULL,						NULL),
		('CIVILIZATION_YUPIK',					'CULTURE_JFD_POLAR',			NULL,						NULL),
		('CIVILIZATION_CLINUIT',				'CULTURE_JFD_POLAR',			NULL,						NULL),
		('CIVILIZATION_MALI_LS_MOD',			'CULTURE_JFD_SAHARAN',			NULL,						NULL),
		('CIVILIZATION_ISRAEL',					'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_ISRAEL_LS_MOD',			'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_LEUGI_PHILISTINE',		'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_NABATAEA',				'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_PHOENICIA',				'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_PHOENICIA_LS_MOD',		'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_SABA',					'CULTURE_JFD_SEMITIC',			NULL,						NULL),
		('CIVILIZATION_BANE_RCC',				'CULTURE_JFD_SOUTHERN',			NULL,						NULL),
		('CIVILIZATION_GENOA_LS_MOD',			'CULTURE_JFD_SOUTHERN',			NULL,						NULL),
		('CIVILIZATION_JERUSALEM_LS_MOD',		'CULTURE_JFD_SOUTHERN',			NULL,						NULL),
		('CIVILIZATION_TCM_SICILY',				'CULTURE_JFD_SOUTHERN',			NULL,						NULL),
		('CIVILIZATION_PAPAL_STATES_LS_MOD',	'CULTURE_JFD_SOUTHERN',			NULL,						NULL),
		('CIVILIZATION_KAZAKH',					'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_KHAZARIA',				'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_SCYTHIA_LS_MOD',			'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_TCM_ALAN',				'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_TIMURIDES',				'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_TIMURIDS_LS_MOD',		'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_UYGHUR',					'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_YAKUTIA',				'CULTURE_JFD_STEPPE',			NULL,						NULL),
		('CIVILIZATION_NORTH_KOREA',			'CULTURE_JFD_TOTALITARIAN',		NULL,						NULL),
		('CIVILIZATION_USSR',					'CULTURE_JFD_TOTALITARIAN',		NULL,						NULL),
		('CIVILIZATION_ASHANTI_LS_MOD',			'CULTURE_JFD_WEST_AFRICAN',		NULL,						NULL),
		('CIVILIZATION_KANEM',					'CULTURE_JFD_WEST_AFRICAN',		NULL,						NULL),
		('CIVILIZATION_NDONGO_LS_MOD',			'CULTURE_JFD_WEST_AFRICAN',		NULL,						NULL),
		('CIVILIZATION_FLANDERS',				'CULTURE_JFD_WESTERN',			NULL,						NULL),
		('CIVILIZATION_FLANDERS_LS_MOD',		'CULTURE_JFD_WESTERN',			NULL,						NULL),
		('CIVILIZATION_SCOTLAND_LS_MOD',		'CULTURE_JFD_WESTERN',			NULL,						NULL),
		('CIVILIZATION_UK',						'CULTURE_JFD_WESTERN',			'JFD_WesternBritish',		'JFD_WesternBritish'),
		('CIVILIZATION_CHEROKEE_LS_MOD',		'CULTURE_JFD_WOODLANDS',		NULL,						NULL),
		('CIVILIZATION_MC_CALUSA',				'CULTURE_JFD_WOODLANDS',		NULL,						NULL),
		('CIVILIZATION_CLANISHINAABE',			'CULTURE_JFD_WOODLANDS',		NULL,						NULL),
		('CIVILIZATION_CLWABANAKI',				'CULTURE_JFD_WOODLANDS',		NULL,						NULL);
------------------------
-- Aboriginal
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_ABORIGINAL', SplashScreenTag = 'JFD_Aboriginal', SoundtrackTag = 'JFD_Aboriginal'
WHERE CultureType = 'JFD_Sahul';
------------------------
-- Andean
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_ANDEAN'
WHERE CultureType = 'JFD_Andean';
------------------------
-- Bantu
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_BANTU'
WHERE CultureType = 'JFD_Bantu';
------------------------
-- Bharata
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_BHARATA'
WHERE CultureType = 'JFD_Bharata';
------------------------
-- Central 
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_CENTRAL'
WHERE CultureType = 'JFD_Central';
------------------------
-- Classical
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_CLASSICAL', SplashScreenTag = 'JFD_Classical', SoundtrackTag = 'JFD_Classical'
WHERE CultureType = 'JFD_MediterraneanClassical';

UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_CLASSICAL'
WHERE CultureType = 'JFD_Classical';
------------------------ 
-- Colonial
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_COLONIAL'
WHERE CultureType = 'JFD_Colonial';
------------------------
-- Eastern
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_EASTERN'
WHERE CultureType = 'JFD_Eastern';
------------------------
-- East Indies
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_EAST_INDIES', SplashScreenTag = 'JFD_EastIndies', SoundtrackTag = 'JFD_EastIndies'
WHERE CivilizationType IN ('CIVILIZATION_RBRUNEI');
------------------------ 
-- Great Plains
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_GREAT_PLAINS', SplashScreenTag = 'JFD_GreatPlains', SoundtrackTag = 'JFD_GreatPlains'
WHERE CultureType = 'JFD_TribalAmerican';
------------------------
-- Himalayan
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_HIMALAYAN', SplashScreenTag = 'JFD_Himalayan', SoundtrackTag = 'JFD_Himalayan'
WHERE CivilizationType IN ('CIVILIZATION_JFD_BHUTAN', 'CIVILIZATION_MC_TIBET', 'CIVILIZATION_BHUTAN', 'CIVILIZATION_DJSH_NEPAL');
------------------------
-- Iranian
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_IRANIAN', SplashScreenTag = 'JFD_Iranian', SoundtrackTag = 'JFD_Iranian'
WHERE CivilizationType IN ('CIVILIZATION_DJSH_SASSANID');
------------------------ 
-- Islamic
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_ISLAMIC'
WHERE CultureType = 'JFD_Islamic';

UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_ISLAMIC', SplashScreenTag = 'JFD_IslamicTurkic', SoundtrackTag = 'JFD_IslamicTurkic'
WHERE CivilizationType IN ('CIVILIZATION_TCM_WW1_OTTOMAN', 'CIVILIZATION_MC_MUGHAL');
------------------------
-- Katuje
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_KATUJE'
WHERE CultureType = 'JFD_Katuje';
------------------------
-- Mandala
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_MANDALA'
WHERE CultureType = 'JFD_Mandala';
------------------------
-- MesoAmerican
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_MESOAMERICAN'
WHERE CultureType = 'JFD_Mesoamerican';
------------------------
-- Mesopotamic
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_MESOPOTAMIC'
WHERE CultureType = 'JFD_Mesopotamic';
------------------------
-- Northern
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_NORTHERN'
WHERE CultureType = 'JFD_Northern';
------------------------ 
-- Oceanic
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_OCEANIC'
WHERE CultureType = 'JFD_Oceanic';
------------------------
-- Oriental
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_ORIENTAL'
WHERE CultureType = 'JFD_Oriental';
------------------------ 
-- Pacific
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_PACIFIC', SplashScreenTag = 'JFD_Pacific', SoundtrackTag = 'JFD_Pacific'
WHERE SplashScreenTag = 'JFD_TribalAmericanPNW';

UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_PACIFIC'
WHERE CultureType = 'JFD_Pacific'; 
------------------------ 
-- Polar
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_POLAR'
WHERE CultureType = 'JFD_Polar';
------------------------
-- Saharan
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_SAHARAN'
WHERE CultureType = 'JFD_Saharan';
------------------------
-- Semitic
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_SEMITIC'
WHERE CultureType = 'JFD_Semitic';

UPDATE Civilization_JFD_CultureTypes
SET SplashScreenTag = 'JFD_SemiticEthiopic'
WHERE CivilizationType = 'CIVILIZATION_MC_MAKURIA';
------------------------
-- Southern
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_SOUTHERN', SplashScreenTag = 'JFD_Southern', SoundtrackTag = 'JFD_Southern'
WHERE CultureType = 'JFD_Mediterranean';

UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_SOUTHERN'
WHERE CultureType = 'JFD_Southern';

UPDATE Civilization_JFD_CultureTypes
SET SplashScreenTag = 'JFD_SouthernPapal', SoundtrackTag = 'JFD_SouthernPapal'
WHERE CivilizationType = 'CIVILIZATION_PAPAL_STATES_LS_MOD';

UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_SOUTHERN'
WHERE CultureType = 'JFD_Papal';
------------------------
-- Steppe
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_STEPPE'
WHERE CultureType = 'JFD_Steppe';
------------------------
-- Totalitarian
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_TOTALITARIAN'
WHERE CultureType = 'JFD_Totalitarian';
------------------------
-- WestAfrican
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_WEST_AFRICAN'
WHERE CultureType = 'JFD_WestAfrican';
------------------------
-- Western European
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_WESTERN'
WHERE CultureType = 'JFD_Western';
------------------------ 
-- Woodlands
------------------------
UPDATE Civilization_JFD_CultureTypes
SET CultureType = 'CULTURE_JFD_WOODLANDS', SplashScreenTag = 'JFD_Woodlands', SoundtrackTag = 'JFD_Woodlands'
WHERE SplashScreenTag = 'JFD_TribalAmericanWoodlands';
-------------------------------
-- JFDCulDiv_Civilization_JFD_CultureTypes
-------------------------------
CREATE TRIGGER JFDCulDiv_Civilization_JFD_CultureTypes
AFTER INSERT ON Civilization_JFD_CultureTypes
BEGIN
	------------------------ 
	-- Aboriginal
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_ABORIGINAL'
	WHERE CultureType = 'JFD_Sahul' OR CultureType = 'JFD_Aboriginal';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_Aboriginal'
	WHERE SplashScreenTag = 'JFD_Sahul';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_Aboriginal'
	WHERE SoundtrackTag = 'JFD_Sahul';
	------------------------
	-- Andean
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_ANDEAN'
	WHERE CultureType = 'JFD_Andean';
	------------------------
	-- Bantu
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_BANTU'
	WHERE CultureType = 'JFD_Bantu';
	------------------------
	-- Bharata
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_BHARATA'
	WHERE CultureType = 'JFD_Bharata';
	------------------------
	-- Central 
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_CENTRAL'
	WHERE CultureType = 'JFD_Central';
	------------------------
	-- Classical
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_CLASSICAL'
	WHERE CultureType = 'JFD_Classical' OR CultureType = 'JFD_MediterraneanClassical';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_Classical'
	WHERE SplashScreenTag = 'JFD_MediterraneanClassical';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_Classical'
	WHERE SoundtrackTag = 'JFD_MediterraneanClassical';
	------------------------ 
	-- Colonial
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_COLONIAL'
	WHERE CultureType = 'JFD_Colonial';
	------------------------
	-- Eastern
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_EASTERN'
	WHERE CultureType = 'JFD_Eastern';
	------------------------
	-- East Indies
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_EAST_INDIES', SplashScreenTag = 'JFD_EastIndies', SoundtrackTag = 'JFD_EastIndies'
	WHERE CivilizationType IN ('CIVILIZATION_RBRUNEI');
	------------------------ 
	-- Great Plains
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_GREAT_PLAINS'
	WHERE CultureType = 'JFD_TribalAmerican';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_GreatPlains'
	WHERE SplashScreenTag = 'JFD_TribalAmerican';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_GreatPlains'
	WHERE SoundtrackTag = 'JFD_TribalAmerican';
	------------------------
	-- Himalayan
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_HIMALAYAN', IdealsTag = 'JFD_Himalayan', SplashScreenTag = 'JFD_Himalayan', SoundtrackTag = 'JFD_Himalayan'
	WHERE CivilizationType IN ('CIVILIZATION_JFD_BHUTAN', 'CIVILIZATION_MC_TIBET', 'CIVILIZATION_BHUTAN', 'CIVILIZATION_DJSH_NEPAL');

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Himalayan'
	WHERE Type IN ('CIVILIZATION_JFD_BHUTAN', 'CIVILIZATION_MC_TIBET', 'CIVILIZATION_BHUTAN', 'CIVILIZATION_DJSH_NEPAL')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Iranian
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_IRANIAN', IdealsTag = 'JFD_Iranian', SplashScreenTag = 'JFD_Iranian', SoundtrackTag = 'JFD_Iranian'
	WHERE CivilizationType IN ('CIVILIZATION_DJSH_SASSANID');	
	------------------------ 
	-- Islamic
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_ISLAMIC'
	WHERE CultureType = 'JFD_Islamic';
	
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_ISLAMIC', SplashScreenTag = 'JFD_IslamicTurkic', SoundtrackTag = 'JFD_IslamicTurkic'
	WHERE CivilizationType IN ('CIVILIZATION_TCM_WW1_OTTOMAN', 'CIVILIZATION_MC_MUGHAL');
	------------------------
	-- Katuje
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_KATUJE'
	WHERE CultureType = 'JFD_Katuje';
	------------------------
	-- Mandala
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_MANDALA'
	WHERE CultureType = 'JFD_Mandala';
	------------------------
	-- MesoAmerican
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_MESOAMERICAN'
	WHERE CultureType = 'JFD_Mesoamerican';
	------------------------
	-- Mesopotamic
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_MESOPOTAMIC'
	WHERE CultureType = 'JFD_Mesopotamic';
	------------------------
	-- Northern
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_NORTHERN'
	WHERE CultureType = 'JFD_Northern';
	------------------------ 
	-- Oceanic
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_OCEANIC'
	WHERE CultureType = 'JFD_Oceanic';
	------------------------
	-- Oriental
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_ORIENTAL'
	WHERE CultureType = 'JFD_Oriental';
	------------------------ 
	-- Pacific
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_PACIFIC'
	WHERE SplashScreenTag = 'JFD_TribalAmericanPNW';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_Pacific'
	WHERE SplashScreenTag = 'JFD_TribalAmericanPNW';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_Pacific'
	WHERE SoundtrackTag = 'JFD_TribalAmericanPNW';
	------------------------ 
	-- Polar
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_POLAR'
	WHERE CultureType = 'JFD_Polar';
	------------------------
	-- Saharan
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_SAHARAN'
	WHERE CultureType = 'JFD_Saharan';
	------------------------
	-- Semitic
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_SEMITIC'
	WHERE CultureType = 'JFD_Semitic';

	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_SemiticEthiopic', SplashScreenTag = 'JFD_SemiticEthiopic'
	WHERE CivilizationType = 'CIVILIZATION_MC_MAKURIA';
	------------------------
	-- Southern
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_SOUTHERN'
	WHERE CultureType = 'JFD_Southern' OR CultureType = 'JFD_Mediterranean';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_Southern'
	WHERE SplashScreenTag = 'JFD_Mediterranean';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_Southern'
	WHERE SoundtrackTag = 'JFD_Mediterranean';

	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_SOUTHERN'
	WHERE CultureType = 'JFD_Papal';
	------------------------
	-- Steppe
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_STEPPE'
	WHERE CultureType = 'JFD_Steppe';
	------------------------
	-- Totalitarian
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_TOTALITARIAN'
	WHERE CultureType = 'JFD_Totalitarian';
	------------------------
	-- WestAfrican
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_WEST_AFRICAN'
	WHERE CultureType = 'JFD_WestAfrican';
	------------------------
	-- Western European
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_WESTERN'
	WHERE CultureType = 'JFD_Western';
	------------------------ 
	-- Woodlands
	------------------------
	UPDATE Civilization_JFD_CultureTypes
	SET CultureType = 'CULTURE_JFD_WOODLANDS'
	WHERE SplashScreenTag = 'JFD_TribalAmericanWoodlands';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SplashScreenTag = 'JFD_Woodlands'
	WHERE SplashScreenTag = 'JFD_TribalAmericanWoodlands';
	
	UPDATE Civilization_JFD_CultureTypes
	SET SoundtrackTag = 'JFD_Woodlands'
	WHERE SoundtrackTag = 'JFD_TribalAmericanWoodlands';
END;	
--==========================================================================================================================
-- CIVILIZATIONS (SOUNDTRACK SUPPORT)
--========================================================================================================================== 
-- Aboriginal
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Aboriginal'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Aboriginal')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Aboriginal'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Aboriginal')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Andean
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Andean'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Andean')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Andean'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Andean')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Bantu
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bantu'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bantu'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Bharata
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bharata'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bharata')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bharata'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bharata')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Central European
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Classical
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Classical'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Classical')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Classical'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_Classical', 'JFD_MediterraneanClassical'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ClassicalRoman'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ClassicalRoman')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ClassicalRoman'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ClassicalRoman')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Colonial
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ColonialLatin'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ColonialLatin'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Eastern European
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- East Indies
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_EastIndies'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_EastIndies'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Great Plains
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_GreatPlains'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_GreatPlains')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_GreatPlains'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_GreatPlains')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Himalayan
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Himalayan'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Himalayan')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Himalayan'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Himalayan')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Iranian
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Iranian'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Iranian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Iranian'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Iranian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Islamic
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_IslamicTurkic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_IslamicTurkic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_IslamicTurkic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_IslamicTurkic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Katuje
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Katuje'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Katuje')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Katuje'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Katuje')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Mandala
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mandala'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mandala'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
 ------------------------
-- Mesoamerican
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesoamerican'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesoamerican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesoamerican'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesoamerican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Mesopotamic
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesopotamic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesopotamic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Northern European
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_NorthernCeltic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_NorthernCeltic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Oceanic
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Oceanic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oceanic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Oceanic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oceanic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Oriental
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Oriental'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oriental')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Oriental'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oriental')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_OrientalJapanese'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_OrientalJapanese')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Pacific
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Pacific'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Pacific'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Polar
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Polar'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Polar'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Saharan
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Saharan'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Saharan')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Saharan'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Saharan')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Semitic
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Semitic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Semitic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Semitic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Semitic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_SemiticEthiopic'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SemiticEthiopic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_SemiticEthiopic'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SemiticEthiopic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Southern
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Southern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_Southern', 'JFD_Mediterranean'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_SouthernPapal'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SouthernPapal')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_SouthernPapal'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_SouthernPapal', 'JFD_Papal'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Steppe
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Steppe'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Steppe'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------
-- Totalitarian
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Totalitarian'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Totalitarian'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- WestAfrican
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_WestAfrican'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WestAfrican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_WestAfrican'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WestAfrican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Western
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_WesternBritish'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WesternBritish')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------ 
-- Woodlands
------------------------
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Woodlands'
WHERE Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Woodlands')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Woodlands'
WHERE Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Woodlands')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------------------------------
-- JFDCulDiv_Civilizations
------------------------------------------------
CREATE TRIGGER JFDCulDiv_Civilizations_Soundtracks
AFTER INSERT ON Civilizations
BEGIN
	-- Aboriginal
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Aboriginal'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Aboriginal')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Aboriginal'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Aboriginal')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Andean
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Andean'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Andean')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Andean'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Andean')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Bantu
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Bantu'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Bantu'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Bharata
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Bharata'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bharata')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Bharata'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bharata')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Central European
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Central'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Central'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Classical
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Classical'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Classical')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Classical'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_Classical', 'JFD_MediterraneanClassical'))
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_ClassicalRoman'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ClassicalRoman')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_ClassicalRoman'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ClassicalRoman')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Colonial
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Colonial'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Colonial'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_ColonialLatin'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_ColonialLatin'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Eastern European
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Eastern'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Eastern'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- East Indies
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_EastIndies'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_EastIndies'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Great Plains
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_GreatPlains'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_GreatPlains')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_GreatPlains'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_GreatPlains')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Himalayan
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Himalayan'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Himalayan')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Himalayan'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Himalayan')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Iranian
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Iranian'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Iranian')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Iranian'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Iranian')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Islamic
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Islamic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Islamic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_IslamicTurkic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_IslamicTurkic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_IslamicTurkic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_IslamicTurkic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Katuje
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Katuje'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Katuje')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Katuje'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Katuje')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Mandala
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mandala'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mandala'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	 ------------------------
	-- Mesoamerican
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mesoamerican'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesoamerican')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mesoamerican'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesoamerican')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Mesopotamic
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mesopotamic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Mesopotamic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Northern European
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Northern'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Northern'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_NorthernCeltic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_NorthernCeltic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Oceanic
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Oceanic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oceanic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Oceanic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oceanic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Oriental
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Oriental'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oriental')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Oriental'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Oriental')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_OrientalJapanese'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_OrientalJapanese')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Pacific
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Pacific'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Pacific'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Polar
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Polar'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Polar'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Saharan
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Saharan'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Saharan')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Saharan'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Saharan')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Semitic
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Semitic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Semitic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Semitic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Semitic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_SemiticEthiopic'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SemiticEthiopic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_SemiticEthiopic'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SemiticEthiopic')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Southern
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Southern'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Southern')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Southern'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_Southern', 'JFD_Mediterranean'))
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_SouthernPapal'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SouthernPapal')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_SouthernPapal'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag IN ('JFD_SouthernPapal', 'JFD_Papal'))
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Steppe
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Steppe'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Steppe'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------
	-- Totalitarian
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Totalitarian'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Totalitarian'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- WestAfrican
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_WestAfrican'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WestAfrican')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_WestAfrican'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WestAfrican')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Western
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Western'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Western'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_WesternBritish'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WesternBritish')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
	------------------------ 
	-- Woodlands
	------------------------
	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Woodlands'
	WHERE NEW.Type IN (SELECT SoundtrackTag FROM JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Woodlands')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

	UPDATE Civilizations 
	SET SoundtrackTag = 'JFD_Woodlands'
	WHERE NEW.Type IN (SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Woodlands')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
END; 
-------------------------------
-- Civilization_JFD_ColonialCityNames
-------------------------------
INSERT INTO Civilization_JFD_ColonialCityNames
		(CultureType, 					LinguisticType)
VALUES	('CULTURE_JFD_ABORIGINAL',		'JFD_Austronesian'),
		('CULTURE_JFD_ANDEAN',			'JFD_Quechumaran'),
		('CULTURE_JFD_BANTU',			'JFD_Bantu'),
		('CULTURE_JFD_BHARATA',			'JFD_IndoIranian'),
		('CULTURE_JFD_CENTRAL',			'JFD_Germanic'),
		('CULTURE_JFD_CENTRAL',			'JFD_Latinate'),
		('CULTURE_JFD_CENTRAL',			'JFD_Slavic'),
		('CULTURE_JFD_CLASSICAL',		'JFD_Latinate'),
		('CULTURE_JFD_CLASSICAL',		'JFD_Hellenic'),
		('CULTURE_JFD_COLONIAL',		'JFD_Latinate'),
		('CULTURE_JFD_COLONIAL',		'JFD_Germanic'),
		('CULTURE_JFD_EASTERN',			'JFD_Slavic'),
		('CULTURE_JFD_EAST_INDIES',		'JFD_TaiKhmer'),
		('CULTURE_JFD_GREAT_PLAINS',	'JFD_NorthAmerican'),
		('CULTURE_JFD_HIMALAYAN',		'JFD_IndoIranian'),
		('CULTURE_JFD_IRANIAN',			'JFD_IndoIranian'),
		('CULTURE_JFD_ISLAMIC',			'JFD_Arabic'),
		('CULTURE_JFD_MANDALA',			'JFD_TaiKhmer'),
		('CULTURE_JFD_MESOAMERICAN',	'JFD_Mesoamerican'),
		('CULTURE_JFD_MESOPOTAMIC',		'JFD_Mesopotamian'),
		('CULTURE_JFD_NORTHERN',		'JFD_FinnoUgric'),
		('CULTURE_JFD_NORTHERN',		'JFD_Celtic'),
		('CULTURE_JFD_NORTHERN',		'JFD_Germanic'),
		('CULTURE_JFD_OCEANIC',			'JFD_Austronesian'),
		('CULTURE_JFD_ORIENTAL',		'JFD_Oriental'),
		('CULTURE_JFD_PACIFIC',			'JFD_NorthAmerican'),
		('CULTURE_JFD_PAPAL',			'JFD_Latinate'),
		('CULTURE_JFD_POLAR',			'JFD_Finno_Ugric'),
		('CULTURE_JFD_SEMITIC',			'JFD_Semitic'),
		('CULTURE_JFD_SOUTHERN',		'JFD_Latinate'),
		('CULTURE_JFD_STEPPE',			'JFD_Altaic'),
		('CULTURE_JFD_TOTALITARIAN',	'JFD_Latinate'),
		('CULTURE_JFD_TOTALITARIAN',	'JFD_Slavic'),
		('CULTURE_JFD_TOTALITARIAN',	'JFD_Oriental'),
		('CULTURE_JFD_TOTALITARIAN',	'JFD_Germanic'),
		('CULTURE_JFD_WEST_AFRICAN',	'JFD_Songhay'),
		('CULTURE_JFD_WESTERN',			'JFD_Germanic'),
		('CULTURE_JFD_WESTERN',			'JFD_Latinate'),
		('CULTURE_JFD_WOODLANDS',		'JFD_NorthAmerican');
--==========================================================================================================================
-- MINORCIVILIZATIONS
--==========================================================================================================================
-- MinorCivilization_JFD_CultureTypes
------------------------
INSERT INTO MinorCivilization_JFD_CultureTypes
		(MinorCivilizationType,		CultureType)
VALUES	('MINOR_CIV_ALMATY',		'CULTURE_JFD_STEPPE'),
		('MINOR_CIV_ANTANANARIVO',	'CULTURE_JFD_BANTU'),
		('MINOR_CIV_ANTWERP',		'CULTURE_JFD_WESTERN'),
		('MINOR_CIV_BELGRADE',		'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_BOGOTA',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_BRATISLAVA',	'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_BRUSSELS',		'CULTURE_JFD_WESTERN'),
		('MINOR_CIV_BUCHAREST',		'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_BUDAPEST',		'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_BUENOS_AIRES',	'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_BYBLOS',		'CULTURE_JFD_SEMITIC'),
		('MINOR_CIV_CAHOKIA',		'CULTURE_JFD_WOODLANDS'),
		('MINOR_CIV_CAPE_TOWN',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_COLOMBO',		'CULTURE_JFD_BHARATA'),
		('MINOR_CIV_FLORENCE',		'CULTURE_JFD_SOUTHERN'),
		('MINOR_CIV_GENEVA',		'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_GENOA',			'CULTURE_JFD_SOUTHERN'),
		('MINOR_CIV_HANOI',			'CULTURE_JFD_ORIENTAL'),
		('MINOR_CIV_HONG_KONG',		'CULTURE_JFD_ORIENTAL'),
		('MINOR_CIV_IFE',			'CULTURE_JFD_WEST_AFRICAN'),
		('MINOR_CIV_JERUSALEM',		'CULTURE_JFD_SEMITIC'),
		('MINOR_CIV_KABUL',			'CULTURE_JFD_IRANIAN'),
		('MINOR_CIV_KATHMANDU',		'CULTURE_JFD_HIMALAYAN'),
		('MINOR_CIV_KIEV',			'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_KUALA_LUMPUR',	'CULTURE_JFD_EAST_INDIES'),
		('MINOR_CIV_KYZYL',			'CULTURE_JFD_STEPPE'),
		('MINOR_CIV_LA_VENTA',		'CULTURE_JFD_MESOAMERICAN'),
		('MINOR_CIV_LHASA',			'CULTURE_JFD_HIMALAYAN'),
		('MINOR_CIV_MALACCA',		'CULTURE_JFD_EAST_INDIES'),
		('MINOR_CIV_MANILA',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_MBANZA_KONGO',	'CULTURE_JFD_BANTU'),
		('MINOR_CIV_MELBOURNE',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_MILAN',			'CULTURE_JFD_SOUTHERN'),
		('MINOR_CIV_MOGADISHU',		'CULTURE_JFD_ISLAMIC'),
		('MINOR_CIV_MOMBASA',		'CULTURE_JFD_BANTU'),
		('MINOR_CIV_MONACO',		'CULTURE_JFD_WESTERN'),
		('MINOR_CIV_ORMUS',			'CULTURE_JFD_IRANIAN'),
		('MINOR_CIV_PANAMA_CITY',	'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_PRAGUE',		'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_QUEBEC_CITY',	'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_RAGUSA',		'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_RIGA',			'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_SAMARKAND',		'CULTURE_JFD_STEPPE'),
		('MINOR_CIV_SIDON',			'CULTURE_JFD_SEMITIC'),
		('MINOR_CIV_SINGAPORE',		'CULTURE_JFD_ORIENTAL'),
		('MINOR_CIV_SOFIA',			'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_SYDNEY',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_TYRE',			'CULTURE_JFD_SEMITIC'),
		('MINOR_CIV_UR',			'CULTURE_JFD_MESOPOTAMIC'),
		('MINOR_CIV_VALLETTA',		'CULTURE_JFD_SOUTHERN'),
		('MINOR_CIV_VANCOUVER',		'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_VATICAN_CITY',	'CULTURE_JFD_SOUTHERN'),
		('MINOR_CIV_VILNIUS',		'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_WELLINGTON',	'CULTURE_JFD_COLONIAL'),
		('MINOR_CIV_WITTENBERG',	'CULTURE_JFD_CENTRAL'),
		('MINOR_CIV_YEREVAN',		'CULTURE_JFD_EASTERN'),
		('MINOR_CIV_ZANZIBAR',		'CULTURE_JFD_ISLAMIC'),
		('MINOR_CIV_ZURICH',		'CULTURE_JFD_CENTRAL');
--==========================================================================================================================		
--==========================================================================================================================		
