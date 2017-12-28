--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceClassType, 				AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_CAPTAINS',	'TXT_KEY_RESOURCE_JFD_CAPTAINS',	'TXT_KEY_CIV5_JFD_CAPTAINS_TEXT',	'TXT_KEY_RESOURCE_JFD_CAPTAINS_HELP',	'RESOURCECLASS_JFD_DECISION',	'ERA_ANCIENT',		3,				'[ICON_JFD_CAPTAIN]',	0, 				'JFD_SUPPLY_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================