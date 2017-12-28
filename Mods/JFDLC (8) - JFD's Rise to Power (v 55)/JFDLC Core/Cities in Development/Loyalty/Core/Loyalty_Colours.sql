--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_PATRIOTIC', 			0, 		1, 		1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_ALLEGIANT',			0.552, 	0.807, 	0.447, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);		

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_NEUTRAL', 			0.882, 	0.878, 	0.780, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_REBELLIOUS',			0.890, 	0.882, 	0.392, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_SEPARATIST',			1, 		0.372, 	0.309, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================