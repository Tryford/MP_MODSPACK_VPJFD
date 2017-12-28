--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--Buildings
-----------------------------------------------------------------------------------------------------	
--Admirals
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_HARBOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount = 2
WHERE BuildingClass = 'BUILDINGCLASS_SEAPORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount = 3
WHERE BuildingClass = 'BUILDINGCLASS_EE_DRYDOCK'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

CREATE TRIGGER JFDRTP_Supply_Admirals
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_SEAPORT', 'BUILDINGCLASS_EE_DRYDOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount =1
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_HARBOR';
	
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount = 2
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_SEAPORT';
	
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_ADMIRAL', SpecialistCount = 3
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_EE_DRYDOCK';
END;

--Generals
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_BARRACKS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount = 2
WHERE BuildingClass = 'BUILDINGCLASS_ARMORY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount = 3
WHERE BuildingClass = 'BUILDINGCLASS_MILITARY_ACADEMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);

CREATE TRIGGER JFDRTP_Supply_Generals
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount =1
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_BARRACKS';
	
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount = 2
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_ARMORY';
	
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_GENERAL', SpecialistCount = 3
	WHERE Type = NEW.Type AND NEW.BuildingClass = 'BUILDINGCLASS_MILITARY_ACADEMY';
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	Type,							'RESOURCE_JFD_CAPTAINS',		2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);

INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	Type,							'RESOURCE_JFD_CAPTAINS',		2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HEROIC_EPIC'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================