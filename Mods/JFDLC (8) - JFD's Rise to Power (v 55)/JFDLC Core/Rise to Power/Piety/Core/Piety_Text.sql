--==========================================================================================================================	
-- TEXT
--==========================================================================================================================	
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = 'You must have researched Philosophy to adopt a State Religion. There must be a valid Religion and you must have met the founder.[NEWLINE][NEWLINE]You may secularize your State Religion once you have researched Scientific Theory.[NEWLINE][NEWLINE]It will cost you {1_Num} Turn(s) of [ICON_RESISTANCE] Anarchy to change your State Religion or to Secularize.'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 0);

UPDATE Language_en_US
SET Text = 'You must have researched Philosophy to adopt a State Religion. There must be a valid Religion and you must have met the founder.'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_PAGAN_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================