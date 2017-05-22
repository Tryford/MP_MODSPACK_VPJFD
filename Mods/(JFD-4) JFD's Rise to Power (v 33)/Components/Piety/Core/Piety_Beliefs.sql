--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
-----------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				GreatGeneralModifier,	ExperiencePercent,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ALTAR',			'TXT_KEY_PROMOTION_JFD_ALTAR',			'TXT_KEY_PROMOTION_JFD_ALTAR_HELP',			'AS2D_IF_LEVELUP', 	0,						0,					0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				GreatGeneralModifier,	ExperiencePercent,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_PERSECUTION',	'TXT_KEY_PROMOTION_JFD_PERSECUTION',	'TXT_KEY_PROMOTION_JFD_PERSECUTION_HELP',	'AS2D_IF_LEVELUP', 	0,						0,					-5,						1,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PERSECUTION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_WAR_CLERICS' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				GreatGeneralModifier,	ExperiencePercent,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_TORII',			'TXT_KEY_PROMOTION_JFD_TORII',			'TXT_KEY_PROMOTION_JFD_TORII_HELP',			'AS2D_IF_LEVELUP', 	33,						0,					0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				GreatGeneralModifier,	ExperiencePercent,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_WAY_WARRIOR',	'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR',	'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR_HELP',	'AS2D_IF_LEVELUP', 	0,						20,					0,						0,						1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_WAY_WARRIOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_YieldFromKills
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_YieldFromKills
		(PromotionType,					YieldType,		Yield)
SELECT	'PROMOTION_JFD_ALTAR',			'YIELD_FAITH',	100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType)
SELECT	'PROMOTION_JFD_ALTAR',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType)
SELECT	'PROMOTION_JFD_TORII',			Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_GUN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_ALTAR', 		'BUILDING_JFD_ALTAR', 			'TXT_KEY_BUILDING_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_CHURCH', 	'BUILDING_JFD_CHURCH', 			'TXT_KEY_BUILDING_JFD_CHURCH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_DAOGUAN', 	'BUILDING_JFD_DAOGUAN', 		'TXT_KEY_BUILDING_JFD_DAOGUAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_GURDWARA', 	'BUILDING_JFD_GURDWARA', 		'TXT_KEY_BUILDING_JFD_GURDWARA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_MANDIR', 	'BUILDING_JFD_MANDIR', 			'TXT_KEY_BUILDING_JFD_MANDIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_TORII', 		'BUILDING_JFD_TORII', 			'TXT_KEY_BUILDING_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 							DefaultBuilding, 				Description)
SELECT	'BUILDINGCLASS_JFD_SYNAGOGUE', 	'BUILDING_JFD_SYNAGOGUE', 		'TXT_KEY_BUILDING_JFD_SYNAGOGUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
 --==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_ALTAR', 		'BUILDINGCLASS_JFD_ALTAR',		-1,		250,		1,					NULL,							1,				0,				  	'TXT_KEY_BUILDING_JFD_ALTAR',			'TXT_KEY_BUILDING_JFD_ALTAR_TEXT',		'TXT_KEY_BUILDING_JFD_ALTAR_STRATEGY',		'TXT_KEY_BUILDING_JFD_ALTAR_HELP',		'PROMOTION_JFD_ALTAR',	0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)		
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION' AND Value = 0);		
		
