--==========================================================================================================================
-- GAME SPEEDS
--==========================================================================================================================
-- GameSpeed_JFD_PietyThresholds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO GameSpeed_JFD_PietyThresholds
		(GameSpeedType,		MaxThreshold,	PietyYieldMod,	RestingRateMod)
SELECT	Type,				100,			100,			0 -- 200, 0.5
FROM GameSpeeds WHERE Type = 'GAMESPEED_HISTORIC'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO GameSpeed_JFD_PietyThresholds
		(GameSpeedType,		MaxThreshold,	PietyYieldMod,	RestingRateMod)
SELECT	Type,				100,			0,				0 -- 200, 0.5
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO GameSpeed_JFD_PietyThresholds
		(GameSpeedType,		MaxThreshold,	PietyYieldMod,	RestingRateMod) 
SELECT	Type,				100,			100,			0 -- 200, 0.75
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
-- PIETY LEVELS
--==========================================================================================================================
-- JFD_PietyLevels
-----------------------------------------------------------------------------------------------------		
INSERT INTO JFD_PietyLevels
		(Type,							Description,								ShortDescription,									Help,										ChangeHelp,											TextColor,						AdoptModifier,	ChangeResistanceTurns,	 ChangeFaithCost,	ConversionStrengthModifier,	EventWeightModNegative, EventWeightModPositive, ReformOpinionMod,	ReligionSpreadsModifier,	RewardModifier,		ConversionRate)
VALUES	('PIETY_LEVEL_JFD_HERETICAL',	'TXT_KEY_PIETY_LEVEL_JFD_HERETICAL_DESC',	'TXT_KEY_PIETY_LEVEL_JFD_HERETICAL_SHORT_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_HERETICAL_HELP',	'TXT_KEY_PIETY_LEVEL_JFD_HERETICAL_CHANGE_HELP',	'[COLOR_JFD_PIETY_HERETICAL]',	75,				2,						 0,					-75,						20,						1,						-100,				-1,							0.5,				25),
		('PIETY_LEVEL_JFD_POOR',		'TXT_KEY_PIETY_LEVEL_JFD_POOR_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_POOR_SHORT_DESC',			'TXT_KEY_PIETY_LEVEL_JFD_POOR_HELP',		'TXT_KEY_PIETY_LEVEL_JFD_POOR_CHANGE_HELP',			'[COLOR_JFD_PIETY_POOR]',		50,				1,						 0,					-50,						10,						3,						-50,				0,							0.7,				10),
		('PIETY_LEVEL_JFD_NEUTRAL',		'TXT_KEY_PIETY_LEVEL_JFD_NEUTRAL_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_NEUTRAL_SHORT_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_NEUTRAL_HELP',		NULL,												'[COLOR_JFD_PIETY_NEUTRAL]',	0,				0,						 0,					0,							5,						5,						0,					0,							1,					0),
		('PIETY_LEVEL_JFD_VIRTUOUS',	'TXT_KEY_PIETY_LEVEL_JFD_VIRTUOUS_DESC',	'TXT_KEY_PIETY_LEVEL_JFD_VIRTUOUS_SHORT_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_VIRTUOUS_HELP',	'TXT_KEY_PIETY_LEVEL_JFD_VIRTUOUS_CHANGE_HELP',		'[COLOR_JFD_PIETY_VIRTUOUS]',	-25,			0,						 50,				50,							3,						10,						50,					0,							1.5,				10),
		('PIETY_LEVEL_JFD_DEVOUT',		'TXT_KEY_PIETY_LEVEL_JFD_DEVOUT_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_DEVOUT_SHORT_DESC',		'TXT_KEY_PIETY_LEVEL_JFD_DEVOUT_HELP',		'TXT_KEY_PIETY_LEVEL_JFD_DEVOUT_CHANGE_HELP',		'[COLOR_JFD_PIETY_DEVOUT]',		-50,			0,						 100,				100,						1,						20,						100,				1,							2,					25);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PietyLevel_GameSpeedThresholds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_DEVOUT',		Type,					100,			85
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_VIRTUOUS',		Type,					85,				60
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_NEUTRAL',		Type,					60,				50
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_POOR',			Type,					50,				15
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_HERETICAL',	Type,					15,				0
FROM GameSpeeds WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK', 'GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_DEVOUT',		Type,					200,			170
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_VIRTUOUS',		Type,					170,			120
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_NEUTRAL',		Type,					120,			100
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_POOR',			Type,					100,			30
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(PietyLevelType,				GameSpeedType,			MaxThreshold,	MinThreshold)
SELECT	'PIETY_LEVEL_JFD_HERETICAL',	Type,					30,				0
FROM GameSpeeds WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC', 'GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_PietyLevel_GameSpeedThresholds
		(GameSpeedType,			PietyLevelType, MaxThreshold, MinThreshold)
SELECT	'GAMESPEED_HISTORIC',	PietyLevelType, MaxThreshold, MinThreshold
FROM JFD_PietyLevel_GameSpeedThresholds WHERE GameSpeedType = 'GAMESPEED_STANDARD'
AND EXISTS (SELECT Type FROM GameSpeeds WHERE Type = 'GAMESPEED_HISTORIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================