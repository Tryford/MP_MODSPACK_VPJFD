--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_ALTAR', 					'BUILDING_JFD_ALTAR', 						'TXT_KEY_BUILDING_JFD_ALTAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

-- INSERT INTO BuildingClasses 
		-- (Type, 										DefaultBuilding, 							Description)
-- SELECT	'BUILDINGCLASS_JFD_BASILICA', 				'BUILDING_JFD_BASILICA', 					'TXT_KEY_BUILDING_JFD_BASILICA'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_CHURCH', 				'BUILDING_JFD_CHURCH', 						'TXT_KEY_BUILDING_JFD_CHURCH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_DAOGUAN', 				'BUILDING_JFD_DAOGUAN', 					'TXT_KEY_BUILDING_JFD_DAOGUAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO BuildingClasses 
		-- (Type, 										DefaultBuilding, 							Description)
-- SELECT	'BUILDINGCLASS_JFD_FIRE_TEMPLE', 			'BUILDING_JFD_FIRE_TEMPLE', 				'TXT_KEY_BUILDING_JFD_FIRE_TEMPLE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_GURDWARA', 				'BUILDING_JFD_GURDWARA', 					'TXT_KEY_BUILDING_JFD_GURDWARA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO BuildingClasses 
		-- (Type, 										DefaultBuilding, 							Description)
-- SELECT	'BUILDINGCLASS_JFD_HERMETIC_ORDER', 		'BUILDING_JFD_HERMETIC_ORDER', 				'TXT_KEY_BUILDING_JFD_HERMETIC_ORDER'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_MANDIR', 				'BUILDING_JFD_MANDIR', 						'TXT_KEY_BUILDING_JFD_MANDIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO BuildingClasses 
		-- (Type, 										DefaultBuilding, 							Description)
-- SELECT	'BUILDINGCLASS_JFD_OVOO', 					'BUILDING_JFD_OVOO', 						'TXT_KEY_BUILDING_JFD_OVOO'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_SYNAGOGUE', 				'BUILDING_JFD_SYNAGOGUE', 					'TXT_KEY_BUILDING_JFD_SYNAGOGUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

-- INSERT INTO BuildingClasses 
		-- (Type, 										DefaultBuilding, 							Description)
