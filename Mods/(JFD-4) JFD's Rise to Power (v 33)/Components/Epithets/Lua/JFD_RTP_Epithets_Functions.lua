--JFD_RTP_Epithets_Functions
-- Author: JFD
-- DateCreated: 10/14/2015 7:37:23 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTP_EpithetsUtils.lua")
include("JFD_RTP_MercenariesUtils.lua")
--=======================================================================================================================
-- GAMES DEFINES
--=======================================================================================================================
local defineDefaultGAPs = GameDefines["JFD_RTP_EPITHETS_DEFAULT_GOLDEN_AGE_POINTS"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingEpithetsCore = JFD_GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer 		= Players[activePlayerID]
local activePlayerTeam 	= Teams[activePlayer:GetTeam()]
local convertTextKey 	= Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- EPITHETS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Epithets_CityCaptured
local buildingClassCourthouseID = GameInfoTypes["BUILDINGCLASS_COURTHOUSE"]
local religionPantheonID = GameInfoTypes["RELIGION_PANTHEON"]
function JFD_RTP_Epithets_CityCaptured(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnCityConquered = 1") do
		if JFD_HasEpithet(newOwnerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumCourthouseMod*player:GetBuildingClassCount(buildingClassCourthouseID))
		if capital then epithetChance = epithetChance * 2 end
	end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if city:IsHolyCityAnyReligion() then
		for row in GameInfo.JFD_Epithets("IsOnHolyCityCaptured = 1") do
			if JFD_HasEpithet(newOwnerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = (row.AcquisitionChance)*(row.NumHolyCitiesMod*JFD_GetNumHolyCities(newOwnerID)+1)
		end
	end
	if player:HasStateReligion() then
		local cityReligionID = city:GetReligiousMajority()
		if cityReligionID ~= religionPantheonID then
			local stateReligionID = player:GetStateReligion()
			if stateReligionID ~= cityReligionID then
				for row in GameInfo.JFD_Epithets("IsOnCityOtherReligionConquered = 1") do
					if JFD_HasEpithet(newOwnerID, row.ID) then return end
					epithetID = row.ID
					epithetChance = (row.AcquisitionChance)*(row.NumCityStateReligionMod*player:GetNumCitiesWithStateReligion(stateReligionID))
				end
			elseif stateReligionID == cityReligionID then
				for row in GameInfo.JFD_Epithets("IsOnCityYourReligionConquered = 1") do
					if JFD_HasEpithet(newOwnerID, row.ID) then return end
					epithetID = row.ID
					epithetChance = (row.AcquisitionChance)*(row.NumCityStateReligionMod*player:GetNumCitiesWithStateReligion(stateReligionID))
				end
			end
		end
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(newOwnerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityCaptureComplete.Add(JFD_RTP_Epithets_CityCaptured)
end

--JFD_RTP_Epithets_CityConstructed
function JFD_RTP_Epithets_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local building = GameInfo.Buildings[buildingID]
	local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
	local epithetID = nil
	local epithetChance = 0
	if buildingClass.MaxGlobalInstances == 1 then
		for row in GameInfo.JFD_Epithets("IsOnAnyWonderConstructed = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = (row.AcquisitionChance)*(row.NumWondersMod*player:GetNumWonders())
		end
	end
	if (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1) then
		for row in GameInfo.JFD_Epithets("IsOnWonderConstructed = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			for row2 in GameInfo.JFD_Epithet_BuildingClasses("EpithetType = '" .. row.Type .. "' AND BuildingClassType = '" .. building.BuildingClass .. "'") do
				epithetID = row.ID
				epithetChance = row.AcquisitionChance
			end
		end
	end
	for row in GameInfo.JFD_Epithets("IsOnBuildingClassConstructed = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		for row2 in GameInfo.JFD_Epithet_BuildingClasses("EpithetType = '" .. row.Type .. "' AND BuildingClassType = '" .. building.BuildingClass .. "'") do
			epithetID = row.ID
			epithetChance = row.AcquisitionChance
		end
	end
	for row in GameInfo.JFD_Epithets("IsOnBuildingClassConstructed = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		for row2 in GameInfo.JFD_Epithet_BuildingClasses("EpithetType = '" .. row.Type .. "' AND BuildingClassType = '" .. building.BuildingClass .. "'") do
			epithetID = row.ID
			epithetChance = row.AcquisitionChance
		end
	end
	if isGold then
		for row in GameInfo.JFD_Epithets("IsOnBuildingPurchased = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = row.AcquisitionChance*(row.NumGoldMod*player:CalculateGoldRate())
		end
	end
	if isFaith then
		for row in GameInfo.JFD_Epithets("IsOnBuildingFaithPurchased = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = row.AcquisitionChance*(row.NumFaithMod*player:GetTotalFaithPerTurn())
		end
	end
	if (epithetID and epithetChance > 0) then
		local numBuildingClassMod = 0
		for row in GameInfo.JFD_Epithet_BuildingClasses("EpithetType = '" .. GameInfo.JFD_Epithets[epithetID].Type .. "' AND NumBuildingClassMod > 0") do
			local numBuildingClass = player:GetBuildingClassCount(GameInfoTypes[row.BuildingClassType])
			if numBuildingClass > 0 then
				numBuildingClassMod = numBuildingClassMod + (row.NumBuildingClassMod*(numBuildingClass))
			end
		end
		if numBuildingClassMod > 0 then epithetChance = epithetChance*numBuildingClassMod end
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Epithets_CityConstructed)
end

--JFD_RTP_Epithets_CityInvested
function JFD_RTP_Epithets_CityInvested(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnBuildingPurchased = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance*(row.NumGoldMod*player:CalculateGoldRate())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityInvestedBuilding.Add(JFD_RTP_Epithets_CityInvested)
end

--JFD_RTP_Epithets_CityRazed
function JFD_RTP_Epithets_CityRazed(playerID, plotX, plotY)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnCityRazed = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumCityMod*player:GetNumCities())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityRazed.Add(JFD_RTP_Epithets_CityRazed)
end

--JFD_RTP_Epithets_CityBeginsWLTKD
function JFD_RTP_Epithets_CityBeginsWLTKD(playerID, plotX, plotY, turns)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnCityWLTKD = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumHappinessMod*player:GetExcessHappiness())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityBeginsWLTKD.Add(JFD_RTP_Epithets_CityBeginsWLTKD)
end

--JFD_RTP_Epithets_CityStateBullied
function JFD_RTP_Epithets_CityStateBullied(playerID, minorPlayerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnCityStateBully = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumStrengthMod*(player:GetMilitaryMight()/100))
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.PlayerBullied.Add(JFD_RTP_Epithets_CityStateBullied)
end

--JFD_RTP_Epithets_CityStateClaimed
function JFD_RTP_Epithets_CityStateClaimed(playerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnCityStateClaimed = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		local numAllies, numFriends = JFD_GetNumCityStateFriends(playerID)
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumCityStateFriendsMod*numFriends)
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	LuaEvents.JFD_ClaimPushed.Add(JFD_RTP_Epithets_CityStateClaimed)
end

--JFD_RTP_Epithets_CityPurchasedLevyUnit
function JFD_RTP_Epithets_CityPurchasedLevyUnit(playerID, city, unitID, numPop, isDefensive)	
	if isDefensive then return end
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnLevyPurchased = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumPopulationMod*(player:GetTotalPopulation()))
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	LuaEvents.JFD_CityPurchasedLevyUnit.Add(JFD_RTP_Epithets_CityPurchasedLevyUnit)
end

--JFD_RTP_Epithets_CityPurchasedSlaveUnit
function JFD_RTP_Epithets_CityPurchasedSlaveUnit(playerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnSlavePurchased = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance
		local numResourceMod = row.NumResourceMod
		if numResourceMod > 0 then
			local resourceID = GameInfoTypes[row.ResourceMod]
			epithetChance = epithetChance*(numResourceMod*(player:GetNumResourceAvailable(resourceID, true)+1))
		end
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	LuaEvents.JFD_CityPurchasedSlaveUnit.Add(JFD_RTP_Epithets_CityPurchasedSlaveUnit)
end

--JFD_RTP_Epithets_ContractStarted
function JFD_RTP_Epithets_ContractStarted(playerID, contractID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnMercenaryHired = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumContractsMod*player:GetNumActivePlayerContracts())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.ContractStarted.Add(JFD_RTP_Epithets_ContractStarted)
end

--JFD_RTP_Epithets_PlayerAdoptPolicyBranch
function JFD_RTP_Epithets_PlayerAdoptPolicyBranch(playerID, policyBranchID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnPolicyBranch = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumPolicyBranchMod*player:GetNumPolicyBranchesUnlocked())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_RTP_Epithets_PlayerAdoptPolicyBranch)
end

--JFD_RTP_Epithets_PlayerGoldenAge
function JFD_RTP_Epithets_PlayerGoldenAge(playerID, isStart)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if (not isStart) then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnGoldenAge = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumHappinessMod*player:GetExcessHappiness())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.PlayerGoldenAge.Add(JFD_RTP_Epithets_PlayerGoldenAge)
end

--JFD_RTP_Epithets_NaturalWonderDiscovered
function JFD_RTP_Epithets_NaturalWonderDiscovered(teamID, featureID, plotX, plotY, isFirst)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if (not isFirst) then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnNaturalWonderDiscovered = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance*(row.NumNaturalWonderDiscoveredMod*team:GetNumNaturalWondersDiscovered())
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.NaturalWonderDiscovered.Add(JFD_RTP_Epithets_NaturalWonderDiscovered)
end

--JFD_RTP_Epithets_PlayerLiberated
function JFD_RTP_Epithets_PlayerLiberated(playerID, otherPlayerID, cityID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local otherPlayer = Players[otherPlayerID]
	local epithetID = nil
	local epithetChance = 0
	if otherPlayer:IsMinorCiv() then
		for row in GameInfo.JFD_Epithets("IsOnCityStateLiberated = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = row.AcquisitionChance
		end
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.PlayerLiberated.Add(JFD_RTP_Epithets_PlayerLiberated)
end

--JFD_RTP_Epithets_ReformPassed
function JFD_RTP_Epithets_ReformPassed(playerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnReformPassed = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance*(row.NumReformMod*JFD_GetNumReforms(playerID, true))
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	LuaEvents.JFD_ReformPassed.Add(JFD_RTP_Epithets_ReformPassed)
end

--JFD_RTP_Epithets_TeamSetEra
function JFD_RTP_Epithets_TeamSetEra(teamID, eraID, isFirst)
	if (not isFirst) then return end
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnFirstToEra = '" .. GameInfo.Eras[eraID].Type .. "'") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Epithets_TeamSetEra)
end

--JFD_RTP_Epithets_UnitCreated
function JFD_RTP_Epithets_UnitCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	local unitClass = GameInfo.Units[unitTypeID].Class
	for row in GameInfo.JFD_Epithets("IsOnUnitClassBorn = '" .. unitClass .. "'") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance
		local numImprovementMod = row.NumImprovementMod
		if numImprovementMod > 0 then
			local improvementID = GameInfoTypes[row.ImprovementMod]
			epithetChance = epithetChance*(numImprovementMod*(player:GetImprovementCount(improvementID)+1))
		end
		local numSpecialistMod = row.NumSpecialistMod
		if numSpecialistMod > 0 then
			local specialistID = GameInfoTypes[row.SpecialistMod]
			epithetChance = epithetChance*(numSpecialistMod*(JFD_GetTotalSpecialistCount(playerID, specialistID)+1))
		end
		local numResourceMod = row.NumResourceMod
		if numResourceMod > 0 then
			local resourceID = GameInfoTypes[row.ResourceMod]
			epithetChance = epithetChance*(numResourceMod*(player:GetNumResourceAvailable(resourceID, true)+1))
		end
		local numUnitMod = row.NumUnitClassMod
		if numUnitMod > 0 then
			local unitClassID = GameInfoTypes[row.IsOnUnitClassBorn]
			epithetChance = epithetChance*(numUnitMod*(player:GetUnitClassCount(unitClassID)+1))
		end
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.UnitCreated.Add(JFD_RTP_Epithets_UnitCreated)
end

--JFD_RTP_Epithets_UnitKilledInCombat
local playerBarbarianID = 63
function JFD_RTP_Epithets_UnitKilledInCombat(playerID, killedPlayerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if killedPlayerID ~= playerBarbarianID then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnBarbarianKilled = 1") do
		if JFD_HasEpithet(playerID, row.ID) then return end
		epithetID = row.ID
		epithetChance = row.AcquisitionChance
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.UnitKilledInCombat.Add(JFD_RTP_Epithets_UnitKilledInCombat)
end

--JFD_RTP_Epithets_UnitTrained
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
function JFD_RTP_Epithets_UnitTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	if isFaith then
		for row in GameInfo.JFD_Epithets("IsOnUnitFaithPurchase = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = row.AcquisitionChance*(row.NumFaithMod*(player:GetTotalFaithPerTurn()))
		end
	end
	local unit = player:GetUnitByID(unitID)
	if unit:GetDomainType() == domainSeaID then
		for row in GameInfo.JFD_Epithets("IsOnNavalUnitTrained = 1") do
			if JFD_HasEpithet(playerID, row.ID) then return end
			epithetID = row.ID
			epithetChance = row.AcquisitionChance*(row.NumThisUnitClassMod*(player:GetUnitClassCount(unit:GetUnitClassType())))
		end
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityTrained.Add(JFD_RTP_Epithets_UnitTrained)
end

--JFD_RTP_Epithets_WarDeclared
function JFD_RTP_Epithets_WarDeclared(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = Teams[otherTeamID]:GetLeaderID()
	if player:IsMinorCiv() then return end
	local epithetID = nil
	local epithetChance = 0
	for row in GameInfo.JFD_Epithets("IsOnAggressiveWar = 1") do
		if JFD_HasEpithet(teamID, row.ID) then return end
		local cityDifference = (Players[otherPlayerID]:GetNumCities()-player:GetNumCities())+1
		epithetID = row.ID
		epithetChance = (row.AcquisitionChance)*(row.NumTheirCitiesMod*cityDifference)
	end
	if (epithetID and epithetChance > 0) then
		JFD_DoEpithet(playerID, epithetID, epithetChance)
	end
end
if userSettingEpithetsCore then
	GameEvents.DeclareWar.Add(JFD_RTP_Epithets_WarDeclared)
end
--=======================================================================================================================
-- UI FUNCTIONS
--=======================================================================================================================
-- EPITHETS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Epithets_ShowChooseEpithetPopup
local g_EpithetSelectedID = nil
function JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetID)
	if JFD_HasEpithet(activePlayerID, epithetID) then return end
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_EPITHET")
	local epithet = GameInfo.JFD_Epithets[epithetID]
	local goldenAgeReward = (defineDefaultGAPs*(activePlayer:GetCurrentEra()+1))
	local leaderName = JFD_GetDefaultLeaderName(activePlayerID)
	local epithetShortDesc, epithetDesc = JFD_GetEpithetDescription(activePlayerID, epithetID)
	local leaderDesc = Locale.ConvertTextKey(leaderName) .. " " .. Locale.ConvertTextKey(epithetShortDesc)
	Controls.EpithetTitle:LocalizeAndSetText("TXT_KEY_JFD_EPITHETS_TITLE")
	Controls.EpithetDescription:LocalizeAndSetText(epithet.Help, leaderDesc)
	Controls.EpithetOptionText1:LocalizeAndSetText("TXT_KEY_JFD_EPITHETS_CHOOSE_EPITHET", epithetShortDesc)
	Controls.EpithetOptionButton1:LocalizeAndSetToolTip("TXT_KEY_JFD_EPITHETS_CHOOSE_EPITHET_TT", epithetDesc)
	Controls.EpithetOptionButton2:LocalizeAndSetToolTip("TXT_KEY_JFD_EPITHETS_DECLINE_EPITHET_TT", goldenAgeReward)
	g_EpithetSelectedID = epithetID
	if JFD_HasAnyEpithet(activePlayerID) then
		local currentEpithetID = JFD_GetEpithetID(activePlayerID)
		local currentEpithetShortDesc, currentEpithetDesc = JFD_GetEpithetDescription(activePlayerID, currentEpithetID)
		Controls.EpithetOptionButton2:SetHide(true)
		Controls.EpithetOptionButton3:SetHide(false)
		Controls.EpithetOptionText3:LocalizeAndSetText("TXT_KEY_JFD_EPITHETS_DECLINE_EPITHET_EXISTING", currentEpithetShortDesc)
		Controls.EpithetOptionButton3:LocalizeAndSetToolTip("TXT_KEY_JFD_EPITHETS_DECLINE_EPITHET_EXISTING_TT", currentEpithetDesc)
	else
		Controls.EpithetOptionButton2:SetHide(false)
		Controls.EpithetOptionButton3:SetHide(true)
	end
	UIManager:QueuePopup(ContextPtr, PopupPriority.BarbarianCamp)
end
LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup.Add(JFD_RTP_Epithets_ShowChooseEpithetPopup)

UIManager:QueuePopup(ContextPtr, PopupPriority.BarbarianCamp)
UIManager:DequeuePopup(ContextPtr)

function JFD_RTP_Epithets_Accept()
	JFD_SetHasEpithet(activePlayerID, g_EpithetSelectedID, true, true)
	UIManager:DequeuePopup(ContextPtr)
end
Controls.EpithetOptionButton1:RegisterCallback(Mouse.eLClick, JFD_RTP_Epithets_Accept)

function JFD_RTP_Epithets_Decline()
	UIManager:DequeuePopup(ContextPtr)
	local goldenAgeReward = (defineDefaultGAPs*(activePlayer:GetCurrentEra()+1))
	activePlayer:ChangeGoldenAgeProgressMeter(goldenAgeReward)
	local capital = activePlayer:GetCapitalCity()
	Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", goldenAgeReward), true)
end
Controls.EpithetOptionButton2:RegisterCallback(Mouse.eLClick, JFD_RTP_Epithets_Decline)

function JFD_RTP_Epithets_Decline()
	UIManager:DequeuePopup(ContextPtr)
end
Controls.EpithetOptionButton3:RegisterCallback(Mouse.eLClick, JFD_RTP_Epithets_Decline)
--=======================================================================================================================
--=======================================================================================================================