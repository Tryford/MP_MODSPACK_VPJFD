--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 									LoadType)
SELECT	'SND_SOUND_JFD_SLAVE_PURCHASE', 			'SlavePurchase',							'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 									LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_STONE_TOWN', 		'Wonder_StoneTown',							'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_SLAVE_PURCHASE',			'SND_SOUND_JFD_SLAVE_PURCHASE', 			'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_STONE_TOWN',		'SND_WONDER_SPEECH_JFD_STONE_TOWN', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================