-- SELECT	'BUILDINGCLASS_JFD_TEMPLE_LITERATURE', 		'BUILDING_JFD_TEMPLE_LITERATURE', 			'TXT_KEY_BUILDING_JFD_TEMPLE_LITERATURE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_JFD_TORII', 					'BUILDING_JFD_TORII', 						'TXT_KEY_BUILDING_JFD_TORII'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_ABU_SIMBEL', 			'BUILDING_JFD_ABU_SIMBEL', 			'TXT_KEY_WONDER_JFD_ABU_SIMBEL', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 		'BUILDING_JFD_BUDDHAS_BAMIYAN', 	'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 		'BUILDING_JFD_COLOGNE_CATHEDRAL',	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_DOME_ROCK', 				'BUILDING_JFD_DOME_ROCK', 			'TXT_KEY_WONDER_JFD_DOME_ROCK', 			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_GRAND_INQUISITION', 		'BUILDING_JFD_GRAND_INQUISITION',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_PANTHEON', 				'BUILDING_JFD_PANTHEON', 			'TXT_KEY_WONDER_JFD_PANTHEON', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 		'BUILDING_JFD_SOLOMONS_TEMPLE', 	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TODAI', 					'BUILDING_JFD_TODAI', 				'TXT_KEY_WONDER_JFD_TODAI', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO BuildingClasses 
		(Type, 										DefaultBuilding, 					Description, 								MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_TEMPLE_HEAVEN', 			'BUILDING_JFD_TEMPLE_HEAVEN', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN', 		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_ABU_SIMBEL', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_DOME_ROCK', 				Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_PANTHEON', 				Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 		Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_TODAI', 					Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 						CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_TEMPLE_HEAVEN', 			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_ALTAR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_ALTAR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BASILICA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BASILICA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CHURCH'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_DAOGUAN'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_DAOGUAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_FIRE_TEMPLE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_FIRE_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GURDWARA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GURDWARA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HERMETIC_ORDER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_HERMETIC_ORDER', 'BUILDINGCLASS_ORDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MANDIR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_MANDIR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_OVOO'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_OVOO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_PAGODA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STUPA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SYNAGOGUE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_SYNAGOGUE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_TEMPLE_LITERATURE'
FROM BuildingClasses WHERE Type IN ('AS2D_BUILDING_JFD_TEMPLE_LITERATURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_TORII'
FROM BuildingClasses WHERE Type IN ('AS2D_BUILDING_JFD_TORII')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GRAND_INQUISITION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GRAND_INQUISITION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_ALTAR', 				'BUILDINGCLASS_JFD_ALTAR',					-1,		250,		1,					NULL,							1,				0,				  	'TXT_KEY_BUILDING_JFD_ALTAR',					'TXT_KEY_BUILDING_JFD_ALTAR_TEXT',					'TXT_KEY_BUILDING_JFD_ALTAR_STRATEGY',					'TXT_KEY_BUILDING_JFD_ALTAR_HELP',					'PROMOTION_JFD_ALTAR',				0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)																
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);															
																
-- INSERT INTO Buildings 																
		-- (Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
-- SELECT	'BUILDING_JFD_BASILICA',			'BUILDINGCLASS_JFD_BASILICA', 				-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_BASILICA',					'TXT_KEY_BUILDING_JFD_BASILICA_TEXT',			'TXT_KEY_BUILDING_JFD_BASILICA_STRATEGY',				'TXT_KEY_BUILDING_JFD_BASILICA_HELP',				NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		0
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);														
																
INSERT INTO Buildings 																
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_CHURCH',				'BUILDINGCLASS_JFD_CHURCH', 				-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_CHURCH',					'TXT_KEY_BUILDING_JFD_CHURCH_TEXT',					'TXT_KEY_BUILDING_JFD_CHURCH_STRATEGY',					'TXT_KEY_BUILDING_JFD_CHURCH_HELP',					NULL,								33,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		12
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);														
														
INSERT INTO Buildings 														
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,		Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_DAOGUAN', 			'BUILDINGCLASS_JFD_DAOGUAN', 				-1,		250,		1,					'GREAT_WORK_SLOT_LITERATURE',	0,				1,					'TXT_KEY_BUILDING_JFD_DAOGUAN',					'TXT_KEY_BUILDING_JFD_DAOGUAN_TEXT',				'TXT_KEY_BUILDING_JFD_DAOGUAN_STRATEGY',				NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
																
-- INSERT INTO Buildings 																
		-- (Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
-- SELECT	'BUILDING_JFD_FIRE_TEMPLE', 		'BUILDINGCLASS_JFD_FIRE_TEMPLE',			-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_FIRE_TEMPLE',				'TXT_KEY_BUILDING_JFD_FIRE_TEMPLE_TEXT',			'TXT_KEY_BUILDING_JFD_FIRE_TEMPLE_STRATEGY',			NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		0
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);	

INSERT INTO Buildings 																
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_GURDWARA', 			'BUILDINGCLASS_JFD_GURDWARA',				-1,		250,		1,					'SPECIALIST_SCIENTIST',			0,				1,				  	'TXT_KEY_BUILDING_JFD_GURDWARA',				'TXT_KEY_BUILDING_JFD_GURDWARA_TEXT',				'TXT_KEY_BUILDING_JFD_GURDWARA_STRATEGY',				NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);		

-- INSERT INTO Buildings 																
		-- (Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
-- SELECT	'BUILDING_JFD_HERMETIC_ORDER', 		'BUILDINGCLASS_JFD_HERMETIC_ORDER',			-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_HERMETIC_ORDER',			'TXT_KEY_BUILDING_JFD_HERMETIC_ORDER_TEXT',			'TXT_KEY_BUILDING_JFD_HERMETIC_ORDER_STRATEGY',			NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		11
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);															
																
