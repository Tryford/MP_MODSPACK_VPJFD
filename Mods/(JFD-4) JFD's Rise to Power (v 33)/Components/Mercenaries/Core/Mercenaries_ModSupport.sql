--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCENARY_ARMY_HELP_CBP'
WHERE Type = 'POLICY_MARITIME_INFRASTRUCTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_MERCENARIES_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_JFD_ContractMods
SET PolicyType = 'POLICY_MARITIME_INFRASTRUCTURE', CostMod = -15
WHERE PolicyType = 'POLICY_TRADE_UNIONS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET GridX = 3, GridY = 6, Cost = 100
WHERE Type = 'TECH_JFD_MERCENARIES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technologies
SET GridY = 4
WHERE Type = 'TECH_MATHEMATICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technologies
SET GridY = 6
WHERE Type = 'TECH_ENGINEERING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
-----------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_MERCENARIES' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_MERCENARIES', 		'TECH_HORSEBACK_RIDING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_CURRENCY',				'TECH_JFD_MERCENARIES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- BuildingClass_JFD_District
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_MILITARY'
FROM BuildingClasses WHERE Type IN ('BUILDING_JFD_JIAYUGUAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);	
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Contracts
--------------------------------------------------------------------------------------------------------------------------
UPDATE Contracts
SET PrereqEra = 'ERA_ENLIGHTENMENT'
WHERE Type IN ('CONTRACT_JFD_HESSIANS', 'CONTRACT_JFD_POTSDAM_GIANTS', 'CONTRACT_JFD_ZOUAVES')
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
--==========================================================================================================================
