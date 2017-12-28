--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 											Class, 				 GoldenAgeTurns, Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 										ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES	('UNIT_DECISIONS_JFD_OTTOMAN_CALLIGRAPHER', 	'UNITCLASS_ARTIST',	 8,				 -1,	2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_DECISIONS_JFD_OTTOMAN_CALLIGRAPHER',	0,				-1,					'ART_DEF_UNIT_GREAT_WRITER',	6,						'EXPANSION2_UNIT_FLAG_ATLAS',	6, 				'EXPANSION2_UNIT_ATLAS',	'GREAT_PERSON');
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 									SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DECISIONS_JFD_OTTOMAN_CALLIGRAPHER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARTIST';	
------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Unit_UniqueNames 
		(UnitType, 									UniqueName,															GreatWorkType)
VALUES	('UNIT_DECISIONS_JFD_OTTOMAN_CALLIGRAPHER', 'TXT_KEY_GREAT_PERSON_JFD_OTTOMAN_CALLIGRAPHER_DESC',				'GREAT_WORK_JFD_SULEIMAN_TUGHRA');
------------------------------------------------------------------------------------------------------------------------	
-- GreatWorks
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO GreatWorks 
		(Type, 										GreatWorkClassType,		Description,								Audio,							Image)
VALUES	('GREAT_WORK_JFD_SULEIMAN_TUGHRA',			'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_JFD_SULEIMAN_TUGHRA',	'AS2D_GREAT_ARTIST_ARTWORK',	'gw_suleiman_signature.dds');
--==========================================================================================================================
--==========================================================================================================================