--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CUSTOMS_HOUSE',			'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_TRADING_POST',				'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- PROVINCES
--==========================================================================================================================
-- Province_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Province_DevelopmentMods
		(ProvinceType, 							DevelopmentThresholdMod)
SELECT	'PROVINCE_JFD_CAPITAL',					-30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Province_DevelopmentMods
		(ProvinceType, 							DevelopmentThresholdMod)
SELECT	'PROVINCE_JFD_COUNTY',					-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Province_DevelopmentMods
		(ProvinceType, 							DevelopmentThresholdMod)
SELECT	'PROVINCE_JFD_DUCHY',					-30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================