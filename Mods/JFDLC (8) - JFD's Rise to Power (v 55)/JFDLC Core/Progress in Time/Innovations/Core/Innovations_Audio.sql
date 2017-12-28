--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 						LoadType)
SELECT	'SND_SOUND_JFD_INNOVATION', 				'Innovation',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 						LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_YELLOW_CRANE', 		'Wonder_YellowCrane',			'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 			DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
SELECT	'AS2D_SOUND_JFD_INNOVATION',				'SND_SOUND_JFD_INNOVATION',					'GAME_SFX', 		1,						1,					-1.0,					100, 		100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 			DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
SELECT	'AS2D_WONDER_SPEECH_JFD_YELLOW_CRANE',		'SND_WONDER_SPEECH_JFD_YELLOW_CRANE',		'GAME_SFX', 		1,						1,					-1.0,					75, 		75
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================