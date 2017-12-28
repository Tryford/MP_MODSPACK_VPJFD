-- JFD_CID_Loyalty_Utils
-- Author: JFD
-- DateCreated: 10/1/2015 5:07:18 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineCIDLoyaltyAIBonus			   		= GameDefines["JFD_CID_LOYALTY_AI_BONUS"]
local defineCIDLoyaltyRazingPenalty				= GameDefines["JFD_CID_LOYALTY_RAZING_PENALTY"]
local defineCIDLoyaltyResistancePenalty			= GameDefines["JFD_CID_LOYALTY_RESISTANCE_PENALTY"]
local defineCIDLoyaltyDefaultConnections		= GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_CONNECTIONS"]
local defineCIDLoyaltyDefaultElimination		= GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_ELIMINATION"]
local defineCIDLoyaltyDefaultGarrison	   		= GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_GARRISON"]
local defineCIDLoyaltyDefaultPuppet				= GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_PUPPET"]
local defineCIDLoyaltyDefaultSpy		   		= GameDefines["JFD_CID_LOYALTY_DEFAULT_FROM_SPY"]
local defineCIDLoyaltyRevoltPopThreshold		= GameDefines["JFD_CID_LOYALTY_REVOLT_THRESHOLD_PER_POP"]
local defineCIDLoyaltyWLTKDPopThreshold			= GameDefines["JFD_CID_LOYALTY_WLTKD_THRESHOLD_PER_POP"]
local defineCIDLoyaltyStarvationPenalty			= GameDefines["JFD_CID_LOYALTY_STARVATION_PENALTY"]
local defineCIDLoyaltyUnemploymentPenalty		= GameDefines["JFD_CID_LOYALTY_UNEMPLOYMENT_PENALTY"]

local defineGameSpeedPopThreshold				= GameInfo.GameSpeeds[Game.GetGameSpeedType()].PeaceDealDuration
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDHappinessCore			= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
local userSettingCIDLoyaltyCities			= (Game.GetUserSetting("JFD_CID_LOYALTY_CITIES"))
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey			 = Locale.ConvertTextKey
local mathFloor					 = math.floor
local mathMax					 = math.max

