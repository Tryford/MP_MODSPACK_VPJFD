--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Notifications 
		(NotificationType)
SELECT	'NOTIFICATION_JFD_PLAGUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================