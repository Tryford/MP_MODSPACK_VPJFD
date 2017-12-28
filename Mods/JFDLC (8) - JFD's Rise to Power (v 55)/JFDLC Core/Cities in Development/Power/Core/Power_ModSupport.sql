--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET NumPoliciesNeeded = 26
WHERE Type = 'BUILDING_JFD_THREE_GORGES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 					ResourceType,				YieldType,				Yield)
SELECT	'BUILDING_JFD_COAL_PLANT',		'RESOURCE_COAL',			'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 					ResourceType,				YieldType,				Yield)
SELECT	'BUILDING_JFD_OIL_REFINERY',	'RESOURCE_OIL',				'YIELD_JFD_DISEASE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================