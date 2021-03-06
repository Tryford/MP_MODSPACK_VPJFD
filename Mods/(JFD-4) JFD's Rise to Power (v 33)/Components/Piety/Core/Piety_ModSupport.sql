--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs
SET Follower = 1, JFD_RequiresEnhancement = 1
WHERE Type IN ('BELIEF_GURUSHIP', 'BELIEF_MONASTERIES', 'BELIEF_MOSQUES', 'BELIEF_CATHEDRALS', 'BELIEF_PAGODAS', 'BELIEF_RELIGIOUS_CENTER', 'BELIEF_SWORD_PLOWSHARES', 'BELIEF_HOLY_WARRIORS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 0);

UPDATE Beliefs
SET Follower = 0
WHERE Type IN ('BELIEF_JFD_ALMSGIVING', 'BELIEF_JFD_MOSQUES', 'BELIEF_JFD_CATHEDRALS', 'BELIEF_JFD_PAGODAS', 'BELIEF_JFD_CHURCHES', 'BELIEF_JFD_MANDIRS', 'BELIEF_JFD_SYNAGOGUES', 'BELIEF_JFD_ALTARS', 'BELIEF_JFD_TORIIS', 'BELIEF_JFD_GURDWARAS', 'BELIEF_JFD_DAOGUANS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 0);

UPDATE Beliefs
SET Follower = 0
WHERE Type IN ('BELIEF_GURUSHIP', 'BELIEF_MONASTERIES', 'BELIEF_MOSQUES', 'BELIEF_CATHEDRALS', 'BELIEF_PAGODAS', 'BELIEF_RELIGIOUS_CENTER', 'BELIEF_SWORD_PLOWSHARES', 'BELIEF_HOLY_WARRIORS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,				SpecialistType,				 YieldType,					 Yield)
SELECT	 'BELIEF_RELIGIOUS_ART', 	'SPECIALIST_JFD_MONK',		 'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET FaithCost = -1
WHERE Type IN ('BUILDING_JFD_CHURCH', 'BUILDING_JFD_MANDIR', 'BUILDING_JFD_SYNAGOGUE', 'BUILDING_JFD_ALTAR', 'BUILDING_JFD_GURDWARA', 'BUILDING_JFD_DAOGUAN', 'BUILDING_JFD_TORII')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 0);

UPDATE Buildings
SET Happiness = 0
WHERE Type IN ('BUILDING_PAGODA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET FaithCost = -1
WHERE Type IN ('BUILDING_CHURCH', 'BUILDING_MANDIR', 'BUILDING_SYNAGOGUE', 'BUILDING_STUPA', 'BUILDING_ORDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 1);

--Monastery
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_CBP', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_CBP'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_CBP_HEALTH', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_CBP_HEALTH'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_CBP_EXCE', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_CBP_EXCE'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_CBP_HEALTH_EXCE', Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_CBP_HEALTH_EXCE'
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1);

--Cathedral
UPDATE Buildings
SET ConversionModifier = 0, ReligiousPressureModifier = 0, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, FaithCost = 250, GreatWorkCount = 0, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_CATHEDRAL_STRATEGY'
WHERE Type = 'BUILDING_CATHEDRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 1);

--Mosque
UPDATE Buildings
SET ConversionModifier = 0, ReligiousPressureModifier = 0, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 1, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_MOSQUE_STRATEGY'
WHERE Type = 'BUILDING_MOSQUE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 1);

--Pagoda
UPDATE Buildings
SET GreatWorkCount = 0, ReligiousPressureModifier = 0, ConversionModifier = 0, SpecialistType = 'SPECIALIST_JFD_MONK', SpecialistCount = 1, Happiness = 2, FaithCost = 250, Help = NULL, Strategy = 'TXT_KEY_BUILDING_JFD_PAGODA_STRATEGY'
WHERE Type = 'BUILDING_PAGODA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
--Infallability
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_INFALLIBILITY', Help = 'TXT_KEY_POLICY_JFD_INFALLIBILITY_HELP_CBP', Civilopedia = 'TXT_KEY_POLICY_JFD_INFALLIBILITY_TEXT', JFD_ConvertAllReligions = 1
WHERE Type = 'POLICY_REFORMATION' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_PietyYieldChanges	
		(PolicyType, 				OnReligiousUnitFaithPurchased, 	Yield)
SELECT	'POLICY_REFORMATION', 		1,								5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET GridX = 4, GridY = 2, Cost = 250
WHERE Type = 'TECH_JFD_PRIESTHOOD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technologies
SET GridX = 6, GridY = 3, Cost = 675
WHERE Type = 'TECH_JFD_RELIGIOUS_ORDERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
-----------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_PRIESTHOOD' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_PRIESTHOOD', 			'TECH_WRITING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_PRINTING_PRESS',			'TECH_JFD_RELIGIOUS_ORDERS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_RELIGIOUS_ORDERS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_RELIGIOUS_ORDERS', 	'TECH_THEOLOGY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_THEOLOGY',				'TECH_JFD_PRIESTHOOD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CLAIMS
--==========================================================================================================================
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET]Same [ICON_RELIGION] State Religion'
WHERE Tag = 'TXT_KEY_CLAIM_JFD_CAUSE_SAME_RELIGION';
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Buildings
------------------------------
UPDATE Buildings
SET TechEnhancedTourism = 0, EnhancedYieldTech = NULL, Help = 'TXT_KEY_WONDER_JFD_COLOGNE_CATHEDRAL_HELP_CID'
WHERE Type = 'BUILDING_JFD_COLOGNE_CATHEDRAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM', Cost = 800
WHERE Type = 'BUILDING_JFD_COLOGNE_CATHEDRAL'
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_NATIONALISM');

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType, 			Yield)
SELECT	'BUILDING_JFD_COLOGNE_CATHEDRAL', 	'YIELD_TOURISM', 	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_District
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_RELIGIOUS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_ABU_SIMBEL', 'BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN', 'BUILDINGCLASS_JFD_COLOGNE_CATHEDRAL' ,'BUILDINGCLASS_JFD_GRAND_INQUISITION', 'BUILDINGCLASS_JFD_PANTHEON', 'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE', 'BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_GRAND_INQUISITION', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_JFD_TEMPLE_HEAVEN', 'BUILDINGCLASS_JFD_TODAI', 'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);
--==========================================================================================================================
-- JFD CRIMES
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PietyLevels
--------------------------------------------------------------------------------------------------------------------------	
UPDATE JFD_PietyLevels
SET Help = 'TXT_KEY_PIETY_LEVEL_JFD_HERETICAL_HELP_CRIMES'
WHERE Type = 'PIETY_LEVEL_JFD_HERETICAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

UPDATE JFD_PietyLevels
SET Help = 'TXT_KEY_PIETY_LEVEL_JFD_POOR_HELP_CRIMES'
WHERE Type = 'PIETY_LEVEL_JFD_POOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,						CrimeType,				GlobalCrimeMod,	CrimeMod)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'CRIME_JFD_FAITH',		-5,				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,						HelpText,											IsWrittenFirst)
SELECT	'BUILDING_JFD_GRAND_INQUISITION',	'TXT_KEY_WONDER_JFD_GRAND_INQUISITION_HELP_CRIME',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--==========================================================================================================================
-- JFD HEALTH
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_MANDIRS_HEALTH'
WHERE Type = 'BELIEF_JFD_MANDIRS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Beliefs
SET ShortDescription = 'TXT_KEY_BELIEF_JFD_SHAMANISM_SHORT_DESC_PIETY', Description = 'TXT_KEY_BELIEF_JFD_SHAMANISM_DESC_PIETY', JFD_PietyDescription = 'TXT_KEY_BELIEF_JFD_SHAMANISM_DESC_PIETY_PIETY_DESC', Follower = 1, JFD_RequiresFounding = 1, JFD_IsPiety = 1
WHERE Type = 'BELIEF_JFD_SHAMANISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Belief_SpecialistYieldChanges
SET Yield = 2
WHERE BeliefType = 'BELIEF_JFD_SHAMANISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges	
		(BeliefType, 						SpecialistType,			YieldType,			Yield)
SELECT	'BELIEF_JFD_SHAMANISM', 			'SPECIALIST_JFD_MONK',	'YIELD_JFD_HEALTH',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges	
		(BeliefType, 						SpecialistType,			YieldType,			Yield)
SELECT	'BELIEF_JFD_SHAMANISM', 			'SPECIALIST_JFD_MONK',	'YIELD_FAITH',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_JFD_PietyYieldChanges	
		(BeliefType, 						OnUnitClassExpended,	Yield)
SELECT	'BELIEF_JFD_SHAMANISM', 			Type,					25
FROM UnitClasses WHERE Type IN ('UNITCLASS_JFD_GREAT_DOCTOR', 'UNITCLASS_PROPHET')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET Happiness = 0
WHERE Type = 'BUILDING_JFD_MANDIR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_POTTERY'
WHERE Type = 'BUILDING_JFD_HERBALIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 
		(BuildingType, 		YieldType,				Yield)
SELECT	Type,				'YIELD_JFD_HEALTH',		2
FROM Buildings WHERE Type = 'BUILDING_JFD_MANDIR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- JFD INVESTMENTS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Beliefs
SET Description = 'TXT_KEY_BELIEF_JFD_CHARITY_INVESTMENTS', JFD_PietyDescription = 'TXT_KEY_BELIEF_JFD_CHARITY_INVESTMENTS_DESC_PIETY', JFD_IsPiety = 1
WHERE Type = 'BELIEF_JFD_CHARITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--==========================================================================================================================
-- MC INDIA
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR', Strategy = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR_STRATEGY', Civilopedia = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR_PEDIA'
WHERE Type = 'BUILDING_MC_MANDIR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1);

CREATE TRIGGER JFDRTP_Piety_Buildings_ModSupport
AFTER INSERT ON Buildings
WHEN NEW.Type IN ('BUILDING_MC_MANDIR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET Description = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR', Strategy = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR_STRATEGY', Civilopedia = 'TXT_KEY_BUILDING_JFD_INDIAN_MANDIR_PEDIA'
	WHERE Type = 'BUILDING_MC_MANDIR';
END;
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies_JFD_MiscEffects 
SET TechType = 'TECH_EE_HUMANISM'
WHERE TechType = 'TECH_SCIENTIFIC_THEORY' AND AllowSecularization
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT_EE'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = 'You must have researched Priesthood to adopt a State Religion. There must be a valid Religion and you must have met the founder.[NEWLINE][NEWLINE]You may secularize your State Religion once you have researched Liberalism.[NEWLINE][NEWLINE]It will cost you {1_Num} Turn(s) of [ICON_RESISTANCE] Anarchy to change your State Religion or to Secularize.'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) SELECT ('JFD_RTP_Piety_Decisions.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_RTP_Piety_Events.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description)
SELECT	'BUILDINGCLASS_JFD_CHAPTER_HOUSE', 		'BUILDING_JFD_CHAPTER_HOUSE', 		'TXT_KEY_BUILDING_JFD_CHAPTER_HOUSE'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings		
		(Type, 									BuildingClass, 						Cost, 	FaithCost,	UnlockedByBelief, 	Description, 							Help, 										Strategy, 										Civilopedia, 									ArtDefineTag,	MinAreaSize,	ConquestProb, 	IconAtlas, 					PortraitIndex)
SELECT	'BUILDING_JFD_CHAPTER_HOUSE', 			'BUILDINGCLASS_JFD_CHAPTER_HOUSE', 	-1, 	1,			1, 					'TXT_KEY_BUILDING_JFD_CHAPTER_HOUSE', 	'TXT_KEY_BUILDING_JFD_CHAPTER_HOUSE_HELP', 	'TXT_KEY_BUILDING_JFD_CHAPTER_HOUSE_STRATEGY',	'TXT_KEY_BUILDING_JFD_CHAPTER_HOUSE_PEDIA', 	'TEMPLE',		-1, 			100, 			'JFD_PIETY_BELIEF_ATLAS', 	7
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Building_DomainFreeExperiences
--------------------------------------------------------------------------------------------------------------------------
 INSERT INTO Building_DomainFreeExperiences
		(BuildingType,							DomainType,			Experience)
SELECT	'BUILDING_JFD_CHAPTER_HOUSE',			'DOMAIN_LAND',		15
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,							YieldType,			Yield)
SELECT	'BUILDING_JFD_CHAPTER_HOUSE',			'YIELD_FAITH',		1
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--==========================================================================================================================
-- SUZERAINITY UI ADDINS
--==========================================================================================================================
-- SuzerainUI_AddinSupport
--------------------------------
CREATE TABLE IF NOT EXISTS SuzerainUI_AddinSupport(FileName);
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Piety.lua');
--------------------------------
-- Suk_MinorDialogue
--------------------------------	
CREATE TABLE IF NOT EXISTS 
	Suk_MinorDialogue (
	MessageType  												text														default NULL,
	Message  													text 														default NULL,	
	MinorCivType  												text 		REFERENCES MinorCivilizations(Type) 			default NULL,
	MinorCivTrait												text		REFERENCES MinorCivTraits(Type)					default NULL,
	MinorCivPersonality											text 		 												default NULL,
	IsFriends													boolean 		 											default NULL,
	IsAllied													boolean 		 											default NULL,
	IsProtected													boolean 		 											default NULL,
	IsFirstToMeet												boolean 		 											default NULL,
	Bias														integer														default 1);

