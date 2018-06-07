--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Technologies SET CityLessEmbarkCost = 1 WHERE Type = 'TECH_NAVIGATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TECH_ADDITIONS_EMBARKATION' AND Value = 1);

UPDATE Technologies SET CityNoEmbarkCost = 1 WHERE Type = 'TECH_ROCKETRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TECH_ADDITIONS_EMBARKATION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,					EffectToolTip,										UnitAction)
SELECT	'TECH_NAVIGATION',			'TXT_KEY_ABLTY_CITY_LESS_EMBARK_COST_STRING',		'MISSION_EMBARK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TECH_ADDITIONS_EMBARKATION' AND Value = 1);

INSERT INTO Technologies_JFD_MiscEffects
		(TechType,					EffectToolTip,							  			UnitAction)
SELECT	'TECH_ROCKETRY',			'TXT_KEY_ABLTY_CITY_NO_EMBARK_COST_STRING',			'MISSION_EMBARK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_TECH_ADDITIONS_EMBARKATION' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================