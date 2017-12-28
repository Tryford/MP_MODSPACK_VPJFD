--==========================================================================================================================
--==========================================================================================================================
-- MinorCiv_AegeanStartPosition (Aegean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AegeanStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_ApennineStartPosition (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_ApennineStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_FLORENCE',			25,		45,		NULL,	NULL),
		('MINOR_CIV_GENOA',				17,		50,		NULL,	NULL),
		('MINOR_CIV_MILAN',				16,		63,		NULL,	NULL),
		('MINOR_CIV_RAGUSA',			16,		63,		NULL,	NULL),
		('MINOR_CIV_VALETTA',			35,		2,		NULL,	NULL),
		('MINOR_CIV_VATICAN_CITY',		29,		33,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfricaLargeStartPosition (Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfricaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_IFE',				22,		46,		NULL,	NULL),
		('MINOR_CIV_MBANZA_KONGO',		30,		28,		NULL,	NULL),
		('MINOR_CIV_ZANZIBAR',			53,		30,		NULL,	NULL),
		('MINOR_CIV_MARRAKECH',			13,		67,		NULL,	NULL),
		('MINOR_CIV_ANTANANARIVO',		56,		17,		NULL,	NULL),
		('MINOR_CIV_MOMBASA',			52,		33,		NULL,	NULL),
		('MINOR_CIV_MOGADISHU',			57,		40,		NULL,	NULL),
		('MINOR_CIV_CAPE_TOWN',			32,		3,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AmericasStartPosition (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AmericasStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUENOS_AIRES',		53,		15,		NULL,	NULL),
		('MINOR_CIV_QUEBEC',			50,		60,		NULL,	NULL),
		('MINOR_CIV_VANCOUVER',			29,		61,		NULL,	NULL),
		('MINOR_CIV_CAHOKIA',			40,		54,		NULL,	NULL),
		('MINOR_CIV_LA_VENTA',			41,		41,		NULL,	NULL),
		('MINOR_CIV_PANAMA_CITY',		42,		39,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaStartPosition (Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_HONG_KONG',			68,		31,		NULL,	NULL),
		('MINOR_CIV_HANOI',				59,		30,		NULL,	NULL),
		('MINOR_CIV_MANILA',			79,		20,		NULL,	NULL),
		('MINOR_CIV_KABUL',				20,		43,		NULL,	NULL),
		('MINOR_CIV_SAMARKAND',			17,		49,		NULL,	NULL),
		('MINOR_CIV_ALMATY',			24,		43,		NULL,	NULL),
		('MINOR_CIV_LHASA',				38,		42,		NULL,	NULL),
		('MINOR_CIV_KATHMANDU',			34,		38,		NULL,	NULL),
		('MINOR_CIV_SINGAPORE',			58,		1,		NULL,	NULL),
		('MINOR_CIV_MALACCA',			56,		3,		NULL,	NULL),
		('MINOR_CIV_KUALA_LUMPUR',		55,		5,		NULL,	NULL),
		('MINOR_CIV_KYZYL',				33,		60,		NULL,	NULL),
		('MINOR_CIV_ORMUS',				3,		33,		NULL,	NULL),
		('MINOR_CIV_COLOMBO',			31,		10,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_BritishIslesStartPosition (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CaribbeanStartPosition (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CaribbeanStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_LA_VENTA',			32,		23,		NULL,	NULL),
		('MINOR_CIV_PANAMA_CITY',		48,		5,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EastAsiaStartPosition (East Asia Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EastAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_COLOMBO',			3,		26,		NULL,	NULL),
		('MINOR_CIV_KUALA_LUMPUR',		24,		24,		NULL,	NULL),
		('MINOR_CIV_HANOI',				28,		42,		NULL,	NULL),
		('MINOR_CIV_HONG_KONG',			36,		43,		NULL,	NULL),
		('MINOR_CIV_KATHMANDU',			9,		53,		NULL,	NULL),
		('MINOR_CIV_LHASA',				15,		50,		NULL,	NULL),
		('MINOR_CIV_MALACCA',			25,		22,		NULL,	NULL),
		('MINOR_CIV_MANILA',			44,		36,		NULL,	NULL),
		('MINOR_CIV_SINGAPORE',			26,		20,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MediterraneanStartPosition (Mediterranean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_VATICAN_CITY',		43,		42,		NULL,	NULL),
		('MINOR_CIV_ZURICH',			36,		56,		NULL,	NULL),
		('MINOR_CIV_GENEVA',			32,		52,		NULL,	NULL),
		('MINOR_CIV_FLORENCE',			40,		51,		NULL,	NULL),
		('MINOR_CIV_GENOA',				36,		50,		NULL,	NULL),
		('MINOR_CIV_MONACO',			31,		47,		NULL,	NULL),
		('MINOR_CIV_RAGUSA',			47,		49,		NULL,	NULL),
		('MINOR_CIV_VALETTA',			49,		24,		NULL,	NULL),
		('MINOR_CIV_BUCHAREST',			72,		52,		NULL,	NULL),
		('MINOR_CIV_BELGRADE',			61,		46,		NULL,	NULL),
		('MINOR_CIV_MILAN',				35,		52,		NULL,	NULL),
		('MINOR_CIV_BUDAPEST',			54,		56,		NULL,	NULL),
		('MINOR_CIV_BRATISLAVA',		55,		60,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			47,		62,		NULL,	NULL),
		('MINOR_CIV_SOFIA',				66,		44,		NULL,	NULL),
		('MINOR_CIV_BYBLOS',			91,		28,		NULL,	NULL),
		('MINOR_CIV_SIDON',				90,		25,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			91,		17,		NULL,	NULL),
		('MINOR_CIV_TYRE',				90,		19,		NULL,	NULL),
		('MINOR_CIV_YEREVAN',			100,	44,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MesopotamiaStartPosition (Mesopotamia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MesopotamiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SOFIA',				0,		45,		NULL,	NULL),
		('MINOR_CIV_BYBLOS',			31,		33,		NULL,	NULL),
		('MINOR_CIV_SIDON',				32,		28,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			35,		16,		NULL,	NULL),
		('MINOR_CIV_TYRE',				32,		22,		NULL,	NULL),
		('MINOR_CIV_YEREVAN',			35,		46,		NULL,	NULL),
		('MINOR_CIV_UR',				56,		23,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NileValleyStartPosition (Nile Valley)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NileValleyStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAtlanticStartPosition (North Atlantic)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAtlanticStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RIGA',				53,		36,		NULL,	NULL),
		('MINOR_CIV_VALETTA',			103,	13,		NULL,	NULL),
		('MINOR_CIV_ANTWERP',			87,		33,		NULL,	NULL),
		('MINOR_CIV_RAGUSA',			99,		27,		NULL,	NULL),
		('MINOR_CIV_SOFIA',				105,	31,		NULL,	NULL),
		('MINOR_CIV_BRUSSELS',			89,		32,		NULL,	NULL),
		('MINOR_CIV_ZURICH',			92,		29,		NULL,	NULL),
		('MINOR_CIV_BRATISLAVA',		98,		35,		NULL,	NULL),
		('MINOR_CIV_QUEBEC',			22,		45,		NULL,	NULL),
		('MINOR_CIV_CAHOKIA',			4,		38,		NULL,	NULL),
		('MINOR_CIV_BUDAPEST',			99,		33,		NULL,	NULL),
		('MINOR_CIV_WITTENBERG',		94,		37,		NULL,	NULL),
		('MINOR_CIV_GENEVA',			92,		25,		NULL,	NULL),
		('MINOR_CIV_FLORENCE',			95,		25,		NULL,	NULL),
		('MINOR_CIV_MILAN',				93,		24,		NULL,	NULL),
		('MINOR_CIV_MONACO',			92,		21,		NULL,	NULL),
		('MINOR_CIV_GENOA',				93,		23,		NULL,	NULL),
		('MINOR_CIV_VATICAN_CITY',		98,		21,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			98,		36,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthEastAsiaStartPosition (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthEastAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_HONG_KONG',			0,		6,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthWestEuropeStartPosition (North-West Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthWestEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RIGA',				95,		50,		NULL,	NULL),
		('MINOR_CIV_ZURICH',			37,		2,		NULL,	NULL),
		('MINOR_CIV_BUDAPEST',			50,		7,		NULL,	NULL),
		('MINOR_CIV_BRATISLAVA',		48,		11,		NULL,	NULL),
		('MINOR_CIV_ANTWERP',			27,		18,		NULL,	NULL),
		('MINOR_CIV_BRUSSELS',			29,		15,		NULL,	NULL),
		('MINOR_CIV_WITTENBERG',		39,		15,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			46,		13,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_PacificStartPosition (Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_PacificStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SYDNEY',			50,		7,		NULL,	NULL),
		('MINOR_CIV_WELLINGTON',		61,		5,		NULL,	NULL),
		('MINOR_CIV_HANOI',				26,		45,		NULL,	NULL),
		('MINOR_CIV_HONG_KONG',			33,		47,		NULL,	NULL),
		('MINOR_CIV_KATHMANDU',			15,		51,		NULL,	NULL),
		('MINOR_CIV_MANILA',			37,		39,		NULL,	NULL),
		('MINOR_CIV_VANCOUVER',			102,	62,		NULL,	NULL),
		('MINOR_CIV_LHASA',				17,		55,		NULL,	NULL),
		('MINOR_CIV_MELBOURNE',			48,		4,		NULL,	NULL),
		('MINOR_CIV_KUALA_LUMPUR',		31,		36,		NULL,	NULL),
		('MINOR_CIV_COLOMBO',			10,		33,		NULL,	NULL),
		('MINOR_CIV_MALACCA',			22,		34,		NULL,	NULL),
		('MINOR_CIV_SINGAPORE',			24,		32,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthPacificStartPosition (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_PacificStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_WELLINGTON',		20,		11,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MesopotamiaGiantStartPosition (Giant Levant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MesopotamiaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_YEREVAN',			117,	88,		NULL,	NULL),
		('MINOR_CIV_UR',				141,	80,		NULL,	NULL),
		('MINOR_CIV_ORMUS',				178,	15,		NULL,	NULL),
		('MINOR_CIV_BYBLOS',			66,		56,		NULL,	NULL),
		('MINOR_TYRE',					61,		49,		NULL,	NULL),
		('MINOR_SIDON',					63,		52,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			63,		41,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaSmallStartPosition (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaSmallStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaSmallStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MANILA',			32,		9,		NULL,	NULL),
		('MINOR_CIV_HONG_KONG',			20,		15,		NULL,	NULL),
		('MINOR_CIV_KUALA_LUMPUR',		5,		1,		NULL,	NULL),
		('MINOR_CIV_HANOI',				11,		13,		NULL,	NULL),
		('MINOR_CIV_KATHMANDU',			1,		21,		NULL,	NULL),
		('MINOR_CIV_LHASA',				2,		26,		NULL,	NULL),
		('MINOR_CIV_ALMATY',			1,		43,		NULL,	NULL),
		('MINOR_CIV_KYZYL',				22,		46,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EuroLargeNewStartPosition (Europe Large (new))
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EuroLargeNewStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_EDINBURGH',			21,		56,		NULL,	NULL),
		('MINOR_CIV_DUBLIN',			14,		51,		NULL,	NULL),
		('MINOR_CIV_MADRID',			17,		22,		NULL,	NULL),
		('MINOR_CIV_LISBON',			9,		19,		NULL,	NULL),
		('MINOR_CIV_CARTHAGE',			35,		12,		NULL,	NULL),
		('MINOR_CIV_RAGUSA',			47,		23,		NULL,	NULL),
		('MINOR_CIV_BUDAPEST',			47,		65,		NULL,	NULL),
		('MINOR_CIV_OSLO',				38,		65,		NULL,	NULL),
		('MINOR_CIV_STOCKHOLM',			46,		65,		NULL,	NULL),
		('MINOR_CIV_HELSINKI',			54,		66,		NULL,	NULL),
		('MINOR_TYRE',					69,		9,		NULL,	NULL),
		('MINOR_CIV_WARSAW',			48,		47,		NULL,	NULL),
		('MINOR_CIV_GENEVA',			31,		32,		NULL,	NULL),
		('MINOR_CIV_VENICE',			40,		30,		NULL,	NULL),
		('MINOR_CIV_GENOA',				34,		29,		NULL,	NULL),
		('MINOR_CIV_FLORENCE',			37,		27,		NULL,	NULL),
		('MINOR_CIV_COPENHAGEN',		39,		54,		NULL,	NULL),
		('MINOR_CIV_BUCHAREST',			54,		29,		NULL,	NULL),
		('MINOR_CIV_BELGRADE',			49,		28,		NULL,	NULL),
		('MINOR_CIV_VIENNA',			43,		36,		NULL,	NULL),
		('MINOR_CIV_BRUSSELS',			28,		43,		NULL,	NULL),
		('MINOR_CIV_MONACO',			31,		27,		NULL,	NULL),
		('MINOR_SIDON',					70,		11,		NULL,	NULL),
		('MINOR_CIV_VALLETTA',			39,		10,		NULL,	NULL),
		('MINOR_CIV_YEREVAN',			76,		24,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			69,		6,		NULL,	NULL),
		('MINOR_CIV_KIEV',				58,		43,		NULL,	NULL),
		('MINOR_CIV_RIGA',				52,		57,		NULL,	NULL),
		('MINOR_CIV_ANTWERP',			27,		45,		NULL,	NULL),
		('MINOR_CIV_MARRAKECH',			10,		5,		NULL,	NULL),
		('MINOR_CIV_MILAN',				37,		32,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			42,		40,		NULL,	NULL),
		('MINOR_CIV_VATICAN_CITY',		39,		23,		NULL,	NULL),
		('MINOR_CIV_WITTENBERG',		38,		45,		NULL,	NULL),
		('MINOR_CIV_ZURICH',			33,		35,		NULL,	NULL),
		('MINOR_CIV_UR',				81,		5,		NULL,	NULL),
		('MINOR_CIV_SOFIA',				53,		24,		NULL,	NULL),
		('MINOR_CIV_BYBLOS',			71,		12,		NULL,	NULL),
		('MINOR_CIV_BRATISLAVA',		46,		37,		NULL,	NULL),
		('MINOR_CIV_VILNIUS',			52,		52,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AdriaticStartPosition (Adriatic Sea/Balkans)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AdriaticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AdriaticStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RAGUSA',			51,		39,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_WestAfricaStartPosition (West Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_WestAfricaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MARRAKECH',			26,		60,		NULL,	NULL),
		('MINOR_CIV_CARTHAGE',			72,		77,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CaucasusStartPosition (Caucasus)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CaucasusStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CaucasusStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SOFIA',				19,		49,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaSteppeGiantStartPosition (Mongol Steppe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaSteppeGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaSteppeGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',			70,		29,		NULL,	NULL),
		('MINOR_CIV_SAMARKAND',			54,		18,		NULL,	NULL),
		('MINOR_CIV_YEREVAN',			5,		19,		NULL,	NULL),
		('MINOR_CIV_KYZYL',				110,	58,		NULL,	NULL),
		('MINOR_CIV_KABUL',				58,		2,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CentralAsiaStartPosition (Central Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CentralAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CentralAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SAMARKAND',			77,		64,		NULL,	NULL),
		('MINOR_CIV_KABUL',				81,		43,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EuroEasternStartPosition (Eastern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EuroEasternStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EuroEasternStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUDAPEST',			18,		18,		NULL,	NULL),
		('MINOR_CIV_STOCKHOLM',			16,		68,		NULL,	NULL),
		('MINOR_CIV_HELSINKI',			40,		73,		NULL,	NULL),
		('MINOR_CIV_WARSAW',			26,		36,		NULL,	NULL),
		('MINOR_CIV_BUCHAREST',			45,		6,		NULL,	NULL),
		('MINOR_CIV_BELGRADE',			26,		8,		NULL,	NULL),
		('MINOR_CIV_VIENNA',			8,		19,		NULL,	NULL),
		('MINOR_CIV_KIEV',				56,		29,		NULL,	NULL),
		('MINOR_CIV_RIGA',				37,		55,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			5,		26,		NULL,	NULL),
		('MINOR_CIV_BRATISLAVA',		12,		19,		NULL,	NULL),
		('MINOR_CIV_VILNIUS',			38,		45,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthSeaEuropeStartPosition (North Sea)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthSeaEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthSeaEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			62,		12,		NULL,	NULL),
		('MINOR_CIV_BRUSSELS',			61,		7,		NULL,	NULL),
		('MINOR_CIV_PRAGUE',			98,		2,		NULL,	NULL),
		('MINOR_CIV_WARSAW',			115,	10,		NULL,	NULL),
		('MINOR_CIV_COPENHAGEN',		87,		39,		NULL,	NULL),
		('MINOR_CIV_OSLO',				80,		67,		NULL,	NULL),
		('MINOR_CIV_STOCKHOLM',			110,	68,		NULL,	NULL),
		('MINOR_CIV_DUBLIN',			17,		25,		NULL,	NULL),
		('MINOR_CIV_EDINBURGH',			29,		42,		NULL,	NULL),
		('MINOR_CIV_WITTENBERG',		87,		14,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriAsiaAustStartPosition (Africa, Asia & Australia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriAsiaAustStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',            78,     73,     NULL,   NULL),
		('MINOR_CIV_ANTANANARIVO',      18,     19,     NULL,   NULL),
		('MINOR_CIV_BELGRADE',          34,     79,     NULL,   NULL),
		('MINOR_CIV_BUCHAREST',         37,     79,     NULL,   NULL),
		('MINOR_CIV_BYBLOS',            45,     66,     NULL,   NULL),
		('MINOR_CIV_CAPE_TOWN',         32,     6,      NULL,   NULL),
		('MINOR_CIV_COLOMBO',           77,     39,     NULL,   NULL),
		('MINOR_CIV_FLORENCE',          28,     78,     NULL,   NULL),
		('MINOR_CIV_HANOI',             97,     52,     NULL,   NULL),
		('MINOR_CIV_HONG_KONG',         106,    57,     NULL,   NULL),
		('MINOR_CIV_IFE',               22,     43,     NULL,   NULL),
		('MINOR_CIV_JERUSALEM',         46,     66,     NULL,   NULL),
		('MINOR_CIV_KABUL',             72,     67,     NULL,   NULL),
		('MINOR_CIV_KATHMANDU',         85,     62,     NULL,   NULL),
		('MINOR_CIV_KUALA_LUMPUR',      93,     39,     NULL,   NULL),
		('MINOR_CIV_KYZYL',             91,     74,     NULL,   NULL),
		('MINOR_CIV_LHASA',             87,     58,     NULL,   NULL),
		('MINOR_CIV_MALACCA',           94,     37,     NULL,   NULL),
		('MINOR_CIV_MANILA',            108,    47,     NULL,   NULL),
		('MINOR_CIV_MBANZA_KONGO',      29,     32,     NULL,   NULL),
		('MINOR_CIV_MELBOURNE',         124,    4,      NULL,   NULL),
		('MINOR_CIV_MOGADISHU',         52,     39,     NULL,   NULL),
		('MINOR_CIV_MOMBASA',           37,     42,     NULL,   NULL),
		('MINOR_CIV_ORMUS',             64,     61,     NULL,   NULL),
		('MINOR_CIV_RAGUSA',            33,     78,     NULL,   NULL),
		('MINOR_CIV_SAMARKAND',         75,     69,     NULL,   NULL),
		('MINOR_CIV_SIDON',             45,     65,     NULL,   NULL),
		('MINOR_CIV_SINGAPORE',         95,     36,     NULL,   NULL),
		('MINOR_CIV_TYRE',              45,     67,     NULL,   NULL),
		('MINOR_CIV_UR',                56,     63,     NULL,   NULL),
		('MINOR_CIV_YEREVAN',           55,     75,     NULL,   NULL),
		('MINOR_CIV_ZANZIBAR',          51,     27,     NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriSouthEuroStartPosition (Africa & Southern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriSouthEuroStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUCHAREST',			49,		77,		NULL,	NULL),
		('MINOR_CIV_FLORENCE',			34,		73,		NULL,	NULL),
		('MINOR_CIV_MILAN',				33,		76,		NULL,	NULL),
		('MINOR_CIV_MONACO',			30,		74,		NULL,	NULL),
		('MINOR_CIV_BYBLOS',			57,		62,		NULL,	NULL),
		('MINOR_CIV_CAPE_TOWN',			39,		1,		NULL,	NULL),
		('MINOR_CIV_LISBON',			12,		66,		NULL,	NULL),
		('MINOR_CIV_MOGADISHU',			59,		33,		NULL,	NULL),
		('MINOR_CIV_MOMBASA',			54,		29,		NULL,	NULL),
		('MINOR_CIV_ORMUS',				70,		54,		NULL,	NULL),
		('MINOR_CIV_RAGUSA',			41,		72,		NULL,	NULL),
		('MINOR_CIV_UR',				64,		56,		NULL,	NULL),
		('MINOR_CIV_VENICE',			37,		76,		NULL,	NULL),
		('MINOR_CIV_GENOA',				32,		74,		NULL,	NULL),
		('MINOR_CIV_MARRAKECH',			17,		56,		NULL,	NULL),
		('MINOR_TYRE',					57,		60,		NULL,	NULL),
		('MINOR_CIV_ZANZIBAR',			55,		25,		NULL,	NULL),
		('MINOR_CIV_BELGRADE',			44,		75,		NULL,	NULL),
		('MINOR_CIV_MBANZA_KONGO',		37,		24,		NULL,	NULL),
		('MINOR_SIDON',					57,		61,		NULL,	NULL),
		('MINOR_CIV_SOFIA',				46,		73,		NULL,	NULL),
		('MINOR_CIV_VALLETTA',			36,		60,		NULL,	NULL),
		('MINOR_CIV_GENEVA',			29,		77,		NULL,	NULL),
		('MINOR_CIV_IFE',				31,		39,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			57,		59,		NULL,	NULL),
		('MINOR_CIV_VATICAN_CITY',		57,		59,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriGiantStartPosition (Africa Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BYBLOS',			98,		131,	NULL,	NULL),
		('MINOR_CIV_CAPE_TOWN',			70,		6,		NULL,	NULL),
		('MINOR_CIV_MOGADISHU',			119,	74,		NULL,	NULL),
		('MINOR_CIV_MOMBASA',			107,	59,		NULL,	NULL),
		('MINOR_CIV_ORMUS',				132,	120,	NULL,	NULL),
		('MINOR_CIV_UR',				116,	130,	NULL,	NULL),
		('MINOR_CIV_MARRAKECH',			31,		128,	NULL,	NULL),
		('MINOR_TYRE',					96,		128,	NULL,	NULL),
		('MINOR_CIV_ZANZIBAR',			107,	54,		NULL,	NULL),
		('MINOR_CIV_MBANZA_KONGO',		65,		56,		NULL,	NULL),
		('MINOR_SIDON',					96,		129,	NULL,	NULL),
		('MINOR_CIV_VALLETTA',			68,		135,	NULL,	NULL),
		('MINOR_CIV_IFE',				46,		83,		NULL,	NULL),
		('MINOR_CIV_JERUSALEM',			96,		125,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaGiantStartPosition (South America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            38,     127,    NULL,   NULL),
		('MINOR_CIV_BUENOS_AIRES',      67,     47,     NULL,   NULL),
		('MINOR_CIV_PANAMA_CITY',       25,     137,    NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AustralasiaGiantStartPosition (Australia & South East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AustralasiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AustralasiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SINGAPORE',					13,		97,		NULL,	NULL),
		('MINOR_CIV_MELBOURNE',					80,		18,		NULL,	NULL),
		('MINOR_CIV_MALACCA',					10,		100,	NULL,	NULL),
		('MINOR_CIV_WELLINGTON',				133,	19,		NULL,	NULL),
		('MINOR_CIV_SYDNEY',					89,		26,		NULL,	NULL),
		('MINOR_CIV_MANILA',					43,		124,	NULL,	NULL),
		('MINOR_CIV_JAKARTA',					19,		77,		NULL,	NULL),
		('MINOR_CIV_KUALA_LUMPUR',				10,		103,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------          
-- MinorCiv_IndianOceanStartPosition (Indian Ocean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndianOceanStartPosition
        (Type,                        		X,      Y,      AltX,   AltY)
VALUES  ('MINOR_CIV_ANTANANARIVO',      	53,     20,     NULL,   NULL),
        ('MINOR_CIV_COLOMBO',           	52,     46,     NULL,   NULL),
        ('MINOR_CIV_HANOI',             	73,     61,     NULL,   NULL),
        ('MINOR_CIV_HONG_KONG',         	82,     63,     NULL,   NULL),
        ('MINOR_CIV_KABUL',             	38,     71,     NULL,   NULL),
        ('MINOR_CIV_KATHMANDU',         	60,     70,     NULL,   NULL),
        ('MINOR_CIV_KUALA_LUMPUR',      	71,     42,     NULL,   NULL),
        ('MINOR_CIV_LHASA',            	 	59,     66,     NULL,   NULL),
        ('MINOR_CIV_MALACCA',           	71,     41,     NULL,   NULL),
        ('MINOR_CIV_MANILA',            	89,     54,     NULL,   NULL),
        ('MINOR_CIV_MOGADISHU',         	17,     40,     NULL,   NULL),
        ('MINOR_CIV_MOMBASA',           	13,     36,     NULL,   NULL),
        ('MINOR_CIV_ORMUS',             	28,     68,     NULL,   NULL),
        ('MINOR_CIV_SINGAPORE',         	73,     40,     NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AmericasGiantStartPosition (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AmericasGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUENOS_AIRES',		97,		24,		NULL,	NULL),
		('MINOR_CIV_QUEBEC',			69,		126,	NULL,	NULL),
		('MINOR_CIV_VANCOUVER',			25,		131,	NULL,	NULL),
		('MINOR_CIV_CAHOKIA',			55,		118,	NULL,	NULL),
		('MINOR_CIV_LA_VENTA',			51,		92,		NULL,	NULL),
		('MINOR_CIV_PANAMA_CITY',		70,		80,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_IndiaGiantStartPosition (India Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndiaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_KABUL',				15,		124,	NULL,	NULL),
		('MINOR_CIV_COLOMBO',			51,		7,		NULL,	NULL),
		('MINOR_CIV_KATHMANDU',			70,		94,		NULL,	NULL),
		('MINOR_CIV_LHASA',				94,		112,	NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaCentralHugeStartPosition (South & Central America Huge) 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaCentralHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            47,     75,    NULL,   NULL),
		('MINOR_CIV_BUENOS_AIRES',      65,     31,     NULL,   NULL),
		('MINOR_CIV_LA_VENTA',  	    22,     97,     NULL,   NULL),
		('MINOR_CIV_PANAMA_CITY',       38,     85,     NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaCentralGiantStartPosition (South & Central America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaCentralGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            61,     103,    NULL,   NULL),
		('MINOR_CIV_BUENOS_AIRES',      86,     42,     NULL,   NULL),
		('MINOR_CIV_LA_VENTA',  	    29,     128,    NULL,   NULL),
		('MINOR_CIV_PANAMA_CITY',       51,     111,    NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_ScotlandIrelandHugeStartPosition (Scotland & Ireland Huge) 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_ScotlandIrelandHugeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaLargeStartPosition (South America Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            34,		76,     NULL,   NULL),
		('MINOR_CIV_BUENOS_AIRES',      50,     29,     NULL,   NULL),
		('MINOR_CIV_PANAMA_CITY',       23,     83,     NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAsiaHugeStartPosition (South Asia Huge) -- NOT DONE
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAsiaHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_COLOMBO',           59,     4,      NULL,   NULL),
		('MINOR_CIV_HANOI',             105,    71,     NULL,   NULL),
		('MINOR_CIV_HONG_KONG',         117,    75,     NULL,   NULL),
		('MINOR_CIV_KABUL',             12,     70,     NULL,   NULL),
		('MINOR_CIV_KATHMANDU',         57,     72,     NULL,   NULL),
		('MINOR_CIV_KUALA_LUMPUR',      109,    16,     NULL,   NULL),
		('MINOR_CIV_LHASA',             68,     73,     NULL,   NULL),
		('MINOR_CIV_MALACCA',           111,    14,     NULL,   NULL),
		('MINOR_CIV_SINGAPORE',         116,    12,     NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthPacificGiantStartPosition (South Pacific Giant) 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthPacificGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthPacificGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MELBOURNE',         7,		16,     NULL,   NULL),
		('MINOR_CIV_SYDNEY',    		18,     21,     NULL,   NULL),
		('MINOR_CIV_WELLINGTON',        69,     9,      NULL,   NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAmericaGiantStartPosition (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAmericaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_QUEBEC',			96,		64,		NULL,	NULL),
		('MINOR_CIV_VANCOUVER',			39,		66,		NULL,	NULL),
		('MINOR_CIV_CAHOKIA',			76,		54,		NULL,	NULL),
		('MINOR_CIV_LA_VENTA',			76,		19,		NULL,	NULL),
		('MINOR_CIV_PANAMA_CITY',		98,		3,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAmericaHugeStartPosition (North America Huge) 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAmericaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_QUEBEC',			97,		51,		NULL,	NULL),
		('MINOR_CIV_VANCOUVER',			35,		51,		NULL,	NULL),
		('MINOR_CIV_CAHOKIA',			75,		41,		NULL,	NULL),
		('MINOR_CIV_LA_VENTA',			70,		5,		NULL,	NULL),
		('MINOR_CIV_PANAMA_CITY',		85,		0,		NULL,	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EarthStandardStartPosition (Earth Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EarthStandardStartPosition(Type, X, Y, AltX, AltY);

--==========================================================================================================================
--==========================================================================================================================
