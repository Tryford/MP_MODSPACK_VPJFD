--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
-- Technologies
-------------------------------------
-- ANCIENT
-------------------------------------	
UPDATE Technologies
SET Innovations = 0
WHERE Type IN ('TECH_ARCHERY', 'TECH_ANIMAL_HUSBANDRY', 'TECH_MINING', 'TECH_POTTERY', 'TECH_AGRICULTURE', 'TECH_JFD_MYSTICISM')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_CALENDAR')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_BRONZE_WORKING')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_MASONRY', 'TECH_WRITING', 'TECH_TRAPPING')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_SAILING', 'TECH_WRITING', 'TECH_THE_WHEEL')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- CLASSICAL
-------------------------------------
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_ENGINEERING')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_CURRENCY', 'TECH_OPTICS', 'TECH_JFD_CODE_OF_LAWS', 'TECH_CONSTRUCTION', 'TECH_HORSEBACK_RIDING', 'TECH_IRON_WORKING', 'TECH_PHILOSOPHY')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_JFD_MERCENARIES', 'TECH_MATHEMATICS', 'TECH_DRAMA')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_JFD_PRIESTHOOD')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- MEDIEVAL
-------------------------------------	
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_CIVIL_SERVICE')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_JFD_MEDICINE', 'TECH_CHIVALRY', 'TECH_JFD_NOBILITY', 'TECH_EDUCATION', 'TECH_GUILDS', 'TECH_MACHINERY', 'TECH_PHYSICS', 'TECH_COMPASS', 'TECH_JFD_RELIGIOUS_ORDERS')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_METAL_CASTING', 'TECH_STEEL')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_THEOLOGY')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- RENAISSANCE
-------------------------------------	
UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_EE_EXPLORATION', 'TECH_METALLURGY', 'TECH_ACOUSTICS', 'TECH_CHEMISTRY', 'TECH_BANKING', 'TECH_PRINTING_PRESS', 'TECH_GUNPOWDER');

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_ARCHITECTURE', 'TECH_JFD_JURISPRUDENCE', 'TECH_EE_SOVEREIGNTY', 'TECH_ASTRONOMY');
-------------------------------------
-- ENLIGHTENMENT
-------------------------------------	
UPDATE Technologies
SET Innovations = 30
WHERE Type IN ('TECH_NAVIGATION');

UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_FERTILIZER', 'TECH_EE_NATURAL_HISTORY');

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_EE_FLINTLOCK', 'TECH_EE_HUMANISM');

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_ECONOMICS', 'TECH_EE_IMPERIALISM', 'TECH_EE_MANUFACTURING', 'TECH_SCIENTIFIC_THEORY', 'TECH_EE_FORTIFICATION', 'TECH_EE_WARSHIPS');
-------------------------------------
-- INDUSTRIAL
-------------------------------------	
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_EE_ARMOUR_PLATING', 'TECH_MILITARY_SCIENCE', 'TECH_BIOLOGY');

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_DYNAMITE', 'TECH_ELECTRICITY', 'TECH_INDUSTRIALIZATION', 'TECH_RIFLING', 'TECH_EE_ROMANTICISM', 'TECH_STEAM_POWER');

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_JFD_NATIONALISM');

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_ARCHAEOLOGY');
-------------------------------------
-- MODERN
-------------------------------------	
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_BALLISTICS');

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_REPLACEABLE_PARTS', 'TECH_PLASTIC', 'TECH_REFRIGERATION', 'TECH_RAILROAD', 'TECH_RADIO', 'TECH_ELECTRONICS', 'TECH_COMBUSTION');

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_FLIGHT');
-------------------------------------
-- ATOMIC
-------------------------------------	
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_COMBINED_ARMS');

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_ATOMIC_THEORY', 'TECH_COMPUTERS', 'TECH_ECOLOGY', 'TECH_PENICILIN', 'TECH_RADAR', 'TECH_ROCKETRY');

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_NUCLEAR_FISSION');
-------------------------------------
-- INFORMATION
-------------------------------------	
UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_STEALTH');

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_PARTICLE_PHYSICS', 'TECH_MOBILE_TACTICS', 'TECH_NUCLEAR_FUSION', 'TECH_NANOTECHNOLOGY', 'TECH_TELECOM', 'TECH_ROBOTICS', 'TECH_LASERS');

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_ADVANCED_BALLISTICS', 'TECH_GLOBALIZATION');

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_INTERNET', 'TECH_SATELLITES');
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------	
-- ANCIENT
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitKilled,				IsBarbarian)
SELECT	'TECH_BRONZE_WORKING',		'TXT_KEY_JFD_INNOVATIONS_BRONZE_WORKING_HELP',		6,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	PantheonFounded)
SELECT	'TECH_CALENDAR',			'TXT_KEY_JFD_INNOVATIONS_CALENDAR_HELP',			30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsAny,		IsProduced,	  IsNotWonder)
SELECT	'TECH_MASONRY',				'TXT_KEY_JFD_INNOVATIONS_MASONRY_HELP',				10,				1,						1,			1,			  1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CityFounded,			IsAdjacentTerrainType)
SELECT	'TECH_SAILING',				'TXT_KEY_JFD_INNOVATIONS_SAILING_HELP',				15,				1,						'TERRAIN_COAST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	TileAcquired,			ImprovementType)
SELECT	'TECH_TRAPPING',			'TXT_KEY_JFD_INNOVATIONS_TRAPPING_HELP',			10,				1,						'IMPROVEMENT_CAMP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_THE_WHEEL',			'TXT_KEY_JFD_INNOVATIONS_THE_WHEEL_HELP',			15,				1,						'UNITCLASS_CARAVAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CivilizationMet,		IsMajor)
SELECT	'TECH_WRITING',				'TXT_KEY_JFD_INNOVATIONS_WRITING_HELP',				15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- CLASSICAL
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsNationalWonder)
SELECT	'TECH_DRAMA',				'TXT_KEY_JFD_INNOVATIONS_DRAMA_HELP',				15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	PolicyAdopted,			IsAny)
SELECT	'TECH_JFD_CODE_OF_LAWS',	'TXT_KEY_JFD_INNOVATIONS_JFD_CODE_OF_LAWS_HELP',	10,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsProduced,					BuildingClassType)
SELECT	'TECH_CONSTRUCTION',		'TXT_KEY_JFD_INNOVATIONS_CONSTRUCTION_HELP',		10,				1,						1,							'BUILDINGCLASS_WALLS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_CURRENCY',			'TXT_KEY_JFD_INNOVATIONS_CURRENCY_HELP',			10,				1,						'BUILDINGCLASS_CARAVANSARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType)
SELECT	'TECH_ENGINEERING',			'TXT_KEY_JFD_INNOVATIONS_ENGINEERING_HELP',			6,				1,						'IMPROVEMENT_LUMBERMILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType,				ResourceType)
SELECT	'TECH_HORSEBACK_RIDING',	'TXT_KEY_JFD_INNOVATIONS_HORSEBACK_RIDING_HELP',	10,				1,						'IMPROVEMENT_PASTURE',			'RESOURCE_HORSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType,				ResourceType)
SELECT	'TECH_IRON_WORKING',		'TXT_KEY_JFD_INNOVATIONS_IRON_WORKING_HELP',		10,				1,						'IMPROVEMENT_MINE',				'RESOURCE_IRON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsProduced,						BuildingClassType)
SELECT	'TECH_MATHEMATICS',			'TXT_KEY_JFD_INNOVATIONS_MATHEMATICS_HELP',			15,				1,						1,								'BUILDINGCLASS_WATERMILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	WarDeclaredTo,			IsAny)
SELECT	'TECH_JFD_MERCENARIES',		'TXT_KEY_JFD_INNOVATIONS_JFD_MERCENARIES_HELP',		15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType)
SELECT	'TECH_OPTICS',				'TXT_KEY_JFD_INNOVATIONS_OPTICS_HELP',				10,				1,						'IMPROVEMENT_FISHING_BOATS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CivilizationMet,		IsMinor)
SELECT	'TECH_PHILOSOPHY',			'TXT_KEY_JFD_INNOVATIONS_PHILOSOPHY_HELP',			10,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ReligionFounded)
SELECT	'TECH_JFD_PRIESTHOOD',		'TXT_KEY_JFD_INNOVATIONS_JFD_PRIESTHOOD_HELP',		30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- MEDIEVAL
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitCombatType)
SELECT	'TECH_CHIVALRY',			'TXT_KEY_JFD_INNOVATIONS_CHIVALRY_HELP',			10,				1,						'UNITCOMBAT_MOUNTED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CitizenBorn,			Population)
SELECT	'TECH_CIVIL_SERVICE',		'TXT_KEY_JFD_INNOVATIONS_CIVIL_SERVICE_HELP',		6,				1,						10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			DomainType)
SELECT	'TECH_COMPASS',				'TXT_KEY_JFD_INNOVATIONS_COMPASS_HELP',				10,				1,						'DOMAIN_SEA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_EDUCATION',			'TXT_KEY_JFD_INNOVATIONS_EDUCATION_HELP',			10,				1,						'BUILDINGCLASS_LIBRARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_GUILDS',				'TXT_KEY_JFD_INNOVATIONS_GUILDS_HELP',				10,				1,						'BUILDINGCLASS_MARKET'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_MACHINERY',			'TXT_KEY_JFD_INNOVATIONS_MACHINERY_HELP',			10,				1,						'UNITCLASS_COMPOSITE_BOWMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_JFD_MEDICINE',		'TXT_KEY_JFD_INNOVATIONS_JFD_MEDICINE_HELP',		10,				1,						'BUILDINGCLASS_JFD_HERBALIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_METAL_CASTING',		'TXT_KEY_JFD_INNOVATIONS_METAL_CASTING_HELP',		15,				1,						'UNITCLASS_SWORDSMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitKilled,				UnitCombatType)
SELECT	'TECH_JFD_NOBILITY',		'TXT_KEY_JFD_INNOVATIONS_JFD_NOBILITY_HELP',		10,				1,						'UNITCOMBAT_MOUNTED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_PHYSICS',				'TXT_KEY_JFD_INNOVATIONS_PHYSICS_HELP',				10,				1,						'UNITCLASS_CATAPULT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			IsAny,				IsFaithSpent)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS','TXT_KEY_JFD_INNOVATIONS_JFD_RELIGIOUS_ORDERS_HELP',10,				1,						1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_STEEL',				'TXT_KEY_JFD_INNOVATIONS_STEEL_HELP',				15,				1,						'BUILDINGCLASS_FORGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ReligionEnhanced)
SELECT	'TECH_THEOLOGY',			'TXT_KEY_JFD_INNOVATIONS_THEOLOGY_HELP',			30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- RENAISSANCE
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsAny,				IsFaithSpent)
SELECT	'TECH_ACOUSTICS',			'TXT_KEY_JFD_INNOVATIONS_ACOUSTICS_HELP',			10,				1,						1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsWorldWonder)
SELECT	'TECH_ARCHITECTURE',		'TXT_KEY_JFD_INNOVATIONS_ARCHITECTURE_HELP',		15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CityFounded,			IsAdjacentPlotType)
SELECT	'TECH_ASTRONOMY',			'TXT_KEY_JFD_INNOVATIONS_ASTRONOMY_HELP',			15,				1,						'PLOT_MOUNTAIN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	IsGoldSpent)
SELECT	'TECH_BANKING',				'TXT_KEY_JFD_INNOVATIONS_BANKING_HELP',				10,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_CHEMISTRY',			'TXT_KEY_JFD_INNOVATIONS_CHEMISTRY_HELP',			10,				1,						'UNITCLASS_TREBUCHET'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_EE_EXPLORATION',		'TXT_KEY_JFD_INNOVATIONS_EE_EXPLORATION_HELP',		10,				1,						'UNITCLASS_CARAVEL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_GUNPOWDER',			'TXT_KEY_JFD_INNOVATIONS_GUNPOWDER_HELP',			10,				1,						'UNITCLASS_LONGSWORDSMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_JFD_JURISPRUDENCE',	'TXT_KEY_JFD_INNOVATIONS_JFD_JURISPRUDENCE_HELP',	15,				1,						'UNITCLASS_JFD_GREAT_MAGISTRATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_METALLURGY',			'TXT_KEY_JFD_INNOVATIONS_METALLURGY_HELP',			10,				1,						'BUILDINGCLASS_ARMORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_PRINTING_PRESS',		'TXT_KEY_JFD_INNOVATIONS_PRINTING_PRESS_HELP',		10,				1,						'BUILDINGCLASS_WORKSHOP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_SOVEREIGNTY',		'TXT_KEY_JFD_INNOVATIONS_EE_SOVEREIGNTY_HELP',		15,				1,						'UNITCLASS_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_SOVEREIGNTY');
-------------------------------------
-- ENLIGHTENMENT
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_ECONOMICS',			'TXT_KEY_JFD_INNOVATIONS_ECONOMICS_HELP',			15,				1,						'UNITCLASS_MERCHANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CitizenBorn,			Population)
SELECT	'TECH_FERTILIZER',			'TXT_KEY_JFD_INNOVATIONS_FERTILIZER_HELP',			6,				1,						18
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_EE_FLINTLOCK',		'TXT_KEY_JFD_INNOVATIONS_EE_FLINTLOCK_HELP',		10,				1,						'UNITCLASS_MUSKETMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_FORTIFICATION',	'TXT_KEY_JFD_INNOVATIONS_EE_FORTIFICATION_HELP',	15,				1,						'UNITCLASS_GREAT_GENERAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FORTIFICATION');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_HUMANISM',			'TXT_KEY_JFD_INNOVATIONS_EE_HUMANISM_HELP',			10,				1,						'UNITCLASS_ARTIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_HUMANISM');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_HUMANISM',			NULL,												10,				1,						'UNITCLASS_MUSICIAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_HUMANISM');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_HUMANISM',			NULL,												10,				1,						'UNITCLASS_WRITER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_HUMANISM');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CityFounded,			IsForeignContinent)
SELECT	'TECH_EE_IMPERIALISM',		'TXT_KEY_JFD_INNOVATIONS_EE_IMPERIALISM_HELP',		15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_MANUFACTURING',	'TXT_KEY_JFD_INNOVATIONS_EE_MANUFACTURING_HELP',	15,				1,						'UNITCLASS_ENGINEER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_MANUFACTURING');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitPromoted,			UnitCombatType)
SELECT	'TECH_EE_NATURAL_HISTORY',	'TXT_KEY_JFD_INNOVATIONS_EE_NATURAL_HISTORY_HELP',	6,				1,						'UNITCOMBAT_RECON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_NATURAL_HISTORY');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	TileTraversed,			TerrainType)
SELECT	'TECH_NAVIGATION',			'TXT_KEY_JFD_INNOVATIONS_NAVIGATION_HELP',			1,				1,						'TERRAIN_OCEAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_SCIENTIFIC_THEORY',	'TXT_KEY_JFD_INNOVATIONS_SCIENTIFIC_THEORY_HELP',	15,				1,						'UNITCLASS_SCIENTIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_EE_WARSHIPS',			'TXT_KEY_JFD_INNOVATIONS_EE_WARSHIPS_HELP',			15,				1,						'UNITCLASS_GREAT_ADMIRAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_WARSHIPS');
-------------------------------------
-- INDUSTRIAL
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_ARCHAEOLOGY',			'TXT_KEY_JFD_INNOVATIONS_ARCHAEOLOGY_HELP',			30,				1,						'BUILDINGCLASS_HERMITAGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitUpgraded,			DomainType)
SELECT	'TECH_EE_ARMOUR_PLATING',	'TXT_KEY_JFD_INNOVATIONS_EE_ARMOUR_PLATING_HELP',	6,				1,						'DOMAIN_SEA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	CitizenBorn,			Population)
SELECT	'TECH_BIOLOGY',				'TXT_KEY_JFD_INNOVATIONS_BIOLOGY_HELP',				6,				1,						25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_DYNAMITE',			'TXT_KEY_JFD_INNOVATIONS_DYNAMITE_HELP',			10,				1,						'UNITCLASS_CANNON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_ELECTRICITY',			'TXT_KEY_JFD_INNOVATIONS_ELECTRICITY_HELP',			10,				1,						'BUILDINGCLASS_FACTORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_INDUSTRIALIZATION',	'TXT_KEY_JFD_INNOVATIONS_INDUSTRIALIZATION_HELP',	10,				1,						'BUILDINGCLASS_WINDMILL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitPromoted)
SELECT	'TECH_MILITARY_SCIENCE',	'TXT_KEY_JFD_INNOVATIONS_MILITARY_SCIENCE_HELP',	6,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_RIFLING',				'TXT_KEY_JFD_INNOVATIONS_RIFLING_HELP',				10,				1,						'UNITCLASS_MUSKETMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_EE_ROMANTICISM',		'TXT_KEY_JFD_INNOVATIONS_EE_ROMANTICISM_HELP',		10,				1,						'UNITCLASS_ARCHAEOLOGIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	PolicyAdopted,			IsFinisher)
SELECT	'TECH_JFD_NATIONALISM',		'TXT_KEY_JFD_INNOVATIONS_JFD_NATIONALISM_HELP',		15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_STEAM_POWER',			'TXT_KEY_JFD_INNOVATIONS_STEAM_POWER_HELP',			10,				1,						'BUILDINGCLASS_SEAPORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- MODERN
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_BALLISTICS',			'TXT_KEY_JFD_INNOVATIONS_BALLISTICS_HELP',			6,				1,						'UNITCLASS_ARTILLERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_BALLISTICS',			NULL,												6,				1,						'UNITCLASS_GATLINGGUN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_COMBUSTION',			'TXT_KEY_JFD_INNOVATIONS_COMBUSTION_HELP',			10,				1,						'BUILDINGCLASS_FACTORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 0);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_COMBUSTION',			'TXT_KEY_JFD_INNOVATIONS_COMBUSTION_HELP_POWER',	10,				1,						'BUILDINGCLASS_JFD_COAL_PLANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_COMBUSTION',			NULL,												10,				1,						'BUILDINGCLASS_JFD_OIL_REFINERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			DomainType)
SELECT	'TECH_ELECTRONICS',			'TXT_KEY_JFD_INNOVATIONS_ELECTRONICS_HELP',			10,				1,						'DOMAIN_SEA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_FLIGHT',				'TXT_KEY_JFD_INNOVATIONS_FLIGHT_HELP',				15,				1,						'UNITCLASS_ENGINEER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	GreatPersonExpended,	UnitClassType)
SELECT	'TECH_FLIGHT',				NULL,												15,				1,						'UNITCLASS_SCIENTIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_PLASTIC',				'TXT_KEY_JFD_INNOVATIONS_PLASTICS_HELP',			10,				1,						'RESOURCE_OIL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType)
SELECT	'TECH_RADIO',				'TXT_KEY_JFD_INNOVATIONS_RADIO_HELP',				10,				1,						'IMPROVEMENT_ARCHAEOLOGICAL_DIG'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_RAILROAD',			'TXT_KEY_JFD_INNOVATIONS_RAILROAD_HELP',			10,				1,						'UNITCLASS_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 0);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_RAILROAD',			'TXT_KEY_JFD_INNOVATIONS_RAILROAD_HELP',			10,				1,						'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ImprovementBuilt,		ImprovementType,				ResourceType)
SELECT	'TECH_REFRIGERATION',		'TXT_KEY_JFD_INNOVATIONS_REFRIGERATION_HELP',		10,				1,						'IMPROVEMENT_MINE',				'RESOURCE_ALUMINUM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_REPLACEABLE_PARTS',	'TXT_KEY_JFD_INNOVATIONS_REPLACEABLE_PARTS_HELP',	10,				1,						'UNITCLASS_RIFLEMAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- ATOMIC
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_ATOMIC_THEORY',		'TXT_KEY_JFD_INNOVATIONS_ATOMIC_THEORY_HELP',		10,				1,						'BUILDINGCLASS_LABORATORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitUpgraded,			IsAny)
SELECT	'TECH_COMBINED_ARMS',		'TXT_KEY_JFD_INNOVATIONS_COMBINED_ARMS_HELP',		6,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_COMPUTERS',			'TXT_KEY_JFD_INNOVATIONS_COMPUTERS_HELP',			10,				1,						'BUILDINGCLASS_AIRPORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_ECOLOGY',				'TXT_KEY_JFD_INNOVATIONS_ECOLOGY_HELP',				10,				1,						'BUILDINGCLASS_MEDICAL_LAB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ProjectFinished,		ProjectType)
SELECT	'TECH_NUCLEAR_FISSION',		'TXT_KEY_JFD_INNOVATIONS_NUCLEAR_FISSION_HELP',		30,				1,						'PROJECT_MANHATTAN_PROJECT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_PENICILIN',			'TXT_KEY_JFD_INNOVATIONS_PENICILLIN_HELP',			10,				1,						'BUILDINGCLASS_HOSPITAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitKilled,				DomainType)
SELECT	'TECH_RADAR',				'TXT_KEY_JFD_INNOVATIONS_RADAR_HELP',				10,				1,						'DOMAIN_AIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_ROCKETRY',			'TXT_KEY_JFD_INNOVATIONS_ROCKETRY_HELP',			10,				1,						'UNITCLASS_ANTI_AIRCRAFT_GUN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
-------------------------------------
-- INFORMATION
-------------------------------------	
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	NuclearBombDenoted)
SELECT	'TECH_ADVANCED_BALLISTICS',	'TXT_KEY_JFD_INNOVATIONS_ADVANCED_BALLISTICS_HELP',	15,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ResolutionPassed,		ResolutionType)
SELECT	'TECH_GLOBALIZATION',		'TXT_KEY_JFD_INNOVATIONS_GLOBALIZATION_HELP',		15,				1,						'RESOLUTION_WORLD_IDEOLOGY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ResolutionPassed,		ResolutionType)
SELECT	'TECH_GLOBALIZATION',		NULL,												15,				1,						'RESOLUTION_WORLD_RELIGION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	TechResearched,			ReqTechType)
SELECT	'TECH_INTERNET',			'TXT_KEY_JFD_INNOVATIONS_THE_INTERNET_HELP',		30,				1,						'TECH_COMPUTERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitKilled,				UnitClassType)
SELECT	'TECH_LASERS',				'TXT_KEY_JFD_INNOVATIONS_LASERS_HELP',				10,				1,						'UNITCLASS_MOBILE_SAM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitKilled,				UnitClassType)
SELECT	'TECH_LASERS',				NULL,												10,				1,						'UNITCLASS_ROCKET_ARTILLERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_MOBILE_TACTICS',		'TXT_KEY_JFD_INNOVATIONS_MOBILE_TACTICS_HELP',		10,				1,						'UNITCLASS_MARINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_PARTICLE_PHYSICS',	'TXT_KEY_JFD_INNOVATIONS_PARTICLE_PHYSICS_HELP',	10,				1,						'UNITCLASS_SS_BOOSTER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_PARTICLE_PHYSICS',	NULL,												10,				1,						'UNITCLASS_SS_COCKPIT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_PARTICLE_PHYSICS',	NULL,												10,				1,						'UNITCLASS_SS_STASIS_CHAMBER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_NUCLEAR_FUSION',		'TXT_KEY_JFD_INNOVATIONS_NUCLEAR_FUSION_HELP',		10,				1,						'BUILDINGCLASS_NUCLEAR_PLANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_NANOTECHNOLOGY',		'TXT_KEY_JFD_INNOVATIONS_NANOTECHNOLOGY_HELP',		10,				1,						'BUILDINGCLASS_SPACESHIP_FACTORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_ROBOTICS',			'TXT_KEY_JFD_INNOVATIONS_ROBOTICS_HELP',			10,				1,						'UNITCLASS_MOBILE_SAM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_ROBOTICS',			NULL,												10,				1,						'UNITCLASS_ROCKET_ARTILLERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	ProjectFinished,		ProjectType)
SELECT	'TECH_SATELLITES',			'TXT_KEY_JFD_INNOVATIONS_SATELLITES_HELP',			30,				1,						'PROJECT_APOLLO_PROGRAM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			DomainType)
SELECT	'TECH_STEALTH',				'TXT_KEY_JFD_INNOVATIONS_STEALTH_HELP',				6,				1,						'DOMAIN_AIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_TELECOM',				'TXT_KEY_JFD_INNOVATIONS_TELECOMMUNICATIONS_HELP',	10,				1,						'BUILDINGCLASS_BROADCAST_TOWER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================