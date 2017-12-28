--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 				MissionType)
SELECT	'UNITCLASS_GREAT_ADMIRAL',		'MISSION_JFD_CAPTAINS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);

INSERT INTO UnitClass_Missions 	
		(UnitClassType, 				MissionType)
SELECT	'UNITCLASS_GREAT_GENERAL',		'MISSION_JFD_CAPTAINS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================