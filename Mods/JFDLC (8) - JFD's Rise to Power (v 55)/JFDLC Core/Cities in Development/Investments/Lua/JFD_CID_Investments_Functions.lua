-- JFD_CID_Investments_Functions
-- Author: JFD
-- DateCreated: 3/25/2016 11:25:52 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
include("JFD_CID_InvestmentsUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDInvestmentsCore = (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- INVESTMENTS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Investments_Invested
function JFD_CID_Investments_Invested(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local yields = {}
	for row in GameInfo.Building_JFD_InvestmentMods() do
		if ((row.IsColony and city:IsColony()) or (not row.IsColony)) then
			if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
				local yield = row.Yield
				if row.EraModifier ~= 0 then yield = yield + ((yield*(currentEra*row.EraModifier))/100) end
				if yields[row.YieldType] then yields[row.YieldType] = yields[row.YieldType] + yield
				else yields[row.YieldType] = yield end
			end
		end
	end
	for row in GameInfo.Policy_JFD_InvestmentMods() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) and ((row.IsColony and city:IsColony()) or (not row.IsColony)) then
			local yield = row.Yield
			if row.EraModifier ~= 0 then yield = yield + ((yield*(currentEra*row.EraModifier))/100) end
			if yields[row.YieldType] then yields[row.YieldType] = yields[row.YieldType] + yield
			else yields[row.YieldType] = yield end
		end
	end
	for row in GameInfo.JFD_Reform_InvestmentProduction() do
		if player:HasReform(GameInfoTypes[row.ReformType]) and ((row.IsColony and city:IsColony()) or (not row.IsColony)) then
			local yield = row.Yield
			if row.EraModifier ~= 0 then yield = yield + ((yield*(currentEra*row.EraModifier))/100) end
			if yields[row.YieldType] then yields[row.YieldType] = yields[row.YieldType] + yield
			else yields[row.YieldType] = yield end
		end
	end
	for row in GameInfo.Trait_JFD_InvestmentMods() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) and ((row.IsColony and city:IsColony()) or (not row.IsColony)) then
			local yield = row.Yield
			if row.EraModifier ~= 0 then yield = yield + ((yield*(currentEra*row.EraModifier))/100) end
			if yields[row.YieldType] then yields[row.YieldType] = yields[row.YieldType] + yield
			else yields[row.YieldType] = yield end
		end
	end
	for yieldType, yield in pairs(yields) do
		if yieldType == 'YIELD_FAITH' then
			player:ChangeFaith(yield)	
		elseif yieldType == 'YIELD_CULTURE' then
			player:ChangeJONSCulture(yield)	
		elseif yieldType == 'YIELD_GOLD' then
			player:ChangeGold(yield)	
		elseif yieldType == 'YIELD_PRODUCTION' then
			city:ChangeProduction(yield)	
		elseif yieldType == 'YIELD_FOOD' then
			city:ChangeFood(yield)	
		end
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] {2_FontIcon}", yield, GameInfo.Yields[yieldType].IconString), true)
		end
	end
end
if userSettingCIDInvestmentsCore then
	GameEvents.CityInvestedBuilding.Add(JFD_CID_Investments_Invested)	
end
--=======================================================================================================================
--=======================================================================================================================
