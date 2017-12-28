--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Notifications 
		(NotificationType, 												Welcomeness)
SELECT	'NOTIFICATION_JFD_CHOOSE_GOVERNMENT',							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Notifications 
		(NotificationType, 												Welcomeness)
SELECT	'NOTIFICATION_JFD_GOVERNMENT',									1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Notifications 
		(NotificationType, 												Welcomeness)
SELECT	'NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Notifications 
		(NotificationType, 												Welcomeness)
SELECT	'NOTIFICATION_JFD_REFORM',										1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================