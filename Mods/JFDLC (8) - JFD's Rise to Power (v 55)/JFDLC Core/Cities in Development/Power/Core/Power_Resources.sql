
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceUsage,	ResourceClassType, 	AITradeModifier, AIObjective, ConstAppearance, 	Player, IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_POWER',		'TXT_KEY_RESOURCE_JFD_POWER',		'TXT_KEY_CIV5_JFD_POWER_TEXT',		'TXT_KEY_RESOURCE_JFD_POWER_HELP',		ResourceUsage,	ResourceClassType,	AITradeModifier, AIObjective, ConstAppearance,	Player, '[ICON_JFD_POWER]',		0, 				NULL
FROM Resources WHERE Type = 'RESOURCE_IRON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT	'RESOURCE_JFD_POWER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resource_Flavors
		(ResourceType,			FlavorType,				Flavor)
SELECT	'RESOURCE_JFD_POWER',	'FLAVOR_PRODUCTION',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================]