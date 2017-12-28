--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY', 							0.960, 		0.458, 		0, 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY_DEVOUT', 					1, 			0.474, 		0, 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY_VIRTUOUS', 				0.860, 		0.435, 		0, 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY_NEUTRAL', 					0.741, 		0.349, 		0,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY_POOR', 					0.627, 		0.290, 		0, 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
INSERT INTO Colors 
		(Type, 										Red, 		Green, 		Blue, 	Alpha)
SELECT	'COLOR_JFD_PIETY_HERETICAL', 				0.521, 		0.247, 		0, 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================