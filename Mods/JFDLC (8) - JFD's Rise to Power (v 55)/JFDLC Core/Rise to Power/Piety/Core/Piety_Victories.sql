--==========================================================================================================================	
-- VICTORIES
--==========================================================================================================================			
-- Victories
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Victories 
		(Type, 						Description, 						VictoryStatement, 						VictoryBackground, 			Civilopedia, 							WinsGame, 	TargetScore, 	Audio)
SELECT	'VICTORY_JFD_RELIGIOUS', 	'TXT_KEY_VICTORY_JFD_RELIGIOUS', 	'TXT_KEY_VICTORY_JFD_RELIGIOUS_BANG', 	'Victory_Religious.dds', 	'TXT_KEY_VICTORY_JFD_RELIGIOUS_PEDIA', 	1, 			1, 				'AS2D_VICTORY_SPEECH_JFD_RELIGIOUS_VICTORY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_VICTORY_ADDITIONS_RELIGIOUS' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================