--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Resource_YieldChanges SET YieldType = 'YIELD_JFD_HEALTH' 
WHERE YieldType = 'YIELD_GOLD' AND ResourceType IN ('RESOURCE_CITRUS', 'RESOURCE_JFD_GINGER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================