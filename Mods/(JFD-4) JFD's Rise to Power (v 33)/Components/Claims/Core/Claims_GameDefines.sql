--==========================================================================================================================	
-- DEFINES
--=====================================================e=====================================================================			
-- Defines
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Defines
		(Name,										Value)
SELECT	'JFD_CID_CLAIMS_ALLIED_TURNS',				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO Defines
		(Name,										Value)
SELECT	'JFD_RTP_DEFAULT_EXPENDED_DIGNITARIES',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,										Value)
SELECT	'JFD_RTP_DEFAULT_EXPENDED_MAGISTRATES',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Defines
SET Value = 25
WHERE Name = 'MINOR_CIV_BUYOUT_TURNS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 
		(Type, 							BuildingClass, 				Cost, 		FaithCost,	GreatWorkCount,	 NeverCapture,	PrereqTech,		Description, 							Help)
SELECT	'BUILDING_JFD_CLAIMED_CITY', 	'BUILDINGCLASS_JFD_RTP',	-1,			-1,			-1,				 1,				NULL,			'TXT_KEY_BUILDING_JFD_CLAIMED_CITY', 	'TXT_KEY_BUILDING_JFD_CLAIMED_CITY_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,							Description,							Civilopedia, 								Help,										ResourceClassType, 		AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_DIGNITARIES',		'TXT_KEY_RESOURCE_JFD_DIGNITARIES',		'TXT_KEY_CIV5_JFD_DIGNITARIES_TEXT',		'TXT_KEY_RESOURCE_JFD_DIGNITARIES_HELP',	'RESOURCECLASS_RUSH',	'ERA_ANCIENT',		0,				'[ICON_JFD_DIGNITARY]',	0, 				'JFD_CLAIMS_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================