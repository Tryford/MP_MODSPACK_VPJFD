-- JFD_CID_HealthUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineDiseaseFromConnectionMod = GameDefines["JFD_CID_DISEASE_CITY_CONNECTION_MODIFIER"]
local defineDiseaseFromTRMod         = GameDefines["JFD_CID_DISEASE_TRADE_ROUTE_MODIFIER"]
local defineDiseasePerPop			 = GameDefines["JFD_CID_DISEASE_PER_POPULATION"]
local definePlagueFoodConsumption	 = GameDefines["JFD_CID_PLAGUE_FOOD_CONSUMPTION"]
local definePlagueMinThreshold		 = GameDefines["JFD_CID_PLAGUE_MIN_THRESHOLD_" .. GameInfo.GameSpeeds[Game.GetGameSpeedType()].Type] or 150
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingDevelopmentCore	= JFD_GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1
local userSettingHealthCore			= JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
local userSettingHealthCoreFirstNotificationPlagueTurns  = JFD_GetUserSetting("JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS")
local userSettingHealthCoreSecondNotificationPlagueTurns = JFD_GetUserSetting("JFD_CID_HEALTH_CORE_SECOND_NOTIFICATION_PLAGUE_TURNS")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey				= Locale.ConvertTextKey
local mathMax 						= math.max
------------------------------------------------------------------------------------------------------------------------
-- HEALTH
------------------------------------------------------------------------------------------------------------------------
--JFD_GetHealthTotal
local buildingClassRecyclingCenterID = GameInfoTypes["BUILDINGCLASS_RECYCLING_CENTER"]
local yieldDiseaseID = GameInfoTypes["YIELD_JFD_DISEASE"]
local yieldHealthID  = GameInfoTypes["YIELD_JFD_HEALTH"]
function JFD_GetHealthTotal(playerID, city, returnsDisease, skipsTradeRoutes)
	local player = Players[playerID]
	local totalHealth = city:GetYieldRate(yieldHealthID)
	if (not player:IsHuman()) then totalHealth = totalHealth + 6 end
	local totalDisease = 0
	if returnsDisease then 
		totalDisease = totalDisease + city:GetYieldRate(yieldDiseaseID) + JFD_GetDiseaseFromPopulation(playerID, city) 
		if (not skipsTradeRoutes) then totalDisease = totalDisease + JFD_GetDiseaseFromTradeRoutes(playerID, city) end
		totalDisease = totalDisease + ((totalDisease*JFD_GetDiseaseFromCityConnectionMod(playerID, city))/100)
		if city:HasBuildingClass(buildingClassRecyclingCenterID) then
			totalDisease = totalDisease - city:GetBaseYieldRateFromBuildings(yieldDiseaseID)
		end
	end
	return JFD_Round(totalHealth, 1), JFD_Round(totalDisease, 1)
end

--JFD_GetExcessHealth
function JFD_GetExcessHealth(playerID, city, returnsDisease)
	if (not userSettingHealthCore) then return 0, 0 end
	local player = Players[playerID]
	local totalHealth, totalDisease = JFD_GetHealthTotal(playerID, city, true, false)
	local excessHealth = (totalHealth-totalDisease)
	local excessDisease = 0
	if returnsDisease then excessDisease = (totalDisease-totalHealth) end
	return JFD_Round(excessHealth), JFD_Round(excessDisease)
