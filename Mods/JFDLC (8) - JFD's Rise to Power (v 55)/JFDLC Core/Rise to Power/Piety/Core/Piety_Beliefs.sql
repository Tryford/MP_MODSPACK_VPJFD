--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Pantheon
----------------------
INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_GODDESS_HARVEST', 		'TXT_KEY_BELIEF_JFD_GODDESS_HARVEST', 		'TXT_KEY_BELIEF_JFD_GODDESS_HARVEST_SHORT',		0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HARVEST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_GOD_FORGE', 			'TXT_KEY_BELIEF_JFD_GOD_FORGE', 			'TXT_KEY_BELIEF_JFD_GOD_FORGE_SHORT',			0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_FORGE' AND Value = 1);		

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_GOD_HORSES', 			'TXT_KEY_BELIEF_JFD_GOD_HORSES', 			'TXT_KEY_BELIEF_JFD_GOD_HORSES_SHORT',			0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_HORSES' AND Value = 1);	

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_GOD_LUCK', 				'TXT_KEY_BELIEF_JFD_GOD_LUCK', 				'TXT_KEY_BELIEF_JFD_GOD_LUCK_SHORT',			0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_LUCK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_HOLIDAYS', 				'TXT_KEY_BELIEF_JFD_HOLIDAYS', 				'TXT_KEY_BELIEF_JFD_HOLIDAYS_SHORT',			0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_HOLIDAYS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_SPICES' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								DecisionDescription,							DecisionHelp,										CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_MEDITATION', 			'TXT_KEY_BELIEF_JFD_MEDITATION', 			'TXT_KEY_BELIEF_JFD_MEDITATION_SHORT',			'TXT_KEY_DECISIONS_JFD_PERFORM_MEDITATION',		'TXT_KEY_DECISIONS_JFD_PERFORM_MEDITATION_DESC',	0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_MEDITATION' AND Value = 1);		

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_PURIFICATION', 			'TXT_KEY_BELIEF_JFD_PURIFICATION', 			'TXT_KEY_BELIEF_JFD_PURIFICATION_SHORT',		0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_PURIFICATION' AND Value = 1)		
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_PERFUME', 'RESOURCE_TOBACCO'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_ROBES', 				'TXT_KEY_BELIEF_JFD_ROBES', 				'TXT_KEY_BELIEF_JFD_ROBES_SHORT',				0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_CEREMONIAL_ROBES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Beliefs
		(Type,								Description,								ShortDescription,								CityGrowthModifier,		Pantheon)
SELECT  'BELIEF_JFD_SACRED_GROVES',			'TXT_KEY_BELIEF_JFD_SACRED_GROVES',			'TXT_KEY_BELIEF_JFD_SACRED_GROVES_SHORT',		0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_GROVES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Beliefs
		(Type,								Description,								ShortDescription,								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_SACRED_MEDICINES',		'TXT_KEY_BELIEF_JFD_SACRED_MEDICINES',		'TXT_KEY_BELIEF_JFD_SACRED_MEDICINES_SHORT',	0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_MEDICINES' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_TEA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								CityGrowthModifier,		Pantheon)
SELECT	'BELIEF_JFD_STAR_GAZING', 			'TXT_KEY_BELIEF_JFD_STAR_GAZING', 			'TXT_KEY_BELIEF_JFD_STAR_GAZING_SHORT',			0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING' AND Value = 1);		

UPDATE Beliefs
SET Pantheon = 0 
WHERE Type IN ('BELIEF_CHOSEN_PEOPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_DANCE_AURORA'
WHERE Type = 'BELIEF_DANCE_AURORA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DANCE_AURORA' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_DESERT_FOLKLORE'
WHERE Type = 'BELIEF_DESERT_FOLKLORE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DESERT_FOLKLORE' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_RELIQUARIES_SHORT', Description = 'TXT_KEY_BELIEF_JFD_RELIQUARIES', DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_RELIQUARIES', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_RELIQUARIES_DESC' 
WHERE Type = 'BELIEF_ANCESTOR_WORSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GODDESS_HEARTH', ShortDescription = 'TXT_KEY_BELIEF_JFD_GODDESS_HEARTH_SHORT'
WHERE Type = 'BELIEF_EARTH_MOTHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HEARTH' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_OLIVE'));

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_FAITH_HEALERS', FaithToHealthRate = 15, FriendlyHealChange = 0
WHERE Type = 'BELIEF_FAITH_HEALERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_HEALERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_FERTILITY_RITES', CityGrowthModifier = 0, FaithFromGrowth = 1, DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_FERTILITY_RITES', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_FERTILITY_RITES_DESC'
WHERE Type = 'BELIEF_FERTILITY_RITES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FERTILITY_RITES' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GOD_CRAFTSMEN', FaithFromConstruction = 1, MinPopulation = 0
WHERE Type = 'BELIEF_GOD_CRAFTSMEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_CRAFTSMEN' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GOD_FESTIVALS', ShortDescription = 'TXT_KEY_BELIEF_JFD_GOD_FESTIVALS_SHORT' 
WHERE Type = 'BELIEF_GOD_FESTIVALS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_FESTIVALS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_COFFEE'));

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GOD_KING'
WHERE Type = 'BELIEF_GOD_KING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_KING' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GODDESS_HUNT'
WHERE Type = 'BELIEF_GODDESS_HUNT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_AUSPICIOUS_SIGNS', ShortDescription = 'TXT_KEY_BELIEF_JFD_AUSPICIOUS_SIGNS_SHORT'
WHERE Type = 'BELIEF_GODDESS_LOVE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_AUSPICIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GODDESS_PROTECTION', FaithToDefenseRate = 20, CityRangeStrikeModifier = 0
WHERE Type = 'BELIEF_GODDESS_STRATEGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_PROTECTION' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GOD_SEA'
WHERE Type = 'BELIEF_GOD_SEA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA' AND Value = 1)	
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_CORAL'));

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_RITUAL_SACRIFICES', ShortDescription = 'TXT_KEY_BELIEF_JFD_RITUAL_SACRIFICES_SHORT', FaithFromKills = 0, MaxDistance = 0
WHERE Type = 'BELIEF_GOD_WAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_HUMAN_SACRIFICES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_JADE'));

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_MONUMENT_GODS', WonderProductionModifier = 0, FaithModifierDuringWonderConstruction = 20
WHERE Type = 'BELIEF_MONUMENT_GODS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_MONUMENT_GODS' AND Value = 1);

