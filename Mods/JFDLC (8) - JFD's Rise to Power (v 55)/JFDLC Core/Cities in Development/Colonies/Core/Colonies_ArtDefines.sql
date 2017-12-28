--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_COLONIST',		'Unit', 	'sv_Colonist.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT__SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AFRI',	'Unit', 	'sv_Colonist.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT__SETTLER_AFRI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AMER',	'Unit', 	'sv_Colonist.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT__SETTLER_AMER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_ASIA',	'Unit', 	'sv_Colonist.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT__SETTLER_ASIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AFRI',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_AFRI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AMER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_AMER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_ASIA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_ASIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST',		UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AFRI',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AMER',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_ASIA',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================