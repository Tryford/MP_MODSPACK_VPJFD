--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,						LuxuryHappinessRetention,	Description,						ShortDescription)
SELECT	'TRAIT_JFD_NETHERLANDS',	50,							'TXT_KEY_TRAIT_JFD_NETHERLANDS',	'TXT_KEY_TRAIT_LUXURY_RETENTION_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Leader_Traits
SET TraitType = 'TRAIT_JFD_NETHERLANDS'
WHERE LeaderType = 'LEADER_WILLIAM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_NoTrain
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_NoTrain
		(TraitType,		UnitClassType)
SELECT	TraitType,		'UNITCLASS_JFD_COLONIST'
FROM Trait_NoTrain WHERE UnitClassType = 'UNITCLASS_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================