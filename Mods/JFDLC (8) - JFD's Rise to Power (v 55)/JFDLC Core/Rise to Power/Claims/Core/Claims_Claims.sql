--==========================================================================================================================	
-- CLAIMS
--==========================================================================================================================			
-- JFD_Claims
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Claims
		(Type,					Description,						Help,								CausesHelp,									CausesNeeded,	DignitaryCost,	GoldCostModifier,	ResistanceModifier,		IconString)
SELECT	'CLAIM_JFD_STRONG',		'TXT_KEY_CLAIM_JFD_STRONG_DESC',	'TXT_KEY_CLAIM_JFD_STRONG_HELP',	'TXT_KEY_CLAIM_JFD_STRONG_CAUSES_HELP',		5,				3,				75,					10,						'[ICON_JFD_CLAIM_STRONG]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO JFD_Claims
		(Type,					Description,						Help,								CausesHelp,									CausesNeeded,	DignitaryCost,	GoldCostModifier,	ResistanceModifier,		IconString)
SELECT	'CLAIM_JFD_MEDIUM',		'TXT_KEY_CLAIM_JFD_MEDIUM_DESC',	'TXT_KEY_CLAIM_JFD_MEDIUM_HELP',	'TXT_KEY_CLAIM_JFD_MEDIUM_CAUSES_HELP',		3,				4,				100,				50,						'[ICON_JFD_CLAIM_MEDIUM]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO JFD_Claims
		(Type,					Description,						Help,								CausesHelp,									CausesNeeded,	DignitaryCost,	GoldCostModifier,	ResistanceModifier,		IconString)
SELECT	'CLAIM_JFD_WEAK',		'TXT_KEY_CLAIM_JFD_WEAK_DESC',		'TXT_KEY_CLAIM_JFD_WEAK_HELP',		'TXT_KEY_CLAIM_JFD_WEAK_CAUSES_HELP',		0,				5,				150,				100,					'[ICON_JFD_CLAIM_WEAK]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--==========================================================================================================================
-- TEXT
--==========================================================================================================================	
-- Language_en_US
----------------------------------------------------------------------------------------------------------------------------	
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Annexing[ENDCOLOR] the City into your empire causes it to become a normal City that produces quite a bit of extra [ICON_HAPPINESS_4] Unhappiness.[NEWLINE][NEWLINE]Annexing this City will increase [ICON_HAPPINESS_4] Unhappiness by {1_Num}.[NEWLINE][NEWLINE]City-States that you have [ICON_JFD_CLAIM_MEDIUM] Claimed are exempt from these penalties.'
WHERE Tag = 'TXT_KEY_POPUP_CITY_CAPTURE_INFO_ANNEX' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'Pledging to protect a City-State lets the other major civilizations in the world know that you will protect the City-State from attacks and tribute demands.[NEWLINE][NEWLINE]During protection, your resting point for [ICON_INFLUENCE] Influence with this City-State is increased by {1_InfluenceMinimum} and you will earn [COLOR_POSITIVE_TEXT]{3_InfluenceBoost}[ENDCOLOR] [ICON_INFLUENCE] Influence from quests completed for this City-State. Also, the City-State capital''s base [ICON_STRENGTH] Combat Strength will be increased by [COLOR_POSITIVE_TEXT]{4_DefenseBoost}%[ENDCOLOR], up to a global maximum of [COLOR_POSITIVE_TEXT]{5_DefenseTotal}%[ENDCOLOR]. [NEWLINE][NEWLINE]Protection cannot be revoked until {2_TurnsMinimum} turns after the pledge is made.'
WHERE Tag = 'TXT_KEY_POP_CSTATE_PLEDGE_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================