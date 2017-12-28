-- JFD_CID_HealthUtils
-- Author: JFD
-- DateCreated: 2/14/2017 10:06:20 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCIDHealthDiseaseConnectionMod	   = GameDefines["JFD_CID_HEALTH_DISEASE_CITY_CONNECTION_MODIFIER"] 
local defineCIDHealthDiseasePerPop		 	   = GameDefines["JFD_CID_HEALTH_DISEASE_PER_POPULATION"] 
local defineCIDHealthDiseaseTradeRoutesMod	   = GameDefines["JFD_CID_HEALTH_DISEASE_TRADE_ROUTE_MODIFIER"] 
local defineCIDHealthPlagueMinThreshold		   = 150
if Game then defineCIDHealthPlagueMinThreshold = (GameDefines["JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_" .. GameInfo.GameSpeeds[Game.GetGameSpeedType()].Type] or 150) end
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDDevelopmentCore    		 = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1)
local userSettingCIDHealthCore	 			 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
local userSettingCIDHealthCoreExcessFoodMod  = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD") == 1)
local userSettingCIDHealthCoreExcessFoodRaw  = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW") == 1)
local userSettingCIDHealthCoreExcessFood	 = (userSettingCIDHealthCoreExcessFoodMod or userSettingCIDHealthCoreExcessFoodRaw)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathMax		 = math.max
local mathMin		 = math.min
------------------------------------------------------------------------------------------------------------------------
-- HEALTH
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityHealthTotal
local yieldDiseaseID = GameInfoTypes["YIELD_JFD_DISEASE"]
local yieldFaithID   = GameInfoTypes["YIELD_FAITH"]
local yieldHealthID  = GameInfoTypes["YIELD_JFD_HEALTH"]
function Player.GetCityHealthTotal(player, city, returnsDisease, isBase)
	local totalHealth = city:GetYieldRate(yieldHealthID)
	for row in GameInfo.Beliefs("FaithToHealthRate > 0") do
		if player:HasBelief(row.ID) then
			totalHealth = totalHealth + ((city:GetYieldRate(yieldFaithID) * row.FaithToHealthRate)/100)
		end
	end
	if (not player:IsHuman()) then totalHealth = totalHealth + 6 end
	local totalDisease = 0
	local totalDiseaseLessMods = 0
	if returnsDisease then 
		totalDisease = totalDisease + city:GetYieldRate(yieldDiseaseID)
		totalDisease = totalDisease + player:GetCityDiseaseFromPopulation(city) 
		totalDiseaseLessMods = totalDisease
		if (not isBase) then
			totalDisease = totalDisease + player:GetCityDiseaseFromConnections(city, totalDiseaseLessMods)
			totalDisease = totalDisease + player:GetCityDiseaseFromTradeRoutes(city)
		end
		for building in GameInfo.Buildings("IsNoDiseaseFromBuildings = 1") do
			if city:HasBuilding(building.ID) then
				totalDisease = totalDisease - city:GetBaseYieldRateFromBuildings(yieldDiseaseID)
			end
		end
	end
	return Game.GetRound(totalHealth), Game.GetRound(totalDisease)
end

--Player:GetCityExcessHealth
function Player.GetCityExcessHealth(player, city, returnsDisease)
	if (not userSettingCIDHealthCore) then return 0, 0 end
	local totalHealth, totalDisease = player:GetCityHealthTotal(city, true)
	local excessHealth = (totalHealth-totalDisease)
	local excessDisease = 0
	if returnsDisease then excessDisease = (totalDisease-totalHealth) end
	return Game.GetRound(excessHealth), Game.GetRound(excessDisease)
end

