--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,															Value)
VALUES	('JFD_SOVEREIGNTY_DEFAULT_ANARCHY_TURNS',						2),
		('JFD_SOVEREIGNTY_DEFAULT_ANARCHY_COOLDOWN_TURNS',				20),
		('JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN',				25),
		('JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN_RATE',			1),
		('JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN',						20),
		--('JFD_SOVEREIGNTY_HOLY_SYNOD_MEMBERS',							10),
		('JFD_SOVEREIGNTY_NO_LEGISLATURE_ANARCHY_PENALTY',				10),
		('JFD_SOVEREIGNTY_NO_LEGISLATURE_SOVEREIGNTY_PENALTY',			0),
		('JFD_SOVEREIGNTY_LEGITIMACY_POPULATION_THRESHOLD',				8),
		('JFD_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES',				3),
		('JFD_SOVEREIGNTY_REFORM_CITY_STATE_SOVEREIGNTY',				10),
		('JFD_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES',					6),
		('JFD_SOVEREIGNTY_REFORM_EMPIRE_SOVEREIGNTY',					20);
--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Notifications 
		(NotificationType, 												Welcomeness)
VALUES	('NOTIFICATION_JFD_CHOOSE_GOVERNMENT',							1),
		('NOTIFICATION_JFD_GOVERNMENT',									1),
		('NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER',					1),
		('NOTIFICATION_JFD_REFORM',										1);
--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================	
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowGovernments,		EffectToolTip)
SELECT	'TECH_PHILOSOPHY',				1,						'TXT_KEY_JFD_ALLOWS_GOVERNMENTS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_HAPPINESS',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================