local loyaltyNeutralID			 = GameInfoTypes["LOYALTY_JFD_NEUTRAL"]
------------------------------------------------------------------------------------------------------------------------
-- LOYALTY 
------------------------------------------------------------------------------------------------------------------------
--Player:CalculateCityLoyalty
local buildingEastIndiaCompanyID = GameInfoTypes["BUILDING_JFD_EAST_INDIA_COMPANY"]
local domainSeaID				 = GameInfoTypes["DOMAIN_SEA"]
local specialistUnemployedID     = GameInfoTypes["SPECIALIST_CITIZEN"]
local yieldLoyaltyID		     = GameInfoTypes["YIELD_JFD_LOYALTY"]
function Player.CalculateCityLoyalty(player, city, returnsTT)
	local playerID = player:GetID()
	local loyaltyID = 0
	local loyaltyPercent = 0
	local loyaltyTT = ""
	local cityPopulation = city:GetPopulation()
	local cityIsColony = city:IsColony()
	local cityIsOccupied = city:IsOccupied()
	local cityIsPuppet = (city:IsPuppet() and (not cityIsColony))
	local isOccupied = (city:IsOccupied() or city:IsPuppet())
	if userSettingCIDLoyaltyCities == 1 then 
		if (not cityIsColony) then return -1 end
	elseif userSettingCIDLoyaltyCities == 2 then 
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
	if (not player:IsHuman()) then loyaltyPercent = loyaltyPercent + defineCIDLoyaltyAIBonus end
	--City Connected Mod
	if (not city:IsCapital()) then
		local loyaltyConnection = 0
		if player:IsCapitalConnectedToCity(city) then
			loyaltyConnection = defineCIDLoyaltyDefaultConnections
		end
		loyaltyPercent = loyaltyPercent + loyaltyConnection
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_CONNECTED", loyaltyConnection)
		end
	end
	--Counter-Spy
	local loyaltySpy = 0
	if city:HasCounterSpy() then 
		loyaltySpy = defineCIDLoyaltyDefaultSpy
		loyaltyPercent = loyaltyPercent + loyaltySpy 
	end
	if returnsTT then
		loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_FROM_SPY", loyaltySpy)	
	end
	--Defeated Founder
	local loyaltyElimination = defineCIDLoyaltyDefaultElimination
	if ((cityIsOccupied or cityIsPuppet) and (not Players[city:GetOriginalOwner()]:IsAlive())) then
		loyaltyPercent = loyaltyPercent + loyaltyElimination
		if (returnsTT and loyaltyElimination > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_ELIMINATED", loyaltyElimination)
		end
	end
	--Garrison
	local militaryGarrison = city:GetGarrisonedUnit()
	local loyaltyGarrison = 0
	if militaryGarrison then
		loyaltyGarrison = defineCIDLoyaltyDefaultGarrison
		for policy in GameInfo.Policies("LoyaltyGarrisonLevels > 0") do
			if player:HasPolicy(policy.ID) then
				loyaltyGarrison = loyaltyGarrison + (militaryGarrison:GetLevel()*policy.LoyaltyGarrisonLevels)
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
	--Happiness
	local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(city)
	if userSettingCIDHappinessCore then
		local loyaltyHappiness = excessHappiness
		loyaltyPercent = loyaltyPercent + loyaltyHappiness
		if (returnsTT and loyaltyHappiness > 0) then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_HAPPINESS", loyaltyHappiness)
		end
	end
	--Puppet
	local loyaltyPuppet = defineCIDLoyaltyDefaultPuppet
	if (cityIsPuppet or city:IsColony()) then
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
		local loyaltyDistance = Game.GetRound((cityPopulation*0.2)*distance)
		loyaltyPercent = loyaltyPercent-loyaltyDistance
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_DISTANCE", -loyaltyDistance, distance)
		end
	end
	--Ideology
	local loyaltyIdeology = player:GetPublicOpinionUnhappiness()
	if loyaltyIdeology > 0 then
		loyaltyPercent = loyaltyPercent-loyaltyIdeology
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_IDEOLOGY", loyaltyIdeology, GameInfo.PolicyBranchTypes[player:GetPublicOpinionPreferredIdeology()].IconString)
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
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineCIDLoyaltyRazingPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_RAZING", -(cityPopulation*defineCIDLoyaltyRazingPenalty))
		end
	end
	--Resistance
	if city:GetResistanceTurns() > 0 then
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineCIDLoyaltyResistancePenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_RESISTANCE", -(cityPopulation*defineCIDLoyaltyResistancePenalty))
		end
	end
	--Starvation
	if city:FoodDifference() < 0 then
		loyaltyPercent = loyaltyPercent-(cityPopulation*defineCIDLoyaltyStarvationPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_STARVATION", -(cityPopulation*defineCIDLoyaltyStarvationPenalty))
		end
	end
	--Unhappiness
	if userSettingCIDHappinessCore then
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
		loyaltyPercent = loyaltyPercent-(numUnemployed*defineCIDLoyaltyUnemploymentPenalty)
		if returnsTT then
			loyaltyTT = loyaltyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_LOYALTY_TT_UNEMPLOYMENT", -(numUnemployed*defineCIDLoyaltyUnemploymentPenalty))
		end
	end
	if loyaltyPercent <= 0   then loyaltyPercent = 0   end
	if loyaltyPercent >= 100 then loyaltyPercent = 100 end
	local loyaltyID = -1
	if returnsTT then 
		loyaltyID = city:GetLoyaltyState() 
	else
		for row in GameInfo.JFD_Loyalties() do
			for row in GameInfo.JFD_Loyalties("Threshold >= '" .. loyaltyPercent .. "'") do
				loyaltyID = row.ID
				break
			end
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
--Player:GetCityLoyaltyCounterDetails
function Player.GetCityLoyaltyCounterDetails(player, city, loyaltyID, returnsAll, resturnsRevoltThreshold, returnsRevoltRate, returnsRevoltRateTT, returnsRevoltTurns, returnsWLTKDCounter, returnsWLTKDThreshold, returnsWLTKDRate, returnsWLTKDRateTT, returnsWLTKDTurns)
	local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
	local revoltCounter = city:GetDisloyaltyCounter()
	local revoltRate, WLTKDRate, revoltRateTT, WLTKDRateTT = player:GetLoyaltyRates(city, loyaltyID, true)
	local revoltThreshold = 0
	if (resturnsRevoltThreshold or returnsAll) then
		revoltThreshold = (city:GetPopulation()*defineCIDLoyaltyRevoltPopThreshold)
		--Buildings
		for row in GameInfo.Building_JFD_LoyaltyMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
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
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_LoyaltyMods("RevoltMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_LoyaltyMods("RevoltMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				revoltThreshold = revoltThreshold + ((revoltThreshold*row.RevoltMod)/100)
			end
		end
	end
	local revoltTurns = 0
	if ((returnsRevoltTurns or returnsAll) and revoltRate ~= 0) then
		revoltTurns = mathMax(0,Game.GetRound((revoltCounter-revoltThreshold)/revoltRate)*-1)
	end
	local WLTKDCounter = city:GetLoyaltyCounter()
	local WLTKDThreshold = 0
	if (returnsWLTKDThreshold or returnsAll) then
		WLTKDThreshold = (city:GetPopulation()*defineCIDLoyaltyWLTKDPopThreshold) 
		--Buildings
		for row in GameInfo.Building_JFD_LoyaltyMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
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
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_LoyaltyMods("WLTKDMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_LoyaltyMods("WLTKDMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				WLTKDThreshold = WLTKDThreshold + ((WLTKDThreshold*row.WLTKDMod)/100)
			end
		end
	end
	local WLTKDTurns = 0
	if ((returnsWLTKDTurns or returnsAll) and WLTKDRate ~= 0) then
		WLTKDTurns = mathMax(0,Game.GetRound((WLTKDCounter-WLTKDThreshold)/WLTKDRate)*-1)
	end
	if returnsAll then
		return revoltCounter, revoltThreshold, revoltRate, revoltRateTT, revoltTurns, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT, WLTKDTurns
	elseif returnsWLTKDCounter then
		return WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT, WLTKDTurns
	else
		return revoltCounter, revoltThreshold, revoltRate, revoltRateTT, revoltTurns
	end
end

--Player:GetLoyaltyRates
function Player.GetLoyaltyRates(player, city, loyaltyID, returnsTT)
	if loyaltyID == loyaltyNeutralID then return 0,0,"","" end
	local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
	local revoltRate = 0
	local revoltRateTT = ""
	local WLTKDRate = 0
	local WLTKDRateTT = ""
	--Citizen Sentiment Mods
	local revoltRateCitizens = (loyalty.RevoltRate/100) 
	local revoltRateIdeologyCitizens = 0
	local revoltRateReligiousCitizens = 0
	if revoltRateCitizens ~= 0 then	revoltRateIdeologyCitizens = (loyalty.RevoltRate/200) revoltRateReligiousCitizens = (loyalty.RevoltRate/200) end
	local WLTKDRateCitizens  = (loyalty.WLTKDRate/100) 
	local WLTKDRateIdeologyCitizens = 0
	local WLTKDRateReligiousCitizens = 0
	if WLTKDRateCitizens ~= 0 then	WLTKDRateIdeologyCitizens = (loyalty.WLTKDRate/200) WLTKDRateReligiousCitizens = (loyalty.WLTKDRate/200) end
	for row in GameInfo.Building_JFD_LoyaltyMods("CitizenRevoltSentimentMod <> 0 OR CitizenWLTKDSentimentMod <> 0 OR IdeologyCitizenRevoltSentimentMod <> 0 OR IdeologyCitizenWLTKDSentimentMod <> 0 OR ReligiousCitizenRevoltSentimentMod <> 0 OR ReligiousCitizenWLTKDSentimentMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			local revoltSentimentMod 		  = (row.CitizenRevoltSentimentMod/100)
			local revoltIdeologySentimentMod  = (row.IdeologyCitizenRevoltSentimentMod/100)
			local revoltReligiousSentimentMod = (row.ReligiousCitizenRevoltSentimentMod/100)
			local WLTKDSentimentMod 		  = (row.CitizenWLTKDSentimentMod/100)
			local WLTKDIdeologySentimentMod   = (row.IdeologyCitizenWLTKDSentimentMod/100)
			local WLTKDReligiousSentimentMod  = (row.ReligiousCitizenWLTKDSentimentMod/100)
			if loyalty.RevoltRate < 0 then
				revoltSentimentMod = revoltSentimentMod*-1
				revoltIdeologySentimentMod = revoltIdeologySentimentMod*-1
				revoltReligiousSentimentMod = revoltReligiousSentimentMod*-1
			end
			if loyalty.WLTKDRate < 0 then
				WLTKDSentimentMod = WLTKDSentimentMod*-1
				WLTKDIdeologySentimentMod = WLTKDIdeologySentimentMod*-1
				WLTKDReligiousSentimentMod = WLTKDReligiousSentimentMod*-1
			end
			revoltRateCitizens 			= revoltRateCitizens 		  + revoltSentimentMod
			revoltRateIdeologyCitizens  = revoltRateIdeologyCitizens  + revoltIdeologySentimentMod
			revoltRateReligiousCitizens = revoltRateReligiousCitizens + revoltReligiousSentimentMod
			WLTKDRateCitizens 			= WLTKDRateCitizens 		  + WLTKDSentimentMod
			WLTKDRateIdeologyCitizens 	= WLTKDRateIdeologyCitizens   + WLTKDIdeologySentimentMod
			WLTKDRateReligiousCitizens  = WLTKDRateReligiousCitizens  + WLTKDReligiousSentimentMod
		end
	end
	for row in GameInfo.Policy_JFD_LoyaltyMods("CitizenRevoltSentimentMod <> 0 OR CitizenWLTKDSentimentMod <> 0 OR IdeologyCitizenRevoltSentimentMod <> 0 OR IdeologyCitizenWLTKDSentimentMod <> 0 OR ReligiousCitizenRevoltSentimentMod <> 0 OR ReligiousCitizenWLTKDSentimentMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local revoltSentimentMod 		  = (row.CitizenRevoltSentimentMod/100)
			local revoltIdeologySentimentMod  = (row.IdeologyCitizenRevoltSentimentMod/100)
			local revoltReligiousSentimentMod = (row.ReligiousCitizenRevoltSentimentMod/100)
			local WLTKDSentimentMod 		  = (row.CitizenWLTKDSentimentMod/100)
			local WLTKDIdeologySentimentMod   = (row.IdeologyCitizenWLTKDSentimentMod/100)
			local WLTKDReligiousSentimentMod  = (row.ReligiousCitizenWLTKDSentimentMod/100)
			if loyalty.RevoltRate < 0 then
				revoltSentimentMod = revoltSentimentMod*-1
				revoltIdeologySentimentMod = revoltIdeologySentimentMod*-1
				revoltReligiousSentimentMod = revoltReligiousSentimentMod*-1
			end
			if loyalty.WLTKDRate < 0 then
				WLTKDSentimentMod = WLTKDSentimentMod*-1
				WLTKDIdeologySentimentMod = WLTKDIdeologySentimentMod*-1
				WLTKDReligiousSentimentMod = WLTKDReligiousSentimentMod*-1
			end
			revoltRateCitizens 			= revoltRateCitizens 		  + revoltSentimentMod
			revoltRateIdeologyCitizens  = revoltRateIdeologyCitizens  + revoltIdeologySentimentMod
			revoltRateReligiousCitizens = revoltRateReligiousCitizens + revoltReligiousSentimentMod
			WLTKDRateCitizens 			= WLTKDRateCitizens 		  + WLTKDSentimentMod
			WLTKDRateIdeologyCitizens 	= WLTKDRateIdeologyCitizens   + WLTKDIdeologySentimentMod
			WLTKDRateReligiousCitizens  = WLTKDRateReligiousCitizens  + WLTKDReligiousSentimentMod
		end
	end
	for row in GameInfo.JFD_Reform_LoyaltyMods("CitizenRevoltSentimentMod <> 0 OR CitizenWLTKDSentimentMod <> 0 OR IdeologyCitizenRevoltSentimentMod <> 0 OR IdeologyCitizenWLTKDSentimentMod <> 0 OR ReligiousCitizenRevoltSentimentMod <> 0 OR ReligiousCitizenWLTKDSentimentMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local revoltSentimentMod 		  = (row.CitizenRevoltSentimentMod/100)
			local revoltIdeologySentimentMod  = (row.IdeologyCitizenRevoltSentimentMod/100)
			local revoltReligiousSentimentMod = (row.ReligiousCitizenRevoltSentimentMod/100)
			local WLTKDSentimentMod 		  = (row.CitizenWLTKDSentimentMod/100)
			local WLTKDIdeologySentimentMod   = (row.IdeologyCitizenWLTKDSentimentMod/100)
			local WLTKDReligiousSentimentMod  = (row.ReligiousCitizenWLTKDSentimentMod/100)
			if loyalty.RevoltRate < 0 then
				revoltSentimentMod = revoltSentimentMod*-1
				revoltIdeologySentimentMod = revoltIdeologySentimentMod*-1
				revoltReligiousSentimentMod = revoltReligiousSentimentMod*-1
			end
			if loyalty.WLTKDRate < 0 then
				WLTKDSentimentMod = WLTKDSentimentMod*-1
				WLTKDIdeologySentimentMod = WLTKDIdeologySentimentMod*-1
				WLTKDReligiousSentimentMod = WLTKDReligiousSentimentMod*-1
			end
			revoltRateCitizens 			= revoltRateCitizens 		  + revoltSentimentMod
			revoltRateIdeologyCitizens  = revoltRateIdeologyCitizens  + revoltIdeologySentimentMod
			revoltRateReligiousCitizens = revoltRateReligiousCitizens + revoltReligiousSentimentMod
			WLTKDRateCitizens 			= WLTKDRateCitizens 		  + WLTKDSentimentMod
			WLTKDRateIdeologyCitizens 	= WLTKDRateIdeologyCitizens   + WLTKDIdeologySentimentMod
			WLTKDRateReligiousCitizens  = WLTKDRateReligiousCitizens  + WLTKDReligiousSentimentMod
		end
	end
	if loyalty.RevoltRate < 0 then
	
	end
	--Citizens
	local revoltSentiment = (city:GetPopulation()*revoltRateCitizens)
	if revoltSentiment ~= 0 then
		revoltRate = revoltRate + revoltSentiment
		if returnsTT then
			if revoltRate > 0 then 
				revoltRateTT = "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_BASE", "+" .. revoltSentiment)
			else
				revoltRateTT = "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_BASE", revoltSentiment)
			end
		end
	end
	local WLTKDSentiment = (city:GetPopulation()*WLTKDRateCitizens)
	if WLTKDSentiment ~= 0 then
		WLTKDRate = WLTKDRate + WLTKDSentiment
		if returnsTT then
			if WLTKDRate > 0 then 
				WLTKDRateTT = "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_BASE", "+" .. WLTKDRate)
			else
				WLTKDRateTT = "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_BASE", WLTKDRate)
			end
		end
	end
	--Ideology Citizens
	local dominantIdeologyID = player:GetPublicOpinionPreferredIdeology() 
	local ideologyID = player:GetLateGamePolicyTree() 
	if (ideologyID > -1 and dominantIdeologyID == -1) then
		local ideologyFont = GameInfo.PolicyBranchTypes[ideologyID].IconString
		local revoltSentiment = (city:GetPopulation()*revoltRateIdeologyCitizens)
		if revoltSentiment ~= 0 then
			revoltRate = revoltRate + revoltSentiment
			if returnsTT then
				if revoltSentiment > 0 then 
					revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_RELIGION", "+" .. revoltSentiment, ideologyFont)
				else
					revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_RELIGION", revoltSentiment, ideologyFont)
				end
			end
		end
		local WLTKDSentiment = (city:GetPopulation()*WLTKDRateIdeologyCitizens)
		if WLTKDSentiment ~= 0 then
			WLTKDRate = WLTKDRate + WLTKDSentiment
			if returnsTT then
				if WLTKDSentiment > 0 then 
					WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_IDEOLOGY", "+" .. WLTKDSentiment, ideologyFont)
				else
					WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_IDEOLOGY", WLTKDSentiment, ideologyFont)
				end
			end
		end
	end	
	--Religious Citizens
	if player:HasStateReligion() then
		local stateReligionID = player:GetStateReligion()
		local religionFont = GameInfo.Religions[stateReligionID].IconString
		local revoltSentiment = (city:GetNumFollowers(stateReligionID)*revoltRateReligiousCitizens)
		if revoltSentiment ~= 0 then
			revoltRate = revoltRate + revoltSentiment
			if returnsTT then
				if revoltSentiment > 0 then 
					revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_RELIGION", "+" .. revoltSentiment, religionFont)
				else
					revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_RELIGION", revoltSentiment, religionFont)
				end
			end
		end
		local WLTKDSentiment = (city:GetNumFollowers(stateReligionID)*WLTKDRateReligiousCitizens)
		if WLTKDSentiment ~= 0 then
			WLTKDRate = WLTKDRate + WLTKDSentiment
			if returnsTT then
				if WLTKDSentiment > 0 then 
					WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_RELIGION", "+" .. WLTKDSentiment, religionFont)
				else
					WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_RELIGION", WLTKDSentiment, religionFont)
				end
			end
		end
	end	
	--Buildings
	for row in GameInfo.Building_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			local revoltSentiment = row.RevoltSentimentChange
			local WLTKDSentiment = row.WLTKDSentimentChange
			revoltRate = revoltRate + revoltSentiment
			WLTKDRate  = WLTKDRate  + WLTKDSentiment
			if returnsTT then
				if revoltSentiment ~= 0 then
					if revoltSentiment > 0 then 
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_BUILDINGS", "+" .. revoltSentiment)
					else
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_BUILDINGS", revoltSentiment)
					end
				end
				if WLTKDSentiment ~= 0 then
					if WLTKDSentiment > 0 then 
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_BUILDINGS", "+" .. WLTKDSentiment)
					else
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_BUILDINGS", WLTKDSentiment)
					end
				end
			end
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local revoltSentiment = row.RevoltSentimentChange
			local WLTKDSentiment = row.WLTKDSentimentChange
			revoltRate = revoltRate + revoltSentiment
			WLTKDRate  = WLTKDRate  + WLTKDSentiment
			if returnsTT then
				if revoltSentiment ~= 0 then
					if revoltSentiment > 0 then 
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_POLICIES", "+" .. revoltSentiment)
					else
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_POLICIES", revoltSentiment)
					end
				end
				if WLTKDSentiment ~= 0 then
					if WLTKDSentiment > 0 then 
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_POLICIES", "+" .. WLTKDSentiment)
					else
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_POLICIES", WLTKDSentiment)
					end
				end
			end
		end
	end
	for row in GameInfo.Policy_SpecialistSentimentChanges() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local specialistID = GameInfoTypes[row.SpecialistType]
			if city:HasSpecialist(specialistID) then
				local revoltSentiment = (row.RevoltSentimentChange*city:GetSpecialistCount(specialistID))
				local WLTKDSentiment = (row.WLTKDSentimentChange*city:GetSpecialistCount(specialistID))
				revoltRate = revoltRate + revoltSentiment
				WLTKDSentiment  = WLTKDSentiment  + WLTKDSentiment
				if returnsTT then
					if revoltSentiment ~= 0 then
						if revoltSentiment > 0 then 
							revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_SPECIALISTS", "+" .. revoltSentiment)
						else
							revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_SPECIALISTS", revoltSentiment)
						end
					end
					if WLTKDSentiment ~= 0 then
						if WLTKDSentiment > 0 then 
							WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_SPECIALISTS", "+" .. WLTKDSentiment)
						else
							WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_SPECIALISTS", WLTKDSentiment)
						end
					end
				end
			end
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local revoltSentiment = row.RevoltSentimentChange
			local WLTKDSentiment = row.WLTKDSentimentChange
			revoltRate = revoltRate + revoltSentiment
			WLTKDRate  = WLTKDRate  + WLTKDSentiment
			if returnsTT then
				if revoltSentiment ~= 0 then
					if revoltSentiment > 0 then 
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_REFORMS", "+" .. revoltSentiment)
					else
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_REFORMS", revoltSentiment)
					end
				end
				if WLTKDSentiment ~= 0 then
					if WLTKDSentiment > 0 then 
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_REFORMS", "+" .. WLTKDSentiment)
					else
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_REFORMS", WLTKDSentiment)
					end
				end
			end
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_LoyaltyMods("RevoltSentimentChange <> 0 OR WLTKDSentimentChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local revoltSentiment = row.RevoltSentimentChange
			local WLTKDSentiment = row.WLTKDSentimentChange
			revoltRate = revoltRate + revoltSentiment
			WLTKDRate  = WLTKDRate  + WLTKDSentiment
			if returnsTT then
				if revoltSentiment ~= 0 then
					if revoltSentiment > 0 then 
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_TRAITS", "+" .. revoltSentiment)
					else
						revoltRateTT = revoltRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_REVOLT_SENTIMENT_TT_TRAITS", revoltSentiment)
					end
				end
				if WLTKDSentiment ~= 0 then
					if WLTKDSentiment > 0 then 
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_TRAITS", "+" .. WLTKDSentiment)
					else
						WLTKDRateTT = WLTKDRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_WLTKD_SENTIMENT_TT_TRAITS", WLTKDSentiment)
					end
				end
			end
		end
	end
	return Game.GetRound(revoltRate), Game.GetRound(WLTKDRate), revoltRateTT, WLTKDRateTT
end
--=======================================================================================================================
--=======================================================================================================================