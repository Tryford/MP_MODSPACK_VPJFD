--==========================================================================================================================
--==========================================================================================================================
-- Resource_AegeanRegionPosition (Aegean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AegeanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AegeanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('GREECE',						0,		0,		26,		51),
		('TURKEY',						26,		0,		35,		51);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaLargeRegionPosition (Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfricaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('AFRICA',						0,		0,		65,		74),
		('WEST_AFRICA',					0,		40,		44,		13),
		('SOUTHEN_AFRICA',				0,		0,		64,		22),
		('CENTRAL_AFRICA',				0,		22,		43,		18),
		('EAST_AFRICA',					44,		22,		20,		31),
		('NORTH_AFRICA',				0,		53,		64,		20);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasRegionPosition (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AmericasRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('NORTH_AMERICA',				0,		48,		66,		31),
		('SOUTH_AMERICA',				0,		0,		66,		48);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ApennineRegionPosition (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ApennineRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_ApennineRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('APENNINE',					0,		0,		60,		58),
		('AFRICA',						0,		0,		11,		25),
		('BALKANS',						45,		20,		15,		38),
		('ITALY',						0,		0,		44,		43);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaRegionPosition (Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('ASIA',						0,		0,		103,	63);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_BritishIslesRegionPosition (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_BritishIslesRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_BritishIslesRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('BRITISH_ISLES',				0,		0,		61,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanRegionPosition (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CaribbeanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('CARIBBEAN',					0,		0,		99,		69);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EastAsiaRegionPosition (East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EastAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EastAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('INDIA',						0,		24,		13,		53),
		('NORTH_ASIA',					0,		0,		11,		25),
		('SOUTHEAST_ASIA',				16,		0,		64,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanRegionPosition (Mediterranean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MediterraneanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('EUROPE',						0,		25,		102,	38),
		('AFRICA',						0,		0,		102,	25);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaRegionPosition (Mesopotamia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MesopotamiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('MESOPOTAMIA',					0,		0,		79,		49);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NileVallyRegionPosition (Nile Valley)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NileValleyRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NileValleyRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('NILE_VALLEY',					0,		0,		80,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAtlanticRegionPosition (North Atlantic)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAtlanticRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAtlanticRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('EUROPE',						50,		0,		55,		57),
		('AMERICA',						0,		0,		55,		57);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthEastAsiaRegionPosition (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthEastAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthEastAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('ASIA',						0,		0,		63,		55);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthWestEuropeRegionPosition (North-West Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthWestEuropeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthWestEuropeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('EUROPE',						0,		0,		56,		67);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PacificRegionPosition (Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PacificRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_PacificRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('ASIA',						0,		0,		74,		79),
		('AMERICA',						74,		0,		40,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificRegionPosition (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthPacificRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('SOUTH_PACIFIC',				0,		0,		99,		95);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaGiantRegionPosition (Giant Levant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MesopotamiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('LEVANT',						0,		0,		179,	93),
		('ANATOLIA',					0,		54,		132,	40),
		('AFRICA',						0,		0,		52,		53),
		('ARABIA',						23,		0,		80,		53),
		('ASIA',						133,	0,		46,		93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSmallRegionPosition (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSmallRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaSmallRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('ASIA',						0,		0,		55,		47);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroLargeNewRegionPosition (Europe Large (new))
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroLargeNewRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EuroLargeNewRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		85,		75),
		('AFRICA',						0,		0,		64,		8),
		('MIDDLE_EAST',					64,		0,		21,		8),
		('WEST_EUROPE',					0,		9,		41,		34),
		('NORTHERN_EUROPE',				0,		44,		85,		31),
		('EASTERN_EUROPE',				42,		9,		43,		34);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AdriaticRegionPosition (Adriatic Sea/Balkans)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AdriaticRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AdriaticRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WestAfricaRegionPosition (West Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WestAfricaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_WestAfricaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		100,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaucasusRegionPosition (Caucasus)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaucasusRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CaucasusRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSteppeGiantRegionPosition (Mongol Steppe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSteppeGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaSteppeGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAsiaRegionPosition (Central Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CentralAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroEasternRegionPosition (Eastern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroEasternRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EuroEasternRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		102,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaEuropeRegionPosition (North Sea)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaEuropeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthSeaEuropeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		126,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriAsiaAustRegionPosition (Africa, Asia & Australia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriAsiaAustRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriAsiaAustRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('AFRICA',						0,		0,		50,		67),
		('EUROPE',						0,		68,		50,		11),
		('CENTRAL_ASIA',				51,		32,		22,		48),
		('EAST_ASIA',					74,		28,		53,		52),
		('AUSTRALIA',					101,	0,		26,		27);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriSouthEuroRegionPosition (Africa & Southern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriSouthEuroRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriSouthEuroRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('NORTH_AFRICA',				0,		48,		60,		14),
		('WEST_AFRICA',					0,		20,		42,		28),
		('EAST_AFRICA',					43,		20,		17,		28),
		('SOUTH_AFRICA',				0,		0,		79,		19),
		('EUROPE',						0,		62,		51,		17),
		('ANATOLIA',					52,		62,		27,		17),
		('MIDDLE_EAST',					61,		49,		18,		13);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriGiantRegionPosition (Africa Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	140),
		('NORTH_AFRICA',				0,		95,		95,		45),
		('WEST_AFRICA',					0,		76,		95,		19),
		('EAST_AFRICA',					90,		33,		50,		43),
		('CENTRAL_AFRICA',				0,		33,		90,		43),
		('SOUTHEN_AFRICA',				0,		0,		140,	33),
		('MIDDLE_EAST',					95,		95,		45,		45);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaGiantRegionPosition (South America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		120,	145),
		('SOUTH_AMERICA_WEST_SOUTHERN',	0,		10,		62,		80),
		('SOUTH_AMERICA_WEST_NORTHERN',	0,		91,		44,		55),
		('SOUTH_AMERICA_EAST_SOUTHERN',	62,		10,		58,		80),
		('SOUTH_AMERICA_EAST_NORTHERN',	45,		91,		75,		55),
		('SOUTH_AMERICA_ANTARCTIC',		0,		0,		120,	10);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustralasiaGiantRegionPosition (Australia & South East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustralasiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AustralasiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	135),
		('AUSTRALIA',					0,		0,		140,	70)	;
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndianOceanRegionPosition (Indian Ocean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndianOceanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndianOceanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		97,		72),
		('AUSTRALIA',					81,		0,		66,		16),
		('SOUTHEAST_ASIA',				67,		24,		30,		48),
		('AFRICA',						0,		0,		14,		56),
		('INDIA',						42,		41,		25,		31),
		('MIDDLE_EAST',					0,		56,		41,		16);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasGiantRegionPosition (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AmericasGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	155),
		('ANTARCTIC_AMERICA',			0,		138,	128,	17),
		('NORTH_AMERICA',				18,		102,	110,	36),
		('CENTRAL_AMERICA',				31,		81,		97,		20),
		('HAWAII',						0,		0,		13,		101),
		('SOUTH_AMERICA',				55,		0,		73,		80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaGiantRegionPosition (India Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		110,	130);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralHugeRegionPosition (South & Central America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaCentralHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		100,	105),
		('SOUTH_AMERICA',				0,		0,		100,	83),
		('CENTRAL_AMERICA',				0,		84,		100,	21);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralGiantRegionPosition (South & Central America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaCentralGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		130,	140),
		('SOUTH_AMERICA',				0,		0,		130,	116),
		('CENTRAL_AMERICA',				0,		118,	130,	24);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ScotlandIrelandHugeRegionPosition (Scotland & Ireland Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ScotlandIrelandHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_ScotlandIrelandHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaLargeRegionPosition (South America Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		85,		90),
		('SOUTH_AMERICA_CENTRAL',		0,		15,		85,		76),
		('SOUTH_AMERICA_ANTARCTIC',		0,		0,		85,		14);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAsiaHugeRegionPosition (South Asia Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAsiaHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAsiaHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificGiantRegionPosition (South Pacific Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthPacificGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		180,	94);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaGiantRegionPosition (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAmericaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	110),
		('ANTARCTIC_AMERICA',			0,		91,		140,	19),
		('NORTH_AMERICA',				0,		25,		140,	66),
		('CENTRAL_AMERICA',				0,		0,		140,	25);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaHugeRegionPosition (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAmericaHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	80),
		('ANTARCTIC_AMERICA',			0,		65,		128,	15),
		('NORTH_AMERICA',				0,		16,		128,	49),
		('CENTRAL_AMERICA',				0,		0,		128,	15);
--==========================================================================================================================
--==========================================================================================================================

