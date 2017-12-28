-- Suzerainity's City-State Overview
----------------------------------------------------------------------------
-- Global Variables
-------------------------------------------------

gk_mode = Game.GetReligionName ~= nil
bnw_mode = Game.GetActiveLeague ~= nil

-------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );
include( "CityStateStatusHelper" ); local UpdateCityStateStatusUI = UpdateCityStateStatusUI; local GetCityStateStatusText = GetCityStateStatusText; local GetCityStateStatusToolTip = GetCityStateStatusToolTip; local GetAllyText = GetAllyText; local GetAllyToolTip = GetAllyToolTip; local GetActiveQuestText = GetActiveQuestText; local GetActiveQuestToolTip = GetActiveQuestToolTip; local GetCityStateTraitText = GetCityStateTraitText; local GetCityStateTraitToolTip = GetCityStateTraitToolTip

include( "Suzerainty_CityState_Utils.lua" ); -- Interestingly, this only need to be included once, the Player functions are now available in all contexts!
include( "CityStateDialogueHelper" );

-- City State Interaction Buttons
include( "CityStateInteractions" );
print('Suzerainity\'s City-State Overview: Loaded')
for tRow in GameInfo.SuzerainUI_AddinSupport() do
	include(tRow.FileName)
	print(tRow.FileName)
end

local L = Locale.ConvertTextKey

-------------------------------------------------
-- Global Constants
-------------------------------------------------
g_minorCivID = -1
g_minorCivTeamID = -1
m_PopupInfo = nil

-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	if not GameInfo.JFD_GlobalUserSettings then return end
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

local pRelationsManager = InstanceManager:new("RelationInstance", "RelationInstanceContainer", Controls.RelationsStack)
local pInteractionsManager = InstanceManager:new("InteractionInstance", "InteractionButton", Controls.InteractionsStack)

local g_PersonalityInfo = {
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY_TT"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL_TT"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE_TT"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL_TT"),
	},
}

local g_Banners = {
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_CULTURED]		= "CityStateBanner_Cultured.dds",
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC]	= "CityStateBanner_Militaristic.dds",
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MARITIME]		= "CityStateBanner_Fertile.dds",
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MERCANTILE]		= "CityStateBanner_Mercantile.dds",
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS]		= "CityStateBanner_Religious.dds",
}
local g_Chime = {
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_CULTURED]		= 'AS2D_MINOR_CIV_SUK_CULTURED',
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MARITIME]		= 'AS2D_MINOR_CIV_SUK_FERTILE',
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MERCANTILE]		= 'AS2D_MINOR_CIV_SUK_MERCANTILE',
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC]	= 'AS2D_MINOR_CIV_SUK_MILITARISTIC',
	[MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS]		= 'AS2D_MINOR_CIV_SUK_RELIGIOUS',	
}

local bStateReligion = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
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
-------------------------------------------------------------------------------
-- OnPopup
-------------------------------------------------------------------------------
local sort_func = function( a,b ) return a.Influence > b.Influence end

