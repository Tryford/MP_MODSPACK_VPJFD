--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('SUZERAINITY_DEFAULTMINOR_ATLAS', 		256, 		'Suzerainity_DefaultMinor_256.dds',			3, 				2),
		('SUZERAINITY_DEFAULTMINOR_ATLAS', 		128, 		'Suzerainity_DefaultMinor_128.dds',			3, 				2),
		('SUZERAINITY_DEFAULTMINOR_ATLAS', 		80, 		'Suzerainity_DefaultMinor_80.dds',			3, 				2),
		('SUZERAINITY_DEFAULTMINOR_ATLAS', 		48, 		'Suzerainity_DefaultMinor_48.dds',			3, 				2),
		('SUZERAINITY_DEFAULTMINOR_ATLAS', 		32, 		'Suzerainity_DefaultMinor_32.dds',			3, 				2),
		('SUZERAINITY_DEFAULTMINOR_ATLAS',		24, 		'Suzerainity_DefaultMinor_24.dds',			3, 				2),

		('SUZERAINITY_CULTUREDMINOR_ATLAS',		80, 		'SuzeraintyCultured_80.dds',				7, 				2),
		('SUZERAINITY_CULTUREDMINOR_ATLAS',		48, 		'SuzeraintyCultured_48.dds',				7, 				2),
		('SUZERAINITY_CULTUREDMINOR_ATLAS',		32, 		'SuzeraintyCultured_32.dds',				7, 				2),

		('SUZERAINITY_FERTILEMINOR_ATLAS',		80, 		'SuzeraintyFertile_80.dds',					7, 				2),
		('SUZERAINITY_FERTILEMINOR_ATLAS',		48, 		'SuzeraintyFertile_48.dds',					7, 				2),
		('SUZERAINITY_FERTILEMINOR_ATLAS',		32, 		'SuzeraintyFertile_32.dds',					7, 				2),

		('SUZERAINITY_MERCANTILEMINOR_ATLAS',	80, 		'SuzeraintyMercantile_80.dds',				7, 				2),
		('SUZERAINITY_MERCANTILEMINOR_ATLAS',	48, 		'SuzeraintyMercantile_48.dds',				7, 				2),
		('SUZERAINITY_MERCANTILEMINOR_ATLAS',	32, 		'SuzeraintyMercantile_32.dds',				7, 				2),

		('SUZERAINITY_MILITARISTICMINOR_ATLAS',	80, 		'SuzeraintyMilitaristic_80.dds',			4, 				2),
		('SUZERAINITY_MILITARISTICMINOR_ATLAS',	48, 		'SuzeraintyMilitaristic_48.dds',			4, 				2),
		('SUZERAINITY_MILITARISTICMINOR_ATLAS',	32, 		'SuzeraintyMilitaristic_32.dds',			4, 				2),

		('SUZERAINITY_RELIGIOUSMINOR_ATLAS',	80, 		'SuzeraintyReligious_80.dds',				4, 				2),
		('SUZERAINITY_RELIGIOUSMINOR_ATLAS',	48, 		'SuzeraintyReligious_48.dds',				4, 				2),
		('SUZERAINITY_RELIGIOUSMINOR_ATLAS',	32, 		'SuzeraintyReligious_32.dds',				4, 				2);

------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_MINOR_MILITARISTIC', 			0.584, 	0.196,	0.196, 	1);		
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES	('PLAYERCOLOR_MINOR_CULTURED', 			'COLOR_PLAYER_MINOR_ICON', 		'COLOR_MAGENTA', 					'COLOR_PLAYER_PEACH_TEXT'),
		('PLAYERCOLOR_MINOR_MARITIME', 			'COLOR_PLAYER_MINOR_ICON', 		'COLOR_POSITIVE_TEXT', 				'COLOR_PLAYER_PEACH_TEXT'),
		('PLAYERCOLOR_MINOR_MERCANTILE', 		'COLOR_PLAYER_MINOR_ICON', 		'COLOR_YIELD_GOLD', 				'COLOR_PLAYER_PEACH_TEXT'),
		('PLAYERCOLOR_MINOR_MILITARISTIC', 		'COLOR_PLAYER_MINOR_ICON', 		'COLOR_PLAYER_MINOR_MILITARISTIC', 	'COLOR_PLAYER_PEACH_TEXT'),
		('PLAYERCOLOR_MINOR_RELIGIOUS', 		'COLOR_PLAYER_MINOR_ICON', 		'COLOR_PLAYER_WHITE', 				'COLOR_PLAYER_PEACH_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
