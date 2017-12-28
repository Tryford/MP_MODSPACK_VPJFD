--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------
--Commoners
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ANCIENT', Description = 'TXT_KEY_POLICY_BRANCH_JFD_COMMONERS', Help = 'TXT_KEY_POLICY_BRANCH_JFD_COMMONERS_HELP', Title = 'TXT_KEY_JFD_COMMONERS_TITLE', TitleShort = 'TXT_KEY_JFD_COMMONERS_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Nobility
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ANCIENT', Description = 'TXT_KEY_POLICY_BRANCH_JFD_NOBILITY', Help = 'TXT_KEY_POLICY_BRANCH_JFD_NOBILITY_HELP', Title = 'TXT_KEY_JFD_NOBILITY_TITLE', TitleShort = 'TXT_KEY_JFD_NOBILITY_SHORT_TITLE'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Soldiers
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ANCIENT', Description = 'TXT_KEY_POLICY_BRANCH_JFD_SOLDIERS', Help = 'TXT_KEY_POLICY_BRANCH_JFD_SOLDIERS_HELP', Title = 'TXT_KEY_JFD_SOLDIERS_TITLE', TitleShort = 'TXT_KEY_JFD_SOLDIERS_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Priesthood
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_CLASSICAL', Description = 'TXT_KEY_POLICY_BRANCH_JFD_PRIESTHOOD', Help = 'TXT_KEY_POLICY_BRANCH_JFD_PRIESTHOOD_HELP', Title = 'TXT_KEY_JFD_PRIESTHOOD_TITLE', TitleShort = 'TXT_KEY_JFD_PRIESTHOOD_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Merchants
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_CLASSICAL', Description = 'TXT_KEY_POLICY_BRANCH_JFD_MERCHANTS', Help = 'TXT_KEY_POLICY_BRANCH_JFD_MERCHANTS_HELP', Title = 'TXT_KEY_JFD_MERCHANTS_TITLE', TitleShort = 'TXT_KEY_JFD_MERCHANTS_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Artisans
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_MEDIEVAL', Description = 'TXT_KEY_POLICY_BRANCH_JFD_ARTIST', Help = 'TXT_KEY_POLICY_BRANCH_JFD_ARTIST_HELP', Title = 'TXT_KEY_JFD_ARTIST_TITLE', TitleShort = 'TXT_KEY_JFD_ARTIST_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_AESTHETICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Bureaucrats
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_MEDIEVAL', Description = 'TXT_KEY_POLICY_BRANCH_JFD_BUREAUCRATS', Help = 'TXT_KEY_POLICY_BRANCH_JFD_BUREAUCRATS_HELP', Title = 'TXT_KEY_JFD_BUREAUCRATS_TITLE', TitleShort = 'TXT_KEY_JFD_BUREAUCRATS_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Admiralty
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_RENAISSANCE', Description = 'TXT_KEY_POLICY_BRANCH_JFD_ADMIRALTY', Help = 'TXT_KEY_POLICY_BRANCH_JFD_ADMIRALTY_HELP', Title = 'TXT_KEY_JFD_ADMIRALTY_TITLE', TitleShort = 'TXT_KEY_JFD_ADMIRALTY_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Scholars
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_RENAISSANCE', Description = 'TXT_KEY_POLICY_BRANCH_JFD_SCHOLARS', Help = 'TXT_KEY_POLICY_BRANCH_JFD_SCHOLARS_HELP', Title = 'TXT_KEY_JFD_SCHOLARS_TITLE', TitleShort = 'TXT_KEY_JFD_SCHOLARS_SHORT_TITLE'
WHERE Type ='POLICY_BRANCH_RATIONALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- PolicyBranch_JFD_EraImages
------------------------------------------------------------
INSERT INTO PolicyBranch_JFD_EraImages
		(PolicyBranchType,				EraType,				Image)
SELECT  'POLICY_BRANCH_TRADITION',		'ERA_ANCIENT',			'SocialPoliciesCommoners_Ancient.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO PolicyBranch_JFD_EraImages
		(PolicyBranchType,				EraType,				Image)
SELECT  'POLICY_BRANCH_TRADITION',		'ERA_MEDIEVAL',			'SocialPoliciesCommoners_Medieval.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO PolicyBranch_JFD_EraImages
		(PolicyBranchType,				EraType,				Image)