INSERT INTO Buildings 		
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_CHURCH',		'BUILDINGCLASS_JFD_CHURCH', 	-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_CHURCH',			'TXT_KEY_BUILDING_JFD_CHURCH_TEXT',		'TXT_KEY_BUILDING_JFD_CHURCH_STRATEGY',		'TXT_KEY_BUILDING_JFD_CHURCH_HELP',		NULL,					33,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Buildings 
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,		Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_DAOGUAN', 	'BUILDINGCLASS_JFD_DAOGUAN', 	-1,		250,		1,					'GREAT_WORK_SLOT_LITERATURE',	0,				1,					'TXT_KEY_BUILDING_JFD_DAOGUAN',			'TXT_KEY_BUILDING_JFD_DAOGUAN_TEXT',	'TXT_KEY_BUILDING_JFD_DAOGUAN_STRATEGY',	NULL,									NULL,					0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Buildings 		
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_GURDWARA', 	'BUILDINGCLASS_JFD_GURDWARA',	-1,		250,		1,					'SPECIALIST_SCIENTIST',			0,				1,				  	'TXT_KEY_BUILDING_JFD_GURDWARA',		'TXT_KEY_BUILDING_JFD_GURDWARA_TEXT',	'TXT_KEY_BUILDING_JFD_GURDWARA_STRATEGY',	NULL,									NULL,					0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Buildings 		
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_MANDIR', 		'BUILDINGCLASS_JFD_MANDIR',		-1,		250,		1,					'SPECIALIST_ENGINEER',			1,				1,				 	'TXT_KEY_BUILDING_JFD_MANDIR',			'TXT_KEY_BUILDING_JFD_MANDIR_TEXT',		'TXT_KEY_BUILDING_JFD_MANDIR_STRATEGY',		NULL,									NULL,					0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
	
