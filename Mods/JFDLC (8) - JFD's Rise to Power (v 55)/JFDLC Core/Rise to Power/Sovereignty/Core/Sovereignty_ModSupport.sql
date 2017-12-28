--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET NumPoliciesNeeded = 12
WHERE Type = 'BUILDING_JFD_DOGES_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 3
WHERE Type = 'BUILDING_JFD_DUR_SHARRIKUN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 10
WHERE Type = 'BUILDING_JFD_HOFBURG_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 12
WHERE Type = 'BUILDING_JFD_ST_PETERS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 15
WHERE Type = 'BUILDING_JFD_VERSAILLES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CLAIMS
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
UPDATE BuildingClasses
SET MaxGlobalInstances = -1
WHERE Type = 'BUILDINGCLASS_EE_VERSAILLES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE'
WHERE Type = 'BUILDING_JFD_DUR_SHARRIKUN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DIGNITARY'
WHERE Type IN ('BUILDING_JFD_HOFBURG_PALACE', 'BUILDING_JFD_VERSAILLES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NOBILITY'
WHERE Type = 'BUILDING_JFD_HOFBURG_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
--Claims 
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_SYSTEM_COMMON', 'REFORM_JFD_SYSTEM_CUSTOMARY', 'REFORM_JFD_SYSTEM_CIVIL', 'REFORM_JFD_PEERAGE_CEREMONIAL', 'REFORM_JFD_PEERAGE_PRIVILEGED', 'REFORM_JFD_PEERAGE_NONE', 'REFORM_JFD_BASIS_RELIGIOUS', 'REFORM_JFD_BASIS_MORAL', 'REFORM_JFD_BASIS_SECULAR', 'REFORM_JFD_MARRIAGE_CIVIC', 'REFORM_JFD_MARRIAGE_RELIGIOUS', 'REFORM_JFD_MARRIAGE_PRIVATE', 'REFORM_JFD_U_TAXATION_EXEMPT', 'REFORM_JFD_U_TAXATION_STANDARD', 'REFORM_JFD_U_TAXATION_HIGH', 'REFORM_JFD_CLAIMS_CAUSE', 'REFORM_JFD_CLAIMS_MIXED', 'REFORM_JFD_CLAIMS_INVESTMENT', 'REFORM_JFD_LEGITIMACY_DIVINE_RIGHT', 'REFORM_JFD_LEGITIMACY_GOVERNANCE', 'REFORM_JFD_LEGITIMACY_LAW')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--Colonies 
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_CITIZENSHIP_FULL', 'REFORM_JFD_CITIZENSHIP_LIMITED', 'REFORM_JFD_CITIZENSHIP_NONE', 'REFORM_JFD_CO_TAXATION_HIGH', 'REFORM_JFD_CO_TAXATION_STANDARD', 'REFORM_JFD_CO_TAXATION_EXEMPT')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

--Crime
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_EXECUTION_ARBITRARY', 'REFORM_JFD_EXECUTION_RESERVED', 'REFORM_JFD_EXECUTION_PROHIBITED', 'REFORM_JFD_SYSTEM_COMMON', 'REFORM_JFD_SYSTEM_CUSTOMARY', 'REFORM_JFD_SYSTEM_CIVIL', 'REFORM_JFD_PATENTS_LIMITED', 'REFORM_JFD_PATENTS_LETTERS', 'REFORM_JFD_PATENTS_UNLIMITED', 'REFORM_JFD_TOURISM_FREE', 'REFORM_JFD_TOURISM_NONE', 'REFORM_JFD_TOURISM_LIMITED', 'REFORM_JFD_WORSHIP_PROCREATION', 'REFORM_JFD_WORSHIP_PRIVATE', 'REFORM_JFD_WORSHIP_SACRIFICE', 'REFORM_JFD_LANGUAGE_ADAPTIVE', 'REFORM_JFD_LANGUAGE_PROTECTED', 'REFORM_JFD_LANGUAGE_NONE', 'REFORM_JFD_POLICE_MILITARY', 'REFORM_JFD_POLICE_CIVILIAN', 'REFORM_JFD_POLICE_VOLUNTEER', 'REFORM_JFD_PEERAGE_PRIVILEGED', 'REFORM_JFD_PEERAGE_NONE', 'REFORM_JFD_PEERAGE_CEREMONIAL', 'REFORM_JFD_IMMUNITY_SOVEREIGN', 'REFORM_JFD_IMMUNITY_QUALIFIED', 'REFORM_JFD_IMMUNITY_NONE', 'REFORM_JFD_SECTS_FUNDAMENTAL', 'REFORM_JFD_SECTS_PREVAILING', 'REFORM_JFD_SECTS_UNIVERSAL', 'REFORM_JFD_RECORDS_WRITTEN', 'REFORM_JFD_RECORDS_ORAL', 'REFORM_JFD_RECORDS_NONE', 'REFORM_JFD_PUNISHMENT_PRIVATE', 'REFORM_JFD_ADMINISTRATION_BUREAUCRATIC', 'REFORM_JFD_ADMINISTRATION_NEPOCRATIC', 'REFORM_JFD_ADMINISTRATION_TECHNOCRATIC', 'REFORM_JFD_HEALTHCARE_PUBLIC', 'REFORM_JFD_HEALTHCARE_BASIC', 'REFORM_JFD_HEALTHCARE_PRIVATE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Organized Crime
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_IMMUNITY_SOVEREIGN', 'REFORM_JFD_IMMUNITY_NONE', 'REFORM_JFD_IMMUNITY_QUALIFIED')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

--Development
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_ORGANIZATION_MANORIAL', 'REFORM_JFD_ORGANIZATION_BALANCED', 'REFORM_JFD_ORGANIZATION_MUNICIPAL', 'REFORM_JFD_PLANNING_URBAN', 'REFORM_JFD_PLANNING_BALANCED', 'REFORM_JFD_PLANNING_RURAL', 'REFORM_JFD_DEVELOPMENT_HAPPINESS', 'REFORM_JFD_DEVELOPMENT_BALANCED', 'REFORM_JFD_DEVELOPMENT_HEALTH')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

--Enlightenment Era
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_MEDIA_STATE', 'REFORM_JFD_MEDIA_NONE', 'REFORM_JFD_MEDIA_INDEPENDENT')
AND NOT EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

--Happiness
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_EXECUTION_ARBITRARY', 'REFORM_JFD_EXECUTION_RESERVED', 'REFORM_JFD_EXECUTION_PROHIBITED', 'REFORM_JFD_MINORITIES_ASSIMILATION', 'REFORM_JFD_MINORITIES_NONE', 'REFORM_JFD_MINORITIES_PERSECUTION', 'REFORM_JFD_LEGITIMACY_TRADITION', 'REFORM_JFD_LEGITIMACY_SECURITY', 'REFORM_JFD_LEGITIMACY_CHARISMA', 'REFORM_JFD_PUNISHMENT_IMPRISONMENT', 'REFORM_JFD_PUNISHMENT_RETALIATION', 'REFORM_JFD_PUNISHMENT_PRIVATE', 'REFORM_JFD_TRADE_UNIONS_STATE', 'REFORM_JFD_TRADE_UNIONS_NONE', 'REFORM_JFD_TRADE_UNIONS_FREE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

--Health
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_TRADE_FREE', 'REFORM_JFD_TRADE_NONE', 'REFORM_JFD_TRADE_REGULATED', 'REFORM_JFD_FESTIVALS_HEALING', 'REFORM_JFD_FESTIVALS_NONE', 'REFORM_JFD_FESTIVALS_PRAYER', 'REFORM_JFD_ENVIRONMENT_EXTORTED', 'REFORM_JFD_ENVIRONMENT_NONE', 'REFORM_JFD_ENVIRONMENT_PROTECTED')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Investments
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_PROPERTY_STATE', 'REFORM_JFD_PROPERTY_PERSONAL', 'REFORM_JFD_PROPERTY_PRIVATE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

--Levies
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_LEVIES_FRONTLINE', 'REFORM_JFD_LEVIES_STANDARD', 'REFORM_JFD_LEVIES_RESERVE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

--Loyalty
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_EXECUTION_ARBITRARY', 'REFORM_JFD_EXECUTION_RESERVED', 'REFORM_JFD_EXECUTION_PROHIBITED', 'REFORM_JFD_MINORITIES_ASSIMILATION', 'REFORM_JFD_MINORITIES_NONE', 'REFORM_JFD_MINORITIES_PERSECUTION', 'REFORM_JFD_POLICE_CIVILIAN', 'REFORM_JFD_POLICE_VOLUNTEER', 'REFORM_JFD_POLICE_MILITARY', 'REFORM_JFD_LEGITIMACY_TRADITION', 'REFORM_JFD_LEGITIMACY_SECURITY', 'REFORM_JFD_LEGITIMACY_CHARISMA', 'REFORM_JFD_MEDIA_INDEPENDENT', 'REFORM_JFD_MEDIA_NONE', 'REFORM_JFD_MEDIA_STATE', 'REFORM_JFD_CO_TAXATION_HIGH', 'REFORM_JFD_CO_TAXATION_STANDARD', 'REFORM_JFD_CO_TAXATION_EXEMPT', 'REFORM_JFD_CITIZENSHIP_FULL', 'REFORM_JFD_CITIZENSHIP_LIMITED', 'REFORM_JFD_CITIZENSHIP_NONE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--Mercenaries
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_RECRUITMENT_MERCENARY', 'REFORM_JFD_RECRUITMENT_CONSCRIPTED', 'REFORM_JFD_RECRUITMENT_PROFESSIONAL')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

--Provinces
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_ORGANIZATION_MANORIAL', 'REFORM_JFD_ORGANIZATION_BALANCED', 'REFORM_JFD_ORGANIZATION_MUNICIPAL', 'REFORM_JFD_L_TAXATION_EXEMPT', 'REFORM_JFD_L_TAXATION_STANDARD', 'REFORM_JFD_L_TAXATION_HIGH', 'REFORM_JFD_PLANNING_REGIONAL', 'REFORM_JFD_PLANNING_BALANCED', 'REFORM_JFD_PLANNING_URBAN')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

--Prosperity
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_CURRENCY_CREDIT', 'REFORM_JFD_CURRENCY_BARTER', 'REFORM_JFD_CURRENCY_TENDER')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

--Provinces
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_STRUCTURE_UNITARY', 'REFORM_JFD_STRUCTURE_ASSOCIATION', 'REFORM_JFD_STRUCTURE_FEDERATION', 'REFORM_JFD_PEERAGE_PRIVILEGED', 'REFORM_JFD_PEERAGE_NONE', 'REFORM_JFD_PEERAGE_CEREMONIAL')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

--Slavery
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_SLAVERY_DISPOSABLE', 'REFORM_JFD_SLAVERY_STANDARD', 'REFORM_JFD_SLAVERY_ELITE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

--Tribes
UPDATE JFD_Reforms
SET IsDisabled = 1
WHERE Type IN ('REFORM_JFD_TRIBES_RESERVATION', 'REFORM_JFD_TRIBES_NONE', 'REFORM_JFD_TRIBES_ASSIMILATION')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Technologies_JFD_MiscEffects
SET TechType = 'TECH_JFD_CODE_OF_LAWS'
WHERE TechType = 'TECH_PHILOSOPHY' AND AllowGovernments = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technology_Flavors
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Technology_Flavors
SET Flavor = 10
WHERE TechType = 'TECH_JFD_CODE_OF_LAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_DEFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_DIPLOMACY',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_MILITARY_TRAINING',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,						Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics
--------------------------------------------------------------------------------------------------------------------------	
UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_CONSERVATIVE_ALT]'
WHERE Type = 'PARTY_JFD_CONSERVATIVE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_LIBERAL_ALT]'
WHERE Type = 'PARTY_JFD_LIBERAL' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_REACTIONARY_ALT]'
WHERE Type = 'PARTY_JFD_REACTIONARY' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_SOCIALIST_ALT]'
WHERE Type = 'PARTY_JFD_SOCIALIST' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_COMMUNIST_ALT]'
WHERE Type = 'PARTY_JFD_COMMUNIST' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_FASCIST_ALT]'
WHERE Type = 'PARTY_JFD_FASCIST' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);

