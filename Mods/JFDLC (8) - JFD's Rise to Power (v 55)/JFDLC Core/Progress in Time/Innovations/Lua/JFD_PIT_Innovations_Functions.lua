-- JFD_PIT_Innovations_Functions
-- Author: JFD
-- DateCreated: 2/4/2017 2:20:28 AM
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
local userSettingCIDColoniesCore    			  = (Game.GetUserSetting("JFD_CID_COLONIES_CORE") == 1)
local userSettingCIDHealthCore					  = (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
local userSettingCIDLoyaltyCore     			  = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingPITInnovationsCore 			  = (Game.GetUserSetting("JFD_PIT_INNOVATIONS_CORE") == 1)
local userSettingPITInnovationsCoreEraRestriction = (Game.GetUserSetting("JFD_PIT_INNOVATIONS_CORE_ERA_RESTRICTIONS") == 1)
local userSettingRTPSovereigntyCore 			  = (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- INNOVATIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_PIT_Innovations_PlayerCanEverResearch
function JFD_PIT_Innovations_PlayerCanEverResearch(playerID, techID)
	local player = Players[playerID]
	local tech = GameInfo.Technologies[techID]
	local currentEraID = (player:GetCurrentEra()+1)
	return GameInfoTypes[tech.Era] <= currentEraID
end
if userSettingPITInnovationsCoreEraRestriction then
	GameEvents.PlayerCanEverResearch.Add(JFD_PIT_Innovations_PlayerCanEverResearch)
end

--JFD_TriggerInnovation
function JFD_TriggerInnovation(playerID, teamID, techID, city)
	local player = Players[playerID]
	local team = Teams[teamID]
	local teamTechs = team:GetTeamTechs()
	if ((not techID) or techID == -1) then return end
	local tech = GameInfo.Technologies[techID]
	local techDesc = tech.Description
	if player:CanInnovationScienceBoost(teamTechs, techID) then
		for row in GameInfo.Technology_JFD_Innovations("TechType = '" .. tech.Type .. "'") do
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local city = city or player:GetCapitalCity()
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	LuaEvents.JFD_TriggerInnovation.Add(JFD_TriggerInnovation)
end
------------------------
-- CORE
------------------------
--JFD_PIT_Innovations_CityBoughtPlot
function JFD_PIT_Innovations_CityBoughtPlot(playerID, cityID, plotX, plotY, isGold, isCulture)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local isHuman = player:IsHuman()
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local plot = Map.GetPlot(plotX, plotY)
	for row in GameInfo.Technology_JFD_Innovations("TileAcquired = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.TerrainType and plot:GetTerrainType() == GameInfoTypes[row.TerrainType] then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)	
			end
			if (row.ImprovementType and plot:GetResourceType() > -1) then
				for row2 in GameInfo.Improvement_ResourceTypes("ResourceType = '" .. GameInfo.Resources[plot:GetResourceType()].Type .. "' AND ImprovementType = '" .. row.ImprovementType .. "'") do
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
			end
			if (row.ResourceType and plot:GetResourceType() > -1) then
				for row2 in GameInfo.Improvement_ResourceTypes("ResourceType = '" .. GameInfo.Resources[plot:GetResourceType()].Type .. "'") do
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.CityBoughtPlot.Add(JFD_PIT_Innovations_CityBoughtPlot)
end

--JFD_PIT_Innovations_CityConstructed
function JFD_PIT_Innovations_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local teamID = player:GetTeam()
	local team = Teams[teamID]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local building = GameInfo.Buildings[buildingID]
	local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
	for row in GameInfo.Technology_JFD_Innovations("BuildingConstructed = 1 AND IsProduced = 0 AND IsGoldSpent = 0 AND IsFaithSpent = 0") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and building.PrereqTech and GameInfo.Technologies[building.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.BuildingClassType and building.BuildingClass == row.BuildingClassType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.IsSpecialist and building.SpecialistCount > 0 then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsNationalWonder and buildingClass.MaxPlayerInstances == 1) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsWorldWonder and buildingClass.MaxGlobalInstances == 1) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsNotWonder and buildingClass.MaxGlobalInstances ~= -1 and buildingClass.MaxPlayerInstances ~= -1) then
				scienceBoost = 0
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
	if ((not isGold) and (not isFaith)) then
		for row in GameInfo.Technology_JFD_Innovations("BuildingConstructed = 1 AND IsProduced = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.EraType and building.PrereqTech and GameInfo.Technologies[building.PrereqTech].Era == row.EraType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.BuildingClassType and building.BuildingClass == row.BuildingClassType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if row.IsSpecialist and building.SpecialistCount > 0 then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsNationalWonder and buildingClass.MaxPlayerInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsWorldWonder and buildingClass.MaxGlobalInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
		if city:IsCapital() and building.SpecialistCount > 0 then
			for row in GameInfo.Traits("FreeInnovationOnSpecialistConstructedInCapital = 1") do
				if player:HasTrait(row.ID) then
					player:DoRandomInnovation(player:GetCurrentEra())
				end
			end
		end
	end
	if isGold then
		for row in GameInfo.Technology_JFD_Innovations("BuildingConstructed = 1 AND IsGoldSpent = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.EraType and building.PrereqTech and GameInfo.Technologies[building.PrereqTech].Era == row.EraType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.BuildingClassType and building.BuildingClass == row.BuildingClassType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if row.IsSpecialist and building.SpecialistCount > 0 then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsNationalWonder and buildingClass.MaxPlayerInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsWorldWonder and buildingClass.MaxGlobalInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
	if isFaith then
		for row in GameInfo.Technology_JFD_Innovations("BuildingConstructed = 1 AND IsFaithSpent = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.EraType and building.PrereqTech and GameInfo.Technologies[building.PrereqTech].Era == row.EraType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.BuildingClassType and building.BuildingClass == row.BuildingClassType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if row.IsSpecialist and building.SpecialistCount > 0 then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsNationalWonder and buildingClass.MaxPlayerInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.IsWorldWonder and buildingClass.MaxGlobalInstances == 1) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
	if building.GrantsAllEraInnovations then
		for row in GameInfo.Technologies("Era = '" .. building.GrantsAllEraInnovations .. "'") do
			LuaEvents.JFD_TriggerInnovation(playerID, teamID, row.ID, city)
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.CityConstructed.Add(JFD_PIT_Innovations_CityConstructed)	
end

--JFD_PIT_Innovations_CityCreated
function JFD_PIT_Innovations_CityCreated(playerID, cityID, projectID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local project = GameInfo.Projects[projectID]
	for row in GameInfo.Technology_JFD_Innovations("ProjectedFinished = 1 AND ProjectType = '" .. project.Type .. "'") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.CityCreated.Add(JFD_PIT_Innovations_CityCreated)	
end

--JFD_PIT_Innovations_CityInvestedBuilding
function JFD_PIT_Innovations_CityInvestedBuilding(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local building = GameInfo.Buildings[buildingID]
	for row in GameInfo.Technology_JFD_Innovations("InvestmentMade = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.BuildingClassType and building.BuildingClass == row.BuildingClassType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and building.PrereqTech and GameInfo.Technologies[building.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.IsSpecialist and building.SpecialistCount > 0 then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsWonder and building.Quote) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.CityInvestedBuilding.Add(JFD_PIT_Innovations_CityInvestedBuilding)	
end

--JFD_PIT_Innovations_CityTrained
function JFD_PIT_Innovations_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	for row in GameInfo.Technology_JFD_Innovations("UnitTrained = 1 AND IsProduced = 0 AND IsFaithSpent = 0 AND IsGoldSpent = 0") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[techID].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and unitInfo.PrereqTech and GameInfo.Technologies[unitInfo.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
	if ((not isGold) and (not isFaith)) then
		for row in GameInfo.Technology_JFD_Innovations("UnitTrained = 1 AND IsProduced = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.EraType and unitInfo.PrereqTech and GameInfo.Technologies[unitInfo.PrereqTech].Era == row.EraType) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
	if isGold then
		for row in GameInfo.Technology_JFD_Innovations("UnitTrained = 1 AND IsGoldSpent = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
	if isFaith then
		for row in GameInfo.Technology_JFD_Innovations("UnitTrained = 1 AND IsFaithSpent = 1") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.CityTrained.Add(JFD_PIT_Innovations_CityTrained)	
end

--JFD_PIT_Innovations_DeclareWar
function JFD_PIT_Innovations_DeclareWar(playerAttackID, playerDefendID)
	local player = Players[playerAttackID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("WarDeclaredTo = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsMajor and (not player:IsMinorCiv())) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsMinor and player:IsMinorCiv()) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.DeclareWar.Add(JFD_PIT_Innovations_DeclareWar)	
end

--JFD_PIT_Innovations_GovernmentCooldownChanges
function JFD_PIT_Innovations_GovernmentCooldownChanges(playerID, governmentID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("LegislatureFormed = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if (userSettingPITInnovationsCore and userSettingRTPSovereigntyCore) then
	LuaEvents.JFD_LegislatureFormed.Add(JFD_PIT_Innovations_GovernmentCooldownChanges)	
end

--JFD_PIT_Innovations_GreatPersonExpended
function JFD_PIT_Innovations_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local unit = GameInfo.Units[unitTypeID]
	for row in GameInfo.Technology_JFD_Innovations("GreatPersonExpended = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitClassType and unit.Class == row.UnitClassType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.GreatPersonExpended.Add(JFD_PIT_Innovations_GreatPersonExpended)	
end

--JFD_PIT_Innovations_MinorAlliesChanged
function JFD_PIT_Innovations_MinorAlliesChanged(minorPlayerID, playerID, isAlly, oldFriendship, newFriendship)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not isAlly) then return end
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("CityStateAllied = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.MinorAlliesChanged.Add(JFD_PIT_Innovations_MinorAlliesChanged)
end

--JFD_PIT_Innovations_NaturalWonderDiscovered
function JFD_PIT_Innovations_NaturalWonderDiscovered(teamID, featureID, plotX, plotY, isFirst)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local teamTechs = team:GetTeamTechs()
	for row in GameInfo.Technology_JFD_Innovations("NaturalWonderDiscovered = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.NaturalWonderDiscovered.Add(JFD_PIT_Innovations_NaturalWonderDiscovered)
end

--JFD_PIT_Innovations_NaturalWonderDiscovered
function JFD_PIT_Innovations_NaturalWonderDiscovered(playerID, plotX, plotY, isWar, isBystanders)
	if isBystanders then return end
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	for row in GameInfo.Technology_JFD_Innovations("NuclearBombDetonated = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.NuclearDetonation.Add(JFD_PIT_Innovations_NaturalWonderDiscovered)
end

--JFD_PIT_Innovations_PantheonFounded
function JFD_PIT_Innovations_PantheonFounded(playerID, cityID, religionID, beliefID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	for row in GameInfo.Technology_JFD_Innovations("PantheonFounded = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.PantheonFounded.Add(JFD_PIT_Innovations_PantheonFounded)	
end

--JFD_PIT_Innovations_PlagueBegins
function JFD_PIT_Innovations_PlagueBegins(playerID, plagueID, city, plotX, plotY, plagueTurns)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	for row in GameInfo.Technology_JFD_Innovations("PlagueBegins = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if (userSettingPITInnovationsCore and userSettingCIDHealthCore) then
	LuaEvents.JFD_PlagueBegins.Add(JFD_PIT_Innovations_PlagueBegins)
end

--JFD_PIT_Innovations_PlayerAdoptPolicy
function JFD_PIT_Innovations_PlayerAdoptPolicy(playerID, policyBranchID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("PolicyAdopted = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.PlayerAdoptPolicy.Add(JFD_PIT_Innovations_PlayerAdoptPolicy)	
end

--JFD_PIT_Innovations_PlayerAdoptPolicyBranch
function JFD_PIT_Innovations_PlayerAdoptPolicyBranch(playerID, policyBranchID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("PolicyBranchOpened = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_PIT_Innovations_PlayerAdoptPolicyBranch)	
end

--JFD_PIT_Innovations_PlayerBuilt
function JFD_PIT_Innovations_PlayerBuilt(playerID, unitID, plotX, plotY, buildID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	local build = GameInfo.Builds[buildID]
	local plot = Map.GetPlot(plotX, plotY)
	for row in GameInfo.Technology_JFD_Innovations("ImprovementBuilt = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.ImprovementType and build.ImprovementType == row.ImprovementType and (not row.ResourceType)) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.ResourceType and plot:GetResourceType() > -1 and player:HasTech(GameInfoTypes[GameInfo.Resources[row.ResourceType].TechReveal]) and plot:GetResourceType() == GameInfoTypes[row.ResourceType] and (not row.ImprovementType)) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.ResourceType and plot:GetResourceType() > -1 and player:HasTech(GameInfoTypes[GameInfo.Resources[row.ResourceType].TechReveal]) and plot:GetResourceType() == GameInfoTypes[row.ResourceType] and build.ImprovementType and row.ImprovementType == build.ImprovementType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.PlayerBuilt.Add(JFD_PIT_Innovations_PlayerBuilt)
end

--JFD_PIT_Innovations_PlayerCityFounded
function JFD_PIT_Innovations_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local isHuman = player:IsHuman()
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	local plot = Map.GetPlot(plotX, plotY)
	if (not plot) then return end
	for row in GameInfo.Technology_JFD_Innovations("CityFounded = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsAdjacentFeatureType and city:IsAdjacentToFeature(GameInfoTypes[row.IsAdjacentFeatureType])) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsAdjacentPlotType and city:IsAdjacentToPlotType(GameInfoTypes[row.IsAdjacentPlotType])) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsAdjacentTerrainType and city:IsAdjacentToTerrain(GameInfoTypes[row.IsAdjacentTerrainType])) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsColony and userSettingCIDColoniesCore and player:IsPlotFoundsColony(plot, false, true)) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsForeignContinent and plot:GetArea() ~= Map.GetPlot(capital:GetX(), capital:GetY()):GetArea()) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
	--Free Innovations
	if (not city:IsCapital()) then return end
	for row in GameInfo.Technology_JFD_Innovations("FreeInnovations > 0") do
		local techID = GameInfoTypes[row.TechType]
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			if (player:GetNumInnovations(teamTechs, techID, true) < row.FreeInnovations) then
				local scienceBoost = 0
				if row.IsAny then
					scienceBoost = (player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)*row.FreeInnovations)
				end
				if row.CultureType then
					if player:GetCultureType() == GameInfoTypes[row.CultureType] then
						scienceBoost = (player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)*row.FreeInnovations)
					end
				end
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, row.FreeInnovations)
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.PlayerCityFounded.Add(JFD_PIT_Innovations_PlayerCityFounded)	
end

--JFD_PIT_Innovations_ReformPassed
function JFD_PIT_Innovations_ReformPassed(playerID, reformID, isFree)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local isHuman = player:IsHuman()
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if GameInfo.JFD_Reforms[reformID].Alignment == "REFORM_CENTRE" then return end
	for row in GameInfo.Technology_JFD_Innovations("ReformPassed = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	LuaEvents.JFD_ReformPassed.Add(JFD_PIT_Innovations_ReformPassed)
end

--JFD_PIT_Innovations_ReligionEnhanced
function JFD_PIT_Innovations_ReligionEnhanced(playerID, religionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("ReligionEnhanced = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.ReligionEnhanced.Add(JFD_PIT_Innovations_ReligionEnhanced)	
end

--JFD_PIT_Innovations_ReligionFounded
function JFD_PIT_Innovations_ReligionFounded(playerID, cityID, religionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	for row in GameInfo.Technology_JFD_Innovations("ReligionFounded = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.ReligionFounded.Add(JFD_PIT_Innovations_ReligionFounded)	
end

--JFD_PIT_Innovations_ReligionReformed
function JFD_PIT_Innovations_ReligionReformed(playerID, religionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("ReligionReformed = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.ReligionReformed.Add(JFD_PIT_Innovations_ReligionReformed)	
end

--JFD_PIT_Innovations_ResolutionResult
function JFD_PIT_Innovations_ResolutionResult(resolutionID, proposerID, choiceID, isEnacted, isPassed)
	if (not isPassed) then return end
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (not player:IsAlive()) then return end
		local team = Teams[player:GetTeam()]
		local teamTechs = team:GetTeamTechs()
		local capital = player:GetCapitalCity()
		if (not capital) then return end
		for row in GameInfo.Technology_JFD_Innovations("ResolutionPassed = 1 AND ResolutionType = '" .. GameInfo.Resolutions[resolutionID].Type .. "'") do
			local techID = GameInfoTypes[row.TechType]
			local techDesc = GameInfo.Technologies[row.TechType].Description
			if player:CanInnovationScienceBoost(teamTechs, techID) then
				local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				if scienceBoost > 0 then
					teamTechs:ChangeResearchProgress(techID, scienceBoost)
					player:ChangeNumInnovations(teamTechs, techID, 1)
					if player:IsHuman() then 
						local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
					end
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.ResolutionResult.Add(JFD_PIT_Innovations_ResolutionResult)	
end

--JFD_PIT_Innovations_TeamMeet
function JFD_PIT_Innovations_TeamMeet(playerMetID, playerMeetID)
	local player = Players[playerMeetID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local playerMet = Players[playerMetID]
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	for row in GameInfo.Technology_JFD_Innovations("CivilizationMet = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsMajor and (not playerMet:IsMinorCiv())) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsMinor and playerMet:IsMinorCiv()) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.TeamMeet.Add(JFD_PIT_Innovations_TeamMeet)	
end

--JFD_PIT_Innovations_TeamTechResearched
function JFD_PIT_Innovations_TeamTechResearched(teamID, techID)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local teamTechs = team:GetTeamTechs()
	local tech = GameInfo.Technologies[techID]
	for row in GameInfo.Technology_JFD_Innovations("TechResearched = 1 AND TechType = '" .. tech.Type .. "'") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.EraType then
				if tech.Era == row.EraType then
					scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
				end
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.TeamTechResearched.Add(JFD_PIT_Innovations_TeamTechResearched)	
end

--JFD_PIT_Innovations_SetPopulation
function JFD_PIT_Innovations_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	if oldPopulation >= newPopulation then return end
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local isHuman = player:IsHuman()
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	for row in GameInfo.Technology_JFD_Innovations("CitizenBorn = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.Population and oldPopulation > row.Population) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.SetPopulation.Add(JFD_PIT_Innovations_SetPopulation)
end

--JFD_PIT_Innovations_TileImprovementChanged
function JFD_PIT_Innovations_TileImprovementChanged(plotX, plotY, playerID, oldImprovementID, newImprovementID, isPillaged)
	if isPillaged then return end
	if playerID <= -1 then return end
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local isHuman = player:IsHuman()
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	for row in GameInfo.Technology_JFD_Innovations("ImprovementChanged = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.ImprovementType and oldImprovementID == GameInfoTypes[row.ImprovementType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.TileImprovementChanged.Add(JFD_PIT_Innovations_TileImprovementChanged)
end

--JFD_PIT_Innovations_TileRevealed
function JFD_PIT_Innovations_TileRevealed(plotX, plotY, teamID, fromTeamID, isFirst)
	local team = Teams[teamID]
	local teamTechs = team:GetTeamTechs()
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local plot = Map.GetPlot(plotX, plotY)
	for row in GameInfo.Technology_JFD_Innovations("TileDiscovered = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.TerrainType and plot:GetTerrainType() == GameInfoTypes[row.TerrainType] then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)	
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.TileRevealed.Add(JFD_PIT_Innovations_TileRevealed)
end

--JFD_PIT_Innovations_UnitPrekill
function JFD_PIT_Innovations_UnitPrekill(playerKilledID, unitID, unitType, plotX, plotY, isDelay, playerID)
	if (not isDelay) then return end
	if (not playerID) then return end
	if (not playerKilledID) then return end
	if playerID == playerKilledID then return end
	local player = Players[playerID]
	if (not player) then return end
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local playerKilled = Players[playerKilledID]
	local unit = playerKilled:GetUnitByID(unitID)
	if (not unit) then return end
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	for row in GameInfo.Technology_JFD_Innovations("UnitKilled = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.IsBarbarian and playerKilled:IsBarbarian()) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and unitInfo.PrereqTech and GameInfo.Technologies[unitInfo.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.UnitPrekill.Add(JFD_PIT_Innovations_UnitPrekill)	
end

--JFD_PIT_Innovations_UnitPromoted
function JFD_PIT_Innovations_UnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local plot = Map.GetPlot(plotX, plotY)
	if (not plot) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	for row in GameInfo.Technology_JFD_Innovations("UnitPromoted = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and unitInfo.PrereqTech and GameInfo.Technologies[unitInfo.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.UnitPromoted.Add(JFD_PIT_Innovations_UnitPromoted)
end

--JFD_PIT_Innovations_UnitSetXY
function JFD_PIT_Innovations_UnitSetXY(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local plot = Map.GetPlot(plotX, plotY)
	if (not plot) then return end
	for row in GameInfo.Technology_JFD_Innovations("TileTraversed = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if row.TerrainType and plot:GetTerrainType() == GameInfoTypes[row.TerrainType] then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)	
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.UnitSetXY.Add(JFD_PIT_Innovations_UnitSetXY)
end

--JFD_PIT_Innovations_UnitUpgraded
function JFD_PIT_Innovations_UnitUpgraded(playerID, unitID, newUnitID, isGoodyHut)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local plot = Map.GetPlot(plotX, plotY)
	if (not plot) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	for row in GameInfo.Technology_JFD_Innovations("UnitUpgraded = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = 0
			if row.IsAny then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.EraType and unitInfo.PrereqTech and GameInfo.Technologies[unitInfo.PrereqTech].Era == row.EraType) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.DomainType and unit:GetDomainType() == GameInfoTypes[row.DomainType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitClassType and unit:GetUnitClassType() == GameInfoTypes[row.UnitClassType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if (row.UnitCombatType and unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType]) then
				scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			end
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if userSettingPITInnovationsCore then
	GameEvents.UnitUpgraded.Add(JFD_PIT_Innovations_UnitUpgraded)
end

--JFD_PIT_Innovations_WLTKDBegins
function JFD_PIT_Innovations_WLTKDBegins(playerID, city, plotX, plotY, WLTKDTurns)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	for row in GameInfo.Technology_JFD_Innovations("LoyaltyWLTKDStarted = 1") do
		local techID = GameInfoTypes[row.TechType]
		local techDesc = GameInfo.Technologies[row.TechType].Description
		if player:CanInnovationScienceBoost(teamTechs, techID) then
			local scienceBoost = player:GetInnovationScienceBoost(teamTechs, techID, row.ScienceBoost)
			if scienceBoost > 0 then
				teamTechs:ChangeResearchProgress(techID, scienceBoost)
				player:ChangeNumInnovations(teamTechs, techID, 1)
				if player:IsHuman() then 
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_INNOVATION");	
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_INNOVATION_COMPLETION_MESSAGE", techDesc))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num} [ICON_RESEARCH][ENDCOLOR]", scienceBoost), true) 
				end
			end
		end
	end
end
if (userSettingPITInnovationsCore and userSettingCIDLoyaltyCore) then
	LuaEvents.JFD_WLTKDBegins.Add(JFD_PIT_Innovations_WLTKDBegins)
end
--=======================================================================================================================
--=======================================================================================================================