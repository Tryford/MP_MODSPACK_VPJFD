--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- LocalizedText
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'Border Growth', '[ICON_TILE] Tile Expansion')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%';

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'border growth', '[ICON_TILE] Tile Expansion')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%';

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'border growth', '[ICON_TILE] Tile Expansion')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%';

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'GAP', 'Prestige')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CHANGES_GOLDEN_AGE_POINTS' AND Value = 1);

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'Golden Age Points', 'Prestige')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CHANGES_GOLDEN_AGE_POINTS' AND Value = 1);

CREATE TRIGGER JFDLC_Text
AFTER INSERT ON LocalizedText
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CHANGES_GOLDEN_AGE_POINTS' AND Value = 1)
BEGIN
	INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
	SELECT Language, Tag, Gender, Plurality, Replace(Text, 'GAP', 'Prestige')
	FROM LocalizedText WHERE NEW.Tag LIKE 'TXT_KEY_%';
	
	INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
	SELECT Language, Tag, Gender, Plurality, Replace(Text, 'Golden Age Points', 'Prestige')
	FROM LocalizedText WHERE NEW.Tag LIKE 'TXT_KEY_%';
END;
--==========================================================================================================================
--==========================================================================================================================