UPDATE JFD_Politics
SET FontIcon = '[ICON_JFD_LIBERTARIAN_ALT]'
WHERE Type = 'PARTY_JFD_LIBERTARIAN' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES' AND Value = 1);
--==========================================================================================================================
-- JFD PROGRESS IN TIME
--==========================================================================================================================
-- JFD_Reforms
------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Reforms
SET Help = 'TXT_KEY_JFD_REFORM_LABOUR_BONDED_HELP_CHARGES', HelpBonus = 'TXT_KEY_JFD_REFORM_LABOUR_BONDED_HELP_BONUS_CHARGES'
WHERE Type = 'REFORM_JFD_LABOUR_BONDED'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE JFD_Reforms
SET Help = 'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_HELP_CHARGES', HelpPenalty = 'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_HELP_PENALTY_CHARGES'
WHERE Type = 'REFORM_JFD_LABOUR_EMANCIPATED'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET WorkerSpeedModifier = 0
WHERE Type IN ('POLICY_REFORM_JFD_LABOUR_BONDED', 'POLICY_REFORM_JFD_LABOUR_EMANCIPATED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,							NumCharges)
SELECT	'POLICY_REFORM_JFD_LABOUR_BONDED',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,							NumCharges)
SELECT	'POLICY_REFORM_JFD_LABOUR_EMANCIPATED',	-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_UnitCombatProductionModifiers
SET ProductionModifier = 33
WHERE PolicyType = 'POLICY_REFORM_JFD_LABOUR_EMANCIPATED'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE Policy_UnitCombatProductionModifiers
SET ProductionModifier = -33
WHERE PolicyType = 'POLICY_REFORM_JFD_LABOUR_BONDED'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE', Strategy = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE_STRATEGY', Civilopedia = 'TXT_KEY_BUILDING_JFD_PUBLISHING_HOUSE_TEXT', IconAtlas = 'JFD_SOVEREIGNTY_BUILDING_ATLAS', PortraitIndex = 0
WHERE Type = 'BUILDING_THEATRE';

