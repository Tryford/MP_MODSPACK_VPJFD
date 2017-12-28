--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET LoyaltyGarrisonLevels = 5
WHERE Type IN ('POLICY_PROFESSIONAL_ARMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Honor[ENDCOLOR][NEWLINE]Units gain +10% [ICON_STRENGTH] Strength. A Military Unit spawns near all Cities that reach a multiple of 8 [ICON_CITIZEN] Citizens (or have already exceeded 8 [ICON_CITIZEN] Citizens). Military Garrisons increase [ICON_JFD_BLUE_FIST] Loyalty by +5% per level.'
WHERE Tag = 'TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET GridX = 12
WHERE Type = 'TECH_JFD_NATIONALISM'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technology_PrereqTechs
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technology_PrereqTechs 
SET PrereqTech = 'TECH_EE_ROMANTICISM'
WHERE TechType = 'TECH_JFD_NATIONALISM' AND PrereqTech = 'TECH_SCIENTIFIC_THEORY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================