UPDATE Beliefs
SET DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_NATURE_CEREMONIES', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_NATURE_CEREMONIES_DESC'
WHERE Type = 'BELIEF_ONE_WITH_NATURE';

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_OPEN_SKY'
WHERE Type = 'BELIEF_OPEN_SKY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY' AND Value = 1);

UPDATE Beliefs
SET DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_ORAL_TRADITION', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_ORAL_TRADITION_DESC'
WHERE Type = 'BELIEF_ORAL_TRADITION';

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_RELIGIOUS_IDOLS'
WHERE Type = 'BELIEF_FORMAL_LITURGY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_RELIGIOUS_IDOLS' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_GODDESS_STRATEGY', ShortDescription = 'TXT_KEY_BELIEF_JFD_GODDESS_STRATEGY_SHORT', CityRangeStrikeModifier = 30, FaithFromKills = 50, MaxDistance = 4
WHERE Type = 'BELIEF_ORAL_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_STRATEGY' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_SACRED_PATH', RiverHappiness = 0
WHERE Type = 'BELIEF_SACRED_PATH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_SACRED_WATERS', RiverHappiness = 1, FriendlyHealChange = 20, DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_WATERS', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_WATERS_DESC'
WHERE Type = 'BELIEF_SACRED_WATERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_WATERS' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_STONE_CIRCLES'
WHERE Type = 'BELIEF_STONE_CIRCLES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_STONE_CIRCLES' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_TEARS_OF_GODS'
WHERE Type = 'BELIEF_TEARS_OF_GODS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_TEARS_OF_GODS' AND Value = 1)		
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_AMBER', 'RESOURCE_LAPIS'));

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_SUN_GOD', DecisionDescription = 'TXT_KEY_DECISIONS_JFD_PERFORM_SUN_GOD', DecisionHelp = 'TXT_KEY_DECISIONS_JFD_PERFORM_SUN_GOD_DESC' 
WHERE Type = 'BELIEF_SUN_GOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SUN_GOD' AND Value = 1);
----------------------
-- Founder
----------------------
DELETE FROM Beliefs WHERE Founder = 1 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		Founder)
SELECT	'BELIEF_JFD_CULT_HUITZILOPOCHTLI', 	'TXT_KEY_BELIEF_JFD_CULT_HUITZILOPOCHTLI', 	'TXT_KEY_BELIEF_JFD_CULT_HUITZILOPOCHTLI_SHORT',	0,								1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_ECUMENISM', 			'TXT_KEY_BELIEF_JFD_ECUMENISM', 			'TXT_KEY_BELIEF_JFD_ECUMENISM_SHORT',				0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_FIRE_OF_FIRES', 		'TXT_KEY_BELIEF_JFD_FIRE_OF_FIRES', 		'TXT_KEY_BELIEF_JFD_FIRE_OF_FIRES_SHORT',			0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									CityStateMinimumInfluence,		MissionaryInfluenceCS,	Founder)
SELECT	'BELIEF_JFD_FIRST_AMONG_EQUALS', 	'TXT_KEY_BELIEF_JFD_FIRST_AMONG_EQUALS', 	'TXT_KEY_BELIEF_JFD_FIRST_AMONG_EQUALS_SHORT',		10,								10,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_FELLOWSHIP_TRUTH', 		'TXT_KEY_BELIEF_JFD_FELLOWSHIP_TRUTH', 		'TXT_KEY_BELIEF_JFD_FELLOWSHIP_TRUTH_SHORT',		0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									IsNoPietyLossOtherCivs,			OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_IMPERIAL_CULT', 		'TXT_KEY_BELIEF_JFD_IMPERIAL_CULT', 		'TXT_KEY_BELIEF_JFD_IMPERIAL_CULT_SHORT',			1,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									AdditionalPantheonBelief,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_LAND_ETERNAL_SKY', 		'TXT_KEY_BELIEF_JFD_LAND_ETERNAL_SKY', 		'TXT_KEY_BELIEF_JFD_LAND_ETERNAL_SKY_SHORT',		0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									IsNoPietyDuringGoldenAges,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_MANDATE_HEAVEN', 		'TXT_KEY_BELIEF_JFD_MANDATE_HEAVEN', 		'TXT_KEY_BELIEF_JFD_MANDATE_HEAVEN_SHORT',			1,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_ORAL_TORAH', 			'TXT_KEY_BELIEF_JFD_ORAL_TORAH', 			'TXT_KEY_BELIEF_JFD_ORAL_TORAH_SHORT',				0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_PILGRIMAGE', 			'TXT_KEY_BELIEF_JFD_PILGRIMAGE', 			'TXT_KEY_BELIEF_JFD_PILGRIMAGE_SHORT',				0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_PREDESTINATION', 		'TXT_KEY_BELIEF_JFD_PREDESTINATION', 		'TXT_KEY_BELIEF_JFD_PREDESTINATION_SHORT',			0,								0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_THREE_TREASURES', 		'TXT_KEY_BELIEF_JFD_THREE_TREASURES', 		'TXT_KEY_BELIEF_JFD_THREE_TREASURES_SHORT',			0,								2,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRFreeInnovations,	Founder)
SELECT	'BELIEF_JFD_TRUE_THEOLOGY', 		'TXT_KEY_BELIEF_JFD_TRUE_THEOLOGY', 		'TXT_KEY_BELIEF_JFD_TRUE_THEOLOGY_SHORT',			0,								1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRWLTKDTurns,			Founder)
SELECT	'BELIEF_JFD_VARNA_SYSTEM', 			'TXT_KEY_BELIEF_JFD_VARNA_SYSTEM', 			'TXT_KEY_BELIEF_JFD_VARNA_SYSTEM_SHORT',			0,								5,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 									HappinessPerFollowingCity,		OnSRGoldenAgeTurns,		Founder)
SELECT	'BELIEF_JFD_WHEEL_DHARMA', 			'TXT_KEY_BELIEF_JFD_WHEEL_DHARMA', 			'TXT_KEY_BELIEF_JFD_WHEEL_DHARMA_SHORT',			0.5,							0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);
----------------------
-- Follower
----------------------
DELETE FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ALMSGIVING', 			'TXT_KEY_BELIEF_JFD_ALMSGIVING', 			'TXT_KEY_BELIEF_JFD_ALMSGIVING_SHORT',			1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP',		'TXT_KEY_BELIEF_JFD_ANCESTOR_WORSHIP', 		'TXT_KEY_BELIEF_JFD_ANCESTOR_WORSHIP_SHORT',	1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_CHARITY',				'TXT_KEY_BELIEF_JFD_CHARITY', 				'TXT_KEY_BELIEF_JFD_CHARITY_SHORT',				1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower,			PlotCultureCostModifier)
SELECT	'BELIEF_JFD_CHOSEN_PEOPLE',			'TXT_KEY_BELIEF_JFD_CHOSEN_PEOPLE', 		'TXT_KEY_BELIEF_JFD_CHOSEN_PEOPLE_SHORT',		1,				1,					1,					-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	'TXT_KEY_BELIEF_JFD_DIVINE_INSPIRATION', 	'TXT_KEY_BELIEF_JFD_DIVINE_INSPIRATION_SHORT',	1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	 RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_FILIAL_PIETY',			'TXT_KEY_BELIEF_JFD_FILIAL_PIETY', 			'TXT_KEY_BELIEF_JFD_FILIAL_PIETY_SHORT',		1,				 1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_FLOWER_WARS',			'TXT_KEY_BELIEF_JFD_FLOWER_WARS', 			'TXT_KEY_BELIEF_JFD_FLOWER_WARS_SHORT',			1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_GURU_LINEAGE',			'TXT_KEY_BELIEF_JFD_GURU_LINEAGE', 			'TXT_KEY_BELIEF_JFD_GURU_LINEAGE_SHORT',		1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 			'TXT_KEY_BELIEF_JFD_ICONOGRAPHY', 			'TXT_KEY_BELIEF_JFD_ICONOGRAPHY_SHORT',			1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower,			ExperienceOnFaithPurchase)
SELECT	'BELIEF_JFD_MARTIAL_ARTS',			'TXT_KEY_BELIEF_JFD_MARTIAL_ARTS', 			'TXT_KEY_BELIEF_JFD_MARTIAL_ARTS_SHORT',		1,				1,					1,					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_NOBLE_PATH',			'TXT_KEY_BELIEF_JFD_NOBLE_PATH', 			'TXT_KEY_BELIEF_JFD_NOBLE_PATH_SHORT',			1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								IsPietySource,	RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW',			'TXT_KEY_BELIEF_JFD_RELIGIOUS_LAW', 		'TXT_KEY_BELIEF_JFD_RELIGIOUS_LAW_SHORT',		1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');		