end
----------------
-- DISEASE
----------------
--JFD_GetDiseaseFromCityConnectionMod
function JFD_GetDiseaseFromCityConnectionMod(playerID, city)
	local player = Players[playerID]
	if city:IsCapital() then return 0 end
	if (not player:IsCapitalConnectedToCity(city)) then return 0 end
	if (not JFD_IsCityPlagued(player:GetCapitalCity())) then return 0 end
	local diseaseConnection = defineDiseaseFromConnectionMod
	for row in GameInfo.Building_JFD_HealthMods("DiseaseConnectionMod <> 0") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			diseaseConnection = diseaseConnection + row.DiseaseConnectionMod
		end
	end
	for row in GameInfo.Policy_JFD_HealthMods("DiseaseConnectionMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			diseaseConnection = diseaseConnection + row.DiseaseConnectionMod
		end
	end
	for row in GameInfo.JFD_Reform_HealthMods("DiseaseConnectionMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			diseaseConnection = diseaseConnection + row.DiseaseConnectionMod
		end
	end
	for row in GameInfo.Trait_JFD_HealthMods("DiseaseConnectionMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			diseaseConnection = diseaseConnection + row.DiseaseConnectionMod
		end
	end
	return diseaseConnection
end

--JFD_GetDiseaseFromPopulation
function JFD_GetDiseaseFromPopulation(playerID, city)
	local player = Players[playerID]
	local diseasePopulation = (city:GetPopulation()*defineDiseasePerPop)
	for row in GameInfo.Building_JFD_HealthMods("DiseasePopMod <> 0") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_HealthMods("DiseasePopMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_HealthMods("DiseasePopMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_HealthMods("DiseasePopMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	return diseasePopulation
end

--JFD_GetDiseaseFromTradeRoutesMod
function JFD_GetDiseaseFromTradeRoutesMod(playerID, city)
	local player = Players[playerID]
	local diseaseTradeRouteMod = 0
	--Buildings
	for row in GameInfo.Building_JFD_HealthMods("DiseaseTRMod <> 0") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			ddiseaseTradeRouteMod = diseaseTradeRouteMod + row.DiseaseTRMod
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_HealthMods("DiseaseTRMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			diseaseTradeRouteMod = diseaseTradeRouteMod + row.DiseaseTRMod
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_HealthMods("DiseaseTRMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			diseaseTradeRouteMod = diseaseTradeRouteMod + row.DiseaseTRMod
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_HealthMods("DiseaseTRMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			diseaseTradeRouteMod = diseaseTradeRouteMod + row.DiseaseTRMod
		end
	end
	return diseaseTradeRouteMod
end

--JFD_GetDiseaseFromTradeRoutes
function JFD_GetDiseaseFromTradeRoutes(playerID, city)
	local player = Players[playerID]
	local diseaseTradeRoute = 0
	for _,v in ipairs(player:GetTradeRoutes()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if fromCity == city then
			local totalHealth, totalDisease = JFD_GetHealthTotal(toCity:GetOwner(), toCity, true, true)
			diseaseTradeRoute = diseaseTradeRoute + ((totalDisease*defineDiseaseFromTRMod)/100)
		elseif toCity == city then
			local totalHealth, totalDisease = JFD_GetHealthTotal(fromCity:GetOwner(), fromCity, true, true)
			diseaseTradeRoute = diseaseTradeRoute + ((totalDisease*defineDiseaseFromTRMod)/100)
		end
	end
	for _,v in ipairs(player:GetTradeRoutesToYou()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if fromCity == city then
			local totalHealth, totalDisease = JFD_GetHealthTotal(toCity:GetOwner(), toCity, true, true)
			diseaseTradeRoute = diseaseTradeRoute + ((totalDisease*defineDiseaseFromTRMod)/100)
		elseif toCity == city then
			local totalHealth, totalDisease = JFD_GetHealthTotal(fromCity:GetOwner(), fromCity, true, true)
			diseaseTradeRoute = diseaseTradeRoute + ((totalDisease*defineDiseaseFromTRMod)/100)
		end
	end
	diseaseTradeRoute = diseaseTradeRoute + (diseaseTradeRoute*JFD_GetDiseaseFromTradeRoutesMod(playerID, city)/100)
	return mathMax(diseaseTradeRoute,0)
end
----------------
-- FOOD
----------------
--JFD_GetHealthToFoodMod
function JFD_GetHealthToFoodMod(playerID, city)
	local player = Players[playerID]
	local healthToFoodMod = 0
	--Buildings
	for row in GameInfo.Building_JFD_HealthMods("HealthToFoodMod <> 0") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			healthToFoodMod = healthToFoodMod + row.HealthToFoodMod
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_HealthMods("HealthToFoodMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			healthToFoodMod = healthToFoodMod + row.HealthToFoodMod
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_HealthMods("HealthToFoodMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			healthToFoodMod = healthToFoodMod + row.HealthToFoodMod
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_HealthMods("HealthToFoodMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			healthToFoodMod = healthToFoodMod + row.HealthToFoodMod
		end
	end
	return healthToFoodMod 
end
----------------
-- TEXT
----------------
--JFD_GetHealthTT
local buildingDevelopmentDeficitDiseaseID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE"]
local buildingDevelopmentSurplusHealthID  = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH"]
function JFD_GetHealthTT(playerID, city)
	local player = Players[playerID]
	local totalHealth, totalDisease = JFD_GetHealthTotal(playerID, city, true)
	local diseaseTT = ""
	local healthTT = ""
	--DISEASE
	--Population
	local diseasePopulation = JFD_GetDiseaseFromPopulation(playerID, city)
	diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_POPULATION", diseasePopulation)
	--Development
	local diseaseDevelopment = 0
	if userSettingDevelopmentCore then
		diseaseDevelopment = city:GetNumBuilding(buildingDevelopmentDeficitDiseaseID)
		if diseaseDevelopment ~= 0 then
			diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_DEVELOPMENT", diseaseDevelopment)
		end
	end
	--Buildings
	local diseaseBuilding = 0
	if (not city:HasBuildingClass(buildingClassRecyclingCenterID)) then
		diseaseBuilding = city:GetBaseYieldRateFromBuildings(yieldDiseaseID)
		diseaseBuilding = diseaseBuilding - diseaseDevelopment
	end
	if diseaseBuilding ~= 0 then
		if diseaseBuilding > 0 then diseaseBuilding = "+" .. diseaseBuilding end
		diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_BUILDINGS", diseaseBuilding)
	end
	--Terrain
	local diseaseTerrain = city:GetBaseYieldRateFromTerrain(yieldDiseaseID)
	if diseaseTerrain ~= 0 then
		if diseaseTerrain > 0 then diseaseTerrain = "+" .. diseaseTerrain end
		diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_TERRAIN", diseaseTerrain)
	end
	--Trade Routes
	local diseaseTradeRoute = JFD_GetDiseaseFromTradeRoutes(playerID, city)
	if diseaseTradeRoute ~= 0 then
		diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_TRADE", diseaseTradeRoute)
	end
	--City Connection
	local diseaseConnection = JFD_GetDiseaseFromCityConnectionMod(playerID, city)
	if diseaseConnection ~= 0 then
		diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_CITY_CONNECTION", diseaseConnection)
	end
	--Modifier
	local diseaseModifier = city:GetYieldRateModifier(yieldDiseaseID) + player:GetYieldRateModifier(yieldDiseaseID)
	if diseaseModifier ~= 0 then
		if diseaseModifier > 0 then diseaseModifier = "+" .. diseaseModifier end
		diseaseTT = diseaseTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_MODIFIERS", diseaseModifier)
	end
	--HEALTH
	--Development
	local healthDevelopment = 0
	if userSettingDevelopmentCore then
		healthDevelopment = city:GetNumBuilding(buildingDevelopmentSurplusHealthID)
		if healthDevelopment ~= 0 then
			healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_DEVELOPMENT", healthDevelopment)
		end
	end
	--Buildings
	local healthBuilding = city:GetBaseYieldRateFromBuildings(yieldHealthID)
	local healthCrime = JFD_GetRealCrimeLosses(city, GameInfoTypes["CRIME_JFD_HEALTH"])
	healthBuilding = healthBuilding + healthCrime
	healthBuilding = healthBuilding - healthDevelopment
	if healthBuilding ~= 0 then
		if healthBuilding > 0 then healthBuilding = "+" .. healthBuilding end
		healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_BUILDINGS", healthBuilding)
	end
	--Religion
	local healthReligion = city:GetBaseYieldRateFromReligion(yieldHealthID)
	if healthReligion ~= 0 then
		if healthReligion > 0 then healthReligion = "+" .. healthReligion end
		healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_RELIGION", healthReligion)
	end
	--Specialists
	local healthSpecialist = city:GetBaseYieldRateFromSpecialists(yieldHealthID)
	if healthSpecialist ~= 0 then
		if healthSpecialist > 0 then healthSpecialist = "+" .. healthSpecialist end
		healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_SPECIALISTS", healthSpecialist)
	end
	--Terrain
	local healthTerrain = city:GetBaseYieldRateFromTerrain(yieldHealthID)
	if healthTerrain ~= 0 then
		if healthTerrain > 0 then healthTerrain = "+" .. healthTerrain end
		healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_TERRAIN", healthTerrain)
	end
	-- Crime
	if healthCrime > 0 then
		healthTT = healthTT .. "[NEWLINE][ICON_BULLET]";
		healthTT = healthTT .. convertTextKey("TXT_KEY_HEALTH_FROM_CRIME", healthCrime);
	end
	--Modifier
	local healthModifier = city:GetYieldRateModifier(yieldHealthID) + player:GetYieldRateModifier(yieldHealthID) + city:GetModFromWLTKD(yieldHealthID)
	if healthModifier ~= 0 then
		if healthModifier > 0 then healthModifier = "+" .. healthModifier end
		healthTT = healthTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_MODIFIERS", healthModifier)
	end
	local plagueCounter, plagueThreshold, plagueTurns = JFD_GetPlagueCounter(playerID, city, true, true)
	local plagueTurnsHL = "[COLOR_JFD_DISEASE]"
	if totalDisease < totalHealth then
		plagueTurns = 0
		plagueTurnsHL = "[COLOR_JFD_HEALTH]"
	end
	if JFD_IsCityPlagued(city) then
		plagueTurns = JFD_GetNumPlagueTurns(city)
		local plagueID = JFD_GetCityPlagueID(city)
		local plague = GameInfo.JFD_Plagues[plagueID]
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT_TT_PLAGUED", diseaseTT, totalDisease, healthTT, totalHealth, plagueCounter, plagueThreshold, plagueTurnsHL, plagueTurns, plague.IconString, plague.Description)
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT_TT", diseaseTT, totalDisease, healthTT, totalHealth, plagueCounter, plagueThreshold, plagueTurnsHL, plagueTurns)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- PLAGUE
------------------------------------------------------------------------------------------------------------------------
local buildingPlagueID = GameInfoTypes["BUILDING_JFD_PLAGUE"]
--JFD_IsCityPlagued
function JFD_IsCityPlagued(city)
	for row in GameInfo.JFD_Plagues() do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			return true
		end
	end
	return false
end

--JFD_GetCityPlagueID
function JFD_GetCityPlagueID(city)
	for row in GameInfo.JFD_Plagues() do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			return row.ID
		end
	end
end

--JFD_SetCityPlagueID
local plagueBubonicID = GameInfoTypes["PLAGUE_JFD_BUBONIC"]
function JFD_SetCityPlagueID(playerID, city)
	local player = Players[playerID]
	local plagueID = 0
	local capital = player:GetCapitalCity()
	if (player:IsCapitalConnectedToCity(city) and JFD_IsCityPlagued(capital)) then
		return JFD_GetCityPlagueID(capital)
	end
	for _,v in ipairs(player:GetTradeRoutes()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if toCity == city then
			if JFD_IsCityPlagued(fromCity) then
				return JFD_GetCityPlagueID(fromCity)
			end
		end
	end
	for _,v in ipairs(player:GetTradeRoutesToYou()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if toCity == city then
			if JFD_IsCityPlagued(fromCity) then
				return JFD_GetCityPlagueID(fromCity)
			end
		end
	end
	local plagues = {}
	local count = 1
	for row in GameInfo.JFD_Plagues("IsEventOnly = 0") do
		plagues[count] = row.ID
		count = count + 1
	end
	plagueID = plagues[JFD_GetRandom(1,#plagues)]
	return plagueID or plagueBubonicID
end

--JFD_GetPlagueDescription
function JFD_GetPlagueDescription(playerID, city)
	local randomNum = JFD_GetRandom(1,41)
	if randomNum >= 40 then randomNum = 41 end
	return "TXT_KEY_JFD_PLAGUE_" .. randomNum
end
---------------
-- TURNS
---------------
--JFD_ChangeNumPlagueTurns
function JFD_ChangeNumPlagueTurns(city, plagueID, plagueTurns)
	local numPlagueTurns = JFD_GetNumPlagueTurns(city, plagueID)
	JFD_SetNumPlagueTurns(city, plagueID, (numPlagueTurns+plagueTurns))
end

--JFD_GetNumPlagueTurns
function JFD_GetNumPlagueTurns(city, plagueID)
	if (not plagueID) then
		plagueID = JFD_GetCityPlagueID(city)
	end
	if (not plagueID) then return 0 end
	local plague = GameInfo.JFD_Plagues[plagueID]
	return city:GetNumBuilding(GameInfoTypes[plague.BuildingType])
end

--JFD_SetNumPlagueTurns
function JFD_SetNumPlagueTurns(city, plagueID, plagueTurns)
	if (not plagueID) then return end
	local plague = GameInfo.JFD_Plagues[plagueID]
	city:SetNumRealBuilding(GameInfoTypes[plague.BuildingType], plagueTurns, true)
	if plagueTurns <= 0 then
		local playerID = city:GetOwner()
		LuaEvents.JFD_PlagueEnds(playerID, city, city:GetX(), city:GetY())
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_ENDS_NOTIFICATION", plague.IconString, plague.Description, city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_ENDS_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end
---------------
-- COUNTER
---------------
--JFD_GetPlagueCounter
local diseaseBuildingID = GameInfoTypes["BUILDING_JFD_DISEASE"]
function JFD_GetPlagueCounter(playerID, city, resturnsThreshold, returnsTurns)
	local player = Players[playerID]
	local excessHealth, excessDisease = JFD_GetExcessHealth(playerID, city, true)
	local totalHealth = JFD_GetHealthTotal(playerID, city)
	local plagueCounter = city:GetNumBuilding(diseaseBuildingID)
	local plagueThreshold = 0
	if resturnsThreshold then
		plagueThreshold = (totalHealth*10)+definePlagueMinThreshold
		--Buildings
		for row in GameInfo.Building_JFD_HealthMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				local plagueMod = row.PlagueMod
				local plagueGlobalMod = row.GlobalPlagueMod
				if plagueMod > 0 then
					plagueThreshold = plagueThreshold + ((plagueThreshold*plagueMod)/100)
				end
				if plagueGlobalMod > 0 then
					plagueThreshold = plagueThreshold + ((plagueThreshold*plagueGlobalMod)/100)
				end
			end
		end
		--Policies
		for row in GameInfo.Policy_JFD_HealthMods("PlagueMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				plagueThreshold = plagueThreshold + ((plagueThreshold*row.PlagueMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_HealthMods("PlagueMod <> 0") do
			if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
				plagueThreshold = plagueThreshold + ((plagueThreshold*row.PlagueMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_HealthMods("PlagueMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				plagueThreshold = plagueThreshold + ((plagueThreshold*row.PlagueMod)/100)
			end
		end
	end
	local plagueTurns = 0
	if (returnsTurns and excessDisease > 0) then
		plagueTurns = mathMax(0,JFD_Round((plagueCounter-plagueThreshold)/excessDisease)*-1)
	end
	return plagueCounter, plagueThreshold, plagueTurns+1
end

--JFD_ChangePlagueCounter
function JFD_ChangePlagueCounter(playerID, city, value)
	local player = Players[playerID]
	local plagueCounter, plagueThreshold, plagueTurns = JFD_GetPlagueCounter(playerID, city, true, true)
	JFD_SetPlagueCounter(playerID, city, (plagueCounter+value))
	plagueCounter, plagueThreshold, plagueTurns = JFD_GetPlagueCounter(playerID, city, true, true)
	if plagueCounter >= plagueThreshold then
		LuaEvents.JFD_PlagueBegins(playerID, JFD_SetCityPlagueID(playerID, city), city, city:GetX(), city:GetY(), value)
	elseif (userSettingHealthCoreFirstNotificationPlagueTurns > 0 and plagueTurns == userSettingHealthCoreFirstNotificationPlagueTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION", city:GetName(), plagueTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	elseif (userSettingHealthCoreSecondNotificationPlagueTurns > 0 and plagueTurns == userSettingHealthCoreSecondNotificationPlagueTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION", city:GetName(), plagueTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end

--JFD_SetPlagueCounter
function JFD_SetPlagueCounter(playerID, city, value)
	if value < 0 then value = 0 end
	city:SetNumRealBuilding(diseaseBuildingID, value, true)
end
--=======================================================================================================================
--=======================================================================================================================