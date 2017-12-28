--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					FreeInnovationOnSpecialistConstructedInCapital,	Description,					ShortDescription)
SELECT	'TRAIT_JFD_KOREA',		1,												'TXT_KEY_TRAIT_JFD_KOREA',		'TXT_KEY_TRAIT_SCHOLARS_JADE_HALL_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CIVILIZATION_CHANGES_KOREA' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges
		(TraitType,				SpecialistType,		YieldType,			Yield)
SELECT	'TRAIT_JFD_KOREA',		Type,				'YIELD_SCIENCE',	1	
FROM Specialists WHERE Type NOT IN ('SPECIALIST_CITIZEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CIVILIZATION_CHANGES_KOREA' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Leader_Traits
SET TraitType = 'TRAIT_JFD_KOREA'
WHERE LeaderType = 'LEADER_SEJONG' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CIVILIZATION_CHANGES_KOREA' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================