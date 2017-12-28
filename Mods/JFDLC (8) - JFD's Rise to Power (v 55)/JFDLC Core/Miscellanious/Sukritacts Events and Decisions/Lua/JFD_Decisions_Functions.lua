-- JFD_Decisions_Functions
-- Author: JFD
-- DateCreated: 12/16/2017 4:34:25 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("InstanceManager")
include("JFD_Decisions_Utils.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
local g_ChoiceManager = InstanceManager:new("ChoiceInstance", "ChoiceButton", Controls.ChoiceStack)

local g_SystemChosen		   = nil
local g_CurrencySystemChosenID = nil
local g_NationalAnthemChosenID = nil
local g_WritingSystemChosenID  = nil

local playerID 	 = Game.GetActivePlayer()
local player   	 = Players[playerID]
local playerTeam = Teams[player:GetTeam()]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_Decisions_UnitCreated
function JFD_Decisions_UnitCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local unit = player:GetUnitByID(unitID) 
	local unitClass = GameInfo.UnitClasses[unit:GetUnitClassType()]
	local missionID = nil
	for row in GameInfo.Unit_Missions("UnitType = '" .. GameInfo.Units[unitTypeID].Type .. "'") do
		missionID = GameInfoTypes[row.MissionType]
	end
	for row in GameInfo.UnitClass_Missions("UnitClassType = '" .. unitClass.Type .. "'") do
		missionID = GameInfoTypes[row.MissionType]
	end
	if (not missionID) then return end
	local mission = GameInfo.Missions[missionID]
	if mission.ResourceType then
		if player:GetNumResourceAvailable(GameInfoTypes[mission.ResourceType], false) < 4 then
			LuaEvents.JFD_GreatPersonExpendedForResource(playerID, unit, mission)
		end
	end
end
GameEvents.UnitCreated.Add(JFD_Decisions_UnitCreated)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_Decisions_GreatPersonExpendedForResource
function JFD_Decisions_GreatPersonExpendedForResource(playerID, unit, mission)
	local player = Players[playerID]
	local resource = GameInfo.Resources[mission.ResourceType]
	local resourceType
	if resource~=nil then
	resourceType= resource.Type
	end
	local numResource = mission.ResourceCount
	--Beliefs
	for row in GameInfo.Belief_JFD_DecisionMods("ExpendedResourceChange <> 0 AND ExpendedResourceType = '" .. resourceType .. "'") do
		if player:HasBelief(GameInfoTypes[row.BuildingType]) then
			numResource = numResource + row.ExpendedResourceChange
		end
	end
	--Buildings
	for row in GameInfo.Building_JFD_DecisionMods("ExpendedResourceChange <> 0 AND ExpendedResourceType = '" .. resourceType .. "'") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numResource = numResource + row.ExpendedResourceChange
		end
	end
	--Policies
	local numCausesFromPolicies = 0
	for row in GameInfo.Policy_JFD_DecisionMods("ExpendedResourceChange <> 0 AND ExpendedResourceType = '" .. resourceType .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numResource = numResource + row.ExpendedResourceChange
		end
	end
	--Reforms
	local numCausesFromReforms = 0
	for row in GameInfo.JFD_Reform_DecisionMods("ExpendedResourceChange <> 0 AND ExpendedResourceType = '" .. resourceType .. "'") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numResource = numResource + row.ExpendedResourceChange
		end
	end
	--Traits
	local numCausesFromTraits = 0
	for row in GameInfo.Trait_JFD_DecisionMods("ExpendedResourceChange <> 0 AND ExpendedResourceType = '" .. resourceType .. "'") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numResource = numResource + row.ExpendedResourceChange
		end
	end
	player:ChangeNumResourceTotal(GameInfoTypes[resourceType], numResource)
	if player:IsHuman() then
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] {2_Icon}", numResource, resource.IconString), true)
	end
	unit:greatperson()
end
LuaEvents.JFD_GreatPersonExpendedForResource.Add(JFD_Decisions_GreatPersonExpendedForResource)
-------------------
-- MISSION
-------------------
--JFD_Decisions_CustomMissionStart
function JFD_Decisions_CustomMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local mission = GameInfo.Missions[missionID]
	if mission.ResourceType then
		LuaEvents.JFD_GreatPersonExpendedForResource(playerID, unit, mission)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_Decisions_CustomMissionStart)