--Player:GetCityExcessHealthBonusFood
function Player.GetCityExcessHealthBonusFood(player, city)
	local excessHealthBonus = 0
	for row in GameInfo.Building_JFD_HealthMods("HealthToFoodMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			excessHealthBonus = excessHealthBonus + row.HealthToFoodMod
		end
	end
	for row in GameInfo.Policy_JFD_HealthMods("HealthToFoodMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			excessHealthBonus = excessHealthBonus + row.HealthToFoodMod
		end
	end
	for row in GameInfo.JFD_Reform_HealthMods("HealthToFoodMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			excessHealthBonus = excessHealthBonus + row.HealthToFoodMod
		end
	end
	for row in GameInfo.Trait_JFD_HealthMods("HealthToFoodMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			excessHealthBonus = excessHealthBonus + row.HealthToFoodMod
		end
	end
	return excessHealthBonus
end
----------------
-- DISEASE
----------------
--Player:GetCityDiseaseFromConnections
function Player.GetCityDiseaseFromConnections(player, city, diseaseConnections)
	local capital = player:GetCapitalCity()
	if (capital:HasPlague() and player:IsCapitalConnectedToCity(city) and (not city:IsCapital())) then
		diseaseConnections = ((diseaseConnections*defineCIDHealthDiseaseConnectionMod)/100)
		for row in GameInfo.Building_JFD_HealthMods("DiseaseConnectionMod <> 0") do
			if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
				diseaseConnections = diseaseConnections + ((diseaseConnections*row.DiseaseConnectionMod)/100)
			end
		end
		for row in GameInfo.Policy_JFD_HealthMods("DiseaseConnectionMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				diseaseConnections = diseaseConnections + ((diseaseConnections*row.DiseaseConnectionMod)/100)
			end
		end
		for row in GameInfo.JFD_Reform_HealthMods("DiseaseConnectionMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				diseaseConnections = diseaseConnections + ((diseaseConnections*row.DiseaseConnectionMod)/100)
			end
		end
		for row in GameInfo.Trait_JFD_HealthMods("DiseaseConnectionMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				diseaseConnections = diseaseConnections + ((diseaseConnections*row.DiseaseConnectionMod)/100)
			end
		end
		diseaseConnections = Game.GetRound(diseaseConnections)
		return mathMax(diseaseConnections,0)
	else
		return 0
	end
end

--Player:GetCityDiseaseFromPopulation
function Player.GetCityDiseaseFromPopulation(player, city)
	local diseasePopulation = (city:GetPopulation()*defineCIDHealthDiseasePerPop)
	for row in GameInfo.Building_JFD_HealthMods("DiseasePopMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_HealthMods("DiseasePopMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_HealthMods("DiseasePopMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_HealthMods("DiseasePopMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			diseasePopulation = diseasePopulation + ((diseasePopulation*row.DiseasePopMod)/100)
		end
	end
	diseasePopulation = Game.GetRound(diseasePopulation)
	return mathMax(diseasePopulation,0)
end

--Player:GetNumDiseaseFromTradeRoute
function Player.GetNumDiseaseFromTradeRoute(player, city)
	local numDisease = 0
	local totalHealth, totalDisease = player:GetCityHealthTotal(city, true, true)
	numDisease = numDisease + ((totalDisease*defineCIDHealthDiseaseTradeRoutesMod)/100)
	for row in GameInfo.Building_JFD_HealthMods("DiseaseTRMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			numDisease = numDisease + ((numDisease*row.DiseaseTRMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_HealthMods("DiseaseTRMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numDisease = numDisease + ((numDisease*row.DiseaseTRMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_HealthMods("DiseaseTRMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numDisease = numDisease + ((numDisease*row.DiseaseTRMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_HealthMods("DiseaseTRMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numDisease = numDisease + ((numDisease*row.DiseaseTRMod)/100)
		end
	end
	return Game.GetRound(numDisease)
end

--Player:GetCityDiseaseFromTradeRoutes
function Player.GetCityDiseaseFromTradeRoutes(player, city)
	local diseaseTradeRoutes = 0
	local diseaseTradeRouteRate = defineCIDHealthDiseaseTradeRoutesMod
	local diseaseTradeRoutesMod = 0
	for _,v in ipairs(player:GetTradeRoutes()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if fromCity == city then
			diseaseTradeRoutes = diseaseTradeRoutes + Players[fromCity:GetOwner()]:GetNumDiseaseFromTradeRoute(toCity)
		elseif toCity == city then
			diseaseTradeRoutes = diseaseTradeRoutes + Players[toCity:GetOwner()]:GetNumDiseaseFromTradeRoute(fromCity)
		end
	end
	for _,v in ipairs(player:GetTradeRoutesToYou()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if fromCity == city then
			diseaseTradeRoutes = diseaseTradeRoutes + Players[fromCity:GetOwner()]:GetNumDiseaseFromTradeRoute(toCity)
		elseif toCity == city then
			diseaseTradeRoutes = diseaseTradeRoutes + Players[toCity:GetOwner()]:GetNumDiseaseFromTradeRoute(fromCity)
		end
	end
	return mathMax(diseaseTradeRoutes,0)
end
----------------
-- TEXT
----------------
--Player:GetCityHealthTT
function Player.GetCityHealthTT(player, city)
	local totalHealth, totalDisease = player:GetCityHealthTotal(city, true)
	local toolTipHealth = ""
	local toolTipDisease = ""
	local toolTipPlagueSentiment = nil
	--DISEASE
	--Population
	local diseasePopulation = player:GetCityDiseaseFromPopulation(city)
	toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_POPULATION", diseasePopulation)
	--Development
	local diseaseDevelopment = city:GetYieldFromDevelopment(yieldDiseaseID)
	if diseaseDevelopment ~= 0 then
		if diseaseDevelopment > 0 then diseaseDevelopment = "+" .. diseaseDevelopment end
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_DEVELOPMENT", diseaseDevelopment)
	end
	--Buildings
	local diseaseBuilding = city:GetBaseYieldRateFromBuildings(yieldDiseaseID)
	for building in GameInfo.Buildings("IsNoDiseaseFromBuildings = 1") do
		if city:HasBuilding(building.ID) then
			diseaseBuilding = 0
			break
		end
	end
	if diseaseBuilding ~= 0 then
		if diseaseBuilding > 0 then diseaseBuilding = "+" .. diseaseBuilding end
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_BUILDINGS", diseaseBuilding)
	end
	--Terrain
	local diseaseTerrain = city:GetBaseYieldRateFromTerrain(yieldDiseaseID)
	if diseaseTerrain ~= 0 then
		if diseaseTerrain > 0 then diseaseTerrain = "+" .. diseaseTerrain end
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_TERRAIN", diseaseTerrain)
	end
	--City Connection
	local diseaseConnection = player:GetCityDiseaseFromConnections(city, totalDisease)
	if diseaseConnection ~= 0 then
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_CITY_CONNECTION", diseaseConnection)
	end
	--Trade Routes
	local diseaseTradeRoute = player:GetCityDiseaseFromTradeRoutes(city, totalDisease)
	if diseaseTradeRoute ~= 0 then
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_TRADE", diseaseTradeRoute)
	end
	--Modifier
	local diseaseModifier = city:GetYieldRateModifier(yieldDiseaseID) + player:GetYieldRateModifier(yieldDiseaseID)
	if diseaseModifier ~= 0 then
		if diseaseModifier > 0 then diseaseModifier = "+" .. diseaseModifier end
		toolTipDisease = toolTipDisease .. convertTextKey("TXT_KEY_CITYVIEW_JFD_DISEASE_TT_FROM_MODIFIERS", diseaseModifier)
	end
	--HEALTH
	--Development
	local healthDevelopment = city:GetYieldFromDevelopment(yieldHealthID)
	if healthDevelopment ~= 0 then
		if healthDevelopment > 0 then healthDevelopment = "+" .. healthDevelopment end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_DEVELOPMENT", healthDevelopment)
	end
	--Buildings
	local healthBuilding = city:GetBaseYieldRateFromBuildings(yieldHealthID)
	if healthBuilding ~= 0 then
		if healthBuilding > 0 then healthBuilding = "+" .. healthBuilding end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_BUILDINGS", healthBuilding)
	end
	--Religion
	local healthReligion = city:GetBaseYieldRateFromReligion(yieldHealthID)
	if healthReligion ~= 0 then
		if healthReligion > 0 then healthReligion = "+" .. healthReligion end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_RELIGION", healthReligion)
	end
	--Faith
	local healthFaith = 0
	for row in GameInfo.Beliefs("FaithToHealthRate > 0") do
		if city:HasBelief(row.ID) then
			healthFaith = ((city:GetYieldRate(yieldFaithID) * row.FaithToHealthRate)/100)
		end
	end
	if healthFaith ~= 0 then
		if healthFaith > 0 then healthFaith = "+" .. healthFaith end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_FAITH", healthFaith)
	end
	--Specialists
	local healthSpecialist = city:GetBaseYieldRateFromSpecialists(yieldHealthID)
	if healthSpecialist ~= 0 then
		if healthSpecialist > 0 then healthSpecialist = "+" .. healthSpecialist end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_SPECIALISTS", healthSpecialist)
	end
	--Terrain
	local healthTerrain = city:GetBaseYieldRateFromTerrain(yieldHealthID)
	if healthTerrain ~= 0 then
		if healthTerrain > 0 then healthTerrain = "+" .. healthTerrain end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_TERRAIN", healthTerrain)
	end
	--Crime
	local healthCrime = city:GetYieldFromCrime(yieldHealthID)
	if healthCrime ~= 0 then
		toolTipHealth = toolTipHealth .. "[NEWLINE][ICON_BULLET]";
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_HEALTH_FROM_CRIME", healthCrime);
	end
	local healthCrimeMod = city:GetYieldModifierFromCrime(yieldHealthID)
	if healthCrimeMod ~= 0 then
		toolTipHealth = toolTipHealth .. "[NEWLINE][ICON_BULLET]";
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_HEALTH_FROM_CRIME", healthCrimeMod .. "%");
	end
	--Modifier
	local healthModifier = city:GetYieldRateModifier(yieldHealthID) + player:GetYieldRateModifier(yieldHealthID) + city:GetModFromWLTKD(yieldHealthID)
	if healthModifier ~= 0 then
		if healthModifier > 0 then healthModifier = "+" .. healthModifier end
		toolTipHealth = toolTipHealth .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_TT_FROM_MODIFIERS", healthModifier)
	end
	local plagueCounter, plagueThreshold, plagueTurns = player:GetCityPlagueCounterDetails(city, true, true)
	local plagueTurnsHL = "[COLOR_JFD_DISEASE]"
	if totalDisease < totalHealth then
		plagueTurns = 0
		plagueTurnsHL = "[COLOR_JFD_HEALTH]"
	end
	toolTipPlagueSentiment = convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_PLAGUE_SENTIMENT_TEXT_TT", plagueTurnsHL, plagueCounter, plagueThreshold)
	if (plagueTurns > 0 and (not city:HasPlague())) then
		toolTipPlagueSentiment = toolTipPlagueSentiment .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HEALTH_PLAGUE_TURNS_TEXT_TT", plagueTurnsHL, plagueTurns)
	end
	if userSettingCIDHealthCoreExcessFood then
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT_TT_FOOD", toolTipDisease, totalDisease, toolTipHealth, totalHealth), toolTipPlagueSentiment
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT_TT", toolTipDisease, totalDisease, toolTipHealth, totalHealth), toolTipPlagueSentiment
	end
end
------------------------------------------------------------------------------------------------------------------------
-- PLAGUE
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityPlagueTypeToSpawn
local plagueBubonicID = GameInfoTypes["PLAGUE_JFD_BUBONIC"]
function Player.GetCityPlagueTypeToSpawn(player, city)
	local capital = player:GetCapitalCity()
	if (capital and player:IsCapitalConnectedToCity(city) and capital:HasPlague()) then
		return capital:GetPlagueType()
	end
	for _,v in ipairs(player:GetTradeRoutes()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if toCity == city then
			if fromCity:HasPlague() then
				return fromCity:GetPlagueType()
			end
		end
	end
	for _,v in ipairs(player:GetTradeRoutesToYou()) do
		local fromCity = v.FromCity
		local toCity = v.ToCity
		if toCity == city then
			if fromCity:HasPlague() then
				return fromCity:GetPlagueType()
			end
		end
	end
	local plagueID = plagueBubonicID
	local plagues = {}
	local count = 1
	for row in GameInfo.JFD_Plagues("IsEventOnly = 0") do
		plagues[count] = row.ID
		count = count + 1
	end
	plagueID = plagues[Game.GetRandom(1,#plagues)]
	return plagueID or plagueBubonicID
end

--Player:GetCityPlagueCounterDetails
function Player.GetCityPlagueCounterDetails(player, city, resturnsThreshold, returnsTurns)
	local excessHealth, excessDisease = player:GetCityExcessHealth(city, true)
	local totalHealth = player:GetCityHealthTotal(city)
	local plagueCounter = city:GetPlagueCounter()
	local plagueThreshold = 0
	if resturnsThreshold then
		plagueThreshold = (totalHealth*10)+defineCIDHealthPlagueMinThreshold
		--Buildings
		for row in GameInfo.Building_JFD_HealthMods("PlagueMod <> 0") do
			if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
				plagueThreshold = plagueThreshold + ((plagueThreshold*row.PlagueMod)/100)
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
			if player:HasReform(GameInfoTypes[row.ReformType]) then
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
		plagueTurns = mathMax(1,Game.GetRound((plagueCounter-plagueThreshold)/excessDisease)*-1)
	end
	return plagueCounter, plagueThreshold, plagueTurns
end
--=======================================================================================================================
--=======================================================================================================================