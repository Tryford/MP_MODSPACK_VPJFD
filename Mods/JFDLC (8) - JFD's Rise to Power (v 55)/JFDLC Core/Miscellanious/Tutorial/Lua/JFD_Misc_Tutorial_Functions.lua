-- JFD_Misc_Tutorial_Functions
-- Author: JFD
-- DateCreated: 12/19/2017 3:50:21 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
local numAdviceLevels = 4
for row in GameInfo.CustomTutorialLevels() do
	numAdviceLevels = numAdviceLevels + 1
end
local g_AdviceLevelID = OptionsManager.GetTutorialLevel_Cached()
--=======================================================================================================================
-- TUTORIAL FUNCTIONS
--=======================================================================================================================
--JFD_Tutorial_PushTutorialPopup
function JFD_Tutorial_PushTutorialPopup(playerID, tutorialQuery, city, unit, plotX, plotY)
	print("g_AdviceLevelID", g_AdviceLevelID, numAdviceLevels)
	if (g_AdviceLevelID >= numAdviceLevels or g_AdviceLevelID == -1) then return end
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	for row in GameInfo.CustomTutorial_Triggers(tutorialQuery .. " = '1'") do
		local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
		if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
			LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, city, unit, plotX, plotY)
		end
	end
end
LuaEvents.JFD_Tutorial_PushTutorialPopup.Add(JFD_Tutorial_PushTutorialPopup)

--JFD_Tutorial_CityConstructed
function JFD_Tutorial_CityConstructed(playerID, cityID, buildingID)	
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local city = player:GetCityByID(cityID)
	for row in GameInfo.CustomTutorial_Triggers("IsOnBuildingConstructed = '1'") do
		local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
		if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
			LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, city, nil, city:GetX(), city:GetY())
		end
	end
end
GameEvents.CityConstructed.Add(JFD_Tutorial_CityConstructed)

--JFD_Tutorial_CityTrained
function JFD_Tutorial_CityTrained(playerID, cityID, unitID)	
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	for row in GameInfo.CustomTutorial_Triggers("IsOnUnitClassTrained = '" .. GameInfo.UnitClasses[unit:GetUnitClassType()].Type .. "'") do
		local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
		if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
			LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, nil, unit, unit:GetX(), unit:GetY())
		end
	end
end
GameEvents.CityTrained.Add(JFD_Tutorial_CityTrained)

--JFD_Tutorial_InnovationTriggered
function JFD_Tutorial_InnovationTriggered(playerID)	
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	for row in GameInfo.CustomTutorial_Triggers("IsOnInnovation = 1") do
		local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
		if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
			LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID)
		end
	end
end
LuaEvents.JFD_InnovationTriggered.Add(JFD_Tutorial_InnovationTriggered)

--JFD_Tutorial_PlayerDoTurn
local buildingMonumentID = GameInfoTypes["BUILDING_MONUMENT"]
function JFD_Tutorial_PlayerDoTurn(playerID)	
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if player:GetGold() >= capital:GetBuildingPurchaseCost(buildingMonumentID) then
		for row in GameInfo.CustomTutorial_Triggers("IsOnCanInvest = '1'") do
			local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
			if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
				LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, capital, nil, capital:GetX(), capital:GetY())
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Tutorial_PlayerDoTurn)

--JFD_Tutorial_PlayerCityFounded
function JFD_Tutorial_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if city:IsCapital() then
		for row in GameInfo.CustomTutorial_Triggers("IsOnCapitalFounded = '1'") do
			local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
			if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
				LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, city, nil, plotX, plotY)
			end
		end
	else
		for row in GameInfo.CustomTutorial_Triggers("IsOnCityOtherFounded = '1'") do
			local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
			if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
				LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, city, nil, plotX, plotY)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(JFD_Tutorial_PlayerCityFounded)

--JFD_Tutorial_UnitCreated
function JFD_Tutorial_UnitCreated(playerID, unitID)	
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if unit:IsGreatPerson() then
		if player:HasGovernment() then
			for row in GameInfo.CustomTutorial_Triggers("IsOnGreatPersonCreated = '1'") do
				local tutorialType = GameInfo.CustomTutorials[row.TutorialType]
				if (not Game.HasAdvisorMessageBeenSeen(tutorialType.ID)) then
					LuaEvents.JFD_AdvisorDisplayShow(tutorialType, playerID, nil, unit, unit:GetX(), unit:GetY())
				end
			end
		end
	end
end
GameEvents.UnitCreated.Add(JFD_Tutorial_UnitCreated)
--=======================================================================================================================
--=======================================================================================================================
