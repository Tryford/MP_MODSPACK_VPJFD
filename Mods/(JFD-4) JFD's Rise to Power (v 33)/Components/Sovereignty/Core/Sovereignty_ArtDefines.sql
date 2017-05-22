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
		('SND_SOUND_JFD_GOVERNMENT_THEOCRACY', 		'TheocracyFounded',							'DynamicResident'),
		('SND_SOUND_JFD_PRIVY_COUNCILLOR', 			'PrivyCouncillor',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_ANARCHY', 			'ReformAnarchy',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSABLE', 			'ReformPassable',							'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSED', 			'ReformPassed',								'DynamicResident'),
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
		('AS2D_JFD_GOVERNMENT_THEOCRACY',			'SND_SOUND_JFD_GOVERNMENT_THEOCRACY',		'GAME_SFX',		100,		100),
		('AS2D_JFD_PRIVY_COUNCILLOR',				'SND_SOUND_JFD_PRIVY_COUNCILLOR',			'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_ANARCHY',					'SND_SOUND_JFD_REFORM_ANARCHY',				'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_PASSABLE',				'SND_SOUND_JFD_REFORM_PASSABLE',			'GAME_SFX',		100,		100),
		('AS2D_JFD_REFORM_PASSED',					'SND_SOUND_JFD_REFORM_PASSED',				'GAME_SFX',		100,		100),
		('AS2D_WONDER_SPEECH_JFD_DOGES_PALACE',		'SND_WONDER_SPEECH_JFD_DOGES_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_HOFBURG_PALACE',	'SND_WONDER_SPEECH_JFD_HOFBURG_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_SARGONS_PALACE',	'SND_WONDER_SPEECH_JFD_SARGONS_PALACE',		'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_JFD_ST_PETERS',		'SND_WONDER_SPEECH_JFD_ST_PETERS',			'GAME_SPEECH',	80,			80),
		('AS2D_WONDER_SPEECH_EE_VERSAILLES',		'SND_WONDER_SPEECH_EE_VERSAILLES',			'GAME_SPEECH',	80,			80);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_JFD_ALPHA', 							1,		1,		1, 		0.3),
		('COLOR_JFD_SOVEREIGNTY', 						0.847,	0.631, 	0.070, 	1),
		('COLOR_JFD_SOVEREIGNTY_FADING', 				0.698, 	0.588, 	0.313, 	1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_ANARCHY',				'JFD_AnarchyFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_BURGHERS',				'JFD_BurghersFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_CLERGY',				'JFD_ClergyFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_COMMUNIST',				'JFD_CommunistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_COMMUNIST_ALT',			'JFD_CommunistAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_CONSERVATIVE_ALT',		'JFD_ConservativeAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_ELECTOR',				'JFD_ElectorFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION',				'JFD_FactionFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_FASCIST',				'JFD_FascistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_FASCIST_ALT',			'JFD_FascistAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_INDUSTRIALIST',			'JFD_IndustrialistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_LEGISLATURE',			'JFD_PrivyCouncillorFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_LEGITIMACY',			'JFD_LegtimacyFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_LIBERAL_ALT',			'JFD_LiberalAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_LIBERTARIAN',			'JFD_LibertarianFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_LIBERTARIAN_ALT',		'JFD_LibertarianAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_MERCANTILE',			'JFD_MercantileFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_MILITARY',				'JFD_MilitaryFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_NOBILITY',				'JFD_NobilityFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_POPULIST',				'JFD_PopulistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_REACTIONARY_ALT',		'JFD_ReactionaryAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM',				'JFD_ReformFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM_COOLDOWN',		'JFD_ReformCooldownFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM_NEW',			'JFD_ReformNewFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_RELIGIOUS',				'JFD_ReligiousFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_REVOLUTIONARIES',		'JFD_RevolutionariesFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SENATOR',				'JFD_SenatorFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_ARTIST',		'JFD_ArtistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_DOCTOR',		'JFD_DoctorFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_ENGINEER',	'JFD_EngineerFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_MERCHANT',	'JFD_MerchantFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_MONK',		'JFD_MonkFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SPECIALIST_SCIENTIST',	'JFD_ScientistFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SOCIALIST_ALT',			'JFD_SocialistAltFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_SOVEREIGNTY',			'JFD_SovereigntyFontIcons_22'),
		('ICON_FONT_TEXTURE_JFD_VOTE',					'JFD_VoteFontIcons_22');		
		
UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_BurghersFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_BURGHERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_ClergyFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_CLERGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_NobilityFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_NOBILITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_RevolutionariesFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_REVOLUTIONARIES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_ALT_FONTS_ESTATES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
VALUES	('ICON_JFD_ANARCHY',							'ICON_FONT_TEXTURE_JFD_ANARCHY',				1),
		('ICON_JFD_BURGHERS',							'ICON_FONT_TEXTURE_JFD_BURGHERS',				1),
		('ICON_JFD_CLERGY',								'ICON_FONT_TEXTURE_JFD_CLERGY',					1),
		('ICON_JFD_NOBILITY',							'ICON_FONT_TEXTURE_JFD_NOBILITY',				1),
		('ICON_JFD_REVOLUTIONARIES',					'ICON_FONT_TEXTURE_JFD_REVOLUTIONARIES',		1),
		('ICON_JFD_COMMUNIST', 							'ICON_FONT_TEXTURE_JFD_COMMUNIST',				1),
		('ICON_JFD_COMMUNIST_ALT', 						'ICON_FONT_TEXTURE_JFD_COMMUNIST_ALT',			1),
		('ICON_JFD_CONSERVATIVE_ALT', 					'ICON_FONT_TEXTURE_JFD_CONSERVATIVE_ALT',		1),
		('ICON_JFD_ELECTOR', 							'ICON_FONT_TEXTURE_JFD_ELECTOR',				1),
		('ICON_JFD_FACTION', 							'ICON_FONT_TEXTURE_JFD_FACTION',				1),
		('ICON_JFD_FASCIST', 							'ICON_FONT_TEXTURE_JFD_FASCIST',				1),
		('ICON_JFD_FASCIST_ALT', 						'ICON_FONT_TEXTURE_JFD_FASCIST_ALT',			1),
		('ICON_JFD_LEGISLATURE', 						'ICON_FONT_TEXTURE_JFD_LEGISLATURE',			1),
		('ICON_JFD_LEGITIMACY', 						'ICON_FONT_TEXTURE_JFD_LEGITIMACY',				1),
		('ICON_JFD_LIBERAL_ALT', 						'ICON_FONT_TEXTURE_JFD_LIBERAL_ALT',			1),
		('ICON_JFD_LIBERTARIAN', 						'ICON_FONT_TEXTURE_JFD_LIBERTARIAN',			1),
		('ICON_JFD_LIBERTARIAN_ALT', 					'ICON_FONT_TEXTURE_JFD_LIBERTARIAN_ALT',		1),
		('ICON_JFD_INDUSTRIALIST', 						'ICON_FONT_TEXTURE_JFD_INDUSTRIALIST',			1),
		('ICON_JFD_MERCANTILE', 						'ICON_FONT_TEXTURE_JFD_MERCANTILE',				1),
		('ICON_JFD_MILITARY', 							'ICON_FONT_TEXTURE_JFD_MILITARY',				1),
		('ICON_JFD_POPULIST', 							'ICON_FONT_TEXTURE_JFD_POPULIST',				1),
		('ICON_JFD_REACTIONARY_ALT',					'ICON_FONT_TEXTURE_JFD_REACTIONARY_ALT',		1),
		('ICON_JFD_REFORM',								'ICON_FONT_TEXTURE_JFD_REFORM',					1),
		('ICON_JFD_REFORM_COOLDOWN',					'ICON_FONT_TEXTURE_JFD_REFORM_COOLDOWN',		1),
		('ICON_JFD_REFORM_NEW',							'ICON_FONT_TEXTURE_JFD_REFORM_NEW',				1),
		('ICON_JFD_RELIGIOUS',							'ICON_FONT_TEXTURE_JFD_RELIGIOUS',				1),
		('ICON_JFD_SENATOR',							'ICON_FONT_TEXTURE_JFD_SENATOR',				1),
		('ICON_JFD_SPECIALIST_ARTIST',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_ARTIST',		1),
		('ICON_JFD_SPECIALIST_DOCTOR',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_DOCTOR',		1),
		('ICON_JFD_SPECIALIST_ENGINEER',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_ENGINEER',	1),
		('ICON_JFD_SPECIALIST_MERCHANT',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_MERCHANT',	1),
		('ICON_JFD_SPECIALIST_MONK',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_MONK',		1),
		('ICON_JFD_SPECIALIST_SCIENTIST',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_SCIENTIST',	1),
		('ICON_JFD_SOCIALIST_ALT',						'ICON_FONT_TEXTURE_JFD_SOCIALIST_ALT',			1),
		('ICON_JFD_SOVEREIGNTY',						'ICON_FONT_TEXTURE_JFD_SOVEREIGNTY',			1),
		('ICON_JFD_VOTE',								'ICON_FONT_TEXTURE_JFD_VOTE',					1);
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('LEADER_ATLAS', 								45, 		'leaderportraits360.dds',							8, 				8),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',				256, 		'JFD_SovereigntyBuildingAtlas_256.dds',				1, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',				128, 		'JFD_SovereigntyBuildingAtlas_128.dds',				1, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',				80, 		'JFD_SovereigntyBuildingAtlas_80.dds',				1, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',				64, 		'JFD_SovereigntyBuildingAtlas_64.dds',				1, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',				45, 		'JFD_SovereigntyBuildingAtlas_45.dds',				1, 				1),
		('JFD_SOVEREIGNTY_GOVERNMENT_ATLAS', 			128, 		'JFD_SovereigntyGovernmentAtlas_128.dds',			3, 				2),
		('JFD_SOVEREIGNTY_GOVERNMENT_ATLAS', 			80, 		'JFD_SovereigntyGovernmentAtlas_80.dds',			3, 				2),
		('JFD_SOVEREIGNTY_GOVERNMENT_ATLAS', 			64, 		'JFD_SovereigntyGovernmentAtlas_64.dds',			3, 				2),
		('JFD_SOVEREIGNTY_GOVERNMENT_ATLAS', 			45, 		'JFD_SovereigntyGovernmentAtlas_45.dds',			3, 				2),
		('JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS',		128, 		'JFD_SovereigntyAlphaAtlas_128.dds',				3, 				2),
		('JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS',		48, 		'JFD_SovereigntyAlphaAtlas_48.dds',					3, 				2),
		('JFD_SOVEREIGNTY_MISSION_ATLAS',				64, 		'JFD_SovereigntyMissionAtlas_64.dds',				1, 				1),
		('JFD_SOVEREIGNTY_MISSION_ATLAS',				45, 		'JFD_SovereigntyMissionAtlas_45.dds',				1, 				1),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',				256, 		'JFD_SovereigntyWonderAtlas_256.dds',				3, 				2),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',				128, 		'JFD_SovereigntyWonderAtlas_128.dds',				3, 				2),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',				80, 		'JFD_SovereigntyWonderAtlas_80.dds',				3, 				2),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',				64, 		'JFD_SovereigntyWonderAtlas_64.dds',				3, 				2),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',				45, 		'JFD_SovereigntyWonderAtlas_45.dds',				3, 				2);
--==========================================================================================================================
--==========================================================================================================================