INSERT INTO Buildings 																
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_MANDIR', 				'BUILDINGCLASS_JFD_MANDIR',					-1,		250,		1,					'SPECIALIST_ENGINEER',			1,				1,				 	'TXT_KEY_BUILDING_JFD_MANDIR',					'TXT_KEY_BUILDING_JFD_MANDIR_TEXT',					'TXT_KEY_BUILDING_JFD_MANDIR_STRATEGY',					NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		7
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);																
																
-- INSERT INTO Buildings 																
		-- (Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
-- SELECT	'BUILDING_JFD_OVOO', 				'BUILDINGCLASS_JFD_OVOO',					-1,		250,		1,					NULL,							0,				0,				 	'TXT_KEY_BUILDING_JFD_OVOO',					'TXT_KEY_BUILDING_JFD_OVOO_TEXT',					'TXT_KEY_BUILDING_JFD_OVOO_STRATEGY',					NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		0
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);															
															
INSERT INTO Buildings 															
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	SpecialistType,					Happiness,  	SpecialistCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_SYNAGOGUE',			'BUILDINGCLASS_JFD_SYNAGOGUE',				-1,		250,		1,					'SPECIALIST_MERCHANT',			0,				1,				  	'TXT_KEY_BUILDING_JFD_SYNAGOGUE',				'TXT_KEY_BUILDING_JFD_SYNAGOGUE_TEXT',				'TXT_KEY_BUILDING_JFD_SYNAGOGUE_STRATEGY',				NULL,												NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);														
														
INSERT INTO Buildings 														
		(Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_TORII', 				'BUILDINGCLASS_JFD_TORII', 					-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_TORII',					'TXT_KEY_BUILDING_JFD_TORII_TEXT',					'TXT_KEY_BUILDING_JFD_TORII_STRATEGY',					'TXT_KEY_BUILDING_JFD_TORII_HELP',					'PROMOTION_JFD_TORII',				0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);						
						
-- INSERT INTO Buildings 						
		-- (Type,								BuildingClass,								Cost,	FaithCost,	UnlockedByBelief,	GreatWorkSlotType,				Happiness,  	GreatWorkCount,  	Description,									Civilopedia,										Strategy,												Help,												TrainedFreePromotion,				ReligiousPressureModifier,	ConquestProb,	ArtDefineTag,	MinAreaSize,	IconAtlas,						PortraitIndex)
-- SELECT	'BUILDING_JFD_TEMPLE_LITERATURE', 	'BUILDINGCLASS_JFD_TEMPLE_LITERATURE', 		-1,		250,		1,					NULL,							0,				0,				  	'TXT_KEY_BUILDING_JFD_TEMPLE_LITERATURE',		'TXT_KEY_BUILDING_JFD_TEMPLE_LITERATURE_TEXT',		'TXT_KEY_BUILDING_JFD_TEMPLE_LITERATURE_STRATEGY',		'TXT_KEY_BUILDING_JFD_TEMPLE_LITERATURE_HELP',		NULL,								0,							100,			'TEMPLE',		-1,				'JFD_PIETY_BELIEF_ATLAS',		4
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

--Cathedral
UPDATE Buildings
SET FaithCost = 250, GreatWorkCount = 1, Help = NULL, Happiness = 0, Strategy = 'TXT_KEY_BUILDING_JFD_CATHEDRAL_STRATEGY'
WHERE Type = 'BUILDING_CATHEDRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Monastery
UPDATE Buildings
SET FaithCost = 0, UnlockedByBelief = 0, Cost = 200, GoldMaintenance = 1, PrereqTech = 'TECH_THEOLOGY', PolicyType = NULL
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_PIETY', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_PIETY'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', SpecialistCount = 2, GoldMaintenance = 1
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);

