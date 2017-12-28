--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================
-- Notificaton_AudioSoundFiles
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Notificaton_AudioSoundFiles
		(NotificationType,						AudioSoundFile)
VALUES	('NOTIFICATION_MINOR_BUYOUT',			'AS2D_MISC_JFD_MARRIAGE');

INSERT INTO Notificaton_AudioSoundFiles
		(NotificationType,						AudioSoundFile)
SELECT	'NOTIFICATION_UNIT_PROMOTION',			'AS2D_UNIT_JFD_PROMOTED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_UNIT_LEVEL_UP_SOUND' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================