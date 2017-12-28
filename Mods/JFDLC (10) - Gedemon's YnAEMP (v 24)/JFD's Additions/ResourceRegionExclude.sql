--==========================================================================================================================
--==========================================================================================================================
-- Resource_AegeanRegionExclude (Aegean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AegeanRegionExclude(Type, Resource);
INSERT INTO Resource_AegeanRegionExclude
		(Type,				Resource)
VALUES	('GREECE',			'RESOURCE_WINE'),
		('GREECE',			'RESOURCE_INCENSE'),
		('GREECE',			'RESOURCE_FUR'),
		('GREECE',			'RESOURCE_TRUFFLES'),
		('GREECE',			'RESOURCE_BISON'),
		('GREECE',			'RESOURCE_COCOA'),
		('GREECE',			'RESOURCE_IVORY'),
		('GREECE',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_FUR'),
		('TURKEY',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_IVORY'),
		('TURKEY',			'RESOURCE_PEARLS'),
		('TURKEY',			'RESOURCE_MARBLE'),
		('TURKEY',			'RESOURCE_SPICES'),
		('TURKEY',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_COTTON'),
		('TURKEY',			'RESOURCE_WINE'),
		('TURKEY',			'RESOURCE_CITRUS'),
		('TURKEY',			'RESOURCE_TRUFFLES'),
		('TURKEY',			'RESOURCE_COCOA'),
		('TURKEY',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaLargeRegionExclude (Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_AfricaLargeRegionExclude
		(Type,				Resource)
VALUES	('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_BISON'),			
		('AFRICA',			'RESOURCE_JADE'),			
		('WEST_AFRICA',		'RESOURCE_WHEAT'),
		('WEST_AFRICA',		'RESOURCE_SPICES'),
		('WEST_AFRICA',		'RESOURCE_SILK'),			
		('WEST_AFRICA',		'RESOURCE_INCENSE'),
		('WEST_AFRICA',		'RESOURCE_WINE'),
		('WEST_AFRICA',		'RESOURCE_SILVER'),
		('WEST_AFRICA',		'RESOURCE_PEARLS'),
		('WEST_AFRICA',		'RESOURCE_CITRUS'),
		('WEST_AFRICA',		'RESOURCE_TRUFFLES'),	
		('WEST_AFRICA',		'RESOURCE_TOBACCO'),	
		('SOUTHEN_AFRICA',	'RESOURCE_TOBACCO'),
		('SOUTHEN_AFRICA',	'RESOURCE_SPICES'),
		('SOUTHEN_AFRICA',	'RESOURCE_SILK'),			
		('SOUTHEN_AFRICA',	'RESOURCE_INCENSE'),
		('SOUTHEN_AFRICA',	'RESOURCE_MARBLE'),
		('SOUTHEN_AFRICA',	'RESOURCE_COCOA'),
		('CENTRAL_AFRICA',	'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',	'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',	'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',	'RESOURCE_SILK'),
		('CENTRAL_AFRICA',	'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',	'RESOURCE_WINE'),
		('CENTRAL_AFRICA',	'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',	'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',	'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',	'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',	'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_SILK'),
		('EAST_AFRICA',		'RESOURCE_COPPER'),
		('EAST_AFRICA',		'RESOURCE_SILVER'),
		('EAST_AFRICA',		'RESOURCE_MARBLE'),
		('EAST_AFRICA',		'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_COCOA'),
		('EAST_AFRICA',		'RESOURCE_TRUFFLES'),
		('EAST_AFRICA',		'RESOURCE_GEMS'),			
		('EAST_AFRICA',		'RESOURCE_TOBACCO'),			
		('NORTH_AFRICA',	'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',	'RESOURCE_BANANA'),
		('NORTH_AFRICA',	'RESOURCE_CATTLE'),
		('NORTH_AFRICA',	'RESOURCE_SUGAR'),
		('NORTH_AFRICA',	'RESOURCE_COCOA'),
		('NORTH_AFRICA',	'RESOURCE_TRUFFLES'),
		('NORTH_AFRICA',	'RESOURCE_GEMS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasRegionExclude (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasRegionExclude(Type, Resource);
INSERT INTO Resource_AmericasRegionExclude
		(Type,				Resource)
VALUES	('SOUTH_AMERICA',	'RESOURCE_BISON'),
		('SOUTH_AMERICA',	'RESOURCE_COW'),
		('SOUTH_AMERICA',	'RESOURCE_SHEEP'),
		('SOUTH_AMERICA',	'RESOURCE_HORSE'),
		('SOUTH_AMERICA',	'RESOURCE_SILK'),
		('SOUTH_AMERICA',	'RESOURCE_IVORY'),
		('SOUTH_AMERICA',	'RESOURCE_INCENSE'),
		('SOUTH_AMERICA',	'RESOURCE_JADE'),
		('SOUTH_AMERICA',	'RESOURCE_TEA'),
		('SOUTH_AMERICA',	'RESOURCE_OLIVE'),
		('SOUTH_AMERICA',	'RESOURCE_SPICES'),
		('SOUTH_AMERICA',	'RESOURCE_COFFEE'),
		('NORTH_AMERICA',	'RESOURCE_CITRUS'),
		('NORTH_AMERICA',	'RESOURCE_COW'),
		('NORTH_AMERICA',	'RESOURCE_SPICES'),
		('NORTH_AMERICA',	'RESOURCE_SHEEP'),
		('NORTH_AMERICA',	'RESOURCE_HORSE'),
		('NORTH_AMERICA',	'RESOURCE_SILK'),
		('NORTH_AMERICA',	'RESOURCE_IVORY'),
		('NORTH_AMERICA',	'RESOURCE_INCENSE'),
		('NORTH_AMERICA',	'RESOURCE_JADE'),
		('NORTH_AMERICA',	'RESOURCE_TEA'),
		('NORTH_AMERICA',	'RESOURCE_OLIVE'),
		('NORTH_AMERICA',	'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ApennineRegionExclude (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ApennineRegionExclude(Type, Resource);
INSERT INTO Resource_ApennineRegionExclude
		(Type,				Resource)
VALUES	('APENNINE',		'RESOURCE_BISON'),
		('APENNINE',		'RESOURCE_FUR'),
		('APENNINE',		'RESOURCE_COCOA'),
		('APENNINE',		'RESOURCE_TOBACCO'),
		('APENNINE',		'RESOURCE_TEA'),
		('APENNINE',		'RESOURCE_SILK'),
		('APENNINE',		'RESOURCE_JADE'),
		('APENNINE',		'RESOURCE_COFFEE'),
		('AFRICA',			'RESOURCE_COW'),
		('AFRICA',			'RESOURCE_MARBLE'),
		('BALKANS',			'RESOURCE_IVORY'),
		('BALKANS',			'RESOURCE_PEARLS'),
		('BALKANS',			'RESOURCE_SPICES'),
		('BALKANS',			'RESOURCE_INCENSE'),
		('BALKANS',			'RESOURCE_WINE'),
		('ITALY',			'RESOURCE_IVORY'),
		('ITALY',			'RESOURCE_PEARLS'),
		('ITALY',			'RESOURCE_SPICES'),
		('ITALY',			'RESOURCE_INCENSE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaRegionExclude (Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaRegionExclude
		(Type,				Resource)
VALUES	('ASIA',			'RESOURCE_OLIVE'),
		('ASIA',			'RESOURCE_IVORY'),
		('ASIA',			'RESOURCE_FUR'),
		('ASIA',			'RESOURCE_BISON'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_COTTON'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_TRUFFLES'),
		('ASIA',			'RESOURCE_COCOA'),
		('ASIA',			'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_BritishIslesRegionExclude (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_BritishIslesRegionExclude(Type, Resource);
INSERT INTO Resource_BritishIslesRegionExclude
		(Type,				Resource)
VALUES	('BRITISH_ISLES',	'RESOURCE_BANANA'),
		('BRITISH_ISLES',	'RESOURCE_SILK'),
		('BRITISH_ISLES',	'RESOURCE_TOBACCO'),
		('BRITISH_ISLES',	'RESOURCE_SILK'),
		('BRITISH_ISLES',	'RESOURCE_COTTON'),
		('BRITISH_ISLES',	'RESOURCE_TEA'),
		('BRITISH_ISLES',	'RESOURCE_IVORY'),
		('BRITISH_ISLES',	'RESOURCE_SPICES'),
		('BRITISH_ISLES',	'RESOURCE_CITRUS'),
		('BRITISH_ISLES',	'RESOURCE_WINE'),
		('BRITISH_ISLES',	'RESOURCE_BISON'),
		('BRITISH_ISLES',	'RESOURCE_COCOA'),
		('BRITISH_ISLES',	'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanRegionExclude (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanRegionExclude(Type, Resource);
INSERT INTO Resource_CaribbeanRegionExclude
		(Type,				Resource)
VALUES	('CARIBBEAN',		'RESOURCE_BISON'),
		('CARIBBEAN',		'RESOURCE_COW'),
		('CARIBBEAN',		'RESOURCE_SHEEP'),
		('CARIBBEAN',		'RESOURCE_HORSE'),
		('CARIBBEAN',		'RESOURCE_SILK'),
		('CARIBBEAN',		'RESOURCE_IVORY'),
		('CARIBBEAN',		'RESOURCE_SPICES'),
		('CARIBBEAN',		'RESOURCE_MARBLE'),
		('CARIBBEAN',		'RESOURCE_CITRUS'),
		('CARIBBEAN',		'RESOURCE_WINE'),
		('CARIBBEAN',		'RESOURCE_INCENSE'),
		('CARIBBEAN',		'RESOURCE_JADE'),
		('CARIBBEAN',		'RESOURCE_TEA'),
		('CARIBBEAN',		'RESOURCE_OLIVE'),
		('CARIBBEAN',		'RESOURCE_TRUFFLES'),
		('CARIBBEAN',		'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EastAsiaRegionExclude (East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EastAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_EastAsiaRegionExclude
		(Type,				Resource)
VALUES	('INDIA',			'RESOURCE_WINE'),
		('INDIA',			'RESOURCE_INCENSE'),
		('INDIA',			'RESOURCE_FUR'),
		('INDIA',			'RESOURCE_TRUFFLES'),
		('INDIA',			'RESOURCE_BISON'),
		('INDIA',			'RESOURCE_COCOA'),
		('INDIA',			'RESOURCE_TOBACCO'),
		('INDIA',			'RESOURCE_OLIVE'),
		('NORTH_ASIA',		'RESOURCE_OLIVE'),
		('NORTH_ASIA',		'RESOURCE_IVORY'),
		('NORTH_ASIA',		'RESOURCE_PEARLS'),
		('NORTH_ASIA',		'RESOURCE_MARBLE'),
		('NORTH_ASIA',		'RESOURCE_SPICES'),
		('NORTH_ASIA',		'RESOURCE_SUGAR'),
		('NORTH_ASIA',		'RESOURCE_COTTON'),
		('NORTH_ASIA',		'RESOURCE_WINE'),
		('NORTH_ASIA',		'RESOURCE_CITRUS'),
		('NORTH_ASIA',		'RESOURCE_TRUFFLES'),
		('NORTH_ASIA',		'RESOURCE_COCOA'),
		('NORTH_ASIA',		'RESOURCE_TOBACCO'),
		('SOUTHEAST_ASIA',	'RESOURCE_OLIVE'),
		('SOUTHEAST_ASIA',	'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',	'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',	'RESOURCE_SPICES'),
		('SOUTHEAST_ASIA',	'RESOURCE_SUGAR'),
		('SOUTHEAST_ASIA',	'RESOURCE_INCENSE'),
		('SOUTHEAST_ASIA',	'RESOURCE_BISON'),
		('SOUTHEAST_ASIA',	'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanRegionExclude (Mediterranean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanRegionExclude(Type, Resource);
INSERT INTO Resource_MediterraneanRegionExclude
		(Type,				Resource)
VALUES	('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_FUR'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_INCENSE'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_COCOA'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_TEA'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_COFFEE'),
		('AFRICA',			'RESOURCE_SPICES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaRegionExclude (Mesopotamia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaRegionExclude(Type, Resource);
INSERT INTO Resource_MesopotamiaRegionExclude
		(Type,				Resource)
VALUES	('MESOPOTAMIA',		'RESOURCE_BANANA'),
		('MESOPOTAMIA',		'RESOURCE_FUR'),
		('MESOPOTAMIA',		'RESOURCE_COTTON'),
		('MESOPOTAMIA',		'RESOURCE_TRUFFLES'),
		('MESOPOTAMIA',		'RESOURCE_BISON'),
		('MESOPOTAMIA',		'RESOURCE_JADE'),
		('MESOPOTAMIA',		'RESOURCE_SILK'),
		('MESOPOTAMIA',		'RESOURCE_SPICES'),
		('MESOPOTAMIA',		'RESOURCE_TEA'),
		('MESOPOTAMIA',		'RESOURCE_TOBACCO'),
		('MESOPOTAMIA',		'RESOURCE_COFFEE'),
		('MESOPOTAMIA',		'RESOURCE_COCOA'),
		('MESOPOTAMIA',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NileValleyRegionExclude (Nile Valley)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NileValleyRegionExclude(Type, Resource);
INSERT INTO Resource_NileValleyRegionExclude
		(Type,				Resource)
VALUES	('NILE_VALLEY',		'RESOURCE_BANANA'),
		('NILE_VALLEY',		'RESOURCE_WINE'),
		('NILE_VALLEY',		'RESOURCE_FUR'),
		('NILE_VALLEY',		'RESOURCE_COTTON'),
		('NILE_VALLEY',		'RESOURCE_TRUFFLES'),
		('NILE_VALLEY',		'RESOURCE_BISON'),
		('NILE_VALLEY',		'RESOURCE_SPICES'),
		('NILE_VALLEY',		'RESOURCE_TEA'),
		('NILE_VALLEY',		'RESOURCE_TOBACCO'),
		('NILE_VALLEY',		'RESOURCE_COFFEE'),
		('NILE_VALLEY',		'RESOURCE_COCOA'),
		('NILE_VALLEY',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAtlanticRegionExclude (North Atlantic)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAtlanticRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAtlanticRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_HORSE'),
		('AMERICA',			'RESOURCE_SILK'),
		('AMERICA',			'RESOURCE_JADE'),
		('AMERICA',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_BANANA'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_COTTON'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_CITRUS'),
		('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthEastAsiaRegionExclude (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthEastAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_NorthEastAsiaRegionExclude
		(Type,				Resource)
VALUES	('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_INCENSE'),
		('ASIA',			'RESOURCE_FUR'),
		('ASIA',			'RESOURCE_TRUFFLES'),
		('ASIA',			'RESOURCE_BISON'),
		('ASIA',			'RESOURCE_COCOA'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_OLIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthWestEuropeRegionExclude (North-West Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthWestEuropeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthWestEuropeRegionExclude
		(Type,				Resource)
VALUES	('EUROPE',			'RESOURCE_BANANA'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_COTTON'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_CITRUS'),
		('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PacificRegionExclude (Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PacificRegionExclude(Type, Resource);
INSERT INTO Resource_PacificRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_WINE'),
		('AMERICA',			'RESOURCE_INCENSE'),
		('AMERICA',			'RESOURCE_TRUFFLES'),
		('AMERICA',			'RESOURCE_HORSE'),
		('AMERICA',			'RESOURCE_COW'),
		('AMERICA',			'RESOURCE_SHEEP'),
		('AMERICA',			'RESOURCE_SILK'),
		('AMERICA',			'RESOURCE_COCOA'),
		('AMERICA',			'RESOURCE_JADE'),
		('AMERICA',			'RESOURCE_OLIVE'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_TRUFFLES'),
		('ASIA',			'RESOURCE_BISON'),
		('ASIA',			'RESOURCE_COCOA'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_OLIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificRegionExclude (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificRegionExclude(Type, Resource);
INSERT INTO Resource_SouthPacificRegionExclude
		(Type,				Resource)
VALUES	('SOUTH_PACIFIC',	'RESOURCE_BANANA'),
		('SOUTH_PACIFIC',	'RESOURCE_HORSE'),
		('SOUTH_PACIFIC',	'RESOURCE_IVORY'),
		('SOUTH_PACIFIC',	'RESOURCE_MARBLE'),
		('SOUTH_PACIFIC',	'RESOURCE_SPICES'),
		('SOUTH_PACIFIC',	'RESOURCE_SILK'),
		('SOUTH_PACIFIC',	'RESOURCE_SUGAR'),
		('SOUTH_PACIFIC',	'RESOURCE_INCENSE'),
		('SOUTH_PACIFIC',	'RESOURCE_TOBACCO'),
		('SOUTH_PACIFIC',	'RESOURCE_BISON'),
		('SOUTH_PACIFIC',	'RESOURCE_OLIVE'),
		('SOUTH_PACIFIC',	'RESOURCE_TEA'),
		('SOUTH_PACIFIC',	'RESOURCE_COCOA'),
		('SOUTH_PACIFIC',	'RESOURCE_JADE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaGiantRegionExclude (Giant Levant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_MesopotamiaGiantRegionExclude
		(Type,				Resource)
VALUES	('LEVANT',			'RESOURCE_BANANA'),
		('LEVANT',			'RESOURCE_SUGAR'),
		('LEVANT',			'RESOURCE_BISON'),
		('LEVANT',			'RESOURCE_FUR'),
		('LEVANT',			'RESOURCE_TRUFFLES'),
		('LEVANT',			'RESOURCE_SILK'),
		('LEVANT',			'RESOURCE_JADE'),
		('LEVANT',			'RESOURCE_COCOA'),
		('LEVANT',			'RESOURCE_COFFEE'),
		('ANATOLIA',		'RESOURCE_SPICES'),
		('ANATOLIA',		'RESOURCE_IVORY'),
		('AFRICA',			'RESOURCE_WINE'),
		('AFRICA',			'RESOURCE_SPICES'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_TEA'),
		('AFRICA',			'RESOURCE_CITRUS'),
		('ARABIA',			'RESOURCE_WINE'),
		('ARABIA',			'RESOURCE_SPICES'),
		('ARABIA',			'RESOURCE_TOBACCO'),
		('ARABIA',			'RESOURCE_TEA'),
		('ARABIA',			'RESOURCE_IVORY'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_IVORY'),
		('ASIA',			'RESOURCE_WINE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSmallRegionExclude (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSmallRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaSmallRegionExclude
		(Type,				Resource)
VALUES	('ASIA',			'RESOURCE_OLIVE'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_TRUFFLES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroLargeNewRegionExclude (Europe Large (new))
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroLargeNewRegionExclude(Type, Resource);
INSERT INTO Resource_EuroLargeNewRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_COW'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_DYE'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_MARBLE'),	
		('AFRICA',			'RESOURCE_TEA'),			
		('MIDDLE_EAST',		'RESOURCE_IVORY'),
		('MIDDLE_EAST',		'RESOURCE_COFFEE'),
		('MIDDLE_EAST',		'RESOURCE_COW'),
		('MIDDLE_EAST',		'RESOURCE_FUR'),
		('MIDDLE_EAST',		'RESOURCE_WINE'),
		('MIDDLE_EAST',		'RESOURCE_GEMS'),
		('MIDDLE_EAST',		'RESOURCE_WHALE'),
		('MIDDLE_EAST',		'RESOURCE_DYE'),
		('MIDDLE_EAST',		'RESOURCE_BISON'),
		('MIDDLE_EAST',		'RESOURCE_LAPIS'),			
		('WEST_EUROPE',		'RESOURCE_IVORY'),
		('WEST_EUROPE',		'RESOURCE_COFFEE'),
		('WEST_EUROPE',		'RESOURCE_BISON'),
		('WEST_EUROPE',		'RESOURCE_PEARLS'),
		('WEST_EUROPE',		'RESOURCE_SPICES'),
		('WEST_EUROPE',		'RESOURCE_SILK'),
		('WEST_EUROPE',		'RESOURCE_INCENSE'),
		('WEST_EUROPE',		'RESOURCE_FUR'),	
		('WEST_EUROPE',		'RESOURCE_TOBACCO'),
		('WEST_EUROPE',		'RESOURCE_TEA'),	
		('WEST_EUROPE',		'RESOURCE_LAPIS'),
		('NORTHERN_EUROPE',	'RESOURCE_IVORY'),
		('NORTHERN_EUROPE',	'RESOURCE_PERFUME'),
		('NORTHERN_EUROPE',	'RESOURCE_OLIVE'),
		('NORTHERN_EUROPE',	'RESOURCE_COFFEE'),
		('NORTHERN_EUROPE',	'RESOURCE_PEARLS'),
		('NORTHERN_EUROPE',	'RESOURCE_MARBLE'),
		('NORTHERN_EUROPE',	'RESOURCE_INCENSE'),
		('NORTHERN_EUROPE',	'RESOURCE_WINE'),
		('NORTHERN_EUROPE',	'RESOURCE_COTTON'),
		('NORTHERN_EUROPE',	'RESOURCE_SILK'),
		('NORTHERN_EUROPE',	'RESOURCE_SPICES'),
		('NORTHERN_EUROPE',	'RESOURCE_TOBACCO'),
		('NORTHERN_EUROPE',	'RESOURCE_TEA'),	
		('NORTHERN_EUROPE',	'RESOURCE_LAPIS'),
		('EASTERN_EUROPE',	'RESOURCE_COFFEE'),
		('EASTERN_EUROPE',	'RESOURCE_OLIVE'),			
		('EASTERN_EUROPE',	'RESOURCE_IVORY'),
		('EASTERN_EUROPE',	'RESOURCE_PEARLS'),
		('EASTERN_EUROPE',	'RESOURCE_SPICES'),
		('EASTERN_EUROPE',	'RESOURCE_SILK'),
		('EASTERN_EUROPE',	'RESOURCE_INCENSE'),
		('EASTERN_EUROPE',	'RESOURCE_PERFUME'),
		('EASTERN_EUROPE',	'RESOURCE_TEA'),
		('EASTERN_EUROPE',	'RESOURCE_LAPIS'),	
		('EASTERN_EUROPE',	'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AdriaticRegionExclude (Adriatic Sea/Balkans)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AdriaticRegionExclude(Type, Resource);
INSERT INTO Resource_AdriaticRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_INCENSE'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_LAPIS'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_COFFEE'),
		('WHOLE_MAP',		'RESOURCE_TEA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WestAfricaRegionExclude (West Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WestAfricaRegionExclude(Type, Resource);
INSERT INTO Resource_WestAfricaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_MARBLE'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_CITRUS'),
		('WHOLE_MAP',		'RESOURCE_PERFUME'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_JADE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaucasusRegionExclude (Caucasus)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaucasusRegionExclude(Type, Resource);
INSERT INTO Resource_CaucasusRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_FUR'),
		('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSteppeGiantGiantRegionExclude (Mongol Steppe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSteppeGiantGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaSteppeGiantGiantRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_TEA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAsiaRegionExclude (Central Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_CentralAsiaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroEasternRegionExclude (Eastern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroEasternRegionExclude(Type, Resource);
INSERT INTO Resource_EuroEasternRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_INCENSE'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_SILK'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TEA'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaEuropeRegionExclude (North Sea)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaEuropeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthSeaEuropeRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_INCENSE'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TEA'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriAsiaAustRegionExclude (Africa, Asia & Australia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriAsiaAustRegionExclude(Type, Resource);
INSERT INTO Resource_AfriAsiaAustRegionExclude
		(Type,				Resource)
VALUES	('AFRICA',			'RESOURCE_PEARLS'),
		('AFRICA',			'RESOURCE_MARBLE'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_SUGAR'),
		('AFRICA',			'RESOURCE_WINE'),
		('AFRICA',			'RESOURCE_INCENSE'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_CITRUS'),
		('AFRICA',			'RESOURCE_TRUFFLES'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_PERFUME'),
		('AFRICA',			'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_PEARLS'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_INCENSE'),
		('EUROPE',			'RESOURCE_FUR'),
		('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_LAPIS'),
		('CENTRAL_ASIA',	'RESOURCE_IVORY'),
		('CENTRAL_ASIA',	'RESOURCE_MARBLE'),
		('CENTRAL_ASIA',	'RESOURCE_SPICES'),
		('CENTRAL_ASIA',	'RESOURCE_SUGAR'),
		('CENTRAL_ASIA',	'RESOURCE_WINE'),
		('CENTRAL_ASIA',	'RESOURCE_FUR'),
		('CENTRAL_ASIA',	'RESOURCE_CITRUS'),
		('CENTRAL_ASIA',	'RESOURCE_TRUFFLES'),
		('CENTRAL_ASIA',	'RESOURCE_BISON'),
		('CENTRAL_ASIA',	'RESOURCE_COCOA'),
		('CENTRAL_ASIA',	'RESOURCE_COFFEE'),
		('CENTRAL_ASIA',	'RESOURCE_PERFUME'),
		('CENTRAL_ASIA',	'RESOURCE_LAPIS'),
		('EAST_ASIA',		'RESOURCE_WINE'),
		('EAST_ASIA',		'RESOURCE_INCENSE'),
		('EAST_ASIA',		'RESOURCE_FUR'),
		('EAST_ASIA',		'RESOURCE_TRUFFLES'),
		('EAST_ASIA',		'RESOURCE_BISON'),
		('EAST_ASIA',		'RESOURCE_COCOA'),
		('EAST_ASIA',		'RESOURCE_TOBACCO'),
		('EAST_ASIA',		'RESOURCE_SUGAR'),
		('EAST_ASIA',		'RESOURCE_OLIVE'),
		('EAST_ASIA',		'RESOURCE_LAPIS'),
		('EAST_ASIA',		'RESOURCE_COFFEE'),
		('AUSTRALIA',		'RESOURCE_HORSE'),
		('AUSTRALIA',		'RESOURCE_IVORY'),
		('AUSTRALIA',		'RESOURCE_MARBLE'),
		('AUSTRALIA',		'RESOURCE_SPICES'),
		('AUSTRALIA',		'RESOURCE_SILK'),
		('AUSTRALIA',		'RESOURCE_SUGAR'),
		('AUSTRALIA',		'RESOURCE_INCENSE'),
		('AUSTRALIA',		'RESOURCE_BISON'),
		('AUSTRALIA',		'RESOURCE_COCOA'),
		('AUSTRALIA',		'RESOURCE_COFFEE'),
		('AUSTRALIA',		'RESOURCE_JADE'),
		('AUSTRALIA',		'RESOURCE_OLIVE'),
		('AUSTRALIA',		'RESOURCE_PERFUME'),
		('AUSTRALIA',		'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriSouthEuroRegionExclude (Africa & Southern Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriSouthEuroRegionExclude(Type, Resource);
INSERT INTO Resource_AfriSouthEuroRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_FUR'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_SILK'),
		('NORTH_AFRICA',		'RESOURCE_COW'),
		('NORTH_AFRICA',		'RESOURCE_CATTLE'),
		('NORTH_AFRICA',		'RESOURCE_MARBLE'),
		('NORTH_AFRICA',		'RESOURCE_COCOA'),
		('NORTH_AFRICA',		'RESOURCE_SUGAR'),
		('NORTH_AFRICA',		'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',		'RESOURCE_BANANA'),
		('NORTH_AFRICA',		'RESOURCE_GEMS'),
		('NORTH_AFRICA',		'RESOURCE_TEA'),
		('NORTH_AFRICA',		'RESOURCE_COFFEE'),
		('WEST_AFRICA',			'RESOURCE_WHEAT'),
		('WEST_AFRICA',			'RESOURCE_PEARLS'),
		('WEST_AFRICA',			'RESOURCE_SPICES'),
		('WEST_AFRICA',			'RESOURCE_INCENSE'),
		('WEST_AFRICA',			'RESOURCE_WINE'),
		('WEST_AFRICA',			'RESOURCE_SILVER'),
		('WEST_AFRICA',			'RESOURCE_CITRUS'),
		('WEST_AFRICA',			'RESOURCE_TOBACCO'),
		('WEST_AFRICA',			'RESOURCE_TEA'),
		('WEST_AFRICA',			'RESOURCE_MARBLE'),
		('EAST_AFRICA',			'RESOURCE_COPPER'),
		('EAST_AFRICA',			'RESOURCE_SILVER'),
		('EAST_AFRICA',			'RESOURCE_MARBLE'),
		('EAST_AFRICA',			'RESOURCE_CITRUS'),
		('EAST_AFRICA',			'RESOURCE_COCOA'),
		('EAST_AFRICA',			'RESOURCE_TOBACCO'),
		('EAST_AFRICA',			'RESOURCE_TEA'),
		('SOUTH_AFRICA',		'RESOURCE_TOBACCO'),
		('SOUTH_AFRICA',		'RESOURCE_SPICES'),
		('SOUTH_AFRICA',		'RESOURCE_INCENSE'),
		('SOUTH_AFRICA',		'RESOURCE_MARBLE'),
		('SOUTH_AFRICA',		'RESOURCE_COCOA'),
		('SOUTH_AFRICA',		'RESOURCE_TEA'),
		('EUROPE',				'RESOURCE_COCOA'),
		('EUROPE',				'RESOURCE_COFFEE'),
		('EUROPE',				'RESOURCE_SUGAR'),
		('EUROPE',				'RESOURCE_TEA'),
		('EUROPE',				'RESOURCE_COTTON'),
		('EUROPE',				'RESOURCE_BANANA'),
		('EUROPE',				'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_COCOA'),
		('ANATOLIA',			'RESOURCE_COFFEE'),
		('ANATOLIA',			'RESOURCE_WINE'),
		('ANATOLIA',			'RESOURCE_BANANA'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('MIDDLE_EAST',			'RESOURCE_COCOA'),
		('MIDDLE_EAST',			'RESOURCE_COFFEE'),
		('MIDDLE_EAST',			'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',			'RESOURCE_WINE'),
		('MIDDLE_EAST',			'RESOURCE_BANANA'),
		('MIDDLE_EAST',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaGiantRegionExclude (Africa Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AfricaGiantRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_BISON'),			
		('WHOLE_MAP',		'RESOURCE_JADE'),			
		('WEST_AFRICA',		'RESOURCE_WHEAT'),
		('WEST_AFRICA',		'RESOURCE_SPICES'),
		('WEST_AFRICA',		'RESOURCE_SILK'),			
		('WEST_AFRICA',		'RESOURCE_INCENSE'),
		('WEST_AFRICA',		'RESOURCE_WINE'),
		('WEST_AFRICA',		'RESOURCE_SILVER'),
		('WEST_AFRICA',		'RESOURCE_PEARLS'),
		('WEST_AFRICA',		'RESOURCE_CITRUS'),
		('WEST_AFRICA',		'RESOURCE_TRUFFLES'),	
		('WEST_AFRICA',		'RESOURCE_TOBACCO'),	
		('SOUTHEN_AFRICA',	'RESOURCE_TOBACCO'),
		('SOUTHEN_AFRICA',	'RESOURCE_SPICES'),
		('SOUTHEN_AFRICA',	'RESOURCE_SILK'),			
		('SOUTHEN_AFRICA',	'RESOURCE_INCENSE'),
		('SOUTHEN_AFRICA',	'RESOURCE_MARBLE'),
		('SOUTHEN_AFRICA',	'RESOURCE_COCOA'),
		('CENTRAL_AFRICA',	'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',	'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',	'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',	'RESOURCE_SILK'),
		('CENTRAL_AFRICA',	'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',	'RESOURCE_WINE'),
		('CENTRAL_AFRICA',	'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',	'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',	'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',	'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',	'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_SILK'),
		('EAST_AFRICA',		'RESOURCE_COPPER'),
		('EAST_AFRICA',		'RESOURCE_SILVER'),
		('EAST_AFRICA',		'RESOURCE_MARBLE'),
		('EAST_AFRICA',		'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_COCOA'),
		('EAST_AFRICA',		'RESOURCE_TRUFFLES'),
		('EAST_AFRICA',		'RESOURCE_GEMS'),			
		('EAST_AFRICA',		'RESOURCE_TOBACCO'),			
		('NORTH_AFRICA',	'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',	'RESOURCE_BANANA'),
		('NORTH_AFRICA',	'RESOURCE_CATTLE'),
		('NORTH_AFRICA',	'RESOURCE_SUGAR'),
		('NORTH_AFRICA',	'RESOURCE_COCOA'),
		('NORTH_AFRICA',	'RESOURCE_TRUFFLES'),
		('NORTH_AFRICA',	'RESOURCE_GEMS'),
		('MIDDLE_EAST',		'RESOURCE_COCOA'),
		('MIDDLE_EAST',		'RESOURCE_COFFEE'),
		('MIDDLE_EAST',		'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',		'RESOURCE_WINE'),
		('MIDDLE_EAST',		'RESOURCE_BANANA'),
		('MIDDLE_EAST',		'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaGiantRegionExclude (South America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('SOUTH_AMERICA_WEST_SOUTHERN',	'RESOURCE_SUGAR'),
		('SOUTH_AMERICA_WEST_NORTHERN',	'RESOURCE_SUGAR'),
		('SOUTH_AMERICA_EAST_SOUTHERN',	'RESOURCE_COTTON'),
		('SOUTH_AMERICA_EAST_SOUTHERN',	'RESOURCE_WINE'),
		('SOUTH_AMERICA_EAST_NORTHERN',	'RESOURCE_COTTON'),
		('SOUTH_AMERICA_EAST_NORTHERN',	'RESOURCE_WINE'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_COCOA'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_CITRUS'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_WINE'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_COTTON'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_PEARLS'),
		('SOUTH_AMERICA_ANTARCTIC',	'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustralasiaGiantRegionExclude (Australia & South East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustralasiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AustralasiaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('AUSTRALIA',				'RESOURCE_HORSE'),
		('AUSTRALIA',				'RESOURCE_SPICES'),
		('AUSTRALIA',				'RESOURCE_SILK'),
		('AUSTRALIA',				'RESOURCE_SUGAR'),
		('AUSTRALIA',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_COCOA'),
		('AUSTRALIA',				'RESOURCE_COFFEE'),
		('AUSTRALIA',				'RESOURCE_JADE'),
		('AUSTRALIA',				'RESOURCE_PERFUME'),
		('AUSTRALIA',				'RESOURCE_LAPIS');	
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndianOceanRegionExclude (Indian Ocean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndianOceanRegionExclude(Type, Resource);
INSERT INTO Resource_IndianOceanRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_HORSE'),
		('AUSTRALIA',				'RESOURCE_SPICES'),
		('AUSTRALIA',				'RESOURCE_SILK'),
		('AUSTRALIA',				'RESOURCE_SUGAR'),
		('AUSTRALIA',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_COCOA'),
		('AUSTRALIA',				'RESOURCE_COFFEE'),
		('AUSTRALIA',				'RESOURCE_JADE'),
		('AUSTRALIA',				'RESOURCE_PERFUME'),
		('AUSTRALIA',				'RESOURCE_LAPIS'),
		('SOUTHEAST_ASIA',			'RESOURCE_OLIVE'),
		('SOUTHEAST_ASIA',			'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',			'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',			'RESOURCE_SPICES'),
		('SOUTHEAST_ASIA',			'RESOURCE_SUGAR'),
		('SOUTHEAST_ASIA',			'RESOURCE_INCENSE'),
		('SOUTHEAST_ASIA',			'RESOURCE_BISON'),
		('SOUTHEAST_ASIA',			'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_PEARLS'),
		('AFRICA',					'RESOURCE_MARBLE'),
		('AFRICA',					'RESOURCE_SILK'),
		('AFRICA',					'RESOURCE_SUGAR'),
		('AFRICA',					'RESOURCE_WINE'),
		('AFRICA',					'RESOURCE_INCENSE'),
		('AFRICA',					'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_CITRUS'),
		('AFRICA',					'RESOURCE_TRUFFLES'),
		('AFRICA',					'RESOURCE_BISON'),
		('AFRICA',					'RESOURCE_PERFUME'),
		('AFRICA',					'RESOURCE_JADE'),
		('AFRICA',					'RESOURCE_TEA'),
		('INDIA',					'RESOURCE_WINE'),
		('INDIA',					'RESOURCE_INCENSE'),
		('INDIA',					'RESOURCE_FUR'),
		('INDIA',					'RESOURCE_TRUFFLES'),
		('INDIA',					'RESOURCE_BISON'),
		('INDIA',					'RESOURCE_COCOA'),
		('INDIA',					'RESOURCE_TOBACCO'),
		('INDIA',					'RESOURCE_OLIVE'),
		('MIDDLE_EAST',				'RESOURCE_COCOA'),
		('MIDDLE_EAST',				'RESOURCE_COFFEE'),
		('MIDDLE_EAST',				'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',				'RESOURCE_WINE'),
		('MIDDLE_EAST',				'RESOURCE_BANANA'),
		('MIDDLE_EAST',				'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasGiantRegionExclude (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AmericasGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON'),
		('HAWAII',					'RESOURCE_FUR'),
		('HAWAII',					'RESOURCE_TRUFFLES'),
		('SOUTH_AMERICA',			'RESOURCE_FUR'),
		('SOUTH_AMERICA',			'RESOURCE_TRUFFLES'),
		('SOUTH_AMERICA',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaGiantRegionExclude (India Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_IndiaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_BANANA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralHugeRegionExclude (South & Central America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralHugeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaCentralHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralGiantRegionExclude (South & Central America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaCentralGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ScotlandIrelandHugeRegionExclude (Scotland & Ireland Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ScotlandIrelandHugeRegionExclude(Type, Resource);
INSERT INTO Resource_ScotlandIrelandHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_BANANA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaLargeRegionExclude (South America Large)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaLargeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAsiaHugeRegionExclude (South Asia Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAsiaHugeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAsiaHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificGiantRegionExclude (South Pacific Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthPacificGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_HORSE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_LAPIS'),
		('WHOLE_MAP',				'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaGiantRegionExclude (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAmericaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaHugeRegionExclude (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaHugeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAmericaHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON');
--==========================================================================================================================
--==========================================================================================================================
