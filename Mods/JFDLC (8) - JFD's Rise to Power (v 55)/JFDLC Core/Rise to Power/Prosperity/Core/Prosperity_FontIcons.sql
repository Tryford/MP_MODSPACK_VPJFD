--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_MIGRATION', 		'JFD_MigrationFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);	
--------------
-- Currencies
--------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_BAHT', 		'JFD_BahtFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_BIRR',		'JFD_BirrFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CHAO',		'JFD_ChaoFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CROWN',		'JFD_CrownFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DARIC',		'JFD_DaricFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DENARIUS',	'JFD_DenariusFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DINAR',		'JFD_DinarFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DIRHAM',		'JFD_DirhamFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DOLLAR',		'JFD_DollarFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DRACHMA',	'JFD_DrachmaFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DUCAT',		'JFD_DucatFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_EURO',		'JFD_EuroFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_FLORIN',		'JFD_FlorinFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_FRANC',		'JFD_FrancFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_GUILDER',	'JFD_GuilderFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_HANSATSU',	'JFD_HansatsuFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_HYPERPYRON',	'JFD_HyperpyronFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_JIAOZI',		'JFD_JiaoziFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_KOCHOSEN',	'JFD_KochosenFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_LIRA',		'JFD_LiraFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_LIVRE',		'JFD_LivreFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_MARK',		'JFD_MarkFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PESO',		'JFD_PesoFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_POUND',		'JFD_PoundFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_REAL',		'JFD_RealFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_RUBLE',		'JFD_RubleFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_RUPEE',		'JFD_RupeeFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_SHEQEL',		'JFD_SheqelFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_WON',		'JFD_WonFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_YEN',		'JFD_YenFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_YUAN',		'JFD_YuanFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ZLOTY',		'JFD_ZlotyFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);		
--------------
-- Fictional
--------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DOLARYDOO',			'JFD_BirrFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_GALACTIC_CREDIT',	'JFD_BirrFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_POKEDOLLAR',			'JFD_PokedollarFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_SEPTIM',				'JFD_BirrFontIcon'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_MIGRATION',			'ICON_FONT_TEXTURE_JFD_MIGRATION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------
-- Currencies
--------------	
INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_BAHT',		'ICON_FONT_TEXTURE_JFD_BAHT',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_BIRR',		'ICON_FONT_TEXTURE_JFD_BIRR',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_CHAO',		'ICON_FONT_TEXTURE_JFD_CHAO',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_CROWN',		'ICON_FONT_TEXTURE_JFD_CROWN',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DARIC',		'ICON_FONT_TEXTURE_JFD_DARIC',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DENARIUS',	'ICON_FONT_TEXTURE_JFD_DENARIUS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DINAR',		'ICON_FONT_TEXTURE_JFD_DINAR',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DIRHAM',		'ICON_FONT_TEXTURE_JFD_DIRHAM',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DOLLAR',		'ICON_FONT_TEXTURE_JFD_DOLLAR',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DRACHMA',	'ICON_FONT_TEXTURE_JFD_DRACHMA',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_DUCAT',		'ICON_FONT_TEXTURE_JFD_DUCAT',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_EURO',		'ICON_FONT_TEXTURE_JFD_EURO',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_FLORIN',		'ICON_FONT_TEXTURE_JFD_FLORIN',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_FRANC',		'ICON_FONT_TEXTURE_JFD_FRANC',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_GUILDER',	'ICON_FONT_TEXTURE_JFD_GUILDER',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_HANSATSU',	'ICON_FONT_TEXTURE_JFD_HANSATSU',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,						IconMapping)
SELECT	'ICON_CURRENCY_JFD_HYPERPYRON',	'ICON_FONT_TEXTURE_JFD_HYPERPYRON',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_JIAOZI',		'ICON_FONT_TEXTURE_JFD_JIAOZI',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_KOCHOSEN',	'ICON_FONT_TEXTURE_JFD_KOCHOSEN',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_LIRA',		'ICON_FONT_TEXTURE_JFD_LIRA',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_LIVRE',		'ICON_FONT_TEXTURE_JFD_LIVRE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_MARK',		'ICON_FONT_TEXTURE_JFD_MARK',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_PESO',		'ICON_FONT_TEXTURE_JFD_PESO',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_POUND',		'ICON_FONT_TEXTURE_JFD_POUND',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_REAL',		'ICON_FONT_TEXTURE_JFD_REAL',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_RUBLE',		'ICON_FONT_TEXTURE_JFD_RUBLE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_RUPEE',		'ICON_FONT_TEXTURE_JFD_RUPEE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_SHEQEL',		'ICON_FONT_TEXTURE_JFD_SHEQEL',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_WON',		'ICON_FONT_TEXTURE_JFD_WON',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_YEN',		'ICON_FONT_TEXTURE_JFD_YEN',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_YUAN',		'ICON_FONT_TEXTURE_JFD_YUAN',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 						IconFontTexture,					IconMapping)
SELECT	'ICON_CURRENCY_JFD_ZLOTY',		'ICON_FONT_TEXTURE_JFD_ZLOTY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------
-- Fictional
--------------	
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,							IconMapping)
SELECT	'ICON_CURRENCY_JFD_DOLARYDOO',			'ICON_FONT_TEXTURE_JFD_DOLARYDOO',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,							IconMapping)
SELECT	'ICON_CURRENCY_JFD_GALACTIC_CREDIT',	'ICON_FONT_TEXTURE_JFD_GALACTIC_CREDIT',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,							IconMapping)
SELECT	'ICON_CURRENCY_JFD_POKEDOLLAR',			'ICON_FONT_TEXTURE_JFD_POKEDOLLAR',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,							IconMapping)
SELECT	'ICON_CURRENCY_JFD_SEPTIM',				'ICON_FONT_TEXTURE_JFD_SEPTIM',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================