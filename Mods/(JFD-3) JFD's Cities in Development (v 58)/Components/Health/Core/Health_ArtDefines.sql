--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_SOUND_JFD_DOCTOR', 				'Doctor',				'DynamicResident'),
		('SND_SOUND_JFD_PLAGUE', 				'Plague',				'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_PONT_DU_GARD', 	'Wonder_PontDuGard',	'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_DOCTOR',				'SND_SOUND_JFD_DOCTOR', 				'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_PLAGUE',				'SND_SOUND_JFD_PLAGUE', 				'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_PONT_DU_GARD',	'SND_WONDER_SPEECH_JFD_PONT_DU_GARD', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_DISEASE', 	0.560, 	0.576, 	0,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_HEALTH', 	.803, 	0.929, 	0.929, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_PLAGUE', 	0.650, 	0.4, 	0,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_HEALTH_BUILD_ATLAS', 				64, 		'JFD_HealthBuildAtlas_64.dds',				1, 				1),
		('JFD_HEALTH_BUILD_ATLAS', 				45, 		'JFD_HealthBuildAtlas_45.dds',				1, 				1),
		('JFD_HEALTH_BUILDING_ATLAS',			256, 		'JFD_HealthBuildingAtlas_256.dds',			2, 				2),
		('JFD_HEALTH_BUILDING_ATLAS',			128, 		'JFD_HealthBuildingAtlas_128.dds',			2, 				2),
		('JFD_HEALTH_BUILDING_ATLAS',			80, 		'JFD_HealthBuildingAtlas_80.dds',			2, 				2),
		('JFD_HEALTH_BUILDING_ATLAS',			64, 		'JFD_HealthBuildingAtlas_64.dds',			2, 				2),
		('JFD_HEALTH_BUILDING_ATLAS',			45, 		'JFD_HealthBuildingAtlas_45.dds',			2, 				2),
		('JFD_HEALTH_IMPROVEMENT_ATLAS', 		256, 		'JFD_HealthImprovementAtlas_256.dds',		1, 				1),
		('JFD_HEALTH_IMPROVEMENT_ATLAS', 		64, 		'JFD_HealthImprovementAtlas_64.dds',		1, 				1),
		('JFD_HEALTH_IMPROVEMENT_ATLAS', 		45, 		'JFD_HealthImprovementAtlas_45.dds',		1, 				1),
		('JFD_HEALTH_MISSION_ATLAS_1',			64, 		'JFD_HealthMission1Atlas_64.dds',			1, 				1),
		('JFD_HEALTH_MISSION_ATLAS_1',			45, 		'JFD_HealthMission1Atlas_45.dds',			1, 				1),
		('JFD_HEALTH_MISSION_ATLAS_2',			64, 		'JFD_HealthMission2Atlas_64.dds',			1, 				1),
		('JFD_HEALTH_MISSION_ATLAS_2',			45, 		'JFD_HealthMission2Atlas_45.dds',			1, 				1),
		('JFD_HEALTH_NATIONAL_WONDER_ATLAS',	256, 		'JFD_HealthNationalWonderAtlas_256.dds',	1, 				1),
		('JFD_HEALTH_NATIONAL_WONDER_ATLAS',	128, 		'JFD_HealthNationalWonderAtlas_128.dds',	1, 				1),
		('JFD_HEALTH_NATIONAL_WONDER_ATLAS',	80, 		'JFD_HealthNationalWonderAtlas_80.dds',		1, 				1),
		('JFD_HEALTH_NATIONAL_WONDER_ATLAS',	64, 		'JFD_HealthNationalWonderAtlas_64.dds',		1, 				1),
		('JFD_HEALTH_NATIONAL_WONDER_ATLAS',	45, 		'JFD_HealthNationalWonderAtlas_45.dds',		1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			256, 		'JFD_HealthSpecialistAtlas_256.dds',		1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			128, 		'JFD_HealthSpecialistAtlas_128.dds',		1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			80, 		'JFD_HealthSpecialistAtlas_80.dds',			1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			64, 		'JFD_HealthSpecialistAtlas_64.dds',			1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			45, 		'JFD_HealthSpecialistAtlas_45.dds',			1, 				1),
		('JFD_HEALTH_SPECIALIST_ATLAS',			32, 		'JFD_HealthSpecialistAtlas_32.dds',			1, 				1),
		('JFD_HEALTH_PROMOTION_ATLAS',			256, 		'JFD_HealthPromotions_256.dds',				6, 				6),
		('JFD_HEALTH_PROMOTION_ATLAS',			64, 		'JFD_HealthPromotions_64.dds',				6, 				6),
		('JFD_HEALTH_PROMOTION_ATLAS',			45, 		'JFD_HealthPromotions_45.dds',				6, 				6),
		('JFD_HEALTH_PROMOTION_ATLAS',			32, 		'JFD_HealthPromotions_32.dds',				6, 				6),
		('JFD_HEALTH_PROMOTION_ATLAS',			16, 		'JFD_HealthPromotions_16.dds',				6, 				6),
		('JFD_HEALTH_TECH_ATLAS',				256, 		'JFD_HealthTechAtlas_256.dds',				1, 				1),
		('JFD_HEALTH_TECH_ATLAS',				214, 		'JFD_HealthTechAtlas_214.dds',				1, 				1),
		('JFD_HEALTH_TECH_ATLAS',				128, 		'JFD_HealthTechAtlas_128.dds',				1, 				1),
		('JFD_HEALTH_TECH_ATLAS',				80, 		'JFD_HealthTechAtlas_80.dds',				1, 				1),
		('JFD_HEALTH_TECH_ATLAS',				64, 		'JFD_HealthTechAtlas_64.dds',				1, 				1),
		('JFD_HEALTH_TECH_ATLAS',				45, 		'JFD_HealthTechAtlas_45.dds',				1, 				1),
		('JFD_HEALTH_WONDER_ATLAS',				256, 		'JFD_HealthWonderAtlas_256.dds',			1, 				1),
		('JFD_HEALTH_WONDER_ATLAS',				128, 		'JFD_HealthWonderAtlas_128.dds',			1, 				1),
		('JFD_HEALTH_WONDER_ATLAS',				80, 		'JFD_HealthWonderAtlas_80.dds',				1, 				1),
		('JFD_HEALTH_WONDER_ATLAS',				64, 		'JFD_HealthWonderAtlas_64.dds',				1, 				1),
		('JFD_HEALTH_WONDER_ATLAS',				45, 		'JFD_HealthWonderAtlas_45.dds',				1, 				1),
		('JFD_HEALTH_UNIT_ATLAS',				256, 		'JFD_HealthUnitAtlas_256.dds',				1, 				1),
		('JFD_HEALTH_UNIT_ATLAS',				128, 		'JFD_HealthUnitAtlas_128.dds',				1, 				1),
		('JFD_HEALTH_UNIT_ATLAS',				80, 		'JFD_HealthUnitAtlas_80.dds',				1, 				1),
		('JFD_HEALTH_UNIT_ATLAS',				64, 		'JFD_HealthUnitAtlas_64.dds',				1, 				1),
		('JFD_HEALTH_UNIT_ATLAS',				45, 		'JFD_HealthUnitAtlas_45.dds',				1, 				1),
		('JFD_UNIT_FLAG_GREAT_DOCTOR_ATLAS',	32, 		'JFD_HealthGreatDoctorUnitFlag_32.dds',		1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DISEASE', 				'JFD_HealthFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_HEALTH', 				'JFD_HealthFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE', 				'JFD_PlagueFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_BUBONIC',			'JFD_PlagueBubonicFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_CHOLERA',			'JFD_PlagueCholeraFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_INFLUENZA',		'JFD_PlagueInfluenzaFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);			

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_LEPROSY',			'JFD_PlagueLeprosyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);			

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_MEASLES',			'JFD_PlagueMeaslesFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_POSSESSION',		'JFD_PlaguePossessionFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_PNEUMONIA',		'JFD_PlaguePneumoniaFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);						

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_SMALLPOX',		'JFD_PlagueSmallpoxFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);				

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_TYPHOID',			'JFD_PlagueTyphoidFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);				

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_TUBERCULOSIS',	'JFD_PlagueTuberculosisFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);				

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PLAGUE_TYPHUS',			'JFD_PlagueTyphusFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_DISEASE',								'ICON_FONT_TEXTURE_JFD_DISEASE',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_HEALTH',								'ICON_FONT_TEXTURE_JFD_HEALTH',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE',								'ICON_FONT_TEXTURE_JFD_PLAGUE',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_BUBONIC',						'ICON_FONT_TEXTURE_JFD_PLAGUE_BUBONIC',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_CHOLERA',						'ICON_FONT_TEXTURE_JFD_PLAGUE_CHOLERA',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_INFLUENZA',					'ICON_FONT_TEXTURE_JFD_PLAGUE_INFLUENZA',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_LEPROSY',						'ICON_FONT_TEXTURE_JFD_PLAGUE_LEPROSY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_MEASLES',						'ICON_FONT_TEXTURE_JFD_PLAGUE_MEASLES',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_POSSESSION',					'ICON_FONT_TEXTURE_JFD_PLAGUE_POSSESSION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_PNEUMONIA',					'ICON_FONT_TEXTURE_JFD_PLAGUE_PNEUMONIA',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SMALLPOX',						'ICON_FONT_TEXTURE_JFD_PLAGUE_SMALLPOX',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TYPHOID',						'ICON_FONT_TEXTURE_JFD_PLAGUE_TYPHOID',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TUBERCULOSIS',					'ICON_FONT_TEXTURE_JFD_PLAGUE_TUBERCULOSIS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TYPHUS',						'ICON_FONT_TEXTURE_JFD_PLAGUE_TYPHUS',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type,									LandmarkType,	FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_JFD_PLAGUE',		'Improvement',	'Plague'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE_PLAGUE_EFFECT' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes
		(Type,									LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_JFD_SANATORIUM',	'Improvement',	'Sanatorium');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,	 State,			 Scale,	 ImprovementType,					LayoutHandler,	ResourceType,				Model,						TerrainContour, Tech)
SELECT	'Any',  'Constructed',	 0.3,	 'ART_DEF_IMPROVEMENT_JFD_PLAGUE',	'RANDOM',		'ART_DEF_RESOURCE_NONE',	'feature_plague.fxsxml',	1,				NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE_PLAGUE_EFFECT' AND Value = 1);

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction',	0.60,  'ART_DEF_IMPROVEMENT_JFD_SANATORIUM', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sanitarium_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',		0.60,  'ART_DEF_IMPROVEMENT_JFD_SANATORIUM', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sanitarium_B.fxsxml',  1 UNION ALL
SELECT 'Any', 'Pillaged',			0.60,  'ART_DEF_IMPROVEMENT_JFD_SANATORIUM', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sanitarium_PL.fxsxml', 1;
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_JFD_SANATORIUM', 	'Improvement', 	'sv_Sanatorium.dds');
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_GREAT_DOCTOR', 		'Unit', 		'sv_GreatDoctor.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GREAT_DOCTOR',		DamageStates, 	'EarlyGreatArtist'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MERCHANT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
VALUES	('ART_DEF_UNIT_JFD_GREAT_DOCTOR',		'ART_DEF_UNIT_MEMBER_JFD_GREAT_DOCTOR',		1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GREAT_DOCTOR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GREAT_DOCTOR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GREAT_DOCTOR',	Scale,	ZOffset, Domain, 'great_doctor_early.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER';
--==========================================================================================================================
--==========================================================================================================================