INSERT INTO Buildings 	
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_SYNAGOGUE',	'BUILDINGCLASS_JFD_SYNAGOGUE',	-1,		250,		1,					'SPECIALIST_MERCHANT',			0,				1,				  	'TXT_KEY_BUILDING_JFD_SYNAGOGUE',		'TXT_KEY_BUILDING_JFD_SYNAGOGUE_TEXT',	'TXT_KEY_BUILDING_JFD_SYNAGOGUE_STRATEGY',	NULL,									NULL,					0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Buildings 
		(Type,						BuildingClass,					Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,							Civilopedia,							Strategy,									Help,									TrainedFreePromotion,	ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_TORII', 		'BUILDINGCLASS_JFD_TORII', 		-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_TORII',			'TXT_KEY_BUILDING_JFD_TORII_TEXT',		'TXT_KEY_BUILDING_JFD_TORII_STRATEGY',		'TXT_KEY_BUILDING_JFD_TORII_HELP',		'PROMOTION_JFD_TORII',	0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

--Cathedral
UPDATE Buildings
SET FaithCost = 250, GreatWorkCount = 1, Help = NULL, Happiness = 0, Strategy = 'TXT_KEY_BUILDING_JFD_CATHEDRAL_STRATEGY'
WHERE Type = 'BUILDING_CATHEDRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Mosque
UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 1, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_MOSQUE_STRATEGY'
WHERE Type = 'BUILDING_MOSQUE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Pagoda
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', SpecialistCount = 1, Happiness = 2, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_PAGODA_STRATEGY'
WHERE Type = 'BUILDING_PAGODA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA') AND NOT YieldType = 'YIELD_JFD_CRIME' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_CATHEDRAL', 				'YIELD_FAITH', 		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_CATHEDRAL', 				'YIELD_GOLD',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_CHURCH', 				'YIELD_FAITH', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_CHURCH', 				'YIELD_PRODUCTION', 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_DAOGUAN', 			Type, 				2
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_GURDWARA', 			'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_GURDWARA', 			'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_MANDIR', 				'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_MOSQUE', 					'YIELD_FAITH', 		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SYNAGOGUE', 			'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SYNAGOGUE', 			'YIELD_FOOD', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TORII', 				Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_ALTAR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_ALTAR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CHURCH'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_DAOGUAN'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_DAOGUAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GURDWARA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GURDWARA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BARRACKS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_ORDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MANDIR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_MANDIR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_PAGODA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STUPA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SYNAGOGUE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_SYNAGOGUE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_TORII'
FROM BuildingClasses WHERE Type IN ('AS2D_BUILDING_JFD_TORII')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	Type, 						'FLAVOR_RELIGION', 			2
FROM Buildings WHERE Type IN ('BUILDING_JFD_ALTAR', 'BUILDING_JFD_CHURCH', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_TORII')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION' AND Value = 0);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_ALTAR', 		'FLAVOR_MILITARY_TRAINING', 5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION' AND Value = 0);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_ALTAR', 		'FLAVOR_HAPPINESS',			 4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION' AND Value = 0);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_CATHEDRAL', 		'FLAVOR_GREAT_PEOPLE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_CATHEDRAL', 		'FLAVOR_GOLD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_CHURCH', 		'FLAVOR_CULTURE',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_DAOGUAN', 	'FLAVOR_SCIENCE',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_DAOGUAN', 	'FLAVOR_GREAT_PEOPLE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_DAOGUAN', 	'FLAVOR_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_GURDWARA', 	'FLAVOR_SCIENCE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_GURDWARA', 	'FLAVOR_GREAT_PEOPLE',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_MANDIR', 		'FLAVOR_RELIGION',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_MANDIR', 		'FLAVOR_PRODUCTION',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_MANDIR', 		'FLAVOR_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_MONASTERY', 		'FLAVOR_SCIENCE',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_MOSQUE', 			'FLAVOR_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_SYNAGOGUE', 	'FLAVOR_GOLD',				4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_SYNAGOGUE', 	'FLAVOR_GROWTH',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_TORII', 		'FLAVOR_HAPPINESS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_TORII', 		'FLAVOR_SCIENCE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	'BUILDING_JFD_TORII', 		'FLAVOR_MILITARY_TRAINING',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Pantheon
----------------------
UPDATE Beliefs
SET Pantheon = 0 
WHERE Type IN ('BELIEF_CHOSEN_PEOPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_RELIQUARIES_SHORT'
WHERE Type = 'BELIEF_ANCESTOR_WORSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
----------------------
-- Follower
----------------------
UPDATE Beliefs
SET Follower = 0 
WHERE Follower = 1 AND NOT Type = 'BELIEF_JFD_SHAMANISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ALMSGIVING', 			'TXT_KEY_BELIEF_JFD_ALMSGIVING', 			'TXT_KEY_BELIEF_JFD_ALMSGIVING_SHORT',			'TXT_KEY_BELIEF_JFD_ALMSGIVING_PIETY_DESC',			1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP',		'TXT_KEY_BELIEF_JFD_ANCESTOR_WORSHIP', 		'TXT_KEY_BELIEF_JFD_ANCESTOR_WORSHIP_SHORT',	'TXT_KEY_BELIEF_JFD_ANCESTOR_WORSHIP_PIETY_DESC',	 1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_CHARITY',				'TXT_KEY_BELIEF_JFD_CHARITY', 				'TXT_KEY_BELIEF_JFD_CHARITY_SHORT',				'TXT_KEY_BELIEF_JFD_CHARITY_PIETY_DESC',	 		1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower,	PlotCultureCostModifier)
SELECT	'BELIEF_JFD_CHOSEN_PEOPLE',			'TXT_KEY_BELIEF_JFD_CHOSEN_PEOPLE', 		'TXT_KEY_BELIEF_JFD_CHOSEN_PEOPLE_SHORT',		'TXT_KEY_BELIEF_JFD_CHOSEN_PEOPLE_PIETY_DESC',		1,				1,						1,			-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	'TXT_KEY_BELIEF_JFD_DIVINE_INSPIRATION', 	'TXT_KEY_BELIEF_JFD_DIVINE_INSPIRATION_SHORT',	'TXT_KEY_BELIEF_JFD_DIVINE_INSPIRATION_PIETY_DESC',	1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	 JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_FILIAL_PIETY',			'TXT_KEY_BELIEF_JFD_FILIAL_PIETY', 			'TXT_KEY_BELIEF_JFD_FILIAL_PIETY_SHORT',		'TXT_KEY_BELIEF_JFD_FILIAL_PIETY_PIETY_DESC',		1,				 1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_GURUSHIP',				'TXT_KEY_BELIEF_JFD_GURUSHIP', 				'TXT_KEY_BELIEF_JFD_GURUSHIP_SHORT',			'TXT_KEY_BELIEF_JFD_GURUSHIP_PIETY_DESC',			1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 			'TXT_KEY_BELIEF_JFD_ICONOGRAPHY', 			'TXT_KEY_BELIEF_JFD_ICONOGRAPHY_SHORT',			'TXT_KEY_BELIEF_JFD_ICONOGRAPHY_PIETY_DESC',		1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower,	JFD_XPOnFaithPurchase)
SELECT	'BELIEF_JFD_MARTIAL_ARTS',			'TXT_KEY_BELIEF_JFD_MARTIAL_ARTS', 			'TXT_KEY_BELIEF_JFD_MARTIAL_ARTS_SHORT',		'TXT_KEY_BELIEF_JFD_MARTIAL_ARTS_PIETY_DESC',		1,				1,						1,			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_NOBLE_PATH',			'TXT_KEY_BELIEF_JFD_NOBLE_PATH', 			'TXT_KEY_BELIEF_JFD_NOBLE_PATH_SHORT',			'TXT_KEY_BELIEF_JFD_NOBLE_PATH_PIETY_DESC',			1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 								Description, 								ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	Follower)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW',			'TXT_KEY_BELIEF_JFD_RELIGIOUS_LAW', 		'TXT_KEY_BELIEF_JFD_RELIGIOUS_LAW_SHORT',		'TXT_KEY_BELIEF_JFD_RELIGIOUS_LAW_PIETY_DESC',		1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)		
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);		

