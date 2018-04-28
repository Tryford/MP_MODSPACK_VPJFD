--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 						Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_INNOVATION', 	0.745, 	0.596, 	0.960, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================