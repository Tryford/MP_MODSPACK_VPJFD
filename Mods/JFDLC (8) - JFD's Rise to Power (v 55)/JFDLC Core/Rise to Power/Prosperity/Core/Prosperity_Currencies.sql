--==========================================================================================================================
-- CURRENCIES
--==========================================================================================================================
-- JFD_Currencies
------------------------------------------------------------	
INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_BAHT',		'TXT_KEY_CURRENCY_JFD_BAHT_DESC',		0,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_BAHT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_BIRR',		'TXT_KEY_CURRENCY_JFD_BIRR_DESC',		31,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_BIRR]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_CHAO',		'TXT_KEY_CURRENCY_JFD_CHAO_DESC',		1,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_CHAO]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_CROWN',		'TXT_KEY_CURRENCY_JFD_CROWN_DESC',		2,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_CROWN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DARIC',		'TXT_KEY_CURRENCY_JFD_DARIC_DESC',		3,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DARIC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DENARIUS',	'TXT_KEY_CURRENCY_JFD_DENARIUS_DESC',	4,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DENARIUS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DINAR',		'TXT_KEY_CURRENCY_JFD_DINAR_DESC',		5,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DINAR]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DIRHAM',		'TXT_KEY_CURRENCY_JFD_DIRHAM_DESC',		6,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DIRHAM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DOLLAR',		'TXT_KEY_CURRENCY_JFD_DOLLAR_DESC',		7,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DOLLAR]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DRACHMA',		'TXT_KEY_CURRENCY_JFD_DRACHMA_DESC',	8,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DRACHMA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_DUCAT',		'TXT_KEY_CURRENCY_JFD_DUCAT_DESC',		9,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DUCAT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_EURO',		'TXT_KEY_CURRENCY_JFD_EURO_DESC',		10,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_EURO]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_FLORIN',		'TXT_KEY_CURRENCY_JFD_FLORIN_DESC',		11,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_FLORIN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_FRANC',		'TXT_KEY_CURRENCY_JFD_FRANC_DESC',		12,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_FRANC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_GUILDER',		'TXT_KEY_CURRENCY_JFD_GUILDER_DESC',	30,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_GUILDER]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_HANSATSU',	'TXT_KEY_CURRENCY_JFD_HANSATSU_DESC',	13,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_HANSATSU]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_HYPERPYRON',	'TXT_KEY_CURRENCY_JFD_HYPERPYRON_DESC',	14,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_HYPERPYRON]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_LIRA',		'TXT_KEY_CURRENCY_JFD_LIRA_DESC',		29,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_LIRA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_JIAOZI',		'TXT_KEY_CURRENCY_JFD_JIAOZI_DESC',		15,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_JIAOZI]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_KOCHOSEN',	'TXT_KEY_CURRENCY_JFD_KOCHOSEN_DESC',	16,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_KOCHOSEN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_LIVRE',		'TXT_KEY_CURRENCY_JFD_LIVRE_DESC',		17,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_LIVRE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_MARK',		'TXT_KEY_CURRENCY_JFD_MARK_DESC',		18,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_MARK]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_PESO',		'TXT_KEY_CURRENCY_JFD_PESO_DESC',		19,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_PESO]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_POUND',		'TXT_KEY_CURRENCY_JFD_POUND_DESC',		20,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_POUND]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_REAL',		'TXT_KEY_CURRENCY_JFD_REAL_DESC',		21,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_REAL]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_RUBLE',		'TXT_KEY_CURRENCY_JFD_RUBLE_DESC',		22,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_RUBLE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_RUPEE',		'TXT_KEY_CURRENCY_JFD_RUPEE_DESC',		23,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_RUPEE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_SHEQEL',		'TXT_KEY_CURRENCY_JFD_SHEQEL_DESC',		24,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_SHEQEL]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_STATER',		'TXT_KEY_CURRENCY_JFD_STATER_DESC',		24,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_STATER]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_WON',			'TXT_KEY_CURRENCY_JFD_WON_DESC',		25,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_WON]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_YEN',			'TXT_KEY_CURRENCY_JFD_YEN_DESC',		26,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_YEN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_YUAN',		'TXT_KEY_CURRENCY_JFD_YUAN_DESC',		27,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_YUAN]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,						Description,							PortraitIndex,	IconAtlas,							IconString)
SELECT	'CURRENCY_JFD_ZLOTY',		'TXT_KEY_CURRENCY_JFD_ZLOTY_DESC',		28,				'JFD_PROSPERITY_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_ZLOTY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
------------------------------------------------------------
-- Fictional
------------------------------------------------------------	
INSERT INTO JFD_Currencies
		(Type,								Description,									PortraitIndex,	IconAtlas,										IconString)
SELECT	'CURRENCY_JFD_DOLARYDOO',			'TXT_KEY_CURRENCY_JFD_DOLARYDOO_DESC',			29,				'JFD_PROSPERITY_FICTIONAL_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_DOLARYDOO]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,								Description,									PortraitIndex,	IconAtlas,										IconString)
SELECT	'CURRENCY_JFD_GALACTIC_CREDIT',		'TXT_KEY_CURRENCY_JFD_GALACTIC_CREDIT_DESC',	29,				'JFD_PROSPERITY_FICTIONAL_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_GALACTIC_CREDIT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);

INSERT INTO JFD_Currencies
		(Type,								Description,									PortraitIndex,	IconAtlas,										IconString)
SELECT	'CURRENCY_JFD_POKEDOLLAR',			'TXT_KEY_CURRENCY_JFD_POKEDOLLAR_DESC',			29,				'JFD_PROSPERITY_FICTIONAL_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_SEPTIM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);
INSERT INTO JFD_Currencies
		(Type,								Description,									PortraitIndex,	IconAtlas,										IconString)
SELECT	'CURRENCY_JFD_SEPTIM',				'TXT_KEY_CURRENCY_JFD_SEPTIM_DESC',				29,				'JFD_PROSPERITY_FICTIONAL_CURRENCIES_ATLAS',	'[ICON_CURRENCY_JFD_SEPTIM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================