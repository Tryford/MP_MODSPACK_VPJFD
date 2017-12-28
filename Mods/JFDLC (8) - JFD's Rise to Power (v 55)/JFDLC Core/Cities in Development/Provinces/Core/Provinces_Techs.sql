--==========================================================================================================================	
-- TECHNOLOGIES
--==========================================================================================================================	
-- Technologies
------------------------------
UPDATE Technologies 
SET BombardRange = 0, BombardIndirect = 0
WHERE BombardRange != 0 OR BombardIndirect != 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE' AND Value = 1);

UPDATE Technologies 
SET OpenBordersTradingAllowed = 0
WHERE Type = 'TECH_CIVIL_SERVICE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS' AND Value = 1);

UPDATE Technologies 
SET OpenBordersTradingAllowed = 1
WHERE Type = 'TECH_GUILDS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS' AND Value = 1);

UPDATE Technologies 
SET BombardIndirect = 1
WHERE Type = 'TECH_GUNPOWDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE' AND Value = 1);
------------------------------
-- Technologies_JFD_MiscEffects
------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,				EffectToolTip,							AllowLevies,	UnitAction)
SELECT	'TECH_CIVIL_SERVICE',	'TXT_KEY_JFD_ALLOWS_LEVIES',			1,				'MISSION_FORTIFY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,				EffectToolTip,											UnitAction)
SELECT	'TECH_GUNPOWDER',		'TXT_KEY_ABLTY_CITY_INDIRECT_INCREASE',					'MISSION_RANGE_ATTACK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================