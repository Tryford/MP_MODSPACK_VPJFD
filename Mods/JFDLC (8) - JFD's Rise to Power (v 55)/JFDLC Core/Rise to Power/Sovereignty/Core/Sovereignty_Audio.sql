--==========================================================================================================================
-- AUDIO
--==========================================================================================================================
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 
		(SoundID,									FileName,									LoadType)
VALUES	('SND_SOUND_JFD_GOVERNMENT_DICTATORSHIP', 	'DictatorshipFounded',						'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_HOLY_ROME', 		'HREFounded',								'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_MONARCHY', 		'MonarchyFounded',							'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_REPUBLIC', 		'RepublicFounded',							'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_SHOGUNATE', 		'ShogunateFounded',							'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_THEOCRACY', 		'TheocracyFounded',							'DynamicResident'),
		('SND_SOUND_JFD_PRIVY_COUNCILLOR', 			'PrivyCouncillor',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_ANARCHY', 			'ReformAnarchy',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSABLE', 			'ReformPassable',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSED', 			'ReformPassed',								'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_AMER_FORT',			'Wonder_Amer',								'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_DOGES_PALACE',		'Wonder_DogesPalace',						'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_HOFBURG_PALACE',	'Wonder_HofburgPalace',						'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_SARGONS_PALACE',	'Wonder_SargonsPalace',						'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_ST_PETERS',			'Wonder_StPeters',							'DynamicResident'),
		('SND_WONDER_SPEECH_EE_VERSAILLES',			'Wonder_Versailles',						'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID,									SoundID,									SoundType,		MinVolume,	MaxVolume)
VALUES	('AS2D_JFD_GOVERNMENT_DICTATORSHIP',		'SND_SOUND_JFD_GOVERNMENT_DICTATORSHIP',	'GAME_SFX',		100,		100),
		('AS2D_JFD_GOVERNMENT_HOLY_ROME',			'SND_SOUND_JFD_GOVERNMENT_HOLY_ROME',		'GAME_SFX',		100,		100),
		('AS2D_JFD_GOVERNMENT_MONARCHY',			'SND_SOUND_JFD_GOVERNMENT_MONARCHY',		'GAME_SFX',		100,		100),
		('AS2D_JFD_GOVERNMENT_REPUBLIC',			'SND_SOUND_JFD_GOVERNMENT_REPUBLIC',		'GAME_SFX',		100,		100),
		('AS2D_JFD_GOVERNMENT_SHOGUNATE',			'SND_SOUND_JFD_GOVERNMENT_SHOGUNATE',		'GAME_SFX',		100,		100),
		('AS2D_JFD_GOVERNMENT_THEOCRACY',			'SND_SOUND_JFD_GOVERNMENT_THEOCRACY',		'GAME_SFX',		100,		100),
		('AS2D_JFD_PRIVY_COUNCILLOR',				'SND_SOUND_JFD_PRIVY_COUNCILLOR',			'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_ANARCHY',					'SND_SOUND_JFD_REFORM_ANARCHY',				'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_PASSABLE',				'SND_SOUND_JFD_REFORM_PASSABLE',			'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_PASSED',					'SND_SOUND_JFD_REFORM_PASSED',				'GAME_SFX',		100,		100),
		('AS2D_WONDER_SPEECH_JFD_AMER_FORT',		'SND_WONDER_SPEECH_JFD_AMER_FORT',			'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_DOGES_PALACE',		'SND_WONDER_SPEECH_JFD_DOGES_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_HOFBURG_PALACE',	'SND_WONDER_SPEECH_JFD_HOFBURG_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_SARGONS_PALACE',	'SND_WONDER_SPEECH_JFD_SARGONS_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_ST_PETERS',		'SND_WONDER_SPEECH_JFD_ST_PETERS',			'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_EE_VERSAILLES',		'SND_WONDER_SPEECH_EE_VERSAILLES',			'GAME_SPEECH',	80,			80);
--==========================================================================================================================
--==========================================================================================================================
