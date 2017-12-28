--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Yields
		(Type,						Description,						IconString,					IsFake,		MinCity,	AIWeightPercent,	ImageTexture)
VALUES	('YIELD_DEFENSE',			'TXT_KEY_YIELD_JFD_DEFENSE',		'[ICON_STRENGTH]',			1,			0,			80,					'YieldAtlas_128_Defense.dds'),
		('YIELD_HAPPINESS',			'TXT_KEY_YIELD_JFD_HAPPINESS',		'[ICON_HAPPINESS_1]',		1,			0,			80,					NULL),
		('YIELD_JFD_DEVELOPMENT',	'TXT_KEY_YIELD_JFD_DEVELOPMENT',	'[ICON_JFD_DEVELOPMENT]',	1,			0,			80,					'YieldAtlas_128_Development.dds');		
		
		
UPDATE Yields SET Value = 0.6
WHERE Type = 'YIELD_CULTURE';

UPDATE Yields SET Value = 1
WHERE Type = 'YIELD_FAITH';

UPDATE Yields SET Value = 0.6
WHERE Type = 'YIELD_FOOD';

UPDATE Yields SET Value = 1.6
WHERE Type = 'YIELD_GOLDEN_AGE_POINTS';

UPDATE Yields SET Value = 0.6
WHERE Type IN ('YIELD_GREAT_ADMIRAL_POINTS', 'YIELD_GREAT_GENERAL_POINTS');

UPDATE Yields SET Value = 1.2
WHERE Type = 'YIELD_GOLD';

UPDATE Yields SET Value = 0.8
WHERE Type = 'YIELD_PRODUCTION';

UPDATE Yields SET Value = 0.6
WHERE Type = 'YIELD_SCIENCE';
--==========================================================================================================================
--==========================================================================================================================