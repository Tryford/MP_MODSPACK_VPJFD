--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
VALUES	('SND_SOUND_JFD_EPITHET', 				'Epithet',							'DynamicResident'),
		('SND_SOUND_JFD_EPITHET_ACCEPTED', 		'EpithetAccepted',					'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_EPITHET',				'SND_SOUND_JFD_EPITHET', 			'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_EPITHET_ACCEPTED',		'SND_SOUND_JFD_EPITHET_ACCEPTED', 	'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
--==========================================================================================================================