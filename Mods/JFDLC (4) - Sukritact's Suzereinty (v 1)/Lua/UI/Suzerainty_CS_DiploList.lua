--=======================================================================================================================
-- DiploList
--=======================================================================================================================
-- Includes
----------------------------------------------------------------
include("IconSupport")
include("InstanceManager")
include( "CityStateStatusHelper" ); local UpdateCityStateStatusUI = UpdateCityStateStatusUI; local GetCityStateStatusText = GetCityStateStatusText; local GetCityStateStatusToolTip = GetCityStateStatusToolTip; local GetAllyText = GetAllyText; local GetAllyToolTip = GetAllyToolTip; local GetActiveQuestText = GetActiveQuestText; local GetActiveQuestToolTip = GetActiveQuestToolTip; local GetCityStateTraitText = GetCityStateTraitText; local GetCityStateTraitToolTip = GetCityStateTraitToolTip
----------------------------------------------------------------
-- Globals
----------------------------------------------------------------
local pMinorManager = InstanceManager:new( "CityStateInstance", "MinorButton", Controls.MinorStack )

local tMinorButton
local tMinorStackOld
local tDiploListContext
local tOuterStack
local tOuterGrid
local tScrollPanel

local TOP_COMPENSATION
local PANEL_OFFSET
local BOTTOM_COMPENSATION
local screenY
local MAX_SIZE

local L = Locale.ConvertTextKey
-------------------------------------------------
-- Utility Functions
-------------------------------------------------
function GetCityStateIcon(pMinor)
	local sAtlas = "SUZERAINITY_DEFAULTMINOR_ATLAS"
	local iIndex = 1

	local tTrait = pMinor:GetSuzerainTraitTable()
	if tTrait and tTrait.IconAtlas and tTrait.PortraitIndex then
		return tTrait.IconAtlas, tTrait.PortraitIndex
	end
	-----------------
	-- Fallback if no icon found
	-----------------
	local iType = pMinor:GetMinorCivTrait()
	local tIcons = {
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_CULTURED]		= 0,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MARITIME]		= 1,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MERCANTILE]		= 2,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC]	= 3,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS]		= 4,
	}
	iIndex = tIcons[iType] or iIndex

	return sAtlas, iIndex
end

-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	if not GameInfo.JFD_GlobalUserSettings then return end
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bStateReligion = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
--=======================================================================================================================

-- Update Display
-- Generate the List of CSs

--=======================================================================================================================
function UpdateDisplay(bOverride)
	if (IsGameCoreBusy()) then return end
	if tDiploListContext:IsHidden() and not(bOverride) then return end
	--print("Refreshing DiploList")

	local iActivePlayer = Game.GetActivePlayer()
	local pActivePlayer = Players[iActivePlayer]
	local iActiveTeam = Game.GetActiveTeam()
	local pActiveTeam = Teams[iActiveTeam]
	
	pMinorManager:ResetInstances()
	for iMinor = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		
		local pMinor = Players[iMinor]
		local iMinorTeam = pMinor:GetTeam()
		local pMinorTeam = Teams[iMinorTeam]

		if (pMinor:IsMinorCiv() and pMinor:IsAlive() and pActiveTeam:IsHasMet(iMinorTeam)) then

			local tInstance = pMinorManager:GetInstance()

			--------------------------------------------------------
			-- Gather Info
			--------------------------------------------------------
			local sName = L(pMinor:GetCivilizationShortDescriptionKey())
			local tAllyTrait = pMinor:GetSuzerainTraitTable()
			local sAllyBonus = ""; if tAllyTrait then sAllyBonus = L(tAllyTrait.Description) end
			local iInfluence = pMinor:GetMinorCivFriendshipWithMajor(iActivePlayer)
			local bIsAlly = pMinor:IsAllies(iActivePlayer)
			local bIsFriends = pMinor:IsFriends(iActivePlayer)
			local bIsWar = pMinorTeam:IsAtWar(iActiveTeam)
			local bIsGuardian = pActivePlayer:IsProtectingMinor(iMinor)
			local bAngry = iMinor < 1

			local sIconAtlas, iIconIndex = GetCityStateIcon(pMinor)
			local vPrimaryColor, vSecondaryColor = pMinor:GetPlayerColors()

			--------------------------------------------------------
			-- Update Meter
			--------------------------------------------------------
			UpdateCityStateStatusUI(iActivePlayer, iMinor, tInstance.PositiveStatusMeter, tInstance.NegativeStatusMeter, tInstance.StatusMeterMarker, tInstance.CivIconBG);
			local strStatusTT = GetCityStateStatusToolTip(iActivePlayer, iMinor, true)

			tInstance.PositiveStatusMeter:SetToolTipString(strStatusTT)
			tInstance.NegativeStatusMeter:SetToolTipString(strStatusTT)			
			--------------------------------------------------------
			-- Set Icons and Name
			--------------------------------------------------------
			tInstance.MinorName:SetText(sName)
			tInstance.MinorName:SetColor(vSecondaryColor, 0)
			IconHookup(iIconIndex, 48, sIconAtlas, tInstance.MinorIcon)
			tInstance.MinorIcon:SetColor(vSecondaryColor)

			local strAllyBonusTT = L("TXT_KEY_SUZERAINITY_ALLY_TT") .. "[NEWLINE]--------------[NEWLINE]" .. sAllyBonus
			tInstance.MinorName:SetToolTipString(strAllyBonusTT)
			tInstance.MinorIcon:SetToolTipString(strAllyBonusTT)
			--------------------------------------------------------
			-- Relationship Status
			--------------------------------------------------------
			local sRelation 	= ""
			local sRelationTT	= ""
			if bIsAlly then sRelation = sRelation .. "[ICON_CAPITAL]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_ALLIED", sName) end
			if bIsFriends and not(bIsAlly) then sRelation = sRelation .. "[ICON_HAPPINESS_1]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_FRIENDS", sName) end
			if bIsGuardian then sRelation = sRelation .. "[ICON_STRENGTH]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_PLEDGE", sName) end
			if bIsWar then sRelation = sRelation .. "[ICON_WAR]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_WAR", sName) end
			if bStateReligion and pMinor:HasStateReligion() then
				local iReligon = pMinor:GetStateReligion()
				local tReligion = GameInfo.Religions[iReligon]
				sStateReligion = tReligion.IconString .. " " .. L(Game.GetReligionName(iReligon))

				sRelation = sRelation .. tReligion.IconString
				sRelationTT = sRelationTT .. "[NEWLINE][ICON_BULLET]" .. L("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_OTHER_TEXT", sName, sStateReligion)
			end

			sRelationTT = string.gsub(sRelationTT, "They ", "You ")
			sRelationTT = string.gsub(sRelationTT, "[NEWLINE]", "", 1)

			-- Ally Icon
			local iAlly = pMinor:GetAlly()
			if Players[iAlly] then
				local pAlly = Players[iAlly]
				local iAllyTeam = pAlly:GetTeam()
				if not(pActiveTeam:IsHasMet(iAllyTeam)) then iAlly = -1 end

				CivIconHookup(iAlly, 32, tInstance.CivSymbol, tInstance.CivIconBG, tInstance.CivIconShadow, false, true)
				local strAllyTT = GetAllyToolTip(iActivePlayer, iMinor)
				if iAlly == iActivePlayer then
					strAllyTT = strAllyTT .. "[NEWLINE]--------------[NEWLINE]" .. sAllyBonus
				end

				tInstance.CivIconBG:SetToolTipString(strAllyTT)	
				tInstance.CivIconBG:SetHide(false)
			else
				tInstance.CivIconBG:SetHide(true)
			end			

			tInstance.MinorStatus:SetText(sRelation)
			tInstance.MinorStatus:SetToolTipString(sRelationTT)
			--------------------------------------------------------
			-- Quests
			--------------------------------------------------------
			-- Active Quests
			local sQuestTT = GetActiveQuestToolTip(iActivePlayer, iMinor)

			tInstance.MinorQuests:SetText(GetActiveQuestText(iActivePlayer, iMinor))
			tInstance.MinorQuests:SetToolTipString(sQuestTT)		
			--------------------------------------------------------
			-- Button Functionality
			--------------------------------------------------------
			tInstance.MinorButton:SetVoid1(iMinor);
			tInstance.MinorButton:SetVoid2(pMinor:GetCapitalCity())
			tInstance.MinorButton:RegisterCallback(Mouse.eLClick, MinorSelected)
		end
	end

	RecalcPanelSize()
