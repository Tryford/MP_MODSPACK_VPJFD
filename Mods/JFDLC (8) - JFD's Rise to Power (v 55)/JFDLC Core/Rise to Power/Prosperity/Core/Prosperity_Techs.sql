--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technology_TradeRouteDomainExtraRange
SET TechType = 'TECH_ASTRONOMY'
WHERE TechType = 'TECH_COMPASS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_TECH_CHANGES_SEA_TRADE_RANGE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,				AllowCurrencies,	EffectToolTip)
SELECT	'TECH_CURRENCY',		1,					'TXT_KEY_JFD_ALLOWS_CURRENCIES'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================