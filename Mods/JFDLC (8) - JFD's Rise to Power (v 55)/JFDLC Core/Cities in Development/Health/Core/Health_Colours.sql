--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_DISEASE', 	0.560, 	0.576, 	0,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_HEALTH', 	.803, 	0.929, 	0.929, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_PLAGUE', 	0.650, 	0.4, 	0,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================