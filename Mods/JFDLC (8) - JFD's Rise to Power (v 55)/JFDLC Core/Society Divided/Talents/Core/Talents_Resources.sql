--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceClassType, 				AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_INVENTORS',	'TXT_KEY_RESOURCE_JFD_INVENTORS',	'TXT_KEY_CIV5_JFD_INVENTORS_TEXT',	'TXT_KEY_RESOURCE_JFD_INVENTORS_HELP',	'RESOURCECLASS_JFD_DECISION',	'ERA_ANCIENT',		3,				'[ICON_JFD_INVENTOR]',	0, 				'JFD_TALENTS_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================