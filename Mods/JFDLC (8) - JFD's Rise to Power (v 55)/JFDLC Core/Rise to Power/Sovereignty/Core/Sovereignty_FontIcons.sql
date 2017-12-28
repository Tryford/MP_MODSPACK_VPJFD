--==========================================================================================================================
-- FONT ICONS
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
		('ICON_FONT_TEXTURE_JFD_EMPEROR',				'JFD_EmperorFontIcons_22'),
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
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_ClergyFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_CLERGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_NobilityFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_NOBILITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_ESTATES' AND Value = 1);

UPDATE IconFontTextures
SET IconFontTextureFile = 'JFD_RevolutionariesFontIconsAlt_22'
WHERE IconFontTexture = 'ICON_FONT_TEXTURE_JFD_REVOLUTIONARIES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_ESTATES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,												IconMapping)
VALUES	('ICON_JFD_ANARCHY',							'ICON_FONT_TEXTURE_JFD_ANARCHY',								1),
		('ICON_JFD_BURGHERS',							'ICON_FONT_TEXTURE_JFD_BURGHERS',								1),
		('ICON_JFD_CLERGY',								'ICON_FONT_TEXTURE_JFD_CLERGY',									1),
		('ICON_JFD_NOBILITY',							'ICON_FONT_TEXTURE_JFD_NOBILITY',								1),
		('ICON_JFD_REVOLUTIONARIES',					'ICON_FONT_TEXTURE_JFD_REVOLUTIONARIES',						1),
		('ICON_JFD_COMMUNIST', 							'ICON_FONT_TEXTURE_JFD_COMMUNIST',								1),
		('ICON_JFD_COMMUNIST_ALT', 						'ICON_FONT_TEXTURE_JFD_COMMUNIST_ALT',							1),
		('ICON_JFD_CONSERVATIVE_ALT', 					'ICON_FONT_TEXTURE_JFD_CONSERVATIVE_ALT',						1),
		('ICON_JFD_ELECTOR', 							'ICON_FONT_TEXTURE_JFD_ELECTOR',								1),
		('ICON_JFD_EMPEROR', 							'ICON_FONT_TEXTURE_JFD_EMPEROR',								1),
		('ICON_JFD_FACTION', 							'ICON_FONT_TEXTURE_JFD_FACTION',								1),
		('ICON_JFD_FASCIST', 							'ICON_FONT_TEXTURE_JFD_FASCIST',								1),
		('ICON_JFD_FASCIST_ALT', 						'ICON_FONT_TEXTURE_JFD_FASCIST_ALT',							1),
		('ICON_JFD_LEGISLATURE', 						'ICON_FONT_TEXTURE_JFD_LEGISLATURE',							1),
		('ICON_JFD_LEGITIMACY', 						'ICON_FONT_TEXTURE_JFD_LEGITIMACY',								1),
		('ICON_JFD_LIBERAL_ALT', 						'ICON_FONT_TEXTURE_JFD_LIBERAL_ALT',							1),
		('ICON_JFD_LIBERTARIAN', 						'ICON_FONT_TEXTURE_JFD_LIBERTARIAN',							1),
		('ICON_JFD_LIBERTARIAN_ALT', 					'ICON_FONT_TEXTURE_JFD_LIBERTARIAN_ALT',						1),
		('ICON_JFD_INDUSTRIALIST', 						'ICON_FONT_TEXTURE_JFD_INDUSTRIALIST',							1),
		('ICON_JFD_MERCANTILE', 						'ICON_FONT_TEXTURE_JFD_MERCANTILE',								1),
		('ICON_JFD_MILITARY', 							'ICON_FONT_TEXTURE_JFD_MILITARY',								1),
		('ICON_JFD_POPULIST', 							'ICON_FONT_TEXTURE_JFD_POPULIST',								1),
		('ICON_JFD_REACTIONARY_ALT',					'ICON_FONT_TEXTURE_JFD_REACTIONARY_ALT',						1),
		('ICON_JFD_REFORM',								'ICON_FONT_TEXTURE_JFD_REFORM',									1),
		('ICON_JFD_REFORM_COOLDOWN',					'ICON_FONT_TEXTURE_JFD_REFORM_COOLDOWN',						1),
		('ICON_JFD_REFORM_NEW',							'ICON_FONT_TEXTURE_JFD_REFORM_NEW',								1),
		('ICON_JFD_RELIGIOUS',							'ICON_FONT_TEXTURE_JFD_RELIGIOUS',								1),
		('ICON_JFD_SENATOR',							'ICON_FONT_TEXTURE_JFD_SENATOR',								1),
		('ICON_JFD_SPECIALIST_ARTIST',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_ARTIST',						1),
		('ICON_JFD_SPECIALIST_DOCTOR',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_DOCTOR',						1),
		('ICON_JFD_SPECIALIST_ENGINEER',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_ENGINEER',					1),
		('ICON_JFD_SPECIALIST_MERCHANT',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_MERCHANT',					1),
		('ICON_JFD_SPECIALIST_MONK',					'ICON_FONT_TEXTURE_JFD_SPECIALIST_MONK',						1),
		('ICON_JFD_SPECIALIST_SCIENTIST',				'ICON_FONT_TEXTURE_JFD_SPECIALIST_SCIENTIST',					1),
		('ICON_JFD_SOCIALIST_ALT',						'ICON_FONT_TEXTURE_JFD_SOCIALIST_ALT',							1),
		('ICON_JFD_SOVEREIGNTY',						'ICON_FONT_TEXTURE_JFD_SOVEREIGNTY',							1),
		('ICON_JFD_VOTE',								'ICON_FONT_TEXTURE_JFD_VOTE',									1);
--==========================================================================================================================
--==========================================================================================================================