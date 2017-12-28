--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
------------------------------------------------------------	
UPDATE Resources
SET Happiness = 1
WHERE Happiness > 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

CREATE TRIGGER JFDRTP_Prosperity_Resources
AFTER INSERT ON Resources 
WHEN NEW.Happiness > 1
BEGIN
	UPDATE Resources
	SET Happiness = 1
	WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
END;
--==========================================================================================================================
--==========================================================================================================================