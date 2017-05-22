--==========================================================================================================================	
-- MISSIONS
--==========================================================================================================================			
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 							Time,	OrderPriority,	Visible,	Description, 						Help, 									  DisabledHelp, 									 EntityEventType,			 IconAtlas,							IconIndex)
SELECT  'MISSION_JFD_JOIN_COUNCIL', 	25,		199,			1,			'TXT_KEY_MISSION_JFD_JOIN_COUNCIL', 'TXT_KEY_MISSION_JFD_JOIN_COUNCIL_HELP',  'TXT_KEY_MISSION_JFD_JOIN_COUNCIL_DISABLED_HELP',  'ENTITY_EVENT_GREAT_EVENT', 'JFD_SOVEREIGNTY_MISSION_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--==========================================================================================================================
-- UNIT COMBATS
--==========================================================================================================================
-- UnitCombatInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO UnitCombatInfos
		(Type, 								Description)
VALUES	('UNITCOMBAT_CIVILIAN',				'TXT_KEY_UNITCOMBAT_CIVILIAN'),
		('UNITCOMBAT_GREAT_PEOPLE',			'TXT_KEY_UNITCOMBAT_GREAT_PEOPLE'),
		('UNITCOMBAT_RELIGIOUS',			'TXT_KEY_UNITCOMBAT_RELIGIOUS');
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 	
		(UnitClassType, 		MissionType,					RequiresCapital,	RequiresGovernment)
SELECT	Class, 					'MISSION_JFD_JOIN_COUNCIL',		1,					1
FROM GreatPersons WHERE Class IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET CombatClass = 'UNITCOMBAT_CIVILIAN'
WHERE Class IN ('UNITCLASS_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_COLONIST', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_WORKER') AND CombatClass IS NULL;	

CREATE TRIGGER JFDRTP_Sovereignty_Units_CombatClassCivilian
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_PIONEER', 'UNITCLASS_COLONIST', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_WORKER')
BEGIN
	UPDATE Units
	SET CombatClass = 'UNITCOMBAT_CIVILIAN'
	WHERE Class = NEW.Class AND CombatClass IS NULL;		
END;

UPDATE Units
SET WorkRate = 100
WHERE Special = 'SPECIALUNIT_PEOPLE';

CREATE TRIGGER JFDRTP_Sovereignty_Units_GreatPeople
AFTER INSERT ON Units 
WHEN NEW.Special = 'SPECIALUNIT_PEOPLE'
BEGIN
	UPDATE Units
	SET WorkRate = 100
	WHERE Type = NEW.Type AND Special = 'SPECIALUNIT_PEOPLE';
END;
--==========================================================================================================================	
-- REMAPPER
--==========================================================================================================================	
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Missions ORDER BY ID;
UPDATE Missions SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Missions.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
--==========================================================================================================================