--Mosque
UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 1, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_MOSQUE_STRATEGY'
WHERE Type = 'BUILDING_MOSQUE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Shrine
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MYSTICISM'
WHERE BuildingClass = 'BUILDINGCLASS_SHRINE' AND PrereqTech = 'TECH_POTTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Temple
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
WHERE BuildingClass = 'BUILDINGCLASS_TEMPLE' AND PrereqTech = 'TECH_PHILOSOPHY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Pagoda
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', SpecialistCount = 1, Happiness = 0, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_PAGODA_STRATEGY'
WHERE Type = 'BUILDING_PAGODA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--JFDRTP_Piety_Buildings
CREATE TRIGGER JFDRTP_Piety_Buildings
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_GARDEN', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE')
BEGIN
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_MYSTICISM'
	WHERE BuildingClass = 'BUILDINGCLASS_SHRINE' AND PrereqTech = 'TECH_POTTERY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
	WHERE BuildingClass = 'BUILDINGCLASS_TEMPLE' AND PrereqTech = 'TECH_PHILOSOPHY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
--Grand Inquisition
INSERT INTO Buildings
		(Type,								BuildingClass,							PrereqTech,			HolyCity,	Cost,	Description,								Help, 											Strategy,											Civilopedia,									NumCityCostMod,	NukeImmune, HurryCostModifier,  MinAreaSize,	NeverCapture,	IconAtlas, 					PortraitIndex)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'BUILDINGCLASS_JFD_GRAND_INQUISITION',	'TECH_THEOLOGY',	1,			125,	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_HELP',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_STRATEGY',	'TXT_KEY_BUILDING_JFD_GRAND_INQUISITION_TEXT',	30,				1,			-1,					-1,				1,				'JFD_PIETY_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

--Grand Temple
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD' 
WHERE Type = 'BUILDING_GRAND_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_CHANGES_GRAND_TEMPLE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Grand Inquisition
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'BUILDING_JFD_GRAND_INQUISITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Wonders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_ABU_SIMBEL',			'BUILDINGCLASS_JFD_ABU_SIMBEL', 		130,	'TECH_MINING',			'ERA_CLASSICAL', 	4,						'TECH_ARCHAEOLOGY',			NULL,						'SPECIALIST_ENGINEER',			1,							NULL,								0,					0,					'TXT_KEY_WONDER_JFD_ABU_SIMBEL', 			'TXT_KEY_WONDER_JFD_ABU_SIMBEL_HELP',			'TXT_KEY_WONDER_JFD_ABU_SIMBEL_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_ABU_SIMBEL_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	3,				'AS2D_WONDER_SPEECH_JFD_ABU_SIMBEL',		'Wonder_AbuSimbel.dds',			'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);					
	
INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN',		'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 	265,	'TECH_CONSTRUCTION',	'ERA_MEDIEVAL', 	0,						NULL,						NULL,						'SPECIALIST_ENGINEER',			1,							NULL,								0,					0,					'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN', 		'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_HELP',		'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_PEDIA',		NULL,												'TXT_KEY_WONDER_JFD_BUDDHAS_BAMIYAN_QUOTE',		1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	7,				'AS2D_WONDER_SPEECH_JFD_BUDDHAS_BAMIYAN',	'Wonder_BuddhaBamiyan.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);	
				
INSERT INTO Buildings 					
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL', 	750,	'TECH_RIFLING',			'ERA_MODERN', 		0,						NULL,						'BUILDINGCLASS_CATHEDRAL',	'SPECIALIST_ENGINEER',			3,							'GREAT_WORK_SLOT_MUSIC',			1,					0,					'TXT_KEY_BUILDING_JFD_COLOGNE_CATHEDRAL', 	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_HELP',	'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_PEDIA',	NULL,												'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_QUOTE',	1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	2,				'AS2D_WONDER_SPEECH_JFD_COLOGNE',			'Wonder_Cologne.dds',			'L,T'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);							
							
INSERT INTO Buildings 							
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		IsNoPietyLossFromWar,	EnablePietyFromConquests,	FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_DOME_ROCK',			'BUILDINGCLASS_JFD_DOME_ROCK',			350,	'TECH_THEOLOGY',		'ERA_RENAISSANCE',	1,						1,							NULL,						NULL,							0,							NULL,								0,					0,					'TXT_KEY_WONDER_JFD_DOME_ROCK', 			'TXT_KEY_WONDER_JFD_DOME_ROCK_HELP',			'TXT_KEY_WONDER_JFD_DOME_ROCK_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_DOME_ROCK_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	4,				'AS2D_WONDER_SPEECH_JFD_DOME_ROCK',			'Wonder_DomeRock.dds',			'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);					
					
