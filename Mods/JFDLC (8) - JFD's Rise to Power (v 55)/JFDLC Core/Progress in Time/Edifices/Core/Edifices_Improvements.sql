--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',			'TXT_KEY_BUILDING_COLOSSUS',			0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',			'BW_ATLAS_2',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);				
				
INSERT INTO Improvements				
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',			'TXT_KEY_BUILDING_COLOSSUS',			0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',			'BW_ATLAS_2',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',	'TXT_KEY_BUILDING_CRISTO_REDENTOR',		0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',	'BW_ATLAS_2',					24
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);			
			
INSERT INTO Improvements			
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',	'TXT_KEY_BUILDING_CRISTO_REDENTOR',		0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',	'BW_ATLAS_2',					24
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',		'TXT_KEY_BUILDING_NEUSCHWANSTEIN',		0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',		'EXPANSION_BW_ATLAS_2',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);	
	
INSERT INTO Improvements	
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',	'TXT_KEY_BUILDING_NEUSCHWANSTEIN',		0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',	'EXPANSION_BW_ATLAS_2',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_ORACLE_B',				'TXT_KEY_BUILDING_ORACLE',				0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_B',				'BW_ATLAS_2',					6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);	
	
INSERT INTO Improvements	
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',			'TXT_KEY_BUILDING_ORACLE',				0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',			'BW_ATLAS_2',					6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',			'TXT_KEY_BUILDING_RED_FORT',			100,				50,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',			'EXPANSION2_WONDER_ATLAS',		9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);	
	
INSERT INTO Improvements	
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',			'TXT_KEY_BUILDING_RED_FORT',			0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',			'EXPANSION2_WONDER_ATLAS',		9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO Improvements
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',		'TXT_KEY_BUILDING_STATUE_OF_LIBERTY',	0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',		'BW_ATLAS_2',					0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);	
	
INSERT INTO Improvements	
		(Type,											Description,							DefenseModifier,	NearbyEnemyDamage,	Permanent,	GraphicalOnly,	ArtDefineTag,											IconAtlas, 						PortraitIndex)
SELECT	'IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',	'TXT_KEY_BUILDING_STATUE_OF_LIBERTY',	0,					0,					1,			1,				'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',	'BW_ATLAS_2',					0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================