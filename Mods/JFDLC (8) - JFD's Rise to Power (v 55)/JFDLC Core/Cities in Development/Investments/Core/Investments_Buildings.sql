--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET HurryCostModifier = 5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Buildings
SET HurryCostModifier = 70
WHERE BuildingClass = 'BUILDINGCLASS_COURTHOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Buildings
SET HurryCostModifier = -5 
WHERE HurryCostModifier = -1 AND Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxGlobalInstances = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_BIG_BEN_HELP'
WHERE Type = 'BUILDING_BIG_BEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Investments_Buildings
AFTER INSERT ON Buildings
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET HurryCostModifier = 5
	WHERE Type = NEW.Type;

	UPDATE Buildings
	SET HurryCostModifier = -5 
	WHERE Type = NEW.Type AND Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxGlobalInstances = 1);
END;
--==========================================================================================================================
--==========================================================================================================================