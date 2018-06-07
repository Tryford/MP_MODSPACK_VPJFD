--JFD_ExCE_Exploration_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("InstanceManager")
include("JFDLCUtils")
include("JFD_ExCE_ResGenerator.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- local userSettingExCEExplorationCore 				= (Game.GetUserSetting("JFD_EXCE_EXPLORATION_CORE_GREAT_RECON") == 1)
local userSettingExCEExplorationIncaTrait 			= (Game.GetUserSetting("JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA") == 1)
local userSettingExCEExplorationResourcesBonus 		= (Game.GetUserSetting("JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS") == 1)
local userSettingExCEExplorationResourcesLuxury 	= (Game.GetUserSetting("JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY") == 1)
local userSettingExCEExplorationShipwrecks 			= (Game.GetUserSetting("JFD_EXCE_EXPLORATION_TERRAIN_ADDITIONS_SHIPWRECKS") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activeTeamID 	 			 					= Game.GetActiveTeam() 
local activeTeam 	 			 					= Teams[activeTeamID]
local activePlayerID 			 					= Game.GetActivePlayer()
local activePlayer 	 			 					= Players[activePlayerID]
local convertTextKey			 					= Locale.ConvertTextKey
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- EXPLORATION
--------------------------------------------------------------------------------------------------------------------------
--JFD_ExCE_Exploration_CircumnavigatedGlobe
function JFD_ExCE_Exploration_CircumnavigatedGlobe(teamID)
	local notificationDesc = Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MAGELLAN_UNKNOWN")
	if activeTeamID == teamID then
		notificationDesc = Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MAGELLAN")
	else
		if activeTeam:IsHasMet(teamID) then
			local player = Players[Teams[teamID]:GetLeaderID()]
			notificationDesc = Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MAGELLAN_OTHER", player:GetName(), player:GetCivilizationShortDescription())
		end
	end
	JFD_SendWorldEvent(activePlayerID, notificationDesc)
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_CIRCUMNAVIGATION")
end
GameEvents.CircumnavigatedGlobe.Add(JFD_ExCE_Exploration_CircumnavigatedGlobe)
--------------------------------------------------------------------------------------------------------------------------
-- RESOURCES
--------------------------------------------------------------------------------------------------------------------------
--JFD_ExCE_Exploration_LoadScreenClose
local policyExplorationInitID = GameInfoTypes["POLICY_JFD_EXPLORATION"]
function JFD_ExCE_Exploration_LoadScreenClose() 
	if (not Game.AnyoneHasPolicy(policyExplorationInitID)) then
		if userSettingExCEExplorationResourcesBonus then
			OnMapResourceGenerator("RESOURCE_JFD_RICE", 	{"FEATURE_FOREST", "FEATURE_JUNGLE"})
			OnMapResourceGenerator("RESOURCE_JFD_MAIZE", 	{"FEATURE_JUNGLE", "FEATURE_FOREST"})
			OnMapResourceGenerator("RESOURCE_JFD_CEDAR", 	{"FEATURE_JUNGLE", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_GINGER", 	{"FEATURE_FOREST", "FEATURE_JUNGLE", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_RUBBER", 	{"FEATURE_FOREST", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_LOTUS", 	{"TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_OAK",      {"FEATURE_JUNGLE", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_SULFUR",   {"FEATURE_FOREST", "FEATURE_JUNGLE", "TERRAIN_MOUNTAIN"})
		end
		if userSettingExCEExplorationResourcesLuxury then
			OnMapResourceGenerator("RESOURCE_JFD_FEATHERS", {"FEATURE_FOREST", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_OBSIDIAN", {"FEATURE_FOREST", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_OPIUM",    {"FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_SAFFRON",  {"FEATURE_FOREST", "FEATURE_JUNGLE", "TERRAIN_MOUNTAIN"})
			OnMapResourceGenerator("RESOURCE_JFD_VANILLA",  {"FEATURE_FOREST", "TERRAIN_MOUNTAIN"})
		end
		if (not activePlayer:HasPolicy(policyExplorationInitID)) then
			activePlayer:GrantPolicy(policyExplorationInitID, true)
		end
	end
end
if (userSettingExCEExplorationResourcesBonus or userSettingExCEExplorationResourcesLuxury) then
	Events.LoadScreenClose.Add(JFD_ExCE_Exploration_LoadScreenClose)
end

local buildRemoveForestID = GameInfoTypes["BUILD_REMOVE_FOREST"]
local resourceCedarID     = GameInfoTypes["RESOURCE_JFD_CEDAR"]
local resourceOakID       = GameInfoTypes["RESOURCE_JFD_OAK"]
function JFD_ExCE_Exploration_PlayerCanBuild(playerID, unitID, plotX, plotY, buildID) 
	local plot = Map.GetPlot(plotX, plotY)
	if buildID ~= buildRemoveForestID then return true end
	return not (plot:GetResourceType() == resourceCedarID or plot:GetResourceType() == resourceOakID) 
end
if userSettingExCEExplorationResourcesBonus then
	GameEvents.PlayerCanBuild.Add(JFD_ExCE_Exploration_PlayerCanBuild)
end
------------------------------------------------------------------------------------------------------------------------
-- CIVILIZATIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_ExCE_Exploration_PlayerCityFounded
local buildingMintID	 = GameInfoTypes["BUILDING_MINT"]
local improvementMachuID = GameInfoTypes["IMPROVEMENT_JFD_MACHU_PICCHU"]
local traitIncaID		 = GameInfoTypes["TRAIT_GREAT_ANDEAN_ROAD"]
function JFD_ExCE_Exploration_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(traitIncaID)) then return end
	local cityPlot = Map.GetPlot(plotX,plotY)
	if (cityPlot and cityPlot:IsMountain()) then
		cityPlot:SetImprovementType(improvementMachuID)
		cityPlot:GetPlotCity():SetNumFreeBuilding(buildingMintID, 1)
	end
end
if userSettingExCEExplorationIncaTrait then
	GameEvents.PlayerCityFounded.Add(JFD_ExCE_Exploration_PlayerCityFounded)
end


-- include("JFD_ExCEUtilities.lua")

--------------------------------------------------------------------------------------------------------------------------
-- EXPLORATION
--------------------------------------------------------------------------------------------------------------------------


-- JFD_ExCE_Exploration_ReconPromoted
-- local unitPromotionGreatReconID	= GameInfoTypes["PROMOTION_JFD_GREAT_RECON"]
-- function JFD_ExCE_Exploration_ReconPromoted(playerID, unitID, promotionID)
	-- local player = Players[playerID]	
	-- local unit = player:GetUnitByID(unitID)
	-- if (unit and unit:IsHasPromotion(unitPromotionGreatReconID)) then
		-- if unit:GetLevel() == 5 then
			-- local unitGreatRecon = GameInfo.UnitClasses[unit:GetUnitClassType()].JFD_GreatPersonUnitUpgrade
			-- local unitGreatReconID = GameInfoTypes[unitGreatRecon]
			-- if unitGreatReconID then
				-- unit:UpgradeTo(unitGreatReconID, true)
			-- end
		-- end
	-- end
-- end
-- if userSettingExplorationGreatRecon then
	-- GameEvents.UnitPromoted.Add(JFD_ExCE_Exploration_ReconPromoted)
-- end

--JFD_ExCE_Exploration_GreatReconFoundsCity
-- local unitPromotionGreatReconUnitID	= GameInfoTypes["PROMOTION_JFD_GREAT_RECON_UNIT"]
-- function JFD_ExCE_Exploration_GreatReconFoundsCity(playerID, unitID, unitTypeID, plotX, plotY)
	-- local player = Players[playerID]
	-- local unit = player:GetUnitByID(unitID)
	-- if (unit and unit:HasPromotion(unitPromotionGreatReconUnitID)) then
		-- local goldenAgeReward = (unit:GetLevel()*50)
		-- player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
		-- if player:IsHuman() then
			-- local hex = ToHexFromGrid(Vector2(plotX, plotY))
			-- Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", goldenAgeReward), true)
			-- Events.GameplayFX(hex.x, hex.y, -1)
		-- end
	-- end
-- end
-- if userSettingExplorationGreatRecon then
	-- GameEvents.UnitCityFounded.Add(JFD_ExCE_Exploration_GreatReconFoundsCity)
-- end
--=======================================================================================================================
--=======================================================================================================================