INSERT INTO Buildings 					
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_PANTHEON', 			'BUILDINGCLASS_JFD_PANTHEON', 			230,	'TECH_CONSTRUCTION',	'ERA_MEDIEVAL', 	0,						NULL,						NULL,						'SPECIALIST_ENGINEER',			2,							NULL,								0,					1,					'TXT_KEY_WONDER_JFD_PANTHEON', 				'TXT_KEY_WONDER_JFD_PANTHEON_HELP',				'TXT_KEY_WONDER_JFD_PANTHEON_PEDIA',			NULL,												'TXT_KEY_WONDER_JFD_PANTHEON_QUOTE',			1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	1,				'AS2D_WONDER_SPEECH_JFD_PANTHEON',			'Wonder_Pantheon.dds',			'R,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 	185,	'TECH_THE_WHEEL',		'ERA_CLASSICAL', 	0,						NULL,						NULL,						NULL,							0,							'GREAT_WORK_SLOT_ART_ARTIFACT',		2,					0,					'TXT_KEY_BUILDING_JFD_SOLOMONS_TEMPLE', 	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_HELP',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_PEDIA',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_THEMING_BONUS',	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_QUOTE',		1,			-1,					-1,				100,			200,					'JFD_PIETY_WONDER_ATLAS',	0,				'AS2D_WONDER_SPEECH_JFD_SOLOMON_TEMPLE',	'Wonder_TempleSolomon.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Buildings 
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		FaithToGoldenAgePoints,	EffectRequiresPietyLevel,	FreeBuildingThisCity,		SpecialistType, 				GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 									 		Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN',		'BUILDINGCLASS_JFD_TEMPLE_HEAVEN',		350,	'TECH_CIVIL_SERVICE',	'ERA_RENAISSANCE',	20,						'PIETY_LEVEL_JFD_DEVOUT',	NULL,						NULL,							0,							NULL,								0,					0,					'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_HELP', 		'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_PEDIA',		NULL,												'TXT_KEY_WONDER_JFD_TEMPLE_HEAVEN_QUOTE',		1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	5,				'AS2D_WONDER_SPEECH_JFD_TEMPLE_HEAVEN',		'Wonder_TempleHeaven.dds',		'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);			
			
INSERT INTO Buildings 			
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 			MaxStartEra, 		TechEnhancedTourism,	EnhancedYieldTech,			FreeBuildingThisCity,		FreePromotionOnFaithPurchase, 	GreatPeopleRateChange, 		GreatWorkSlotType,					GreatWorkCount,		SecondaryPantheon,	Description, 								Help, 											Civilopedia, 									ThemingBonusHelp, 									Quote, 											NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	CapturePlunderModifier, IconAtlas, 					PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 				WonderSplashAnchor)
SELECT	'BUILDING_JFD_TODAI', 				'BUILDINGCLASS_JFD_TODAI', 				450,	'TECH_ACOUSTICS',		'ERA_RENAISSANCE', 	0,						NULL,						'BUILDINGCLASS_PAGODA',		'PROMOTION_JFD_TODAI',			0,							NULL,								0,					0,					'TXT_KEY_BUILDING_JFD_TODAI', 				'TXT_KEY_WONDER_JFD_TODAI_HELP',				'TXT_KEY_WONDER_JFD_TODAI_PEDIA',				NULL,												'TXT_KEY_WONDER_JFD_TODAI_QUOTE',				1,			-1,					-1,				100,			0,						'JFD_PIETY_WONDER_ATLAS',	8,				'AS2D_WONDER_SPEECH_JFD_TODAI',				'Wonder_Todai.dds',				'L,B'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

--Borobudur
UPDATE Buildings
SET PortraitIndex = 6, IconAtlas = 'JFD_PIETY_WONDER_ATLAS'
WHERE BuildingClass = 'BUILDINGCLASS_BOROBUDUR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_BOROBUDUR' AND Value = 1);