INSERT INTO Beliefs 		
		(Type, 							Description, 									ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding, 	Follower)
SELECT	'BELIEF_JFD_THEURGY',			'TXT_KEY_BELIEF_JFD_THEURGY', 					'TXT_KEY_BELIEF_JFD_THEURGY_SHORT',				'TXT_KEY_BELIEF_JFD_THEURGY_PIETY_DESC',			1,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		
		
INSERT INTO Beliefs 		
		(Type, 							Description, 									ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding, 	Follower,	TrainedFreePromotion)
SELECT	'BELIEF_JFD_WAY_WARRIOR',		'TXT_KEY_BELIEF_JFD_WAY_WARRIOR', 				'TXT_KEY_BELIEF_JFD_WAY_WARRIOR_SHORT',			'TXT_KEY_BELIEF_JFD_WAY_WARRIOR_PIETY_DESC',		1,				1,						1,			'PROMOTION_JFD_WAY_WARRIOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);			
			
INSERT INTO Beliefs 			
		(Type, 							Description, 									ShortDescription, 								JFD_PietyDescription, 								JFD_IsPiety,	JFD_RequiresFounding,	 Follower)
SELECT	'BELIEF_JFD_WORK_ETHIC', 		'TXT_KEY_BELIEF_JFD_WORK_ETHIC', 				'TXT_KEY_BELIEF_JFD_WORK_ETHIC_SHORT',			'TXT_KEY_BELIEF_JFD_WORK_ETHIC_PIETY_DESC',			1,				1,						 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
----------------------
-- Enhancer
----------------------
UPDATE Beliefs
SET CombatModifierEnemyCities = 0, CombatVersusOtherReligionTheirLands = 15, Description = 'TXT_KEY_BELIEF_JFD_JUST_WAR'
WHERE Type = 'BELIEF_JUST_WAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_JUST_WAR' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RemovesMissionaryPenalties,	 Enhancer)
SELECT	'BELIEF_JFD_EVANGELISM', 		'TXT_KEY_BELIEF_JFD_EVANGELISM', 		'TXT_KEY_BELIEF_JFD_EVANGELISM_SHORT',		1,								 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM' AND Value = 1);

