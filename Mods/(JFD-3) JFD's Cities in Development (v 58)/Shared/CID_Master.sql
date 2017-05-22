--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('API_EXTENSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('API_LUA_EXTENSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_RESOURCE_FLAVORS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_SETTLER_ADVANCED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BUGFIX_DUMMY_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_BARBARIANS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY_BOMBARD', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_COMMAND', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CUSTOM_MISSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_FOUND_RELIGION', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GREAT_PEOPLE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_PLOT', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_RESOLUTIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CAPTURE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_FOUNDED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('MOD_BALANCE_CORE_POLICIES', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_CROSS_ICE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_UNIT_NAMING', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('UNITS_MAX_HP', 1);
--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Belief_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Belief_JFD_SlaveryMods (
	BeliefType  												text 		REFERENCES Beliefs(Type) 			default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0);	
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
ALTER TABLE Builds	ADD ActionAnimation							integer											default 1950;
ALTER TABLE Builds	ADD ChargeCost								integer											default 0;
------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ChargeExcludes
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Build_JFD_ChargeExcludes (
	BuildType													text	 										default NULL,
	RequiresPolicy  											text	 REFERENCES Policies(Type) 				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ExtraChargeCost
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Build_JFD_ExtraChargeCost (
	BuildType													text	 										default NULL,
	ExtraChargeCost  											integer											default 0,
	RequiresPolicy  											text	 REFERENCES Policies(Type) 				default NULL);
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	BuildingClass_ConstructionAudio (
    BuildingClassType											text    REFERENCES BuildingClasses(Type)        default NULL,
    ConstructionAudio											text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	BuildingClass_ConstructionAudio (
    BuildingClassType											text    REFERENCES BuildingClasses(Type)        default NULL,
    ConstructionAudio											text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	BuildingClass_JFD_District (
	BuildingClassType  											text 		REFERENCES BuildingClasses(Type)	default NULL,
	DistrictType												text										 	default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClass_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	BuildingClass_JFD_HelpTexts (
    BuildingClassType  											text 		REFERENCES BuildingClasses(Type) 	default NULL,
	PolicyType													text		REFERENCES Policies(Type)			default NULL,
	HelpText													text											default NULL,
	IsWrittenFirst												boolean											default 0);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Buildings	ADD BombardRange						integer  										default 0;
ALTER TABLE Buildings	ADD ImprovedPlotsReqOR					integer											default 0;
ALTER TABLE Buildings	ADD IsPlague							boolean											default 0;
ALTER TABLE Buildings	ADD IsProvince							boolean											default 0;
ALTER TABLE Buildings	ADD LoyaltyFromNavalUnits				integer											default 0;
ALTER TABLE Buildings	ADD PopulationReqOR						integer											default 0;
ALTER TABLE Buildings	ADD RequiresConnection					boolean											default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCityOR
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_ClassesNeededInCityOR (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	BuildingClassType											text		REFERENCES BuildingClasses(Type) 	default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Building_ConstructionAudio (
    BuildingType												text		REFERENCES Buildings(Type)          default NULL,
    ConstructionAudio											text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- COMPONENTS
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_BuildCharges (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	NumCharges													integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_ColonyMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	AssimilateGoldReqMod  										integer 										default 0,
	AssimilatePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_CrimeMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	CrimeType													text 		 									default NULL,
	GlobalCrimeMod												integer											default 0,	
	CrimeMod													integer											default 0,
	IsLoyalty													boolean											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_District (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	CategoryType												text										 	default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_HappinessMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	GlobalResistanceMod											integer											default 0,
	ResistanceMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_DevelopmentMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	DevelopmentChange											integer											default 0,
	DevelopmentBuildingMod										integer											default 0,
	DevelopmentImprovementMod									integer											default 0,
	DevelopmentThresholdMod										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Building_JFD_HelpTexts (
    BuildingType												text		REFERENCES Buildings(Type)          default NULL,
    CivilizationType											text		REFERENCES Civilizations(Type)      default NULL,
	HelpText													text											default NULL,
	IsWrittenFirst												boolean											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_HealthMods (
	BuildingType												text		REFERENCES Buildings(Type)          default NULL,
	DiseaseConnectionMod										integer											default 0,
	DiseasePopMod												integer											default 0,
	DiseaseTRMod												integer											default 0,
	HealthToFoodMod												integer											default 0,
	PlagueMod													integer											default 0,
	GlobalPlagueMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_InvestmentProduction
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_InvestmentProduction (
	BuildingType  												text 		REFERENCES Buildings(Type)			default NULL,
	Production													integer											default 0,
	ColonyProduction											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_LoyaltyMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	GlobalRevoltMod												integer											default 0,
	RevoltMod													integer											default 0,
	RevoltSentimentChange										integer											default 0,
	GlobalWLTKDMod												integer											default 0,
	WLTKDMod													integer											default 0,
	WLTKDSentimentChange										integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_ProvinceMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	LevyFreeExperience											integer											default 0,
	LevyMaxHPChange												integer											default 0,
	ProvinceImprovementReqMod									integer											default 0,
	ProvincePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_OrganizedCrimeMods (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	OrganizedCrimeType											text 										 	default NULL,
	GlobalThresholdMod											integer											default 0,
	ThresholdMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_SlaveryMods (
	BuildingType  												text 		REFERENCES Buildings(Type)			default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingHappinessChangesUI
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Building_BuildingHappinessChangesUI (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	RequiredBuildingType  										text 		REFERENCES Buildings(Type) 			default NULL,
	HappinessChange												integer 		 								default 0,
	HappinessChangeIsBuildingCount								boolean											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Building_GreatWorkChangesUI
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Building_GreatWorkChangesUI (
	BuildingType  												text 		REFERENCES Buildings(Type) 			default NULL,
	GreatWorkSlotType  											text 		 									default NULL,
	SpecialistType  											text 		 									default NULL,
	GreatPeopleRateChange										integer 		 								default 0);	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--Civilization_FreePolicies
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_FreePolicies (
	CivilizationType  											text 		REFERENCES Civilizations(Type) 		default NULL,
	PolicyType													text 		REFERENCES Policies(Type) 			default NULL);	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ColonialCityNames (
	CivilizationType 											text 		REFERENCES Civilizations(Type) 		default NULL,
	ColonyName 													text											default NULL,
	LinguisticType												text											default	NULL,
	CultureType													text											default	NULL);

ALTER TABLE Civilization_JFD_ColonialCityNames ADD	FortPrefix	text											default NULL;
ALTER TABLE Civilization_JFD_ColonialCityNames ADD	FortSuffix  text											default NULL;
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
	BuildingType												text		REFERENCES Buildings(Type) 			default NULL,
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
	IconString													text											default NULL,
	CrimeIconString												text											default NULL,
	BuildingType												text		REFERENCES Buildings(Type) 			default NULL,
	NotificationShortDesc										text											default NULL,	
	NotificationDesc											text											default NULL,
	Threshold													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OrganizedCrime_EraDescription
--------------------------------------------------------------------------------------------------------------------------			
CREATE TABLE IF NOT EXISTS 
	JFD_OrganizedCrime_EraDescription (
	OrganizedCrimeType  										text											default NULL,
	Era  														text 		REFERENCES Eras(Type) 				default NULL,
	Description													text											default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OrganizedCrime_CrimeTypes
--------------------------------------------------------------------------------------------------------------------------			
CREATE TABLE IF NOT EXISTS 
	JFD_OrganizedCrime_CrimeTypes (
	OrganizedCrimeType  										text											default NULL,
	CrimeType  													text 		REFERENCES JFD_Crimes(Type)			default NULL,
	YieldType													text		REFERENCES Yields(Type)				default NULL);	
--==========================================================================================================================
-- DISTRICTS
--==========================================================================================================================
-- JFD_Districts
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Districts (
	ID  														integer 										primary key autoincrement,
	Type  														text										 	default NULL,
	Description													text										 	default NULL);	
--==========================================================================================================================
-- HIDE FROM PEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default NULL);
--==========================================================================================================================
-- LOYALTIES
--==========================================================================================================================
-- JFD_Loyalties
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Loyalties (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	Help														text											default NULL,
	ShortDescription											text											default NULL,
	SoundEffect													text											default NULL,
	NotificationType											text											default NULL,
	NotificationShortDesc										text											default NULL,	
	NotificationDesc											text											default NULL,
	BuildingType												integer		REFERENCES Buildings(Type) 			default 0,
	RevoltRate  												integer 										default 0,
	Threshold  													integer 										default 0,
	WLTKDRate  													integer 										default 0,
	IconString													text											default NULL,
	TextColour  												text 											default NULL);
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
	BuildingType												integer		REFERENCES Buildings(Type) 			default 0,
	IsEventOnly													boolean											default 0,
	IconString													text											default NULL);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
--UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE UnitPromotions 	ADD FriendlyDamage					integer											default 0;	
ALTER TABLE UnitPromotions 	ADD IsBuildCharge					boolean											default 0;	
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	UnitPromotions_JFD_BuildCharges (
	PromotionType  												text 		REFERENCES UnitPromotions(Type) 	default NULL,
	NumCharges													integer											default 0);
--==========================================================================================================================
-- PROVINCES
--==========================================================================================================================
-- JFD_Provinces
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Provinces (
	ID  														integer 										primary key autoincrement,
	Type  														text 											default NULL,
	Description													text											default NULL,
	DescriptionAlt												text											default NULL,
	Help														text											default NULL,
	BuildingType												integer		REFERENCES Buildings(Type) 			default 0,
	BuildingDescription											text											default NULL,
	DefaultRulerTitle											text											default NULL,
	DefaultRulerTitleAlt										text											default NULL,
	BombardRange												integer											default 0,
	BorderModifier												integer											default 0,
	IsTownBonus													boolean											default 0,
	IsVillageBonus												boolean											default 0,
	NumImprovementRequired										integer											default 0,
	NumPopulationRequired										integer											default 0,
	NumUnitsSpawned												integer											default 0,
	NumUnitsSpawnedAI											integer											default 0,
	NumUnitsXP													integer											default 0,
	UpgradeProvinceType											text		REFERENCES JFD_Provinces(Type) 		default NULL,
	IconString													text											default NULL);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  											text 		REFERENCES Civilizations(Type) 		default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 									default NULL,
	UniqueTitle													text 		 									default NULL,
	UseAdjective												boolean											default 0);		
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_CultureType_ProvinceTitles (
	CultureType													text 		 									default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 									default NULL,
	UniqueTitle													text 		 									default NULL,
	UseAdjective												boolean											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Government_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_Government_ProvinceTitles (
	GovernmentType												text 		 									default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 									default NULL,
	UniqueTitle													text 		 									default NULL,
	UseAdjective												boolean											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Province_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Province_DevelopmentMods (
	ProvinceType												text		REFERENCES JFD_Provinces(Type)		default NULL,
	DevelopmentThresholdMod										integer											default 0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
--Policies
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Policies 		ADD JFD_LoyaltyGarrisonLevels		boolean											default 0;
ALTER TABLE Policies		ADD JFD_NumExtraLevies				integer											default 0;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassGreatPeoplePointsChange
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Policy_BuildingClassGreatPeoplePointsChange (
	PolicyType													text		REFERENCES Policies(Type)			default NULL,
	BuildingClassType											text 		REFERENCES BuildingClasses(Type)	default NULL,	
	SpecialistType												text 		REFERENCES Specialists(Type)		default NULL,	
	PointsChange 												integer											default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_BuildCharges (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	NumCharges													integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_ColonyMods (
    PolicyType													text		REFERENCES Policies(Type)			default NULL,
	AssimilateGoldReqMod  										integer 										default 0,
	AssimilatePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_CrimeMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	CrimeType													text 											default NULL,
	CrimeMod													integer											default 0,
	SpecialistCrimeMod											integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_DevelopmentMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	DevelopmentBuildingMod										integer											default 0,
	DevelopmentImprovementMod									integer											default 0,
	DevelopmentThresholdMod										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_HappinessMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	ResistanceMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_HealthMods (
	PolicyType													text		REFERENCES Policies(Type)           default NULL,
	DiseaseConnectionMod										integer											default 0,
	DiseasePopMod												integer											default 0,
	DiseaseTRMod												integer											default 0,
	HealthToFoodMod												integer											default 0,
	PlagueMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_InvestmentProduction
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_InvestmentProduction (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	Production													integer											default 0,
	ColonyProduction											integer											default 0,
	EraModifier													integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_LoyaltyMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	PuppetLoyaltyMod											integer											default 0,
	RevoltMod													integer											default 0,
	RevoltSentimentChange										integer											default 0,
	WLTKDMod													integer											default 0,
	WLTKDSentimentChange										integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_OrganizedCrimeMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	OrganizedCrimeType											text 											default NULL,
	ThresholdMod												integer											default 0);	
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
-- Policy_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_ProvinceTitles (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	ReligionType  												text 		REFERENCES Religions(Type) 			default NULL,
	DefaultTitle												text 		 									default NULL,
	UniqueTitle													text 		 									default NULL,
	UseAdjective												boolean											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_SlaveryMods (
	PolicyType  												text 		REFERENCES Policies(Type) 			default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistSentimentChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_SpecialistSentimentChanges (
    PolicyType													text		REFERENCES Policies(Type)			default NULL,
	SpecialistType  											text		REFERENCES Specialists(Type)		default NULL,
	RevoltSentimentChange										integer											default 0,
	WLTKDSentimentChange										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatFreeExperiencesPerGreatWork
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_UnitCombatFreeExperiencesPerGreatWork (
	PolicyType													text 		REFERENCES Policies(Type) 			default NULL,
	UnitCombatType												text 		REFERENCES UnitCombatInfos(Type) 	default NULL,
	GreatWorkSlotType											text 		REFERENCES GreatWorkSlots(Type) 	default NULL,
	FreeExperience												integer 										default 0);
--==========================================================================================================================
-- REFORMS
--==========================================================================================================================
-- JFD_Reform_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_Reform_ColonyMods (
    ReformType													text	 										default NULL,
	AssimilateGoldReqMod  										integer 										default 0,
	AssimilatePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_CrimeMods (
	ReformType  												text 											default NULL,
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
-- JFD_Reform_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_HappinessMods (
	ReformType  												text 											default NULL,
	ResistanceMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_HealthMods (
	ReformType													text								            default NULL,
	DiseaseConnectionMod										integer											default 0,
	DiseasePopMod												integer											default 0,
	DiseaseTRMod												integer											default 0,
	HealthToFoodMod												integer											default 0,
	PlagueMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_InvestmentProduction
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_InvestmentProduction (
	ReformType  												text 								 			default NULL,
	Production													integer											default 0,
	ColonyProduction											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_LoyaltyMods (
	ReformType  												text 		 									default NULL,
	RevoltMod													integer											default 0,
	RevoltSentimentChange										integer											default 0,
	WLTKDMod													integer											default 0,
	WLTKDSentimentChange										integer											default 0);	
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
-- JFD_Reform_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_Reform_OrganizedCrimeMods (
	ReformType  												text  											default NULL,
	OrganizedCrimeType											text 		 									default NULL,
	ThresholdMod												integer											default 0);	
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
-- SLAVERY
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Units			ADD ShackleCost						integer  										default 0;
ALTER TABLE Units			ADD ShackleCostPerEra				integer  										default 0;
ALTER TABLE Units		    ADD IsPurchaseOnlySlave				boolean  										default 0;
--==========================================================================================================================
-- SPECIALISTS
--==========================================================================================================================
-- SPECIALISTS
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Specialists 	ADD FontIcon						text											default '[ICON_GREAT_PEOPLE]';
--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technologies_JFD_MiscEffects (
	TechType													text 	REFERENCES Technologies(Type) 			default NULL,	
	EffectToolTip												text											default NULL,
	PortraitIndex												integer											default	0,
	IconAtlas													text											default 'GENERIC_FUNC_ATLAS',
	UnitAction													text											default	NULL);

ALTER TABLE Technologies_JFD_MiscEffects ADD AllowLevies		boolean											default	0;
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Trait_JFD_ColonyMods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Trait_JFD_ColonyMods (
    TraitType													text		REFERENCES Traits(Type)				default NULL,
	AssimilateGoldReqMod  										integer 										default 0,
	AssimilatePopulationReqMod									integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_CrimeMods (
	TraitType  													text 		REFERENCES Traits(Type) 			default NULL,
	CrimeType													text 											default NULL,
	CrimeMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_DevelopmentMods (
	TraitType													text		REFERENCES Traits(Type)				default NULL,
	DevelopmentBuildingMod										integer											default 0,
	DevelopmentImprovementMod									integer											default 0,
	DevelopmentThresholdMod										integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_GreatPeoplePointsFromConqueredCities
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_GreatPeoplePointsFromConqueredCities (
	TraitType 													text 		REFERENCES Traits(Type)				default NULL,
	SpecialistType												text 		REFERENCES Specialists(Type)		default NULL,	
	IsCapitalOnly												boolean											default 0,
	PointsChange 												integer											default	0,
	CapitalPointsChange											integer											default	0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_HappinessMods (
	TraitType													text		REFERENCES Traits(Type)				default NULL,
	ResistanceMod												integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_HealthMods (
	TraitType													text		REFERENCES Traits(Type)				default NULL,
	DiseaseConnectionMod										integer											default 0,
	DiseasePopMod												integer											default 0,
	DiseaseTRMod												integer											default 0,
	HealthToFoodMod												integer											default 0,
	PlagueMod													integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_InvestmentProduction
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_InvestmentProduction (
	TraitType  													text 		REFERENCES Traits(Type) 			default NULL,
	Production													integer											default 0,
	ColonyProduction											integer											default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_LoyaltyMods (
	TraitType  													text 		REFERENCES Traits(Type) 			default NULL,
	RevoltMod													integer											default 0,
	RevoltSentimentChange										integer											default 0,
	WLTKDMod													integer											default 0,
	WLTKDSentimentChange										integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_ProvinceMods (
	TraitType													text		REFERENCES Traits(Type)				default NULL,
	LevyFreeExperience											integer											default 0,
	LevyMaxHPChange												integer											default 0,
	ProvinceImprovementReqMod									integer											default 0,
	ProvincePopulationReqMod									integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_OrganizedCrimeMods (
	TraitType  													text 		REFERENCES Traits(Type) 			default NULL,
	OrganizedCrimeType											text 											default NULL,
	ThresholdMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_JFD_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Trait_JFD_SlaveryMods (
	TraitType  													text 		REFERENCES Traits(Type) 			default NULL,
	CaptureMod													integer											default 0,
	CivilianCaptureMod											integer											default 0,
	EncampmentMod												integer											default 0,
	FreeExperience												integer											default 0,
	MaxHPChange													integer											default 0,
	ShackleCostMod												integer											default 0,
	TradeRouteMod												integer											default 0);	
--------------------------------------------------------------------------------------------------------------------------
-- Trait_YieldChangesFromPillagedTiles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_YieldChangesFromPillagedTiles (
	TraitType 													text 		REFERENCES Traits(Type)				default NULL,
	BuildingType												text 		REFERENCES Buildings(Type)			default NULL,	
	Yieldtype 													text		REFERENCES Yields(Type)				default NULL,
	Yield														integer											default	NULL,
	RequiresUnit												boolean											default 0);
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
-- UNITS
--==========================================================================================================================
-- Unit_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Unit_JFD_BuildCharges (
	UnitType													text	 										default NULL,
	NumCharges  												integer 										default 0);	
------------------------------------------------------------------------------------------------------------------------
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
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Yields								ADD IsFake		boolean											default	0;
--------------------------------------------------------------------------------------------------------------------------
-- Yields_JFD_CrimeTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Yields_JFD_CrimeTypes (
	YieldType													text 	REFERENCES Yields(Type) 				default NULL,	
	CrimeType													text											default NULL);
--==========================================================================================================================
-- JFD DYNAMIC TOP PANEL
--==========================================================================================================================
-- JFD_TopPanelIncludes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default NULL);

--This is the file from where your function to return a YieldPerTurn value will be called. This should be imported into VFS within your mod.
--------------------------------------------------------------------------------------------------------------------------	
--JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default NULL,
	YieldType  				text 										default NULL,
	YieldSourceFunction 	text										default NULL,
	YieldSourceToolTip		text										default	NULL,
	MiscToolTipFunction		text										default	NULL);

--CivilizationType is if you want to restrict the changes to show up only for a specific civ.

--YieldType corresponds to either YIELD_GOLD, YIELD_FAITH, YIELD_JFD_PIETY, YIELD_JFD_SOVEREIGNTY, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLDEN_AGE, YIELD_TOURISM, or YIELD_HAPPINESS. 
--Note that YIELD_GOLDEN_AGE only works with ToolTips (doesn't display GAP Per Turn). 
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