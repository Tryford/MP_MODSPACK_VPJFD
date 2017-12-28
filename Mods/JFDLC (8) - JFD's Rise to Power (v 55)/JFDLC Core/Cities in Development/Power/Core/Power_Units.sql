--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Units
SET PrereqTech = 'TECH_RIFLING'
WHERE Class = 'UNITCLASS_GATLINGGUN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_UNIT_CHANGES_GATLING_GUN' AND Value = 1);

CREATE TRIGGER JFDCID_Power_Units
AFTER INSERT ON Units 
WHEN NEW.Class = 'UNITCLASS_GATLINGGUN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_UNIT_CHANGES_GATLING_GUN' AND Value = 1)
BEGIN
	UPDATE Units
	SET PrereqTech = 'TECH_RIFLING'
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================