UPDATE Beliefs
SET CombatModifierFriendlyCities = 0, CombatVersusOtherReligionOwnLands = 15, Description = 'TXT_KEY_BELIEF_JFD_DEFENDER_FAITH'
WHERE Type = 'BELIEF_DEFENDER_FAITH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_DEFENDER_FAITH' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_REVIVALISM_SHORT'
WHERE Type = 'BELIEF_EVANGELISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM' AND Value = 1);
----------------------
-- Reformation
----------------------
UPDATE Beliefs
SET Reformation = 0 
WHERE Type IN ('BELIEF_CHARITABLE_MISSIONS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_InquisitorPromotion,	 JFD_MissionaryPromotion,	Reformation)
SELECT	'BELIEF_JFD_WAR_CLERICS', 		'TXT_KEY_BELIEF_JFD_WAR_CLERICS', 		'TXT_KEY_BELIEF_JFD_WAR_CLERICS_SHORT',		'PROMOTION_JFD_PERSECUTION', 'PROMOTION_MEDIC',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_ADDITIONS_WAR_CLERICS' AND Value = 1);

UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_RELIGIOUS_FERVOUR'
WHERE Type = 'BELIEF_RELIGIOUS_FERVOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_JFD_PietyYieldChanges 
		(BeliefType, 						OnWLTKD, 						Yield)
SELECT	'BELIEF_JFD_ALMSGIVING', 			1,								15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnMilitaryUnitFaithPurchased, 	Yield)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP', 		1,								3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnBuildingPurchased,			Yield)
SELECT	'BELIEF_JFD_CHARITY',				1,								10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnTileAcquired,					Yield)
SELECT	'BELIEF_JFD_CHOSEN_PEOPLE', 		1,								2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnWonderConstructed, 			Yield)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION',	1,								15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnPolicyAdopted, 				Yield)
SELECT	'BELIEF_JFD_FILIAL_PIETY', 			1,								15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitClassExpended,			Yield)
SELECT	'BELIEF_JFD_GURUSHIP', 				Type,							15
FROM UnitClasses WHERE Type IN ('UNITCLASS_ENGINEER', 'UNITCLASS_MERCHANT', 'UNITCLASS_SCIENTIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitClassExpended, 			Yield)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 			Type,							15
FROM UnitClasses WHERE Type IN ('UNITCLASS_ARTIST', 'UNITCLASS_MUSICIAN', 'UNITCLASS_WRITER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitPromoted, 				Yield)
SELECT	'BELIEF_JFD_MARTIAL_ARTS', 			1,								2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnGoldenAgeBegins,				Yield)
SELECT	'BELIEF_JFD_NOBLE_PATH', 			1,								25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitClassExpended,					Yield)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW', 		'UNITCLASS_JFD_GREAT_DIGNITARY',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitClassExpended,					Yield)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW', 		'UNITCLASS_JFD_GREAT_MAGISTRATE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnTechDiscovered, 				Yield)
SELECT	'BELIEF_JFD_THEURGY', 				1,								10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitKilled, 					Yield)
SELECT	'BELIEF_JFD_WAY_WARRIOR', 			1,								1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnBuildingConstructed, 			Yield)
SELECT	'BELIEF_JFD_WORK_ETHIC', 			1,								10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
-----------------------------------------
-- Enhanced Follower
-----------------------------------------
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_ALMSGIVING',		'YIELD_FOOD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP',	'YIELD_FAITH',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_CHARITY',			'YIELD_GOLD',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_FILIAL_PIETY',		'YIELD_CULTURE',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_NOBLE_PATH',		'YIELD_GOLDEN_AGE_POINTS',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_THEURGY',			'YIELD_SCIENCE',			8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
		
INSERT INTO Belief_MaxYieldPerFollowerHalved
		(BeliefType,					YieldType,					Max)
SELECT	'BELIEF_JFD_WORK_ETHIC',		'YIELD_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	
-----------------------------------------
-- Enhanced Follower
-----------------------------------------
INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_ALTARS', 			'TXT_KEY_BELIEF_JFD_ALTARS', 			'TXT_KEY_BELIEF_JFD_ALTARS_SHORT', 			1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement,	Follower)
SELECT	'BELIEF_JFD_CATHEDRALS', 		'TXT_KEY_BELIEF_JFD_CATHEDRALS', 		'TXT_KEY_BELIEF_JFD_CATHEDRALS_SHORT',		1,							1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_CHURCHES', 			'TXT_KEY_BELIEF_JFD_CHURCHES', 			'TXT_KEY_BELIEF_JFD_CHURCHES_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_DAOGUANS', 			'TXT_KEY_BELIEF_JFD_DAOGUANS', 			'TXT_KEY_BELIEF_JFD_DAOGUANS_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_GURDWARAS', 		'TXT_KEY_BELIEF_JFD_GURDWARAS', 		'TXT_KEY_BELIEF_JFD_GURDWARAS_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_MANDIRS', 			'TXT_KEY_BELIEF_JFD_MANDIRS', 			'TXT_KEY_BELIEF_JFD_MANDIRS_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_MOSQUES', 			'TXT_KEY_BELIEF_JFD_MOSQUES', 			'TXT_KEY_BELIEF_JFD_MOSQUES_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_PAGODAS', 			'TXT_KEY_BELIEF_JFD_PAGODAS', 			'TXT_KEY_BELIEF_JFD_PAGODAS_SHORT', 		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_SYNAGOGUES', 		'TXT_KEY_BELIEF_JFD_SYNAGOGUES', 		'TXT_KEY_BELIEF_JFD_SYNAGOGUES_SHORT',		1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Beliefs 
		(Type, 							Description, 							ShortDescription, 							JFD_RequiresEnhancement, 	Follower)