--Hagia Sophia
UPDATE Buildings
SET PrereqTech = 'TECH_DRAMA', Cost = 280
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_HAGIA_SOPHIA_HELP', FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY', GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);

--Mosque of Djenne
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_MOSQUE_OF_DJENNE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_DJENNE' AND Value = 1);

--Pantheon
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
WHERE Type = 'BUILDING_JFD_PANTHEON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1);

--Stonehenge
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_STONEHENGE_HELP', FreeBuildingThisCity = 'BUILDINGCLASS_SHRINE'
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MONK', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MYSTICISM'
WHERE Type = 'BUILDING_STONEHENGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);

--Todai-Ji
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'BUILDING_JFD_TODAI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- GreatWorkFaith
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET GreatWorkYieldType = 'YIELD_FAITH'
WHERE Type IN ('BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_MANDIR', 'BUILDING_MOSQUE', 'BUILDING_JFD_SOLOMONS_TEMPLE', 'BUILDING_JFD_VANK', 'BUILDING_JFD_CHAPEL_ART', 'BUILDING_JFD_CHAPEL_MUSIC', 'BUILDING_JFD_CHAPEL_WRITING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_GREAT_WORK_FAITH_YIELDS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			'BUILDINGCLASS_PALACE',		Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE', 'YIELD_SCIENCE', 'YIELD_PRODUCTION', 'YIELD_GOLD', 'YIELD_GOLDEN_AGE_POINTS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	BuildingClass,				'YIELD_FAITH',		2
FROM Buildings WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_PAGODA', 'BUILDING_MOSQUE', 'BUILDING_JFD_CHAPTER_HOUSE', 'BUILDING_JFD_MANDIR', 'BUILDING_JFD_SYNAGOGUE', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_ALTAR', 'BUILDING_JFD_TORII', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_CHURCH', 'BUILDINGCLASS_JFD_HERMETIC_ORDER', 'BUILDINGCLASS_JFD_FIRE_TEMPLE', 'BUILDINGCLASS_JFD_BASILICA', 'BUILDINGCLASS_JFD_TEMPLE_LITERATURE', 'BUILDINGCLASS_JFD_OVOO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType, 						BuildingClassType,			YieldType, 			YieldChange)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	BuildingClass,				'YIELD_CULTURE', 	1
FROM Buildings WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_PAGODA', 'BUILDING_MOSQUE', 'BUILDING_JFD_CHAPTER_HOUSE', 'BUILDING_JFD_MANDIR', 'BUILDING_JFD_SYNAGOGUE', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_ALTAR', 'BUILDING_JFD_TORII', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_CHURCH', 'BUILDINGCLASS_JFD_HERMETIC_ORDER', 'BUILDINGCLASS_JFD_FIRE_TEMPLE', 'BUILDINGCLASS_JFD_BASILICA', 'BUILDINGCLASS_JFD_TEMPLE_LITERATURE', 'BUILDINGCLASS_JFD_OVOO')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_GoldenAgeYieldMod
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GoldenAgeYieldMod 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		Type, 				15
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_FOOD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_SpecialistYieldChangesLocal
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 						SpecialistType,				YieldType,			Yield)
SELECT	'BUILDING_HAGIA_SOPHIA', 			'SPECIALIST_JFD_MONK',		'YIELD_FAITH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits 
		(BuildingType, 						UnitType,			NumUnits)
SELECT	'BUILDING_JFD_GRAND_INQUISITION', 	'UNIT_INQUISITOR',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType,					ResourceType,					Quantity)
SELECT	Type,							'RESOURCE_JFD_CLERICS',			2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRAND_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONASTERY' AND YieldType != 'YIELD_JFD_CRIME' AND YieldType != 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

DELETE FROM Building_YieldChanges WHERE BuildingType IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA') AND YieldType != 'YIELD_JFD_CRIME' AND YieldType != 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES' AND Value = 1);

