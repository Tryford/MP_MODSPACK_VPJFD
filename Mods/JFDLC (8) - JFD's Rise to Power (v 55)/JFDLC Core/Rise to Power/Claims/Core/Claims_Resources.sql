--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,							Description,							Civilopedia, 							Help,										ResourceClassType, 				AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_DIGNITARIES',		'TXT_KEY_RESOURCE_JFD_DIGNITARIES',		'TXT_KEY_CIV5_JFD_DIGNITARIES_TEXT',	'TXT_KEY_RESOURCE_JFD_DIGNITARIES_HELP',	'RESOURCECLASS_JFD_DECISION',	'ERA_ANCIENT',		3,				'[ICON_JFD_DIGNITARY]',	0, 				'JFD_CLAIMS_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Resources
SET ResourceClassType = 'RESOURCECLASS_JFD_DECISION', ResourceUsage = 3
WHERE Type = 'RESOURCE_MAGISTRATES';
--==========================================================================================================================
--==========================================================================================================================