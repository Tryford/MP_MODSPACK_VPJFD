-- JFD_RTPUtils
-- Author: JFD
-- DateCreated: 7/22/2014 2:36:06 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")

include("JFD_RTP_GlobalDefines.lua");
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- MOD USE
--------------------------------------------------------------------------------------------------------------------------
--JFD_IsUsingCBP
function JFD_IsUsingCBP()
	local cBPModID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == cBPModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingCID
function JFD_IsUsingCID()
	local cIDModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == cIDModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingCIVDiplo
function JFD_IsUsingCIVDiplo()
	local civIVDiploModID = "c7bf7064-d1b1-4708-9e93-7a1560868582"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == civIVDiploModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingCulDiv
function JFD_IsUsingCulDiv()
	local culDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == culDivModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingEUI
function JFD_IsUsingEUI(isTopPanelCheck)
	local isUsingEUI = false
	if (isTopPanelCheck and ContextPtr:LookUpControl("/InGame/TopPanel/ClockOptionsPanel")) then
		return true
	elseif ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG") then
		return true
	end
	return false
end

--JFD_IsUsingEventsDecisions
function JFD_IsUsingEventsDecisions()
	local eventsDecisionsModID = "1f941088-b185-4159-865c-472df81247b2"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == eventsDecisionsModID) then
			return false--true
		--end
	--end
end

--JFD_IsUsingExCE
function JFD_IsUsingExCE()
	local exCEModID = "6676902b-b907-45f1-8db5-32dcb2135eee"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == exCEModID) then
			return false --true
		--end
	--end
end

-- JFD_IsUsingHealthPlague
function JFD_IsUsingHealthPlague()
	local healthPlagueModID = "f4cad0a3-ba4d-470e-bf2d-296b428c2f7a"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == healthPlagueModID) then
			return true
		end
	end
	return false
end

--JFD_IsUsingGreatWorksManager
function JFD_IsUsingGreatWorksManager()
	local greatWorksManagerModID = "230546ae-ac6b-4a16-bd25-98c3b402849b"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == greatWorksManagerModID) then
			return true
		end
	end
	return false
end

--JFD_IsUsingInfoAddict
function JFD_IsUsingInfoAddict()
	local infoAddictModID = "aec5d10d-f00f-4fc7-b330-c3a1e86c91c3"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == infoAddictModID) then
			return true
		end
	end
	return false
end
--=======================================================================================================================
-- GENERAL UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local mathCeil  = math.ceil
local mathFloor = math.floor
--------------------------------------------------------------------------------------------------------------------------
-- RTP
--------------------------------------------------------------------------------------------------------------------------
-- EPITHETS
----------------------
--JFD_GetTotalSpecialistCount
function JFD_GetTotalSpecialistCount(playerID, specialistID)
	local player = Players[playerID]
	local numSpecialists = 0
	for city in player:Cities() do
		numSpecialists = numSpecialists + city:GetSpecialistCount(specialistID)
	end	
	return numSpecialists
end
----------------------
-- SOVEREIGNTY
----------------------
--JFD_HasReform
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
function JFD_HasReform(playerID, reformID)
	local player = Players[playerID]
	if (not playerID) then return false end
	if (not reformID) then return false end
	if (not userSettingSovereigntyCore) then return false end
	local reform = GameInfo.JFD_Reforms[reformID]
	local policyID = GameInfo.Policies[reform.PolicyType].ID
	return player:HasPolicy(policyID)
end

--JFD_GetNumReforms
function JFD_GetNumReforms(playerID, isOnlyLeftOrRight)
	local player = Players[playerID]
	local numReforms = 0
	if isOnlyLeftOrRight then
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT'") do
			if JFD_HasReform(playerID, row.ID) then
				numReforms = numReforms + 1
			end
		end
	else
		for row in GameInfo.JFD_Reforms("IsDisabled = 0") do
			if JFD_HasReform(playerID, row.ID) then
				numReforms = numReforms + 1
			end
		end
	end
	return numReforms
end