SELECT	'BELIEF_JFD_TORIIS', 			'TXT_KEY_BELIEF_JFD_TORIIS', 			'TXT_KEY_BELIEF_JFD_TORIIS_SHORT', 			1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassFaithPurchase
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_ALTARS', 		'BUILDINGCLASS_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_CATHEDRALS', 	'BUILDINGCLASS_CATHEDRAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_CHURCHES',		'BUILDINGCLASS_JFD_CHURCH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_DAOGUANS',		'BUILDINGCLASS_JFD_DAOGUAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_GURDWARAS', 	'BUILDINGCLASS_JFD_GURDWARA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_MANDIRS', 		'BUILDINGCLASS_JFD_MANDIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_MOSQUES', 		'BUILDINGCLASS_MOSQUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_PAGODAS', 		'BUILDINGCLASS_PAGODA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_SYNAGOGUES', 	'BUILDINGCLASS_JFD_SYNAGOGUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_BuildingClassFaithPurchase 
		(BeliefType, 				BuildingClassType)
SELECT	'BELIEF_JFD_TORIIS', 		'BUILDINGCLASS_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_EraFaithUnitPurchase
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_ANCIENT'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_CLASSICAL'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 	EraType)
SELECT	Type, 			'ERA_MEDIEVAL'
FROM Beliefs WHERE Follower = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);

INSERT INTO Belief_EraFaithUnitPurchase 
		(BeliefType, 					EraType)
SELECT	'BELIEF_RELIGIOUS_FERVOR',		Type
FROM Eras WHERE Type IN ('ERA_RENAISSANCE', 'ERA_ENLIGHTENMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_MaxYieldPerFollower
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_ALMSGIVING', 		'YIELD_FOOD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_ANCESTOR_WORSHIP', 	'YIELD_FAITH',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_CHARITY', 			'YIELD_GOLD',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_FILIAL_PIETY', 		'YIELD_CULTURE',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_NOBLE_PATH', 		'YIELD_GOLDEN_AGE_POINTS',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_THEURGY', 			'YIELD_SCIENCE',			8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_MaxYieldPerFollower 
		(BeliefType, 					YieldType, 					Max)
SELECT	'BELIEF_JFD_WORK_ETHIC', 		'YIELD_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 	YieldType, 			Yield)
SELECT	'BELIEF_JFD_GURUSHIP', 			Type, 				'YIELD_FAITH',		2
FROM Specialists WHERE Type IN ('SPECIALIST_ENGINEER', 'SPECIALIST_MERCHANT', 'SPECIALIST_SCIENTIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 	YieldType, 			Yield)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 		Type, 				'YIELD_FAITH',		2
FROM Specialists WHERE Type IN ('SPECIALIST_ARTIST', 'SPECIALIST_MUSICIAN', 'SPECIALIST_WRITER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges 
		(BeliefType, 					SpecialistType, 	YieldType, 			Yield)
SELECT	'BELIEF_JFD_RELIGIOUS_LAW', 	Type, 				'YIELD_FAITH',		2
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_DIGNITARY', 'SPECIALIST_JFD_MAGISTRATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_BuildingClassYieldChanges 
		(BeliefType, 						BuildingClassType,	YieldType, 		YieldChange)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	Type,				'YIELD_FAITH',	2
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldChangeWorldWonder
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldChangeWorldWonder 
		(BeliefType, 						YieldType, 		Yield)
SELECT	'BELIEF_JFD_DIVINE_INSPIRATION', 	'YIELD_FAITH',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================