--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					FaithFromKills,		AlwaysReligion,		FreeUnit,				FreeUnitPrereqTech,				BonusReligiousBelief,	Description,					ShortDescription)
SELECT	'TRAIT_JFD_AZTECS',		100,				0,					NULL,					NULL,							0,						'TXT_KEY_TRAIT_JFD_AZTECS',		'TXT_KEY_TRAIT_CULTURE_FROM_KILLS_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS' AND Value = 1);

INSERT INTO Traits
		(Type,					AnyBelief,			AlwaysReligion,		FreeUnit,				FreeUnitPrereqTech,				BonusReligiousBelief,	Description,					ShortDescription)
SELECT	'TRAIT_JFD_BYZANTIUM',	1,					1,					NULL,					NULL,							0,						'TXT_KEY_TRAIT_JFD_BYZANTIUM',	'TXT_KEY_TRAIT_EXTRA_BELIEF_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Leader_Traits SET TraitType = 'TRAIT_JFD_AZTECS' WHERE LeaderType = 'LEADER_MONTEZUMA' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS' AND Value = 1);

UPDATE Leader_Traits SET TraitType = 'TRAIT_JFD_BYZANTIUM' WHERE LeaderType = 'LEADER_THEODORA' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================