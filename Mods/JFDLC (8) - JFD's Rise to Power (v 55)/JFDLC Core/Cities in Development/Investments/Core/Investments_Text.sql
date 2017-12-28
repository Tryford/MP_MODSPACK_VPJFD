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
SET Text = 'SPEND'
WHERE Tag = 'TXT_KEY_CITYVIEW_PURCHASE_BUTTON' 
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