SELECT  'POLICY_BRANCH_TRADITION',		'ERA_FUTURE',			'SocialPoliciesCommoners_Future.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--
--		(PolicyBranchType,				EraType,				Image)
--VALUES	('POLICY_BRANCH_TRADITION',		'ERA_ANCIENT',			'SocialPoliciesCommoners_Ancient.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_CLASSICAL',		'SocialPoliciesCommoners_Classical.dds'),
--		('POLICY_BRANCH_TRADITION',		'ERA_MEDIEVAL',			'SocialPoliciesCommoners_Medieval.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_RENAISSANCE',		'SocialPoliciesCommoners_Renaissance.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_ENLIGHTENMENT',	'SocialPoliciesCommoners_Enlightenment.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_INDUSTRIAL',		'SocialPoliciesCommoners_Industrial.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_POSTMODERN',		'SocialPoliciesCommoners_Atomic.dds'),
--		--('POLICY_BRANCH_TRADITION',		'ERA_MODERN',			'SocialPoliciesCommoners_Modern.dds'),
--		('POLICY_BRANCH_TRADITION',		'ERA_FUTURE',			'SocialPoliciesCommoners_Future.dds');
	--
	
	--('POLICY_BRANCH_LIBERTY',		'ERA_ANCIENT',			'SocialPoliciesPriesthood_Ancient.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_CLASSICAL',		'SocialPoliciesPriesthood_Classical.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_MEDIEVAL',			'SocialPoliciesPriesthood_Medieval.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_RENAISSANCE',		'SocialPoliciesPriesthood_Renaissance.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_ENLIGHTENMENT',	'SocialPoliciesPriesthood_Enlightenment.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_INDUSTRIAL',		'SocialPoliciesPriesthood_Industrial.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_POSTMODERN',		'SocialPoliciesPriesthood_Atomic.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_MODERN',			'SocialPoliciesPriesthood_Modern.dds'),
		--('POLICY_BRANCH_LIBERTY',		'ERA_FUTURE',			'SocialPoliciesPriesthood_Future.dds'),
		--	('POLICY_BRANCH_HONOR',			'ERA_ANCIENT',			'SocialPoliciesSoldiers_Ancient.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_CLASSICAL',		'SocialPoliciesSoldiers_Classical.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_MEDIEVAL',			'SocialPoliciesSoldiers_Medieval.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_RENAISSANCE',		'SocialPoliciesSoldiers_Renaissance.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_ENLIGHTENMENT',	'SocialPoliciesSoldiers_Enlightenment.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_INDUSTRIAL',		'SocialPoliciesSoldiers_Industrial.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_POSTMODERN',		'SocialPoliciesSoldiers_Atomic.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_MODERN',			'SocialPoliciesSoldiers_Modern.dds'),
	--	('POLICY_BRANCH_HONOR',			'ERA_FUTURE',			'SocialPoliciesSoldiers_Future.dds'),
	--	--('POLICY_BRANCH_PIETY',			'ERA_ANCIENT',			'SocialPoliciesNobility_Ancient.dds'),
	--	('POLICY_BRANCH_PIETY',			'ERA_CLASSICAL',		'SocialPoliciesNobility_Classical.dds'),
	--	('POLICY_BRANCH_PIETY',			'ERA_MEDIEVAL',			'SocialPoliciesNobility_Medieval.dds'),
	--	('POLICY_BRANCH_PIETY',			'ERA_RENAISSANCE',		'SocialPoliciesNobility_Renaissance.dds'),
	--	('POLICY_BRANCH_PIETY',			'ERA_ENLIGHTENMENT',	'SocialPoliciesNobility_Enlightenment.dds'),
	--	('POLICY_BRANCH_PIETY',			'ERA_INDUSTRIAL',		'SocialPoliciesNobility_Industrial.dds'),
	--	--('POLICY_BRANCH_PIETY',			'ERA_POSTMODERN',		'SocialPoliciesNobility_Atomic.dds'),
	--	--('POLICY_BRANCH_PIETY',			'ERA_MODERN',			'SocialPoliciesNobility_Modern.dds'),
	--	--('POLICY_BRANCH_PIETY',			'ERA_FUTURE',			'SocialPoliciesNobility_Future.dds'),
	--	('POLICY_BRANCH_PATRONAGE',		'ERA_ANCIENT',			'SocialPoliciesDignitaries_Ancient.dds'),
	--	--('POLICY_BRANCH_PATRONAGE',		'ERA_CLASSICAL',		'SocialPoliciesDignitaries_Classical.dds'),
	----	('POLICY_BRANCH_PATRONAGE',		'ERA_MEDIEVAL',			'SocialPoliciesDignitaries_Medieval.dds'),
	--	('POLICY_BRANCH_PATRONAGE',		'ERA_RENAISSANCE',		'SocialPoliciesDignitaries_Renaissance.dds'),
	--	('POLICY_BRANCH_PATRONAGE',		'ERA_ENLIGHTENMENT',	'SocialPoliciesDignitaries_Enlightenment.dds'),
	--	('POLICY_BRANCH_PATRONAGE',		'ERA_INDUSTRIAL',		'SocialPoliciesDignitaries_Industrial.dds'),
	--	--('POLICY_BRANCH_PATRONAGE',		'ERA_POSTMODERN',		'SocialPoliciesDignitaries_Atomic.dds'),
	--	--('POLICY_BRANCH_PATRONAGE',		'ERA_MODERN',			'SocialPoliciesDignitaries_Modern.dds'),
	--	--('POLICY_BRANCH_PATRONAGE',		'ERA_FUTURE',			'SocialPoliciesDignitaries_Future.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_ANCIENT',			'SocialPoliciesArtists_Ancient.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_CLASSICAL',		'SocialPoliciesArtists_Classical.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_MEDIEVAL',			'SocialPoliciesArtists_Medieval.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_RENAISSANCE',		'SocialPoliciesArtists_Renaissance.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_ENLIGHTENMENT',	'SocialPoliciesArtists_Enlightenment.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_INDUSTRIAL',		'SocialPoliciesArtists_Industrial.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_POSTMODERN',		'SocialPoliciesArtists_Atomic.dds'),
	--	('POLICY_BRANCH_AESTHETICS',	'ERA_MODERN',			'SocialPoliciesArtists_Modern.dds'),
	--	--('POLICY_BRANCH_AESTHETICS',	'ERA_FUTURE',			'SocialPoliciesArtists_Future.dds'),
	--	('POLICY_BRANCH_COMMERCE',		'ERA_ANCIENT',			'SocialPoliciesMerchants_Ancient.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_CLASSICAL',		'SocialPoliciesMerchants_Classical.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_MEDIEVAL',			'SocialPoliciesMerchants_Medieval.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_RENAISSANCE',		'SocialPoliciesMerchants_Renaissance.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_ENLIGHTENMENT',	'SocialPoliciesMerchants_Enlightenment.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_INDUSTRIAL',		'SocialPoliciesMerchants_Industrial.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_POSTMODERN',		'SocialPoliciesMerchants_Atomic.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_MODERN',			'SocialPoliciesMerchants_Modern.dds'),
	--	--('POLICY_BRANCH_COMMERCE',		'ERA_FUTURE',			'SocialPoliciesMerchants_Future.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_ANCIENT',			'SocialPoliciesAdmiralty_Ancient.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_CLASSICAL',		'SocialPoliciesAdmiralty_Classical.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_MEDIEVAL',			'SocialPoliciesAdmiralty_Medieval.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_RENAISSANCE',		'SocialPoliciesAdmiralty_Renaissance.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_ENLIGHTENMENT',	'SocialPoliciesAdmiralty_Enlightenment.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_INDUSTRIAL',		'SocialPoliciesAdmiralty_Industrial.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_POSTMODERN',		'SocialPoliciesAdmiralty_Atomic.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_MODERN',			'SocialPoliciesAdmiralty_Modern.dds'),
	--	('POLICY_BRANCH_EXPLORATION',	'ERA_FUTURE',			'SocialPoliciesAdmiralty_Future.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_ANCIENT',			'SocialPoliciesScholars_Ancient.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_CLASSICAL',		'SocialPoliciesScholars_Classical.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_MEDIEVAL',			'SocialPoliciesScholars_Medieval.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_RENAISSANCE',		'SocialPoliciesScholars_Renaissance.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_ENLIGHTENMENT',	'SocialPoliciesScholars_Enlightenment.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_INDUSTRIAL',		'SocialPoliciesScholars_Industrial.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_POSTMODERN',		'SocialPoliciesScholars_Atomic.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_MODERN',			'SocialPoliciesScholars_Modern.dds'),
	--	('POLICY_BRANCH_RATIONALISM',	'ERA_FUTURE',			'SocialPoliciesScholars_Future.dds');
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
--COMMONERS
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_COMMONERS', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_COMMONERS_TEXT', Help = 'TXT_KEY_POLICY_BRANCH_JFD_COMMONERS_HELP', PortraitIndex = 26, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', PlotCultureExponentModifier = 0
WHERE Type = 'POLICY_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Assemblies
UPDATE Policies
SET HappinessPerTradeRoute = 100, CityCountUnhappinessMod = -20, Description = 'TXT_KEY_POLICY_JFD_ASSEMBLIES', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_ASSEMBLIES_TEXT', Help = 'TXT_KEY_POLICY_JFD_ASSEMBLIES_HELP', PortraitIndex = 26, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', CapitalUnhappinessMod = 0
WHERE Type = 'POLICY_MONARCHY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Civic Society
UPDATE Policies
SET NumCitiesPolicyCostDiscount = -33, Description = 'TXT_KEY_POLICY_JFD_CIVIC_SOCIETY', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_CIVIC_SOCIETY_TEXT', Help = 'TXT_KEY_POLICY_JFD_CIVIC_SOCIETY_HELP', PortraitIndex = 26, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', GarrisonedCityRangeStrikeModifier = 0, GarrisonFreeMaintenance = 0
WHERE Type = 'POLICY_OLIGARCHY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Communalism
UPDATE Policies
SET ImprovementUpgradeRateModifier = 20, Description = 'TXT_KEY_POLICY_JFD_COMMUNALISM', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_COMMUNALISM_TEXT', Help = 'TXT_KEY_POLICY_JFD_COMMUNALISM_HELP', PortraitIndex = 26, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS'
WHERE Type = 'POLICY_ARISTOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_COMMONERS', CityGrowthMod = 0, NumCitiesFreeFoodBuilding = 0
WHERE Type = 'POLICY_TRADITION_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--NOBILITY
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_NOBILITY', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_NOBILITY_TEXT', Help = 'TXT_KEY_POLICY_JFD_NOBILITY_HELP', PortraitIndex = 27, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', CulturePerCity = 0
WHERE Type = 'POLICY_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_NOBILITY', CityGrowthMod = 0, NumCitiesFreeFoodBuilding = 0
WHERE Type = 'POLICY_LIBERTY_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--SOLDIERS
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_SOLDIERS', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_SOLDIERS_TEXT', Help = 'TXT_KEY_POLICY_JFD_SOLDIERS_HELP', PortraitIndex = 23, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', CultureFromBarbarianKills = 0, AlwaysSeeBarbCamps = 0, BarbarianCombatBonus = 0
WHERE Type = 'POLICY_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_SOLDIERS', GoldFromKills = 0
WHERE Type = 'POLICY_HONOR_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--PRIESTHOOD
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_PRIESTHOOD', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_PRIESTHOOD_TEXT', Help = 'TXT_KEY_POLICY_JFD_PRIESTHOOD_HELP', PortraitIndex = 45, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS'
WHERE Type = 'POLICY_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_PRIESTHOOD', IncludesOneShotFreeUnits = 0
WHERE Type = 'POLICY_PIETY_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--MERCHANTS
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_MERCHANTS', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_MERCHANTS_TEXT', Help = 'TXT_KEY_POLICY_JFD_MERCHANTS_HELP', PortraitIndex = 0, IconAtlas = 'POLICY_ATLAS_EXP2', IconAtlasAchieved = 'POLICY_A_ATLAS_EXP2', MinorFriendshipDecayMod = 0
WHERE Type = 'POLICY_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_MERCHANTS', MinorGreatPeopleAllies = 0
WHERE Type = 'POLICY_PATRONAGE_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--ARTIST
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_ARTIST', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_ARTIST_TEXT', Help = 'TXT_KEY_POLICY_JFD_ARTIST_HELP', PortraitIndex = 0, IconAtlas = 'POLICY_ATLAS_EXP2', IconAtlasAchieved = 'POLICY_A_ATLAS_EXP2', GreatWriterRateModifier = 0, GreatArtistRateModifier = 0, GreatMusicianRateModifier = 0
WHERE Type = 'POLICY_AESTHETICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_ARTIST', ThemingBonusMultiplier = 0
WHERE Type = 'POLICY_AESTHETICS_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--BUREAUCRATS
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_BUREAUCRATS', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_BUREAUCRATS_TEXT', Help = 'TXT_KEY_POLICY_JFD_BUREAUCRATS_HELP', PortraitIndex = 41, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS'
WHERE Type = 'POLICY_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_BUREAUCRATS'
WHERE Type = 'POLICY_COMMERCE_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--ADMIRALTY
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_ADMIRALTY', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_ADMIRALTY_TEXT', Help = 'TXT_KEY_POLICY_JFD_ADMIRALTY_HELP', PortraitIndex = 10, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS'
WHERE Type = 'POLICY_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_ADMIRALTY'
WHERE Type = 'POLICY_EXPLORATION_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

