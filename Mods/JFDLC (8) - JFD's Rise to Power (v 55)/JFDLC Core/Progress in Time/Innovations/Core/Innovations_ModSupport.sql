--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Technologies
-------------------------------------
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT 
--==========================================================================================================================
-- Technologies
-------------------------------------
UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_JFD_NOBILITY')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_CIVIL_SERVICE')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------
DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_BANKING' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	InvestmentMade,			IsAny)
SELECT	'TECH_BANKING',				'TXT_KEY_JFD_INNOVATIONS_BANKING_HELP_INVESTMENTS',				10,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_CIVIL_SERVICE' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_CIVIL_SERVICE',		'TXT_KEY_JFD_INNOVATIONS_CIVIL_SERVICE_HELP_PROVINCES',			15,				1,						'BUILDINGCLASS_JFD_MANOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_CIVIL_SERVICE',		NULL,															15,				1,						'BUILDINGCLASS_JFD_MANSION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_GUILDS' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementChanged,		ImprovementType)
SELECT	'TECH_GUILDS',				'TXT_KEY_JFD_INNOVATIONS_GUILDS_HELP_TRADING_POSTS',			10,				1,						'IMPROVEMENT_JFD_TRADING_POST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_EE_IMPERIALISM' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	CityFounded,			IsColony)
SELECT	'TECH_EE_IMPERIALISM',		'TXT_KEY_JFD_INNOVATIONS_EE_IMPERIALISM_COLONIES_HELP',			15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_JFD_NOBILITY' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	LegislatureFormed)
SELECT	'TECH_JFD_NOBILITY',		'TXT_KEY_JFD_INNOVATIONS_JFD_NOBILITY_HELP_REFORMS',			30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_STEAM_POWER' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_STEAM_POWER',			'TXT_KEY_JFD_INNOVATIONS_STEAM_POWER_HELP_POWER',				10,				1,						'BUILDINGCLASS_JFD_BLAST_FURNACE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_STEAM_POWER',			NULL,															10,				1,						'BUILDINGCLASS_FACTORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Technologies
-------------------------------------	
UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_CHEMISTRY', 'TECH_ELECTRICITY')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------
DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_GUNPOWDER' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_GUNPOWDER',			'TXT_KEY_JFD_INNOVATIONS_GUNPOWDER_HELP_EXPLORATION',			10,				1,						'RESOURCE_JFD_SULFUR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_ELECTRICITY' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_ELECTRICITY',			'TXT_KEY_JFD_INNOVATIONS_ELECTRICITY_HELP_EXPLORATION',			10,				1,						'RESOURCE_JFD_RUBBER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_EE_ROMANTICISM' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_EE_ROMANTICISM',		'TXT_KEY_JFD_INNOVATIONS_EE_ROMANTICISM_HELP_EXPLORATION',		10,				1,						'UNITCLASS_JFD_ADVENTURER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- JFD PROGRESS IN TIME
--==========================================================================================================================
-- Technologies
-------------------------------------
UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_CALENDAR')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 17
WHERE Type = 'TECH_JFD_CIVIL_PLANNING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 13
WHERE Type = 'TECH_INDUSTRIALIZATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 5
WHERE Type IN ('TECH_JFD_MILITARY', 'TECH_JFD_MILLING')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_JFD_MILITARY', 'TECH_ARCHERY', 'TECH_POTTERY', 'TECH_ANIMAL_HUSBANDRY', 'TECH_BRONZE_WORKING', 'TECH_THE_WHEEL')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 16
WHERE Type = 'TECH_JFD_NOBILITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET Innovations = 15
WHERE Type = 'TECH_JFD_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);		

UPDATE Technologies
SET Innovations = 12
WHERE Type = 'TECH_JFD_SCIENTIFIC_THEORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 3
WHERE Type = 'TECH_JFD_SHIPBUILDING'				
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 14
WHERE Type = 'TECH_EE_SOVEREIGNTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 2
WHERE Type IN ('TECH_JFD_TRADE', 'TECH_JFD_GAMES', 'TECH_JFD_PATRONAGE')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