DELETE FROM Building_YieldChanges WHERE BuildingType IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA') AND YieldType != 'YIELD_JFD_CRIME' AND YieldType != 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_ALTAR', 				'YIELD_FOOD', 					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_CATHEDRAL', 				'YIELD_FAITH', 					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_CATHEDRAL', 				'YIELD_GOLD',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_CHURCH', 				'YIELD_FAITH', 					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_CHURCH', 				'YIELD_PRODUCTION',				 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_DAOGUAN', 			Type, 							2
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_GURDWARA', 			'YIELD_FAITH', 					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_GURDWARA', 			'YIELD_CULTURE', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_MANDIR', 				'YIELD_FAITH', 					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_MONASTERY', 				'YIELD_FAITH', 					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_MOSQUE', 					'YIELD_FAITH', 					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_PAGODA', 					'YIELD_GOLDEN_AGE_POINTS', 		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_SYNAGOGUE', 			'YIELD_FAITH', 					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_SYNAGOGUE', 			'YIELD_FOOD', 					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 						Yield)
SELECT	'BUILDING_JFD_TORII', 				Type, 							1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);
----------------
-- Wonders
----------------
UPDATE Building_YieldChanges
SET Yield = 5
WHERE BuildingType = 'BUILDING_GRAND_TEMPLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_CHANGES_GRAND_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 				2
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	Type, 				1
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	'YIELD_TOURISM', 	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_DOME_ROCK',			'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_DOME_ROCK', 			'YIELD_FAITH', 		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_PANTHEON', 			'YIELD_FAITH', 		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_PANTHEON', 			'YIELD_CULTURE', 	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN',		'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'YIELD_FOOD', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TODAI',				'YIELD_CULTURE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_TODAI', 				'YIELD_FAITH', 		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_FreeUnits WHERE BuildingType = 'BUILDING_HAGIA_SOPHIA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA' AND Value = 1);
INSERT INTO Building_FreeUnits 
		(BuildingType, 						UnitType,						NumUnits)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'UNIT_PROPHET',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_GRAND_INQUISITION', 	'BUILDINGCLASS_MONASTERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 						BuildingClassType,				NumBuildingNeeded)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'BUILDINGCLASS_MONASTERY',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ThemingBonuses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ThemingBonuses
		(BuildingType,						Description,									MustBeArtifact, Bonus,	AIPriority)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE',		'TXT_KEY_THEMING_BONUS_JFD_SOLOMONS_TEMPLE',	1,				3,		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_PietyMods
		(BuildingType,						PietyYieldMod)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN',		33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_JFD_PietyMods
		(BuildingType,						PietyYieldMod)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 				Flavor)
SELECT	Type, 						'FLAVOR_RELIGION', 			2
FROM Buildings WHERE Type IN ('BUILDING_JFD_ALTAR', 'BUILDING_JFD_CHURCH', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_TORII', 'BUILDING_JFD_TEMPLE_LITERATURE', 'BUILDING_JFD_BASILICA', 'BUILDING_JFD_OVOO', 'BUIILDING_JFD_FIRE_TEMPLE', 'BUILDING_JFD_HERMETIC_ORDER')
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
------------
-- Wonders
------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 							2
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GROWTH', 'FLAVOR_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_ABU_SIMBEL', 			Type, 							3
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 							2
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GREAT_PEOPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_BUDDHAS_BAMIYAN', 	Type, 							10
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL',	Type, 							15
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_DOME_ROCK',			Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION', 'FLAVOR_CULTURE', 'FLAVOR_MILITARY_TRAINING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_GRAND_INQUISITION', 	Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_PANTHEON', 			Type, 							20
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_WONDER', 				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_RELIGION', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TODAI', 				'FLAVOR_RELIGION', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TODAI', 				'FLAVOR_MILITARY_TRAINING', 	30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		'FLAVOR_WONDER', 				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType, 					Flavor)
SELECT	'BUILDING_JFD_TEMPLE_HEAVEN', 		Type, 							25
FROM Flavors WHERE Type IN ('FLAVOR_GROWTH', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================