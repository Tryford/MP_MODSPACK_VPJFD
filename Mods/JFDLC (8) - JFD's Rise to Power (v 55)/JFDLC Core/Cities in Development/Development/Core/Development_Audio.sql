--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 							Filename, 							LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_EL_TAJIN', 	'Wonder_ElTajin',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 							SoundID, 							SoundType, 		DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
SELECT	'AS2D_WONDER_SPEECH_JFD_EL_TAJIN',	'SND_WONDER_SPEECH_JFD_EL_TAJIN',	'GAME_SFX', 	1,						1,					-1.0,					75, 		75
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================
