--==========================================================================================================================	
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================	
-- Resources
------------------------------
UPDATE Resources
SET TechCityTrade = 'TECH_TRAPPING'
WHERE Type = 'RESOURCE_JFD_FEATHERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 				ImprovementType)
SELECT 	'RESOURCE_JFD_FEATHERS',	Type
FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_TRADING_POST', 'IMPROVEMENT_OUTDOOR_MARKET', 'IMPROVEMENT_VILLAGE', 'IMPROVEMENT_VILLAGE_PROD_DUMMY', 'IMPROVEMENT_TOWN', 'IMPROVEMENT_JFD_TOWN', 'IMPROVEMENT_JFD_VILLAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================	
-- JFD SOVEREIGNTY
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 								Help, 													Sound, 				CannotBeChosen, 	MaxHitPointsChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_LEVY_FRONTLINE', 			'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE',		'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE_HELP', 			'AS2D_IF_LEVELUP', 	1, 					-25,				57, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 										Description, 								Help, 													Sound, 				CannotBeChosen, 	MaxHitPointsChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_LEVY_FRONTLINE_DEFENSIVE', 	'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE',		'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE_HELP_DEFENSIVE', 	'AS2D_IF_LEVELUP', 	1, 					-25,				57, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEVY_FRONTLINE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
--Manor
UPDATE Buildings
SET PrereqTech = NULL, Cost = -1, GreatWorkCount = -1
WHERE Type = 'BUILDING_EE_MANOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================

