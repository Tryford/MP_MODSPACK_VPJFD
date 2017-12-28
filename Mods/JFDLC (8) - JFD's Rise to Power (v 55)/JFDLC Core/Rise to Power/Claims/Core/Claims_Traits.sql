--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					Description,					ShortDescription)
SELECT	'TRAIT_JFD_AUSTRIA',	'TXT_KEY_TRAIT_JFD_AUSTRIA',	'TXT_KEY_TRAIT_ANNEX_CITY_STATE_SHORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Traits
SET AbleToAnnexCityStates = 1
WHERE AbleToAnnexCityStates = 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

CREATE TRIGGER JFDRTP_Claims_Traits
AFTER INSERT ON Traits 
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
BEGIN
	UPDATE Traits
	SET AbleToAnnexCityStates = 1
	WHERE AbleToAnnexCityStates = 0;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_JFD_ClaimMods
		(TraitType,				CauseChange,	RequiresBefriended)
SELECT	'TRAIT_JFD_AUSTRIA',	1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
------------------------------------------------------------
-- Leader_Traits
------------------------------------------------------------	
UPDATE Leader_Traits
SET TraitType = 'TRAIT_JFD_AUSTRIA'
WHERE LeaderType = 'LEADER_MARIA' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================