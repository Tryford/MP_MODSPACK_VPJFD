--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================			
-- Processes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex,	RequiresCoast)
SELECT	'PROCESS_JFD_ADMIRAL',	'TECH_OPTICS',				'TXT_KEY_PROCESS_JFD_ADMIRAL',	'TXT_KEY_PROCESS_JFD_ADMIRAL_HELP',	'TXT_KEY_PROCESS_JFD_ADMIRAL_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	12,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	

INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_CULTURE',	'TECH_ACOUSTICS',			'TXT_KEY_PROCESS_JFD_CULTURE',	'TXT_KEY_PROCESS_JFD_CULTURE_HELP',	'TXT_KEY_PROCESS_JFD_CULTURE_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);		

INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex,	DefenseValue)
SELECT	'PROCESS_JFD_DEFENSE',	'TECH_CONSTRUCTION',		'TXT_KEY_PROCESS_JFD_DEFENSE',	'TXT_KEY_PROCESS_JFD_DEFENSE_HELP',	'TXT_KEY_PROCESS_JFD_DEFENSE_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	8,				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
	
INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_GAP',		'TECH_HORSEBACK_RIDING',	'TXT_KEY_PROCESS_JFD_GAP',		'TXT_KEY_PROCESS_JFD_GAP_HELP',		'TXT_KEY_PROCESS_JFD_GAP_STRATEGY',		'JFD_PROGRESS_PROCESS_ATLAS',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_GENERAL',	'TECH_IRON_WORKING',		'TXT_KEY_PROCESS_JFD_GENERAL',	'TXT_KEY_PROCESS_JFD_GENERAL_HELP',	'TXT_KEY_PROCESS_JFD_GENERAL_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	

INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_FAITH',	'TECH_PHILOSOPHY',			'TXT_KEY_PROCESS_JFD_FAITH',	'TXT_KEY_PROCESS_JFD_FAITH_HELP',	'TXT_KEY_PROCESS_JFD_FAITH_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);		

INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_FOOD',		'TECH_POTTERY',				'TXT_KEY_PROCESS_JFD_FOOD',		'TXT_KEY_PROCESS_JFD_FOOD_HELP',	'TXT_KEY_PROCESS_JFD_FOOD_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
	
INSERT INTO Processes 
		(Type,					TechPrereq,					Description,					Help,								Strategy, 								IconAtlas, 						PortraitIndex)
SELECT	'PROCESS_JFD_TOURISM',	'TECH_INDUSTRIALIZATION',	'TXT_KEY_PROCESS_JFD_TOURISM',	'TXT_KEY_PROCESS_JFD_TOURISM_HELP',	'TXT_KEY_PROCESS_JFD_TOURISM_STRATEGY',	'JFD_PROGRESS_PROCESS_ATLAS',	11
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	

UPDATE Processes
SET IconAtlas = 'JFD_PROGRESS_PROCESS_ATLAS', PortraitIndex = 0, Help = 'TXT_KEY_PROCESS_JFD_SCIENCE_HELP', Strategy = 'TXT_KEY_PROCESS_JFD_SCIENCE_STRATEGY'
WHERE Type = 'PROCESS_RESEARCH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

UPDATE Processes
SET IconAtlas = 'JFD_PROGRESS_PROCESS_ATLAS', PortraitIndex = 6
WHERE Type = 'PROCESS_JFD_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

UPDATE Processes
SET IconAtlas = 'JFD_PROGRESS_PROCESS_ATLAS', PortraitIndex = 3, Help = 'TXT_KEY_PROCESS_JFD_GOLD_HELP', Strategy = 'TXT_KEY_PROCESS_JFD_GOLD_STRATEGY', TechPrereq = 'TECH_CURRENCY'
WHERE Type = 'PROCESS_WEALTH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Process_ProductionYields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_ADMIRAL',		'YIELD_GREAT_ADMIRAL_POINTS',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_CULTURE',		'YIELD_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_GAP',			'YIELD_GOLDEN_AGE_POINTS',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_GENERAL',		'YIELD_GREAT_GENERAL_POINTS',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_FAITH',		'YIELD_FAITH',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_FOOD',			'YIELD_FOOD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_ProductionYields 
		(ProcessType,				YieldType,						Yield)
SELECT	'PROCESS_JFD_TOURISM',		'YIELD_TOURISM',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

UPDATE Process_ProductionYields 
SET Yield = 20
WHERE ProcessType IN ('PROCESS_RESEARCH', 'PROCESS_WEALTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Process_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_ADMIRAL',		'FLAVOR_NAVAL',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);

INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_CULTURE',		'FLAVOR_CULTURE',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_DEFENSE',		'FLAVOR_CITY_DEFENSE',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_FAITH',		'FLAVOR_RELIGION',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_FOOD',			'FLAVOR_GROWTH',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_GAP',			'FLAVOR_CULTURE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);	
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_GAP',			'FLAVOR_GOLD',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
	
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_GENERAL',		'FLAVOR_OFFENSE',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================