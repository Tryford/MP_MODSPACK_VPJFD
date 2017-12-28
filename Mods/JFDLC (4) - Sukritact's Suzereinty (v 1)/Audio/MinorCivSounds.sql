--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
VALUES	('SND_MINOR_CIV_SILENT',	 				'Silence01s',							'DynamicResident'),
		('SND_MINOR_CIV_SUK_CULTURED',	 			'Suk_Cultured',							'DynamicResident'),
		('SND_MINOR_CIV_SUK_FERTILE',	 			'Suk_Fertile',							'DynamicResident'),
		('SND_MINOR_CIV_SUK_MERCANTILE',	 		'Suk_Mercantile',						'DynamicResident'),
		('SND_MINOR_CIV_SUK_MILITARISTIC',	 		'Suk_Militaristic',						'DynamicResident'),
		('SND_MINOR_CIV_SUK_RELIGIOUS',	 			'Suk_Religious',						'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType)
VALUES	('AS2D_MINOR_CIV_SILENT',					'SND_MINOR_CIV_SILENT',					'GAME_SFX');

INSERT INTO Audio_2DSounds
		(ScriptID, 									SoundID, 									DontTriggerDuplicates,	TaperSoundtrackVolume,	MinVolume,	MaxVolume,	SoundType)
VALUES	('AS2D_MINOR_CIV_SUK_CULTURED', 			'SND_MINOR_CIV_SUK_CULTURED', 				1,						0.0,					100,			100,	'GAME_SFX'),
		('AS2D_MINOR_CIV_SUK_FERTILE', 				'SND_MINOR_CIV_SUK_FERTILE', 				1,						0.0,					100,			100,	'GAME_SFX'),
		('AS2D_MINOR_CIV_SUK_MERCANTILE', 			'SND_MINOR_CIV_SUK_MERCANTILE', 			1,						0.0,					100,			100,	'GAME_SFX'),
		('AS2D_MINOR_CIV_SUK_MILITARISTIC', 		'SND_MINOR_CIV_SUK_MILITARISTIC', 			1,						0.0,					100,			100,	'GAME_SFX'),
		('AS2D_MINOR_CIV_SUK_RELIGIOUS', 			'SND_MINOR_CIV_SUK_RELIGIOUS', 				1,						0.0,					100,			100,	'GAME_SFX');	
--==========================================================================================================================
--==========================================================================================================================