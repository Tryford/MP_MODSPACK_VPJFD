--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
SELECT	'SND_SOUND_JFD_CONTRACT_DEFAULTED', 	'ContractDefaulted',	'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
SELECT	'SND_SOUND_JFD_CONTRACT_STARTED', 		'ContractStarted',		'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	
	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_JIAYUGUAN', 		'Wonder_Jiayuguan',		'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_CONTRACT_DEFAULTED', 	'SND_SOUND_JFD_CONTRACT_DEFAULTED', 	'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_CONTRACT_STARTED', 		'SND_SOUND_JFD_CONTRACT_STARTED', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_JIAYUGUAN',		'SND_WONDER_SPEECH_JFD_JIAYUGUAN', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75,			0,		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		
--==========================================================================================================================
--==========================================================================================================================