INSERT INTO Suk_MinorDialogue 	
		(MessageType, 					Message,													MinorCivType,		MinorCivTrait,		MinorCivPersonality)
VALUES	('MESSAGE_JFD_PIETY_GIFT',		'TXT_KEY_MINOR_CIV_JFD_PIETY_GIFT_DIALOGUE_RESPONSE_1',		NULL,				NULL,				NULL),
		('MESSAGE_JFD_PIETY_GIFT',		'TXT_KEY_MINOR_CIV_JFD_PIETY_GIFT_DIALOGUE_RESPONSE_2',		NULL,				NULL,				NULL),
		('MESSAGE_JFD_PIETY_GIFT',		'TXT_KEY_MINOR_CIV_JFD_PIETY_GIFT_DIALOGUE_RESPONSE_3',		NULL,				NULL,				NULL),
		('MESSAGE_JFD_PIETY_GIFT',		'TXT_KEY_MINOR_CIV_JFD_PIETY_GIFT_DIALOGUE_RESPONSE_4',		NULL,				NULL,				NULL),	
		('MESSAGE_JFD_PIETY_GIFT',		'TXT_KEY_MINOR_CIV_JFD_PIETY_GIFT_DIALOGUE_RESPONSE_5',		NULL,				NULL,				NULL);	
--==========================================================================================================================
-- VICEVIRTUOSO's NEPTUNIA
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Beliefs
SET Follower = 1 
WHERE Type = 'BELIEF_VV_BASILICOM';

CREATE TRIGGER JFDRTP_Piety_Beliefs
AFTER INSERT ON Beliefs 
WHEN NEW.Type = 'BELIEF_VV_BASILICOM'
BEGIN
	UPDATE Beliefs
	SET Follower = 1 
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================