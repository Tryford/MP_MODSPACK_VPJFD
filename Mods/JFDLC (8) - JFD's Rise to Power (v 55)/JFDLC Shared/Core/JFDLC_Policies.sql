--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
-------------------------------------
UPDATE Policies
SET IsDummy = 1
WHERE PolicyBranchType IS NULL
AND NOT Type IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy IS NOT NULL)
AND NOT Type IN (SELECT FreeFinishingPolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy IS NOT NULL);

CREATE TRIGGER JFDLC_Policies
AFTER INSERT ON Policies
WHEN NEW.PolicyBranchType IS NULL
AND NOT NEW.Type IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy != NOT NULL)
AND NOT NEW.Type IN (SELECT FreeFinishingPolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy != NOT NULL)
BEGIN
	UPDATE Policies
	SET IsDummy = 1
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================