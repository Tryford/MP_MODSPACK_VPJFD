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