--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
SELECT	'SND_SOUND_JFD_DECOLONIZATION', 		'Decolonization',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_DECOLONIZATION_PURCHASES' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_PENA',			'Wonder_Pena',						'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_DECOLONIZATION',		'SND_SOUND_JFD_DECOLONIZATION', 	'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_DECOLONIZATION_PURCHASES' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_PENA',			'SND_WONDER_SPEECH_JFD_PENA', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================