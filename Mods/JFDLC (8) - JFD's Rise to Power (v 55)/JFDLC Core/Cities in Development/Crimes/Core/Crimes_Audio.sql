--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
VALUES	('SND_WONDER_SPEECH_JFD_TOWER_LONDON',		'Wonder_TowerLondon',					'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_WONDER_SPEECH_JFD_TOWER_LONDON',		'SND_WONDER_SPEECH_JFD_TOWER_LONDON', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================
--==========================================================================================================================