INSERT INTO Beliefs 		
		(Type, 							Description, 									ShortDescription, 								IsPietySource,	RequiresFounding, 	Follower)
SELECT	'BELIEF_JFD_THEURGY',			'TXT_KEY_BELIEF_JFD_THEURGY', 					'TXT_KEY_BELIEF_JFD_THEURGY_SHORT',				1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);	
		
INSERT INTO Beliefs 		
		(Type, 							Description, 									ShortDescription, 								IsPietySource,	RequiresFounding, 	Follower)
SELECT	'BELIEF_JFD_WAY_WARRIOR',		'TXT_KEY_BELIEF_JFD_WAY_WARRIOR', 				'TXT_KEY_BELIEF_JFD_WAY_WARRIOR_SHORT',			1,				1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);			
			
INSERT INTO Beliefs 			
		(Type, 							Description, 									ShortDescription, 								IsPietySource,	RequiresFounding,	 Follower)
SELECT	'BELIEF_JFD_WORK_ETHIC', 		'TXT_KEY_BELIEF_JFD_WORK_ETHIC', 				'TXT_KEY_BELIEF_JFD_WORK_ETHIC_SHORT',			1,				1,					 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
----------------------
-- Follower: Misison
----------------------
INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_ASCETICS', 				'TXT_KEY_BELIEF_JFD_ASCETICS', 				'TXT_KEY_BELIEF_JFD_ASCETICS_SHORT',			0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_BHANAKS', 				'TXT_KEY_BELIEF_JFD_BHANAKS', 				'TXT_KEY_BELIEF_JFD_BHANAKS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_CANTORS', 				'TXT_KEY_BELIEF_JFD_CANTORS', 				'TXT_KEY_BELIEF_JFD_CANTORS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_CELEBRANTS', 			'TXT_KEY_BELIEF_JFD_CELEBRANTS', 			'TXT_KEY_BELIEF_JFD_CELEBRANTS_SHORT',			0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_CRUSADERS', 			'TXT_KEY_BELIEF_JFD_CRUSADERS', 			'TXT_KEY_BELIEF_JFD_CRUSADERS_SHORT',			0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								MissionaryStrengthModifier,			RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_GURUS', 				'TXT_KEY_BELIEF_JFD_GURUS', 				'TXT_KEY_BELIEF_JFD_GURUS_SHORT',				25,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_JURISTS', 				'TXT_KEY_BELIEF_JFD_JURISTS', 				'TXT_KEY_BELIEF_JFD_JURISTS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_MASTERS', 				'TXT_KEY_BELIEF_JFD_MASTERS', 				'TXT_KEY_BELIEF_JFD_MASTERS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_MONK_SOLDIERS', 		'TXT_KEY_BELIEF_JFD_MONK_SOLDIERS', 		'TXT_KEY_BELIEF_JFD_MONK_SOLDIERS_SHORT',		0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								MissionaryCostModifier,				RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_MYSTICS', 				'TXT_KEY_BELIEF_JFD_MYSTICS', 				'TXT_KEY_BELIEF_JFD_MYSTICS_SHORT',				-30,								1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								NumExtraMissionarySpreads,			RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_PREACHERS', 			'TXT_KEY_BELIEF_JFD_PREACHERS', 			'TXT_KEY_BELIEF_JFD_PREACHERS_SHORT',			1,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_SCHOLARS', 				'TXT_KEY_BELIEF_JFD_SCHOLARS', 				'TXT_KEY_BELIEF_JFD_SCHOLARS_SHORT',			0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								MissionaryStrengthModifier,			RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_SHAMANS', 				'TXT_KEY_BELIEF_JFD_SHAMANS', 				'TXT_KEY_BELIEF_JFD_SHAMANS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_WARRIOR_PRIESTS', 		'TXT_KEY_BELIEF_JFD_WARRIOR_PRIESTS', 		'TXT_KEY_BELIEF_JFD_WARRIOR_PRIESTS_SHORT',		100,								1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								LandBarbarianConversionPercent,		RequiresFounding,	Follower,	Bonus,		IsNoAI)
SELECT	'BELIEF_JFD_ZEALOTS', 				'TXT_KEY_BELIEF_JFD_ZEALOTS', 				'TXT_KEY_BELIEF_JFD_ZEALOTS_SHORT',				0,									1,					1,			1,			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
----------------------
-- Enhancer
----------------------
UPDATE Beliefs
SET CombatModifierEnemyCities = 0, CombatVersusOtherReligionTheirLands = 15, Description = 'TXT_KEY_BELIEF_JFD_JUST_WAR'
WHERE Type = 'BELIEF_JUST_WAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_JUST_WAR' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							Enhancer)
SELECT	'BELIEF_JFD_EVANGELISM', 		'TXT_KEY_BELIEF_JFD_EVANGELISM', 		'TXT_KEY_BELIEF_JFD_EVANGELISM_SHORT',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM' AND Value = 1);

