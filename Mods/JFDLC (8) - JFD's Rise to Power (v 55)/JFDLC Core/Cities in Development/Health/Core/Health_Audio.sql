--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 									LoadType)
SELECT	'SND_SOUND_JFD_DOCTOR', 					'Doctor',									'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 									LoadType)
SELECT	'SND_SOUND_JFD_PLAGUE', 					'Plague',									'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 									LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_PONT_DU_GARD', 		'Wonder_PontDuGard',						'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_DOCTOR',					'SND_SOUND_JFD_DOCTOR', 					'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_PLAGUE',					'SND_SOUND_JFD_PLAGUE', 					'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_PONT_DU_GARD',		'SND_WONDER_SPEECH_JFD_PONT_DU_GARD', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================