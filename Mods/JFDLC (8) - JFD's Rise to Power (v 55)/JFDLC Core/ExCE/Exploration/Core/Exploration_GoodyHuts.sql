--==========================================================================================================================
-- GOODY HUTS
--==========================================================================================================================
-- GoodyHuts
--------------------------------------------------------------------------------------------------------------------------	
-- INSERT INTO Improvements
		-- (Type,									Description,							ArtDefineTag, 								Water, 	Goody, 	TilesPerGoody,	GoodyRange)
-- SELECT	'IMPROVEMENT_JFD_GOODY_SHIP_EURO',		'TXT_KEY_IMPROVEMENT_JFD_GOODY_SHIP', 	'ART_DEF_IMPROVEMENT_JFD_SHIPWRECK_EURO',	1,		1,		40,				3
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TERRAIN_ADDITIONS_SHIPWRECKS' AND Value = 1);

-- INSERT INTO Improvements
		-- (Type,									Description,							ArtDefineTag, 								Water, 	Goody, 	TilesPerGoody,	GoodyRange)
-- SELECT	'IMPROVEMENT_JFD_GOODY_SHIP_AFRI',		'TXT_KEY_IMPROVEMENT_JFD_GOODY_SHIP', 	'ART_DEF_IMPROVEMENT_JFD_SHIPWRECK_AFRI',	1,		1,		40,				3
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TERRAIN_ADDITIONS_SHIPWRECKS' AND Value = 1);

-- INSERT INTO Improvements
		-- (Type,									Description,							ArtDefineTag, 								Water, 	Goody, 	TilesPerGoody,	GoodyRange)
-- SELECT	'IMPROVEMENT_JFD_GOODY_SHIP_ASIA',		'TXT_KEY_IMPROVEMENT_JFD_GOODY_SHIP', 	'ART_DEF_IMPROVEMENT_JFD_SHIPWRECK_ASIA',	1,		1,		40,				3
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TERRAIN_ADDITIONS_SHIPWRECKS' AND Value = 1);

INSERT OR REPLACE INTO GoodyHuts
		(Type,				Description,				ChooseDescription,					Sound,					GoldenAge)
SELECT	'GOODY_GOLDEN_AGE',	'TXT_KEY_GOODY_GOLDEN_AGE',	'TXT_KEY_GOODY_CHOOSE_GOLDEN_AGE',	'AS2D_GOODY_WARRIOR',	200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_GOLDEN_AGE' AND Value = 1);	

INSERT OR REPLACE INTO GoodyHuts
		(Type,				Description,				ChooseDescription,					Sound,					Production)
SELECT	'GOODY_PRODUCTION',	'TXT_KEY_GOODY_PRODUCTION',	'TXT_KEY_GOODY_CHOOSE_PRODUCTION',	'AS2D_GOODY_WARRIOR',	40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_PRODUCTION' AND Value = 1);

INSERT OR REPLACE INTO GoodyHuts
		(Type,				Description,				ChooseDescription,					Sound,					FreeTiles)
SELECT	'GOODY_TILES',		'TXT_KEY_GOODY_TILES',		'TXT_KEY_GOODY_CHOOSE_FREE_TILES',	'AS2D_GOODY_WARRIOR',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_TILES' AND Value = 1);
--==========================================================================================================================
-- HANDICAPS
--==========================================================================================================================
-- HandicapInfo_Goodies
--------------------------------------------------------------------------------------------------------------------------		
INSERT OR REPLACE INTO HandicapInfo_Goodies
		(HandicapType,		GoodyType)
SELECT	Type,				'GOODY_GOLDEN_AGE'
FROM HandicapInfos WHERE Type IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_GOLDEN_AGE' AND Value = 1);
	
INSERT OR REPLACE INTO HandicapInfo_Goodies
		(HandicapType,		GoodyType)
SELECT	Type,				'GOODY_PRODUCTION'
FROM HandicapInfos WHERE Type IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_PRODUCTION' AND Value = 1);

INSERT OR REPLACE INTO HandicapInfo_Goodies
		(HandicapType,		GoodyType)
SELECT	Type,				'GOODY_TILES'
FROM HandicapInfos WHERE Type IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_TILES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================		
		
			
		
			