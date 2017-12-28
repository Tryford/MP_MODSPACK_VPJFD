--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AegeanRequestedResource (Aegean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AegeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AegeanRequestedResource
		(Type,							Req1,						Req2)
VALUES	('CIVILIZATION_GREECE',			'RESOURCE_SILVER',			'RESOURCE_MARBLE'),
		('CIVILIZATION_OTTOMAN',		'RESOURCE_COFFEE',			NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasRequestedResource (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type,							Req1,						Req2,				Req3)
VALUES	('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL),
		('CIVILIZATION_ENGLAND',		'RESOURCE_FISH',			'RESOURCE_PEARLS',	'RESOURCE_SUGAR'),
		('CIVILIZATION_NETHERLANDS',	'RESOURCE_PEARLS',			'RESOURCE_CRAB',	'RESOURCE_COCOA'),
		('CIVILIZATION_FRANCE',			'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_COTTON'),
		('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',			'RESOURCE_WHALE',	NULL),
		('CIVILIZATION_DENMARK',		'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_SUGAR'),
		('CIVILIZATION_SWEDEN',			'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ApennineRequestedResource (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type,							Req1,						Req2,				Req3)
VALUES	('CIVILIZATION_ROME',			'RESOURCE_WINE',			'RESOURCE_MARBLE',	'RESOURCE_OLIVE'),
		('CIVILIZATION_CARTHAGE',		'RESOURCE_OLIVE',			NULL,				NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_BritishIslesRequestedResource (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT OR REPLACE INTO Civilizations_BritishIslesRequestedResource
		(Type,							Req1,				Req2,				Yield2,		Req3)
VALUES	('CIVILIZATION_ENGLAND',		'RESOURCE_SHEEP',	'RESOURCE_COW',		0,			'RESOURCE_STONE'),
		('CIVILIZATION_CELTS',			'RESOURCE_COPPER',	'RESOURCE_IRON',	2,			NULL),
		('CIVILIZATION_DENMARK',		'RESOURCE_FISH',	NULL,				0,			NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanRequestedResource (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource
		(Type,							Req1,						Req2,				Yield2, Req3)
VALUES	('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	0,		NULL),
		('CIVILIZATION_RUSSIA',			'RESOURCE_FUR',				'RESOURCE_IRON',	2,		NULL),
		('CIVILIZATION_SPAIN',			'RESOURCE_SUGAR',			'RESOURCE_FISH',	0,		'RESOURCE_CRAB'),
		('CIVILIZATION_DENMARK',		'RESOURCE_FISH',			'RESOURCE_CRAB',	0,		NULL),
		('CIVILIZATION_SWEDEN',			'RESOURCE_FUR',				NULL,				0,		NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EastAsiaRequestedResource (East-Asia Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT OR REPLACE INTO Civilizations_EastAsiaRequestedResource
		(Type,							Req1,				Req2)
VALUES	('CIVILIZATION_CHINA',			'RESOURCE_SILK',	'RESOURCE_JADE');
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificRequestedResource (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthPacificRequestedResource
		(Type,							Req1,				Req2)
VALUES	('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',	'RESOURCE_WHALE');
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaGiantRequestedResource (Giant Levant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaGiantRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_EGYPT',		'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0),
		('CIVILIZATION_ASSYRIA',	'RESOURCE_WHEAT',	'RESOURCE_SILVER',	0),
		('CIVILIZATION_BYZANTIUM',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_OTTOMAN',	'RESOURCE_TEA',		'RESOURCE_HORSE',	2),
		('CIVILIZATION_ARABIA',		'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSmallRequestedResource (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSmallRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaSmallRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_CHINA',		'RESOURCE_SILK',	NULL,				0),
		('CIVILIZATION_KOREA',		'RESOURCE_SILK',	'RESOURCE_HORSE',	4),
		('CIVILIZATION_JAPAN',		'RESOURCE_FISH',	'RESOURCE_IRON',	2),
		('CIVILIZATION_SIAM',		'RESOURCE_COCOA',	'RESOURCE_IVORY',	0),
		('CIVILIZATION_MONGOL',		NULL,				'RESOURCE_HORSE',	6);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroLargeNewRequestedResource (Europe Large (new))
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_ARABIA',		'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_EGYPT',		'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_ENGLAND',	'RESOURCE_SILVER',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_FRANCE',		'RESOURCE_WINE',	'RESOURCE_IRON',	2),
		('CIVILIZATION_GERMANY',	'RESOURCE_FUR',		'RESOURCE_IRON',	2),
		('CIVILIZATION_GREECE',		'RESOURCE_FISH',	'RESOURCE_IRON',	2),
		('CIVILIZATION_OTTOMAN',	'RESOURCE_MARBLE',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_ROME',		'RESOURCE_MARBLE',	'RESOURCE_WINE',	0),
		('CIVILIZATION_RUSSIA',		'RESOURCE_FUR',		'RESOURCE_URANIUM',	2),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0),
		('CIVILIZATION_SPAIN',		NULL,				'RESOURCE_HORSE',	4),
		('CIVILIZATION_DENMARK',	'RESOURCE_SILVER',	'RESOURCE_IRON',	6),
		('CIVILIZATION_AUSTRIA',	'RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_BYZANTIUM',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_CARTHAGE',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_CELTS',		'RESOURCE_DEER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_ETHIOPIA',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_HUNS',		'RESOURCE_FUR',		'RESOURCE_HORSE',	4),
		('CIVILIZATION_NETHERLANDS','RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_SWEDEN',		'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_PORTUGAL',	'RESOURCE_SILVER',	'RESOURCE_FISH',	0),
		('CIVILIZATION_POLAND',		'RESOURCE_FUR',		'RESOURCE_HORSE',	2),
		('CIVILIZATION_VENICE',		'RESOURCE_SHEEP',	'RESOURCE_GOLD',	0),
		('CIVILIZATION_MOROCCO',	'RESOURCE_SILVER',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AdriaticRequestedResource (Adriatic Sea/Balkans)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AdriaticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AdriaticRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_VENICE',		'RESOURCE_SHEEP',	'RESOURCE_GOLD',	0),
		('CIVILIZATION_GREECE',		'RESOURCE_FISH',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WestAfricaRequestedResource (West Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_WestAfricaRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_CARTHAGE',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_SONGHAI',	'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_MOROCCO',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaucasusRequestedResource (Caucasus)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaucasusRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaucasusRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_OTTOMAN',	'RESOURCE_MARBLE',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_BYZANTIUM',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_GREECE',		'RESOURCE_FISH',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSteppeGiantRequestedResource (Mongol Steppe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSteppeGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaSteppeGiantRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_CHINA',		'RESOURCE_SILK',	'RESOURCE_JADE',	0),
		('CIVILIZATION_MONGOL',		NULL,				'RESOURCE_HORSE',	6);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAsiaRequestedResource (Central Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CentralAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CentralAsiaRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_PERSIA',		NULL,				'RESOURCE_OIL',		6),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroEasternRequestedResource (Eastern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroEasternRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_SWEDEN',		'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_POLAND',		'RESOURCE_FUR',		'RESOURCE_HORSE',	2),
		('CIVILIZATION_AUSTRIA',	'RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_RUSSIA',		'RESOURCE_FUR',		'RESOURCE_URANIUM',	2),
		('CIVILIZATION_HUNS',		'RESOURCE_FUR',		'RESOURCE_HORSE',	4);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaEuropeRequestedResource (North Sea)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthSeaEuropeRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_DENMARK',	'RESOURCE_SILVER',	'RESOURCE_IRON',	6),
		('CIVILIZATION_ENGLAND',	'RESOURCE_SILVER',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_NETHERLANDS','RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_CELTS',		'RESOURCE_DEER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_GERMANY',	'RESOURCE_FUR',		'RESOURCE_IRON',	2),
		('CIVILIZATION_SWEDEN',		'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_POLAND',		'RESOURCE_FUR',		'RESOURCE_HORSE',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriAsiaAustRequestedResource (Africa, Asia & Australia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_ARABIA',		'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_EGYPT',		'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_CHINA',		'RESOURCE_SILK',	NULL,				0),
		('CIVILIZATION_ENGLAND',	'RESOURCE_SILVER',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_FRANCE',		'RESOURCE_WINE',	'RESOURCE_IRON',	2),
		('CIVILIZATION_GERMANY',	'RESOURCE_FUR',		'RESOURCE_IRON',	2),
		('CIVILIZATION_GREECE',		'RESOURCE_FISH',	'RESOURCE_IRON',	2),
		('CIVILIZATION_INDIA',		'RESOURCE_IVORY',	'RESOURCE_MARBLE',	0),
		('CIVILIZATION_JAPAN',		'RESOURCE_WHALE',	'RESOURCE_IRON',	2),
		('CIVILIZATION_OTTOMAN',	'RESOURCE_MARBLE',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_PERSIA',		NULL,				'RESOURCE_OIL',		6),
		('CIVILIZATION_ROME',		'RESOURCE_MARBLE',	'RESOURCE_WINE',	0),
		('CIVILIZATION_RUSSIA',		'RESOURCE_FUR',		'RESOURCE_URANIUM',	2),
		('CIVILIZATION_SIAM',		'RESOURCE_IVORY',	'RESOURCE_COCOA',	0),
		('CIVILIZATION_SONGHAI',	'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0),
		('CIVILIZATION_MONGOL',		NULL,				'RESOURCE_HORSE',	6),
		('CIVILIZATION_SPAIN',		NULL,				'RESOURCE_HORSE',	4),
		('CIVILIZATION_DENMARK',	'RESOURCE_SILVER',	'RESOURCE_IRON',	6),
		('CIVILIZATION_KOREA',		'RESOURCE_SILK',	'RESOURCE_HORSE',	4),
		('CIVILIZATION_AUSTRIA',	'RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_BYZANTIUM',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_CARTHAGE',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_CELTS',		'RESOURCE_DEER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_ETHIOPIA',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_HUNS',		'RESOURCE_FUR',		'RESOURCE_HORSE',	4),
		('CIVILIZATION_NETHERLANDS','RESOURCE_COW',		'RESOURCE_IRON',	4),
		('CIVILIZATION_SWEDEN',		'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_PORTUGAL',	'RESOURCE_SILVER',	'RESOURCE_FISH',	0),
		('CIVILIZATION_ZULU',		'RESOURCE_IVORY',	'RESOURCE_IRON',	2),
		('CIVILIZATION_POLAND',		'RESOURCE_FUR',		'RESOURCE_HORSE',	2),
		('CIVILIZATION_ASSYRIA',	'RESOURCE_WHEAT',	'RESOURCE_SILVER',	0),
		('CIVILIZATION_VENICE',		'RESOURCE_SHEEP',	'RESOURCE_GOLD',	0),
		('CIVILIZATION_INDONESIA',	'RESOURCE_SPICES',	'RESOURCE_PEARLS',	2),
		('CIVILIZATION_MOROCCO',	'RESOURCE_SILVER',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriSouthEuroRequestedResource (Africa & Southern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_ARABIA',		'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_EGYPT',		'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_GREECE',		'RESOURCE_FISH',	'RESOURCE_IRON',	2),
		('CIVILIZATION_OTTOMAN',	'RESOURCE_MARBLE',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_PERSIA',		NULL,				'RESOURCE_OIL',		6),
		('CIVILIZATION_ROME',		'RESOURCE_MARBLE',	'RESOURCE_WINE',	0),
		('CIVILIZATION_SONGHAI',	'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0),
		('CIVILIZATION_SPAIN',		NULL,				'RESOURCE_HORSE',	4),
		('CIVILIZATION_BYZANTIUM',	'RESOURCE_FUR',		'RESOURCE_IRON',	4),
		('CIVILIZATION_CARTHAGE',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_ETHIOPIA',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_PORTUGAL',	'RESOURCE_SILVER',	'RESOURCE_FISH',	0),
		('CIVILIZATION_ZULU',		'RESOURCE_IVORY',	'RESOURCE_IRON',	2),
		('CIVILIZATION_ASSYRIA',	'RESOURCE_WHEAT',	'RESOURCE_SILVER',	0),
		('CIVILIZATION_VENICE',		'RESOURCE_SHEEP',	'RESOURCE_GOLD',	0),
		('CIVILIZATION_MOROCCO',	'RESOURCE_SILVER',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriGiantRequestedResource (Africa Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriGiantRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_ARABIA',		'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_EGYPT',		'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_SONGHAI',	'RESOURCE_GOLD',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_BABYLON',	'RESOURCE_WHEAT',	NULL,				0),
		('CIVILIZATION_CARTHAGE',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_ETHIOPIA',	'RESOURCE_SILVER',	'RESOURCE_IRON',	4),
		('CIVILIZATION_ZULU',		'RESOURCE_IVORY',	'RESOURCE_IRON',	2),
		('CIVILIZATION_ASSYRIA',	'RESOURCE_WHEAT',	'RESOURCE_SILVER',	0),
		('CIVILIZATION_MOROCCO',	'RESOURCE_SILVER',	'RESOURCE_IRON',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaGiantRequestedResource (South America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaGiantRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_BRAZIL',		'RESOURCE_SILVER',	'RESOURCE_IRON',	2),
		('CIVILIZATION_INCA',		'RESOURCE_SHEEP',	'RESOURCE_GOLD',	0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustralasiaGiantRequestedResource (Australia & South East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AustralasiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AustralasiaGiantRequestedResource
		(Type,							Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_INDONESIA',		'RESOURCE_SPICES',	'RESOURCE_PEARLS',	0),
		('CIVILIZATION_SIAM',			'RESOURCE_IVORY',	'RESOURCE_COCOA',	0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndianOceanRequestedResource (Indian Ocean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndianOceanRequestedResource
		(Type,							Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_INDONESIA',		'RESOURCE_SPICES',	'RESOURCE_PEARLS',	0),
		('CIVILIZATION_SIAM',			'RESOURCE_IVORY',	'RESOURCE_COCOA',	0),
		('CIVILIZATION_INDIA',			'RESOURCE_IVORY',	'RESOURCE_MARBLE',	0),
		('CIVILIZATION_PERSIA',			NULL,				'RESOURCE_OIL',		6),
		('CIVILIZATION_ARABIA',			'RESOURCE_SHEEP',	'RESOURCE_HORSE',	2),
		('CIVILIZATION_ETHIOPIA',		'RESOURCE_SILVER',	'RESOURCE_IRON',	4);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasGiantRequestedResource (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL,				0),
		('CIVILIZATION_BRAZIL',			'RESOURCE_SILVER',			'RESOURCE_IRON',	NULL,				0),
		('CIVILIZATION_INCA',			'RESOURCE_SHEEP',			'RESOURCE_GOLD',	NULL,				0),
		('CIVILIZATION_AMERICA',		'RESOURCE_GOLD',			'RESOURCE_COW',		NULL,				0),
		('CIVILIZATION_SHOSHONE',		'RESOURCE_GOLD',			'RESOURCE_BISON',	'RESOURCE_FUR',		0),
		('CIVILIZATION_MAYA',			'RESOURCE_SILVER',			'RESOURCE_DEER',	'RESOURCE_COW',		0),
		('CIVILIZATION_IROQUOIS',		'RESOURCE_PEARLS',			'RESOURCE_FUR',		'RESOURCE_FISH',	0),
		('CIVILIZATION_ENGLAND',		'RESOURCE_FISH',			'RESOURCE_PEARLS',	'RESOURCE_SUGAR',	0),
		('CIVILIZATION_NETHERLANDS',	'RESOURCE_PEARLS',			'RESOURCE_CRAB',	'RESOURCE_COCOA',	0),
		('CIVILIZATION_FRANCE',			'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_COTTON',	0),
		('CIVILIZATION_SPAIN',			'RESOURCE_SUGAR',			'RESOURCE_FISH',	'RESOURCE_CRAB',	0),
		('CIVILIZATION_PORTUGAL',		'RESOURCE_SILVER',			'RESOURCE_FISH',	NULL,				0),
		('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',			'RESOURCE_WHALE',	NULL,				0),
		('CIVILIZATION_DENMARK',		'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_SUGAR',	0),
		('CIVILIZATION_SWEDEN',			'RESOURCE_FISH',			'RESOURCE_CRAB',	'RESOURCE_TOBACCO',	0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaGiantRequestedResource (India Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndiaGiantRequestedResource
		(Type,							Req1,					Req2,				Yield2)
VALUES	('CIVILIZATION_INDIA',			'RESOURCE_IVORY',		'RESOURCE_MARBLE',	0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralHugeRequestedResource (South & Central America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralHugeRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_BRAZIL',			'RESOURCE_SILVER',			'RESOURCE_IRON',	NULL,				0),
		('CIVILIZATION_INCA',			'RESOURCE_SHEEP',			'RESOURCE_GOLD',	NULL,				0),
		('CIVILIZATION_MAYA',			'RESOURCE_SILVER',			'RESOURCE_DEER',	'RESOURCE_COW',		0),
		('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralGiantRequestedResource (South & Central America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_BRAZIL',			'RESOURCE_SILVER',			'RESOURCE_IRON',	NULL,				0),
		('CIVILIZATION_INCA',			'RESOURCE_SHEEP',			'RESOURCE_GOLD',	NULL,				0),
		('CIVILIZATION_MAYA',			'RESOURCE_SILVER',			'RESOURCE_DEER',	'RESOURCE_COW',		0),
		('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ScotlandIrelandHugeRequestedResource (Scotland & Ireland Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ScotlandIrelandHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ScotlandIrelandHugeRequestedResource
		(Type,						Req1,				Req2,				Yield2)
VALUES	('CIVILIZATION_CELTS',		'RESOURCE_DEER',	'RESOURCE_IRON',	4);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaLargeRequestedResource (South America Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaLargeRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_BRAZIL',			'RESOURCE_SILVER',			'RESOURCE_IRON',	NULL,				0),
		('CIVILIZATION_INCA',			'RESOURCE_SHEEP',			'RESOURCE_GOLD',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAsiaHugeRequestedResource (South Asia Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAsiaHugeRequestedResource
		(Type,							Req1,					Req2,				Yield2)
VALUES	('CIVILIZATION_INDIA',			'RESOURCE_IVORY',		'RESOURCE_MARBLE',	0),
		('CIVILIZATION_SIAM',			'RESOURCE_IVORY',		'RESOURCE_COCOA',	0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificGiantRequestedResource (South Pacific Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthPacificGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',			'RESOURCE_WHALE',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaGiantRequestedResource (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaGiantRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',			'RESOURCE_WHALE',	NULL,				0),
		('CIVILIZATION_AMERICA',		'RESOURCE_GOLD',			'RESOURCE_COW',		NULL,				0),
		('CIVILIZATION_IROQUOIS',		'RESOURCE_PEARLS',			'RESOURCE_FUR',		'RESOURCE_FISH',	0),
		('CIVILIZATION_SHOSHONE',		'RESOURCE_GOLD',			'RESOURCE_BISON',	'RESOURCE_FUR',		0),
		('CIVILIZATION_MAYA',			'RESOURCE_SILVER',			'RESOURCE_DEER',	'RESOURCE_COW',		0),
		('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL,				0);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaHugeRequestedResource (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaHugeRequestedResource
		(Type,							Req1,						Req2,				Req3,				Yield3)
VALUES	('CIVILIZATION_POLYNESIA',		'RESOURCE_FISH',			'RESOURCE_WHALE',	NULL,				0),
		('CIVILIZATION_AMERICA',		'RESOURCE_GOLD',			'RESOURCE_COW',		NULL,				0),
		('CIVILIZATION_IROQUOIS',		'RESOURCE_PEARLS',			'RESOURCE_FUR',		'RESOURCE_FISH',	0),
		('CIVILIZATION_SHOSHONE',		'RESOURCE_GOLD',			'RESOURCE_BISON',	'RESOURCE_FUR',		0),
		('CIVILIZATION_MAYA',			'RESOURCE_SILVER',			'RESOURCE_DEER',	'RESOURCE_COW',		0),
		('CIVILIZATION_AZTEC',			'RESOURCE_JFD_OBSIDIAN',	'RESOURCE_STONE',	NULL,				0);
--==========================================================================================================================
--==========================================================================================================================