-- Suzerainty_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("PlotIterators.lua");
local L = Locale.ConvertTextKey

local isUsingSuzerainty = Game.IsSuzeraintyActive()
--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
--==========================================================================================================================
-- SUZERAIN SUPPORT FUNCTIONS
--==========================================================================================================================
-- Suk_SuzerainTrait_FreePolicies
----------------------------------------------------------------------------------------------------------------------------
function Suk_SuzerainTrait_FreePolicies(iMinor, iMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinor = Players[iMinor]

	local sTrait = pMinor:GetSuzerainTraitType()
	if not sTrait then return end

	for tRow in GameInfo.Suk_SuzerainTrait_FreePolicies("SuzerainTraitType = '" .. sTrait .. "'") do
		local iPolicy = GameInfoTypes[tRow.PolicyType]

		for iPlayer, pPlayer in ipairs(Players) do
			if (iPlayer == iMajor and bIsAlly) then
				Players[iPlayer]:GrantPolicy(iPolicy)
			else
				Players[iPlayer]:RevokePolicy(iPolicy)
			end
		end
	end
end
if isUsingSuzerainty then
	GameEvents.MinorAlliesChanged.Add(Suk_SuzerainTrait_FreePolicies)
end
----------------------------------------------------------------------------------------------------------------------------
-- Suk_SuzerainTrait_FreeBuildings
----------------------------------------------------------------------------------------------------------------------------
function Suk_SuzerainTrait_FreeBuildings(iMinor, iMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinor = Players[iMinor]

	local sTrait = pMinor:GetSuzerainTraitType()
	if not sTrait then return end

	for tRow in GameInfo.Suk_SuzerainTrait_FreeBuildings("SuzerainTraitType = '" .. sTrait .. "'") do
		local iBuilding = GameInfoTypes[tRow.BuildingType]

		for iPlayer, pPlayer in ipairs(Players) do
			local iNum = 0
			if (iPlayer == iMajor and bIsAlly) then iNum = 1 end

			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(iBuilding, iNum)
			end
		end
	end
end
if isUsingSuzerainty then
	GameEvents.MinorAlliesChanged.Add(Suk_SuzerainTrait_FreeBuildings)
end

function Suk_SuzerainTrait_FreeBuildings_2(iPlayer, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	local pCity = pPlot:GetPlotCity()

	for tRow in GameInfo.Suk_SuzerainTrait_FreeBuildings() do
		local sTrait = tRow.SuzerainTraitType
		if pPlayer:IsAllyHasSuzerainTrait(sTrait) then
			local iBuilding = GameInfoTypes[tRow.BuildingType]
			pCity:SetNumRealBuilding(iBuilding, 1)
		end
	end
end
if isUsingSuzerainty then
	GameEvents.PlayerCityFounded.Add(Suk_SuzerainTrait_FreeBuildings_2)
end
----------------------------------------------------------------------------------------------------------------------------
-- Suk_SuzerainTrait_FreePromotions
----------------------------------------------------------------------------------------------------------------------------
function Suk_SuzerainTrait_FreePromotions(iMinor, iMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinor = Players[iMinor]

	local sTrait = pMinor:GetSuzerainTraitType()
	if not sTrait then return end

	for tRow in GameInfo.Suk_SuzerainTrait_FreePromotions("SuzerainTraitType = '" .. sTrait .. "'") do
		local sPromotion = tRow.PromotionType
		local iPromotion = GameInfoTypes[sPromotion]

		-- Collect Info
		local tValidCombats = {}
		for tRow2 in GameInfo.UnitPromotions_UnitCombats("PromotionType = '" .. sPromotion .. "'") do
			tValidCombats[GameInfoTypes[tRow2.UnitCombatType]] = true
		end
		local tValidUnits = {}
		for tRow2 in GameInfo.UnitPromotions_CivilianUnitType("PromotionType = '" .. sPromotion .. "'") do
			tValidUnits[GameInfoTypes[tRow2.UnitType]] = true
		end

		-- Apply Promotions
		for iPlayer, pPlayer in ipairs(Players) do
			local bHasPromotion = (iPlayer == iMajor and bIsAlly)

			for pUnit in pPlayer:Units() do
				if tValidCombats[pUnit:GetUnitCombatType()] or tValidUnits[pUnit:GetUnitType()] then
					pUnit:SetHasPromotion(iPromotion, bHasPromotion)
				end
			end
		end

	end
end
if isUsingSuzerainty then
	GameEvents.MinorAlliesChanged.Add(Suk_SuzerainTrait_FreePromotions)
end

function Suk_SuzerainTrait_FreePromotions_2(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end	

	for tRow in GameInfo.Suk_SuzerainTrait_FreePromotions() do
		
		local sTrait = tRow.SuzerainTraitType
		if pPlayer:IsAllyHasSuzerainTrait(sTrait) then

			local sPromotion = tRow.PromotionType
			local iPromotion = GameInfoTypes[sPromotion]

			-- check if the unit is in the UnitPromotions_UnitCombats table
			for tRow2 in GameInfo.UnitPromotions_UnitCombats("PromotionType = '" .. sPromotion .. "'") do
				if GameInfoTypes[tRow2.UnitCombatType] == pUnit:GetUnitCombatType() then
					pUnit:SetHasPromotion(iPromotion, true)
					break
				end
			end
			-- Otherwise check the UnitPromotions_CivilianUnitType table
			for tRow2 in GameInfo.UnitPromotions_CivilianUnitType("PromotionType = '" .. sPromotion .. "'") do
				if GameInfoTypes[tRow2.UnitType] == iUnitType then
					pUnit:SetHasPromotion(iPromotion, true)
					break
				end
			end
			
		end

	end
end
if isUsingSuzerainty then
	GameEvents.UnitCreated.Add(Suk_SuzerainTrait_FreePromotions_2)
end
--==========================================================================================================================
-- SUZERAIN TRAITS
--==========================================================================================================================
-- SOKOTO
-- Religious Buildings provide +10 XP for new units.
----------------------------------------------------------------------------------------------------------------------------
local tReligiousBuildings = {}
if isUsingSuzerainty then
	for building in DB.Query("SELECT Buildings.ID, Buildings.Description, Buildings.PortraitIndex, Buildings.IconAtlas from Buildings inner join  BuildingClasses on Buildings.BuildingClass = BuildingClasses.Type where Buildings.FaithCost > 0 and Buildings.Cost == -1 and BuildingClasses.MaxGlobalInstances < 0 and (BuildingClasses.MaxPlayerInstances <> 1 or Buildings.SpecialistCount > 0) and BuildingClasses.MaxTeamInstances < 0;") do
		table.insert(tReligiousBuildings, building.ID)
	end
	for building in GameInfo.Buildings("BuildingClass IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_MONASTERY')") do
		table.insert(tReligiousBuildings, building.ID)
	end
end

function SUZERAINTRAIT_MINOR_CIV_SUK_SOKOTO(iPlayer, iCity, iUnit, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_SOKOTO")) then return end

	local pCity = pPlayer:GetCityByID(iCity)
	local iReligiousBuildings = 0
	for _, iBuilding in ipairs(tReligiousBuildings) do
		if pCity:IsHasBuilding(iBuilding) then iReligiousBuildings = iReligiousBuildings + 1 end
	end

	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit and pUnit:IsCombatUnit() then
		pUnit:ChangeExperience(iReligiousBuildings * 10)
	end
end
if isUsingSuzerainty then
	GameEvents.CityTrained.Add(SUZERAINTRAIT_MINOR_CIV_SUK_SOKOTO)
end
----------------------------------------------------------------------------------------------------------------------------
-- HOLMGÅRD
-- Units Purchased with Gold start with an extra 30 XP.
----------------------------------------------------------------------------------------------------------------------------
function SUZERAINTRAIT_MINOR_CIV_SUK_HOLMGARD(iPlayer, iCity, iUnit, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_HOLMGARD")) then return end

	if bGold then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit and pUnit:IsCombatUnit() then
			pUnit:ChangeExperience(30)
		end
	end
end
if isUsingSuzerainty then
	GameEvents.CityTrained.Add(SUZERAINTRAIT_MINOR_CIV_SUK_HOLMGARD)
end
----------------------------------------------------------------------------------------------------------------------------
-- WITTENBERG
-- Gain Faith when you finish researching a new Technology.
----------------------------------------------------------------------------------------------------------------------------
function SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG(iTeam, iTech, iChange)
	for iPlayer, pPlayer in ipairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == iTeam then
			if (pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG")) then

				local iCost = GameInfo.Technologies[iTech].Cost
				if iCost < 1 then return end

				local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
				local iReward = math.ceil(iCost * iMod * 0.2)

				pPlayer:ChangeFaith(iReward)
				if (not pPlayer:IsHuman()) then return end
				Events.GameplayAlertMessage(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG_NOTIFICATION", iReward))
			end
		end
	end
end
if isUsingSuzerainty then
	GameEvents.TeamTechResearched.Add(SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG)
end
----------------------------------------------------------------------------------------------------------------------------
-- JERUSALEM
-- Great Prophets gained while allied recieve an extra spread.
----------------------------------------------------------------------------------------------------------------------------
local Suk_tUnits_Jerusalem = {}
function SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM")) then return end
	if not(GameInfo.Units[iUnitType].Class == "UNITCLASS_PROPHET") then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)
	local iSpread = pUnit:GetSpreadsLeft()
	if iSpread > 0 then
		Suk_tUnits_Jerusalem[pUnit] = true
	end
end
if isUsingSuzerainty then
	GameEvents.UnitCreated.Add(SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM)
end
function SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM_2(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end
	if not Suk_tUnits_Jerusalem[pUnit] then return end

	local iSpread = pUnit:GetSpreadsLeft()
	pUnit:SetSpreadsLeft(iSpread + 1)
	Suk_tUnits_Jerusalem[pUnit] = nil

end
if isUsingSuzerainty then
	GameEvents.UnitSetXY.Add(SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM_2)
end
if isUsingSuzerainty then
	Events.SerialEventUnitCreated.Add(SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM_2)
end
----------------------------------------------------------------------------------------------------------------------------
-- IFE
-- While Allied, the [ICON_CAPITAL] Capital undergoes a perpetual ''We Love the King Day.''
----------------------------------------------------------------------------------------------------------------------------
function SUZERAINTRAIT_MINOR_CIV_SUK_IFE(iPlayer, iMajor)

	if iMajor then iPlayer = iMajor end

	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCapitalCity()

	if not(pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_IFE")) then return end

	if pCity:GetWeLoveTheKingDayCounter() == 0 then
		pCity:ChangeWeLoveTheKingDayCounter(2)
	elseif pCity:GetWeLoveTheKingDayCounter() == 1 then
		pCity:ChangeWeLoveTheKingDayCounter(1)
	end
end
if isUsingSuzerainty then
	GameEvents.PlayerDoTurn.Add(SUZERAINTRAIT_MINOR_CIV_SUK_IFE)
end
if isUsingSuzerainty then
	GameEvents.MinorAlliesChanged.Add(SUZERAINTRAIT_MINOR_CIV_SUK_IFE)
end
----------------------------------------------------------------------------------------------------------------------------
-- SINGAPORE
-- Gain Gold when you finish researching a new Technology.
----------------------------------------------------------------------------------------------------------------------------
function SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE(iTeam, iTech, iChange)
	for iPlayer, pPlayer in ipairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == iTeam then
			if (pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE")) then

				local iCost = GameInfo.Technologies[iTech].Cost
				if iCost < 1 then return end
				
				local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
				local iReward = math.ceil(iCost * iMod * 0.2)

				pPlayer:ChangeGold(iReward)
				if (not pPlayer:IsHuman()) then return end
				Events.GameplayAlertMessage(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE_NOTIFICATION", iReward))
			end
		end
	end
end
if isUsingSuzerainty then
	GameEvents.TeamTechResearched.Add(SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE)
end
----------------------------------------------------------------------------------------------------------------------------
-- URBINO
-- Randomly recieve a Great Writer, Artist or Muscician every 60 turns (on Standard).
----------------------------------------------------------------------------------------------------------------------------
local sGameSpeed		= L(GameInfo.GameSpeeds[Game.GetGameSpeedType()].Description)
local sStandardSpeed	= L("TXT_KEY_GAMESPEED_STANDARD")
local iUrbino_Mod		= ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
local iUrbino_Turns		= math.ceil(60 * iUrbino_Mod)

function SUZERAINTRAIT_MINOR_CIV_SUK_URBINO(iPlayer)
	if ((Game.GetGameTurn() + 1) % iUrbino_Turns) == 0 then
		local pPlayer = Players[iPlayer]
		if pPlayer:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_URBINO") then
			local iAlly = pPlayer:GetAlly()
			if iAlly < 0 then return end
			local pAlly = Players[iAlly]

			local pCity = pAlly:GetCapitalCity()
			if not pCity then return end

			local tGreatPeople = {"UNITCLASS_WRITER", "UNITCLASS_WRITER", "UNITCLASS_WRITER", "UNITCLASS_ARTIST", "UNITCLASS_ARTIST", "UNITCLASS_MUSICIAN"}
			local sClass = tGreatPeople[GetRandom(1, #tGreatPeople)]
			local iUnit = pAlly:GetSpecificUnitType(GameInfoTypes[sClass])

			local pPlot = pCity:Plot()
			local pUnit = pAlly:InitUnit(iUnit, pPlot:GetX(), pPlot:GetY())
		end
	end
end
if isUsingSuzerainty then
	GameEvents.PlayerDoTurn.Add(SUZERAINTRAIT_MINOR_CIV_SUK_URBINO)
end

function SUZERAINTRAIT_MINOR_CIV_SUK_URBINO_2(tControls, tInfo)
	if tInfo.Trait ~= "SUZERAINTRAIT_MINOR_CIV_SUK_URBINO" then return end

	local sText		= tControls.AllyLabel:GetText()
	sText = string.gsub(sText, '60', iUrbino_Turns)
	sText = string.gsub(sText, sStandardSpeed, sGameSpeed)
	
	tControls.AllyLabel:SetText(sText)
end
if isUsingSuzerainty then
	LuaEvents.Suk_ShowSuzeraintyUI.Add(SUZERAINTRAIT_MINOR_CIV_SUK_URBINO_2)
end
----------------------------------------------------------------------------------------------------------------------------
-- NOK
-- Recieve [ICON_GREAT_PEOPLE] Great Artist points when a city grows.
----------------------------------------------------------------------------------------------------------------------------
local iArtistSpecialist = GameInfoTypes.SPECIALIST_ARTIST
local iArtistsGuild = GameInfoTypes.BUILDING_ARTISTS_GUILD

function SUZERAINTRAIT_MINOR_CIV_SUK_NOK(iX, iY, iOldPop, iNewPop)
		if iNewPop < 2 then return end
		if iNewPop < iOldPop then return end
		
		local pPlot				= Map.GetPlot(iX, iY)
		local pCity  			= pPlot:GetPlotCity()
		local iPlayer 			= pCity:GetOwner()
		local pPlayer			= Players[iPlayer]

		if (pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_NOK")) then
			local pTargetCity = pPlayer:GetCapitalCity()
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(iArtistsGuild) then
					pTargetCity = pCity
					break
				end
			end

			local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GreatPeoplePercent)/100)
			local iReward = math.ceil(2 * iNewPop * iMod)

			pTargetCity:ChangeSpecialistGreatPersonProgressTimes100(iArtistSpecialist, iReward*100)
			if (not pPlayer:IsHuman()) then return end
			Events.GameplayAlertMessage(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NOK_NOTIFICATION", iReward))
		end
end
if isUsingSuzerainty then
	GameEvents.SetPopulation.Add(SUZERAINTRAIT_MINOR_CIV_SUK_NOK)
end
--==========================================================================================================================
--==========================================================================================================================