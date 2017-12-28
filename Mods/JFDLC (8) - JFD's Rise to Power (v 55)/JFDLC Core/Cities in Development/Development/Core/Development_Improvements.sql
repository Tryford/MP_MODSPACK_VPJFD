--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvement_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_ACADEMY',					'YIELD_JFD_DEVELOPMENT',	30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CITADEL',					'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CUSTOMS_HOUSE',			'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CHATEAU',					'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_JFD_ESTATE',				'YIELD_JFD_DEVELOPMENT',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_FORT',						'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_HOLY_SITE',				'YIELD_JFD_DEVELOPMENT',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_KASBAH',					'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_MANUFACTORY',				'YIELD_JFD_DEVELOPMENT',	30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

--INSERT INTO Improvement_Yields
--		(ImprovementType, 						YieldType,					Yield)
--SELECT	'IMPROVEMENT_JFD_TRADING_POST',			'YIELD_JFD_DEVELOPMENT',	10
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_JFD_TOWN',					'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_JFD_VILLAGE',				'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================