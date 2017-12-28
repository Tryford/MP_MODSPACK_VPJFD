--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
SELECT	'SND_SOUND_JFD_EPITHET', 				'Epithet',							'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
SELECT	'SND_SOUND_JFD_EPITHET_ACCEPTED', 		'EpithetAccepted',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_EPITHET',				'SND_SOUND_JFD_EPITHET', 			'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_EPITHET_ACCEPTED',		'SND_SOUND_JFD_EPITHET_ACCEPTED', 	'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================