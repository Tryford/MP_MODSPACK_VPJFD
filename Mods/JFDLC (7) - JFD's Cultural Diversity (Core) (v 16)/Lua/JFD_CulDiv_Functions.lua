-- JFD_CulDiv_Functions
-- Author: JFD
-- DateCreated: 9/29/2014 11:56:18 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_CulDivUtils.lua")
--=======================================================================================================================
-- ACTIVE MODS
--=======================================================================================================================
local isCPDLLActive = true--(Game.IsModActive("d1b6328c-ff44-4b0d-aad7-c657f83610cd"))
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCulDivArchitecture				= (Game.GetUserSetting("JFD_CULDIV_ARCHITECTURE_CHANGES") == 1)
local userSettingCulDivDialogue					= (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE") == 1)
local userSettingCulDivDialogueNotMechanical	= (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_NOT_MECHANICAL") == 1)
local userSettingCulDivDialogueActionChance		= (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_ACTION_CHANCE") or 0)
local userSettingCulDivDialogueMoveChance		= (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_MOVE_CHANCE") or 0)
local userSettingCulDivDialogueSelectChance		= (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_SELECTION_CHANCE") or 0)
local userSettingCulDivEmbarkationChanges	    = (Game.GetUserSetting("JFD_CULDIV_EMBARKATION_CHANGES") == 1)
local userSettingCulDivStartingBonuses 			= (Game.GetUserSetting("JFD_CULDIV_CORE_STARTING_RESOURCES") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local handicapID	 = Game.GetHandicapType()
local handicapMod 	 = GameInfo.HandicapInfos[handicapID].AdvancedStartPointsMod
local speedID		 = Game.GetGameSpeedType()
local speedMod 		 = GameInfo.GameSpeeds[speedID].GoldPercent
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- STARTING BONUSES
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_InitOnSettle
function JFD_CulDiv_InitOnSettle(playerID, plotX, plotY)
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not player:IsAlive()) then return end
	if (not city) then return end
	if (not city:IsCapital()) then return end
	local cultureID = player:GetCultureType()
	local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
	local eraMod = GameInfo.Eras[player:GetCurrentEra()].StartingGold
	for row in GameInfo.JFD_CultureType_StartingBonuses("CultureType = '" .. cultureType .. "'") do
		if row.FreeBuilding then
			local uniqueBuildingID = 0
			if isCPDLLActive then
				uniqueBuildingID = player:GetSpecificBuildingType(row.FreeBuilding)
			else
				uniqueBuildingID = GameInfoTypes[player:GetUniqueBuildingType(row.FreeBuilding)]
			end
			city:SetNumRealBuilding(uniqueBuildingID, 1)
		end
		
		if row.FreeBuildingAND then
			local uniqueBuildingID = 0
			if isCPDLLActive then
				uniqueBuildingID = player:GetSpecificBuildingType(row.FreeBuildingAND)
			else
				uniqueBuildingID = GameInfoTypes[player:GetUniqueBuildingType(row.FreeBuilding)]
			end
			city:SetNumRealBuilding(uniqueBuildingID, 1)
		end
		
		if row.FreePolicyBranch then
			local freePolicyBranchID = GameInfoTypes[row.FreePolicyBranch]
			if (not player:IsPolicyBranchUnlocked(freePolicyBranchID)) then
				player:SetPolicyBranchUnlocked(freePolicyBranchID, true)
			end
		end
		
		if row.FreePolicy then
			local freePolicyID = GameInfoTypes[row.FreePolicy]
			if (not isCPDLLActive) then
				if (not player:HasPolicy(freePolicyID)) then
					player:SetNumFreePolicies(1)
					player:SetNumFreePolicies(0)
					player:SetHasPolicy(freePolicyID, true)
				end
			else
				player:GrantPolicy(freePolicyID, true)
			end
		end
			
		if row.FreePopulation > 0 then
			city:ChangePopulation(row.FreePopulation, true)
		end
			
		if row.FreeResource then
			Sukritact_PlaceResource(player:GetStartingPlot(), GameInfoTypes[row.FreeResource], row.FreeResourceCount, row.FreeResourceImprovement)
		end
		
		if row.FreeTech then
			local playerTeam = Teams[player:GetTeam()]
			local teamTechs = playerTeam:GetTeamTechs()
			teamTechs:SetHasTech(GameInfoTypes[row.FreeTech], true)
		end
	
		if row.FreeUnit then
			local unitUniqueID = 0
			local unit = GameInfo.Units[row.FreeUnit]
			if isCPDLLActive then
				unitUniqueID = player:GetSpecificUnitType(row.FreeUnit)
			else
				unitUniqueID = GameInfoTypes[player:GetUniqueUnitType(row.FreeUnit)]
			end
			for value = 1, row.FreeUnitCount do
				player:InitUnit(unitUniqueID, plotX, plotY)
			end
		end
		
		if row.FreeUnitMoves > 0 then
			for unit in player:Units() do
				unit:ChangeMoves(row.FreeUnitMoves)
			end
		end
		
		if row.FreeUnitPromotion then
			for unit in player:Units() do
				unit:SetHasPromotion(GameInfoTypes[row.FreeUnitPromotion], true)
			end
		end
		
		if row.FreeUnitXP > 0 then
			for unit in player:Units() do
				unit:ChangeExperience(row.FreeUnitXP)
			end
		end

		if row.NearbyLandsVisible > 0 then
			player:DoShowNearbyLandsVisible(row.NearbyLandsVisible)
		end
	
		if row.FreeWLTKDTurns > 0 then
			city:ChangeWeLoveTheKingDayCounter(row.row.FreeWLTKDTurns)
		end

		if row.FreeCulture > 0 then
			local culture = Game.GetRound((row.FreeCulture+eraMod)*(handicapMod/100)*(speedMod/100)) 
			player:ChangeJONSCulture(culture)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_CULTURE_STORED]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", culture), true)
			end
		end
		
		if row.FreeFaith > 0 then
			local faith = Game.GetRound((row.FreeFaith+eraMod)*(handicapMod/100)*(speedMod/100)) 
			player:ChangeFaith(faith)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_PEACE]", faith), true)
			end
		end
		
		if row.FreeGold > 0 then
			local gold = Game.GetRound((row.FreeGold+eraMod)*(handicapMod/100)*(speedMod/100)) 
			player:ChangeGold(gold)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR] [ICON_GOLD]", gold), true)
			end
		end
	
		if row.NearbyLandsClaim then
			player:DoClaimNearbyLandsVisible(city)
		end
	end 
end
if userSettingCulDivStartingBonuses then
	--GameEvents.PlayerCityFounded.Add(JFD_CulDiv_InitOnSettle)
end
-------------------------------------------------------------------------------------------------------------------------
-- ART DEFINES
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_SerialEventCityCreated (adapted from guyde)
function JFD_CulDiv_SerialEventCityCreated(vHexPos, playerID, cityID, artStyleID, eraType, continent, population, size, fogState) 
	local plot = Map.GetPlot(ToGridFromHex(vHexPos.x, vHexPos.y))
	local city = plot:GetPlotCity()
	local cityOriginalOwnerID = city:GetOriginalOwner()
	if playerID == cityOriginalOwnerID then return end
	local cityOriginalOwner = Players[cityOriginalOwnerID]
	local cityArtID = cityOriginalOwner:GetArtStyleType()
	if cityOriginalOwner:IsMinorCiv() then return end
	if cityArtID == artStyleID then return end
	if cityArtID ~= artStyleID then
		Events.SerialEventCityCreated(vHexPos, playerID, cityID, cityArtID, eraType, continent, population, size, fogState )
	end
end
if userSettingCulDivArchitecture then
	--Events.SerialEventCityCreated.Add(JFD_CulDiv_SerialEventCityCreated)
end

--JFD_CulDiv_LoadScreenClose
local eraMedievalID	  = GameInfoTypes["ERA_MEDIEVAL"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
function JFD_CulDiv_LoadScreenClose()
	for playerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local player = Players[playerID]
		if player:IsAlive() then
			local cultureID = player:GetCultureType()
			local culture = GameInfo.JFD_CultureTypes[cultureID]
			if player:GetCurrentEra() >= eraIndustrialID then
				player:SetEmbarkedGraphicOverride("ART_DEF_UNIT_TRANSPORT")	
			elseif player:GetCurrentEra() >= eraMedievalID then
				player:SetEmbarkedGraphicOverride(culture.EmbarkationArtDefineMid)
			else
				player:SetEmbarkedGraphicOverride(culture.EmbarkationArtDefineEarly)
			end
		end
	end
end
if userSettingCulDivEmbarkationChanges then
	--Events.LoadScreenClose.Add(JFD_CulDiv_LoadScreenClose)
end

--JFD_CulDiv_TeamSetEra
function JFD_CulDiv_TeamSetEra(teamID, eraID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if player:IsAlive() then
		local cultureID = player:GetCultureType()
		local culture = GameInfo.JFD_CultureTypes[cultureID]
		if player:GetCurrentEra() >= eraIndustrialID then
			player:SetEmbarkedGraphicOverride("ART_DEF_UNIT_TRANSPORT")	
		elseif player:GetCurrentEra() >= eraMedievalID then
			player:SetEmbarkedGraphicOverride(culture.EmbarkationArtDefineMid)
		else
			player:SetEmbarkedGraphicOverride(culture.EmbarkationArtDefineEarly)
		end
	end
end
if userSettingCulDivEmbarkationChanges then
	GameEvents.TeamSetEra.Add(JFD_CulDiv_TeamSetEra)
end
-------------------------------------------------------------------------------------------------------------------------
-- UNITS
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitActionChanged
function JFD_CulDiv_UnitActionChanged(playerID, unitID)
	local city = UI.GetHeadSelectedCity()
	if city then return end
	if playerID == activePlayerID then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		if (not unit) or unit:IsDead() then return end
		local unitTypeID = unit:GetUnitType()
		local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
		if (userSettingCulDivDialogueNotMechanical and unitMechanized) then return end
		local chanceToPlay = Game.GetRandom(1,100)
		if chanceToPlay <= userSettingCulDivDialogueActionChance then
			local randomSoundIndex = Game.GetRandom(0,9)
			if randomSoundIndex == 10 then randomSoundIndex = 9 end
			local soundFile = player:GetUnitDialogueFile(unit)
			if (not soundFile) then return end
			soundFile = soundFile .. "_ORDER_00" .. randomSoundIndex
			Events.AudioPlay2DSound(soundFile)
		end
	end
end
if userSettingCulDivDialogue then
	Events.UnitActionChanged.Add(JFD_CulDiv_UnitActionChanged)
end

--JFD_CulDiv_UnitSetXY
function JFD_CulDiv_UnitSetXY(playerID, unitID)
	local city = UI.GetHeadSelectedCity()
	if city then return end
	if playerID == activePlayerID then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		if (not unit) or unit:IsDead() then return end
		local unitTypeID = unit:GetUnitType()
		local unitMoves = GameInfo.Units[unitTypeID].Moves
		if unitMoves < unit:GetMoves() then return end
		local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
		if (userSettingCulDivDialogueNotMechanical and unitMechanized) then return end
		local chanceToPlay = Game.GetRandom(1,100)
		if chanceToPlay <= userSettingCulDivDialogueMoveChance then
			local randomSoundIndex = Game.GetRandom(0,9)
			if randomSoundIndex == 10 then randomSoundIndex = 9 end
			local soundFile = player:GetUnitDialogueFile(unit)
			if (not soundFile) then return end
			soundFile = soundFile .. "_ORDER_00" .. randomSoundIndex
			Events.AudioPlay2DSound(soundFile)
		end
	end
end
if userSettingCulDivDialogue then
	GameEvents.UnitSetXY.Add(JFD_CulDiv_UnitSetXY)
end

--JFD_CulDiv_UnitSelectionChanged
function JFD_CulDiv_UnitSelectionChanged(playerID, unitID, i, j, k, isSelected)
	local city = UI.GetHeadSelectedCity()
	if city then return end
	if (not isSelected) then return end
	if playerID ~= activePlayerID then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) or unit:IsDead() then return end
	local unitTypeID = unit:GetUnitType()
	local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
	if (userSettingCulDivDialogueNotMechanical and unitMechanized) then return end
	local chanceToPlay = Game.GetRandom(1,100)
	if chanceToPlay <= userSettingCulDivDialogueSelectChance then
		local randomSoundIndex = Game.GetRandom(0,9)
		if randomSoundIndex == 10 then randomSoundIndex = 9 end
		local soundFile = player:GetUnitDialogueFile(unit)
		if (not soundFile) then return end
		soundFile = soundFile .. "_SELECT_00" .. randomSoundIndex
		Events.AudioPlay2DSound(soundFile)
	end
end
if userSettingCulDivDialogue then
	Events.UnitSelectionChanged.Add(JFD_CulDiv_UnitSelectionChanged)
end
--=======================================================================================================================
-- UI FUNCTIONS
--=======================================================================================================================
-- DAWN OF MAN
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UpdateDawnOfMan()
function JFD_CulDiv_UpdateDawnOfMan()
	local gameYear = Game.GetGameTurnYear()
	local era = "A.D."
	if Game.GetGameTurnYear() < 0 then 
		gameYear = (Game.GetGameTurnYear()*-1)
		era = "B.C."
	end
	local cultureID = activePlayer:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local culDesc = Locale.ConvertTextKey(culture.ShortDescription)
	local subCulture = nil
	local subCultureDesc = nil
	for row in GameInfo.JFD_CultureType_SubCultures("CultureType = '" .. culture.Type .."'") do
		subCulture = row.SubCultureType
		subCultureDesc = row.ShortDescription
	end
	local eraMod = GameInfo.Eras[activePlayer:GetCurrentEra()].StartingGold
	local description = ""
	local numFreeYield = 0
	for row in GameInfo.JFD_CultureType_StartingBonuses("CultureType = '" .. culture.Type .. "'") do
		--if 		row.FreeCulture > 0 then numFreeYield = row.FreeCulture
		--elseif 	row.FreeFaith 	> 0 then numFreeYield = row.FreeFaith
		--elseif 	row.FreeGold 	> 0 then numFreeYield = row.FreeGold
		--end
		--numFreeYield = Game.GetRound((numFreeYield + eraMod) * (handicapMod / 100) * (speedMod / 100)) 
		local resource = GameInfo.Resources[row.FreeResource]
		description = Locale.ConvertTextKey("TXT_KEY_JFD_DAWN_STARTING_RESOURCE", row.FreeResourceCount, resource.IconString .. " " .. Locale.ConvertTextKey(resource.Description))
		break
	end
	IconHookup(culture.PortraitIndex, 64, culture.IconAtlas, Controls.CivIcon)
	if subCultureDesc then
		culDesc = culDesc .. " - " .. Locale.ConvertTextKey(subCultureDesc)
	end
	Controls.CultureTitle:SetText(culDesc)
	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_DAWN_OF_MAN_MESSAGE", gameYear, era, activePlayer:GetCivilizationAdjective(), activePlayer:GetName())
	Controls.Summary2:LocalizeAndSetText(description)
	Controls.ButtonStack:CalculateSize()
	Controls.MainUI:DoAutoSize()
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_DAWN_OF_MAN")
end

--JFD_CulDiv_CloseButton
function JFD_CulDiv_CloseButton()
	ContextPtr:SetHide(true)
end
if userSettingCulDivStartingBonuses then
	--Controls.CloseButton:RegisterCallback(Mouse.eLClick, JFD_CulDiv_CloseButton)
end

--JFD_CulDiv_LoadScreenCloseUI
function JFD_CulDiv_LoadScreenCloseUI()
	if activePlayer:GetCapitalCity() then return end
	ContextPtr:SetHide(false)
end
if userSettingCulDivStartingBonuses then
	--Events.LoadScreenClose.Add(JFD_CulDiv_LoadScreenCloseUI)
end
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      JFD_CulDiv_CloseButton()
      return true
    end
  end
end
if userSettingCulDivStartingBonuses then
	--ContextPtr:SetInputHandler(InputHandler)
end
--------------------------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		JFD_CulDiv_UpdateDawnOfMan()
	end
end
if userSettingCulDivStartingBonuses then
	--ContextPtr:SetShowHideHandler(ShowHideHandler)
end
ContextPtr:SetHide(true)
--==========================================================================================================================
--==========================================================================================================================