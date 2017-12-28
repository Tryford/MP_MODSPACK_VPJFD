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
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET CombatClass = 'UNITCOMBAT_CIVILIAN'
WHERE Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_COLONIST', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_WORKER') AND CombatClass IS NULL;	

--JFDLC_Units
CREATE TRIGGER JFDLC_Units
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_PIONEER', 'UNITCLASS_COLONIST', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_WORKER')
BEGIN
	UPDATE Units
	SET CombatClass = 'UNITCOMBAT_CIVILIAN'
	WHERE Class = NEW.Class AND CombatClass IS NULL;		
END;

UPDATE Units
SET WorkRate = 100
WHERE Special = 'SPECIALUNIT_PEOPLE';

--JFDLC_Units_GreatPeople
CREATE TRIGGER JFDLC_Units_GreatPeople
AFTER INSERT ON Units 
WHEN NEW.Special = 'SPECIALUNIT_PEOPLE'
BEGIN
	UPDATE Units
	SET WorkRate = 100
	WHERE Type = NEW.Type AND Special = 'SPECIALUNIT_PEOPLE';
END;

UPDATE Units
SET CombatClass = 'UNITCOMBAT_RELIGIOUS'
WHERE Class IN ('UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_PROPHET') AND CombatClass IS NULL;	

--JFDLC_Units_Religious
CREATE TRIGGER JFDLC_Units_Religious
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_PROPHET')
BEGIN
	UPDATE Units
	SET CombatClass = 'UNITCOMBAT_RELIGIOUS'
	WHERE Class = NEW.Class AND CombatClass IS NULL;	
END;
--==========================================================================================================================
--==========================================================================================================================