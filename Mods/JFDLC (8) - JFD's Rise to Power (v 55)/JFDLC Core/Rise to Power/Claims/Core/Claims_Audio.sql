--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
VALUES	('SND_BUILDING_JFD_CHANCERY', 			'Chancery',								'DynamicResident'),
		('SND_BUILDING_JFD_COURT_CHANCERY', 	'CourtChancery',						'DynamicResident'),
		('SND_BUILDING_JFD_HIGH_COURT', 		'HighCourt',							'DynamicResident'),
		('SND_BUILDING_JFD_MAGISTRATES_COURT', 	'MagistratesCourt',						'DynamicResident'),
		('SND_BUILDING_JFD_SUPREME_COURT', 		'SupremeCourt',							'DynamicResident');
		
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
SELECT	'SND_SOUND_JFD_GREAT_DIGNITARY',		'GreatDignitary',						'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
SELECT	'SND_SOUND_JFD_GREAT_MAGISTRATE', 		'GreatMagistrate',						'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_FORUM_MAGNUM', 	'Wonder_ForumRomanum',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);	

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
SELECT	'SND_WONDER_SPEECH_JFD_WESTMINSTER', 	'Wonder_Westminster',					'DynamicResident'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_BUILDING_JFD_CHANCERY',			'SND_BUILDING_JFD_CHANCERY',			'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_COURT_CHANCERY',	'SND_BUILDING_JFD_COURT_CHANCERY',		'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_HIGH_COURT',		'SND_BUILDING_JFD_HIGH_COURT',			'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_MAGISTRATES_COURT',	'SND_BUILDING_JFD_MAGISTRATES_COURT',	'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_SUPREME_COURT',		'SND_BUILDING_JFD_SUPREME_COURT',		'GAME_SFX', 			-1.0,					100,		100,		0,	     0);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_GREAT_DIGNITARY',		'SND_SOUND_JFD_GREAT_DIGNITARY', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_SOUND_JFD_GREAT_MAGISTRATE',		'SND_SOUND_JFD_GREAT_MAGISTRATE', 		'GAME_MUSIC_STINGS', 	-1.0,					100, 		100, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_FORUM_MAGNUM',	'SND_WONDER_SPEECH_JFD_FORUM_MAGNUM', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1);

INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
SELECT	'AS2D_WONDER_SPEECH_JFD_WESTMINSTER',	'SND_WONDER_SPEECH_JFD_WESTMINSTER', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================