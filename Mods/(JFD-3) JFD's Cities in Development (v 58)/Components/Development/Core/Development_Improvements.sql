--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvement_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CITADEL',					'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CHATEAU',					'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_FORT',						'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

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