UPDATE Resources SET PolicyReveal = NULL WHERE PolicyReveal = 'POLICY_EXPLORATION_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--SCHOLARS
--Opener
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_SCHOLARS', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_SCHOLARS_TEXT', Help = 'TXT_KEY_POLICY_JFD_SCHOLARS_HELP', PortraitIndex = 52, IconAtlas = 'POLICY_ATLAS', IconAtlasAchieved = 'POLICY_A_ATLAS', HappinessToScience = 0
WHERE Type = 'POLICY_RATIONALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_BRANCH_JFD_SCHOLARS', NumFreeTechs = 0, OneShot = 0
WHERE Type = 'POLICY_RATIONALISM_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
------------------------------------------------------------
DELETE FROM Policy_BuildingClassCultureChanges WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------------------------------------
DELETE FROM Policy_BuildingClassProductionModifiers WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_TRADITION',					Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_WATERMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_LIBERTY',					Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_HONOR',						Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_PIETY',						Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_PATRONAGE',					Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MARKET', 'BUILDINGCLASS_BANK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_AESTHETICS',				Type,						20
FROM BuildingClasses WHERE Type IN ('')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_COMMERCE',					Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COURTHOUSE', 'BUILDINGCLASS_CONSTABLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_EXPLORATION',				Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_SEAPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,			ProductionModifier)
SELECT	'POLICY_RATIONALISM',				Type,						20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_TRADITION',					Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_WATERMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_LIBERTY',					Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_HONOR',						Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_PIETY',						Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_PATRONAGE',					Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MARKET', 'BUILDINGCLASS_BANK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_AESTHETICS',				Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_COMMERCE',					Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COURTHOUSE', 'BUILDINGCLASS_CONSTABLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_EXPLORATION',				Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_SEAPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_RATIONALISM',				Type,						'YIELD_CULTURE',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassHappiness
------------------------------------------------------------
INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_TRADITION_FINISHER',			Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_WATERMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_LIBERTY_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_HONOR_FINISHER',			Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_PIETY_FINISHER',			Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_PATRONAGE_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MARKET', 'BUILDINGCLASS_BANK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_AESTHETICS_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_COMMERCE_FINISHER',			Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COURTHOUSE', 'BUILDINGCLASS_CONSTABLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_EXPLORATION_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_SEAPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_RATIONALISM_FINISHER',		Type,						1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_CapitalYieldModifiers
------------------------------------------------------------
DELETE FROM Policy_CapitalYieldModifiers WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_CapitalYieldModifiers
------------------------------------------------------------
DELETE FROM Policy_CapitalYieldModifiers WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_CapitalYieldPerPopChanges
------------------------------------------------------------
DELETE FROM Policy_CapitalYieldPerPopChanges WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreeUnitClasses
------------------------------------------------------------
DELETE FROM Policy_FreeUnitClasses WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_ImprovementCultureChanges
------------------------------------------------------------
DELETE FROM Policy_ImprovementCultureChanges WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_ImprovementYieldChanges
------------------------------------------------------------
DELETE FROM Policy_ImprovementYieldChanges WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Communalism
INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,	YieldType,					Yield)
SELECT	'POLICY_ARISTOCRACY',				Type,				'YIELD_JFD_DEVELOPMENT',	10
FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_VILLAGE', 'IMPROVEMENT_JFD_TOWN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_UnitClassProductionModifiers
------------------------------------------------------------
--Civic Society
INSERT INTO Policy_UnitClassProductionModifiers	
		(PolicyType,					UnitClassType,		ProductionModifier)
