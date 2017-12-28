--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
-------------------------------------
INSERT INTO Buildings
		(Type,							BuildingClass,				Cost, 	FaithCost,	Defense,	PrereqTech,	GreatWorkCount,			Description)
VALUES	('BUILDING_JFD_DEFENSE',		'BUILDINGCLASS_JFDLC',		-1,		-1,			100,		NULL,		-1,						'TXT_KEY_BUILDING_JFD_DEFENSE_DESC');

UPDATE Buildings
SET IsDummy = 1
WHERE Cost = -1 AND GreatWorkCount = -1;

CREATE TRIGGER JFDLC_Buildings
AFTER INSERT ON Buildings
WHEN NEW.Cost = -1 AND NEW.GreatWorkCount = -1
BEGIN
	UPDATE Buildings
	SET IsDummy = 1
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================