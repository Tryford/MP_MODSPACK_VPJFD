--==========================================================================================================================	
-- DEFINES
--=====================================================e=====================================================================			
-- Defines
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_CLAIMS_ALLIED_TURNS',						25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Defines
SET Value = 25 
WHERE Name = 'MINOR_CIV_BUYOUT_TURNS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Defines
SET Value = 25 
WHERE Name = 'BALANCE_MINOR_PROTECTION_MINIMUM_DURATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================