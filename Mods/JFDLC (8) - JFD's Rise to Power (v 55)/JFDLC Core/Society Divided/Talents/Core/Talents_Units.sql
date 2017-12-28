--==========================================================================================================================
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClass_JFD_Talents
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_JFD_Talents
		(UnitClassType, NumTalents)
SELECT 	Class,			1	
FROM GreatPersons WHERE Class IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);		
--------------------------------------------------------------------------------------------------------------------------	
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 		MissionType)
SELECT	Class, 					'MISSION_JFD_INVENTORS'
FROM GreatPersons WHERE Class NOT IN ('UNITCLASS_GREAT_ADMIRAL', 'UNITCLASS_GREAT_GENERAL', 'UNITCLASS_PROPHET', 'UNITCLASS_JFD_GREAT_DIGNITARY', 'UNITCLASS_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================	
-- Units
------------------------------
UPDATE Units
SET PortraitIndex = 0, IconAtlas = 'JFD_TALENTS_UNIT_ATLAS'
WHERE Type = 'UNIT_GREAT_ADMIRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_GREAT_PEOPLE_CHANGES_ADMIRAL' AND Value = 1);		
--==========================================================================================================================
--==========================================================================================================================