UPDATE Beliefs
SET CombatModifierFriendlyCities = 0, CombatVersusOtherReligionOwnLands = 15, Description = 'TXT_KEY_BELIEF_JFD_DEFENDER_FAITH'
WHERE Type = 'BELIEF_DEFENDER_FAITH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DEFENDER_FAITH' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_REVIVALISM_SHORT'
WHERE Type = 'BELIEF_EVANGELISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM' AND Value = 1);
-----------------------------------------
-- Follower: Worship
-----------------------------------------
INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_ALTARS', 			'TXT_KEY_BELIEF_JFD_ALTARS', 			'TXT_KEY_BELIEF_JFD_ALTARS_SHORT', 				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);
	
-- INSERT INTO Beliefs 	
		-- (Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
-- SELECT	'BELIEF_JFD_BASILICAS', 		'TXT_KEY_BELIEF_JFD_BASILICAS', 		'TXT_KEY_BELIEF_JFD_BASILICAS_SHORT', 			1,						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement,	Follower)
SELECT	'BELIEF_JFD_CATHEDRALS', 		'TXT_KEY_BELIEF_JFD_CATHEDRALS', 		'TXT_KEY_BELIEF_JFD_CATHEDRALS_SHORT',			1,						1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_CHURCHES', 			'TXT_KEY_BELIEF_JFD_CHURCHES', 			'TXT_KEY_BELIEF_JFD_CHURCHES_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_DAOGUANS', 			'TXT_KEY_BELIEF_JFD_DAOGUANS', 			'TXT_KEY_BELIEF_JFD_DAOGUANS_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
-- INSERT INTO Beliefs 	
		-- (Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
-- SELECT	'BELIEF_JFD_FIRE_TEMPLES', 		'TXT_KEY_BELIEF_JFD_FIRE_TEMPLES', 		'TXT_KEY_BELIEF_JFD_FIRE_TEMPLES_SHORT', 		1,						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
-- INSERT INTO Beliefs 	
		-- (Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
-- SELECT	'BELIEF_JFD_HERMETIC_ORDERS', 	'TXT_KEY_BELIEF_JFD_HERMETIC_ORDERS', 	'TXT_KEY_BELIEF_JFD_HERMETIC_ORDERS_SHORT', 	1,						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_GURDWARAS', 		'TXT_KEY_BELIEF_JFD_GURDWARAS', 		'TXT_KEY_BELIEF_JFD_GURDWARAS_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_MANDIRS', 			'TXT_KEY_BELIEF_JFD_MANDIRS', 			'TXT_KEY_BELIEF_JFD_MANDIRS_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_MOSQUES', 			'TXT_KEY_BELIEF_JFD_MOSQUES', 			'TXT_KEY_BELIEF_JFD_MOSQUES_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
-- INSERT INTO Beliefs 	
		-- (Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
-- SELECT	'BELIEF_JFD_OVOOS', 			'TXT_KEY_BELIEF_JFD_OVOOS', 			'TXT_KEY_BELIEF_JFD_OVOOS_SHORT', 				1,						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_PAGODAS', 			'TXT_KEY_BELIEF_JFD_PAGODAS', 			'TXT_KEY_BELIEF_JFD_PAGODAS_SHORT', 			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Beliefs 	
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_SYNAGOGUES', 		'TXT_KEY_BELIEF_JFD_SYNAGOGUES', 		'TXT_KEY_BELIEF_JFD_SYNAGOGUES_SHORT',			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Beliefs 
		-- (Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
-- SELECT	'BELIEF_JFD_TEMPLES_LITERATURE','TXT_KEY_BELIEF_JFD_TEMPLES_LITERATURE','TXT_KEY_BELIEF_JFD_TEMPLES_LITERATURE_SHORT', 	1,						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 								RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_TORIIS', 			'TXT_KEY_BELIEF_JFD_TORIIS', 			'TXT_KEY_BELIEF_JFD_TORIIS_SHORT', 				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
----------------------
-- Reformation
----------------------
UPDATE Beliefs
SET Reformation = 0 
WHERE Type IN ('BELIEF_CHARITABLE_MISSIONS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Beliefs 
		-- (Type, 							Description, 							ShortDescription, 							FreeInquisitorPromotion,	 FreeMissionaryPromotion,	Reformation)
-- SELECT	'BELIEF_JFD_WAR_CLERICS', 		'TXT_KEY_BELIEF_JFD_WAR_CLERICS', 		'TXT_KEY_BELIEF_JFD_WAR_CLERICS_SHORT',		'PROMOTION_JFD_PERSECUTION', 'PROMOTION_MEDIC',			1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_WAR_CLERICS' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_RELIGIOUS_FERVOUR'
WHERE Type = 'BELIEF_RELIGIOUS_FERVOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);
----------------------
-- Bonus
----------------------
UPDATE Beliefs
SET Bonus = 1
WHERE Bonus = 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_JFD_PietyYieldChanges 
		(BeliefType, 						OnCitizenBirth, 										Yield)
SELECT	'BELIEF_JFD_ALMSGIVING', 			1,														5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnMilitaryUnitFaithPurchased, 							Yield)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP', 		1,														5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnBuildingPurchased,									Yield)
SELECT	'BELIEF_JFD_CHARITY',				1,														10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnTileAcquired,											Yield)
SELECT	'BELIEF_JFD_CHOSEN_PEOPLE', 		1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnTilePurchased,										Yield)
SELECT	'BELIEF_JFD_CHOSEN_PEOPLE', 		1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnBuildingConstructed,		RequiresWonder, 			Yield)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION',	1,							1,							15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnPolicyAdopted, 										Yield)
SELECT	'BELIEF_JFD_FILIAL_PIETY', 			1,														15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnCityConquered, 										Yield)
SELECT	'BELIEF_JFD_FLOWER_WARS', 			1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnAnyGreatPersonExpended,								Yield)
SELECT	'BELIEF_JFD_GURU_LINEAGE', 			1,														15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

