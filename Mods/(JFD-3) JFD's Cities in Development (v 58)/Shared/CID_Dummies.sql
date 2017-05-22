--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
-------------------------------------
UPDATE Buildings
SET IsDummy = 1
WHERE Cost = -1 AND GreatWorkCount = -1;

CREATE TRIGGER JFDCID_Buildings
AFTER INSERT ON Buildings
WHEN NEW.Cost = -1 AND NEW.GreatWorkCount = -1
BEGIN
	UPDATE Buildings
	SET IsDummy = 1
	WHERE Type = NEW.Type;
END;
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

CREATE TRIGGER JFDCID_Policies
AFTER INSERT ON Policies
WHEN NEW.PolicyBranchType IS NULL
AND NOT NEW.Type IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy IS NOT NULL)
AND NOT NEW.Type IN (SELECT FreeFinishingPolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy IS NOT NULL)
BEGIN
	UPDATE Policies
	SET IsDummy = 1
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================