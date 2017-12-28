-- JFD_PIT_Innovations_Utils
-- Author: JFD
-- DateCreated: 2/4/2017 2:21:09 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
local userSettingPITInnovationsCoreEraRestriction = (Game.GetUserSetting("JFD_PIT_INNOVATIONS_CORE_ERA_RESTRICTIONS") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- INNOVATIONS
------------------------------------------------------------------------------------------------------------------------
--Player:ChangeNumInnovations
function Player.ChangeNumInnovations(player, teamTechs, techID, num)
	local numInnovations = player:GetNumInnovations(teamTechs, techID, true)
	teamTechs:SetEurekaCounter(techID, numInnovations+num)
	LuaEvents.JFD_InnovationTriggered(player:GetID(), techID)
end

--Player:GetNumInnovations
function Player.GetNumInnovations(player, teamTechs, techID, skipsMaxInnovations)
	local tech = GameInfo.Technologies[techID]
	local numInnovations = teamTechs:GetEurekaCounter(techID)
	local numMaxInnovations = tech.Innovations
	if ((not skipsMaxInnovations) and numMaxInnovations > 0) then
		for row in GameInfo.Building_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				numMaxInnovations = numMaxInnovations + row.NumInnovations
			end
		end
		for row in GameInfo.Policy_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				numMaxInnovations = numMaxInnovations + row.NumInnovations
			end
		end
		for row in GameInfo.Trait_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				numMaxInnovations = numMaxInnovations + row.NumInnovations
			end
		end
	end
	return numInnovations, numMaxInnovations
end

--Player:DoRandomInnovation
function Player.DoRandomInnovation(player, eraID)
	local teamID = player:GetTeam()
	local team = Teams[teamID]
	local teamTechs = team:GetTeamTechs()
	local innovations = {}
	local innovationsNum = 1
	if eraID then
		for row in GameInfo.Technologies("Era = '" .. GameInfo.Eras[eraID].Type .. "'") do
			if player:CanInnovationScienceBoost(teamTechs, row.ID) then
				innovations[innovationsNum] = row.ID
				innovationsNum = innovationsNum + 1
			end
		end
	else
		for row in GameInfo.Technologies() do
			if player:CanInnovationScienceBoost(teamTechs, row.ID) then
				innovations[innovationsNum] = row.ID
				innovationsNum = innovationsNum + 1
			end
		end
	end
	local randomInnovation = Game.GetRandom(1,#innovations)
	if randomInnovation > innovationsNum then randomInnovation = innovationsNum end
	local techID = innovations[randomInnovation]
	LuaEvents.JFD_TriggerInnovation(player:GetID(), teamID, techID)
end
------------------
-- SCIENCE BOOST
------------------
--Player:CanInnovationScienceBoost
function Player.CanInnovationScienceBoost(player, teamTechs, techID)
	if (not player:CanEverResearch(techID)) then return false end
	if player:HasTech(techID) then return false end
	local numInnovations, maxInnovations = player:GetNumInnovations(teamTechs, techID)
	if numInnovations >= maxInnovations then return false end
	return true
end	

--Player:GetInnovationScienceBoost
function Player.GetInnovationScienceBoost(player, teamTechs, techID, baseScienceBoost)
	local tech = GameInfo.Technologies[techID]
	local scienceBoost = baseScienceBoost
	for row in GameInfo.Building_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			scienceBoost = scienceBoost + row.ScienceBoost
		end
	end
	for row in GameInfo.Policy_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			scienceBoost = scienceBoost + row.ScienceBoost
		end
	end
	for row in GameInfo.Trait_JFD_InnovationMods("(TechType IS NULL OR TechType = '" .. tech.Type .. "') OR (EraType IS NULL OR EraType = '" .. tech.Era .. "')") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			scienceBoost = scienceBoost + row.ScienceBoost
		end
	end
	scienceBoost = Game.GetRound((teamTechs:GetResearchCost(techID)*scienceBoost)/100)
	return scienceBoost
end
--=======================================================================================================================
--=======================================================================================================================