-- INSERT INTO Belief_JFD_PietyYieldChanges	
		-- (BeliefType, 						OnBuildingConstructed,		RequiresSpecialistType, 	Yield)
-- SELECT	'BELIEF_JFD_GURU_LINEAGE', 			1,							Type,						5
-- FROM Specialists WHERE Type IN ('SPECIALIST_JFD_DOCTOR', 'SPECIALIST_ENGINEER', 'SPECIALIST_MERCHANT', 'SPECIALIST_SCIENTIST')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnBuildingConstructed,		RequiresAnyGreatWorkSlot, 	Yield)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 			1,							1,							10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges					
		(BeliefType, 						OnUnitPromoted, 										Yield)
SELECT	'BELIEF_JFD_MARTIAL_ARTS', 			1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnGoldenAgeBegins,										Yield)
SELECT	'BELIEF_JFD_NOBLE_PATH', 			1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnReformPassed,											Yield)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW', 		1,														15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');	

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnInnovationTriggered, 									Yield)
SELECT	'BELIEF_JFD_THEURGY', 				1,														20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitKilled, 											Yield)
SELECT	'BELIEF_JFD_WAY_WARRIOR', 			1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnWorkerChargeExpended, 								Yield)
SELECT	'BELIEF_JFD_WORK_ETHIC', 			1,														2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Enhanced Belief_CityYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_CityYieldChanges WHERE BeliefType = 'BELIEF_GOD_CRAFTSMEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_CRAFTSMEN' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Enhanced Belief_MaxYieldPerFollowerHalved
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_ALMSGIVING',			'YIELD_FOOD',				8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP',		'YIELD_FAITH',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_CHARITY',				'YIELD_GOLD',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_FILIAL_PIETY',			'YIELD_CULTURE',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_NOBLE_PATH',			'YIELD_GOLDEN_AGE_POINTS',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_THEURGY',				'YIELD_SCIENCE',			8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,						YieldType,					Max)
SELECT	'BELIEF_JFD_WORK_ETHIC',			'YIELD_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassFaithPurchase
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IN ('BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_PAGODA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_ALTARS', 				'BUILDINGCLASS_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

-- INSERT INTO Belief_BuildingClassFaithPurchase 
		-- (BeliefType, 						BuildingClassType)
-- SELECT	'BELIEF_JFD_BASILICAS',				'BUILDINGCLASS_JFD_BASILICA'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_CATHEDRALS', 			'BUILDINGCLASS_CATHEDRAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_CHURCHES',				'BUILDINGCLASS_JFD_CHURCH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_DAOGUANS',				'BUILDINGCLASS_JFD_DAOGUAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Belief_BuildingClassFaithPurchase 
		-- (BeliefType, 						BuildingClassType)
-- SELECT	'BELIEF_JFD_FIRE_TEMPLES', 			'BUILDINGCLASS_JFD_FIRE_TEMPLE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_GURDWARAS', 			'BUILDINGCLASS_JFD_GURDWARA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Belief_BuildingClassFaithPurchase 
		-- (BeliefType, 						BuildingClassType)
-- SELECT	'BELIEF_JFD_HERMETIC_ORDERS', 		'BUILDINGCLASS_JFD_HERMETIC_ORDER'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_MANDIRS', 				'BUILDINGCLASS_JFD_MANDIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Belief_BuildingClassFaithPurchase 
		-- (BeliefType, 						BuildingClassType)
-- SELECT	'BELIEF_JFD_OVOOS', 				'BUILDINGCLASS_JFD_OVOO'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_MOSQUES', 				'BUILDINGCLASS_MOSQUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_PAGODAS', 				'BUILDINGCLASS_PAGODA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_SYNAGOGUES', 			'BUILDINGCLASS_JFD_SYNAGOGUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO Belief_BuildingClassFaithPurchase 
		-- (BeliefType, 						BuildingClassType)
-- SELECT	'BELIEF_JFD_TEMPLES_LITERATURE', 	'BUILDINGCLASS_JFD_TEMPLE_LITERATURE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 						BuildingClassType)
SELECT	'BELIEF_JFD_TORIIS', 				'BUILDINGCLASS_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassFaithPurchase
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_JFD_PietyYieldChanges 
		(BeliefType, 						OnBuildingClassConstructed, 			Yield)
SELECT	BeliefType, 						BuildingClassType,						10
FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_EraFaithUnitPurchase
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_ANCIENT'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_CLASSICAL'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_MEDIEVAL'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 					EraType)
SELECT	'BELIEF_RELIGIOUS_FERVOR',		Type
FROM Eras WHERE Type IN ('ERA_RENAISSANCE', 'ERA_ENLIGHTENMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_ASCETICS',					'PROMOTION_JFD_ASCETICS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType,				Removes)
SELECT 	'BELIEF_JFD_BHANAKS',					'PROMOTION_UNWELCOME_EVANGELIST', 	'UNITCLASS_MISSIONARY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_CANTORS',					'PROMOTION_JFD_CANTORS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_CELEBRANTS',				'PROMOTION_JFD_CELEBRANTS',			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_CRUSADERS',					'PROMOTION_JFD_CRUSADERS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_CULT_HUITZILOPOCHTLI',		'PROMOTION_GREAT_GENERAL', 			'UNITCLASS_PROPHET'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_JURISTS',					'PROMOTION_JFD_JURISTS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_MASTERS',					'PROMOTION_JFD_MASTERS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						DomainType,			IsCombatOnly)
SELECT 	'BELIEF_JFD_MONK_SOLDIERS',				'PROMOTION_JFD_MONK_SOLDIERS', 		'DOMAIN_LAND',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_SCHOLARS',					'PROMOTION_JFD_SCHOLARS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_SHAMANS',					'PROMOTION_JFD_SHAMANS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						DomainType,			IsCombatOnly)
SELECT 	'BELIEF_JFD_WAY_WARRIOR',				'PROMOTION_JFD_WAY_WARRIOR', 		'DOMAIN_LAND',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_FreePromotions
		(BeliefType, 							PromotionType, 						UnitClassType)
SELECT 	'BELIEF_JFD_ZEALOTS',					'PROMOTION_JFD_ZEALOTS', 			'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 			YieldType, 				Yield)
SELECT	'BELIEF_JFD_GURU_LINEAGE', 		'SPECIALIST_JFD_DOCTOR', 	'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 			YieldType, 				Yield)
SELECT	'BELIEF_JFD_GURU_LINEAGE', 		'SPECIALIST_ENGINEER', 		'YIELD_PRODUCTION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 			YieldType, 				Yield)
SELECT	'BELIEF_JFD_GURU_LINEAGE', 		'SPECIALIST_MERCHANT', 		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 			YieldType, 				Yield)
SELECT	'BELIEF_JFD_GURU_LINEAGE', 		'SPECIALIST_SCIENTIST', 	'YIELD_SCIENCE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 	YieldType, 			Yield)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW', 	Type, 				'YIELD_FAITH',		1
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_GOVERNOR', 'SPECIALIST_JFD_MONK', 'SPECIALIST_JFD_MAGISTRATE', 'SPECIALIST_JFD_DIGNITARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_BuildingClassYieldChanges 
		(BeliefType, 						BuildingClassType,			YieldType, 					YieldChange)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	Type,						'YIELD_FAITH',				2
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

