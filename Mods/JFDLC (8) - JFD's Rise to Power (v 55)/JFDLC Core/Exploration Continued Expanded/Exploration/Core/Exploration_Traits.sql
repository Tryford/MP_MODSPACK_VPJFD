--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Improvements
		(Type,								Description,								ArtDefineTag, 						GraphicalOnly)
SELECT	'IMPROVEMENT_JFD_MACHU_PICCHU',		'TXT_KEY_IMPROVEMENT_JFD_MACHU_PICCHU',		'ART_DEF_IMPROVEMENT_JFD_MACHU',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA' AND Value = 1);
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_INCA', MountainPass = 1
WHERE Type = 'TRAIT_GREAT_ANDEAN_ROAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================