SELECT	'POLICY_OLIGARCHY',				Type,				20
FROM UnitClasses WHERE Type IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_COLONIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_Flavors
------------------------------------------------------------	
--COMMONERS
DELETE FROM Policy_Flavors WHERE PolicyType IN ('POLICY_TRADITION', 'POLICY_TRADITION_FINISHER', 'POLICY_ARISTOCRACY', 'POLICY_MONARCHY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
--Opener
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION',					'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION',					'FLAVOR_PRODUCTION',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION',					'FLAVOR_GROWTH',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Assemblies
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_MONARCHY',					'FLAVOR_HAPPINESS',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_MONARCHY',					'FLAVOR_EXPANSION',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Civic Society
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_OLIGARCHY',					'FLAVOR_EXPANSION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_OLIGARCHY',					'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Communalism
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_ARISTOCRACY',				'FLAVOR_GROWTH',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_ARISTOCRACY',				'FLAVOR_GOLD',				5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_ARISTOCRACY',				'FLAVOR_TILE_IMPROVEMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--Finisher
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION_FINISHER',		'FLAVOR_GROWTH',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION_FINISHER',		'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_TRADITION_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);




--NOBILITY
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_LIBERTY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY',					'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY',					'FLAVOR_PRODUCTION',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY',					'FLAVOR_CITY_DEFENSE',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_LIBERTY_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY_FINISHER',		'FLAVOR_CITY_DEFENSE',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY_FINISHER',		'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_LIBERTY_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--SOLDIERS
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_HONOR' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR',						'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR',						'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR',						'FLAVOR_MILITARY_TRAINING',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR',						'FLAVOR_OFFENSE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_HONOR_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR_FINISHER',			'FLAVOR_MILITARY_TRAINING',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR_FINISHER',			'FLAVOR_OFFENSE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_HONOR_FINISHER',			'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--PRIESTHOOD
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_PIETY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PIETY',						'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PIETY',						'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PIETY',						'FLAVOR_RELIGION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_PIETY_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PIETY_FINISHER',			'FLAVOR_RELIGION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PIETY_FINISHER',			'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--MERCHANTS
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_PATRONAGE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PATRONAGE',					'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PATRONAGE',					'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PATRONAGE',					'FLAVOR_GOLD',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_PATRONAGE_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PATRONAGE_FINISHER',		'FLAVOR_GOLD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_PATRONAGE_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--AESTHETICS
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_AESTHETICS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_AESTHETICS',				'FLAVOR_CULTURE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_AESTHETICS',				'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_AESTHETICS_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_AESTHETICS_FINISHER',		'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_AESTHETICS_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--BUREAUCRATS
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_COMMERCE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_COMMERCE',					'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_COMMERCE',					'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_COMMERCE',					'FLAVOR_DIPLOMACY',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_COMMERCE_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_COMMERCE_FINISHER',			'FLAVOR_DIPLOMACY',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_COMMERCE_FINISHER',			'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--ADMIRALTY
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_EXPLORATION' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION',				'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION',				'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION',				'FLAVOR_NAVAL',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_EXPLORATION_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION_FINISHER',		'FLAVOR_NAVAL',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION_FINISHER',		'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_EXPLORATION_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

--SCHOLARS
DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_RATIONALISM' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM',				'FLAVOR_CULTURE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM',				'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM',				'FLAVOR_SCIENCE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

DELETE FROM Policy_Flavors WHERE PolicyType = 'POLICY_RATIONALISM_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM_FINISHER',		'FLAVOR_SCIENCE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM_FINISHER',		'FLAVOR_PRODUCTION',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,					Flavor)
SELECT	'POLICY_RATIONALISM_FINISHER',		'FLAVOR_HAPPINESS',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================