--JFDRTP_Piety_Beliefs
CREATE TRIGGER JFDRTP_Piety_Belief_BuildingClassYieldChanges
AFTER INSERT ON BuildingClasses
WHEN NEW.MaxPlayerInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
BEGIN
	INSERT INTO Belief_BuildingClassYieldChanges 
			(BeliefType, 						BuildingClassType,			YieldType, 					YieldChange)
	SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	NEW.Type,					'YIELD_FAITH',				2
	FROM BuildingClasses WHERE Type = NEW.Type AND MaxPlayerInstances = 1;
END;

INSERT INTO Belief_BuildingClassYieldChanges 
		(BeliefType, 						BuildingClassType,			YieldType, 					YieldChange)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	Type,						'YIELD_FAITH',				2
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassYieldChanges 	
		(BeliefType, 						BuildingClassType,			YieldType, 					YieldChange)
SELECT	'BELIEF_GOD_KING', 					'BUILDINGCLASS_PALACE',		'YIELD_GOLDEN_AGE_POINTS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_KING' AND Value = 1);

INSERT INTO Belief_BuildingClassYieldChanges 	
		(BeliefType, 						BuildingClassType,			YieldType, 					YieldChange)
SELECT	'BELIEF_JFD_MEDITATION', 			'BUILDINGCLASS_SHRINE',		'YIELD_GOLDEN_AGE_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_MEDITATION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_BuildingClassHappiness
		(BeliefType, 						BuildingClassType,			Happiness)
SELECT	'BELIEF_JFD_MEDITATION', 			'BUILDINGCLASS_SHRINE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_KING' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_FeatureYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_FeatureYieldChanges WHERE BeliefType = 'BELIEF_SACRED_PATH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH' AND Value = 1);
INSERT INTO Belief_FeatureYieldChanges 
		(BeliefType, 						FeatureType,		YieldType, 							Yield)
SELECT	'BELIEF_SACRED_PATH', 				'FEATURE_FOREST',	'YIELD_GOLDEN_AGE_POINTS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH' AND Value = 1);

INSERT INTO Belief_FeatureYieldChanges 
		(BeliefType, 						FeatureType,		YieldType, 							Yield)
SELECT	'BELIEF_SACRED_PATH', 				'FEATURE_JUNGLE',	'YIELD_GOLDEN_AGE_POINTS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ResourceQuantityModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ResourceQuantityModifiers
		(BeliefType, 						ResourceType,		ResourceQuantityModifier)
SELECT	'BELIEF_JFD_GOD_FORGE', 			'RESOURCE_IRON',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_FORGE' AND Value = 1);

INSERT INTO Belief_ResourceQuantityModifiers
		(BeliefType, 						ResourceType,		ResourceQuantityModifier)
