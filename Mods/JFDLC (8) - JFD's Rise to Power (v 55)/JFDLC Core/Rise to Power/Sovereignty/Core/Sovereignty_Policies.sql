--==========================================================================================================================
-- SOCIAL POLICIES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
--Tradition
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_TRADITION_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Liberty
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_LIBERTY_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Honor
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_HONOR_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Piety
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_PIETY_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Patronage
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_PATRONAGE_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Aesthetics
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_AESTHETICS_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_AESTHETICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Exploration
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_EXPLORATION_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Commerce
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_COMMERCE_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Rationalism
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_RATIONALISM_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_RATIONALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Freedom
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_FREEDOM_TITLE_SHORT', IconString = '[ICON_IDEOLOGY_FREEDOM]'
WHERE Type = 'POLICY_BRANCH_FREEDOM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Order
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_ORDER_TITLE_SHORT', IconString = '[ICON_IDEOLOGY_ORDER]'
WHERE Type = 'POLICY_BRANCH_ORDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Autocracy
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_AUTOCRACY_TITLE_SHORT', IconString = '[ICON_IDEOLOGY_AUTOCRACY]'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Ideals
UPDATE PolicyBranchTypes
SET TitleShort = 'TXT_KEY_IDEALS_TITLE_SHORT'
WHERE Type = 'POLICY_BRANCH_IDEALS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================