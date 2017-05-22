--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
VALUES	('SND_BUILDING_JFD_CHANCERY', 			'Chancery',								'DynamicResident'),
		('SND_BUILDING_JFD_COURT_CHANCERY', 	'CourtChancery',						'DynamicResident'),
		('SND_BUILDING_JFD_HIGH_COURT', 		'HighCourt',							'DynamicResident'),
		('SND_BUILDING_JFD_MAGISTRATES_COURT', 	'MagistratesCourt',						'DynamicResident'),
		('SND_BUILDING_JFD_SUPREME_COURT', 		'SupremeCourt',							'DynamicResident'),
		('SND_SOUND_JFD_MARRIAGE', 				'Marriage',								'DynamicResident'),
		('SND_SOUND_JFD_GREAT_DIGNITARY', 		'GreatDignitary',						'DynamicResident'),
		('SND_SOUND_JFD_GREAT_MAGISTRATE', 		'GreatMagistrate',						'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_FORUM_MAGNUM', 	'Wonder_ForumRomanum',					'DynamicResident'),	
		('SND_WONDER_SPEECH_JFD_WESTMINSTER', 	'Wonder_Westminster',					'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_BUILDING_JFD_CHANCERY',			'SND_BUILDING_JFD_CHANCERY',			'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_COURT_CHANCERY',	'SND_BUILDING_JFD_COURT_CHANCERY',		'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_HIGH_COURT',		'SND_BUILDING_JFD_HIGH_COURT',			'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_MAGISTRATES_COURT',	'SND_BUILDING_JFD_MAGISTRATES_COURT',	'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_BUILDING_JFD_SUPREME_COURT',		'SND_BUILDING_JFD_SUPREME_COURT',		'GAME_SFX', 			-1.0,					100,		100,		0,	     0), 
		('AS2D_MISC_JFD_MARRIAGE',				'SND_SOUND_JFD_MARRIAGE', 				'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_GREAT_DIGNITARY',		'SND_SOUND_JFD_GREAT_DIGNITARY', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_GREAT_MAGISTRATE',		'SND_SOUND_JFD_GREAT_MAGISTRATE', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_FORUM_MAGNUM',	'SND_WONDER_SPEECH_JFD_FORUM_MAGNUM', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_WESTMINSTER',	'SND_WONDER_SPEECH_JFD_WESTMINSTER', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CLAIM_MEDIUM', 	'JFD_ClaimMediumFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CLAIM_STRONG', 	'JFD_ClaimStrongFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CLAIM_WEAK', 	'JFD_ClaimWeakFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);			
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_MEDIUM',	'ICON_FONT_TEXTURE_JFD_CLAIM_MEDIUM',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_STRONG',	'ICON_FONT_TEXTURE_JFD_CLAIM_STRONG',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_WEAK',		'ICON_FONT_TEXTURE_JFD_CLAIM_WEAK',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_CLAIMS_BUILDING_ATLAS',				256, 		'JFD_ClaimsBuildingAtlas_256.dds',			3, 				3),
		('JFD_CLAIMS_BUILDING_ATLAS',				128, 		'JFD_ClaimsBuildingAtlas_128.dds',			3, 				1),
		('JFD_CLAIMS_BUILDING_ATLAS',				80, 		'JFD_ClaimsBuildingAtlas_80.dds',			3, 				1),
		('JFD_CLAIMS_BUILDING_ATLAS',				64, 		'JFD_ClaimsBuildingAtlas_64.dds',			3, 				1),
		('JFD_CLAIMS_BUILDING_ATLAS',				45, 		'JFD_ClaimsBuildingAtlas_45.dds',			3, 				1),
		('JFD_CLAIMS_MISSION_ATLAS',				45, 		'JFD_ClaimsMissionAtlas_45.dds',			1, 				1),
		('JFD_CLAIMS_RESOURCE_ATLAS',				256, 		'JFD_ClaimsResourceAtlas_256.dds',			1, 				1),
		('JFD_CLAIMS_RESOURCE_ATLAS',				128, 		'JFD_ClaimsResourceAtlas_128.dds',			1, 				1),
		('JFD_CLAIMS_RESOURCE_ATLAS',				80, 		'JFD_ClaimsResourceAtlas_80.dds',			1, 				1),
		('JFD_CLAIMS_RESOURCE_ATLAS',				64, 		'JFD_ClaimsResourceAtlas_64.dds',			1, 				1),
		('JFD_CLAIMS_RESOURCE_ATLAS',				45, 		'JFD_ClaimsResourceAtlas_45.dds',			1, 				1),
		('JFD_CLAIMS_MISSION_ATLAS_1',				64, 		'JFD_ClaimsMission1Atlas_64.dds',			1, 				1),
		('JFD_CLAIMS_MISSION_ATLAS_1',				45, 		'JFD_ClaimsMission1Atlas_45.dds',			1, 				1),
		('JFD_CLAIMS_MISSION_ATLAS_2',				64, 		'JFD_ClaimsMission2Atlas_64.dds',			1, 				1),
		('JFD_CLAIMS_MISSION_ATLAS_2',				45, 		'JFD_ClaimsMission2Atlas_45.dds',			1, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				256, 		'JFD_ClaimsSpecialistAtlas_256.dds',		2, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				128, 		'JFD_ClaimsSpecialistAtlas_128.dds',		2, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				80, 		'JFD_ClaimsSpecialistAtlas_80.dds',			2, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				64, 		'JFD_ClaimsSpecialistAtlas_64.dds',			2, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				45, 		'JFD_ClaimsSpecialistAtlas_45.dds',			2, 				1),
		('JFD_CLAIMS_SPECIALIST_ATLAS',				32, 		'JFD_ClaimsSpecialistAtlas_32.dds',			2, 				1),
		('JFD_CLAIMS_TECH_ATLAS',					256, 		'JFD_ClaimsTechAtlas_256.dds',				2, 				2),
		('JFD_CLAIMS_TECH_ATLAS',					214, 		'JFD_ClaimsTechAtlas_214.dds',				2, 				2),
		('JFD_CLAIMS_TECH_ATLAS',					128, 		'JFD_ClaimsTechAtlas_128.dds',				2, 				2),
		('JFD_CLAIMS_TECH_ATLAS',					80, 		'JFD_ClaimsTechAtlas_80.dds',				2, 				2),
		('JFD_CLAIMS_TECH_ATLAS',					64, 		'JFD_ClaimsTechAtlas_64.dds',				2, 				2),
		('JFD_CLAIMS_TECH_ATLAS',					45, 		'JFD_ClaimsTechAtlas_45.dds',				2, 				2),
		('JFD_CLAIMS_UNIT_ATLAS',					256, 		'JFD_ClaimsUnitAtlas_256.dds',				3, 				3),
		('JFD_CLAIMS_UNIT_ATLAS',					128, 		'JFD_ClaimsUnitAtlas_128.dds',				3, 				3),
		('JFD_CLAIMS_UNIT_ATLAS',					80, 		'JFD_ClaimsUnitAtlas_80.dds',				3, 				3),
		('JFD_CLAIMS_UNIT_ATLAS',					64, 		'JFD_ClaimsUnitAtlas_64.dds',				3, 				3),
		('JFD_CLAIMS_UNIT_ATLAS',					45, 		'JFD_ClaimsUnitAtlas_45.dds',				3, 				3),
		('JFD_CLAIMS_WONDER_ATLAS',					256, 		'JFD_ClaimsWonderAtlas_256.dds',			2, 				2),
		('JFD_CLAIMS_WONDER_ATLAS',					128, 		'JFD_ClaimsWonderAtlas_128.dds',			2, 				2),
		('JFD_CLAIMS_WONDER_ATLAS',					80, 		'JFD_ClaimsWonderAtlas_80.dds',				2, 				2),
		('JFD_CLAIMS_WONDER_ATLAS',					64, 		'JFD_ClaimsWonderAtlas_64.dds',				2, 				2),
		('JFD_CLAIMS_WONDER_ATLAS',					45, 		'JFD_ClaimsWonderAtlas_45.dds',				2, 				2),
		('JFD_UNIT_FLAG_GREAT_DIGNITARY_ATLAS',		32, 		'JFD_ClaimsGreatDignitaryUnitFlag_32.dds',	1, 				1),
		('JFD_UNIT_FLAG_GREAT_MAGISTRATE_ATLAS',	32, 		'JFD_ClaimsGreatMagistrateUnitFlag_32.dds',	1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_DIGNITARY',			'JFD_DignitaryFontIcons_22');			
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,					IconMapping)
VALUES	('ICON_JFD_DIGNITARY',	'ICON_FONT_TEXTURE_JFD_DIGNITARY',	1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 									TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_GREAT_DIGNITARY', 					'Unit', 	'sv_GreatDignitary.dds'),
		('ART_DEF_UNIT_JFD_GREAT_MAGISTRATE', 					'Unit', 	'sv_GreatMagistrate.dds'),
		('ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE', 		'Unit', 	'sv_GreatMagistrate.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GREAT_DIGNITARY',						DamageStates, 	'EarlyGreatArtist'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE',					DamageStates, 	'EarlyGreatArtist'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation,				IconAtlas,					PortraitIndex)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE',		DamageStates, 	'EarlyGreatArtist',		'JFD_CLAIMS_UNIT_ATLAS',	5	
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,											UnitMemberInfoType,										NumMembers)
VALUES	('ART_DEF_UNIT_JFD_GREAT_DIGNITARY',					'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					1),
		('ART_DEF_UNIT_JFD_GREAT_MAGISTRATE',					'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					1),
		('ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE',		'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					Scale,	ZOffset, Domain, 'great_dignitary.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					Scale,	ZOffset, Domain, 'great_magistrate.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		Scale,	ZOffset, Domain, 'great_magistrate_late.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1';
--==========================================================================================================================
--==========================================================================================================================