--JFD_GetHighestYield
function JFD_GetHighestYield(playerID, city)
	local player = Players[playerID]
	local highestYieldID = 0
	local highestYield = 0
	for row in GameInfo.Yields("ID >= 2 AND ID <= 5") do
		local yieldID = row.ID
		if (city and city:GetYieldRate(row.ID) > highestYield) then
			highestYieldID = yieldID
			highestYield = city:GetYieldRate(yieldID)
		elseif player:CalculateTotalYield(yieldID) > highestYield then
			highestYieldID = yieldID
			highestYield = player:CalculateTotalYield(yieldID)
		end
	end
	return highestYieldID, highestYield
end

--JFD_GetTotalYieldNobility
local yieldFoodID = GameInfoTypes["YIELD_FOOD"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_GetTotalYieldNobility(playerID)
	local player = Players[playerID]
	local totalYield = 0
	for city in player:Cities() do
		totalYield = totalYield + city:GetYieldRate(yieldFoodID)
		totalYield = totalYield + city:GetYieldRate(yieldProductionID)
	end	
	return totalYield
end
--------------------------------------------------------------------------------------------------------------------------
-- E&D
--------------------------------------------------------------------------------------------------------------------------
-- DECISIONS
----------------------
--JFD_GetNumEnactableDecisions
function JFD_GetNumEnactableDecisions(playerID)
	local numDecisions = 0
	tDecisions = {}
	-- Retrieve latest cache for active player from EnactDecisionsPopup.lua
	LuaEvents.GetDecisionsTable(playerID, tDecisions)
	for sKey, tDecision in pairs(tDecisions) do
		if tDecision.Enactable then
			numDecisions = numDecisions + 1
		end
	end
	return numDecisions
end
--------------------------------------------------------------------------------------------------------------------------
-- MATHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_CompileCityID (Sukritact)
function JFD_CompileCityID(pCity)
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded()	--Used to Compile Unique City ID
	local iCityID = (pCity:GetX() .. pCity:GetY() .. iOriginalOwner .. iTurnFounded)
	return iCityID
end

--JFD_GetEraAdjustedValue
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

--JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 2) - lower, "") + lower
end

--JFD_Round
function JFD_Round(num, idp)
	local mult = 10^(idp or 0)
	return mathFloor(num * mult + 0.5) / mult
end
--------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SendNotification
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	local sendNotification = false
	local sendSerialMessage = false
	if global then
		if metOnly then
			if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
				sendNotification = true
			end
		else
			sendNotification = true
		end
	else
		if player:IsHuman() then
			if metOnly then
				if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
					sendNotification = true
				end
			else
				sendNotification = true
			end
		end
	end

	if sendNotification then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
		if includesSerialMessage then
			Events.GameplayAlertMessage(description)
		end
	end
end   

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--------------------------------------------------------------------------------------------------------------------------
-- TECHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_IsTechnologyRequirementUnlocked
function JFD_IsTechnologyRequirementUnlocked(playerID, query)
	local player = Players[playerID]
	for row in GameInfo.Technologies_JFD_MiscEffects(query .. " > 0") do
		return player:HasTech(GameInfoTypes[row.TechType])
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
-- TEXT 
------------------------------------------------------------------------------------------------------------------------
--JFD_GetDefaultLeaderName
function JFD_GetDefaultLeaderName(playerID)
	local player = Players[playerID]
	local leaderName = GameInfo.Leaders[player:GetLeaderType()].Description
	--Check Policy-earned Names
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Policy_JFD_LeaderName("LeaderType = '" .. leaderType .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			leaderName = row.Description
		end
	end
	return leaderName
end

--JFD_IsCivilizationPlural
function JFD_IsCivilizationPlural(playerID)
	local player = Players[playerID]
	local civText = GameInfo.Civilizations[player:GetCivilizationType()].Description
	for row in DB.Query("SELECT Plurality FROM Language_en_US WHERE Tag = '" .. civText .. "' AND Plurality = '2'") do
		return true
	end
	return false
end

--JFD_IsLeaderFeminine
function JFD_IsLeaderFeminine(playerID)
	local player = Players[playerID]
	local leaderText = GameInfo.Leaders[player:GetLeaderType()]
	for row in DB.Query("SELECT Gender FROM Language_en_US WHERE Tag = '" .. leaderText.Description .. "' AND Gender = 'feminine'") do
		return true
	end
	return false
end

--JFD_TranslateDate
function JFD_TranslateDate(value)
	local date = "0 A.D."
	local era = "A.D."
	local realDate
	if value then
		if value < 0 then 
			realDate = value * -1
			era = "B.C."
		end
		date = value .. " " .. era
	end
	return date, value
end
--------------------------------------------------------------------------------------------------------------------------
-- CIVILIZATIONS
--------------------------------------------------------------------------------------------------------------------------
-- CITY STATE
-------------------
--JFD_GetNumCityStateFriends
function JFD_GetNumCityStateFriends(playerID)
	local numAllies = 0
	local numFriends = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:GetCapitalCity() and minorCiv:IsAlive()) then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
				numFriends = numFriends + 1
			elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				numFriends = numFriends + 1
				numAllies = numAllies + 1
			end
		end
	end
	return numAllies, numFriends
