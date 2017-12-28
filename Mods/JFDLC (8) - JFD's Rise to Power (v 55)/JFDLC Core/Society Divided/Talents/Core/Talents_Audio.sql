--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_TRAFALGAR', 		'Wonder_Trafalgar',						'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
SELECT	'AS2D_WONDER_SPEECH_JFD_TRAFALGAR',		'SND_WONDER_SPEECH_JFD_TRAFALGAR',		'GAME_SFX', 	1,						1,					-1.0,					75, 		75
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================