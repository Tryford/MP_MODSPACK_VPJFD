--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 						Filename, 						LoadType)
SELECT	'SND_SOUND_JFD_RESISTANCE', 	'Resistance',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 						SoundID, 						SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_RESISTANCE',	'SND_SOUND_JFD_RESISTANCE', 	'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================