SELECT	'BELIEF_JFD_GOD_HORSES', 			'RESOURCE_HORSE',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_HORSES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_GODDESS_HUNT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT' AND Value = 1);

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_GOD_SEA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA' AND Value = 1);

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_ORAL_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_STRATEGY' AND Value = 1);

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_OPEN_SKY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY' AND Value = 1);

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_STONE_CIRCLES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_STONE_CIRCLES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_GODDESS_LOVE',				'RESOURCE_JFD_LOTUS',	'YIELD_GOLDEN_AGE_POINTS',			4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_AUSPICIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_GODDESS_LOVE',				'RESOURCE_JFD_LOTUS',	'YIELD_FAITH',						2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_AUSPICIOUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType = 'BELIEF_EARTH_MOTHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HEARTH' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_OLIVE'));
INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_EARTH_MOTHER',				Type,					'YIELD_FOOD',						1
FROM Resources WHERE Type IN ('RESOURCE_OLIVE', 'RESOURCE_SALT', 'RESOURCE_TRUFFLES') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HEARTH' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_OLIVE'));

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_GOD_HORSES', 			'RESOURCE_HORSE',		'YIELD_FAITH',						2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_HORSES' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_GOD_FORGE', 			'RESOURCE_IRON',		'YIELD_FAITH',						2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_FORGE' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_LUCK', 					Type,					'YIELD_GOLD',						2
FROM Resources WHERE Type IN ('RESOURCE_FISH', 'RESOURCE_PEARLS', 'RESOURCE_JFD_FEATHERS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_FORTUNE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType = 'BELIEF_GOD_FESTIVALS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_FESTIVALS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);
INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_GOD_FESTIVALS', 		Type,						'YIELD_CULTURE',					1
FROM Resources WHERE Type IN ('RESOURCE_WINE', 'RESOURCE_INCENSE', 'RESOURCE_COFFEE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_FESTIVALS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_COFFEE'));

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_GODDESS_HARVEST', 		Type,					'YIELD_FOOD',						1
FROM Resources WHERE Type IN ('RESOURCE_WHEAT', 'RESOURCE_JFD_RICE', 'RESOURCE_JFD_MAIZE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HARVEST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_GODDESS_HUNT', 				Type,					'YIELD_PRODUCTION',					1
FROM Resources WHERE Type IN ('RESOURCE_FUR', 'RESOURCE_BISON', 'RESOURCE_DEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_GODDESS_HUNT', 				Type,					'YIELD_GREAT_GENERAL_POINTS',		1
FROM Resources WHERE Type IN ('RESOURCE_FUR', 'RESOURCE_BISON', 'RESOURCE_DEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_GOD_SEA', 					Type,					'YIELD_PRODUCTION',					1
FROM Resources WHERE Type IN ('RESOURCE_CRAB', 'RESOURCE_CORAL', 'RESOURCE_WHALE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA' AND Value = 1)	
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_CORAL'));

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_GOD_SEA', 					Type,					'YIELD_GREAT_ADMIRAL_POINTS',		1
FROM Resources WHERE Type IN ('RESOURCE_CRAB', 'RESOURCE_CORAL', 'RESOURCE_WHALE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA' AND Value = 1)	
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_CORAL'));

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_OPEN_SKY',					Type,					'YIELD_FAITH',						1
FROM Resources WHERE Type IN ('RESOURCE_SHEEP', 'RESOURCE_COW') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_OPEN_SKY',					Type,					'YIELD_CULTURE',						1
FROM Resources WHERE Type IN ('RESOURCE_SHEEP', 'RESOURCE_COW') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_GOD_WAR',					Type,					'YIELD_FAITH',						1
FROM Resources WHERE Type IN ('RESOURCE_JFD_OBDISIAN', 'RESOURCE_JADE', 'RESOURCE_IVORY') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_HUMAN_SACRIFICES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_JADE'));

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_PURIFICATION', 			Type,					'YIELD_JFD_HEALTH',					1
FROM Resources WHERE Type IN ('RESOURCE_PERFUME', 'RESOURCE_INCENSE', 'RESOURCE_TOBACCO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_PURIFICATION' AND Value = 1)		
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_PERFUME', 'RESOURCE_TOBACCO'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_JFD_HOLIDAYS',				Type,					'YIELD_CULTURE',					1
FROM Resources WHERE Type IN ('RESOURCE_JFD_VANILLA', 'RESOURCE_COCOA', 'RESOURCE_SPICE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_HOLIDAYS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_SPICES' AND Value = 1);

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType = 'BELIEF_FORMAL_LITURGY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_RELIGIOUS_IDOLS' AND Value = 1);
INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_FORMAL_LITURGY', 			Type,					'YIELD_FAITH',						1
FROM Resources WHERE Type IN ('RESOURCE_SILVER', 'RESOURCE_COPPER', 'RESOURCE_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_RELIGIOUS_IDOLS' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_JFD_ROBES', 				Type,					'YIELD_CULTURE',					1
FROM Resources WHERE Type IN ('RESOURCE_SILK', 'RESOURCE_COTTON', 'RESOURCE_JFD_SAFFRON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_CEREMONIAL_ROBES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_JFD_SACRED_GROVES',			Type,					'YIELD_CULTURE',					1
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_GROVES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_JFD_SACRED_GROVES',			Type,					'YIELD_FAITH',						1
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_GROVES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_JFD_SACRED_MEDICINES',		Type,					'YIELD_FAITH',						1
FROM Resources WHERE Type IN ('RESOURCE_JFD_GINGER', 'RESOURCE_JFD_OPIUM', 'RESOURCE_TEA') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_MEDICINES' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_TEA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_STONE_CIRCLES',				Type,					'YIELD_FAITH',						2
FROM Resources WHERE Type IN ('RESOURCE_STONE', 'RESOURCE_MARBLE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_STONE_CIRCLES' AND Value = 1);

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType = 'BELIEF_TEARS_OF_GODS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_TEARS_OF_GODS' AND Value = 1)	
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_AMBER', 'RESOURCE_LAPIS'));
INSERT INTO Belief_ResourceYieldChanges 
		(BeliefType, 						ResourceType,			YieldType, 							Yield)
SELECT	'BELIEF_TEARS_OF_GODS', 			Type,					'YIELD_GOLDEN_AGE_POINTS',			2
FROM Resources WHERE Type IN ('RESOURCE_AMBER', 'RESOURCE_GEMS', 'RESOURCE_LAPIS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_TEARS_OF_GODS' AND Value = 1)		
AND EXISTS (SELECT Type FROM Resources WHERE Type IN ('RESOURCE_AMBER', 'RESOURCE_LAPIS'));

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType = 'BELIEF_SUN_GOD' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SUN_GOD' AND Value = 1);
INSERT INTO Belief_ResourceYieldChanges
		(BeliefType,						ResourceType,			YieldType,							Yield)
SELECT	'BELIEF_SUN_GOD',					Type,					'YIELD_FOOD',						1
FROM Resources WHERE Type IN ('RESOURCE_CITRUS', 'RESOURCE_SUGAR', 'RESOURCE_BANANA') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_SUN_GOD' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_CityYieldPerXTerrainTimes100
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_CityYieldPerXTerrainTimes100 
		(BeliefType, 						TerrainType,			YieldType, 							Yield)
SELECT	'BELIEF_DESERT_FOLKLORE', 			'TERRAIN_DESERT',		'YIELD_FAITH',						50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DESERT_FOLKLORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_TerrainYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_TerrainYieldChanges WHERE BeliefType = 'BELIEF_DESERT_FOLKLORE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DESERT_FOLKLORE' AND Value = 1);
INSERT INTO Belief_TerrainYieldChanges 
		(BeliefType, 						TerrainType,			YieldType, 							Yield)
SELECT	'BELIEF_DANCE_AURORA', 				'TERRAIN_TUNDRA',		'YIELD_GOLDEN_AGE_POINTS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DANCE_AURORA' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_PlotYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_PlotYieldChanges 
		(BeliefType, 						PlotType,				YieldType, 							Yield)
SELECT	'BELIEF_JFD_STAR_GAZING', 			'PLOT_MOUNTAIN',		'YIELD_FAITH',						3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING' AND Value = 1);

INSERT INTO Belief_PlotYieldChanges 
		(BeliefType, 						PlotType,				YieldType, 							Yield)
SELECT	'BELIEF_JFD_STAR_GAZING', 			'PLOT_MOUNTAIN',		'YIELD_GOLDEN_AGE_POINTS',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING' AND Value = 1);

INSERT INTO Belief_PlotYieldChanges 
		(BeliefType, 						PlotType,				YieldType, 							Yield)
SELECT	'BELIEF_JFD_STAR_GAZING', 			'PLOT_MOUNTAIN',		'YIELD_SCIENCE',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldChangePerXForeignFollowers
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_YieldChangePerXForeignFollowers WHERE BeliefType = 'BELIEF_ECUMENISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_ECUMENISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldChangePerForeignCity
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldChangePerForeignCity 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_ECUMENISM', 			'YIELD_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Belief_YieldChangePerForeignCity 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_FELLOWSHIP_TRUTH', 		'YIELD_SCIENCE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

DELETE FROM Belief_YieldChangePerForeignCity WHERE BeliefType = 'BELIEF_PILGRIMAGE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_ECUMENISM' AND Value = 1);
INSERT INTO Belief_YieldChangePerForeignCity 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_PILGRIMAGE', 			'YIELD_FAITH',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Belief_YieldChangePerForeignCity 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_PREDESTINATION', 		'YIELD_GOLD',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldChangeWorldWonder
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldChangeWorldWonder 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	'YIELD_FAITH',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldFromConversion
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldFromConversion 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_ECUMENISM',				'YIELD_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_YieldFromConversion 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_FELLOWSHIP_TRUTH',		'YIELD_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_YieldFromConversion 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_PILGRIMAGE',		 	'YIELD_FAITH',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_YieldFromConversion 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_PREDESTINATION',		'YIELD_GOLD',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_YieldFromConversion 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_WHEEL_DHARMA',		 	'YIELD_GOLDEN_AGE_POINTS',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldPerGAP
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldPerGAP 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_THREE_TREASURES', 		'YIELD_FAITH',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldPerScience
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldPerScience 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_TRUE_THEOLOGY', 		'YIELD_FAITH',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldPerXFollowers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_CULT_HUITZILOPOCHTLI', 	'YIELD_JFD_HEALTH',				6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_FIRE_OF_FIRES', 		'YIELD_JFD_HEALTH',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_IMPERIAL_CULT', 		'YIELD_FAITH',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_LAND_ETERNAL_SKY', 		'YIELD_CULTURE',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_MANDATE_HEAVEN', 		'YIELD_GOLDEN_AGE_POINTS',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);

