--==========================================================================================================================
-- CUSTOM MOD OPTIONS (CP DLL)
--==========================================================================================================================
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('API_EXTENSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('API_LUA_EXTENSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('API_PLOT_BASED_DAMAGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('AI_SECONDARY_SETTLERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('AI_SECONDARY_WORKERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_BUILDING_INVESTMENTS', 1 WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_HAPPINESS_MODIFIERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_JFD', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_MINORS', 0); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_RESOURCE_FLAVORS', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_SETTLER_ADVANCED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_VICTORY_GAME_CHANGES', 1 WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_SOCIETY_VICTORY_CHANGES_CULTURAL' AND Value = 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_NO_GAP_DURING_GA', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BUGFIX_DUMMY_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('CONFIG_GAME_IN_XML', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_ACQUIRE_BELIEFS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_AI_OVERRIDE_TECH', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_BARBARIANS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY_BOMBARD', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY_CONNECTIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CIRCUMNAVIGATION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_COMMAND', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CUSTOM_MISSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_DIPLO_MODIFIERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_ESPIONAGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_FOUND_RELIGION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOLDEN_AGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOODY_CHOICE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GREAT_PEOPLE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_LIBERATION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_MINORS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_MINORS_INTERACTION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_NEW_ERA', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_NW_DISCOVERY', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_NUCLEAR_DETONATION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_PLOT', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_RESOLUTIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_TILE_IMPROVEMENTS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_TILE_REVEALED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CAPTURE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_DATA', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_FOUNDED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_UPGRADES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_ANYTIME_GOODY_GOLD', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_CITY_FOREST_BONUS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_CITY_FOREST_BONUS_PERCENT', 125);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_CITY_WORKING', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_GREATWORK_YIELDTYPES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_LOCAL_GENERALS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('GLOBAL_TRULY_FREE_GP', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('MOD_BALANCE_CORE_POLICIES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('POLICIES_CITY_WORKING', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('RELIGION_CONVERSION_MODIFIERS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_CROSS_ICE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_CROSS_MOUNTAINS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_UNIT_NAMING', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('SHIPS_FIRE_IN_CITIES_IMPROVEMENTS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('TRAITS_ANY_BELIEF', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('UNITS_MAX_HP', 1);

--INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('CIV6_ROADS', 1);

INSERT OR REPLACE INTO COMMUNITY 
		(Type,								Value)
SELECT	'COMMUNITY_CORE_BALANCE_RELIGION',	0
AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_RELIGION');

INSERT OR REPLACE INTO COMMUNITY
		(Type,								Value)
SELECT	'COMMUNITY_CORE_BALANCE_NMCJT',		1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_NO_MORE_CIVILIAN_TRAFFIC_JAMS' AND Value = 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_MINOR_PTP_MINIMUM_VALUE', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD' AND Value = 1);

--INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'BALANCE_CORE_NEW_GP_ATTRIBUTES', 1
--WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES' AND Value = 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) SELECT 'GLOBAL_SEPARATE_GP_COUNTERS', 1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES' AND Value = 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default NULL);
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Beliefs	ADD AdditionalPantheonBelief				boolean												default 0;
ALTER TABLE Beliefs	ADD Bonus									boolean												default 0;
ALTER TABLE Beliefs	ADD DecisionDescription						text												default NULL;
ALTER TABLE Beliefs	ADD DecisionHelp							text												default NULL;
ALTER TABLE Beliefs	ADD ExperienceOnFaithPurchase				integer												default	0;
ALTER TABLE Beliefs	ADD FaithFromConstruction					boolean												default 0;
ALTER TABLE Beliefs	ADD FaithFromGrowth							boolean												default 0;
ALTER TABLE Beliefs	ADD FaithModifierDuringWonderConstruction	integer												default 0;
ALTER TABLE Beliefs	ADD FaithToDefenseRate						integer												default 0;
ALTER TABLE Beliefs	ADD FaithToHealthRate						integer												default 0;
ALTER TABLE Beliefs	ADD HalvesResistance						boolean												default 0;
ALTER TABLE Beliefs	ADD IsNoAI									boolean												default 0;
ALTER TABLE Beliefs	ADD IsPietySource							boolean												default 0;
ALTER TABLE Beliefs	ADD IsNoPietyDuringGoldenAges				boolean												default 0;
ALTER TABLE Beliefs	ADD IsNoPietyLossOtherCivs					boolean												default 0;
ALTER TABLE Beliefs	ADD MissionaryOnColony						boolean												default 0;
ALTER TABLE Beliefs	ADD OnSRGoldenAgeTurns						integer												default 0;
ALTER TABLE Beliefs	ADD OnSRFreeInnovations						integer												default 0;
ALTER TABLE Beliefs	ADD OnSRWLTKDTurns							integer												default 0;
ALTER TABLE Beliefs	ADD NumExtraMissionarySpreads				integer												default 0;
ALTER TABLE Beliefs	ADD RequiresEnhancement						boolean												default 0;
ALTER TABLE Beliefs	ADD RequiresFounding						boolean												default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Belief_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Belief_FreePromotions (
	BeliefType  												text 	REFERENCES Beliefs(Type) 					default NULL,
	PromotionType												text 	REFERENCES UnitPromotions(Type) 			default NULL,
	CombatType													text 	REFERENCES UnitCombatInfos(Type) 			default NULL,	
	DomainType													text 	REFERENCES Domains(Type) 					default NULL,	
	UnitClassType												text 	REFERENCES UnitClasses(Type) 				default NULL,	
	IsCombatOnly												boolean												default 0,
	IsCivilianOnly												boolean												default 0,
	RequiresFaithPurchase										boolean												default 0,
	Removes														boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_DecisionMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Belief_JFD_DecisionMods (
	BeliefType  												text 	REFERENCES Beliefs(Type) 					default NULL,
	ExpendedResourceType										text 	REFERENCES Resources(Type) 					default NULL,
	ExpendedResourceChange										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Belief_JFD_PietyYieldChanges (
	BeliefType													text 		REFERENCES Beliefs(Type) 				default NULL,
	RequiresAnyGreatWorkSlot									boolean												default 0,	
	RequiresGreatWorkSlotType									text		REFERENCES GreatWorkSlots(Type) 		default NULL,
	RequiresAnySpecialistType									boolean												default 0,
	RequiresSpecialistType										text		REFERENCES Specialists(Type) 			default NULL,
	RequiresWonder												boolean												default 0,	
	OnAnyGreatPersonExpended									boolean												default 0,	
	OnBuildingClassConstructed									text 		REFERENCES BuildingClasses(Type) 		default NULL,
	OnBuildingConstructed										boolean												default 0,	
	OnBuildingPurchased											boolean												default 0,	
	OnCitizenBirth												boolean												default 0,	
	OnCityConquered												boolean												default 0,	
	OnCityFounded												boolean												default 0,	
	OnGoldenAgeBegins											boolean												default 0,	
	OnMilitaryUnitFaithPurchased								boolean												default 0,	
	OnInnovationTriggered										boolean												default 0,	
	OnPolicyAdopted												boolean												default 0,	
	OnReformPassed												boolean												default 0,	
	OnTechDiscovered											boolean												default 0,	
	OnTileAcquired												boolean												default 0,	
	OnTilePurchased												boolean												default 0,	
	OnUnitClassCreated											text		REFERENCES UnitClasses(Type) 			default NULL,	
	OnUnitClassExpended											text		REFERENCES UnitClasses(Type) 			default NULL,	
	OnUnitKilled												boolean												default 0,	
	OnUnitPromoted												boolean												default 0,	
	OnWLTKD														boolean												default 0,	
	OnWorkerChargeExpended										boolean												default 0,	
	Yield														integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Belief_JFD_SlaveryMods (
	BeliefType  												text 		REFERENCES Beliefs(Type) 				default NULL,
	BarbarianMod												integer												default 0,
	CaptureMod													integer												default 0,
	EncampmentMod												integer												default 0,
	FreeExperience												integer												default 0,
	MaxHPChange													integer												default 0,
	ShackleCostMod												integer												default 0,
	TradeRouteMod												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Belief_YieldPerGAP
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Belief_YieldPerGAP (
	BeliefType  												text 		REFERENCES Beliefs(Type) 				default NULL,
	YieldType													integer												default 0,
	Yield														integer												default 0);	
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------
INSERT INTO BuildingClasses
		(Type)
VALUES	('BUILDINGCLASS_JFDLC');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
BuildingClass_ConstructionAudio (
    BuildingClassType											text    REFERENCES BuildingClasses(Type)			default NULL,
    ConstructionAudio											text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	BuildingClass_JFD_District (
	BuildingClassType  											text 		REFERENCES BuildingClasses(Type)		default NULL,
	DistrictType												text										 		default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	BuildingClass_JFD_DevelopmentMods (
	BuildingClassType  											text 		REFERENCES BuildingClasses(Type)		default NULL,
	DevelopmentChange											integer												default 0);
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Builds	ADD ActionAnimation							integer												default 1950;
ALTER TABLE Builds	ADD ChargeCost								integer												default 0;
------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ChargeExcludes
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Build_JFD_ChargeExcludes (
	BuildType													text	 											default NULL,
	RequiresPolicy  											text	 REFERENCES Policies(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ChargeCosts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Build_JFD_ChargeCosts (
	BuildType													text	 											default NULL,
	UnitType													text	 REFERENCES Units(Type) 					default NULL,
	ChargeCost  												integer												default 0,
	RequiresPolicy  											text	 REFERENCES Policies(Type) 					default NULL);
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClass_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	BuildingClass_JFD_HelpTexts (
    BuildingClassType  											text 		REFERENCES BuildingClasses(Type) 		default NULL,
	PolicyType													text		REFERENCES Policies(Type)				default NULL,
	HelpText													text												default NULL,
	IsWrittenFirst												boolean												default 0,
	NotOnceBuilt												boolean												default 0);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Buildings	ADD BombardRange						integer  											default 0;
ALTER TABLE Buildings	ADD CannotBeSold						boolean												default 0;
ALTER TABLE Buildings	ADD EffectRequiresPietyLevel			text												default 0;
ALTER TABLE Buildings	ADD EnablePietyFromConquests			boolean												default 0;
ALTER TABLE Buildings	ADD FaithToGoldenAgePoints				integer												default 0;
ALTER TABLE Buildings	ADD FreeGovernmentSwitches				integer												default 0;
ALTER TABLE Buildings	ADD FreePromotionOnFaithPurchase		text	REFERENCES UnitPromotions(Type) 			default NULL;
ALTER TABLE Buildings	ADD FreeProphetHasReformation			boolean												default 0;
ALTER TABLE Buildings	ADD FreeUnitCombatUpgrades				text	REFERENCES UnitCombatInfos(Type) 			default NULL;
ALTER TABLE Buildings	ADD FoundsGovernment					boolean												default 0;
ALTER TABLE Buildings	ADD GrantsAllEraInnovations				text	REFERENCES Eras(Type) 						default NULL;
ALTER TABLE Buildings	ADD GrantsPantheon						boolean												default 0;
ALTER TABLE Buildings	ADD GovernmentType						text												default NULL;
ALTER TABLE Buildings	ADD IsNoDiseaseFromBuildings			boolean												default 0;
ALTER TABLE Buildings	ADD IsNotCapital						boolean												default 0;
ALTER TABLE Buildings	ADD IsProvince							boolean												default 0;
ALTER TABLE Buildings	ADD IsNoPietyLossFromWar				boolean												default 0;
ALTER TABLE Buildings	ADD ProvinceUpgradeType					text												default NULL;
ALTER TABLE Buildings	ADD RemovesProvincesConnectionReq		boolean												default 0;
ALTER TABLE Buildings	ADD RequiresConnection					boolean												default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_BuildCharges (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	UnitClassType												text		REFERENCES UnitClasses(Type)			default NULL,
	NumCharges													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCityOR
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_ClassesNeededInCityOR (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	BuildingClassType											text		REFERENCES BuildingClasses(Type) 		default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_ConstructionAudio (
    BuildingType												text		REFERENCES Buildings(Type)				default NULL,
    ConstructionAudio											text												default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ClaimMods (
	BuildingType  												text 	REFERENCES Buildings(Type) 					default NULL,
	CauseChange													integer												default 0,
	ClaimCostMod												integer												default 0,
	RequiresAllied												boolean												default 0,
	RequiresBefriended											boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_CrimeMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	CrimeType													text 		 										default NULL,
	CrimeMod													integer												default 0,
	GreatWorkCrimeMod											integer												default 0,
	PopulationCrimeMod											integer												default 0,
	SpecialistCrimeMod											integer												default 0,
	IsLoyalty													boolean												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ColonyMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	AssimilateGoldReqMod  										integer 											default 0,
	AssimilatePopulationReqMod									integer												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ContractMods (
	BuildingType 												text 		REFERENCES Buildings(Type)				default NULL,
	CostMod 													integer 											default 0,
	MaintenanceMod												integer 											default 0,
	TurnsMod													integer 											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_DecisionMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_DecisionMods (
	BuildingType  												text 	REFERENCES Buildings(Type) 					default NULL,
	ExpendedResourceType										text 	REFERENCES Resources(Type) 					default NULL,
	ExpendedResourceChange										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_DevelopmentMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	DistrictType  												text 		REFERENCES JFD_Districts(Type) 			default NULL,
	DevelopmentBuildingMod										integer												default 0,
	DevelopmentDistrictMultiplier								integer												default 0,
	DevelopmentImprovementMod									integer												default 0,
	DevelopmentSpecialistMod									integer												default 0,
	DevelopmentThresholdMod										integer												default 0,
	IsGlobal													boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_District (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	DistrictType												text										 		default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_HappinessMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	HappinessToProductionMod									integer												default 0,
	ResistanceMod												integer												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_HealthMods (
	BuildingType												text		REFERENCES Buildings(Type)				default NULL,
	DiseaseConnectionMod										integer												default 0,
	DiseasePopMod												integer												default 0,
	DiseaseTRMod												integer												default 0,
	HealthToFoodMod												integer												default 0,
	PlagueMod													integer												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_JFD_HelpTexts (
    BuildingType												text    REFERENCES Buildings(Type)					default NULL,
    CivilizationType											text    REFERENCES Civilizations(Type)				default NULL,
	HelpText													text												default NULL,
	IsWrittenFirst												boolean												default 0,
	NotOnceBuilt												boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_InnovationMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_InnovationMods (
	BuildingType  												text 	REFERENCES Buildings(Type) 					default NULL,
	EraType 													text 	REFERENCES Eras(Type) 						default NULL,
	TechType 													text 	REFERENCES Technologies(Type) 				default NULL,
	NumInnovations												integer												default 0,
	ScienceBoost												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_InvestmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_InvestmentMods (
	BuildingType  												text 		REFERENCES Buildings(Type)				default NULL,
	YieldType													integer		REFERENCES Yields(Type)					default NULL,
	Yield														integer												default 0,
	IsColony													boolean												default 0,
	EraModifier													integer												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_LoyaltyMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	CitizenRevoltSentimentMod  									integer												default 0,
	CitizenWLTKDSentimentMod  									integer												default 0,
	IdeologyCitizenRevoltSentimentMod  							integer												default 0,
	IdeologyCitizenWLTKDSentimentMod  							integer												default 0,
	ReligiousCitizenRevoltSentimentMod  						integer												default 0,
	ReligiousCitizenWLTKDSentimentMod  							integer												default 0,
	RevoltMod													integer												default 0,
	RevoltSentimentChange										integer												default 0,
	WLTKDMod													integer												default 0,
	WLTKDSentimentChange										integer												default 0,
	IsLocal														boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_OrganizedCrimeMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	OrganizedCrimeType											text 										 		default NULL,
	ThresholdMod												integer												default 0,
	IsLocal														boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_PietyMods (
	BuildingType												text   	 	REFERENCES Buildings(Type)				default NULL,
	PietyYieldMod												integer												default 0,
	RestingRateChange											integer												default 0,
	StateReligionAdoptMod										integer												default 0,
	StateReligionPressureMod									integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ProvinceMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	LevyFreeExperience											integer												default 0,
	LevyMaxHPChange												integer												default 0,
	ProvinceCityModMod											integer												default 0,
	ProvinceImprovementReqMod									integer												default 0,
	ProvincePopulationReqMod									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_SlaveryMods (
	BuildingType  												text 		REFERENCES Buildings(Type)				default NULL,
	BarbarianMod												integer												default 0,
	CaptureMod													integer												default 0,
	EncampmentMod												integer												default 0,
	FreeExperience												integer												default 0,
	MaxHPChange													integer												default 0,
	ShackleCostMod												integer												default 0,
	TradeRouteMod												integer												default 0,
	IsLocal														boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_SovereigntyMods (
	BuildingType												text    REFERENCES Buildings(Type)					default NULL,
	Help														text												default NULL,
	ReformBranchType											text 	  											default NULL,
	FactionSovMod												integer												default 0,
	LegitimacySovMod											integer												default 0,
	MaxSovChange												integer												default 0,
	ReformCooldownMod											integer												default 0,
	ReformCostMod												integer												default 0,
	IsSovereignty												boolean												default 0,
	SovereigntyWhenPietyLevel									integer												default 0,
	SovereigntyWhenPietyLevelReq								text												default NULL,
	SovereigntyWhenGreatWorks									integer												default 0,
	SovereigntyWhenTradeRoutes									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SupplyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_SupplyMods (
	BuildingType												text    REFERENCES Buildings(Type)					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_TalentsMods (
	BuildingType												text    REFERENCES Buildings(Type)					default NULL,
	NumTalents													integer												default 0,
	UnitClassType												text 	REFERENCES UnitClasses(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourcePerEra
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Building_ResourcePerEra (
	BuildingType												text 												default NULL,
	ResourceType												text 												default NULL,
	Quantity													integer												default 0,
	InitialQuantity												integer												default 0);
DELETE FROM Building_ResourcePerEra;
--------------------------------------------------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingHappinessChangesUI
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Building_BuildingHappinessChangesUI (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	RequiredBuildingType  										text 		REFERENCES Buildings(Type) 				default NULL,
	HappinessChange												integer 		 									default 0,
	HappinessChangeIsBuildingCount								boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_GreatWorkChangesUI
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Building_GreatWorkChangesUI (
	BuildingType  												text 		REFERENCES Buildings(Type) 				default NULL,
	GreatWorkSlotType  											text 		 										default NULL,
	SpecialistType  											text 		 										default NULL,
	GreatPeopleRateChange										integer 		 									default 0);	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ColonialCityNames (
	CivilizationType 											text 		REFERENCES Civilizations(Type) 			default NULL,
	ColonyName 													text												default NULL,
	LinguisticType												text												default	NULL,
	CultureType													text												default	NULL);

ALTER TABLE Civilization_JFD_ColonialCityNames ADD	FortPrefix	text												default NULL;
ALTER TABLE Civilization_JFD_ColonialCityNames ADD	FortSuffix  text												default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreePolicies
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_FreePolicies (
	CivilizationType  											text 		REFERENCES Civilizations(Type) 			default NULL,
	PolicyType													text 		REFERENCES Policies(Type) 				default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	LegislatureName												text												default	NULL,
	OfficeTitle													text												default	NULL,
	GovernmentType												text												default	NULL,
	Weight														integer												default	0);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	HeadOfGovernmentName										text 	 											default NULL);

ALTER TABLE Civilization_JFD_HeadsOfGovernment ADD	IsEmperor	boolean												default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 					default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Politics
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	PoliticsType  												text 		 										default NULL,
	UniqueName													text												default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Reforms (
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	ReformType													text 									 			default NULL,
	StartsWith													boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	MinorCivilization_JFD_Titles (
	MinorCivilizationType  										text 												default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 					default NULL,
	UniqueGovernmentTitle										text 		 										default NULL,
	UniqueLeaderTitle											text 		 										default NULL);
--==========================================================================================================================
-- CLAIMS
--==========================================================================================================================
-- JFD_Claims
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Claims (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default NULL,
	Help														text												default NULL,
	CausesHelp													text												default NULL,
	CausesNeeded 												integer 											default 0,
	IconString													text												default NULL,
	GoldCostModifier											integer												default	0,
	DignitaryCost												integer												default	0,
	ResistanceModifier											integer												default	0);	
--==========================================================================================================================
-- CONTRACTS
--==========================================================================================================================
-- Contracts
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Contracts ADD PietyCost								integer 											default 0;
ALTER TABLE Contracts ADD RequiresReligionFounded				text 												default NULL;
ALTER TABLE Contracts ADD UnitCount								integer 											default 0;
ALTER TABLE Contracts ADD UnitType								text 												default NULL;
ALTER TABLE Contracts ADD YieldText								text 		 										default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- Contract_UnitClasses
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Contract_UnitClasses (
	ContractType 												text 												default NULL,
	CultureType													text 												default NULL,
	UnitClassType 												text	REFERENCES UnitClasses(Type)				default NULL,
	UseOnlyCultureType											boolean												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Contract_UnitCombats
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Contract_UnitCombats (
	ContractType 												text 												default NULL,
	CultureType													text 												default NULL,
	UnitCombatType 												text	REFERENCES UnitCombatInfos(Type)			default NULL,
	UseOnlyCultureType											boolean												default	0);
--==========================================================================================================================
-- CRIMES
--==========================================================================================================================
-- JFD_Crimes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Crimes (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	Help														text											default NULL,
	IconString													text											default NULL,
	OrganizedCrimeType,											text											default NULL,
	YieldType													text											default NULL,
	TextColour  												text 											default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OrganizedCrimes
--------------------------------------------------------------------------------------------------------------------------			
CREATE TABLE IF NOT EXISTS 
JFD_OrganizedCrimes (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	Help														text											default NULL,
	CrimeType													text											default NULL,
	YieldType													text											default NULL,
	NotificationShortDesc										text											default NULL,	
	NotificationDesc											text											default NULL,
	Threshold													integer											default 0,
	YieldMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OrganizedCrime_EraDescription
--------------------------------------------------------------------------------------------------------------------------			
CREATE TABLE IF NOT EXISTS 
JFD_OrganizedCrime_EraDescription (
	OrganizedCrimeType  										text											default NULL,
	Era  														text 		REFERENCES Eras(Type) 				default NULL,
	Description													text											default NULL);	
--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_Governments (
	CultureType  												text 												default NULL,
	LegislatureName												text												default	NULL,
	OfficeTitle													text												default	NULL,
	GovernmentType												text												default	NULL,
	Weight														integer												default	0);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_CultureType_HeadsOfGovernment	
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	JFD_CultureType_HeadsOfGovernment (	
	CultureType  												text 												default NULL,
	HeadOfGovernmentName										text 		 										default NULL,
	IsEmperor													boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_Titles (
	CultureType  												text 									 			default NULL,
	ReligionType												text 	REFERENCES Religions(Type) 					default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0);	
--==========================================================================================================================
-- DECISIONS
--==========================================================================================================================
-- JFD_WritingSystems
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_WritingSystems (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default NULL,
	Help														text												default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	IconString													text												default NULL,
	IconAtlas													text												default NULL,
	PortraitIndex												text												default NULL,	
	IsUnique													boolean												default 0);	
--==========================================================================================================================
-- DISTRICTS
--==========================================================================================================================
-- JFD_Districts
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Districts (
	ID  														integer 											primary key autoincrement,
	Type  														text										 		default NULL,
	Description													text										 		default NULL,
	Development													integer												default 0,
	DevelopmentMultiplier										integer												default 0);	
--==========================================================================================================================
-- ERAS
--==========================================================================================================================
-- Eras
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Eras ADD StateReligionDiploMod						integer												default 0;
--==========================================================================================================================
-- EPITHETS
--==========================================================================================================================
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Epithets (
	ID  														integer 						  					primary key autoincrement,
	Type 														text 												default NULL,
	Description 												text 												default NULL,
	ShortDescription 											text 												default NULL,
	Help 														text 												default NULL,
	HasFeminineAlt												boolean												default 0,
	AcquisitionChance		 									integer 											default 0,
	EventOnly													boolean												default 0,
	IsOnAggressiveWar											boolean												default 0,
	IsOnBarbarianKilled											boolean												default 0,	
	IsOnBuildingClassConstructed								boolean												default 0,
	IsOnBuildingFaithPurchased									boolean												default 0,
	IsOnBuildingPurchased										boolean												default 0,
	IsOnCityConquered											boolean												default 0,
	IsOnCityOtherReligionConquered								boolean												default 0,
	IsOnCityRazed												boolean												default 0,
	IsOnCityWLTKD												boolean												default 0,
	IsOnCityYourReligionConquered								boolean												default 0,
	IsOnCityStateBully											boolean												default 0,
	IsOnCityStateClaimed										boolean												default 0,
	IsOnCityStateLiberated										boolean												default 0,
	IsOnFirstToEra												text 	REFERENCES Eras(Type) 						default NULL,
	IsOnHolyCityCaptured										boolean												default 0,
	IsOnGoldenAge												boolean												default 0,
	IsOnMercenaryHired											boolean												default 0,
	IsOnLevyPurchased											boolean												default 0,
	IsOnNavalUnitTrained										boolean												default 0,
	IsOnNaturalWonderDiscovered									boolean												default 0,
	IsOnPolicyBranch											boolean												default 0,
	IsOnReformPassed											boolean												default 0,
	IsOnSlavePurchased											boolean												default 0,
	IsOnUnitClassBorn											text 	REFERENCES UnitClasses(Type) 				default NULL,
	IsOnUnitFaithPurchase										boolean												default 0,
	IsOnAnyWonderConstructed									boolean												default 0,
	IsOnWonderConstructed 										boolean 											default 0,
	ImprovementMod												text 	REFERENCES Improvements(Type) 				default NULL,
	NumContractsMod												integer 											default 0,
	NumCityMod													integer 											default 0,
	NumCityStateFriendsMod										integer 											default 0,
	NumCityStateReligionMod										integer 											default 0,
	NumCourthouseMod											integer 											default 0,
	NumGoldStoreMod												integer 											default 0,
	NumImprovementMod											integer 											default 0,
	NumHappinessMod												integer 											default 0,
	NumHolyCitiesMod											integer 											default 0,
	NumGoldMod													integer 											default 0,
	NumFaithMod													integer 											default 0,
	NumNaturalWonderDiscoveredMod								integer 											default 0,
	NumPolicyMod												integer 											default 0,
	NumPolicyBranchMod											integer 											default 0,
	NumPopulationMod											integer 											default 0,
	NumReformMod												integer 											default 0,
	NumResourceMod												integer 											default 0,
	NumSpecialistMod											integer 											default 0,
	NumSpiesMod													integer 											default 0,
	NumStrengthMod												integer 											default 0,
	NumTheirCitiesMod											integer 											default 0,
	NumTheirStrengthMod											integer 											default 0,
	NumThisUnitClassMod											integer 											default 0,
	NumUnitClassMod												integer 											default 0,
	NumWondersMod												integer	 											default 0,
	ResourceMod													text 	REFERENCES Resources(Type) 					default NULL,
	SpecialistMod												text 	REFERENCES Specialists(Type) 				default NULL,
	YieldMod													text 	REFERENCES Yields(Type) 					default NULL,
	NumYieldMod													integer 											default 0,
	PolicyType													text	REFERENCES Policies(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Epithet_BuildingClasses (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 				default NULL,
	BuildingClassType 											text 												default NULL,
	NumBuildingClassMod											integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_CivilizationTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_CivilizationTitles (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 				default NULL,
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default NULL,
	ShortDescription											text 		 										default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_ReligionTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_ReligionTitles (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type) 				default NULL,
	ReligionType  												text 	REFERENCES Religions(Type) 					default NULL,
	ShortDescription											text 		 										default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_ClaimMods (
	EpithetType 												text 	REFERENCES JFD_Epithets(Type)				default NULL,
	CauseChange													integer												default 0,
	ClaimCostMod												integer												default 0,
	RequiresAllied												boolean												default 0,
	RequiresBefriended											boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Epithet_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Epithet_SovereigntyMods (
	EpithetType  												text 	REFERENCES JFD_Epithets(Type) 				default NULL,
	ReformCooldownMod											integer												default 0); 
--==========================================================================================================================
-- GAME SPEEDS
--==========================================================================================================================
-- GameSpeed_JFD_PietyThresholds
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	GameSpeed_JFD_PietyThresholds (
	GameSpeedType												text 	REFERENCES GameSpeeds(Type)					default NULL,
	MaxThreshold												integer												default 0,
	PietyYieldMod												integer												default 0,
	RestingRateMod												integer												default 0);
--==========================================================================================================================
-- GOVERNMENTS
--==========================================================================================================================
-- JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Governments (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default	NULL,
	Help														text												default	NULL,
	Civilopedia													text												default	NULL,
	IconAtlas													text												default	NULL,
	PortraitIndex												intger												default	0,
	AudioEffect													text												default	NULL,
	TitleLegislature											text												default NULL,
	ChoiceImage													text												default	NULL,
	OverviewBackground											text												default	NULL,
	FactionSovMod												integer												default 0,
	LegitimacySovMod											integer												default 0,
	MaxSovChange												integer												default 0,
	ReformCooldownMod											integer												default 0,
	ReformCostMod												integer												default 0,
	FreeUnitClassType											text	REFERENCES UnitClasses(Type) 				default	NULL,
	FreeUnitClassTypeSecond										text	REFERENCES UnitClasses(Type) 				default	NULL,
	FreeGreatPeopleCount										integer												default 0,
	RequiresBuilding											text												default NULL,	
	RequiresMinPietyLevel										text												default NULL,
	RequiresIdeology											boolean												default 0,	
	RequiresReligion											boolean												default 0,	
	IsDisabled													boolean												default 0,
	IsUnique													boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Government_ReformTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Government_ReformTitles (
	GovernmentType  											text 	REFERENCES JFD_Governments(Type) 			default NULL,
	ReformType  												text 	 											default NULL,
	TitleLeader													text												default NULL,
	TitleLeaderLate												text												default NULL,
	TitleGovernment												text												default NULL,
	TitleGovernmentAdjective									text												default NULL,
	TitleGovernmentShort										text												default NULL,
	UseAdjective												boolean												default 0);
--==========================================================================================================================
-- IDEALS
--==========================================================================================================================
-- JFD_Ideals
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Ideals(
	ID  														integer 											primary key autoincrement,
	Type 														text 	 											default NULL,
	Description 												text												default NULL,
	Help														text												default NULL,
	HelpReq														text												default NULL,
	IdealTag													text												default NULL,
	PolicyType													text	REFERENCES Policies(Type) 					default NULL,
	PrereqEra													text	REFERENCES Eras(Type) 						default NULL,
	MaxValidEra													text	REFERENCES Eras(Type) 						default NULL);
------------------------------------------------------------
-- JFD_Ideals_BuildingRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_BuildingRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	BuildingType												text 	REFERENCES Buildings(Type) 					default NULL,
	BuildingClassType1											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	BuildingClassType2											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	BuildingClassType3											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	CheckAllCities												boolean												default 0,
	RequiresAllCities											boolean												default 0,
	RequiresAllConqueredCities									boolean												default 0,
	RequiresConqueredCity										boolean												default 0,
	RequiresHillsOrMountain										boolean												default 0,
	RequiresTerrainType											text 	REFERENCES Terrains(Type) 					default NULL,
	RequiresOR													boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_CityRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_CityRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	RequiresCoastalCities										boolean												default 0,
	RequiresConnections											boolean												default 0,
	RequiresConquests											boolean												default 0,
	RequiresHighestNumCoastalCities								boolean												default 0,
	RequiresColonies											boolean												default 0,
	RequiresHighestNumColonies									boolean												default 0,
	RequiresHillRoadConnections									boolean												default 0,
	RequiresFeatureType											text 	REFERENCES Features(Type) 					default NULL,
	RequiresLoyaltyType											text												default 0,
	RequiresMountainHolyCity									boolean												default 0,	
	RequiresStateReligion										boolean												default 0,
	RequiresPantheon											boolean												default 0,
	RequiresPlotType											text 	REFERENCES Plots(Type) 						default NULL,
	RequiresPuppets												boolean												default 0,
	RequiresPuppetCapitals										boolean												default 0,
	RequiresSpecialistType										text 	REFERENCES Specialists(Type) 				default NULL,
	RequiresTerrainType											text 	REFERENCES Terrains(Type) 					default NULL,
	RequiresWLTKD												boolean												default 0,	
	RequiresAllCities											boolean												default 0,
	RequiresAdjacent											boolean												default 0,
	RequiresNum													integer 											default 0,
	RequiresNumSpecialists										integer												default 0);
------------------------------------------------------------
-- JFD_Ideals_FeatureRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_FeatureRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	FeatureType1												text 	REFERENCES Features(Type) 					default NULL,
	FeatureType2												text 	REFERENCES Features(Type) 					default NULL,
	FeatureType3												text 	REFERENCES Features(Type) 					default NULL,
	RequiresAllCities											boolean												default 0,
	RequiresOR													boolean												default 0,
	RequiresNum													integer 											default 0,
	IsCapital													boolean												default 0,
	BypassOtherReqs												boolean												default 0);
------------------------------------------------------------
-- JFD_Ideals_GlobalRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_GlobalRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	RequiresAllies												boolean												default 0,
	RequiresMercContracts										boolean												default 0,
	RequiresGoldenAge											boolean												default 0,
	RequiresGovernment											boolean												default 0,
	RequiresFollowers											boolean												default 0,
	RequiresWorldFollowers										boolean												default 0,
	RequiresMaxSovereignty										boolean												default 0,
	RequiresNationalWonders										boolean												default 0,
	RequiresNaturalWonders										boolean												default 0,
	RequiresPantheon											boolean												default 0,
	RequiresPopulationConquered									boolean												default 0,
	RequiresPopulation											boolean												default 0,
	RequiresPietyLevel											text 	REFERENCES JFD_PietyLevels(Type) 			default NULL,			
	RequiresReligion											boolean												default 0,
	RequiresSocialPolicies										boolean												default 0,
	RequiresSocialPolicyBranchesFinished						boolean												default 0,
	RequiresSocialPolicyBranchesUnlocked						boolean												default 0,
	RequiresStateReligion										boolean												default 0,
	RequiresStateReligionOther									boolean												default 0,
	RequiresTechnologies										boolean												default 0,
	RequiresTechType											text 	REFERENCES Technologies(Type) 				default NULL,
	RequiresTiles												boolean												default 0,
	RequiresTilesDiscovered										boolean												default 0,
	RequiresTradeRoutes											boolean												default 0,
	RequiresTradeRoutesDiffCiv									boolean												default 0,
	RequiresTradeRoutesExternal									boolean												default 0,
	RequiresTradeRoutesInternal									boolean												default 0,
	RequiresTradeRoutesDomain									text	REFERENCES Domains(Type) 					default NULL,
	RequiresTradeRoutesSea										boolean												default 0,
	RequiresWars												boolean												default 0,
	RequiresWonders												boolean												default 0,
	RequiresWorldWonders										boolean												default 0,
	RequiresCapital												boolean												default 0,
	RequiresHighestNum											boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_GreatWorkRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_GreatWorkRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	RequiresGreatWorksType										text 	REFERENCES GreatWorkClasses(Type) 			default NULL,
	RequiresHighestNum											boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_ImprovementRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_ImprovementRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	ImprovementType1											text 	REFERENCES Improvements(Type) 				default NULL,
	ImprovementType2											text 	REFERENCES Improvements(Type) 				default NULL,
	ImprovementType3											text 	REFERENCES Improvements(Type) 				default NULL,
	ImprovementType4											text 	REFERENCES Improvements(Type) 				default NULL,
	ImprovementType5											text 												default NULL,
	ImprovementType6											text 												default NULL,
	IsGreatTileImprovement										boolean												default 0,
	RequiresAllCities											boolean												default 0,
	RequiresOR													boolean												default 0,
	RequiresNum													integer 											default 0,
	IsCapital													boolean												default 0);
------------------------------------------------------------
-- JFD_Ideals_PolicyRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_PolicyRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL);
------------------------------------------------------------
-- JFD_Ideals_ReformRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_ReformRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	ReformType1													text 	 											default NULL,
	ReformType2													text 	 											default NULL,
	RequiresOR													boolean												default 0);
------------------------------------------------------------
-- JFD_Ideals_ResourceRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_ResourceRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	ResourceType1												text 	REFERENCES Resources(Type) 					default NULL,
	ResourceType2												text 	REFERENCES Resources(Type) 					default NULL,
	ResourceType3												text 	REFERENCES Resources(Type) 					default NULL,
	ResourceType4												text 	 											default NULL,
	ResourceType5												text 	 											default NULL,
	ResourceType6												text 	 											default NULL,
	IncludesImport												boolean												default 0,
	RequiresOR													boolean												default 0,
	RequiresHighestNum											boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_SpecialistRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_SpecialistRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	SpecialistType1												text 	REFERENCES Specialists(Type) 				default NULL,
	SpecialistType2												text 	REFERENCES Specialists(Type) 				default NULL,
	SpecialistType3												text 	REFERENCES Specialists(Type) 				default NULL,
	SpecialistType4												text 	REFERENCES Specialists(Type) 				default NULL,
	CheckAllCities												boolean												default 0,
	RequiresOR													boolean												default 0,
	RequiresHighestNum											boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_UnitRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_UnitRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	RequiresLevel												integer												default 0,
	RequiresNavalUnits											boolean 											default 0,
	RequiresPromotionType										text 	REFERENCES UnitPromotions(Type) 			default NULL,
	RequiresUnitClassType1										text 	REFERENCES UnitClasses(Type) 				default NULL,
	RequiresUnitClassType2										text 	REFERENCES UnitClasses(Type) 				default NULL,
	RequiresUnitCombatType										text 	REFERENCES UnitCombatInfos(Type) 			default NULL,
	RequiresHighestNum											boolean												default 0,
	RequiresNum													integer 											default 0);
------------------------------------------------------------
-- JFD_Ideals_YieldRequirements
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Ideals_YieldRequirements (
	IdealType													text 	REFERENCES JFD_Ideals(Type) 				default NULL,
	YieldType													text 	REFERENCES Yields(Type) 					default NULL,
	RequiresHighestPerTurn										boolean 											default 0,
	RequiresHighestStored										boolean 											default 0,
	RequiresMinimumPerTurn										integer 											default 0,
	RequiresMinimumStored										integer 											default 0);

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
-- LOYALTIES
--==========================================================================================================================
-- JFD_Loyalties
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Loyalties (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default NULL,
	Help														text												default NULL,
	ShortDescription											text												default NULL,
	SoundEffect													text												default NULL,
	NotificationType											text												default NULL,
	NotificationShortDesc										text												default NULL,	
	NotificationDesc											text												default NULL,
	RevoltRate  												integer 											default 0,
	Threshold  													integer 											default 0,
	WLTKDRate  													integer 											default 0,
	IconString													text												default NULL,
	TextColour  												text 												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Loyalty_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Loyalty_CrimeMods (
	LoyaltyType  												text 	REFERENCES JFD_Loyalties(Type) 				default NULL,
	CrimeType													text 		 										default NULL,
	CrimeMod													integer												default 0);	
--==========================================================================================================================
-- MISSIONS
--==========================================================================================================================
-- Missions
------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Missions	ADD ResourceCount						integer												default 0;
ALTER TABLE Missions	ADD ResourceType						text 	REFERENCES Resources(Type)					default NULL;
ALTER TABLE Missions	ADD TalentCost							integer												default 0;
ALTER TABLE Missions	ADD TalentCostIsMax						boolean												default 0;
--------------------------------------------------------------------------------------------------------------------------	
-- Mission_Conditions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Mission_Conditions (
	MissionType													text 	REFERENCES Missions(Type)					default NULL,
	RequiresCity												boolean 											default 0,
	RequiresHolyCity											boolean 											default 0,
	RequiresGovernment											boolean 											default 0,		
	RequiresEnhancedReligionToBeVisible							boolean 											default 0,		
	RequiresNotPolicyType										text 	REFERENCES Policies(Type)					default NULL,
	RequiresStateReligion										boolean 											default 0,		
	RequiresUnitFullHP											boolean 											default 0,
	RequiresUnitFullSpreads										boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Mission_JFD_TalentCosts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Mission_JFD_TalentCosts (
	MissionType													text	 											default NULL,
	UnitType													text	 REFERENCES Units(Type) 					default NULL,
	TalentCost  												integer												default 0,
	RequiresPolicy  											text	 REFERENCES Policies(Type) 					default NULL);
--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================
-- Notificaton_AudioSoundFiles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Notificaton_AudioSoundFiles (
	NotificationType											text 	REFERENCES Notifications(NotificationType) 	default NULL,
	AudioSoundFile												text 	REFERENCES Audio_2DSounds(ScriptID) 		default NULL);
--==========================================================================================================================
-- PLAGUES
--==========================================================================================================================
-- JFD_Plagues
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Plagues (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	IsEventOnly													boolean											default 0,
	IconString													text											default NULL);
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
-- JFD_PietyLevel_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_PietyLevel_CrimeMods (
	PietyLevelType												text										default NULL,
	CrimeType													text 		 								default NULL,
	CrimeMod													integer										default 0);	
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
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PolicyBranchTypes ADD IconString text default NULL;
ALTER TABLE PolicyBranchTypes ADD TitleShort text default NULL;
------------------------------------------------------------
-- PolicyBranch_FreeFinisherPolicies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	PolicyBranch_FreeFinisherPolicies (
	PolicyBranchType											text 	REFERENCES PolicyBranchTypes(Type) 			default NULL,
	PolicyPrereqType											text 	REFERENCES Policies(Type) 					default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL);
------------------------------------------------------------
-- PolicyBranch_JFD_EraImages
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	PolicyBranch_JFD_EraImages (
	PolicyBranchType											text 	REFERENCES PolicyBranchTypes(Type) 			default NULL,
	EraType														text 	REFERENCES Eras(Type) 						default NULL,
	Image														text 												default NULL);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Policies	ADD AllowsBarbarianCampShackles			boolean												default 0;
ALTER TABLE Policies	ADD AllowsEarlyLevies					boolean												default 0;
ALTER TABLE Policies	ADD CapitalWLTKDTurns					integer												default 0;
ALTER TABLE Policies	ADD ClaimsTilesOnConquest				integer												default 0;
ALTER TABLE Policies	ADD ConvertsAllStateReligion			boolean												default 0;
ALTER TABLE Policies	ADD DoublesMountedTrained				boolean												default 0;
ALTER TABLE Policies	ADD DoublePietyRestingRateRecovery		boolean												default 0;
ALTER TABLE Policies	ADD FeatureConnections					text	REFERENCES Features(Type) 					default NULL;
ALTER TABLE Policies	ADD HappinessToGoldenAgePoints			integer												default 0;
ALTER TABLE Policies	ADD IsIdeal								boolean												default 0;
ALTER TABLE Policies 	ADD LoyaltyGarrisonLevels				integer												default 0;
ALTER TABLE Policies	ADD NoReligionLossFromPiety				boolean												default 0;
ALTER TABLE Policies	ADD NumExtraLevies						integer												default 0;
ALTER TABLE Policies	ADD PietyFromReligiousUnitPurchase		integer												default 0;
ALTER TABLE Policies	ADD RemovesUnwelcomeEvangelist			boolean												default 0;
ALTER TABLE Policies	ADD RemovesPietyIdeologyPenalty			boolean												default 0;
ALTER TABLE Policies	ADD ReversesPietyIdeologyPenalty		boolean												default 0;
ALTER TABLE Policies	ADD WLTKDModifier						integer												default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_BuildCharges (
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL,
	UnitClassType												text	REFERENCES UnitClasses(Type)				default NULL,
	NumCharges													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassGreatPeoplePointsChange
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Policy_BuildingClassGreatPeoplePointsChange (
	PolicyType													text	REFERENCES Policies(Type)					default NULL,
	BuildingClassType											text 	REFERENCES BuildingClasses(Type)			default NULL,	
	SpecialistType												text 	REFERENCES Specialists(Type)				default NULL,	
	PointsChange 												integer												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_CapitalUnitCombatFreeExperiences
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_CapitalUnitCombatFreeExperiences (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	UnitCombatType												text 	REFERENCES UnitCombatInfos(Type) 			default NULL,
	FreeExperience												integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_CapitalUnitCombatFreeMoves
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_CapitalUnitCombatFreeMoves (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	UnitCombatType												text 	REFERENCES UnitCombatInfos(Type) 			default NULL,
	FreeMoves													integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CivilizationNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_CivilizationNames (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	CivilizationType											text 	REFERENCES Civilizations(Type) 				default NULL,
	Description													text 												default NULL,
	ShortDescription											text 												default NULL,
	Adjective													text 												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_ColonyMods (
    PolicyType													text		REFERENCES Policies(Type)				default NULL,
	AssimilateGoldReqMod  										integer 											default 0,
	AssimilatePopulationReqMod									integer												default 0);	
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
-- Policy_JFD_DecisionMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_DecisionMods (
	PolicyType 													text 	REFERENCES Policies(Type)				default NULL,
	ExpendedResourceType										text 	REFERENCES Resources(Type) 				default NULL,
	ExpendedResourceChange										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_CrimeMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	CrimeType													text 												default NULL,
	CrimeMod													integer												default 0,
	GreatWorkCrimeMod											integer												default 0,
	PopulationCrimeMod											integer												default 0,
	SpecialistCrimeMod											integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_TalentsMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	UnitClassType												text		REFERENCES UnitClasses(Type)			default NULL,
	NumTalents													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuildingWithBuildingClass
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_FreeBuildingWithBuildingClass (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	BuildingType												text 	REFERENCES Buildings(Type) 					default NULL,
	BuildingClassType											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	RequiresHillsOrMountains									boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuildingWithPlotObject
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_FreeBuildingWithPlotObject (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	BuildingType												text 	REFERENCES Buildings(Type) 					default NULL,
	FeatureType													text 	REFERENCES Features(Type) 					default NULL,
	ImprovementType												text 	REFERENCES Improvements(Type) 				default NULL,
	PlotType													text 	REFERENCES Plots(Type) 						default NULL,
	TerrainType													text 	REFERENCES Terrains(Type) 					default NULL,
	ResourceType												text 	REFERENCES Resources(Type) 					default NULL,
	ReqsAdjacent												boolean												default 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuildingWithWLTKD
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_FreeBuildingWithWLTKD (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	BuildingType												text 	REFERENCES Buildings(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuildingClassWithBuildingClass
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_FreeBuildingClassWithBuildingClass (
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	BuildingClassType											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	BuildingClassTypeReq										text 	REFERENCES BuildingClasses(Type) 			default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Policy_FreePromotions	ADD IsAll					boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD IsAllCombat				boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD IsFaithPurchase			boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD IsLevy					boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD IsMercenary				boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD IsSlave					boolean												default 0;
ALTER TABLE Policy_FreePromotions	ADD UnitClassType			text	REFERENCES UnitClasses(Type) 				default NULL;
ALTER TABLE Policy_FreePromotions	ADD UnitCombatType			text	REFERENCES UnitCombatInfos(Type) 			default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_ClaimMods (
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL,
	CauseChange													integer												default 0,
	ClaimCostMod												integer												default 0,
	RequiresAllied												boolean												default 0,
	RequiresBefriended											boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_DevelopmentMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	DistrictType  												text 		REFERENCES JFD_Districts(Type) 			default NULL,
	DevelopmentBuildingMod										integer												default 0,
	DevelopmentDistrictMultiplier								integer												default 0,
	DevelopmentImprovementMod									integer												default 0,
	DevelopmentSpecialistMod									integer												default 0,
	DevelopmentThresholdMod										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_HappinessMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	HappinessToProductionMod									integer												default 0,
	ResistanceMod												integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_HealthMods (
	PolicyType													text		REFERENCES Policies(Type)				default NULL,
	DiseaseConnectionMod										integer												default 0,
	DiseasePopMod												integer												default 0,
	DiseaseTRMod												integer												default 0,
	HealthToFoodMod												integer												default 0,
	PlagueMod													integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_InnovationMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_InnovationMods (
	PolicyType													text	REFERENCES Policies(Type)					default NULL,
	EraType 													text 	REFERENCES Eras(Type) 						default NULL,
	TechType 													text 	REFERENCES Technologies(Type) 				default NULL,
	NumInnovations												integer												default 0,
	ScienceBoost												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_InvestmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_InvestmentMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	YieldType													integer		REFERENCES Yields(Type)					default NULL,
	Yield														integer												default 0,
	IsColony													boolean												default 0,
	EraModifier													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_LeaderName
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_LeaderName (
	PolicyType													text 		REFERENCES Policies(Type) 				default NULL,
	LeaderType													text 		REFERENCES Leaders(Type) 				default NULL,
	Description													text 												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_LoyaltyMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	CitizenRevoltSentimentMod  									integer												default 0,
	CitizenWLTKDSentimentMod  									integer												default 0,
	IdeologyCitizenRevoltSentimentMod  							integer												default 0,
	IdeologyCitizenWLTKDSentimentMod  							integer												default 0,
	ReligiousCitizenRevoltSentimentMod  						integer												default 0,
	ReligiousCitizenWLTKDSentimentMod  							integer												default 0,
	PuppetLoyaltyMod											integer												default 0,
	RevoltMod													integer												default 0,
	RevoltSentimentChange										integer												default 0,
	WLTKDMod													integer												default 0,
	WLTKDSentimentChange										integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_OrganizedCrimeMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	OrganizedCrimeType											text 												default NULL,
	ThresholdMod												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_PietyMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	DoublePietyRestingRateRecovery								boolean												default 0,
	NoReligionLossFromPiety										boolean												default 0,
	PietyYieldMod												integer												default 0,
	RestingRateChange											integer												default 0,
	StateReligionAdoptMod										integer												default 0,
	StateReligionPressureMod									integer												default 0,
	IsEpithet													boolean												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_ProvinceMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	LevyFreeExperience											integer												default 0,
	LevyMaxHPChange												integer												default 0,
	ProvinceImprovementReqMod									integer												default 0,
	ProvinceCityModMod											integer												default 0,
	ProvincePopulationReqMod									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_SlaveryMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	BarbarianMod												integer												default 0,
	CaptureMod													integer												default 0,
	EncampmentMod												integer												default 0,
	FreeExperience												integer												default 0,
	MaxHPChange													integer												default 0,
	ShackleCostMod												integer												default 0,
	TradeRouteMod												integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_SovereigntyMods (
	PolicyType  												text 		REFERENCES Policies(Type) 				default NULL,
	ReformBranchType											text 	 											default NULL,
	FactionSovMod												integer												default 0,
	LegitimacySovMod											integer												default 0,
	MaxSovChange												integer												default 0,
	ReformCooldownMod											integer												default 0,
	ReformCostMod												integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SupplyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_SupplyMods (
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistSentimentChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_SpecialistSentimentChanges (
    PolicyType													text		REFERENCES Policies(Type)				default NULL,
	SpecialistType  											text		REFERENCES Specialists(Type)			default NULL,
	RevoltSentimentChange										integer												default 0,
	WLTKDSentimentChange										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_TalentsMods (
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL,
	NumTalents													integer												default 0,
	UnitClassType												text 	REFERENCES UnitClasses(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatFreeExperiences
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Policy_UnitCombatFreeExperiences ADD FreeExperienceInstant integer default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatFreeExperiencesPerGreatWork
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_UnitCombatFreeExperiencesPerGreatWork (
	PolicyType													text 		REFERENCES Policies(Type) 				default NULL,
	UnitCombatType												text 		REFERENCES UnitCombatInfos(Type) 		default NULL,
	GreatWorkSlotType											text 		REFERENCES GreatWorkSlots(Type) 		default NULL,
	FreeExperience												integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromBuildingClassConstructed
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_YieldFromBuildingClassConstructed (
	PolicyType													text 		REFERENCES Policies(Type) 				default NULL,
	BuildingClassType											text 		REFERENCES BuildingClasses(Type) 		default NULL,
	YieldType													text 		REFERENCES Yields(Type) 				default NULL,
	Yield														integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromUnitPromoted
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_YieldFromUnitPromoted (
	PolicyType													text 		REFERENCES Policies(Type) 				default NULL,
	YieldType													text 		REFERENCES Yields(Type) 				default NULL,
	Yield														integer 											default 0);
--==========================================================================================================================
-- POLITICS
--==========================================================================================================================
-- JFD_Politics
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Politics (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	PrereqGovernment											text												default NULL,
	PrereqReform												text												default NULL,
	Description													text												default	NULL,
	ShortDescription											text												default	NULL,
	Adjective													text												default	NULL,
	Help														text												default	NULL,
	HelpIdeologyPreference										text												default	NULL,
	FontIcon													text												default	NULL,
	MeterImage													text												default NULL,
	IsEmperor													boolean												default 0,
	ReqsIdeology												boolean												default 0,
	ReqsNotIdeology												boolean												default	0,
	IdeologyType												text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_MinorCivTraitTypes
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_MinorCivTraitTypes (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 				default NULL,
	MinorCivTraitType  											text 										 		default NULL,
	Help														text		 										default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_FavouredReforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_FavouredReforms (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 				default NULL,
	MinorCivTraitType  											text 										 		default NULL,
	ReformBranchType  											text 	REFERENCES JFD_ReformBranches(Type) 		default NULL,
	ReformType													text	REFERENCES JFD_Reforms(Type) 				default	NULL,
	ReformAlignment												text		 										default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Politics_OpposedReforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Politics_OpposedReforms (
	PoliticsType  												text 	REFERENCES JFD_Politics(Type) 				default NULL,
	MinorCivTraitType  											text 										 		default NULL,
	ReformBranchType  											text 	REFERENCES JFD_ReformBranches(Type) 		default NULL,
	ReformType													text	REFERENCES JFD_Reforms(Type) 				default	NULL,
	ReformAlignment												text		 										default	NULL);
--==========================================================================================================================
-- PRIVY COUNCILLORS
--==========================================================================================================================
-- JFD_PrivyCouncillors
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillors (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default	NULL,
	HelpFilled													text												default	NULL,	
	HelpVacant													text												default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_Policies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_GreatPeople (
	PrivyCouncillorType  										text 	REFERENCES JFD_PrivyCouncillors(Type) 		default NULL,
	Help														text												default	NULL,
	UnitClassType												text 	 											default NULL,
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  										text 	REFERENCES JFD_PrivyCouncillors(Type) 		default NULL,
	PolicyType  												text 	REFERENCES Policies(Type) 					default NULL,
	CivilizationType											text	REFERENCES Civilizations(Type) 				default	NULL,
	CultureType													text												default	NULL,
	GovernmentType  											text 	REFERENCES JFD_Governments(Type) 			default NULL,
	ReligionType												text	REFERENCES Religions(Type) 					default	NULL,
	UniqueName													text												default	NULL);
--==========================================================================================================================
-- PROCESSES
--==========================================================================================================================
-- Processes
------------------------------------------------------------	
ALTER TABLE Processes ADD RequiresCoast boolean default 0;
--==========================================================================================================================
-- PROSPERITY
--==========================================================================================================================
-- JFD_ProsperityLevels
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ProsperityLevels (
	ID  														integer												primary key autoincrement,
	Type														text												default NULL,
	Description													text		 										default NULL,
	Help														text		 										default NULL,
	PolicyType													text	REFERENCES Policies(Type)					default NULL,
	Threshold													integer												default 0);
--==========================================================================================================================
-- PROVINCES
--==========================================================================================================================
-- JFD_Provinces
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Provinces (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default NULL,
	DescriptionAlt												text												default NULL,
	Help														text												default NULL,
	BuildingType												text 		REFERENCES Buildings(Type) 				default NULL,
	BuildingDescription											text												default NULL,
	DefaultRulerTitle											text												default NULL,
	DefaultRulerTitleAlt										text												default NULL,
	BombardRange												integer												default 0,
	BorderModifier												integer												default 0,
	DevelopmentThresholdMod										integer												default 0,
	GovernorDevelopmentYield									integer												default 0,
	IsTownBonus													boolean												default 0,
	IsVillageBonus												boolean												default 0,
	NumImprovementRequired										integer												default 0,
	NumPopulationRequired										integer												default 0,
	NumUnitsSpawned												integer												default 0,
	NumUnitsSpawnedAI											integer												default 0,
	NumUnitsXP													integer												default 0,
	OrganizedCrimeMod											integer												default 0,
	UpgradeProvinceType											text		REFERENCES JFD_Provinces(Type) 			default NULL,
	IconString													text												default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  											text 		REFERENCES Civilizations(Type) 			default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 				default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0);		
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_ProvinceTitles (
	CultureType													text 		 										default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 				default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Government_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Government_ProvinceTitles (
	GovernmentType												text 		 										default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 				default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0);	
--==========================================================================================================================
-- REFORM BRANCHES
--==========================================================================================================================
-- JFD_ReformBranches
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranches (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	ShortDescription											text												default	NULL,
	Description													text												default	NULL,
	Adjective													text												default	NULL,
	Help														text												default NULL,
	BackgroundImage												text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Alignment
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranch_Alignment (
	ReformBranchType  											text 												default NULL,
	Alignment													text												default	NULL,
	MaxRange													integer												default	0,
	MinRange													integer												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Flavours
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_ReformBranch_Flavours (
	ReformBranchType  											text 												default NULL,
	FlavourType													text												default	NULL,
	AltFlavourType												text												default	NULL);
--==========================================================================================================================
-- REFORMS
--==========================================================================================================================
-- JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Reforms (
	ID  														integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Cost  														integer 											default 0,
	AutocracyIndex												integer												default	0,		
	FreedomIndex												integer												default	0,		
	OrderIndex													integer												default	0,		
	ReformBranchType											text												default NULL,
	ReformFlavourType											text												default NULL,
	HeaderDescription											text												default NULL,
	HeaderHelp													text												default NULL,
	ShortDescription											text												default	NULL,
	Description													text												default NULL,
	Help														text												default	NULL,
	HelpBonus													text												default	NULL,
	HelpPenalty													text												default	NULL,
	LegislatureHelp												text												default	NULL,
	LegislatureIdeologyHelp										text												default	NULL,
	FocusIcon													text												default	NULL,
	Pedia														text												default	NULL,
	DefaultActive												boolean												default	0,
	IsDisabled													boolean												default	0,
	IsLegislature												boolean												default	0,
	IsSovereignty												boolean												default	0,
	IsTitled													boolean												default	0,
	Alignment													text												default	NULL,
	PrereqGovernment											text												default	NULL,
	PrereqReform												text												default	NULL,
	RequiresFoundedReligion										boolean												default	0,
	RequiresEnhancedReligion									boolean												default	0,
	RequiresNumCityStateFriends									integer												default	0,		
	RequiresStateReligion										boolean												default	0,
	PrereqEra													text 	REFERENCES Eras(Type) 						default NULL,
	PrereqTech													text 	REFERENCES Technologies(Type) 				default NULL,
	PrereqPolicy												text 	REFERENCES Policies(Type) 					default NULL,
	PolicyType													text 	REFERENCES Policies(Type) 					default NULL,
	FactionSovMod												integer												default	0,		
	LegitimacySovMod											integer												default 0,
	MaxSovChange												integer												default	0,		
	AnarchySentimentMod											integer												default	0,		
	NumAnarchyTurns												integer												default	0,		
	PietyMod													integer												default	0,		
	ReformCooldownMod											integer												default	0,
	ReformCostMod												integer												default	0,
	ReformCostModPerCity										integer												default	0,
	ReformCostModPerPop											integer												default	0,
	ReformCostModPerPuppet										integer												default	0,
	ResetsLegislature											boolean												default 0,
	ResetsAssembly												boolean												default 0,
	ResetsHolySynod												boolean												default 0,
	ResetsImperialCourt											boolean												default 0,
	ResetsImperialDiet											boolean												default 0,
	ResetsParliament											boolean												default 0,
	ResetsSenate												boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Legitimacies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Reform_Legitimacies (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	Help														text												default NULL,
	SovereigntyWhenChanceries  									integer												default 0,
	SovereigntyWhenConnected  									integer												default 0,
	SovereigntyWhenExcessHappiness								integer												default 0,	
	SovereigntyWhenGarrisoned  									integer												default 0,
	SovereigntyWhenHighCourt									integer												default 0,
	SovereigntyWhenMonasteries  								integer												default 0,
	SovereigntyWhenPatriotic									integer												default 0,
	SovereigntyWhenPopulation									integer												default 0,
	SovereigntyWhenSpecialist									integer												default 0,
	SovereigntyWhenStateReligion								integer												default 0,
	SovereigntyWhenTradition									integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Negates
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Reform_Negates (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	ReformNegateType											text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Reform_FreePromotions (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	PromotionType												text 	REFERENCES UnitPromotions(Type) 			default NULL,
	IsCombatOnly												boolean												default 0,
	IsCivilianOnly												boolean												default 0,
	RequiresFaithPurchase										boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Yields
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Reform_Yields (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	RequiresPeace  												boolean												default	0,
	RequiresWar  												boolean												default	0,
	YieldType													text	REFERENCES Yields(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_BuildCharges (
	ReformType													text	 											default NULL,
	UnitClassType												text		REFERENCES UnitClasses(Type)			default NULL,
	NumCharges													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
JFD_Reform_ColonyMods (
    ReformType													text	 											default NULL,
	AssimilateGoldReqMod  										integer 											default 0,
	AssimilatePopulationReqMod									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_ContractMods (
	ReformType 													text 	REFERENCES JFD_Reforms(Type)				default NULL,
	CostMod 													integer 											default 0,
	MaintenanceMod 												integer 											default 0,
	TurnsMod 													integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_ClaimMods (
	ReformType 													text 	REFERENCES JFD_Reforms(Type)				default NULL,
	CauseChange													integer												default 0,
	ClaimCostMod												integer												default 0,
	RequiresAllied												boolean												default 0,
	RequiresBefriended											boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_CrimeMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	CrimeType													text 		 										default NULL,
	CrimeMod													integer												default 0,
	GreatWorkCrimeMod											integer												default 0,
	PopulationCrimeMod											integer												default 0,
	SpecialistCrimeMod											integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DecisionMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_DecisionMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	ExpendedResourceType										text 	REFERENCES Resources(Type) 					default NULL,
	ExpendedResourceChange										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_DevelopmentMods (
	ReformType  												text 												default NULL,
	DistrictType  												text 		REFERENCES JFD_Districts(Type) 			default NULL,
	DevelopmentBuildingMod										integer												default 0,
	DevelopmentDistrictMultiplier								integer												default 0,
	DevelopmentImprovementMod									integer												default 0,
	DevelopmentSpecialistMod									integer												default 0,
	DevelopmentThresholdMod										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_HappinessMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	HappinessToProductionMod									integer												default 0,
	ResistanceMod												integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_HealthMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	DiseaseConnectionMod										integer												default 0,
	DiseasePopMod												integer												default 0,
	DiseaseTRMod												integer												default 0,
	HealthToFoodMod												integer												default 0,
	PlagueMod													integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_InvestmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_InvestmentProduction (
	ReformType  												text 								 				default NULL,
	YieldType													integer		REFERENCES Yields(Type)					default NULL,
	Yield														integer												default 0,
	IsColony													boolean												default 0,
	EraModifier													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_LoyaltyMods (
	ReformType  												text 		 										default NULL,
	RequiresPietyLevel											text												default NULL,
	CitizenRevoltSentimentMod  									integer												default 0,
	CitizenWLTKDSentimentMod  									integer												default 0,
	IdeologyCitizenRevoltSentimentMod  							integer												default 0,
	IdeologyCitizenWLTKDSentimentMod  							integer												default 0,
	ReligiousCitizenRevoltSentimentMod  						integer												default 0,
	ReligiousCitizenWLTKDSentimentMod  							integer												default 0,
	RevoltMod													integer												default 0,
	RevoltSentimentChange										integer												default 0,
	WLTKDMod													integer												default 0,
	WLTKDSentimentChange										integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_OrganizedCrimeMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	OrganizedCrimeType											text 		 										default NULL,
	ThresholdMod												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_PietyMods (
	ReformType  												text 	REFERENCES JFD_Reforms(Type) 				default NULL,
	PietyYieldMod												integer												default 0,
	RestingRateChange											integer												default 0,
	StateReligionAdoptMod										integer												default 0,
	StateReligionPressureMod									integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_ProvinceMods (
	ReformType  												text 		 										default NULL,
	LevyFreeExperience											integer												default 0,
	LevyMaxHPChange												integer												default 0,
	ProvinceCityModMod											integer												default 0,
	ProvinceImprovementReqMod									integer												default 0,
	ProvincePopulationReqMod									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_SlaveryMods (
	ReformType  												text 												default NULL,
	BarbarianMod												integer												default 0,
	CaptureMod													integer												default 0,
	EncampmentMod												integer												default 0,
	FreeExperience												integer												default 0,
	MaxHPChange													integer												default 0,
	ShackleCostMod												integer												default 0,
	TradeRouteMod												integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_SupplyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_SupplyMods (
	ReformType  												text 												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_Reform_TalentsMods (
	ReformType  												text 												default NULL,
	NumTalents													integer												default 0,
	UnitClassType												text 	REFERENCES UnitClasses(Type) 				default NULL);
--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
-- Religion_FoundingAudios
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_FoundingAudios (
	ReligionType												text							 					default NULL,
	AudioSound		 											text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Religion_HeresyReligions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_HeresyReligions (
	ReligionType												text	REFERENCES Religions(Type) 					default NULL,
	HeresyReligionType 											text	REFERENCES Religions(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Religion_SchismReligions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_SchismReligions (
	ReligionType												text	REFERENCES Religions(Type) 					default NULL,
	SchismReligionType 											text	REFERENCES Religions(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- Religion_MapColors
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_MapColors (
	ReligionType												text	REFERENCES Religions(Type) 					default NULL,
	ColorType 													text	REFERENCES Colors(Type) 					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Religion_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Governments (
	ReligionType  												text 	 											default NULL,
	LegislatureName												text 		 										default NULL,
	FactionName													text 		 										default NULL,
	OfficeTitle													text												default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Religion_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Titles (
	ReligionType  												text 	 											default NULL,
	DefaultTitle												text 		 										default NULL,
	UniqueTitle													text 		 										default NULL,
	UseAdjective												boolean												default 0,					
	UseCapitalName												boolean												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Religion_YieldTypes
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_YieldTypes (
	ReligionType												text	REFERENCES Religions(Type) 					default NULL,
	YieldType,													text												default NULL);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
------------------------------------------------------------
ALTER TABLE Resources 		ADD Decisions						boolean 											default 0;
ALTER TABLE Resources 		ADD Lakes							boolean 											default 0;
ALTER TABLE Resources 		ADD Rivers							boolean 											default 0;
------------------------------------------------------------
-- Resource_JFD_RarityMods
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Resource_JFD_RarityMods (
	ResourceType												text 	REFERENCES Resources(Type) 					default NULL,	
	RarityMod													integer												default 0);
--==========================================================================================================================
-- SPECIALISTS
--==========================================================================================================================
-- SPECIALISTS
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Specialists 	ADD FontIcon						text												default '[ICON_GREAT_PEOPLE]';
ALTER TABLE Specialists 	ADD IsNoBaseCrime					boolean												default 0;
ALTER TABLE Specialists 	ADD OrderPriority					integer												default 0;
--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Technologies ADD ExtraWorkBoatBuildCharges			integer												default 0;
ALTER TABLE Technologies ADD Innovations						integer												default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Technology_JFD_Innovations
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technology_JFD_Innovations(
	TechType 													text 	 											default NULL,
	Help														text												default NULL,
	BuildingConstructed											boolean	 											default 0,
	CitizenBorn													boolean	 											default 0,
	CityFounded													boolean	 											default 0,
	CityStateAllied												boolean	 											default 0,
	CivilizationMet												boolean	 											default 0,
	FaithSpent													boolean	 											default 0,	
	GreatPersonExpended											boolean	 											default 0,	
	ImprovementBuilt											boolean	 											default 0,	
	ImprovementChanged											boolean	 											default 0,	
	InvestmentMade												boolean	 											default 0,	
	LegislatureFormed											boolean	 											default 0,	
	LoyaltyWLTKDStarted											boolean	 											default 0,	
	GoldSpent													boolean	 											default 0,	
	NaturalWonderDiscovered										boolean	 											default 0,
	NuclearBombDenoted											boolean	 											default 0,
	TileAcquired												boolean	 											default 0,
	TileDiscovered												boolean	 											default 0,
	TileTraversed												boolean	 											default 0,
	PantheonFounded												boolean	 											default 0,
	PlagueBegins												boolean	 											default 0,
	ProjectFinished												boolean	 											default 0,
	PolicyAdopted												boolean	 											default 0,
	PolicyBranchOpened											boolean	 											default 0,
	ReformPassed												boolean	 											default 0,
	ReligionEnhanced											boolean	 											default 0,
	ReligionFounded												boolean	 											default 0,
	ReligionReformed											boolean	 											default 0,
	ResolutionPassed											boolean	 											default 0,
	TechResearched												boolean	 											default 0,
	UnitKilled													boolean	 											default 0,
	UnitPromoted												boolean	 											default 0,
	UnitTrained													boolean	 											default 0,
	UnitUpgraded												boolean	 											default 0,
	WarDeclaredTo												boolean	 											default 0,	
	IsAdjacentFeatureType										text 	REFERENCES Features(Type) 					default NULL,	
	IsAdjacentPlotType											text 	REFERENCES Plots(Type) 						default NULL,
	IsAdjacentTerrainType										text 	REFERENCES Terrains(Type) 					default NULL,	
	IsAny														boolean	 											default 0,
	IsBarbarian													boolean	 											default 0,
	IsColony													boolean	 											default 0,
	IsFaithSpent												boolean	 											default 0,	
	IsFinisher													boolean	 											default 0,	
	IsForeignContinent											boolean	 											default 0,
	IsGoldSpent													boolean	 											default 0,
	IsMajor														boolean	 											default 0,
	IsMinor														boolean	 											default 0,
	IsProduced													boolean	 											default 0,
	IsNationalWonder											boolean	 											default 0,
	IsNotWonder													boolean	 											default 0,
	IsSpecialist												boolean	 											default 0,
	IsWonder													boolean	 											default 0,
	IsWorldWonder												boolean	 											default 0,
	BuildingClassType											text 	REFERENCES BuildingClasses(Type) 			default NULL,
	CultureType													text 												default NULL,
	EraType														text 	REFERENCES Eras(Type) 						default NULL,
	DomainType													text 	REFERENCES Domains(Type) 					default NULL,
	FreeInnovations												integer												default 0,
	ImprovementType												text 	REFERENCES Improvements(Type) 				default NULL,
	Population													integer												default 0,
	ProjectType													text 	REFERENCES Projects(Type) 					default NULL,
	ResolutionType												text 	REFERENCES Resolutions(Type) 				default NULL,
	ResourceType												text 	REFERENCES Resources(Type) 					default NULL,
	ReqTechType													text 	REFERENCES Technologies(Type) 				default NULL,
	TerrainType													text 	REFERENCES Terrains(Type) 					default NULL,
	UnitClassType												text 	REFERENCES UnitClasses(Type) 				default NULL,
	UnitCombatType												text 	REFERENCES UnitCombatInfos(Type) 			default NULL,
	ScienceBoost												integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_FreeUnitTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technologies_JFD_FreeUnitTypes (
	TechType													text 	REFERENCES Technologies(Type) 				default NULL,	
	UnitClassType												text	REFERENCES UnitClasses(Type) 				default NULL,	
	UnitType													text	REFERENCES Units(Type) 						default NULL,	
	IsFirst														boolean												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technologies_JFD_MiscEffects (
	TechType													text 	REFERENCES Technologies(Type) 				default NULL,	
	EffectToolTip												text												default NULL,
	PortraitIndex												integer												default	0,
	IconAtlas													text												default 'GENERIC_FUNC_ATLAS',
	UnitAction													text												default	NULL);
	
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowCurrencies			boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowGovernments			boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowHolyOrders			boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowIdeologies			boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowLevies				boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowMercenaryContracts	boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowStateReligions		boolean										default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowSecularization		boolean										default	0;
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Traits ADD FreeInnovationOnSpecialistConstructedInCapital	integer										default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_BuildCharges (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	UnitClassType												text	REFERENCES UnitClasses(Type)				default NULL,
	NumCharges													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ClaimMods (
	TraitType 													text 	REFERENCES Traits(Type)						default NULL,
	CauseChange													integer												default 0,
	ClaimCostMod												integer												default 0,
	RequiresAllied												boolean												default 0,
	RequiresBefriended											boolean												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Trait_JFD_ColonyMods (
    TraitType													text		REFERENCES Traits(Type)					default NULL,
	AssimilateGoldReqMod  										integer 											default 0,
	AssimilatePopulationReqMod									integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ContractMods (
	TraitType 													text 	REFERENCES Traits(Type)						default NULL,
	CostMod														integer 											default 0,
	MaintenanceMod												integer 											default 0,
	TurnsMod													integer 											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_CrimeMods (
	TraitType  													text 		REFERENCES Traits(Type) 				default NULL,
	CrimeType													text 												default NULL,
	CrimeMod													integer												default 0,
	GreatWorkCrimeMod											integer												default 0,
	PopulationCrimeMod											integer												default 0,
	SpecialistCrimeMod											integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_GreatPeoplePointsFromConqueredCities
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_GreatPeoplePointsFromConqueredCities (
	TraitType 													text 		REFERENCES Traits(Type)					default NULL,
	SpecialistType												text 		REFERENCES Specialists(Type)			default NULL,	
	IsCapitalOnly												boolean												default 0,
	PointsChange 												integer												default	0,
	CapitalPointsChange											integer												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_DecisionMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_DecisionMods (
	TraitType 													text 		REFERENCES Traits(Type)					default NULL,
	ExpendedResourceType										text 		REFERENCES Resources(Type) 				default NULL,
	ExpendedResourceChange										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_DevelopmentMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	DistrictType  												text 		REFERENCES JFD_Districts(Type) 			default NULL,
	DevelopmentBuildingMod										integer												default 0,
	DevelopmentDistrictMultiplier								integer												default 0,
	DevelopmentImprovementMod									integer												default 0,
	DevelopmentSpecialistMod									integer												default 0,
	DevelopmentThresholdMod										integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_HappinessMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	HappinessToProductionMod									integer												default 0,
	ResistanceMod												integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_HealthMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	DiseaseConnectionMod										integer												default 0,
	DiseasePopMod												integer												default 0,
	DiseaseTRMod												integer												default 0,
	HealthToFoodMod												integer												default 0,
	PlagueMod													integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_InnovationMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_InnovationMods (
	TraitType  													text 	REFERENCES Traits(Type) 					default NULL,
	EraType 													text 	REFERENCES Eras(Type) 						default NULL,
	TechType 													text 	REFERENCES Technologies(Type) 				default NULL,
	NumInnovations												integer												default 0,
	ScienceBoost												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_InvestmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_InvestmentMods (
	TraitType  													text 		REFERENCES Traits(Type) 				default NULL,
	YieldType													integer		REFERENCES Yields(Type)					default NULL,
	Yield														integer												default 0,
	IsColony													boolean												default 0,
	EraModifier													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_LoyaltyMods (
	TraitType  													text 		REFERENCES Traits(Type) 				default NULL,
	RevoltMod													integer												default 0,
	RevoltSentimentChange										integer												default 0,
	WLTKDMod													integer												default 0,
	WLTKDSentimentChange										integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_OrganizedCrimeMods (
	TraitType  													text 		REFERENCES Traits(Type) 				default NULL,
	OrganizedCrimeType											text 												default NULL,
	ThresholdMod												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_PietyMods (
	TraitType  													text 	REFERENCES Traits(Type) 					default NULL,
	PietyYieldMod												integer												default 0,
	RestingRateChange											integer												default 0,
	StateReligionAdoptMod										integer												default 0,
	StateReligionPressureMod									integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ProvinceMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	LevyFreeExperience											integer												default 0,
	LevyMaxHPChange												integer												default 0,
	ProvinceCityModMod											integer												default 0,
	ProvinceImprovementReqMod									integer												default 0,
	ProvincePopulationReqMod									integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_SlaveryMods (
	TraitType  													text 		REFERENCES Traits(Type) 				default NULL,
	BarbarianMod												integer												default 0,
	CaptureMod													integer												default 0,
	EncampmentMod												integer												default 0,
	FreeExperience												integer												default 0,
	MaxHPChange													integer												default 0,
	ShackleCostMod												integer												default 0,
	TradeRouteMod												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_SovereigntyMods (
	TraitType 													text 		REFERENCES Traits(Type)					default NULL,
	ReformBranchType											text 	 											default NULL,
	FactionSovMod												integer												default 0,
	ReformCooldownMod											integer												default 0,
	ReformCostMod												integer												default 0); 
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SupplyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_SupplyMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_TalentsMods (
	TraitType													text		REFERENCES Traits(Type)					default NULL,
	NumTalents													integer												default 0,
	UnitClassType												text 		REFERENCES UnitClasses(Type) 			default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_YieldChangesFromPillagedTiles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_YieldChangesFromPillagedTiles (
	TraitType 													text 		REFERENCES Traits(Type)					default NULL,
	BuildingType												text 		REFERENCES Buildings(Type)				default NULL,	
	Yieldtype 													text		REFERENCES Yields(Type)					default NULL,
	Yield														integer												default	NULL,
	RequiresUnit												boolean												default 0);
--==========================================================================================================================
-- TUTORIALS
--==========================================================================================================================
-- CustomTutorialLevels
--------------------------------------------------------------------------------------------------------------------------
--Additional addins for the Options Menu
CREATE TABLE IF NOT EXISTS 
CustomTutorialLevels (
	Description													text												default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- CustomTutorials
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
CustomTutorials (
	ID		 													integer 											primary key autoincrement,
	Type  														text 												default NULL,
	Description													text												default	NULL,
	Help														text												default	NULL,
	Civilopedia													text												default	NULL,
	AdvisorType													text												default	NULL,
	ConceptType													text												default	NULL,
	AudioSound													text												default	NULL,
	DoNotRepeat													boolean												default	0);
--------------------------------------------------------------------------------------------------------------------------
-- CustomTutorial_Questions
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
CustomTutorial_Questions (
	TutorialType  												text 												default NULL,
	LinkedTutorialType  										text 												default NULL,
	Description													text												default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- CustomTutorial_Triggers
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
CustomTutorial_Triggers (
	TutorialType  												text 												default NULL,
	IsOnBuildingConstructed										boolean												default	0,
	IsOnCanInvest												boolean												default	0,
	IsOnCanSecularize											boolean												default	0,
	IsOnCapitalFounded											boolean												default	0,
	IsOnCityOtherFounded										boolean												default	0,
	IsOnChooseBeliefPopupFounder								boolean												default	0,
	IsOnColonyFounded											boolean												default	0,
	IsOnDecisionAvailable										boolean												default	0,
	IsOnDevelopmentDeficit										boolean												default	0,
	IsOnDevelopmentSurplus										boolean												default	0,
	IsOnEpithet													boolean												default	0,
	IsOnFreeReform												boolean												default	0,
	IsOnGreatPersonCreated										boolean												default	0,
	IsOnInnovation												boolean												default	0,
	IsOnPlague													boolean												default	0,
	IsOnShackles												boolean												default	0,
	IsOnStateReligion											boolean												default	0,
	IsOnSocialPolicyScreen										boolean												default	0,
	IsOnUnitClassTrained										text 		REFERENCES UnitClasses(Type)			default NULL);
--==========================================================================================================================
-- UNITS CLASSES
--==========================================================================================================================
-- UnitClass_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
UnitClass_JFD_BuildCharges (
	UnitClassType 												text		REFERENCES UnitClasses(Type) 			default NULL,
	NumCharges  												integer 											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_Missions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitClass_Missions(
	UnitClassType 												text	REFERENCES UnitClasses(Type) 				default NULL,
	MissionType 												text	REFERENCES Missions(Type) 					default NULL,
	RequiresBeliefType											text 	REFERENCES Beliefs(Type)					default NULL,
	RequiresPromotionType										text 	REFERENCES UnitPromotions(Type)				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- UnitClass_JFD_Talents
--------------------------------------------------------------------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS
UnitClass_JFD_Talents (
	UnitClassType 												text	REFERENCES UnitClasses(Type) 				default NULL,
	NumTalents  												integer 											default 0);	
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE UnitPromotions			ADD GATurnsExpended			integer 											default 0;
ALTER TABLE UnitPromotions 			ADD IsBuildCharge			boolean												default 0;	
ALTER TABLE UnitPromotions			ADD IsMercPromo				boolean												default	0;
ALTER TABLE UnitPromotions			ADD IsTalent				boolean												default	0;
ALTER TABLE UnitPromotions			ADD PolicyPrereq			text	REFERENCES Policies(Type) 					default NULL;
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_BuildCharges (
	PromotionType  												text 	REFERENCES UnitPromotions(Type) 			default NULL,
	NumCharges													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_TalentsMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_TalentsMods (
	PromotionType 												text	REFERENCES UnitPromotions(Type) 			default NULL,
	UnitClassType												text	REFERENCES UnitClasses(Type)				default NULL,
	NumTalents													integer												default 0);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_UnitDialogues
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_UnitDialogues(
	PromotionType 												text	REFERENCES UnitPromotions(Type) 			default NULL,
	UnitDialogue 												text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Hide
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_Hide (
	PromotionType 												text	REFERENCES UnitPromotions(Type) 			default NULL,
	EnemyUnitPanel												boolean							 					default 0,
	UnitPanel 													boolean							 					default 0);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Units					ADD CannotBeMerc			boolean												default	0;
ALTER TABLE Units					ADD IsPurchaseOnlyMerc		boolean												default	0;
ALTER TABLE Units					ADD IsPurchaseOnlySlave		boolean  											default 0;
ALTER TABLE Units					ADD IsSiege					boolean												default	0;
ALTER TABLE Units					ADD ShackleCost				integer  											default 0;
ALTER TABLE Units					ADD ShackleCostPerEra		integer  											default 0;
ALTER TABLE Units					ADD ShackleWorth			integer  											default 0;
------------------------------------------------------------------------------------------------------------------------
-- Unit_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Unit_JFD_BuildCharges (
	UnitType													text	 REFERENCES Units(Type) 					default NULL,
	NumCharges  												integer 											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Unit_JFD_ProvinceMods (
	UnitType  													text	 REFERENCES Units(Type) 					default NULL,
	NumExtraLevies												integer												default 0,
	LevyFreeExperience											integer												default 0,
	LevyMaxHPChange												integer												default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_JFD_Talents
--------------------------------------------------------------------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS
Unit_JFD_Talents (
	UnitType													text	 REFERENCES Units(Type) 					default NULL,
	NumTalents  												integer 											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Missions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Unit_Missions (
	UnitType 													text	REFERENCES Units(Type) 						default NULL,
	MissionType 												text	REFERENCES Missions(Type) 					default NULL,
	RequiresBeliefType											text 	REFERENCES Beliefs(Type)					default NULL,
	RequiresPromotionType										text 	REFERENCES UnitPromotions(Type)				default NULL);
--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Yields					ADD IsFake					boolean												default	0;
ALTER TABLE Yields					ADD Value					integer												default	0;
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
