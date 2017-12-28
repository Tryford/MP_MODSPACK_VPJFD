--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_DISEASE', IconString = '[ICON_JFD_DISEASE]', ColorString = '[COLOR_JFD_DISEASE]', ImageTexture = 'YieldAtlas_128_Disease.dds'
WHERE Type = 'YIELD_JFD_DISEASE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_HEALTH', IconString = '[ICON_JFD_HEALTH]', ColorString = '[COLOR_JFD_HEALTH]', ImageTexture = 'YieldAtlas_128_Health.dds'
WHERE Type = 'YIELD_JFD_HEALTH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================