INSERT INTO Belief_YieldPerXFollowers 
		(BeliefType, 						YieldType, 						PerXFollowers)
SELECT	'BELIEF_JFD_ORAL_TORAH', 			'YIELD_PRODUCTION',				6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldFromKills
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldFromKills
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_FLOWER_WARS', 			'YIELD_FAITH',					50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldPerPop
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldPerPop 
		(BeliefType, 						YieldType, 						Yield)
SELECT	'BELIEF_JFD_VARNA_SYSTEM', 			'YIELD_FAITH',					5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClass_Missions 
		(MissionType,							UnitClassType,				RequiresBeliefType)
SELECT	'MISSION_JFD_CONVERT_GREAT_GENERAL',	'UNITCLASS_PROPHET',		'BELIEF_JFD_CULT_HUITZILOPOCHTLI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO UnitClass_Missions 
		(MissionType,							UnitClassType,				RequiresBeliefType)
SELECT	'MISSION_JFD_CURE_PLAGUE',				'UNITCLASS_PROPHET',		'BELIEF_JFD_FIRE_OF_FIRES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO UnitClass_Missions 
		(MissionType,							UnitClassType,				RequiresBeliefType)
SELECT	'MISSION_JFD_MAGISTRATES',				'UNITCLASS_PROPHET',		'BELIEF_JFD_ORAL_TORAH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO UnitClass_Missions 
		(MissionType,							UnitClassType,				RequiresBeliefType)
SELECT	'MISSION_JFD_POPULATION',				'UNITCLASS_PROPHET',		'BELIEF_JFD_LAND_ETERNAL_SKY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================	
-- REMAPPER
--==========================================================================================================================	
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Beliefs ORDER BY ID;
UPDATE Beliefs SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Beliefs.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
--==========================================================================================================================