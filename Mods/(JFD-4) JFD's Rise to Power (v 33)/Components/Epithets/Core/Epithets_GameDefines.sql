--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_EPITHETS_DEFAULT_GOLDEN_AGE_POINTS',	100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
------------------------------	
INSERT INTO Notifications 
		(NotificationType, 								Welcomeness)
VALUES	('NOTIFICATION_JFD_EPITHET',					1);
--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
-------------------------------------
UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_AUTOCRACY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_AESTHETICS_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_AESTHETICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_COMMERCE_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_EXPLORATION_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_HONOR_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_FREEDOM_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_FREEDOM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_LIBERTY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_ORDER_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_ORDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_PATRONAGE_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_PIETY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_RATIONALISM_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_RATIONALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_TRADITION_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);
--========================================================================================================================================================================
--========================================================================================================================================================================