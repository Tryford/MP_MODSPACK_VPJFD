--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
SELECT	 'COLOR_JFD_ALPHA', 							1,		1,		1, 		0.3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_SOVEREIGNTY', 						0.847,	0.631, 	0.070, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_SOVEREIGNTY_FADING', 				0.698, 	0.588, 	0.313, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================