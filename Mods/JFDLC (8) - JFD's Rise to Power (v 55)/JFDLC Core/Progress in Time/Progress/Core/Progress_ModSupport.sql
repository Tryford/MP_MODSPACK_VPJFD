--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET NumPoliciesNeeded = 17
WHERE Type = 'BUILDING_JFD_DA_VINCI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 1
WHERE Type = 'BUILDING_JFD_GOBEKLI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 3
WHERE Type = 'BUILDING_JFD_GREAT_ZIGGURAT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 15
WHERE Type = 'BUILDING_JFD_ST_BASILS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 12
WHERE Type = 'BUILDING_JFD_VENETIAN_ARSENAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CITIZENSHIP_HELP_CHARGES_CBO'
WHERE Type = 'POLICY_CITIZENSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_AUTOCRACY_HELP_CHARGES_CBO'
WHERE Type = 'POLICY_TOTAL_WAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type IN ('BUILDING_JFD_CINEMA', 'BUILDING_JFD_DIRECTORS_GUILD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	'BUILDING_JFD_CINEMA',			'YIELD_JFD_CRIME',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 					YieldType,				Yield)
SELECT	'BUILDING_JFD_DIRECTORS_GUILD',	'YIELD_JFD_CRIME',		2
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------
--Slave
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_SLAVE_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_SLAVE_CHARGES'
WHERE Type = 'UNIT_JFD_SLAVE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- JFD_CultureType_StartingBonuses
------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_CultureType_StartingBonuses
SET FreeTech = 'TECH_JFD_HUNTING', Description = 'TXT_KEY_JFD_DAWN_GREAT_PLAINS_BONUSES_PROGRESS' WHERE FreeTech = 'TECH_TRAPPING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreeTech = 'TECH_JFD_FISHING', Description = 'TXT_KEY_JFD_DAWN_PACIFIC_BONUSES_PROGRESS' WHERE FreeTech = 'TECH_SAILING' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- JFD PROGRESS IN TIME
--==========================================================================================================================
--Units
-------------------------------------
UPDATE Units
SET PrereqTech = NULL
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_JFD_ATLATLIST', Strategy = 'TXT_KEY_UNIT_JFD_ATLATLIST_STRATEGY_PROGRESS'
WHERE Type = 'UNIT_MAYAN_ATLATLIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER' AND Value = 1);

--Peasant
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP_CHARGES'
WHERE Type = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

--Worker
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_WORKER_CHARGES'
WHERE Type = 'UNIT_JFD_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
-- LEUGI PANEM ET CIRCENSES
--==========================================================================================================================
--Builds
-------------------------------------
DELETE FROM Builds WHERE Type = 'BUILD_TECH_FESTIVAL' AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
CREATE TABLE IDRemapper (id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM Builds ORDER BY ID;
UPDATE Builds SET ID = (SELECT IDRemapper.id-1 FROM IDRemapper WHERE Builds.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
--Broadcast Tower
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_BROADCAST_TOWER_STRATEGY', Help = 'TXT_KEY_BUILDING_JFD_BROADCAST_TOWER_HELP'
WHERE Type = 'BUILDING_BROADCAST_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

--Gallery
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_GALLERY_STRATEGY', Help = 'TXT_KEY_BUILDING_JFD_GALLERY_HELP', GoldMaintenance = 1
WHERE Type = 'BUILDING_EE_GALLERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

--Museum
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MUSEUM_STRATEGY', Help = 'TXT_KEY_BUILDING_JFD_MUSEUM_HELP'
WHERE Type = 'BUILDING_MUSEUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

--Opera House
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_OPERA_HOUSE_STRATEGY', Help = 'TXT_KEY_BUILDING_JFD_OPERA_HOUSE_HELP'
WHERE Type = 'BUILDING_OPERA_HOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

--Salon
UPDATE Buildings 
SET FreeBuildingThisCity = 'BUILDINGCLASS_EE_SALON'
WHERE FreeBuildingThisCity = 'BUILDING_EE_SALON';

--Theatre
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE', Strategy = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE_STRATEGY', Civilopedia = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE_TEXT', IconAtlas = 'JFD_SOVEREIGNTY_BUILDING_ATLAS', PortraitIndex = 0
WHERE Type = 'BUILDING_THEATRE';

--JFDPIT_Progress_Buildings_CultureLine
CREATE TRIGGER JFDPIT_Progress_Buildings_CultureLine
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_BROADCAST_TOWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1)
BEGIN
	INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 		BuildingClassType)
	SELECT	NEW.Type, 			'BUILDINGCLASS_MONUMENT'
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_EE_GALLERY';

	INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 		BuildingClassType)
	SELECT	NEW.Type, 			'BUILDINGCLASS_EE_GALLERY'
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_MUSEUM';

	UPDATE Building_ClassesNeededInCity
	SET BuildingClassType = 'BUILDINGCLASS_MONUMENT'
	WHERE BuildingType = NEW.Type AND BuildingClassType = 'BUILDINGCLASS_OPERA_HOUSE';

	UPDATE Building_ClassesNeededInCity
	SET BuildingClassType = 'BUILDINGCLASS_OPERA_HOUSE'
	WHERE BuildingType = NEW.Type AND BuildingClassType = 'BUILDINGCLASS_BROADCAST_TOWER';
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
UPDATE Building_YieldModifiers SET Yield = 15 WHERE BuildingType = 'BUILDING_EE_ACADEMY';
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
--Culture Buildings
DELETE FROM Building_ClassesNeededInCityOR WHERE BuildingClassType IN ('BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_THEATRE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1);

--Art (Monument - Gallery - Museum)
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 		BuildingClassType)
SELECT	Type, 				'BUILDINGCLASS_MONUMENT'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_EE_GALLERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 		BuildingClassType)
SELECT	Type, 				'BUILDINGCLASS_EE_GALLERY'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MUSEUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1);

--Music (Monument - Opera House - Broadcast Tower)
UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_MONUMENT'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_OPERA_HOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1);

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_OPERA_HOUSE'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_BROADCAST_TOWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	Type, 				'UNITCLASS_EE_CUIRASSIER'
FROM Units WHERE Class IN ('UNITCLASS_LANCER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');
--==========================================================================================================================
--==========================================================================================================================