UPDATE Technologies
SET Innovations = 1
WHERE Type IN ('TECH_JFD_MYSTICISM', 'TECH_WRITING')					
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TileAcquired,			ImprovementType)
SELECT	'TECH_ANIMAL_HUSBANDRY',	'TXT_KEY_JFD_INNOVATIONS_ANIMAL_HUSBANDRY_HELP_PROGRESS',		10,				1,						'IMPROVEMENT_PASTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	UnitKilled,				UnitCombatType)
SELECT	'TECH_ARCHERY',				'TXT_KEY_JFD_INNOVATIONS_ARCHERY_HELP_PROGRESS',				10,				1,						'UNITCOMBAT_ARCHER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_BRONZE_WORKING' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ImprovementType)
SELECT	'TECH_BRONZE_WORKING',		'TXT_KEY_JFD_INNOVATIONS_BRONZE_WORKING_HELP_PROGRESS',			10,				1,						'IMPROVEMENT_MINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_CALENDAR' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TileAcquired,			ImprovementType)
SELECT	'TECH_CALENDAR',			'TXT_KEY_JFD_INNOVATIONS_CALENDAR_HELP_PROGRESS',				10,				1,						'IMPROVEMENT_PLANTATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_JFD_CIVIL_PLANNING' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TechResearched,			EraType)
SELECT	'TECH_JFD_CIVIL_PLANNING',	'TXT_KEY_JFD_INNOVATIONS_JFD_CIVIL_PLANNING_HELP_PROGRESS',		5,				1,						'ERA_ANCIENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);		

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_JFD_GAMES',			'TXT_KEY_JFD_INNOVATIONS_JFD_GAMES_HELP_PROGRESS',				15,				1,						'BUILDINGCLASS_CIRCUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_INDUSTRIALIZATION' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TechResearched,			EraType)
SELECT	'TECH_INDUSTRIALIZATION',	'TXT_KEY_JFD_INNOVATIONS_JFD_INDUSTRIALIZATION_HELP_PROGRESS',	5,				1,						'ERA_ENLIGHTENMENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	UnitKilled,				UnitCombatType)
SELECT	'TECH_JFD_MILITARY',		'TXT_KEY_JFD_INNOVATIONS_JFD_MILITARY_HELP_PROGRESS',			10,				1,						'UNITCOMBAT_MELEE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	CitizenBorn,			Population)
SELECT	'TECH_JFD_MILLING',			'TXT_KEY_JFD_INNOVATIONS_JFD_MILLING_HELP_PROGRESS',			6,				1,						10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	NaturalWonderDiscovered)
SELECT	'TECH_JFD_MYSTICISM',		'TXT_KEY_JFD_INNOVATIONS_JFD_MYSTICISM_HELP_PROGRESS',			30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_JFD_NOBILITY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TechResearched,			EraType)
SELECT	'TECH_JFD_NOBILITY',		'TXT_KEY_JFD_INNOVATIONS_JFD_NOBILITY_HELP_PROGRESS',			5,				1,						'ERA_CLASSICAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);		

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TechResearched,			EraType)
SELECT	'TECH_JFD_PATRONAGE',		'TXT_KEY_JFD_INNOVATIONS_JFD_PATRONAGE_HELP_PROGRESS',			5,				1,						'ERA_MEDIEVAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ImprovementType)
SELECT	'TECH_POTTERY',				'TXT_KEY_JFD_INNOVATIONS_POTTERY_HELP_PROGRESS',				10,				1,						'IMPROVEMENT_FARM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_JFD_SCIENTIFIC_THEORY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,						Help,															ScienceBoost,	TechResearched,		EraType)
SELECT	'TECH_JFD_SCIENTIFIC_THEORY',	'TXT_KEY_JFD_INNOVATIONS_JFD_SCIENTIFIC_THEORY_HELP_PROGRESS',	8,				1,					'ERA_RENAISSANCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	UnitTrained,			DomainType)
SELECT	'TECH_JFD_SHIPBUILDING',	'TXT_KEY_JFD_INNOVATIONS_JFD_SHIPBUILDING_HELP_PROGRESS',		10,				1,						'DOMAIN_SEA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_EE_SOVERIEGNTY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	TechResearched,			EraType)
SELECT	'TECH_EE_SOVERIEGNTY',		'TXT_KEY_JFD_INNOVATIONS_JFD_SOVERIEGNTY_HELP_PROGRESS',		5,				1,						'ERA_RENAISSANCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	CivilizationMet,		IsMajor)
SELECT	'TECH_JFD_TRADE',			'TXT_KEY_JFD_INNOVATIONS_JFD_TRADE_HELP_PROGRESS',				15,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_THE_WHEEL' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_THE_WHEEL',			'TXT_KEY_JFD_INNOVATIONS_WHEEL_HELP_PROGRESS',					10,				1,						'RESOURCE_COW'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_THE_WHEEL',			NULL,															10,				1,						'RESOURCE_SHEEP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_WRITING' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1) 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,															ScienceBoost,	PantheonFounded)
SELECT	'TECH_WRITING',				'TXT_KEY_JFD_INNOVATIONS_WRITING_HELP_PROGRESS',				30,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Technologies
-------------------------------------	
UPDATE Technologies
SET Innovations = 3
WHERE Type IN ('TECH_ARCHAEOLOGY', 'TECH_INDUSTRIALIZATION')					
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
-------------------------------------
-- Technology_JFD_Innovations
-------------------------------------
DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_ARCHAEOLOGY' AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,													ScienceBoost,	BuildingConstructed,	BuildingClassType)
SELECT	'TECH_ARCHAEOLOGY',			'TXT_KEY_JFD_INNOVATIONS_ARCHAEOLOGY_HELP_EE',			10,				1,						'BUILDINGCLASS_MUSEUM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_DYNAMITE' AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,													ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_DYNAMITE',			'TXT_KEY_JFD_INNOVATIONS_DYNAMITE_HELP_EE',				10,				1,						'UNITCLASS_EE_FIELD_GUN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_INDUSTRIALIZATION' AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,													ScienceBoost,	ImprovementBuilt,		ResourceType)
SELECT	'TECH_INDUSTRIALIZATION',	'TXT_KEY_JFD_INNOVATIONS_INDUSTRIALIZATION_HELP_EE',	6,				1,						'RESOURCE_COAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

DELETE FROM Technology_JFD_Innovations WHERE TechType = 'TECH_RIFLING' AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_JFD_Innovations
		(TechType,					Help,												ScienceBoost,	UnitTrained,			UnitClassType)
SELECT	'TECH_RIFLING',				'TXT_KEY_JFD_INNOVATIONS_RIFLING_HELP_EE',			10,				1,						'UNITCLASS_EE_LINE_INFANTRY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
--==========================================================================================================================