--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
DELETE FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_DECISIONS_INDONESIASPICE', 'BUILDINGCLASS_DECISIONS_DUTCHNAVY', 'BUILDINGCLASS_DECISIONS_PORTUGALCASADAINDIA', 'BUILDINGCLASS_DECISIONS_MONGOLIASILKROAD');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Buildings WHERE Type IN ('BUILDING_DECISIONS_WEIGHTSFORMAL', 'BUILDING_DECISIONS_UNIVERSITYGRANTS', 'BUILDING_DECISIONS_NATIONALISEUTILITIES', 'BUILDING_DECISIONS_ROMANCONCRETE', 'BUILDING_DECISIONS_GREATSEJM', 'BUILDING_DECISIONS_THAIALPHABET', 'BUILDING_DECISIONS_IROQUOISLAWOFPEACE', 'BUILDING_DECISIONS_MONGOLIASILKROAD2', 'BUILDING_DECISIONS_CELTSTINTRADE', 'BUILDING_DECISIONS_ETHIOPIASOLOMONIC', '');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_PALACE_HELP'
WHERE Type = 'BUILDING_PALACE';
--==========================================================================================================================
--==========================================================================================================================