function OnDisplay()

	local iActivePlayer = Game.GetActivePlayer()
	local pActivePlayer = Players[iActivePlayer]
	local iActiveTeam = Game.GetActiveTeam()
	local pActiveTeam = Teams[iActiveTeam]

	local iMinor = g_minorCivID; if iMinor < 0 then return end;
	local pMinor = Players[iMinor]
	local iMinorTeam = g_minorCivTeamID
	local pMinorTeam = Teams[iMinorTeam]

	local iMinorCivType = pMinor:GetMinorCivType()
	local sMinorCivType = pMinor:GetCivilizationShortDescriptionKey()

	local tAllyTrait = pMinor:GetSuzerainTraitTable()

	local bIsAlly = pMinor:IsAllies(iActivePlayer)
	local bIsFriends = pMinor:IsFriends(iActivePlayer)
	local bIsWar = pMinorTeam:IsAtWar(iActiveTeam)
	local bIsGuardian = pActivePlayer:IsProtectingMinor(iMinor)	
	local tInfo 	= {
		Player		= iActivePlayer,
		Team		= iActiveTeam,

		Minor		= iMinor,		
		Type		= iMinorCivType,
		Trait		= tAllyTrait.Type,
		Allied		= bIsAlly,
		Friends		= bIsFriends,
		Guardian	= bIsGuardian,
		War			= bIsWar,
		Influence	= pMinor:GetMinorCivFriendshipWithMajor(iPlayer)
	}
	--------------------------------------------------------
	-- CS Name
	--------------------------------------------------------
	local sTitle = Locale.ToUpper(sMinorCivType)
	Controls.CityStateName:SetText(sTitle)
	--------------------------------------------------------
	-- CS Status
	--------------------------------------------------------	
	UpdateCityStateStatusBar(iActivePlayer, iMinor, Controls.PositiveStatusMeter, Controls.NegativeStatusMeter, Controls.StatusMeterMarker)

	local strStatusText = "(" .. GetCityStateStatusText(iActivePlayer, iMinor) .. ")"
	local strStatusTT = GetCityStateStatusToolTip(iActivePlayer, iMinor, true)

	Controls.CityStateStatus:SetText(strStatusText)
	Controls.CityStateName:SetToolTipString(strStatusTT)
	Controls.CityStateStatus:SetToolTipString(strStatusTT)
	Controls.PositiveStatusMeter:SetToolTipString(strStatusTT)
	Controls.NegativeStatusMeter:SetToolTipString(strStatusTT)
	--------------------------------------------------------
	-- Trait and Personality
		-- State Religion with RtP
	--------------------------------------------------------
	-- Trait
	local sTrait = GetCityStateTraitText(iMinor)
	local sTraitTT = GetCityStateTraitToolTip(iMinor)
	local sBanner = g_Banners[pMinor:GetMinorCivTrait()]
	-- Personality
	local tPersonalityInfo = g_PersonalityInfo[pMinor:GetPersonality()]
	local sPersonality = tPersonalityInfo.title
	local sPersonalityTT = tPersonalityInfo.tooltip

	local sAttr = sTrait .. " | " .. sPersonality
	local sAttrTT = sTraitTT .. "[NEWLINE]--------------[NEWLINE]" .. sPersonalityTT
	-- State Religion
	if bStateReligion then
		local sStateReligion = L("TXT_KEY_JFD_NO_STATE_RELIGION_NONE")
		local sStateReligionTT = ""
		if pMinor:HasStateReligion() then
			local iReligon = pMinor:GetStateReligion()
			local tReligion = GameInfo.Religions[iReligon]
			sStateReligion = tReligion.IconString .. " " .. L(Game.GetReligionName(iReligon))
			sStateReligionTT = L("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_OTHER_TEXT", sMinorCivType, sStateReligion)
		elseif pMinor:HasSecularized() then
			sStateReligion = L("TXT_KEY_JFD_NO_STATE_RELIGION_SECULAR")
			sStateReligionTT = L("TXT_KEY_JFD_SECULARIZATION_NOTIFICATION_OTHER_TEXT", sMinorCivType)
		end
		
		
		if sStateReligionTT ~= "" then sAttrTT = sAttrTT .. "[NEWLINE]--------------[NEWLINE]" .. sStateReligionTT end
		sAttr = sAttr .. " | " .. sStateReligion
	end

	Controls.CityStateAttr:SetText(sAttr)
	Controls.CityStateAttr:SetToolTipString(sAttrTT)
	Controls.CSBanner:SetTexture(sBanner)

	local sDialogue = m_OldDialogue
	if not(m_OldDialogue) or (m_LastAction ~= m_OldLastAction) then
		sDialogue = GetCSDialogue(pMinor, iActivePlayer, bIsWar)
		m_OldDialogue = sDialogue
		m_OldLastAction = m_LastAction
	end
	Controls.DescriptionLabel:SetText(sDialogue)
	--------------------------------------------------------
	-- Icon and BG
	--------------------------------------------------------
	local sIconAtlas, iIconIndex = GetCityStateIcon(pMinor)
	local vPrimaryColor, vSecondaryColor = pMinor:GetPlayerColors()
	IconHookup(iIconIndex, 80, sIconAtlas, Controls.CityStateIcon)
	Controls.CityStateIcon:SetColor(vSecondaryColor)

	-- Set Background Image
	local sBackground = GameInfo.MinorCivTraits[pMinor:GetMinorCivTrait()].BackgroundImage
	Controls.BackgroundImage:SetTexture(sBackground)	
	--------------------------------------------------------
	-- Quests
	--------------------------------------------------------
	-- Active Quests
	local sQuestTT = GetActiveQuestToolTip(iActivePlayer, iMinor)

	Controls.QuestInfo:SetText(GetActiveQuestText(iActivePlayer, iMinor))

	Controls.QuestInfo:SetToolTipString(sQuestTT)
	Controls.QuestLabel:SetToolTipString(sQuestTT)
	--------------------------------------------------------
	-- Ally Bonus
	--------------------------------------------------------
	local sAllyHeader = "TXT_KEY_SUZERAINITY_ALLY_INACTIVE"
	if bIsAlly then sAllyHeader = "TXT_KEY_SUZERAINITY_ALLY_ACTIVE" end
	sAllyHeader = L(sAllyHeader)

	-- Ally Trait
	local sAllyBonus = ""
	if tAllyTrait then sAllyBonus = L(tAllyTrait.Description) end
	if bIsAlly then
		sAllyBonus = "[COLOR_POSITIVE_TEXT]" .. sAllyBonus .. "[ENDCOLOR]"
	end

	-- Resources
	local sResourceTextTT = L("TXT_KEY_SUZERAINITY_ALLY_TT")
	local sResourceText = GetCityStateResourceExports(pMinor)
	if sResourceText then sAllyBonus = sAllyBonus .. "[NEWLINE]--------------[NEWLINE]" .. sResourceText end

	Controls.AllyLabel:SetText(sAllyBonus)
	Controls.AllyHeader:SetText(sAllyHeader)
	Controls.AllyLabel:SetToolTipString(sResourceTextTT)
	Controls.AllyHeader:SetToolTipString(sResourceTextTT)
	--------------------------------------------------------
	-- List Relations
	--------------------------------------------------------
	pRelationsManager:ResetInstances()
	local tRelations = GetCityStateRelations(iMinor, iActivePlayer)
	table.sort(tRelations, sort_func)

	for iNum, tRelation in ipairs(tRelations) do
		pRelationsManager:BuildInstance()
		local tInstance = pRelationsManager:GetInstance()

		CivIconHookup(
			tRelation.HasMet and tRelation.Player
			or -1, 45,
			tInstance.AllyIcon, tInstance.AllyIconBG, tInstance.AllyIconShadow, false, true
		)

		local pPlayer = Players[tRelation.Player]
		local sName = L("TXT_KEY_UNMET_PLAYER")
		if tRelation.HasMet then sName = pPlayer:GetName() end

		local sRelation 	= ""
		local sRelationTT	= L("TXT_KEY_SUZERAINITY_INFLUENCE_TT", sName, tRelation.Influence, sMinorCivType) .. "[NEWLINE]--------------"

		if tRelation.Allied then sRelation = sRelation .. "[ICON_CAPITAL]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_ALLIED", sMinorCivType) end
		if tRelation.Friends and not(tRelation.Allied) then sRelation = sRelation .. "[ICON_HAPPINESS_1]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_FRIENDS", sMinorCivType) end
		if tRelation.Guardian then sRelation = sRelation .. "[ICON_STRENGTH]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_PLEDGE", sMinorCivType) end
		if tRelation.War then sRelation = sRelation .. "[ICON_WAR]"; sRelationTT = sRelationTT .. L("TXT_KEY_SUZERAINITY_WAR", sMinorCivType) end

		tInstance.AllyText:SetText(sRelation)
		tInstance.RelationInstanceContainer:SetToolTipString(sRelationTT)
	end
	Controls.NoRelations:SetHide(#tRelations > 0)

	--------------------------------------------------------
	-- Buttons
	--------------------------------------------------------
	pInteractionsManager:ResetInstances()
	for iKey, tInteraction in ipairs(g_Interactions[g_CurrentMenu]) do
		pInteractionsManager:BuildInstance()
		local tInstance = pInteractionsManager:GetInstance()

		tInteraction.OnShow(tInstance, iMinor, iActivePlayer, tInfo)
		if tInteraction.OnClick then
			tInstance.InteractionButton:RegisterCallback( Mouse.eLClick, function()
				tInteraction.OnClick(tInstance, iMinor, iActivePlayer, tInfo)
			end )
		end

	end

	LuaEvents.Suk_ShowSuzeraintyUI(Controls, tInfo)

	Controls.QuestStack:SetOffsetX((Controls.CS_BG_Stack:GetSizeX() - (Controls.QuestLabel:GetSizeX() + 10 + Controls.QuestInfo:GetSizeX()))/2)
	Controls.InteractionsStack:ReprocessAnchoring()
	Controls.RelationsStack:ReprocessAnchoring()
	Controls.CS_BG_Stack:ReprocessAnchoring()
	Controls.TextStack:ReprocessAnchoring()
	Controls.CityStatePanel:CalculateInternalSize()
end
-------------------------------------------------------------------------------
-- HANDLERS AND HELPERS
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

	if( not bInitState ) then
		if( not bIsHide ) then
			Events.SerialEventGameDataDirty.Add( OnDisplay )
			Events.WarStateChanged.Add( OnDisplay )		-- hack to force refresh in vanilla when selecting peace / war
			OnDisplay()
			UI.incTurnTimerSemaphore()
			Events.SerialEventGameMessagePopupShown( m_PopupInfo )
		else
			Events.SerialEventGameDataDirty.Remove(OnDisplay)
			Events.WarStateChanged.Remove(OnDisplay)
			UI.decTurnTimerSemaphore()
			if m_PopupInfo then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(m_PopupInfo.Type, 0)
			end
		end
	end
end
ContextPtr:SetShowHideHandler( ShowHideHandler )
-------------------------------------------------
-- On Display
-------------------------------------------------
function OnEventReceived( tPopupInfo )

	local bGreeting = tPopupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING
	local bMessage = tPopupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_MESSAGE
	local bDiplo = tPopupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO

	if (not bGreeting and not bMessage  and not bDiplo) then return end

	m_PopupInfo = tPopupInfo
	g_minorCivID = tPopupInfo.Data1
	g_minorCivTeamID = Players[g_minorCivID]:GetTeam()

	tCityStateDiplo		= ContextPtr:LookUpControl("/InGame/CityStateDiploPopup")
	tCityStateGreeting	= ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup")

	UIManager:QueuePopup(ContextPtr, PopupPriority.DiploOverview)

	UIManager:DequeuePopup(tCityStateDiplo)
	UIManager:DequeuePopup(tCityStateGreeting)	

	--print(g_Chime[Players[g_minorCivID]:GetMinorCivTrait()])
	Events.AudioPlay2DSound(g_Chime[Players[g_minorCivID]:GetMinorCivTrait()])
end
Events.SerialEventGameMessagePopup.Add(OnEventReceived)
-------------------------------------------------
-- On Close
-------------------------------------------------
function OnClose()
	g_CurrentMenu = "BaseMenu"

	-- This forces the screen to grab new text everytime it is opened
	m_OldLastAction = ""
	m_LastAction = "MESSAGE_GREETING"

	UIManager:DequeuePopup(ContextPtr)	
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)
Events.GameplaySetActivePlayer.Add(OnClose)
----------------------------------------------------------------
-- Find On Map
----------------------------------------------------------------
function OnFindOnMapButtonClicked ()
	local minorPlayer = Players[g_minorCivID]
	if minorPlayer then
		local city = minorPlayer:GetCapitalCity()
		if city then
			local plot = city:Plot()
			if plot then
				UI.LookAt(plot, 0)
			end
		end
	end
