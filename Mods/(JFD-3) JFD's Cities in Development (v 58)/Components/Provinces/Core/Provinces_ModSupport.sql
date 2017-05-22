--==========================================================================================================================	
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================	
-- Resources
------------------------------
UPDATE Resources
SET TechCityTrade = 'TECH_TRAPPING'
WHERE Type = 'RESOURCE_JFD_FEATHERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
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
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_CID_Provinces_Events.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================

