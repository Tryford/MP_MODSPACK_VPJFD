--==========================================================================================================================		
-- DEFINES
--==========================================================================================================================	
-- Defines
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Defines 
		(Name,										Value)
VALUES	('COLONIST_POPULATION_CHANGE',				3),
		('COLONIST_EXTRA_PLOTS',					5),
		('COLONIST_FOOD_PERCENT',					50),
		('JFD_CID_DEFAULT_DECOLONIZATION_GOLD',		50),
		('JFD_CID_DEFAULT_DECOLONIZATION_POP',		15),
		('PIONEER_POPULATION_CHANGE',				3),
		('PIONEER_EXTRA_PLOTS',						5),
		('PIONEER_FOOD_PERCENT',					50);
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								Reformation)
SELECT	'BELIEF_JFD_MISSION_COLONIES', 		'TXT_KEY_BELIEF_JFD_MISSION_COLONIES', 		'TXT_KEY_BELIEF_JFD_MISSION_COLONIES_SHORT', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES' AND Value = 1);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_BuildingClassCultureChanges
SET BuildingClassType = 'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY'
WHERE PolicyType = 'POLICY_MERCHANT_NAVY' AND BuildingClassType = 'BUILDINGCLASS_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_BuildingClassYieldChanges
SET BuildingClassType = 'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY'
WHERE PolicyType = 'POLICY_MERCHANT_NAVY' AND BuildingClassType = 'BUILDINGCLASS_NATIONAL_TREASURY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
