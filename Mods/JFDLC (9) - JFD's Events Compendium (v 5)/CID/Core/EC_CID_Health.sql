--==========================================================================================================================
-- EPIDEMICS
--==========================================================================================================================
-- JFD_Epidemics
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_Plagues
		(Type,								IsEventOnly,	BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_POSSESSION',			1,				'BUILDING_JFD_PLAGUE_POSSESSION',		'TXT_KEY_PLAGUE_JFD_POSSESSION',	'[ICON_JFD_PLAGUE_POSSESSION]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Dummies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_POSSESSION',		'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_POSSESSION',		'TXT_KEY_BUILDING_JFD_PLAGUE_POSSESSION_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
