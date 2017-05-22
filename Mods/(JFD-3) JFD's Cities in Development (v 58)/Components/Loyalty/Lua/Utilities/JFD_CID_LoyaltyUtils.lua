-- JFD_CID_Loyalty_Utils
-- Author: JFD
-- DateCreated: 10/1/2015 5:07:18 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
include("JFD_CID_HappinessUtils.lua");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineLoyaltyAIBonus			   = GameDefines["JFD_CID_LOYALTY_AI_BONUS"]
local defineLoyaltyRazingPenalty	   = GameDefines["JFD_CID_LOYALTY_RAZING_PENALTY"]
local defineLoyaltyResistancePenalty   = GameDefines["JFD_CID_LOYALTY_RESISTANCE_PENALTY"]
local defineLoyaltyDefaultConnections  = GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_CONNECTIONS"]
local defineLoyaltyDefaultElimination  = GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_ELIMINATION"]
local defineLoyaltyDefaultGarrison	   = GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_GARRISON"]
local defineLoyaltyDefaultPuppet	   = GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_PUPPET"]
local defineLoyaltyDefaultSpy		   = GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_SPY"]
local defineLoyaltyRevoltMinThreshold  = GameDefines["JFD_CID_LOYALTY_DEFAULT_REVOLT_THRESHOLD"]
local defineLoyaltyWLTKDMinThreshold   = GameDefines["JFD_CID_LOYALTY_DEFAULT_WLTKD_THRESHOLD"]
local defineLoyaltyStarvationPenalty   = GameDefines["JFD_CID_LOYALTY_STARVATION_PENALTY"]
local defineLoyaltyUnemploymentPenalty = GameDefines["JFD_CID_LOYALTY_UNEMPLOYMENT_PENALTY"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingLoyaltyCities		  = JFD_GetUserSetting("JFD_CID_LOYALTY_CITIES")
local userSettingLoyaltyCoreFirstNotificationRevoltTurns  = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_REVOLT_TURNS")
local userSettingLoyaltyCoreSecondNotificationRevoltTurns = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_REVOLT_TURNS")
local userSettingLoyaltyCoreFirstNotificationWLTKDTurns   = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_WLTKD_TURNS")
local userSettingLoyaltyCoreSecondNotificationWLTKDTurns  = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_WLTKD_TURNS")
local userSettingHappinessCore		  = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathFloor      = math.floor
local mathMax		 = math.max
------------------------------------------------------------------------------------------------------------------------
-- LOYALTY 
------------------------------------------------------------------------------------------------------------------------
--JFD_GetGlobalLoyalty
function JFD_GetGlobalLoyalty(playerID)
	local player = Players[playerID]
	local numCities = 0
	local numLoyalty = 0
	for city in player:Cities() do
		local loyaltyID, loyaltyPercent = JFD_GetCityLoyalty(playerID, city, false)
		if loyaltyID > -1 then
			numCities = numCities + 1
			numLoyalty = numLoyalty + loyaltyPercent
		end
	end
	local globalLoyaltyPercent = JFD_Round(numLoyalty/numCities)
	local loyaltyID = -1
	for row in GameInfo.JFD_Loyalties() do
		for row in GameInfo.JFD_Loyalties("Threshold <= '" .. globalLoyaltyPercent .. "'") do
			return row.TextColour, row.IconString, globalLoyaltyPercent
		end
	end
end

--JFD_CalculateCityLoyalty
local buildingClassCourthouseID  = GameInfoTypes["BUILDINGCLASS_COURTHOUSE"]
local buildingEastIndiaCompanyID = GameInfoTypes["BUILDING_JFD_EAST_INDIA_COMPANY"]
local domainSeaID				 = GameInfoTypes["DOMAIN_SEA"]
local ideologyAutocracyID		 = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local ideologyFreedomID			 = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local ideologyOrderID			 = GameInfoTypes["POLICY_BRANCH_ORDER"]
local ideologyFonts = {}
	ideologyFonts[ideologyAutocracyID] = "[ICON_IDEOLOGY_AUTOCRACY]"
	ideologyFonts[ideologyFreedomID]   = "[ICON_IDEOLOGY_FREEDOM]"
	ideologyFonts[ideologyOrderID]     = "[ICON_IDEOLOGY_ORDER]"
local specialistUnemployedID     = GameInfoTypes["SPECIALIST_CITIZEN"]
local yieldLoyaltyID		     = GameInfoTypes["YIELD_JFD_LOYALTY"]
function JFD_CalculateCityLoyalty(playerID, city, returnsTT)
	local player = Players[playerID]
	local loyaltyID = 0
	local loyaltyPercent = 0
	local loyaltyTT = ""
	local cityPopulation = city:GetPopulation()
	local cityIsColony = JFD_IsCityColony(city)
	local cityIsOccupied = city:IsOccupied()
	local cityIsPuppet = (city:IsPuppet() and (not cityIsColony))
	local isOccupied = (city:IsOccupied() or city:IsPuppet())
	if userSettingLoyaltyCities == 1 then 
		if (not cityIsColony) then return -1 end
	elseif userSettingLoyaltyCities == 2 then 
		if (not cityIsPuppet) and (not cityIsOccupied) then return -1 end 
	end
	if (cityIsOccupied or cityIsPuppet) then loyaltyPercent = 0 end
	--Original Owner
	if city:GetOriginalOwner() == playerID then
		loyaltyPercent = loyaltyPercent + 30
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_ORIGINAL", loyaltyPercent)
		end
	end
	if (not player:IsHuman()) then loyaltyPercent = loyaltyPercent + defineLoyaltyAIBonus end
	--City Connected Mod
	if (not city:IsCapital()) then
		local loyaltyConnection = 0
		if player:IsCapitalConnectedToCity(city) then
			loyaltyConnection = defineLoyaltyDefaultConnections
		end
		loyaltyPercent = loyaltyPercent + loyaltyConnection
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_CONNECTED", loyaltyConnection)
		end
	end
	--Counter-Spy
	local loyaltySpy = 0
	if city:HasCounterSpy() then 
		loyaltySpy = defineLoyaltyDefaultSpy
		loyaltyPercent = loyaltyPercent + loyaltySpy 
	end
	if returnsTT then
		loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_FROM_SPY", loyaltySpy)	
	end
	--Defeated Founder
	local loyaltyElimination = defineLoyaltyDefaultElimination
	if (cityIsOccupied or cityIsPuppet and (not Players[city:GetOriginalOwner()]:IsAlive())) then
		loyaltyPercent = loyaltyPercent + loyaltyElimination
		if (returnsTT and loyaltyElimination > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_ELIMINATED", loyaltyElimination)
		end
	end
	--Garrison
	local militaryGarrison = city:GetGarrisonedUnit()
	local loyaltyGarrison = 0
	if militaryGarrison then
		loyaltyGarrison = defineLoyaltyDefaultGarrison
		for policy in GameInfo.Policies("JFD_LoyaltyGarrisonLevels > 0") do
			if player:HasPolicy(policy.ID) then
				loyaltyGarrison = loyaltyGarrison + (militaryGarrison:GetLevel()*5)
			end
		end
		for row in GameInfo.UnitPromotions_YieldModifiers("YieldType = 'YIELD_JFD_LOYALTY'") do
			if militaryGarrison:HasPromotion(GameInfoTypes[row.PromotionType]) then
				loyaltyGarrison = loyaltyGarrison + row.Yield
			end
		end
		loyaltyPercent = loyaltyPercent + loyaltyGarrison
	end
	if returnsTT then
		loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_GARRISON", loyaltyGarrison)
	end
	--Naval Garrison
	local loyaltyNavalGarrison = 0
	for building in GameInfo.Buildings("LoyaltyFromNavalUnits > 0") do
		if player:HasBuilding(building.ID) then
			local plot = city:Plot()
			for value = 0, plot:GetNumUnits() - 1, 1 do
				local unit = plot:GetUnit(value)
				if (unit and unit:GetDomainType() == domainSeaID) then
					loyaltyNavalGarrison = loyaltyNavalGarrison + building.LoyaltyFromNavalUnits
					break
				end
			end
		end
	end
	loyaltyPercent = loyaltyPercent + loyaltyNavalGarrison
	if (returnsTT and loyaltyNavalGarrison > 0) then
		loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_TRAFALGAR", loyaltyNavalGarrison)
	end
	--Happiness
	if userSettingHappinessCore then
		local excessHappiness = JFD_GetExcessHappiness(playerID, city)
		local loyaltyHappiness = excessHappiness
		loyaltyPercent = loyaltyPercent + loyaltyHappiness
		if (returnsTT and loyaltyHappiness > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_HAPPINESS", loyaltyHappiness)
		end
	end
	--Puppet
	local loyaltyPuppet = defineLoyaltyDefaultPuppet
	if (cityIsPuppet or JFD_IsCityColony(city)) then
		for row in GameInfo.Policy_JFD_LoyaltyMods("PuppetLoyaltyMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				loyaltyPuppet = loyaltyPuppet + row.PuppetLoyaltyMod
			end
		end
		loyaltyPercent = loyaltyPercent + loyaltyPuppet
		if (returnsTT and loyaltyPuppet > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_PUPPET", loyaltyPuppet)
		end
	end
	--Religion
	local loyaltyReligion = 0
	if (city:GetReligiousMajority() > 0 and city:GetReligiousMajority() == player:GetMajorityReligion()) then
		for row in GameInfo.Policy_ReligionYieldMod("YieldType = 'YIELD_JFD_LOYALTY'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				loyaltyReligion = loyaltyReligion + row.Yield
			end
		end
		loyaltyPercent = loyaltyPercent + loyaltyReligion
		if (returnsTT and loyaltyReligion > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_RELIGION", loyaltyReligion)
		end
	end
	--Modifiers
	local loyaltyMod = city:GetYieldRateModifier(yieldLoyaltyID) + player:GetYieldRateModifier(yieldLoyaltyID)
	if loyaltyMod ~= 0 then
		loyaltyPercent = loyaltyPercent + loyaltyMod
		if returnsTT then
			local fontLoyalty = "[ICON_JFD_RED_FIST]"
			if loyaltyMod > 0 then 
				loyaltyMod = "+" .. loyaltyMod 
				fontLoyalty = "[ICON_JFD_BLUE_FIST]" 
			end
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_MODIFIERS", loyaltyMod, fontLoyalty)
		end
	end
	loyaltyTT = loyaltyTT .. "[NEWLINE]"
	--Distance Mod
	if cityIsColony then
		local capital = player:GetCapitalCity()
		local distance = Map.PlotDistance(city:GetX(), city:GetY(), capital:GetX(), capital:GetY())
		if (player:HasBuilding(buildingEastIndiaCompanyID) and player:IsCapitalConnectedToCity(city)) then
			distance = (distance*0.75)
		end
		local loyaltyDistance = JFD_Round((cityPopulation*0.2)*distance)
		loyaltyPercent = loyaltyPercent-loyaltyDistance
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_DISTANCE", -loyaltyDistance, distance)
		end
	end
	--Ideology
	local loyaltyIdeology = player:GetPublicOpinionUnhappiness()
	if loyaltyIdeology > 0 then
		loyaltyIdeology = loyaltyIdeology*-1
		loyaltyPercent = loyaltyPercent-loyaltyIdeology
		if returnsTT then
			local ideologicalFont = ideologyFonts[player:GetPublicOpinionPreferredIdeology()]
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_IDEOLOGY", loyaltyIdeology, ideologicalFont)
		end
	end
	--Population
	if (cityIsOccupied or cityIsPuppet) then
		local occupationMod = 3
		local unbrokenRuleMod = (Game.GetGameTurn()-city:GetGameTurnAcquired())/10
		if city:IsPuppet() then occupationMod = 2.5 end
		local loyaltyOccupied = (cityPopulation)*occupationMod
		loyaltyOccupied = loyaltyOccupied-unbrokenRuleMod
		loyaltyPercent  = loyaltyPercent-loyaltyOccupied
		if (returnsTT and loyaltyOccupied > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_POPULATION", -loyaltyOccupied, unbrokenRuleMod)
		end
	end
	--Razing
	if city:IsRazing() then
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineLoyaltyRazingPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_RAZING", -(cityPopulation*defineLoyaltyRazingPenalty))
		end
	end
	--Resistance
	if city:GetResistanceTurns() > 0 then
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineLoyaltyResistancePenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_RESISTANCE", -(cityPopulation*defineLoyaltyResistancePenalty))
		end
	end
	--Starvation
	if city:FoodDifference() < 0 then
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineLoyaltyStarvationPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_STARVATION", -(cityPopulation*defineLoyaltyStarvationPenalty))
		end
	end
	--Unhappiness
	if userSettingHappinessCore then
		local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(playerID, city, true)
		if excessUnhappiness> 0 then
			loyaltyPercent = loyaltyPercent-excessUnhappiness
			if returnsTT then
				loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_UNHAPPINESS", excessUnhappiness)
			end
		end
	end
	--Unemployment
	local numUnemployed = city:GetSpecialistCount(specialistUnemployedID)
	if numUnemployed > 0 then
		loyaltyPercent = loyaltyPercent-(numUnemployed*defineLoyaltyUnemploymentPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_UNEMPLOYMENT", -(numUnemployed*defineLoyaltyUnemploymentPenalty))
		end
	end
	if loyaltyPercent <= 0   then loyaltyPercent = 0   end
	if loyaltyPercent >= 100 then loyaltyPercent = 100 end
	local loyaltyID = -1
	for row in GameInfo.JFD_Loyalties() do
		for row in GameInfo.JFD_Loyalties("Threshold >= '" .. loyaltyPercent .. "'") do
			loyaltyID = row.ID
			break
		end
	end
	if returnsTT then
		return loyaltyID, mathMax(loyaltyPercent,0), loyaltyTT
	else
		return loyaltyID, mathMax(loyaltyPercent,0)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- REVOLT/WLTKD
------------------------------------------------------------------------------------------------------------------------
--JFD_GetLoyaltyCounter
local buildingDisloyaltyID = GameInfoTypes["BUILDING_JFD_DISLOYALTY"]
local buildingLoyaltyID	   = GameInfoTypes["BUILDING_JFD_LOYALTY"]
function JFD_GetLoyaltyCounter(playerID, city, loyaltyID, returnsAll, resturnsRevoltThreshold, returnsRevoltRate, returnsRevoltTurns, returnsWLTKDCounter, returnsWLTKDThreshold, returnsWLTKDRate, returnsWLTKDTurns)
	local player = Players[playerID]
	if (not loyaltyID) then
		loyaltyID = JFD_GetCityLoyaltyID(playerID, city)
	end
	local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
	local revoltCounter = city:GetNumBuilding(buildingDisloyaltyID)
	local revoltRate, WLTKDRate = JFD_GetLoyaltyRate(playerID, city, loyaltyID)
	local revoltThreshold = 0
	if (resturnsRevoltThreshold or returnsAll) then
		revoltThreshold = defineLoyaltyRevoltMinThreshold
		--Buildings
		for row in GameInfo.Building_JFD_LoyaltyMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				local revoltMod = row.RevoltMod
				local revoltGlobalMod = row.GlobalRevoltMod
				if revoltMod > 0 then
					revoltThreshold = revoltThreshold + ((revoltThreshold*revoltMod)/100)
				end
				if revoltGlobalMod > 0 then
					revoltThreshold = revoltThreshold + ((revoltThreshold*revoltGlobalMod)/100)
				end
			end
		end
		--Policies
		for row in GameInfo.Policy_JFD_LoyaltyMods("RevoltMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_LoyaltyMods("RevoltMod <> 0") do
			if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_LoyaltyMods("RevoltMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
	end
	local revoltTurns = 0
	if ((returnsRevoltTurns or returnsAll) and revoltRate ~= 0) then
		revoltTurns = mathMax(0,JFD_Round((revoltCounter-revoltThreshold)/revoltRate)*-1)
	end
	local WLTKDCounter = city:GetNumBuilding(buildingLoyaltyID)
	local WLTKDThreshold = 0
	if (returnsWLTKDThreshold or returnsAll) then
		WLTKDThreshold = defineLoyaltyWLTKDMinThreshold
		--Buildings
		for row in GameInfo.Building_JFD_LoyaltyMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				local WLTKDMod = row.WLTKDMod
				local WLTKDGlobalMod = row.GlobalWLTKDMod
				if WLTKDMod > 0 then
					WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*WLTKDMod)/100)
				end
				if WLTKDGlobalMod > 0 then
					WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*WLTKDGlobalMod)/100)
				end
			end
		end
		--Policies
		for row in GameInfo.Policy_JFD_LoyaltyMods("WLTKDMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_LoyaltyMods("WLTKDMod <> 0") do
			if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_LoyaltyMods("WLTKDMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				local requiresPietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
				if (requiresPietyLevelID and JFD_GetPietyLevelID(playerID) ~= requiresPietyLevelID) then break end
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
	end
	local WLTKDTurns = 0
	if ((returnsWLTKDTurns or returnsAll) and WLTKDRate ~= 0) then
		WLTKDTurns = mathMax(0,JFD_Round((WLTKDCounter-WLTKDThreshold)/WLTKDRate)*-1)
	end
	if returnsAll then
		return revoltCounter, revoltThreshold, revoltRate, revoltTurns, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDTurns
	elseif returnsWLTKDCounter then
		return WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDTurns
	else
		return revoltCounter, revoltThreshold, revoltRate, revoltTurns
	end
end

--JFD_ChangeLoyaltyCounter
function JFD_ChangeLoyaltyCounter(playerID, city, value, isWLTKD)
	local player = Players[playerID]
	if isWLTKD then
		local WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDTurns = JFD_GetLoyaltyCounter(playerID, city, nil, false, false, false, false, true, true, true, true)
		JFD_SetLoyaltyCounter(playerID, city, (WLTKDCounter+value), true)
		WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDTurns = JFD_GetLoyaltyCounter(playerID, city, nil, false, false, false, false, true, true, true, true)
		if WLTKDCounter >= WLTKDThreshold then
			LuaEvents.JFD_WLTKDBegins(playerID, city, city:GetX(), city:GetY(), (city:GetPopulation()/2))
		elseif (userSettingLoyaltyCoreFirstNotificationWLTKDTurns > 0 and WLTKDTurns == userSettingLoyaltyCoreFirstNotificationWLTKDTurns) then
			JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
		elseif (userSettingLoyaltyCoreSecondNotificationWLTKDTurns > 0 and WLTKDTurns == userSettingLoyaltyCoreSecondNotificationWLTKDTurns) then
			JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
		end
	else
		local revoltCounter, revoltThreshold, revoltRate, revoltTurns = JFD_GetLoyaltyCounter(playerID, city, false, true, true, true)
		JFD_SetLoyaltyCounter(playerID, city, (revoltCounter+value))
		revoltCounter, revoltThreshold, revoltRate, revoltTurns = JFD_GetLoyaltyCounter(playerID, city, false, true, true, true)
		if revoltCounter >= revoltThreshold then
			LuaEvents.JFD_RevoltBegins(playerID, city, city:GetX(), city:GetY(), value)
		elseif (userSettingLoyaltyCoreFirstNotificationRevoltTurns > 0 and revoltTurns == userSettingLoyaltyCoreFirstNotificationRevoltTurns) then
			JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION", city:GetName(), revoltTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
		elseif (userSettingLoyaltyCoreSecondNotificationRevoltTurns > 0 and revoltTurns == userSettingLoyaltyCoreSecondNotificationRevoltTurns) then
			JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION", city:GetName(), revoltTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
		end
	end
end

--JFD_SetLoyaltyCounter
function JFD_SetLoyaltyCounter(playerID, city, value, isWLTKD)
	if value < 0 then value = 0 end
	if isWLTKD then
		city:SetNumRealBuilding(buildingLoyaltyID, value, true)
	else
		city:SetNumRealBuilding(buildingDisloyaltyID, value, true)
	end
end

--JFD_GetLoyaltyRate
function JFD_GetLoyaltyRate(playerID, city, loyaltyID)
	local player = Players[playerID]
	local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
	local revoltRate = loyalty.RevoltRate
	local WLTKDRate = loyalty.WLTKDRate
	--Buildings
	for row in GameInfo.Building_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			revoltRate = revoltRate + row.RevoltSentimentChange
			WLTKDRate  = WLTKDRate  + row.WLTKDSentimentChange
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			revoltRate = revoltRate + row.RevoltSentimentChange
			WLTKDRate  = WLTKDRate  + row.WLTKDSentimentChange
		end
	end
	for row in GameInfo.Policy_SpecialistSentimentChanges() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local specialistID = GameInfoTypes[row.SpecialistType]
			if city:HasSpecialist(specialistID) then
				revoltRate = revoltRate + (row.RevoltSentimentChange*city:GetSpecialistCount(specialistID))
				WLTKDRate  = WLTKDRate  + (row.WLTKDSentimentChange*city:GetSpecialistCount(specialistID))
			end
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			revoltRate = revoltRate + row.RevoltSentimentChange
			WLTKDRate  = WLTKDRate  + row.WLTKDSentimentChange
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			revoltRate = revoltRate + row.RevoltSentimentChange
			WLTKDRate  = WLTKDRate  + row.WLTKDSentimentChange
		end
	end
	return revoltRate, WLTKDRate
end
--=======================================================================================================================
--=======================================================================================================================