--JFD_Decisions_CustomMissionCompleted
function JFD_Decisions_CustomMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
	local mission = GameInfo.Missions[missionID]
	if mission.ResourceType then return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_Decisions_CustomMissionCompleted)
--=======================================================================================================================
-- UI FUNCTIONS
--=======================================================================================================================
-- Choose Writing System
-------------------------------------------------------------------------------
-- JFD_ShowConfirmSystemChoice
function JFD_ShowConfirmSystemChoice(system)
	if system == "Writing" then
		local writingSystem = GameInfo.JFD_WritingSystems[g_WritingSystemChosenID]
		Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONFIRM_JFD_WRITING_SYSTEM", writingSystem.Description)
	end
	Controls.Confirm:SetHide(false)
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, JFD_ShowConfirmSystemChoice)

-- JFD_ConfirmYes
function JFD_ConfirmYes()
	if g_SystemChosen == "Writing" then
		player:SetWritingSystemID(g_WritingSystemChosenID)
	end
	Controls.Confirm:SetHide(true)
	Controls.BGBlock:SetHide(true)
	Controls.ChoicePopup:SetHide(true)
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, JFD_ConfirmYes)

-- JFD_ConfirmNo
function JFD_ConfirmNo()
	Controls.Confirm:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, JFD_ConfirmNo)

-- JFD_OnSystemSelected
function JFD_OnSystemSelected(writingSystemID)
	if g_SystemChosen == "Writing" then
		g_WritingSystemChosenID = writingSystemID
		local writingSystem = GameInfo.JFD_WritingSystems[g_WritingSystemChosenID]
		Controls.SelectButton:LocalizeAndSetToolTip(Locale.ConvertTextKey("TXT_KEY_JFD_ADOPT_WRITING_SYSTEM_BUTTON_TT", writingSystem.IconString, writingSystem.Description))
		JFD_ED_ShowChooseSystemPopup(g_SystemChosen)
	end
	Controls.SelectButton:SetDisabled(false)
end

--JFD_ED_ShowChooseSystemPopup
local menuTitle = {}
	menuTitle["Anthem"]   = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_NATIONAL_ANTHEM_MENU")
	menuTitle["Currency"] = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_CURRENCY_SYSTEM_MENU")
	menuTitle["Writing"]  = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_WRITING_SYSTEM_MENU")
function JFD_ED_ShowChooseSystemPopup(system)
	g_SystemChosen = system
	Controls.BGBlock:SetHide(false)
	Controls.ChoicePopup:SetHide(false)
	Controls.MainTitle:SetText(menuTitle[system])

	g_ChoiceManager:ResetInstances()
	
	if system == "Writing" then
		for writingSystem in GameInfo.JFD_WritingSystems("IsUnique = 0") do
			local instance = g_ChoiceManager:GetInstance()
			instance.ChoiceDesc:LocalizeAndSetText(writingSystem.Description)
			instance.ChoiceHelp:LocalizeAndSetText(writingSystem.Help)
			--add whose adopted it also i guess
			instance.ChoiceButton:SetVoid1(writingSystem.ID)
			instance.ChoiceButton:RegisterCallback(Mouse.eLClick, JFD_OnSystemSelected)
			-- IconHookup(writingSystem.PortraitIndex, 64, writingSystem.IconAtlas, instance.ChoiceIcon)
			instance.ChoiceIcon:SetHide(false)
			if writingSystem.ID == g_WritingSystemChosenID then
				instance.SelectedHL:SetHide(false)
			else
				instance.SelectedHL:SetHide(true)
			end
		end
		Controls.ChoiceStack:CalculateSize()
		Controls.ChoiceStack:ReprocessAnchoring()
		Controls.ChoiceScrollPanel:CalculateInternalSize()
		Controls.SelecthButton:SetDisabled(not g_WritingSystemChosenID)
	end
end
LuaEvents.JFD_ED_ShowChooseSystemPopup.Add(JFD_ED_ShowChooseSystemPopup);