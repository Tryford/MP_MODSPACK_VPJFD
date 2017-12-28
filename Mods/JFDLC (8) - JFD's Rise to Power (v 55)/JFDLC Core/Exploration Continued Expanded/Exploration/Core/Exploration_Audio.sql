--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_SOUND_JFD_CIRCUMNAVIGATION', 		'GlobeCircumnavigated',	'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_BELEM_TOWER', 	'Wonder_BelemTower',	'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_SOUND_JFD_CIRCUMNAVIGATION',		'SND_SOUND_JFD_CIRCUMNAVIGATION', 		'GAME_SFX', 			0.0,					100, 		100),
		('AS2D_WONDER_SPEECH_JFD_BELEM_TOWER',	'SND_WONDER_SPEECH_JFD_BELEM_TOWER', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75);	
--==========================================================================================================================
--==========================================================================================================================