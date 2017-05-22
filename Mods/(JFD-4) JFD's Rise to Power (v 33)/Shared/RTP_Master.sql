--==========================================================================================================================
-- WHOWARD/GAZEBO's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_MINORS', 0); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BUGFIX_DUMMY_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('CONFIG_GAME_IN_XML', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_ACQUIRE_BELIEFS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_AI_OVERRIDE_TECH', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_DIPLO_MODIFIERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CUSTOM_MISSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_ESPIONAGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOLDEN_AGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOODY_CHOICE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GREAT_PEOPLE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_FOUND_RELIGION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_LIBERATION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_NW_DISCOVERY', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_MINORS_INTERACTION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_NEW_ERA', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_PLOT', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_RESOLUTIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_DATA', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_UPGRADES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_GREATWORK_YIELDTYPES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_HAPPINESS_MODIFIERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_JFD', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('RELIGION_CONVERSION_MODIFIERS', 1);

INSERT INTO COMMUNITY 
		(Type,								Value)
SELECT	'COMMUNITY_CORE_BALANCE_RELIGION',	0
AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION');

INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_MINOR_PTP_MINIMUM_VALUE', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD' AND Value = 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_NEW_GP_ATTRIBUTES', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES' AND Value = 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'GLOBAL_SEPARATE_GP_COUNTERS', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES' AND Value = 1);
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Beliefs		ADD JFD_InquisitorPromotion				text		REFERENCES UnitPromotions(Type)		default NULL;
ALTER TABLE Beliefs		ADD JFD_IsPiety							boolean											default 0;
ALTER TABLE Beliefs		ADD JFD_MissionaryPromotion				text		REFERENCES UnitPromotions(Type)		default NULL;
ALTER TABLE Beliefs		ADD JFD_PietyDescription				text											default NULL;
ALTER TABLE Beliefs		ADD JFD_RemovesMissionaryPenalties		boolean											default 0;
ALTER TABLE Beliefs		ADD JFD_RequiresEnhancement				boolean											default 0;
ALTER TABLE Beliefs		ADD JFD_RequiresFounding				boolean											default 0;
ALTER TABLE Beliefs		ADD TrainedFreePromotion				text		REFERENCES UnitPromotions(Type)		default NULL;
ALTER TABLE Beliefs		ADD JFD_XPOnFaithPurchase				integer											default	0;
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Belief_JFD_PietyYieldChanges (
	BeliefType													text 		REFERENCES Beliefs(Type) 			default NULL,
	OnBuildingConstructed										boolean											default 0,	
	OnBuildingPurchased											boolean											default 0,	
	OnCitizenBirth												boolean											default 0,	
	OnCityFounded												boolean											default 0,	
	OnGoldenAgeBegins											boolean											default 0,	
	OnMilitaryUnitFaithPurchased								boolean											default 0,	
	OnPolicyAdopted												boolean											default 0,	
	OnTechDiscovered											boolean											default 0,	
	OnTileAcquired												boolean											default 0,	
	OnTilePurchased												boolean											default 0,	
	OnUnitClassCreated											text		REFERENCES UnitClasses(Type) 		default NULL,	
	OnUnitClassExpended											text		REFERENCES UnitClasses(Type) 		default NULL,	
	OnUnitKilled												boolean											default 0,	
	OnUnitPromoted												boolean											default 0,	
	OnWLTKD														boolean											default 0,	
	OnWonderConstructed											boolean											default 0,	
	Yield														integer											default 0);
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
BuildingClass_ConstructionAudio (
    BuildingClassType											text    REFERENCES BuildingClasses(Type)		default NULL,
    ConstructionAudio											text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	BuildingClass_JFD_District (
	BuildingClassType  											text 		REFERENCES BuildingClasses(Type)	default NULL,
	DistrictType												text										 	default NULL);	
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Buildings ADD FreeGovernmentSwitches				integer											default 0;
ALTER TABLE Buildings ADD FoundsGovernment						boolean											default 0;
ALTER TABLE Buildings ADD FoundsStateReligion					boolean											default 0;
ALTER TABLE Buildings ADD GovernmentType						text											default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_ClaimMods (
	BuildingType  												text 	REFERENCES Buildings(Type) 				default NULL,
	CauseChange													integer											default 0,
	ClaimCostMod												integer											default 0,
	RequiresAllied												boolean											default 0,
	RequiresBefriended											boolean											default 0,
	DignitaryChange												integer											default 0,
	MagistrateChange											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_CrimeMods (
	BuildingType  												text 	REFERENCES Buildings(Type) 				default NULL,
	CrimeType													text 		 									default NULL,
	GlobalCrimeMod												integer											default 0,	
	CrimeMod													integer											default 0,
	IsLoyalty													boolean											default 0);		
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ContractMods (
	BuildingType 												text 	REFERENCES Buildings(Type)				default NULL,
	CostMod 													integer 										default 0,
	MaintenanceMod												integer 										default 0,
	TurnsMod													integer 										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_JFD_HelpTexts (
    BuildingType												text    REFERENCES Buildings(Type)              default NULL,
    CivilizationType											text    REFERENCES Civilizations(Type)          default NULL,
	HelpText													text											default NULL,
	IsWrittenFirst												boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_PietyMods (
	BuildingType												text    REFERENCES Buildings(Type)              default NULL,
	PietyYieldMod												integer											default 0,
	RestingRateChange											integer											default 0,
	StateReligionAdoptMod										integer											default 0,
	StateReligionPressureMod									integer											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_SovereigntyMods (
	BuildingType												text    REFERENCES Buildings(Type)              default NULL,
	Help														text											default NULL,
	ReformBranchType											text 	  										default NULL,
	FactionSovMod												integer											default 0,
	LegitimacySovMod											integer											default 0,
	MaxSovChange												integer											default 0,
	ReformCooldownMod											integer											default 0,
	ReformCostMod												integer											default 0,
	IsSovereignty												boolean											default 0,
	SovereigntyWhenPietyLevel									integer											default 0,
	SovereigntyWhenPietyLevelReq								text											default NULL,
	SovereigntyWhenGreatWorks									integer											default 0,
	SovereigntyWhenTradeRoutes									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Legitimacies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_Legitimacies (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	Help														text											default NULL,
	SovereigntyWhenChanceries  									integer											default 0,
	SovereigntyWhenConnected  									integer											default 0,
	SovereigntyWhenExcessHappiness								integer											default 0,	
	SovereigntyWhenGarrisoned  									integer											default 0,
	SovereigntyWhenHighCourt									integer											default 0,
	SovereigntyWhenMonasteries  								integer											default 0,
	SovereigntyWhenPatriotic									integer											default 0,
	SovereigntyWhenPopulation									integer											default 0,
	SovereigntyWhenSpecialist									integer											default 0,
	SovereigntyWhenStateReligion								integer											default 0,
	SovereigntyWhenTradition									integer											default 0);
	--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourcePerEra
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Building_ResourcePerEra (
	BuildingType												text 											default NULL,
	ResourceType												text 											default NULL,
	Quantity													integer											default 0,
	InitialQuantity												integer											default 0);
DELETE FROM Building_ResourcePerEra;
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--Civilization_FreePolicies
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_FreePolicies (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 			default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 				default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Currencies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 			default NULL,
	CurrencyType	  											text 	REFERENCES JFD_Currencies(Type) 		default NULL);
--==========================================================================================================================
-- CLAIMS
--==========================================================================================================================
-- JFD_Claims
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Claims (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	Help														text											default NULL,
	CausesHelp													text											default NULL,
	CausesNeeded 												integer 										default 0,
	IconString													text											default NULL,
	GoldCostModifier											integer											default	0,
	DignitaryCost												integer											default	0,
	ResistanceModifier											integer											default	0);	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 			default NULL,
	LegislatureName												text											default	NULL,
	OfficeTitle													text											default	NULL,
	GovernmentType												text											default	NULL,
	Weight														integer											default	0);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  											text 	REFERENCES Civilizations(Type) 		default NULL,
	HeadOfGovernmentName										text 	 									default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 		default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 								default NULL,
	UniqueTitle													text 		 								default NULL,
	UseAdjective												boolean										default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Politics
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 		default NULL,
	PoliticsType  												text 		 								default NULL,
	UniqueName													text										default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Reforms (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 		default NULL,
	ReformType													text 									 	default NULL,
	StartsWith													boolean										default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_Governments (
	CultureType  												text 									 	default NULL,
	LegislatureName												text										default	NULL,
	OfficeTitle													text										default	NULL,
	GovernmentType												text										default	NULL,
	Weight														integer										default	0);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_CultureType_HeadsOfGovernment	
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	JFD_CultureType_HeadsOfGovernment (	
	CultureType  												text 										default NULL,
	HeadOfGovernmentName										text 		 								default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_Titles (
	CultureType  												text 									 	default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 								default NULL,
	UniqueTitle													text 		 								default NULL,
	UseAdjective												boolean										default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	MinorCivilization_JFD_Titles (
	MinorCivilizationType  										text 	REFERENCES MinorCivilizations(Type) default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 			default NULL,
	UniqueGovernmentTitle										text 		 								default NULL,
	UniqueLeaderTitle											text 		 								default NULL);	
--==========================================================================================================================
-- CONTRACTS
--==========================================================================================================================
ALTER TABLE Contracts ADD PietyCost								integer 									default 0;
ALTER TABLE Contracts ADD RequiresReligionFounded				text 										default NULL;
ALTER TABLE Contracts ADD UnitCount								integer 									default 0;
ALTER TABLE Contracts ADD UnitType								text 										default NULL;
ALTER TABLE Contracts ADD YieldText								text 		 								default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- Contract_UnitClasses
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Contract_UnitClasses (
	ContractType 												text 											default NULL,
	CultureType													text 											default NULL,
	UnitClassType 												text	REFERENCES UnitClasses(Type)			default NULL,
	UseOnlyCultureType											boolean											default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Contract_UnitCombats
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Contract_UnitCombats (
	ContractType 												text 											default NULL,
	CultureType													text 											default NULL,
	UnitCombatType 												text	REFERENCES UnitCombatInfos(Type)		default NULL,
	UseOnlyCultureType											boolean											default	0);
--==========================================================================================================================
-- CURRENCIES
--==========================================================================================================================
-- JFD_Currencies
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Currencies (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	PortraitIndex												integer											default 0,
	IconAtlas													text											default NULL,
	IconString													text											default NULL);	
--==========================================================================================================================
-- EPITHETS
--==========================================================================================================================
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Epithets (
	ID  														integer 						  				primary key autoincrement,
	Type 														text 											default NULL,
	Description 												text 											default NULL,
	ShortDescription 											text 											default NULL,
	Help 														text 											default NULL,
	HasFeminineAlt												boolean											default 0,
	AcquisitionChance		 									integer 										default 0,
	EventOnly													boolean											default 0,
	IsOnAggressiveWar											boolean											default 0,
	IsOnBarbarianKilled											boolean											default 0,	
	IsOnBuildingClassConstructed								boolean											default 0,
	IsOnBuildingFaithPurchased									boolean											default 0,
	IsOnBuildingPurchased										boolean											default 0,
	IsOnCityConquered											boolean											default 0,
	IsOnCityOtherReligionConquered								boolean											default 0,
	IsOnCityRazed												boolean											default 0,
	IsOnCityWLTKD												boolean											default 0,
	IsOnCityYourReligionConquered								boolean											default 0,
	IsOnCityStateBully											boolean											default 0,
	IsOnCityStateClaimed										boolean											default 0,
	IsOnCityStateLiberated										boolean											default 0,
	IsOnFirstToEra												text 	REFERENCES Eras(Type) 					default NULL,
	IsOnHolyCityCaptured										boolean											default 0,
	IsOnGoldenAge												boolean											default 0,
	IsOnMercenaryHired											boolean											default 0,
	IsOnLevyPurchased											boolean											default 0,
	IsOnNavalUnitTrained										boolean											default 0,
	IsOnNaturalWonderDiscovered									boolean											default 0,
	IsOnPolicyBranch											boolean											default 0,
	IsOnReformPassed											boolean											default 0,
	IsOnSlavePurchased											boolean											default 0,
	IsOnUnitClassBorn											text 	REFERENCES UnitClasses(Type) 			default NULL,
	IsOnUnitFaithPurchase										boolean											default 0,
	IsOnAnyWonderConstructed									boolean											default 0,
	IsOnWonderConstructed 										boolean 										default 0,
	ImprovementMod												text 	REFERENCES Improvements(Type) 			default NULL,
	NumContractsMod												integer 										default 0,
	NumCityMod													integer 										default 0,
	NumCityStateFriendsMod										integer 										default 0,
	NumCityStateReligionMod										integer 										default 0,
	NumCourthouseMod											integer 										default 0,
	NumGoldStoreMod												integer 										default 0,
	NumImprovementMod											integer 										default 0,
	NumHappinessMod												integer 										default 0,
	NumHolyCitiesMod											integer 										default 0,
	NumGoldMod													integer 										default 0,
	NumFaithMod													integer 										default 0,
	NumNaturalWonderDiscoveredMod								integer 										default 0,
	NumPolicyMod												integer 										default 0,
	NumPolicyBranchMod											integer 										default 0,
	NumPopulationMod											integer 										default 0,
	NumReformMod												integer 										default 0,
	NumResourceMod												integer 										default 0,
	NumSpecialistMod											integer 										default 0,
	NumSpiesMod													integer 										default 0,
	NumStrengthMod												integer 										default 0,
	NumTheirCitiesMod											integer 										default 0,
	NumTheirStrengthMod											integer 										default 0,
	NumThisUnitClassMod											integer 										default 0,
	NumUnitClassMod												integer 										default 0,
	NumWondersMod												integer	 										default 0,
	ResourceMod													text 	REFERENCES Resources(Type) 				default NULL,
	SpecialistMod												text 	REFERENCES Specialists(Type) 			default NULL,
	YieldMod													text 	REFERENCES Yields(Type) 				default NULL,
	NumYieldMod													integer 										default 0,
	PolicyType													text	REFERENCES Policies(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Epithet_BuildingClasses (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 			default NULL,
	BuildingClassType 											text 											default NULL,
	NumBuildingClassMod											integer 										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_CivilizationTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_CivilizationTitles (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 			default NULL,
	CivilizationType  											text 	REFERENCES Civilizations(Type) 			default NULL,
	ShortDescription											text 		 									default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_ReligionTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_ReligionTitles (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 			default NULL,
	ReligionType  												text 	REFERENCES Religions(Type) 				default NULL,
	ShortDescription											text 		 									default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_ClaimMods (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type)			default NULL,
	CauseChange													integer											default 0,
	ClaimCostMod												integer											default 0,
	RequiresAllied												boolean											default 0,
	RequiresBefriended											boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_SovereigntyMods (
	EpithetType  												text 	REFERENCES JFD_Epithets(Type) 			default NULL,
	ReformCooldownMod											integer											default 0); 
--==========================================================================================================================
-- ERAS
--==========================================================================================================================
-- Eras
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Eras ADD JFD_StateReligionDiploMod					integer											default 0;
--==========================================================================================================================
-- GAME SPEEDS
--==========================================================================================================================
-- GameSpeed_JFD_PietyThresholds
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	GameSpeed_JFD_PietyThresholds (
	GameSpeedType												text 	REFERENCES GameSpeeds(Type)				default NULL,
	MaxThreshold												integer											default 0,
	PietyYieldMod												integer											default 0,
	RestingRateMod												integer											default 0);
--==========================================================================================================================
-- GOVERNMENTS
--==========================================================================================================================
-- JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Governments (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default	NULL,
	Help														text											default	NULL,
	Civilopedia													text											default	NULL,
	IconAtlas													text											default	NULL,
	PortraitIndex												intger											default	0,
	AudioEffect													text											default	NULL,
	TitleLegislature											text											default NULL,
	ChoiceImage													text											default	NULL,
	OverviewBackground											text											default	NULL,
	FactionSovMod												integer											default 0,
	LegitimacySovMod											integer											default 0,
	MaxSovChange												integer											default 0,
	ReformCooldownMod											integer											default 0,
	ReformCostMod												integer											default 0,
	FreeUnitClassType											text	REFERENCES UnitClasses(Type) 			default	NULL,
	FreeGreatPeopleCount										integer											default 0,
	RequiresBuilding											text											default NULL,	
	RequiresMinPietyLevel										text											default NULL,
	RequiresIdeology											boolean											default 0,	
	RequiresReligion											boolean											default 0,	
	IsDisabled													boolean											default 0,
	IsUnique													boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Government_ReformTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Government_ReformTitles (
	GovernmentType  											text 	REFERENCES JFD_Governments(Type) 		default NULL,
	ReformType  												text 	 										default NULL,
	TitleLeader													text											default NULL,
	TitleLeaderLate												text											default NULL,
	TitleGovernment												text											default NULL,
	TitleGovernmentShort										text											default NULL,
	UseAdjective												boolean											default 0);
--==========================================================================================================================
-- HIDE FROM PEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default NULL);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  												text 	REFERENCES Leaders(Type) 				default	NULL,
	ReformType													text											default	NULL);
--==========================================================================================================================
-- PIETY LEVELS
--==========================================================================================================================
-- JFD_PietyLevels
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PietyLevels (
	ID  														integer 									primary key autoincrement,
	Type														text										default NULL,
	Description													text										default NULL,
	ShortDescription											text										default NULL,
	Help														text										default NULL,
	ChangeHelp													text										default NULL,
	ChangeFaithCost												integer										default 0,
	ChangeResistanceTurns										integer										default 0,
	TextColor													text										default NULL,
	ConversionRate												integer										default 0,
	EventWeightModNegative										integer										default 0,
	EventWeightModPositive										integer										default 0,
	AdoptModifier												integer										default 0,
	ConversionStrengthModifier									integer										default 0,
	ReformOpinionMod											integer										default 0,
	ReligionSpreadsModifier										integer										default 0,
	RewardModifier												integer										default 0);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_PietyLevel_ActiveEffects
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PietyLevel_ActiveEffects (
	PietyLevelType												text										default NULL,
	CivilizationType											text	REFERENCES Civilizations(Type) 		default NULL,
	BuildingType												text	REFERENCES Buildings(Type)			default NULL,
	PolicyType													text	REFERENCES Policies(Type) 			default NULL,
	AltEffectHelp												text										default NULL,
	EffectHelp 													text										default NULL,
	EffectValue 												integer										default 0,
	EffectValueIsPercentDifference								integer										default 0);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_PietyLevel_GameSpeedThresholds
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PietyLevel_GameSpeedThresholds (
	PietyLevelType												text										default NULL,
	GameSpeedType 												text										default NULL,
	MaxThreshold												integer										default 0,
	MinThreshold												integer										default 0);
--==========================================================================================================================
-- POLICY BRANCH TITLES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PolicyBranchTypes ADD IconString text default NULL;
ALTER TABLE PolicyBranchTypes ADD TitleShort text default NULL;
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Policies	ADD HappinessToGoldenAgePoints			integer											default 0;
ALTER TABLE Policies	ADD JFD_ConvertAllReligions				boolean											default 0;
ALTER TABLE Policies	ADD JFD_PietyRemoveIdeologyPenalty		boolean											default 0;
ALTER TABLE Policies	ADD JFD_PietyReverseIdeologyPenalty		boolean											default 0;
ALTER TABLE Policies	ADD DoublePietyRestingRateRecovery		boolean											default 0;
ALTER TABLE Policies	ADD NoReligionLossFromPiety				boolean											default 0;
ALTER TABLE Policies	ADD WLTKDModifier						integer											default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CivilizationNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType													text 	REFERENCES Policies(Type) 				default NULL,
	CivilizationType											text 	REFERENCES Civilizations(Type) 			default NULL,
	Description													text 											default NULL,
	ShortDescription											text 											default NULL,
	Adjective													text 											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_ClaimMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	CauseChange													integer											default 0,
	ClaimCostMod												integer											default 0,
	RequiresAllied												boolean											default 0,
	RequiresBefriended											boolean											default 0,
	DignitaryChange												integer											default 0,
	MagistrateChange											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_ContractMods (
	PolicyType 													text 	REFERENCES Policies(Type)				default NULL,
	CostMod 													integer 										default 0,
	MaintenanceMod 												integer 										default 0,
	TurnsMod 													integer 										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ContractUnlocks
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Policy_ContractUnlocks (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	ContractType												text	 										default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_LeaderName
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_LeaderName (
	PolicyType													text 	REFERENCES Policies(Type) 				default NULL,
	LeaderType													text 	REFERENCES Leaders(Type) 				default NULL,
	Description													text 											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_PietyMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	PietyYieldMod												integer											default 0,
	RestingRateChange											integer											default 0,
	StateReligionAdoptMod										integer											default 0,
	StateReligionPressureMod									integer											default 0,
	IsEpithet													boolean											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_PietyYieldChanges (
	PolicyType													text 		REFERENCES Policies(Type) 			default NULL,
	OnReligiousUnitFaithPurchased								boolean											default 0,	
	Yield														integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PlagueMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_PlagueMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	PlagueMod													integer											default 0,
	PlagueTRMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_ProvinceMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	LevyFreeExperience											integer											default 0,
	LevyMaxHPChange												integer											default 0,
	ProvinceImprovementReqMod									integer											default 0,
	ProvincePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ProsperityMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_ProsperityMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	CurrencyMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_SlaveryMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_SovereigntyMods (
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	ReformBranchType											text 	 										default NULL,
	FactionSovMod												integer											default 0,
	LegitimacySovMod											integer											default 0,
	MaxSovChange												integer											default 0,
	ReformCooldownMod											integer											default 0,
	ReformCostMod												integer											default 0); 
--==========================================================================================================================
-- POLITICS
--==========================================================================================================================
-- JFD_Politics
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	PrereqGovernment											text											default NULL,
	PrereqReform												text											default NULL,
	Description													text											default	NULL,
	ShortDescription											text											default	NULL,
	Adjective													text											default	NULL,
	Help														text											default	NULL,
	HelpIdeologyPreference										text											default	NULL,
	FontIcon													text											default	NULL,
	MeterImage													text											default NULL,
	ReqsIdeology												boolean											default 0,
	ReqsNotIdeology												boolean											default	0,
	IdeologyType												text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_MinorCivTraitTypes
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_MinorCivTraitTypes (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 			default NULL,
	MinorCivTraitType  											text 										 	default NULL,
	Help														text		 									default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_FavouredReforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_FavouredReforms (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 			default NULL,
	MinorCivTraitType  											text 										 	default NULL,
	ReformBranchType  											text 	REFERENCES JFD_ReformBranches(Type) 	default NULL,
	ReformType													text	REFERENCES JFD_Reforms(Type) 			default	NULL,
	ReformAlignment												text		 									default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_OpposedReforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_OpposedReforms (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 			default NULL,
	MinorCivTraitType  											text 										 	default NULL,
	ReformBranchType  											text 	REFERENCES JFD_ReformBranches(Type) 	default NULL,
	ReformType													text	REFERENCES JFD_Reforms(Type) 			default	NULL,
	ReformAlignment												text		 									default	NULL);
--==========================================================================================================================
-- PROSPERITY
--==========================================================================================================================
-- JFD_ProsperityLevels
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ProsperityLevels (
	ID  														integer											primary key autoincrement,
	Type														text											default NULL,
	Description													text		 									default NULL,
	Help														text		 									default NULL,
	PolicyType													text	REFERENCES Policies(Type)				default NULL,
	Threshold													integer											default 0);
--==========================================================================================================================
-- PRIVY COUNCILLORS
--==========================================================================================================================
-- JFD_PrivyCouncillors
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillors (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default	NULL,
	HelpFilled													text											default	NULL,	
	HelpVacant													text											default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_Policies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_GreatPeople (
	PrivyCouncillorType  										text 	REFERENCES JFD_PrivyCouncillors(Type) 	default NULL,
	Help														text											default	NULL,
	UnitClassType												text 	 										default NULL,
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  										text 	REFERENCES JFD_PrivyCouncillors(Type) 	default NULL,
	PolicyType  												text 	REFERENCES Policies(Type) 				default NULL,
	CivilizationType											text	REFERENCES Civilizations(Type) 			default	NULL,
	CultureType													text											default	NULL,
	GovernmentType  											text 	REFERENCES JFD_Governments(Type) 		default NULL,
	ReligionType												text	REFERENCES Religions(Type) 				default	NULL,
	UniqueName													text											default	NULL);
--==========================================================================================================================
-- REFORM BRANCHES
--==========================================================================================================================
-- JFD_ReformBranches
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranches (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	ShortDescription											text											default	NULL,
	Description													text											default	NULL,
	Adjective													text											default	NULL,
	Help														text											default NULL,
	BackgroundImage												text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Alignment
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranch_Alignment (
	ReformBranchType  											text 											default NULL,
	Alignment													text											default	NULL,
	MaxRange													integer											default	0,
	MinRange													integer											default	0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Flavours
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranch_Flavours (
	ReformBranchType  											text 											default NULL,
	FlavourType													text											default	NULL,
	AltFlavourType												text											default	NULL);
--==========================================================================================================================
-- REFORMS
--==========================================================================================================================
-- JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reforms (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Cost  														integer 										default 0,
	AutocracyIndex												integer											default	0,		
	FreedomIndex												integer											default	0,		
	OrderIndex													integer											default	0,		
	ReformBranchType											text											default NULL,
	ReformFlavourType											text											default NULL,
	HeaderDescription											text											default NULL,
	HeaderHelp													text											default NULL,
	ShortDescription											text											default	NULL,
	Description													text											default NULL,
	Help														text											default	NULL,
	HelpBonus													text											default	NULL,
	HelpPenalty													text											default	NULL,
	LegislatureHelp												text											default	NULL,
	LegislatureIdeologyHelp										text											default	NULL,
	FocusIcon													text											default	NULL,
	Pedia														text											default	NULL,
	DefaultActive												boolean											default	0,
	IsDisabled													boolean											default	0,
	IsLegislature												boolean											default	0,
	IsSovereignty												boolean											default	0,
	IsTitled													boolean											default	0,
	Alignment													text											default	NULL,
	PrereqGovernment											text											default	NULL,
	PrereqReform												text											default	NULL,
	RequiresFoundedReligion										boolean											default	0,
	RequiresEnhancedReligion									boolean											default	0,
	RequiresNumCityStateFriends									integer											default	0,		
	RequiresStateReligion										boolean											default	0,
	PrereqEra													text 	REFERENCES Eras(Type) 					default NULL,
	PrereqTech													text 	REFERENCES Technologies(Type) 			default NULL,
	PrereqPolicy												text 	REFERENCES Policies(Type) 				default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 				default NULL,
	FactionSovMod												integer											default	0,		
	LegitimacySovMod											integer											default 0,
	MaxSovChange												integer											default	0,		
	AnarchySentimentMod											integer											default	0,		
	NumAnarchyTurns												integer											default	0,		
	PietyMod													integer											default	0,		
	ReformCooldownMod											integer											default	0,
	ReformCostMod												integer											default	0,
	ReformCostModPerCity										integer											default	0,
	ReformCostModPerPop											integer											default	0,
	ReformCostModPerPuppet										integer											default	0,
	ResetsLegislature											boolean											default 0,
	ResetsAssembly												boolean											default 0,
	ResetsHolySynod												boolean											default 0,
	ResetsImperialDiet											boolean											default 0,
	ResetsParliament											boolean											default 0,
	ResetsSenate												boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Legitimacies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_Legitimacies (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	Help														text											default NULL,
	SovereigntyWhenChanceries  									integer											default 0,
	SovereigntyWhenConnected  									integer											default 0,
	SovereigntyWhenExcessHappiness								integer											default 0,	
	SovereigntyWhenGarrisoned  									integer											default 0,
	SovereigntyWhenHighCourt									integer											default 0,
	SovereigntyWhenMonasteries  								integer											default 0,
	SovereigntyWhenPatriotic									integer											default 0,
	SovereigntyWhenPopulation									integer											default 0,
	SovereigntyWhenSpecialist									integer											default 0,
	SovereigntyWhenStateReligion								integer											default 0,
	SovereigntyWhenTradition									integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Negates
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_Negates (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	ReformNegateType											text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_FreePromotions (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	PromotionType												text 	REFERENCES UnitPromotions(Type) 		default NULL,
	IsCombatOnly												boolean											default 0,
	IsCivilianOnly												boolean											default 0,
	RequiresFaithPurchase										boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Yields
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_Yields (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	RequiresPeace  												boolean											default	0,
	RequiresWar  												boolean											default	0,
	YieldType													text	REFERENCES Yields(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_ClaimMods (
	ReformType 													text 	REFERENCES JFD_Reforms(Type)			default NULL,
	CauseChange													integer											default 0,
	ClaimCostMod												integer											default 0,
	RequiresAllied												boolean											default 0,
	RequiresBefriended											boolean											default 0,
	DignitaryChange												integer											default 0,
	MagistrateChange											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_ContractMods (
	ReformType 													text 	REFERENCES JFD_Reforms(Type)			default NULL,
	CostMod 													integer 										default 0,
	MaintenanceMod 												integer 										default 0,
	TurnsMod 													integer 										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_CrimeMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	CrimeType													text 		 									default NULL,
	CrimeMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_DevelopmentMods (
	ReformType  												text 											default NULL,
	DevelopmentBuildingMod										integer											default 0,
	DevelopmentImprovementMod									integer											default 0,
	DevelopmentThresholdMod										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_HealthMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	DiseaseConnectionMod										integer											default 0,
	DiseasePopMod												integer											default 0,
	DiseaseTRMod												integer											default 0,
	HealthToFoodMod												integer											default 0,
	PlagueMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_LoyaltyMods (
	ReformType  												text 		 									default NULL,
	RequiresPietyLevel											text											default NULL,
	RevoltMod													integer											default 0,
	RevoltSentimentChange										integer											default 0,
	WLTKDMod													integer											default 0,
	WLTKDSentimentChange										integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_HappinessMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	ResistanceMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_OrganizedCrimeMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	OrganizedCrimeType											text 		 									default NULL,
	ThresholdMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_PietyMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 			default NULL,
	PietyYieldMod												integer											default 0,
	RestingRateChange											integer											default 0,
	StateReligionAdoptMod										integer											default 0,
	StateReligionPressureMod									integer											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_ProvinceMods (
	ReformType  												text 		 									default NULL,
	LevyFreeExperience											integer											default 0,
	LevyMaxHPChange												integer											default 0,
	ProvinceImprovementReqMod									integer											default 0,
	ProvincePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_SlaveryMods (
	ReformType  												text 											default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0); 	
--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
-- Religions
------------------------------------------------------------
ALTER TABLE Religions ADD JFD_ReligionTheme						text											default NULL;
--------------------------------------------------------------------------------------------------------------------------	
-- Religion_SchismReligions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_SchismReligions (
	ReligionType												text	REFERENCES Religions(Type) 				default NULL,
	SchismReligionType 											text	REFERENCES Religions(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- Religion_MapColors
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_MapColors (
	ReligionType												text	REFERENCES Religions(Type) 				default NULL,
	ColorType 													text	REFERENCES Colors(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Religion_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Governments (
	ReligionType  												text 	 										default NULL,
	LegislatureName												text 		 									default NULL,
	FactionName													text 		 									default NULL,
	OfficeTitle													text											default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Religion_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Titles (
	ReligionType  												text 	 										default NULL,
	DefaultTitle												text 		 									default NULL,
	UniqueTitle													text 		 									default NULL,
	UseAdjective												boolean											default 0,					
	UseCapitalName												boolean											default 0);	
--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technologies_JFD_MiscEffects (
	TechType													text 	REFERENCES Technologies(Type) 			default NULL,	
	EffectToolTip												text											default NULL,
	PortraitIndex												integer											default	0,
	IconAtlas													text											default 'GENERIC_FUNC_ATLAS',
	UnitAction													text											default	NULL);
	
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowCurrencies			boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowGovernments			boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowHolyOrders			boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowIdeologies			boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowMercenaryContracts	boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowStateReligions		boolean									default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowSecularization		boolean									default	0;
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Trait_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_ClaimMods (
	TraitType 													text 	REFERENCES Traits(Type)					default NULL,
	CauseChange													integer											default 0,
	ClaimCostMod												integer											default 0,
	RequiresAllied												boolean											default 0,
	RequiresBefriended											boolean											default 0,
	DignitaryChange												integer											default 0,
	MagistrateChange											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ContractMods (
	TraitType 													text 	REFERENCES Traits(Type)					default NULL,
	CostMod														integer 										default 0,
	MaintenanceMod												integer 										default 0,
	TurnsMod													integer 										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_PietyMods (
	TraitType  													text 	REFERENCES Traits(Type) 				default NULL,
	PietyYieldMod												integer											default 0,
	RestingRateChange											integer											default 0,
	StateReligionAdoptMod										integer											default 0,
	StateReligionPressureMod									integer											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_SlaveryMods (
	TraitType  													text 	REFERENCES Traits(Type) 				default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_SovereigntyMods (
	TraitType 													text 	REFERENCES Traits(Type)					default NULL,
	ReformBranchType											text 	 										default NULL,
	FactionSovMod												integer											default 0,
	ReformCooldownMod											integer											default 0,
	ReformCostMod												integer											default 0); 
--==========================================================================================================================
-- UNITS CLASSES
--==========================================================================================================================
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitClass_Missions(
	UnitClassType 												text	REFERENCES UnitClasses(Type) 			default NULL,
	MissionType 												text	REFERENCES Missions(Type) 				default NULL,
	IsReclaim													boolean											default	0,
	RequiredPolicy 												text	REFERENCES Policies(Type) 				default NULL,
	RequiredTrait												text	REFERENCES Traits(Type) 				default NULL,
	RequiresCapital												boolean											default	0,
	RequiresCity												boolean											default	0,
	RequiresColonyPlot											boolean											default	0,
	RequiresGovernment											boolean											default	0,
	RequiresOccupiedOrPuppet									boolean											default	0,
	RequiresUpgradeableProvince									boolean											default	0);
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE UnitPromotions ADD JFD_Mercenary					boolean											default	0;
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_UnitDialogues
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_UnitDialogues(
	PromotionType 												text	REFERENCES UnitPromotions(Type) 		default NULL,
	UnitDialogue 												text											default NULL);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Units ADD IsSiege									boolean											default	0;
ALTER TABLE Units ADD JFD_CannnotBeMercenary					boolean											default	0;
ALTER TABLE Units ADD JFD_OnlyMercenary							boolean											default	0;
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Missions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Unit_Missions(
	UnitType 													text	REFERENCES Units(Type) 					default NULL,
	MissionType 												text	REFERENCES Missions(Type) 				default NULL,
	IsReclaim													boolean											default	0,
	RequiredPolicy 												text	REFERENCES Policies(Type) 				default NULL,
	RequiredTrait												text	REFERENCES Traits(Type) 				default NULL,
	RequiresCapital												boolean											default	0,
	RequiresCity												boolean											default	0,
	RequiresColonyPlot											boolean											default	0,
	RequiresGovernment											boolean											default	0,
	RequiresOccupiedOrPuppet									boolean											default	0,
	RequiresUpgradeableProvince									boolean											default	0);
--==========================================================================================================================
-- TOP PANEL
--==========================================================================================================================
--JFD_TopPanelIncludes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName													text											default NULL);

--This is the file from where your function to return a YieldPerTurn value will be called. This should be imported into VFS within your mod.
--------------------------------------------------------------------------------------------------------------------------	
--JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType											text	REFERENCES Civilizations(Type) 			default NULL,
	YieldType  													text 											default NULL,
	YieldSourceFunction 										text											default NULL,
	YieldSourceToolTip											text											default	NULL,
	MiscToolTipFunction											text											default	NULL);

--CivilizationType is if you want to restrict the changes to show up only for a specific civ.

--YieldType corresponds to either YIELD_GOLD, YIELD_FAITH, YIELD_JFD_PIETY, YIELD_JFD_SOVEREIGNTY, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLDEN_AGE, YIELD_TOURISM, or YIELD_HAPPINESS. 
--YIELD_TOURISM and YIELD_HAPPINESS only works with Misc Tooltips (can't add Happiness or Tourism on a per turn basis). 

--YieldSourceFunction is the function in your TopPanelIncludes table file which returns a number value corresponding to your YieldPerTurn output. These needs to be added without brackets.
--This should refer to a function within the lua file above. This function will return the value of your Yield Per Turn.
--As an example:
-- function JFD_GetHungaryGAPFromFPT(playerID)
	-- local player = Players[playerID]
	-- local mainReligionID = JFD_GetMainReligionID(playerID)
	-- local numGAPointsFromFaith = 0
	-- if player:HasReligionInMostCities(mainReligionID) then
		-- numGAPointsFromFaith = math.ceil(player:GetTotalFaithPerTurn() * 33 / 100)
	-- end

	-- return numGAPointsFromFaith
-- end

--YieldSourceToolTip is the text that goes along with the Yield output, usually telling where it comes from. Setup should be something like this:
--<Row Tag="TXT_KEY_JFD_GOLDEN_AGE_FROM_FAITH">
--	<Text>{1_Num} from being Faith Per Turn.</Text>
--</Row>
--Some texts add extra effects (like coloured text or pluses or minuses).
--Note that the text will not display on Turn 0.

-- Finally, MiscToolTipFunction should refer to a separate function within the above Lua file. This will return a converted TXT_KEY, which should have a corresponding text. This comment is placed at the very bottom of the Tooltips on the TopPanel.
-- For example:
-- function JFD_GetHungarianGoldenAges()
	-- return Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARIAN_GOLDEN_AGES")
-- end]

--If you aren't intending on including a Miscellaneous Tooltip, leave it NULL. Same goes for the CivilizationType, or any other fields which intend to be unused.
------------------------------------------------------------	
--JFD_TopPanelAdditions_PietyLevel
------------------------------------------------------------	
--CREATE TABLE IF NOT EXISTS 
--	JFD_TopPanelAdditions_PietyLevel (
--	PietyLevelRequired		text								default NULL,
--	BeliefRequired			text	REFERENCES Buildings(Type) 	default NULL,
--	BuildingRequired		text	REFERENCES Buildings(Type) 	default NULL,
--	PolicyRequired			text	REFERENCES Buildings(Type) 	default NULL,
--	PietyEffectToolTip  	text 								default NULL);

--PietyLevelRequired corresponds to which piety level the effect goes to (PIETY_JFD_DEVOUT, PIETY_JFD_VIRTUOUS, PIETY_JFD_NEUTRAL, PIETY_JFD_POOR, PIETY_JFD_HERETICAL)
--PietyEffect returns the tooltip text tag that should be shown.
--==========================================================================================================================
--==========================================================================================================================