UPDATE Buildings 
SET PrereqTech = 'TECH_EE_SOVEREIGNTY'
WHERE Type = 'BUILDING_JFD_VERSAILLES'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

UPDATE Buildings
SET Cost = -1, PrereqTech = NULL
WHERE Type = 'BUILDING_EE_VERSAILLES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Reforms
SET PrereqEra = 'ERA_ENLIGHTENMENT'
WHERE Type IN ('REFORM_JFD_CITIZENSHIP_NONE', 'REFORM_JFD_CITIZENSHIP_FULL', 'REFORM_JFD_CITIZENSHIP_LIMITED', 'REFORM_JFD_TECHNOLOGY_TACTICS', 'REFORM_JFD_TECHNOLOGY_EQUIPMENT', 'REFORM_JFD_EDUCATION_ACADEMIC', 'REFORM_JFD_EDUCATION_TECHNICAL', 'REFORM_JFD_CITIZENSHIP_LIMITED', 'REFORM_JFD_CITIZENSHIP_FULL', 'REFORM_JFD_SUFFRAGE_LANDED', 'REFORM_JFD_SUFFRAGE_UNIVERSAL', 'REFORM_JFD_JUDICIARY_INDEPENDENT', 'REFORM_JFD_JUDICIARY_DEPENDENT', 'REFORM_JFD_HEALTHCARE_PUBLIC', 'REFORM_JFD_HEALTHCARE_PRIVATE', 'REFORM_JFD_PUBLICATIONS_PUBLIC', 'REFORM_JFD_PUBLICATIONS_NONE', 'REFORM_JFD_PUBLICATIONS_PRIVATE', 'REFORM_JFD_CO_TAXATION_HIGH', 'REFORM_JFD_CO_TAXATION_EXEMPT', 'REFORM_JFD_IMMUNITY_SOVEREIGN', 'REFORM_JFD_IMMUNITY_NONE', 'REFORM_JFD_TRIBES_RESERVATION', 'REFORM_JFD_TRIBES_ASSIMILATION')
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

