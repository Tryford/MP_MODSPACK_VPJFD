--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 						Help,									ResourceClassType, 				AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_CLERICS',		'TXT_KEY_RESOURCE_JFD_CLERICS',		'TXT_KEY_CIV5_JFD_CLERICS_TEXT',	'TXT_KEY_RESOURCE_JFD_CLERICS_HELP',	'RESOURCECLASS_JFD_DECISION',	'ERA_ANCIENT',		3,				'[ICON_JFD_CLERIC]',	0, 				'JFD_PIETY_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================