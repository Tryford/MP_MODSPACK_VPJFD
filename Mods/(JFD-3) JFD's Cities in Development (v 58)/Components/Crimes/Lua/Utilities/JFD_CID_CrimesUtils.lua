-- JFD_CID_CrimesUtils
-- Author: Deo-e
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
include("JFD_CID_HappinessUtils.lua");
include("JFD_CID_HealthUtils.lua");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineCrimePerGreatWorks		= GameDefines["JFD_CID_CRIMES_PER_GREAT_WORKS"]
local defineCrimePerSpecialist		= GameDefines["JFD_CID_CRIMES_PER_SPECIALISTS"]
local defineCrimePerPopulation		= GameDefines["JFD_CID_CRIMES_PER_POPULATION"]	
local defineOrganizedCrimeThreshold = GameDefines["JFD_CID_CRIMES_ORGANIZED_THRESHOLD"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCrimesCore			= JFD_GetUserSetting("JFD_CID_CRIMES_CORE") == 1
local userSettingCrimesUffizi		= JFD_GetUserSetting("JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI") == 1

local userSettingLoyaltyCore		= JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingHappinessCore		= JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingHealthCore			= JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathFloor 	 = math.floor
local mathCeil 		 = math.ceil
local mathMin 		 = math.min
------------------------------------------------------------------------------------------------------------------------
-- GENERAL
------------------------------------------------------------------------------------------------------------------------
--JFD_GetTotalYields
local yieldDefenseID    = GameInfoTypes["YIELD_DEFENSE"]
local yieldHappinessID  = GameInfoTypes["YIELD_HAPPINESS"]
local yieldHealthID		= GameInfoTypes["YIELD_JFD_HEALTH"]
local yieldTourismID	= GameInfoTypes["YIELD_TOURISM"]
local yieldScienceID	= GameInfoTypes["YIELD_SCIENCE"]
function JFD_GetTotalYields(playerID, city)
	local player = Players[playerID]
	local yieldTotal = 0
	for row in GameInfo.JFD_Crimes() do
		local yieldID = GameInfoTypes[row.YieldType]
		local buildingID = GameInfoTypes[row.BuildingType]
		if yieldID == yieldDefenseID then
			yieldTotal = yieldTotal + JFD_GetCityDefense(city, true)
		elseif yieldID == yieldHappinessID then
			yieldTotal = yieldTotal + JFD_GetHappinessTotal(playerID, city)
		elseif yieldID == yieldHealthID then
			yieldTotal = yieldTotal + JFD_GetHealthTotal(playerID, city)
		elseif yieldID == yieldTourismID then
			yieldTotal = yieldTotal + city:GetBaseTourism()
		else
			yieldTotal = yieldTotal + city:GetYieldRate(yieldID)
		end
		yieldTotal = yieldTotal + city:GetNumBuilding(buildingID)
	end
	return yieldTotal
end
------------------------------------------------------------------------------------------------------------------------
-- CRIME
------------------------------------------------------------------------------------------------------------------------
local buildingUffiziID		= GameInfoTypes["BUILDING_UFFIZI"]
local crimeFaithID			= GameInfoTypes["CRIME_JFD_FAITH"]
local loyaltyRebelliousID	= GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID	= GameInfoTypes["LOYALTY_JFD_SEPARATIST"]
local pietyLevelHereticalID	= GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
local pietyLevelPoorID		= GameInfoTypes["PIETY_LEVEL_JFD_POOR"]
local yieldCrimeID		    = GameInfoTypes["YIELD_JFD_CRIME"]

--JFD_GetCrimePerSpecialist
function JFD_GetCrimePerSpecialist(playerID, city)
	local player = Players[playerID]
	local crimeFromSpecialists = defineCrimePerSpecialist
	for row in GameInfo.Policy_JFD_CrimeMods("SpecialistCrimeMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeFromSpecialists = crimeFromSpecialists + ((crimeFromSpecialists*row.SpecialistCrimeMod)/100) 
		end
	end
	return crimeFromSpecialists
end

--JFD_GetCrimeTotal
function JFD_GetCrimeTotal(playerID, city)
	local player = Players[playerID]
	if (not userSettingCrimesCore) then return 0 end
	local crime = city:GetYieldRate(yieldCrimeID)
	local excessHealth, excessDisease = JFD_GetExcessHealth(playerID, city, true)
	local crimeFromGreatWorks = (defineCrimePerGreatWorks*city:GetNumGreatWorks())
	if (userSettingCrimesUffizi and city:HasBuilding(buildingUffiziID)) then crimeFromGreatWorks = 0 end
	if crimeFromGreatWorks > 0 then crime = crime + crimeFromGreatWorks end
	local crimeFromPopulation = (defineCrimePerPopulation*city:GetPopulation())
	if crimeFromPopulation > 0 then crime = crime + crimeFromPopulation end
	local crimeFromSpecialists = (JFD_GetCrimePerSpecialist(playerID, city)*city:GetTotalSpecialistCount())
	if crimeFromSpecialists > 0 then crime = crime + crimeFromSpecialists end
	--Free Buildings
	for building in GameInfo.Buildings("Cost > 0 AND GoldMaintenance == 0 AND HurryCostModifier > -1") do 
		local buildingID = building.ID
		if city:GetNumFreeBuilding(buildingID) > 0 then
			crime = crime - Game.GetBuildingYieldChange(buildingID, yieldCrimeID)
		end
	end
	local crimeMod = player:GetYieldRateModifier(yieldCrimeID)
	if crimeMod > 0 then crime = crime + (crime*crimeMod)/100 end
	return JFD_Round(crime, 1)
end

--JFD_GetCrimeRateMod
function JFD_GetCrimeRateMod(playerID, city, crimeID)
	local player = Players[playerID]
	if (not userSettingCrimesCore) then return 0 end
	local crime = GameInfo.JFD_Crimes[crimeID]
	local crimeType = crime.Type
	local crimeRateMod = 0
	local thisCrime = { CrimeType = crime.Type }
	for row in GameInfo.Building_JFD_CrimeMods(thisCrime) do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			crimeRateMod = crimeRateMod + row.GlobalCrimeMod
		end
	end	
	for row in GameInfo.Policy_JFD_CrimeMods(thisCrime) do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	for row in GameInfo.Trait_JFD_CrimeMods(thisCrime) do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	for row in GameInfo.JFD_Reform_CrimeMods(thisCrime) do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			crimeRateMod = crimeRateMod + row.CrimeMod
		end
	end	
	if crimeID == crimeFaithID then
		if player:HasStateReligion() then
			local pietyLevelID = JFD_GetPietyLevelID(playerID)
			if pietyLevelID == pietyLevelPoorID then
				crimeRateMod = crimeRateMod + 50
			elseif pietyLevelID == pietyLevelHereticalID then
				crimeRateMod = crimeRateMod + 100
			end
		end
		if player:HasSecularized() then  crimeRateMod = crimeRateMod - 100 end
	end
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
	if (not returnCrimeIDLosses)  then returnCrimeIDLosses = -1  end
	if (not returnCrimeIDPercent) then returnCrimeIDPercent = -1 end
	local totalCrime = JFD_GetCrimeTotal(playerID, city)
	local totalYields = JFD_GetTotalYields(playerID, city)
	local yields = {}
	for row in GameInfo.JFD_Crimes("ID ORDER BY Type") do
		local buildingID = GameInfoTypes[row.BuildingType]
		local yield = 0
		local yieldID = GameInfoTypes[row.YieldType]
		if yieldID == yieldDefenseID then
			yield = JFD_GetCityDefense(city, true)
		elseif yieldID == yieldHappinessID then
			yield = JFD_GetHappinessTotal(playerID, city)
		elseif yieldID == yieldHealthID then
			yield = JFD_GetHealthTotal(playerID, city)
		elseif yieldID == yieldTourismID then
			yield = city:GetBaseTourism()
		elseif yieldID == yieldScienceID then
			yield = city:GetBaseYieldRate(yieldScienceID)
		else	
			yield = city:GetYieldRate(yieldID)
		end
		yield = yield + city:GetNumBuilding(buildingID)
		yields[yieldID] = yield
	end
	local crimes = {}
	for yieldID, yield in pairs(yields) do
		crimes[yieldID] = JFD_Round(yields[yieldID]/totalYields * totalCrime, 1)
	end
	local toRedistribute = {}
	local modifiedCrime = {}
	for yieldID, yield in pairs(crimes) do
		local crimeID = nil
		for row in GameInfo.Yields_JFD_CrimeTypes("YieldType = '" .. GameInfo.Yields[yieldID].Type .. "'") do
			crimeID = GameInfoTypes[row.CrimeType]
			break
		end
		local crimeMod = JFD_GetCrimeRateMod(playerID, city, crimeID)/100
		toRedistribute[yieldID] = JFD_Round(crimes[yieldID] * crimeMod, 1) * -1
		modifiedCrime[yieldID] = crimes[yieldID] - toRedistribute[yieldID]
	end
	local totalToRedistribute = Sukritact_GetTotal(toRedistribute)
	local totalModifiedCrime = Sukritact_GetTotal(modifiedCrime)
	local redistributionRatio = {}
	for yieldID, yield in pairs(yields) do
		redistributionRatio[yieldID] = JFD_Round((modifiedCrime[yieldID]/totalModifiedCrime) * 100, 1)
		if yieldID == returnCrimeIDPercent then return redistributionRatio[yieldID] end
	end
	local finalCrime = {}
	local finalCrimeCount = 1
	for yieldID, yield in pairs(yields) do
		finalCrime[finalCrimeCount] = {}
		finalCrime[finalCrimeCount].Percent = redistributionRatio[yieldID]
		finalCrime[finalCrimeCount].YieldID = yieldID
		finalCrime[finalCrimeCount].YieldLoss = modifiedCrime[yieldID] + JFD_Round((modifiedCrime[yieldID]/totalModifiedCrime * totalToRedistribute), 1)
		if yieldID == returnCrimeIDLosses then return finalCrime[finalCrimeCount] end
		finalCrimeCount = finalCrimeCount + 1
	end
	return finalCrime
end
--------------------
-- TEXT
--------------------
--JFD_GetCrimeBreakdownTT 
local buildingDevelopmentDeficitCrimeID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME"]
function JFD_GetCrimeBreakdownTT(playerID, city)
	local player = Players[playerID]
	local crimeBreakdownTT = ""
	local crimePercentsTT = ""
	local crimeLossesTT	= nil
	local crimeTotal = JFD_GetCrimeTotal(playerID, city)
	if crimeTotal > 0 then
		--Development
		local crimeFromDevelopment = city:GetNumBuilding(buildingDevelopmentDeficitCrimeID)
		if crimeFromDevelopment > 0 then
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_DEVELOPMENT", crimeFromDevelopment)
		end
		--Buildings
		local crimeFromBuildings = city:GetBaseYieldRateFromBuildings(yieldCrimeID)
		crimeFromBuildings = crimeFromBuildings - crimeFromDevelopment
		for building in GameInfo.Buildings("Cost > 0 AND GoldMaintenance == 0 AND HurryCostModifier > -1") do 
			local buildingID = building.ID
			if city:GetNumFreeBuilding(buildingID) > 0 then
				crimeFromBuildings = crimeFromBuildings - Game.GetBuildingYieldChange(buildingID, yieldCrimeID)
			end
		end
		if crimeFromBuildings > 0 then
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_BUILDINGS", crimeFromBuildings, "[ICON_JFD_CRIME_BLACK]")
		end
		--Great Works
		local crimeFromGreatWorks = (defineCrimePerGreatWorks*city:GetNumGreatWorks())
		if (userSettingCrimesUffizi and city:HasBuilding(buildingUffiziID)) then crimeFromGreatWorks = 0 end
		if crimeFromGreatWorks > 0 then
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_GREAT_WORKS", crimeFromGreatWorks)
		end
		--Population
		local crimeFromPop = (city:GetYieldPerPopTimes100(yieldCrimeID)/100)
		crimeFromPop = crimeFromPop + (defineCrimePerPopulation*city:GetPopulation())
		if crimeFromPop ~= 0 then
			if crimeFromPop > 0 then crimeFromPop = "+" .. crimeFromPop end
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_POPULATION", crimeFromPop)
		end
		--Specialists
		local crimeFromSpecialists = city:GetBaseYieldRateFromSpecialists(yieldCrimeID) + city:GetExtraSpecialistYield(yieldCrimeID)
		crimeFromSpecialists = crimeFromSpecialists + (JFD_GetCrimePerSpecialist(playerID, city)*city:GetTotalSpecialistCount())
		if crimeFromSpecialists ~= 0 then
			if crimeFromSpecialists > 0 then crimeFromSpecialists = "+" .. crimeFromSpecialists end
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_SPECIALISTS", crimeFromSpecialists)
		end
		--Modifier
		local crimeMod = city:GetYieldRateModifier(yieldCrimeID) + player:GetYieldRateModifier(yieldCrimeID)
		if crimeMod ~= 0 then
			if crimeMod > 0 then crimeMod = "+" .. crimeMod end
			crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_MODIFIERS", crimeMod, "[ICON_JFD_CRIME_BLACK]")
		end
		for crime in GameInfo.JFD_Crimes() do
			local crimeIcon = crime.IconString
			local thisCrime = { CrimeType = crime.Type }
			local crimeFromModifiers = 0
			local crimeFromLoyalty = 0
			--Buildings
			local crimeFromBuildings = 0
			for row in GameInfo.Building_JFD_CrimeMods(thisCrime) do
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					crimeFromBuildings = crimeFromBuildings + row.CrimeMod + row.GlobalCrimeMod
				end
			end
			if crimeFromBuildings ~= 0 then
				crimeFromModifiers = crimeFromModifiers + crimeFromBuildings
			end
			--Policies
			local crimeFromPolicies = 0
			for row in GameInfo.Policy_JFD_CrimeMods(thisCrime) do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					crimeFromPolicies = crimeFromPolicies + row.CrimeMod
				end
			end
			if crimeFromPolicies ~= 0 then
				crimeFromModifiers = crimeFromModifiers + crimeFromPolicies
			end
			--Reforms
			local crimeFromReforms = 0
			for row in GameInfo.JFD_Reform_CrimeMods(thisCrime) do
				if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
					crimeFromReforms = crimeFromReforms + row.CrimeMod
				end
			end
			if crimeFromReforms ~= 0 then
				crimeFromModifiers = crimeFromModifiers + crimeFromReforms
			end
			--Traits
			local crimeFromTraits = 0
			for row in GameInfo.Trait_JFD_CrimeMods(thisCrime) do
				if player:HasTrait(GameInfoTypes[row.TraitType]) then
					crimeFromTraits = crimeFromTraits + row.CrimeMod
				end
			end
			if crimeFromTraits ~= 0 then
				crimeFromModifiers = crimeFromModifiers + crimeFromTraits
			end
			--Loyalty
			for row in GameInfo.Building_JFD_CrimeMods("IsLoyalty = 1 AND CrimeType = '" .. crime.Type .. "'") do
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					crimeFromLoyalty = crimeFromLoyalty + row.CrimeMod
				end
			end
			crimeFromModifiers = crimeFromModifiers - crimeFromLoyalty
			if crimeFromModifiers ~= 0 then
				if crimeFromModifiers > 0 then crimeFromModifiers = "+" .. crimeFromModifiers end
				crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_MODIFIERS", crimeFromModifiers, crimeIcon)
			end
			if crimeFromLoyalty ~= 0 then
				if crimeFromLoyalty > 0 then crimeFromLoyalty = "+" .. crimeFromLoyalty end
				crimeFromModifiers = crimeFromLoyalty .. "%"
				local loyaltyID = JFD_GetCityLoyaltyID(playerID, city)
				crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_FROM_LOYALTY", crimeFromLoyalty, crimeIcon, GameInfo.JFD_Loyalties[loyaltyID].IconString)
			end
			--Piety
			if (player:HasStateReligion() and crime.Type == "CRIME_JFD_FAITH") then
				local pietyLevelID = JFD_GetPietyLevelID(playerID)
				if pietyLevelID == pietyLevelPoorID then
					crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_PIETY_POOR", 50)
				elseif pietyLevelID == pietyLevelHereticalID then
					crimeBreakdownTT = crimeBreakdownTT .. convertTextKey("TXT_KEY_CITYVIEW_JFD_CRIME_TT_PIETY_HERETICAL", 100)
				end
			end
		end
		--Crime Losses/Crime Percents
		local crimes = Sukritact_GetCrimeValue(playerID, city)
		table.sort(crimes, function(a,b) return a.Percent > b.Percent end)
		for _, crime in ipairs(crimes) do 
			local yieldLosses = crime.YieldLoss
			if yieldLosses > 0 then
				local yieldID = crime.YieldID
				local yieldInfo = GameInfo.Yields[yieldID]
				local crimeID = nil
				for row in GameInfo.Yields_JFD_CrimeTypes("YieldType = '" .. GameInfo.Yields[yieldID].Type .. "'") do
					crimeID = GameInfoTypes[row.CrimeType]
					break
				end
				local crimeInfo = GameInfo.JFD_Crimes[crimeID]
				local crimePercent = crime.Percent
				if crimeLossesTT then
					crimeLossesTT = crimeLossesTT .. convertTextKey("[COLOR_WARNING_TEXT][NEWLINE][ICON_BULLET]-{1_Num} {2_Icon} from {3_Icon} {4_CrimeDesc}[ENDCOLOR] ({5_Percent}%)", yieldLosses, yieldInfo.IconString, crimeInfo.IconString, crimeInfo.Description, JFD_Round(crimePercent))
				else
					crimeLossesTT = convertTextKey("[COLOR_WARNING_TEXT][ICON_BULLET]-{1_Num} {2_Icon} from {3_Icon} {4_CrimeDesc}[ENDCOLOR] ({5_Percent}%)", yieldLosses, yieldInfo.IconString, crimeInfo.IconString, crimeInfo.Description, JFD_Round(crimePercent))
				end
			end
		end
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_NONE", crimeBreakdownTT, crimeTotal, JFD_GetOrganizedCrimeThreshold(playerID, city))
	end
	if crimeLossesTT then
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT", crimeBreakdownTT, crimePercentsTT, crimeTotal, JFD_GetOrganizedCrimeThreshold(playerID, city)) .. "[NEWLINE]" .. crimeLossesTT .. ""
	else
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT", crimeBreakdownTT, crimePercentsTT, crimeTotal, JFD_GetOrganizedCrimeThreshold(playerID, city))
	end
end
------------------------------------------------------------------------------------------------------------------------
-- ORGANIZED CRIME
------------------------------------------------------------------------------------------------------------------------
--JFD_GetOrganizedCrimePercent
function JFD_GetOrganizedCrimePercent(playerID, city, organizedCrimeID)
	local player = Players[playerID]
	if (not userSettingCrimesCore) then return 0 end
	if city:IsResistance() then return 0 end
	if city:GetPopulation() < 5 then return 0 end
	local organizedCrime = GameInfo.JFD_OrganizedCrimes[organizedCrimeID]
	local organizedCrimePercent = 0
	for row in GameInfo.JFD_OrganizedCrime_CrimeTypes("OrganizedCrimeType = '" .. organizedCrime.Type .. "'") do
		organizedCrimePercent = organizedCrimePercent + Sukritact_GetCrimeValue(playerID, city, nil, GameInfoTypes[row.YieldType])
	end
	return mathFloor(organizedCrimePercent)
end

--JFD_GetOrganizedCrimeThreshold
function JFD_GetOrganizedCrimeThreshold(playerID, city)
	local player = Players[playerID]
	local organizedCrimeThreshold = defineOrganizedCrimeThreshold
	--Buildings
	for row in GameInfo.Building_JFD_OrganizedCrimeMods() do
		if row.GlobalThresholdMod > 0 then
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				organizedCrimeThreshold = organizedCrimeThreshold + row.GlobalThresholdMod
			end
		end
		if row.ThresholdMod > 0 then
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				organizedCrimeThreshold = organizedCrimeThreshold + row.ThresholdMod
			end
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_OrganizedCrimeMods() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			organizedCrimeThreshold = organizedCrimeThreshold + row.ThresholdMod
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_OrganizedCrimeMods() do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			organizedCrimeThreshold = organizedCrimeThreshold + row.ThresholdMod
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_OrganizedCrimeMods() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			organizedCrimeThreshold = organizedCrimeThreshold + row.ThresholdMod
		end
	end
	return organizedCrimeThreshold
end

--JFD_HasOrganizedCrime
function JFD_HasOrganizedCrime(playerID, city, organizedCrimeID)
	local player = Players[playerID]
	local organizedCrime = GameInfo.JFD_OrganizedCrimes[organizedCrimeID]
	if JFD_GetOrganizedCrimePercent(playerID, city, organizedCrimeID) > JFD_GetOrganizedCrimeThreshold(playerID, city) then
		return true
	end
	return false
end
--------------------
-- TEXT
--------------------
--JFD_GetOrganizedCrimeBreakdownTT 
function JFD_GetOrganizedCrimeBreakdownTT(playerID, city)
	local player = Players[playerID]
	local organizedCrimeTT = ""
	local crimeThreshold = JFD_GetOrganizedCrimeThreshold(playerID, city)
	local thresholdColour = "[COLOR_POSITIVE_TEXT]"
	if crimeThreshold < 100 then
		for organizedCrime in GameInfo.JFD_OrganizedCrimes() do
			local organizedCrimePercent = JFD_GetOrganizedCrimePercent(playerID, city, organizedCrime.ID)
			organizedCrimeTT = organizedCrimeTT .. convertTextKey("[NEWLINE][ICON_BULLET]{1_Icon} {2_Num}% ({3_Icon})", organizedCrime.IconString, organizedCrimePercent, organizedCrime.CrimeIconString, thresholdColour) .. " " .. convertTextKey(organizedCrime.Description) .. "[ENDCOLOR]"
		end
		for organizedCrime in GameInfo.JFD_OrganizedCrimes() do
			if JFD_HasRealOrganizedCrime(playerID, city, organizedCrime.ID) then
				thresholdColour = "[COLOR_NEGATIVE_TEXT]"
				organizedCrimeTT = organizedCrimeTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_ACTIVE_TT", organizedCrime.Help)
			end
		end
	else
		organizedCrimeTT = organizedCrimeTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TEXT_TT_100", crimeThreshold)
	end
	return convertTextKey("TXT_KEY_JFD_CITYVIEW_CRIME_ORGANIZED_TEXT_TT", crimeThreshold, organizedCrimeTT, thresholdColour)
end
--=======================================================================================================================
--=======================================================================================================================