--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- IconTextureAtlases
------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_POUAKAI_MERCENARY_MISSION_ATLAS', 		64, 		'JFD_Pouakai_MercenaryMissionAtlas_45.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_MISSION_ATLAS', 		45, 		'JFD_Pouakai_MercenaryMissionAtlas_45.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_NOTIFICATION_ATLAS', 	80, 		'JFD_Pouakai_MercenaryNotificationAtlas_80.dds',	1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			256, 		'JFD_Pouakai_MercenaryTechAtlas_256.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			214, 		'JFD_Pouakai_MercenaryTechAtlas_214.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			128, 		'JFD_Pouakai_MercenaryTechAtlas_128.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			80, 		'JFD_Pouakai_MercenaryTechAtlas_80.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			64, 		'JFD_Pouakai_MercenaryTechAtlas_64.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_TECH_ATLAS', 			45, 		'JFD_Pouakai_MercenaryTechAtlas_45.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_UNIT_ATLAS', 			256, 		'JFD_Pouakai_MercenaryUnitAtlas_256.dds',			2, 				2),
		('JFD_POUAKAI_MERCENARY_UNIT_ATLAS', 			128, 		'JFD_Pouakai_MercenaryUnitAtlas_128.dds',			2, 				2),
		('JFD_POUAKAI_MERCENARY_UNIT_ATLAS', 			80, 		'JFD_Pouakai_MercenaryUnitAtlas_80.dds',			2, 				2),
		('JFD_POUAKAI_MERCENARY_UNIT_ATLAS', 			64, 		'JFD_Pouakai_MercenaryUnitAtlas_64.dds',			2, 				2),
		('JFD_POUAKAI_MERCENARY_UNIT_ATLAS', 			45, 		'JFD_Pouakai_MercenaryUnitAtlas_45.dds',			2, 				2),
		('JFD_POUAKAI_MERCENARY_WONDER_ATLAS', 			256, 		'JFD_Pouakai_MercenaryWonderAtlas_256.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_WONDER_ATLAS', 			128, 		'JFD_Pouakai_MercenaryWonderAtlas_128.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_WONDER_ATLAS', 			80, 		'JFD_Pouakai_MercenaryWonderAtlas_80.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_WONDER_ATLAS', 			64, 		'JFD_Pouakai_MercenaryWonderAtlas_64.dds',			1, 				1),
		('JFD_POUAKAI_MERCENARY_WONDER_ATLAS', 			45, 		'JFD_Pouakai_MercenaryWonderAtlas_45.dds',			1, 				1),
		('JFD_GAESATAE_FLAG_ART_ATLAS', 				32, 		'JFD_MercGaesataeUnitFlag_32.dds',					1, 				1),
		('JFD_HESSIAN_FLAG_ART_ATLAS', 					32, 		'JFD_MercHessianGrenUnitFlag_32.dds',				1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_MERCENARY', 		'JFD_MercenaryFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);			
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_MERCENARY',		'ICON_FONT_TEXTURE_JFD_MERCENARY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_SOUND_JFD_CONTRACT_DEFAULTED', 	'ContractDefaulted',	'DynamicResident'),
		('SND_SOUND_JFD_CONTRACT_STARTED', 		'ContractStarted',		'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_JIAYUGUAN', 	'Wonder_Jiayuguan',		'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_CONTRACT_DEFAULTED', 	'SND_SOUND_JFD_CONTRACT_DEFAULTED', 	'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_CONTRACT_STARTED', 	'SND_SOUND_JFD_CONTRACT_STARTED', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_JIAYUGUAN',	'SND_WONDER_SPEECH_JFD_JIAYUGUAN', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75,			0,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_GAESATAE', 			'Unit', 		'sv_MercGaesatae.dds'),
		('ART_DEF_UNIT_JFD_HESSIAN', 			'Unit', 		'sv_MercHessian.dds'),
		('ART_DEF_UNIT_JFD_POTSDAM_GIANT', 		'Unit', 		'sv_MercHessian.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GAESATAE', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_SPEARMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_HESSIAN', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_POTSDAM_GIANT',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GAESATAE', 			'ART_DEF_UNIT_MEMBER_JFD_GAESATAE', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_HESSIAN', 			'ART_DEF_UNIT_MEMBER_JFD_HESSIAN', 			NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_POTSDAM_GIANT', 		'ART_DEF_UNIT_MEMBER_JFD_POTSDAM_GIANT', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GAESATAE',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HESSIAN',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_POTSDAM_GIANT',EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GAESATAE',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HESSIAN',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_POTSDAM_GIANT',"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GAESATAE',		Scale,	ZOffset, Domain, 'JFD_CelticMerc.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HESSIAN',		Scale,	ZOffset, Domain, 'Hessian.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,		ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_POTSDAM_GIANT',Scale+0.03,	ZOffset, Domain, 'Hessian.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--==========================================================================================================================
--==========================================================================================================================