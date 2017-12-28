--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_AegeanStartPosition (Aegean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AegeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AegeanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BYZANTIUM',				34,		43,		NULL,	NULL),
		('CIVILIZATION_GREECE',					13,		21,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				49,		35,		34,		43);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfricaStartPosition (Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				26,		69,		NULL,	NULL),
		('CIVILIZATION_EGYPT',					42,		64,		NULL,	NULL),
		('CIVILIZATION_ETHIOPIA',				52,		44,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				13,		67,		NULL,	NULL),
		('CIVILIZATION_SONGHAI',				19,		53,		NULL,	NULL),
		('CIVILIZATION_ZULU',					45,		12,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasStartPosition (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				8,		45,		NULL,	NULL),
		('CIVILIZATION_BRAZIL',					58,		22,		NULL,	NULL),
		('CIVILIZATION_INCA',					46,		29,		NULL,	NULL),
		('CIVILIZATION_AMERICA',				46,		54,		NULL,	NULL),
		('CIVILIZATION_SHOSHONE',				34,		59,		NULL,	NULL),
		('CIVILIZATION_IROQUOIS',				45,		60,		NULL,	NULL),
		('CIVILIZATION_MAYA',					40,		42,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					35,		45,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				48,		57,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					51,		61,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			51,		37,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					20,		66,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					46,		56,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				59,		26,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					48,		43,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				50,		43,		NULL,	NULL),
		--Patria Grande
		('CIVILIZATION_ARGENTINA',				53,		15,		NULL,	NULL),
		('CIVILIZATION_CHILE',					48,		16,		NULL,	NULL),
		('CIVILIZATION_CUBA',					45,		44,		NULL,	NULL),
		('CIVILIZATION_GRAN_COLOMBIA',			50,		22,		NULL,	NULL),
		('CIVILIZATION_HAITI',					48,		43,		NULL,	NULL),
		('CIVILIZATION_MAPUCHE',				47,		13,		NULL,	NULL),
		('CIVILIZATION_MUISCA',					49,		34,		NULL,	NULL),
		('CIVILIZATION_PARAGUAY',				54,		22,		NULL,	NULL),
		('CIVILIZATION_PERU',					45,		27,		NULL,	NULL),
		('CIVILIZATION_TUPI',					54,		29,		NULL,	NULL),
		('CIVILIZATION_TIWANAKU',				48,		23,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ApennineStartPosition (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_ApennineStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				19,		7,		NULL,	NULL),
		('CIVILIZATION_ROME',					29,		33,		NULL,	NULL),
		('CIVILIZATION_VENICE',					29,		54,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaStartPosition (Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					25,		35,		NULL,	NULL),
		('CIVILIZATION_CHINA',					67,		55,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					91,		50,		NULL,	NULL),
		('CIVILIZATION_MONGOL',					53,		55,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					8,		40,		NULL,	NULL),
		('CIVILIZATION_INDONESIA',				55,		0,		NULL,	NULL),
		('CIVILIZATION_KOREA',					79,		54,		NULL,	NULL),
		('CIVILIZATION_SIAM',					57,		19,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_BritishIslesStartPosition (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					32,		51,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				61,		46,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				44,		16,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanStartPosition (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_MAYA',					24,		30,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					6,		37,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			92,		3,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					44,		55,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				54,		32,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					66,		36,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				80,		33,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					86,		30,		NULL,	NULL),
		--Patria Grande
		('CIVILIZATION_CUBA',					44,		36,		NULL,	NULL),
		('CIVILIZATION_GRAN_COLOMBIA',			60,		11,		NULL,	NULL),
		('CIVILIZATION_HAITI',					65,		35,		NULL,	NULL);
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MediterraneanStartPosition (Mediterranean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ROME',					43,		42,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					10,		40,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				1,		40,		NULL,	NULL),
		('CIVILIZATION_GREECE',					64,		30,		NULL,	NULL),
		('CIVILIZATION_CARTHAGE',				38,		26,		NULL,	NULL),
		('CIVILIZATION_AUSTRIA',				47,		58,		NULL,	NULL),
		('CIVILIZATION_VENICE',					42,		51,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				99,		29,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					29,		63,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				2,		22,		NULL,	NULL),
		('CIVILIZATION_EGYPT',					83,		7,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				72,		41,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				80,		37,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BYZANTIUM',				12,		39,		NULL,	NULL),
		('CIVILIZATION_GREECE',					7,		22,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				22,		38,		NULL,	NULL),
		('CIVILIZATION_ARABIA',					45,		0,		NULL,	NULL),
		('CIVILIZATION_EGYPT',					26,		6,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					79,		25,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				45,		38,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				51,		26,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NileValleyStartPosition (Nile Valley)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					26,		62,		NULL,	NULL),
		('CIVILIZATION_ARABIA',					78,		32,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AMERICA',				11,		34,		NULL,	NULL),
		('CIVILIZATION_IROQUOIS',				13,		40,		NULL,	NULL),
		('CIVILIZATION_GERMANY',				92,		37,		NULL,	NULL),
		('CIVILIZATION_AUSTRIA',				95,		33,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					103,	46,		NULL,	NULL),
		('CIVILIZATION_POLAND',					97,		43,		NULL,	NULL),
		('CIVILIZATION_CELTS',					79,		35,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				83,		31,		NULL,	NULL),
		('CIVILIZATION_VENICE',					96,		26,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				85,		0,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				89,		42,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					88,		51,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					88,		26,		NULL,	NULL),
		('CIVILIZATION_CARTHAGE',				99,		11,		NULL,	NULL),
		('CIVILIZATION_ROME',					98,		21,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			86,		34,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					85,		9,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				80,		5,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					6,		40,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					45,		27,		NULL,	NULL),
		('CIVILIZATION_KOREA',					23,		35,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ENGLAND',				18,		18,		NULL,	NULL),
		('CIVILIZATION_CELTS',					16,		28,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				36,		29,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					43,		43,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					20,		8,		NULL,	NULL),
		('CIVILIZATION_GERMANY',				41,		19,		NULL,	NULL),
		('CIVILIZATION_POLAND',					46,		21,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					56,		27,		NULL,	NULL),
		('CIVILIZATION_AUSTRIA',				45,		6,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			25,		18,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PacificStartPosition (Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_SHOSHONE',				111,	59,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					43,		56,		NULL,	NULL),
		('CIVILIZATION_CHINA',					33,		59,		NULL,	NULL),
		('CIVILIZATION_POLYNESIA',				79,		44,		NULL,	NULL),
		('CIVILIZATION_KOREA',					39,		59,		NULL,	NULL),
		('CIVILIZATION_INDIA',					7,		49,		NULL,	NULL),
		('CIVILIZATION_INDONESIA',				27,		24,		NULL,	NULL),
		('CIVILIZATION_SIAM',					23,		44,		NULL,	NULL),
		('CIVILIZATION_MONGOL',					22,		64,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EastAsiaStartPosition (South-East Asia Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_EastAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					40,		66,		NULL,	NULL),
		('CIVILIZATION_INDIA',					12,		46,		NULL,	NULL),
		('CIVILIZATION_INDONESIA',				30,		12,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					59,		61,		NULL,	NULL),
		('CIVILIZATION_KOREA',					49,		63,		NULL,	NULL),
		('CIVILIZATION_MONGOL',					31,		70,		NULL,	NULL),
		('CIVILIZATION_SIAM',					22,		40,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificStartPosition (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				49,		88,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaGiantStartPosition (Giant Levant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					42,		34,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				114,	53,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				110,	63,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				19,		91,		20,		91),
		('CIVILIZATION_OTTOMAN',				45,		88,		NULL,	NULL),
		('CIVILIZATION_ARABIA',					88,		3,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSmallStartPosition (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSmallStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSmallStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					28,		40,		NULL,	NULL),
		('CIVILIZATION_KOREA',					39,		34,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					46,		31,		NULL,	NULL),
		('CIVILIZATION_SIAM',					7,		8,		NULL,	NULL),
		('CIVILIZATION_MONGOL',					11,		44,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroLargeNewStartPosition (Europe (Greatest) Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					62,		1,		NULL,	NULL),
		--('CIVILIZATION_ARABIA',				?,		?,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				24,		47,		NULL,	NULL),
		('CIVILIZATION_FRANCE',					26,		39,		NULL,	NULL),
		('CIVILIZATION_GERMANY',				39,		47,		NULL,	NULL),
		('CIVILIZATION_GREECE',					54,		14,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				66,		22,		NULL,	NULL),
		('CIVILIZATION_ROME',					39,		23,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					70,		56,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				80,		8,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					17,		22,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				39,		54,		NULL,	NULL),
		('CIVILIZATION_AUSTRIA',				43,		36,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				58,		23,		NULL,	NULL),
		('CIVILIZATION_CARTHAGE',				35,		12,		NULL,	NULL),
		('CIVILIZATION_CELTS',					21,		56,		NULL,	NULL),
		('CIVILIZATION_HUNS',					82,		43,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			30,		47,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					46,		65,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				9,		19,		NULL,	NULL),
		('CIVILIZATION_VENICE',					40,		30,		NULL,	NULL),
		('CIVILIZATION_POLAND',					48,		47,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				76,		17,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				10,		5,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					84,		12,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AdriaticStartPosition (Adriatic Sea/Balkans)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AdriaticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AdriaticStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_GREECE',					110,	58,		NULL,	NULL),
		('CIVILIZATION_VENICE',					7,		7,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WestAfricaStartPosition (West Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_WestAfricaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				72,		77,		NULL,	NULL),
		('CIVILIZATION_SONGHAI',				55,		29,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				26,		60,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaucasusStartPosition (Caucasus)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaucasusStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaucasusStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_OTTOMAN',				58,		31,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				44,		39,		NULL,	NULL),
		('CIVILIZATION_GREECE',					18,		18,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSteppeGiantStartPosition (Mongol Steppe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSteppeGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSteppeGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					156,	20,		NULL,	NULL),
		('CIVILIZATION_MONGOL',					126,	42,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAsiaStartPosition (Central Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CentralAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CentralAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_PERSIA',					27,		32,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				1,		37,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroEasternStartPosition (Eastern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroEasternStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_SWEDEN',					16,		70,		NULL,	NULL),
		('CIVILIZATION_POLAND',					22,		35,		NULL,	NULL),
		('CIVILIZATION_AUSTRIA',				10,		20,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					79,		53,		NULL,	NULL),
		('CIVILIZATION_HUNS',					25,		19,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaEuropeStartPosition (North Sea)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthSeaEuropeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_DENMARK',				87,		39,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				39,		14,		NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			58,		19,		NULL,	NULL),
		('CIVILIZATION_CELTS',					29,		42,		NULL,	NULL),
		('CIVILIZATION_GERMANY',				89,		22,		NULL,	NULL),
		('CIVILIZATION_SWEDEN',					110,	68,		NULL,	NULL),
		('CIVILIZATION_POLAND',					115,	10,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Australia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					48,		57,		NULL,	NULL),
		('CIVILIZATION_EGYPT',					41,		63,		NULL,	NULL),
		('CIVILIZATION_CHINA',					106,	77,		NULL,	NULL),
		('CIVILIZATION_GREECE',					36,		70,		NULL,	NULL),
		('CIVILIZATION_INDIA',					77,		61,		NULL,	NULL),
		('CIVILIZATION_JAPAN',					122,	77,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				44,		73,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					64,		63,		NULL,	NULL),
		('CIVILIZATION_ROME',					29,		76,		NULL,	NULL),
		('CIVILIZATION_SIAM',					93,		50,		NULL,	NULL),
		('CIVILIZATION_SONGHAI',				18,		49,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				57,		65,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					15,		73,		NULL,	NULL),
		('CIVILIZATION_KOREA',					114,	76,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				40,		74,		39,		74),
		('CIVILIZATION_CARTHAGE',				25,		69,		NULL,	NULL),
		('CIVILIZATION_ETHIOPIA',				47,		43,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				12,		72,		NULL,	NULL),
		('CIVILIZATION_ZULU',					40,		11,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				55,		69,		NULL,	NULL),
		('CIVILIZATION_INDONESIA',				97,		31,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				13,		65,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriSouthEuroStartPosition (Africa & Southern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					57,		48,		NULL,	NULL),
		('CIVILIZATION_EGYPT',					49,		57,		NULL,	NULL),
		('CIVILIZATION_GREECE',					46,		55,		NULL,	NULL),
		('CIVILIZATION_OTTOMAN',				56,		70,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					70,		59,		NULL,	NULL),
		('CIVILIZATION_ROME',					35,		70,		NULL,	NULL),
		('CIVILIZATION_SONGHAI',				27,		45,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				63,		58,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					18,		68,		NULL,	NULL),
		('CIVILIZATION_BYZANTIUM',				51,		71,		51,		72),
		('CIVILIZATION_CARTHAGE',				33,		62,		NULL,	NULL),
		('CIVILIZATION_ETHIOPIA',				56,		37,		NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				12,		66,		NULL,	NULL),
		('CIVILIZATION_ZULU',					47,		7,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				63,		64,		NULL,	NULL),
		('CIVILIZATION_VENICE',					37,		76,		NULL,	NULL),
		('CIVILIZATION_MOROCCO',				17,		56,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriGiantStartPosition (Africa Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					105,	108,	NULL,	NULL),
		('CIVILIZATION_EGYPT',					90,		123,	NULL,	NULL),
		('CIVILIZATION_SONGHAI',				34,		99,		NULL,	NULL),
		('CIVILIZATION_BABYLON',				117,	130,	NULL,	NULL),
		('CIVILIZATION_CARTHAGE',				61,		135,	NULL,	NULL),
		('CIVILIZATION_ETHIOPIA',				105,	85,		NULL,	NULL),
		('CIVILIZATION_ZULU',					88,		14,		NULL,	NULL),
		('CIVILIZATION_ASSYRIA',				113,	135,	NULL,	NULL),
		('CIVILIZATION_MOROCCO',				31,		128,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaGiantStartPosition (South America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INCA',					44,		91,		NULL,	NULL),
		('CIVILIZATION_BRAZIL',					98,		71,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustralasiaGiantStartPosition (Australia & South East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AustralasiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AustralasiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDONESIA',				19,		77,		NULL,	NULL),
		('CIVILIZATION_SIAM',					7,		130,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndianOceanStartPosition (Indian Ocean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndianOceanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDONESIA',				76,		31,		NULL,	NULL),
		('CIVILIZATION_SIAM',					70,		56,		NULL,	NULL),
		('CIVILIZATION_INDIA',					48,		69,		NULL,	NULL),
		('CIVILIZATION_PERSIA',					25,		70,		NULL,	NULL),
		('CIVILIZATION_ARABIA',					12,		62,		NULL,	NULL),
		('CIVILIZATION_ETHIOPIA',				9,		47,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasGiantStartPosition (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				4,		98,		NULL,	NULL),
		('CIVILIZATION_BRAZIL',					114,	40,		NULL,	NULL),
		('CIVILIZATION_INCA',					79,		58,		NULL,	NULL),
		('CIVILIZATION_AMERICA',				68,		117,	NULL,	NULL),
		('CIVILIZATION_SHOSHONE',				31,		135,	NULL,	NULL),
		('CIVILIZATION_IROQUOIS',				62,		131,	NULL,	NULL),
		('CIVILIZATION_MAYA',					57,		94,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					46,		95,		NULL,	NULL),
		('CIVILIZATION_ENGLAND',				63,		125,	NULL,	NULL),
		('CIVILIZATION_FRANCE',					78,		135,	NULL,	NULL),
		('CIVILIZATION_NETHERLANDS',			92,		82,		NULL,	NULL),
		('CIVILIZATION_RUSSIA',					5,		141,	NULL,	NULL),
		('CIVILIZATION_SWEDEN',					71,		120,	NULL,	NULL),
		('CIVILIZATION_PORTUGAL',				122,	54,		NULL,	NULL),
		('CIVILIZATION_SPAIN',					73,		98,		NULL,	NULL),
		('CIVILIZATION_DENMARK',				89,		92,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaGiantStartPosition (India Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					43,		95,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralHugeStartPosition (South & Central America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					83,		45,		NULL,	NULL),
		('CIVILIZATION_INCA',					48,		58,		NULL,	NULL),
		('CIVILIZATION_MAYA',					23,		96,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					17,		99,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralGiantStartPosition (South & Central America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					109,	60,		NULL,	NULL),
		('CIVILIZATION_INCA',					64,		78,		NULL,	NULL),
		('CIVILIZATION_MAYA',					30,		128,	NULL,	NULL),
		('CIVILIZATION_AZTEC',					21,		130,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ScotlandIrelandHugeStartPosition (Scotland & Ireland Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ScotlandIrelandHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ScotlandIrelandHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					80,		12,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaLargeStartPosition (South America Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					68,		43,		NULL,	NULL),
		('CIVILIZATION_INCA',					34,		55,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAsiaHugeStartPosition (South Asia Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAsiaHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					32,		65,		NULL,	NULL),
		('CIVILIZATION_SIAM',					95,		49,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificGiantStartPosition (South Pacific Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				111,	85,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaGiantStartPosition (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				11,		29,		NULL,	NULL),
		('CIVILIZATION_AMERICA',				95,		51,		NULL,	NULL),
		('CIVILIZATION_IROQUOIS',				95,		60,		NULL,	NULL),
		('CIVILIZATION_SHOSHONE',				51,		62,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					69,		22,		NULL,	NULL),
		('CIVILIZATION_MAYA',					78,		20,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaHugeStartPosition (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				14,		25,		NULL,	NULL),
		('CIVILIZATION_AMERICA',				91,		39,		NULL,	NULL),
		('CIVILIZATION_IROQUOIS',				93,		47,		NULL,	NULL),
		('CIVILIZATION_SHOSHONE',				46,		44,		NULL,	NULL),
		('CIVILIZATION_AZTEC',					65,		9,		NULL,	NULL),
		('CIVILIZATION_MAYA',					74,		6,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EarthStandardStartPosition (Earth Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthStandardStartPosition(Type, X, Y, AltX, AltY);
		
--==========================================================================================================================
--==========================================================================================================================