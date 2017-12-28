--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Building_ConstructionAudio
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ConstructionAudio 
		(BuildingType,  ConstructionAudio)
SELECT	Type,			'AS2D_BUILDING_JFD_SHRINE'
FROM Buildings WHERE Type IN ('BUILDING_JELLING_STONES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_BASTION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_BASTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_CLOTH_MILL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_CLOTH_MILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_DRYDOCK'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_DRYDOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_GALLERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_GALLERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_GUNSMITH'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_GUNSMITH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_SALON'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_SALON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_TAVERN'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_TAVERN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

UPDATE BuildingClass_ConstructionAudio
SET ConstructionAudio = 'AS2D_BUILDING_JFD_THEATRE'
WHERE ConstructionAudio = 'AS2D_BUILDING_JFD_ZOO'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_WELL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WELL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, ConstructionAudio)
SELECT	Type,				'AS2D_BUILDING_JFD_MENAGERIE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_MENAGERIE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WEIGH_HOUSE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_WEIGH_HOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_District
------------------------------------------------------------------------------------------------------------------------
UPDATE BuildingClass_JFD_District
SET DistrictType = 'BUILDINGCLASSCATEGORY_CULTURAL'
WHERE BuildingClassType = 'BUILDINGCLASS_THEATRE'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_CULTURAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_EE_SALON', 'BUILDINGCLASS_EE_CRYSTAL_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_EDUCATION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_ACADEMY', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_EE_SMITHSONIAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_ENTERTAINMENT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_MENAGERIE', 'BUILDINGCLASS_EE_TAVERN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_FINANCIAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_TORRE_DEL_ORO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_INDUSTRIAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_CLOTH_MILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_MARITIME'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_DRYDOCK', 'BUILDINGCLASS_EE_KRONBORG')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);	

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_MILITARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_GUNSMITH', 'BUILDINGCLASS_EE_TOPKAPI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_DISTRICTS' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================