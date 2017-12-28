
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceUsage,	ResourceClassType, 	AITradeModifier, AIObjective,  IconString, 				PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_SHACKLES',	'TXT_KEY_RESOURCE_JFD_SHACKLES',	'TXT_KEY_CIV5_JFD_SHACKLES_TEXT',	'TXT_KEY_RESOURCE_JFD_SHACKLES_HELP',	ResourceUsage,	ResourceClassType,	30,				 1,			   '[ICON_JFD_SHACKLES]',	0, 				'JFD_SLAVERY_RESOURCE_ATLAS'
FROM Resources WHERE Type = 'RESOURCE_IRON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT	'RESOURCE_JFD_SHACKLES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resource_Flavors
		(ResourceType,				FlavorType,						Flavor)
SELECT	'RESOURCE_JFD_SHACKLES',	'FLAVOR_MILITARY_TRAINING',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
