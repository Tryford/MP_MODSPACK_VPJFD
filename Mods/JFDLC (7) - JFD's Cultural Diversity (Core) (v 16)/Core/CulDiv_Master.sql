--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default NULL,
	Value 											integer 									default 1);
--==========================================================================================================================
-- COMMUNITY BALANCE PATCH
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- CULTURE BRANCHES
--==========================================================================================================================
-- JFD_CultureBranches
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureBranches(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default NULL,
	ShortDescription						text												default NULL);
--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
-- JFD_CultureType
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureTypes(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default NULL,
	BranchType 								text												default NULL,
	LowerType								text												default NULL,	
	ShortDescription						text												default NULL,
	ArtDefineTag							text												default NULL,
	DecisionsTag							text												default NULL,
	DefeatScreenEarly						text												default NULL,
	DefeatScreenMid							text												default NULL,
	DefeatScreenLate						text												default NULL,
	IdealsTag								text												default NULL,
	SplashScreenTag							text												default NULL,
	SoundtrackTag							text												default NULL,
	UnitDialogueTag							text												default NULL,
	StartDistance							integer												default	0,
	FontIcon								text												default	NULL,
	IconAtlas								text		REFERENCES IconTextureAtlases(Atlas)	default	NULL,
	IconAlphaAtlas							text		REFERENCES IconTextureAtlases(Atlas)	default	NULL,
	PortraitIndex							integer												default	0,
	AlphaIndex								integer												default	0,
	EmbarkationArtDefineEarly				text												default	NULL,
	EmbarkationArtDefineMid					text												default	NULL,
	MissionaryArtDefine						text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_SubCultures
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureType_SubCultures(
	CultureType 							text												default NULL,
	SubCultureType							text												default NULL,
	ShortDescription						text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_MythicEvents
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureType_MythicEvents(
	CultureType 							text												default NULL,
	Description								text												default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_StartingBonuses
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureType_StartingBonuses(
	CultureType 								text 	 										default NULL,
	Description 								text											default NULL,
	FreeBuilding								text	REFERENCES BuildingClasses(Type)		default	NULL,
	FreeBuildingAND								text	REFERENCES BuildingClasses(Type)		default	NULL,
	FreeCulture									integer											default	0,
	FreeFaith									integer											default	0,
	FreeGold									integer											default	0,
	FreePolicyBranch							text	REFERENCES PolicyBranchTypes(Type)		default	NULL,
	FreePolicy									text	REFERENCES Policies(Type)				default	NULL,
	FreePopulation								integer											default	0,
	FreeResource								text	REFERENCES Resources(Type)				default	NULL,
	FreeResourceCount							integer											default	0,
	FreeResourceImprovement						text	REFERENCES Improvements(Type)			default	NULL,
	FreeSettlerPromotion						text	REFERENCES UnitPromotions(Type)			default	NULL,
	FreeTech									text	REFERENCES Technologies(Type)			default	NULL,
	FreeUnit									text	REFERENCES UnitClasses(Type)			default	NULL,
	FreeUnitCount								integer											default	0,
	FreeUnitMoves								integer											default	0,
	FreeUnitPromotion							text	REFERENCES UnitPromotions(Type)			default	NULL,
	FreeUnitXP									integer											default	0,
	FreeWLTKDTurns								integer											default	0,
	NearbyLandsClaim							boolean											default 0,
	NearbyLandsVisible							integer											default 0);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default NULL,
	ColonyName 									text											default NULL,
	LinguisticType								text											default	NULL,
	CultureType									text											default	NULL);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 											default NULL,
	CultureType 								text											default NULL,
	ArtDefineTag								text											default	NULL,
	DecisionsTag								text											default NULL,
	DefeatScreenEarlyTag						text											default	NULL,
	DefeatScreenMidTag							text											default	NULL,
	DefeatScreenLateTag							text											default	NULL,
	IdealsTag									text											default	NULL,
	SplashScreenTag								text											default	NULL,
	SoundtrackTag								text											default	NULL,
	UnitDialogueTag								text											default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes(
	MinorCivilizationType 						text 										 	default NULL,
	CultureType 								text											default NULL);
--==========================================================================================================================
-- ERAS
--==========================================================================================================================
-- Era_SplashScreenTag
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Era_SplashScreenTag (
	EraType			 							text 								 			default NULL,
	SplashTag	 								text											default NULL);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions_JFD_UnitDialogues
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_UnitDialogues(
	PromotionType 								text 	REFERENCES UnitPromotions(Type) 		default NULL,
	UnitDialogue 								text											default NULL);
--==========================================================================================================================
--==========================================================================================================================