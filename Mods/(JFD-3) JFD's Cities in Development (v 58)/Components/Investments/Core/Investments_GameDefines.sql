--==========================================================================================================================
-- CustomModOptions
--==========================================================================================================================
INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_BUILDING_INVESTMENTS', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET HurryCostModifier = 5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Buildings
SET HurryCostModifier = 70
WHERE Type = 'BUILDING_COURTHOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Buildings
SET HurryCostModifier = -5 
WHERE HurryCostModifier == -1 AND Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxGlobalInstances = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Investments_Building
AFTER INSERT ON Buildings
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET HurryCostModifier = 5
	WHERE Type = NEW.Type;

	UPDATE Buildings
	SET HurryCostModifier = -5 
	WHERE Type = NEW.Type AND Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxGlobalInstances = 1);
END;
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCANTILISM_HELP', InvestmentModifier = -15
WHERE Type = 'POLICY_MERCANTILISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_HurryModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_HurryModifiers WHERE PolicyType = 'POLICY_MERCANTILISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM' AND Value = 1);
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US
SET Text = '[NEWLINE]You do not have enough [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_CANNOT_PURCHASE_NO_GOLD' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'If you have enough [ICON_GOLD] Gold or [ICON_PEACE] Faith, use it to hurry a building or unit.'
WHERE Tag = 'TXT_KEY_CITYVIEW_PURCHASE_TT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'If you have enough [ICON_GOLD] Gold, [ICON_CITIZEN] Population, or [ICON_PEACE] Faith, use it to hurry a building or unit.'
WHERE Tag = 'TXT_KEY_CITYVIEW_PURCHASE_TT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'If you have enough [ICON_GOLD] Gold, [ICON_JFD_SHACKLES] Shackles, or [ICON_PEACE] Faith, use it to hurry a building or unit.'
WHERE Tag = 'TXT_KEY_CITYVIEW_PURCHASE_TT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'If you have enough [ICON_GOLD] Gold, [ICON_JFD_SHACKLES] Shackles, [ICON_CITIZEN] Population, or [ICON_PEACE] Faith, use it to hurry a building or unit.'
WHERE Tag = 'TXT_KEY_CITYVIEW_PURCHASE_TT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================