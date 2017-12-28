-- JFD_CID_CrimesUtils
-- Author: Deo-e
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineCIDCrimePerGreatWork		= GameDefines["JFD_CID_CRIMES_PER_GREAT_WORKS"]
local defineCIDCrimePerSpecialist		= GameDefines["JFD_CID_CRIMES_PER_SPECIALISTS"]
local defineCIDCrimePerPopulation		= GameDefines["JFD_CID_CRIMES_PER_POPULATION"]	
local defineCIDOrganizedCrimeThreshold  = GameDefines["JFD_CID_CRIMES_ORGANIZED_THRESHOLD"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDCrimeCore			= (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
local userSettingCIDCrimeOrganizedCore	= (Game.GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED") == 1)
local userSettingCIDLoyaltyCore			= (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingCIDHappinessCore		= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
local userSettingCIDHealthCore			= (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
local userSettingCIDProvincesCore		= (Game.GetUserSetting("JFD_CID_PROVINCES_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey    = Locale.ConvertTextKey
local mathFloor    		= math.floor
local mathMax    		= math.max
------------------------------------------------------------------------------------------------------------------------
-- GENERAL
------------------------------------------------------------------------------------------------------------------------
local crimeFaithID		= GameInfoTypes["CRIME_JFD_FAITH"]
local crimeHappinessID	= GameInfoTypes["CRIME_JFD_HAPPINESS"]

--Player:GetTotalYields
local yieldCrimeID		= GameInfoTypes["YIELD_JFD_CRIME"]
local yieldFoodID    	= GameInfoTypes["YIELD_FOOD"]
local yieldGAPID    	= GameInfoTypes["YIELD_GOLDEN_AGE_POINTS"]
local yieldHappinessID  = GameInfoTypes["YIELD_HAPPINESS"]
local yieldHealthID		= GameInfoTypes["YIELD_JFD_HEALTH"]
local yieldTourismID	= GameInfoTypes["YIELD_TOURISM"]
local yieldScienceID	= GameInfoTypes["YIELD_SCIENCE"]
function Player.GetTotalYields(player, city)
	local yieldTotal = 0
	for row in GameInfo.JFD_Crimes() do
		local yieldID = GameInfoTypes[row.YieldType]
		--if yieldID == yieldFoodID then
		--	yieldTotal = yieldTotal + city:FoodDifference()
		if yieldID == yieldGAPID then
			yieldTotal = yieldTotal + player:GetBaseCityGAP(city)
		elseif yieldID == yieldHappinessID then
			yieldTotal = yieldTotal + mathMax(player:GetCityExcessHappiness(city, nil, true),0)
		elseif yieldID == yieldHealthID then
			yieldTotal = yieldTotal + mathMax(player:GetCityExcessHealth(city),0)
		elseif yieldID == yieldTourismID then
			yieldTotal = yieldTotal + city:GetBaseTourism()
		else
			yieldTotal = yieldTotal + city:GetBaseYieldRate(yieldID)
		end
		if yieldID == yieldHappinessID then
			yieldTotal = yieldTotal + city:GetYieldFromCrime(yieldCrimeID)*-1
		else
			yieldTotal = yieldTotal + city:GetYieldFromCrime(yieldID)*-1	
		end
	end
	return yieldTotal
end
------------------------------------------------------------------------------------------------------------------------
-- CRIME
------------------------------------------------------------------------------------------------------------------------
--Player:GetCrimePerGreatWork
function Player.GetCrimePerGreatWork(player, city)
	local crimeGreatWorks = defineCIDCrimePerGreatWork
	--Buildings
	for row in GameInfo.Building_JFD_CrimeMods("GreatWorkCrimeMod <> 0") do
		if row.IsLocal then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeGreatWorks = crimeGreatWorks + ((crimeGreatWorks*row.GreatWorkCrimeMod)/100) 
			end
		else
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeGreatWorks = crimeGreatWorks + ((crimeGreatWorks*row.GreatWorkCrimeMod)/100) 
			end
		end
	end	
	--Policies
	for row in GameInfo.Policy_JFD_CrimeMods("GreatWorkCrimeMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeGreatWorks = crimeGreatWorks + ((crimeGreatWorks*row.GreatWorkCrimeMod)/100) 
		end
	end	
	--Traits
	for row in GameInfo.Trait_JFD_CrimeMods("GreatWorkCrimeMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimeGreatWorks = crimeGreatWorks + ((crimeGreatWorks*row.GreatWorkCrimeMod)/100) 
		end
	end	
	--Reforms
	for row in GameInfo.JFD_Reform_CrimeMods("GreatWorkCrimeMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			crimeGreatWorks = crimeGreatWorks + ((crimeGreatWorks*row.GreatWorkCrimeMod)/100) 
		end
	end	
	return crimeGreatWorks
end

--Player:GetCrimePerPopulation
function Player.GetCrimePerPopulation(player, city)
	local crimePopulations = defineCIDCrimePerPopulation
	--Buildings
	for row in GameInfo.Building_JFD_CrimeMods("PopulationCrimeMod <> 0") do
		if row.IsLocal then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimePopulations = crimePopulations + ((crimeFromPopulations*row.PopulationCrimeMod)/100) 
			end
		else
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimePopulations = crimePopulations + ((crimeFromPopulations*row.PopulationCrimeMod)/100) 
			end
		end
	end	
	--Policies
	for row in GameInfo.Policy_JFD_CrimeMods("PopulationCrimeMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimePopulations = crimePopulations + ((crimeFromPopulations*row.PopulationCrimeMod)/100) 
		end
	end	
	--Traits
	for row in GameInfo.Trait_JFD_CrimeMods("PopulationCrimeMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimePopulations = crimePopulations + ((crimeFromPopulations*row.PopulationCrimeMod)/100) 
		end
	end	
	--Reforms
	for row in GameInfo.JFD_Reform_CrimeMods("PopulationCrimeMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			crimePopulations = crimePopulations + ((crimeFromPopulations*row.PopulationCrimeMod)/100) 
		end
	end	
	return crimePopulations
end

--Player:GetCrimePerSpecialist
function Player.GetCrimePerSpecialist(player, city, specialistID)
	local crimeThisSpecialist = defineCIDCrimePerSpecialist
	local specialist = GameInfo.Specialists[specialistID]
	local specialistType = specialist.Type
	if specialist.IsNoBaseCrime then crimeThisSpecialist = 0 end
	--Buildings
	for row in GameInfo.Building_SpecialistYieldChanges("YieldType = 'YIELD_JFD_CRIME' AND SpecialistType = '" .. specialistType .. "'") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			crimeThisSpecialist = crimeThisSpecialist + row.Yield
		end
	end
	for row in GameInfo.Building_SpecialistYieldChangesLocal("YieldType = 'YIELD_JFD_CRIME' AND SpecialistType = '" .. specialistType .. "'") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			crimeThisSpecialist = crimeThisSpecialist + row.Yield
		end
	end
	--Policies
	for row in GameInfo.Policy_SpecialistExtraYields("YieldType = 'YIELD_JFD_CRIME'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeThisSpecialist = crimeThisSpecialist + row.Yield
		end
	end	
	for row in GameInfo.Policy_SpecialistYieldChanges("YieldType = 'YIELD_JFD_CRIME' AND SpecialistType = '" .. specialistType .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeThisSpecialist = crimeThisSpecialist + row.Yield
		end
	end	
	--Specialists
	for row in GameInfo.SpecialistYields("YieldType = 'YIELD_JFD_CRIME' AND SpecialistType = '" .. specialistType .. "'") do
		crimeThisSpecialist = crimeThisSpecialist + row.Yield
	end	
	--Traits
	for row in GameInfo.Trait_SpecialistYieldChanges("YieldType = 'YIELD_JFD_CRIME' AND SpecialistType = '" .. specialistType .. "'") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimeThisSpecialist = crimeThisSpecialist + row.Yield
		end
	end	
	return crimeThisSpecialist
end

--Player:GetTotalCrimePerSpecialist
function Player.GetTotalCrimePerSpecialist(player, city)
	local crimeSpecialistsTotal = 0
	for specialist in GameInfo.Specialists("IsNoBaseCrime = 0") do
		crimeSpecialistsTotal = crimeSpecialistsTotal + (player:GetCrimePerSpecialist(city, specialist.ID)*city:GetSpecialistCount(specialist.ID))
	end
	--Buildings
	for row in GameInfo.Building_JFD_CrimeMods("SpecialistCrimeMod <> 0") do
		if row.IsLocal then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeSpecialistsTotal = crimeSpecialistsTotal + ((crimeSpecialistsTotal*row.SpecialistCrimeMod)/100) 
			end
		else
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeSpecialistsTotal = crimeSpecialistsTotal + ((crimeSpecialistsTotal*row.SpecialistCrimeMod)/100) 
			end
		end
	end	
	--Policies
	for row in GameInfo.Policy_JFD_CrimeMods("SpecialistCrimeMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeSpecialistsTotal = crimeSpecialistsTotal + ((crimeSpecialistsTotal*row.SpecialistCrimeMod)/100) 
		end
	end	
	--Traits
	for row in GameInfo.Trait_JFD_CrimeMods("SpecialistCrimeMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimeSpecialistsTotal = crimeSpecialistsTotal + ((crimeSpecialistsTotal*row.SpecialistCrimeMod)/100) 
		end
	end	
	--Reforms
	for row in GameInfo.JFD_Reform_CrimeMods("SpecialistCrimeMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			crimeSpecialistsTotal = crimeSpecialistsTotal + ((crimeSpecialistsTotal*row.SpecialistCrimeMod)/100) 
		end
	end	
	for specialist in GameInfo.Specialists("IsNoBaseCrime = 1") do
		crimeSpecialistsTotal = crimeSpecialistsTotal + (player:GetCrimePerSpecialist(city, specialist.ID)*city:GetSpecialistCount(specialist.ID))
	end
	return crimeSpecialistsTotal
end

--Player:GetCityCrimeTotal
function Player.GetCityCrimeTotal(player, city)
	if (not userSettingCIDCrimeCore) then return 0 end
	local crime = city:GetYieldRate(yieldCrimeID)
	crime = crime + city:GetYieldFromCrime(yieldCrimeID)*-1
	--Development
	crime = crime + mathFloor(player:GetDevelopmentYields(city, nil, true))
	--Great Works
	crime = crime + (player:GetCrimePerGreatWork(city)*city:GetNumGreatWorks())
	--Population
	crime = crime + (player:GetCrimePerPopulation(city)*city:GetPopulation())
	--Specialists
	crime = crime + player:GetTotalCrimePerSpecialist(city)
	--Free Buildings
	for building in GameInfo.Buildings("Cost > 0 AND GoldMaintenance == 0 AND HurryCostModifier > -1") do 
		local buildingID = building.ID
		if city:GetNumFreeBuilding(buildingID) > 0 then
			crime = crime - Game.GetBuildingYieldChange(buildingID, yieldCrimeID)
		end
	end
	local crimeMod = player:GetYieldRateModifier(yieldCrimeID)
	if crimeMod > 0 then crime = crime + (crime*crimeMod)/100 end
	if crime < 0 then crime = 0 end
	return Game.GetRound(crime, 1)
end

--Player:GetCrimeYields
function Player.GetCrimeYields(player, city, crimeID)
	if (userSettingCIDCrimeCore and crimeID) then
		local crime = GameInfo.JFD_Crimes[crimeID]
		if crime then
			if crimeID == crimeHappinessID then
				return city:GetYieldFromCrime(yieldCrimeID), city:GetYieldModifierFromCrime(yieldCrimeID), crime.Help
			else
				return city:GetYieldFromCrime(GameInfoTypes[crime.YieldType]), city:GetYieldModifierFromCrime(GameInfoTypes[crime.YieldType]), crime.Help
			end
		end
	end
	return 0, nil
end
--------------------
-- SPECIFICS
--------------------
--Player:GetCrimeRateMod
function Player.GetCrimeRateMod(player, city, crimeID)
	if (not userSettingCIDCrimeCore) then return 0 end
	local crime = GameInfo.JFD_Crimes[crimeID]
	local crimeType = crime.Type
	local crimeRateMod = 0
	local thisCrime = { CrimeType = crime.Type }
	--Buildings
	for row in GameInfo.Building_JFD_CrimeMods(thisCrime) do
		if row.IsLocal then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeRateMod = crimeRateMod + row.CrimeMod
			end
		else
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				crimeRateMod = crimeRateMod + row.CrimeMod
			end
		end
	end	
	--Policies
	for row in GameInfo.Policy_JFD_CrimeMods(thisCrime) do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	--Traits
	for row in GameInfo.Trait_JFD_CrimeMods(thisCrime) do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	--Reforms
	for row in GameInfo.JFD_Reform_CrimeMods(thisCrime) do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	--Loyalty
	local crimeRateLoyalty = 0
	for row in GameInfo.JFD_Loyalty_CrimeMods(thisCrime) do
		if city:GetLoyaltyState() == GameInfoTypes[row.LoyaltyType] then
			crimeRateLoyalty = crimeRateLoyalty + row.CrimeMod
		end
	end	
	--State Religion
	local crimeRateSecularization = 0
	local crimeRateStateReligion = 0
	if crimeID == crimeFaithID then
		if player:HasStateReligion() then 
			for row in GameInfo.JFD_PietyLevel_CrimeMods(thisCrime) do
				if player:GetPietyLevel() == GameInfoTypes[row.PietyLevelType] then
					crimeRateStateReligion = crimeRateStateReligion + row.CrimeMod
				end
			end	
		end
		if player:HasSecularized() then crimeRateSecularization = -100 end
	end
	crimeRateMod = crimeRateMod + crimeRateLoyalty + crimeRateStateReligion + crimeRateSecularization 
	return crimeRateMod
end

--Sukritact_GetTotal
function Sukritact_GetTotal(table)
    local finaValue = 0
    for _, value in pairs(table) do
        finaValue = finaValue + value
    end
    return finaValue
end

--Sukritact_GetCrimeValue
function Sukritact_GetCrimeValue(playerID, city, returnCrimeIDLosses, returnCrimeIDPercent)
	local player = Players[playerID]
	if (not returnCrimeIDLosses)  then returnCrimeIDLosses = -1  end
	if (not returnCrimeIDPercent) then returnCrimeIDPercent = -1 end
	local totalCrime = player:GetCityCrimeTotal(city)
	local totalYields = player:GetTotalYields(city)
	local yields = {}
	for row in GameInfo.JFD_Crimes("ID ORDER BY Type") do
		local yield = 0
		local yieldID = GameInfoTypes[row.YieldType]
		--if yieldID == yieldFoodID then
		--	yield = yield + city:FoodDifference()
		if yieldID == yieldGAPID then
			yield = player:GetBaseCityGAP(city)
		elseif yieldID == yieldHappinessID then
			yield = mathMax(player:GetCityExcessHappiness(city, nil, true),0)
		elseif yieldID == yieldHealthID then
			yield = mathMax(player:GetCityExcessHealth(city),0)
		elseif yieldID == yieldTourismID then
			yield = city:GetBaseTourism()
		else	
			yield = city:GetBaseYieldRate(yieldID)
		end
		if yieldID == yieldHappinessID then
			yield = yield + city:GetYieldFromCrime(yieldCrimeID)*-1
		else
			yield = yield + city:GetYieldFromCrime(yieldID)*-1		
		end
		yields[yieldID] = yield
	end
	local crimes = {}
	for yieldID, yield in pairs(yields) do
		crimes[yieldID] = Game.GetRound(yields[yieldID]/totalYields * totalCrime, 2)
	end
	local toRedistribute = {}
	local modifiedCrime = {}
	for yieldID, yield in pairs(crimes) do
		local crimeID = nil
		for row in GameInfo.JFD_Crimes("YieldType = '" .. GameInfo.Yields[yieldID].Type .. "'") do
			crimeID = row.ID
			break
		end
		local crimeMod = player:GetCrimeRateMod(city, crimeID)/100
		toRedistribute[yieldID] = Game.GetRound(crimes[yieldID] * crimeMod, 1) * -1
		modifiedCrime[yieldID] = crimes[yieldID] - toRedistribute[yieldID]
	end
	local totalToRedistribute = Sukritact_GetTotal(toRedistribute)
	local totalModifiedCrime = Sukritact_GetTotal(modifiedCrime)
	local redistributionRatio = {}
	for yieldID, yield in pairs(yields) do
		redistributionRatio[yieldID] = mathMax(0,Game.GetRound((modifiedCrime[yieldID]/totalModifiedCrime) * 100, 1))
		if yieldID == returnCrimeIDPercent then return redistributionRatio[yieldID] end
	end
	local finalCrime = {}
	local finalCrimeCount = 1
	for yieldID, yield in pairs(yields) do
		finalCrime[finalCrimeCount] = {}
		finalCrime[finalCrimeCount].Percent = redistributionRatio[yieldID]
		finalCrime[finalCrimeCount].YieldID = yieldID
		finalCrime[finalCrimeCount].YieldLoss = mathMax(0,modifiedCrime[yieldID] + Game.GetRound((modifiedCrime[yieldID]/totalModifiedCrime * totalToRedistribute), 1))
		if yieldID == returnCrimeIDLosses then return finalCrime[finalCrimeCount] end
		finalCrimeCount = finalCrimeCount + 1
	end
	return finalCrime
end
--------------------
-- TEXT
--------------------
--Player:GetCityCrimeTT 
function Player.GetCityCrimeTT(player, city, isProductionPanel, returnsTT)
	local highestCrimeID = -1
	local organizedCrimeThreshold, organizedCrimeThresholdTT = player:GetOrganizedCrimeThreshold(city, true)
	local crimeTT = ""
	local crimeLossesTT	= ""
	local crimeSpecificsTT = ""
	local crimeSpecificModsTT = ""
	local crimeTotal = player:GetCityCrimeTotal(city)
	if crimeTotal > 0 then
		if returnsTT then
			--Development
			local crimeDevelopment = mathFloor(player:GetDevelopmentYields(city, nil, true))
			if crimeDevelopment > 0 then
				crimeTT = crimeTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_DEVELOPMENT", crimeDevelopment)
			end
			--Buildings
			local crimeBuildings = city:GetBaseYieldRateFromBuildings(yieldCrimeID)
			for building in GameInfo.Buildings("Cost > 0 AND GoldMaintenance == 0 AND HurryCostModifier > -1") do 
				local buildingID = building.ID
				if city:GetNumFreeBuilding(buildingID) > 0 then
					crimeBuildings = crimeBuildings - Game.GetBuildingYieldChange(buildingID, yieldCrimeID)
				end
			end
			if crimeBuildings > 0 then
				crimeTT = crimeTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_BUILDINGS", crimeBuildings, "[ICON_JFD_CRIME_BLACK]")
			end
			--Great Works
			local crimeGreatWorks = (player:GetCrimePerGreatWork(city)*city:GetNumGreatWorks())
			if crimeGreatWorks ~= 0 then
				if crimeGreatWorks > 0 then crimeGreatWorks = "+" .. crimeGreatWorks end
				crimeTT = crimeTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_GREAT_WORKS", crimeGreatWorks)
			end
			--Population
			local crimeFromPop = (city:GetYieldPerPopTimes100(yieldCrimeID)/100) + (player:GetCrimePerPopulation(city)*city:GetPopulation())
			if crimeFromPop ~= 0 then
				if crimeFromPop > 0 then crimeFromPop = "+" .. crimeFromPop end
				crimeTT = crimeTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_POPULATION", crimeFromPop)
			end
			--Specialists
			local crimeSpecialists = city:GetBaseYieldRateFromSpecialists(yieldCrimeID) + city:GetExtraSpecialistYield(yieldCrimeID) + player:GetTotalCrimePerSpecialist(city)
			if crimeSpecialists ~= 0 then
				if crimeSpecialists > 0 then crimeSpecialists = "+" .. crimeSpecialists end
				crimeTT = crimeTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_SPECIALISTS", crimeSpecialists)
			end
			--Modifier
			local crimeMod = city:GetYieldRateModifier(yieldCrimeID) + player:GetYieldRateModifier(yieldCrimeID)
			if crimeMod ~= 0 then
				if crimeMod > 0 then crimeMod = "+" .. crimeMod end
				crimeSpecificModsTT = crimeSpecificModsTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_MODIFIERS", crimeMod, "[ICON_JFD_CRIME_BLACK]")
			end
		end
		--Crime Losses/Crime Specifics
		local crimes = Sukritact_GetCrimeValue(player:GetID(), city)
		table.sort(crimes, function(a,b) return a.Percent > b.Percent end)
		for _, crime in ipairs(crimes) do 
			local yieldLoss = crime.YieldLoss
			if yieldLoss > 0 then
				local yieldID = crime.YieldID
				local yieldInfo = GameInfo.Yields[yieldID]
				local crimeID = nil
				for row in GameInfo.JFD_Crimes("YieldType = '" .. GameInfo.Yields[yieldID].Type .. "'") do
					crimeID = row.ID
					if highestCrimeID == -1 then highestCrimeID = crimeID end
					break
				end
				local crimeInfo = GameInfo.JFD_Crimes[crimeID]
				local crimePercent = crime.Percent
				if returnsTT then
					crimeLossesTT = crimeLossesTT .. convertTextKey("[COLOR_WARNING_TEXT][NEWLINE][ICON_BULLET]-{1_Num} {2_Icon} from {3_Icon} {4_CrimeDesc}[ENDCOLOR]", yieldLoss, yieldInfo.IconString, crimeInfo.IconString, crimeInfo.Description)
					if (crimeID == highestCrimeID and crimePercent > organizedCrimeThreshold) then
						crimeSpecificsTT = crimeSpecificsTT .. convertTextKey("[NEWLINE][ICON_BULLET]{1_Icon} {2_Icon} {3_Percent}% {4_CrimeDesc} {5_Organized}", yieldInfo.IconString, crimeInfo.IconString, Game.GetRound(crimePercent), crimeInfo.Description, "TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_ORGANIZED")
					else
						crimeSpecificsTT = crimeSpecificsTT .. convertTextKey("[NEWLINE][ICON_BULLET]{1_Icon} {2_Icon} {3_Percent}% {4_CrimeDesc}", yieldInfo.IconString, crimeInfo.IconString, Game.GetRound(crimePercent), crimeInfo.Description)
					end
				end
			end
		end
		if returnsTT then
			--Specific Modifiers
			for crime in GameInfo.JFD_Crimes() do
				local crimeIcon = crime.IconString
				local thisCrime = { CrimeType = crime.Type }
				local crimeModifiers = 0
				local crimeLoyaltyModifiers = 0
				local crimeSecularizationModifiers = 0
				local crimeStateReligionModifiers = 0
				--Buildings
				local crimeBuildings = 0
				for row in GameInfo.Building_JFD_CrimeMods(thisCrime) do
					if row.IsLocal then
						if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
							crimeBuildings = crimeBuildings + row.CrimeMod 
						end
					else
						if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
							crimeBuildings = crimeBuildings + row.CrimeMod
						end
					end
				end
				if crimeBuildings ~= 0 then
					crimeModifiers = crimeModifiers + crimeBuildings
				end
				--Policies
				local crimeFromPolicies = 0
				for row in GameInfo.Policy_JFD_CrimeMods(thisCrime) do
					if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
						crimeFromPolicies = crimeFromPolicies + row.CrimeMod
					end
				end
				if crimeFromPolicies ~= 0 then
					crimeModifiers = crimeModifiers + crimeFromPolicies
				end
				--Reforms
				local crimeFromReforms = 0
				for row in GameInfo.JFD_Reform_CrimeMods(thisCrime) do
					if player:HasReform(GameInfoTypes[row.ReformType]) then
						crimeFromReforms = crimeFromReforms + row.CrimeMod
					end
				end
				if crimeFromReforms ~= 0 then
					crimeModifiers = crimeModifiers + crimeFromReforms
				end
				--Traits
				local crimeFromTraits = 0
				for row in GameInfo.Trait_JFD_CrimeMods(thisCrime) do
					if player:HasTrait(GameInfoTypes[row.TraitType]) then
						crimeFromTraits = crimeFromTraits + row.CrimeMod
					end
				end
				--Loyalty
				for row in GameInfo.JFD_Loyalty_CrimeMods(thisCrime) do
					if city:GetLoyaltyState() == GameInfoTypes[row.LoyaltyType] then
						crimeLoyaltyModifiers = crimeLoyaltyModifiers + row.CrimeMod
					end
				end	
				--State Religion
				if crime.ID == crimeFaithID then
					if player:HasStateReligion() then 
						for row in GameInfo.JFD_PietyLevel_CrimeMods(thisCrime) do
							if player:GetPietyLevel() == GameInfoTypes[row.PietyLevelType] then
								crimeStateReligionModifiers = crimeStateReligionModifiers + row.CrimeMod
							end
						end	
					end
					if player:HasSecularized() then crimeSecularizationModifiers = -100 end
				end
				crimeModifiers = crimeModifiers + crimeLoyaltyModifiers
				crimeModifiers = crimeModifiers + crimeStateReligionModifiers
				crimeModifiers = crimeModifiers + crimeSecularizationModifiers
				if crimeModifiers ~= 0 then
					if crimeModifiers > 0 then crimeModifiers = "+" .. crimeModifiers end
					crimeSpecificModsTT = crimeSpecificModsTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_MODIFIERS", crimeModifiers, crimeIcon)
				end
				if crimeLoyaltyModifiers ~= 0 then
					if crimeLoyaltyModifiers > 0 then crimeLoyaltyModifiers = "+" .. crimeLoyaltyModifiers end
					crimeSpecificModsTT = crimeSpecificModsTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_LOYALTY", crimeLoyaltyModifiers, crimeIcon)
				end
				if crimeStateReligionModifiers ~= 0 then
					if crimeStateReligionModifiers > 0 then crimeStateReligionModifiers = "+" .. crimeStateReligionModifiers end
					crimeSpecificModsTT = crimeSpecificModsTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_PIETY", crimeStateReligionModifiers, crimeIcon)
				end
				if crimeSecularizationModifiers ~= 0 then
					if crimeSecularizationModifiers > 0 then crimeSecularizationModifiers = "+" .. crimeSecularizationModifiers end
					crimeSpecificModsTT = crimeSpecificModsTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_SECULARIZATION", crimeSecularizationModifiers, crimeIcon)
				end
			end
		end
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_NONE", crimeTT, crimeTotal)
	end
	if isProductionPanel then
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_PRODUCTION_PANEL", crimeTT, crimeTotal, crimeLossesTT), highestCrimeID
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT", crimeTT, crimeTotal), convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_SPECIFICS", crimeSpecificsTT, crimeSpecificModsTT, crimeTotal, crimeLossesTT, organizedCrimeThreshold, organizedCrimeThresholdTT), highestCrimeID
	end
end
------------------------------------------------------------------------------------------------------------------------
-- ORGANIZED CRIME
------------------------------------------------------------------------------------------------------------------------
--Player:GetValidOrganizedCrimeID
function Player.GetValidOrganizedCrimeID(player, city)
	local organizedCrimeID = -1
	local organizedCrimeThreshold = player:GetOrganizedCrimeThreshold(city)
	for row in GameInfo.JFD_OrganizedCrimes() do
		if player:GetOrganizedCrimeValue(city, row.ID) > organizedCrimeThreshold then
			organizedCrimeID = row.ID
			break
		end
	end	
	return organizedCrimeID
end

--Player:GetOrganizedCrimeValue
function Player.GetOrganizedCrimeValue(player, city, organizedCrimeID)
	if (not userSettingCIDCrimeOrganizedCore) then return 0 end
	if city:IsResistance() then return 0 end
	local organizedCrime = GameInfo.JFD_OrganizedCrimes[organizedCrimeID]
	return Sukritact_GetCrimeValue(player:GetID(), city, nil, GameInfoTypes[organizedCrime.YieldType])
end

--Player:GetOrganizedCrimeThreshold
function Player.GetOrganizedCrimeThreshold(player, city, returnsTT)
	if (not userSettingCIDCrimeOrganizedCore) then return 0 end
	local organizedCrimeThreshold = defineCIDOrganizedCrimeThreshold
	local organizedCrimeThresholdTT = ""
	--Province
	local OCProvince = 0
	if userSettingCIDProvincesCore then
		local provinceID = player:GetProvinceLevelWeShouldBe(city)
		OCProvince = OCProvince + GameInfo.JFD_Provinces[provinceID].OrganizedCrimeMod
		if (returnsTT and OCProvince ~= 0) then 
			organizedCrimeThresholdTT = organizedCrimeThresholdTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TT_PROVINCE", OCProvince)
		end
	end	
	--Buildings
	local OCBuildings = 0
	for row in GameInfo.Building_JFD_OrganizedCrimeMods() do
		if row.IsLocal then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				OCBuildings = OCBuildings + row.ThresholdMod
			end
		else
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				OCBuildings = OCBuildings + row.ThresholdMod
			end
		end
	end
	if (returnsTT and OCBuildings ~= 0) then 
		organizedCrimeThresholdTT = organizedCrimeThresholdTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TT_BUILDINGS", OCBuildings)
	end
	--Policies
	local OCPolicies = 0
	for row in GameInfo.Policy_JFD_OrganizedCrimeMods() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			OCPolicies = OCPolicies + row.ThresholdMod
		end
	end
	if (returnsTT and OCPolicies ~= 0) then 
		organizedCrimeThresholdTT = organizedCrimeThresholdTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TT_POLICIES", OCPolicies)
	end
	--Reforms
	local OCReforms = 0
	for row in GameInfo.JFD_Reform_OrganizedCrimeMods() do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			OCReforms = OCReforms + row.ThresholdMod
		end
	end
	if (returnsTT and OCReforms ~= 0) then 
		organizedCrimeThresholdTT = organizedCrimeThresholdTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TT_REFORMS", OCReforms)
	end
	--Traits
	local OCTraits = 0
	for row in GameInfo.Trait_JFD_OrganizedCrimeMods() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			OCTraits = OCTraits + row.ThresholdMod
		end
	end
	if (returnsTT and OCTraits ~= 0) then 
		organizedCrimeThresholdTT = organizedCrimeThresholdTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TT_TRAITS", OCTraits)
	end
	organizedCrimeThreshold = defineCIDOrganizedCrimeThreshold + OCProvince + OCBuildings + OCPolicies + OCReforms + OCTraits
	return organizedCrimeThreshold, organizedCrimeThresholdTT
end
--=======================================================================================================================
--=======================================================================================================================