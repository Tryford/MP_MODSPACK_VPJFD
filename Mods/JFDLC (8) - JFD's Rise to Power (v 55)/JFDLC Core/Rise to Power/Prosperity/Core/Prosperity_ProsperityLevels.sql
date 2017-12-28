--==========================================================================================================================	
-- PROSPERITY LEVELS
--==========================================================================================================================			
-- JFD_ProsperityLevels
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_AFFLUENT',		'TXT_KEY_PROSPERITY_JFD_AFFLUENT_DESC',		'TXT_KEY_PROSPERITY_JFD_AFFLUENT_HELP',		8,			'POLICY_JFD_PROSPERITY_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_BALANCED',		'TXT_KEY_PROSPERITY_JFD_BALANCED_DESC',		'TXT_KEY_PROSPERITY_JFD_BALANCED_HELP',		4,			'POLICY_JFD_PROSPERITY_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_WEAK',			'TXT_KEY_PROSPERITY_JFD_WEAK_DESC',			'TXT_KEY_PROSPERITY_JFD_WEAK_HELP',			1,			'POLICY_JFD_PROSPERITY_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_DESTITUTE',		'TXT_KEY_PROSPERITY_JFD_DESTITUTE_DESC',	'TXT_KEY_PROSPERITY_JFD_DESTITUTE_HELP',	0,			'POLICY_JFD_PROSPERITY_4'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================