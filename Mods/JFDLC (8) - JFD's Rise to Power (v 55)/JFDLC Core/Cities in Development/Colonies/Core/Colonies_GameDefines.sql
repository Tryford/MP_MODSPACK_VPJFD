--==========================================================================================================================		
-- DEFINES
--==========================================================================================================================	
-- Defines
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Defines 
		(Name,														Value)
VALUES	('COLONIST_POPULATION_CHANGE',								3),
		('COLONIST_EXTRA_PLOTS',									5),
		('COLONIST_FOOD_PERCENT',									50),
		('PIONEER_POPULATION_CHANGE',								3),
		('PIONEER_EXTRA_PLOTS',										5),
		('PIONEER_FOOD_PERCENT',									50);

INSERT INTO Defines 
		(Name,														Value)
SELECT	'JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_GOLD_COST',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Defines 
		(Name,														Value)
SELECT	'JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_MAGISTRATE_COST',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Defines 
		(Name,														Value)
SELECT	'JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_POP_REQ',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