end
Controls.FindOnMapButton:RegisterCallback( Mouse.eLClick, OnFindOnMapButtonClicked )
-------------------------------------------------
-- On Quest Info Clicked
-------------------------------------------------
function OnQuestInfoClicked()

	local activePlayerID = Game.GetActivePlayer()
	local minorPlayer = Players[ g_minorCivID ]
	local questKillCamp = MinorCivQuestTypes.MINOR_CIV_QUEST_KILL_CAMP

	if minorPlayer then
		if ( bnw_mode and minorPlayer:IsMinorCivDisplayedQuestForPlayer( activePlayerID, questKillCamp ) )
		or ( gk_mode and not bnw_mode and minorPlayer:IsMinorCivActiveQuestForPlayer( activePlayerID, questKillCamp ) )
		or ( not gk_mode and minorPlayer:GetActiveQuestForPlayer( activePlayerID ) == questKillCamp )
		then
			local questData1 = minorPlayer:GetQuestData1( activePlayerID, questKillCamp )
			local questData2 = minorPlayer:GetQuestData2( activePlayerID, questKillCamp )
			local plot = Map.GetPlot( questData1, questData2 )
			if plot then
				UI.LookAt( plot, 0 )
				local hex = ToHexFromGrid{ x=plot:GetX(), y=plot:GetY() }
				Events.GameplayFX( hex.x, hex.y, -1 )
			end
		end
	end
end
Controls.QuestInfo:RegisterCallback( Mouse.eLClick, OnQuestInfoClicked )
----------------------------------------------------------------        
-- Key Down Processing
---------------------------------------------------------------- 
function InputHandler(uiMsg, wParam, lParam )   
    if(uiMsg == KeyEvents.KeyDown) then
        if (wParam == Keys.VK_ESCAPE) then
			OnClose();
			return true;
        end
        
        -- Do Nothing.
        if(wParam == Keys.VK_RETURN) then
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Events.LoadScreenClose.Add(function()
	UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
	UIManager:DequeuePopup(ContextPtr)
end)
----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