UPDATE JFD_Reforms
SET Cost = 70
WHERE PrereqEra = 'ERA_ENLIGHTENMENT'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

UPDATE JFD_Reforms
SET Cost = 80
WHERE PrereqEra = 'ERA_INDUSTRIAL'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) SELECT ('JFD_RTP_Sovereignty_Decisions.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET GoldenAgeModifier = 0, Happiness = 0, PolicyCostModifier = 0
WHERE Type = 'BUILDING_DECISIONS_CODEOFLAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_JFD_REICHSTAG'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType,						ReformCooldownMod)
SELECT	'BUILDING_DECISIONS_CODEOFLAWS',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_RTP_Sovereignty_Events.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US
SET Text = 'Political Reforms may not be implemented until you have chosen a Government. This choice becomes available once you research Code of Laws.'
WHERE Tag = 'TXT_KEY_POLICYSCREEN_JFD_GOVT_DISABLED'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

UPDATE Language_en_US
SET Text = '[NEWLINE][NEWLINE]{1_Color}Great Merchant[ENDCOLOR][NEWLINE][ICON_BULLET]{2_Color}-10% [ICON_INVEST] Investment costs.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COUNCILLOR_GREAT_MERCHANT_HELP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'This seat is vacant. Fill it by expending one of the following [ICON_GREAT_PEOPLE] Great People:[NEWLINE][COLOR_FADING_POSITIVE_TEXT]Great Merchant [ENDCOLOR][NEWLINE][ICON_BULLET][COLOR_JFD_ALPHA]-10% [ICON_INVEST] Investment costs.[ENDCOLOR][NEWLINE][COLOR_FADING_POSITIVE_TEXT]Great Scientist [ENDCOLOR][NEWLINE][ICON_BULLET][COLOR_JFD_ALPHA]+5% [ICON_RESEARCH] Science when [ICON_HAPPINESS_1] Happy.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COUNCILLOR_JFD_STEWARD_HELP_VACANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================