end
Events.SerialEventScoreDirty.Add(UpdateDisplay)
Events.SerialEventCityInfoDirty.Add(UpdateDisplay)
Events.SerialEventGameDataDirty.Add(UpdateDisplay)
Events.MultiplayerGamePlayerDisconnected.Add(UpdateDisplay)
--=======================================================================================================================
-- Minor Button: Show Hide Stack
--=======================================================================================================================
function OnMinorsButton()
	if(Controls.MinorStack:IsHidden()) then
		tMinorButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "{TXT_KEY_PEDIA_CATEGORY_11_LABEL:upper}" ) );
		Controls.MinorStack:SetHide(false)
		UpdateDisplay()
	else
		tMinorButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "{TXT_KEY_PEDIA_CATEGORY_11_LABEL:upper}" ) );
		Controls.MinorStack:SetHide(true)
	end

	RecalcPanelSize()
end
--=======================================================================================================================
-- MinorSelected
--=======================================================================================================================
function MinorSelected( PlayerID )
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO, Data1 = PlayerID; } );
end
--=======================================================================================================================
-- RecalcPanelSize
--=======================================================================================================================
function RecalcPanelSize()
	tOuterStack:CalculateSize();
	local size = math.min( MAX_SIZE, tOuterStack:GetSizeY() + 290 );
    tOuterGrid:SetSizeY( size );
    tScrollPanel:SetSizeY( size - PANEL_OFFSET );
	tScrollPanel:CalculateInternalSize();
	tScrollPanel:ReprocessAnchoring();
end
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
Events.LoadScreenClose.Add(function()
	tDiploButton = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploButton")
	tDiploListContext = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList")
	tMinorButton = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList/MinorButton")
	tMinorStackOld = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList/MinorStack")
	tOuterStack = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList/OuterStack")
	tOuterGrid = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList/OuterGrid")
	tScrollPanel = ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/DiploList/ScrollPanel")

	TOP_COMPENSATION = tOuterGrid:GetOffsetY()
	PANEL_OFFSET = tScrollPanel:GetOffsetY() + 48
	BOTTOM_COMPENSATION = 226
	_, screenY = UIManager:GetScreenSizeVal()
	MAX_SIZE = screenY - (TOP_COMPENSATION + BOTTOM_COMPENSATION)

	tMinorButton:RegisterCallback(Mouse.eLClick,
		function()
			OnMinorsButton()
		end
	)
	tDiploButton:RegisterCallback(Mouse.eLClick,
		function()
			tDiploListContext:SetHide(not(tDiploListContext:IsHidden()))
			UpdateDisplay()
		end
	)

	-- Replace the Old Minor Stack
	Controls.MinorStack:ChangeParent(tOuterStack)
	tMinorStackOld:SetHide(true)
	Controls.MinorStack:SetHide(true)

	UpdateDisplay(true)
end)
--=======================================================================================================================
--=======================================================================================================================