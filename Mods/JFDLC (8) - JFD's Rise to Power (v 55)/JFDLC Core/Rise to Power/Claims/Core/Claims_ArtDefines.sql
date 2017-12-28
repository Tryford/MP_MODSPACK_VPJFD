--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_JFD_ESTATE',	'Improvement',	'Estate'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,	 State,						Scale,	 ImprovementType,						LayoutHandler,	ResourceType,				Model,					TerrainContour,		Tech)
SELECT	'Any',  'Constructed',				1.2,	 'ART_DEF_IMPROVEMENT_JFD_ESTATE',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Estate_B.fxsxml',		1,					NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	 State,						Scale,	 ImprovementType,						LayoutHandler,	ResourceType,				Model,					TerrainContour,		Tech)
SELECT	'Any',  'Pillaged',					1.2,	 'ART_DEF_IMPROVEMENT_JFD_ESTATE',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Estate_PL.fxsxml',		1,					NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_ESTATE', 	'Improvement', 	'sv_Estate.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 									TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_GREAT_DIGNITARY', 					'Unit', 	'sv_GreatDignitary.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 									TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE', 					'Unit', 	'sv_GreatMagistrate.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 									TileType,	Asset)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE', 		'Unit', 	'sv_GreatMagistrate.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GREAT_DIGNITARY',						DamageStates, 	'EarlyGreatArtist'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE',					DamageStates, 	'EarlyGreatArtist'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfos 
		(Type, 													DamageStates,	Formation,				IconAtlas,					PortraitIndex)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE',		DamageStates, 	'EarlyGreatArtist',		'JFD_CLAIMS_UNIT_ATLAS',	5	
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 											UnitMemberInfoType,										NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GREAT_DIGNITARY',						'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY', 					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 											UnitMemberInfoType,										NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE',					'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 											UnitMemberInfoType,										NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GREAT_MAGISTRATE_RENAISSANCE',		'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_DIGNITARY',					Scale,	ZOffset, Domain, 'great_dignitary.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE',					Scale,	ZOffset, Domain, 'great_magistrate.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GREAT_MAGISTRATE_RENAISSANCE',		Scale,	ZOffset, Domain, 'great_magistrate_late.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================