end
--------------------------------------------------------------------------------------------------------------------------
-- LEADERS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetLeaderFlavour
function JFD_GetLeaderFlavour(playerID, flavourType)
	local player = Players[playerID]
	if (not player) then return 5 end
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Leader_Flavors("LeaderType = '" .. leaderType .. "' AND FlavorType = '" .. flavourType .. "'") do
		return row.Flavor
	end
	return 5
end 
--------------------------------------------------------------------------------------------------------------------------
-- GOLDEN AGE
--------------------------------------------------------------------------------------------------------------------------
-- POINTS
-------------------
--JFD_GetHappinessToGoldenAgePoints
function JFD_GetHappinessToGoldenAgePoints(playerID)
	local player = Players[playerID]
	local happiness = player:GetExcessHappiness()
	local happinessToGoldenAgePoints = 0
	for row in GameInfo.Policies("HappinessToGoldenAgePoints <> 0") do
		if player:HasPolicy(row.ID) then
			happinessToGoldenAgePoints = JFD_Round((happiness*row.HappinessToGoldenAgePoints)/100)
		end
	end
	return happinessToGoldenAgePoints
end

--JFD_GetGoldenAgePointsPerTurn
function JFD_GetGoldenAgePointsPerTurn(playerID)
	local player = Players[playerID]
	local goldenAgePoints = player:GetExcessHappiness()
	goldenAgePoints = goldenAgePoints + player:GetGAPFromCities()
	goldenAgePoints = goldenAgePoints + player:GetGAPFromTraits()
	goldenAgePoints = goldenAgePoints + player:GetGAPFromReligion()
	goldenAgePoints = goldenAgePoints + JFD_GetHappinessToGoldenAgePoints(playerID)
	return goldenAgePoints
end
------------------------------------------------------------------------------------------------------------------------
-- RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_GetNumHolyCities
function JFD_GetNumHolyCities(playerID)
	local player = Players[playerID]
	local numHolyCities = 0
	for city in player:Cities() do
		if city:IsHolyCityAnyReligion() then
			numHolyCities = numHolyCities + 1
		end
	end
	return numHolyCities
end
-------------------
-- FOLLOWERS
-------------------
--JFD_GetNumCivilizationFollowers
function JFD_GetNumCivilizationFollowers(religionID, skipsPlayerID)
	local numFollowers = 0
	local numMajorFollowers = 0
	local numMinorFollowers = 0
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local player = Players[playerID]
		if (player:IsAlive() and player:HasStateReligion() and skipsPlayerID ~= playerID) then
			if player:GetStateReligion() == religionID then
				if player:IsMinorCiv() then
					numMinorFollowers = numMinorFollowers + 1
				else
					numMajorFollowers = numMajorFollowers + 1
				end
				numFollowers = numFollowers + 1
			end
		end
	end
	return numFollowers, numMajorFollowers, numMinorFollowers
end

--JFD_GetTotalPlayerFollowers
function JFD_GetTotalPlayerFollowers(playerID, religionID)
	local player = Players[playerID]
	local totalFollowers = 0
	if player:IsAlive() then
		for city in player:Cities() do
			totalFollowers = totalFollowers + city:GetNumFollowers(religionID)
		end
	end
	return totalFollowers
end

--JFD_GetTotalWorldFollowers
function JFD_GetTotalWorldFollowers(religionID)
	local player = Players[playerID]
	local totalWorldFollowers = 0
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local player = Players[playerID]
		if player:IsAlive() then
			for city in player:Cities() do
				totalWorldFollowers = totalWorldFollowers + city:GetNumFollowers(religionID)
			end
		end
	end	
	return totalWorldFollowers
end
--==========================================================================================================================
--==========================================================================================================================