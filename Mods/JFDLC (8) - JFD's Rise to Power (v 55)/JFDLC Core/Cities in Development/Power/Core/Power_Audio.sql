--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_THREE_GORGES',		'Wonder_ThreeGorges',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_THREE_GORGES',		'SND_WONDER_SPEECH_JFD_THREE_GORGES', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================
