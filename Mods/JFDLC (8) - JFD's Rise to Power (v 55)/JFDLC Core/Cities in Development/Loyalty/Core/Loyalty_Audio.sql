--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 					Filename, 				LoadType)
VALUES	('SND_SOUND_JFD_REVOLT', 	'RevolutionStart',		'DynamicResident'),	
		('SND_SOUND_JFD_WLTKD', 	'WLTKDStart',			'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 					SoundID, 				SoundType, 	 TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_REVOLT',	'SND_SOUND_JFD_REVOLT', 'GAME_SFX',  -1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_WLTKD',	'SND_SOUND_JFD_WLTKD', 	'GAME_SFX',  -1.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
--==========================================================================================================================