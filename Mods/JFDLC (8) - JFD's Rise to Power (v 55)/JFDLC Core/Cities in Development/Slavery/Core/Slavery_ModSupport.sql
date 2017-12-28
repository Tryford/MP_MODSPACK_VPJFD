--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP_SLAVERY_CBO'
WHERE Type = 'POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP_SLAVERY_CBO'
WHERE Type = 'POLICY_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_EE_IMPERIALISM', Cost = 700
WHERE Type = 'BUILDING_JFD_STONE_TOWN' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_NAVIGATION'
WHERE Type = 'BUILDING_EE_TORRE' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_ECONOMICS'
WHERE Type = 'BUILDING_EE_WEIGH_HOUSE' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================