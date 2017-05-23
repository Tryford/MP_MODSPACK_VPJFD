-- modified by bc1 from 1.0.3.144 brave new world code
-- merge city state greeting so actions are available right away
-- code is common using gk_mode and bnw_mode switches
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- City State Diplo Popup
--
-- Authors: Anton Strenger
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local gk_mode = Game.GetReligionName ~= nil
local bnw_mode = Game.GetActiveLeague ~= nil
local L = Locale.ConvertTextKey

include( "IconSupport" ); local IconHookup = IconHookup; local CivIconHookup = CivIconHookup
include( "CityStateStatusHelper" ); local UpdateCityStateStatusUI = UpdateCityStateStatusUI; local GetCityStateStatusText = GetCityStateStatusText; local GetCityStateStatusToolTip = GetCityStateStatusToolTip; local GetAllyText = GetAllyText; local GetAllyToolTip = GetAllyToolTip; local GetActiveQuestText = GetActiveQuestText; local GetActiveQuestToolTip = GetActiveQuestToolTip; local GetCityStateTraitText = GetCityStateTraitText; local GetCityStateTraitToolTip = GetCityStateTraitToolTip
-------------------------------------------------------------------------------
-- JFD
-------------------------------------------------------------------------------
include("JFD_RTP_ClaimsUtils.lua")
include("JFD_PietyUtils.lua")

local userSettingClaimsCoreClaims = JFD_GetUserSetting("JFD_RTP_CLAIMS_CORE_CLAIMS") == 1
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local g_minorCivID = -1
local g_minorCivTeamID = -1
local m_PopupInfo = nil
local m_isNewQuestAvailable = false

local kiNoAction = 0
local kiMadePeace = 1
local kiBulliedGold = 2
local kiBulliedUnit = 3
local kiGiftedGold = 4
local kiPledgedToProtect = 5
local kiDeclaredWar = 6
local kiRevokedProtection = 7
local m_lastAction = kiNoAction
local m_pendingAction = kiNoAction	-- For bullying dialog popups
local kiGreet = 9
local questKillCamp = MinorCivQuestTypes.MINOR_CIV_QUEST_KILL_CAMP
local g_PersonalityInfo = {
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY ] = {
		title = "[COLOR_POSITIVE_TEXT]" .. L("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY") .. "[ENDCOLOR]",
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY_TT"),
		greeting = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_FRIENDLY"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL_TT"),
		greeting = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_NEUTRAL"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE ] = {
		title = "[COLOR_NEGATIVE_TEXT]" .. L("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE") .. "[ENDCOLOR]",
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE_TT"),
		greeting = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_HOSTILE"),
	},
	[ MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL ] = {
		title = L("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL"),
		tooltip = L("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL_TT"),
		greeting = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_IRRATIONAL"),
	},
}

if not gk_mode then
	Controls.FindOnMapButton:SetHide( true )
	Controls.TileImprovementGiftButton:SetHide( true )
	-- Controls.BuyoutButton:SetHide( true )
	Controls.RevokePledgeButton:SetHide( true )
	Controls.TakeButton:SetHide( true )
	Controls.GiveLabel:LocalizeAndSetText( "TXT_KEY_POP_CSTATE_PROVIDE_GOLD_GIFT" )
	Controls.QuestLabel:LocalizeAndSetText( "TXT_KEY_CITY_STATE_BARB_QUEST_SHORT" )
	Controls.BackgroundImage:SetAlpha( 0.44 )
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- HANDLERS AND HELPERS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function SetButtonSize(textControl, buttonControl, animControl, buttonHL)

	----print(textControl:GetText())
	local sizeY = textControl:GetSizeY() + 19 --WordWrapOffset
	buttonControl:SetSizeY(sizeY)
	animControl:SetSizeY(sizeY+3) --WordWrapAnimOffset
	buttonHL:SetSizeY(sizeY+3) --WordWrapAnimOffset
end

function UpdateButtonStack()
	Controls.GiveStack:CalculateSize()
	Controls.GiveStack:ReprocessAnchoring()

	--Piety Gifts
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	if activePlayer:HasStateReligion() then
		local stateReligionID = activePlayer:GetStateReligion()
		local minorStateReligionID = Players[g_minorCivID]:GetStateReligion()
		if (stateReligionID == minorStateReligionID and activePlayerID == Game.GetFounder(stateReligionID,-1)) then
			Controls.ShowPietyGiftsButton:LocalizeAndSetText("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON")
			Controls.ShowPietyGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON_TT", GameInfo.Religions[stateReligionID].IconString, Game.GetReligionName(stateReligionID))
			Controls.ShowPietyGiftsButton:SetDisabled(false)
		else
			local disabledText = "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON") .. "[ENDCOLOR]"
			Controls.ShowPietyGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON_TT", GameInfo.Religions[stateReligionID].IconString, Game.GetReligionName(stateReligionID))
			Controls.ShowPietyGiftsButton:SetText(disabledText)
			Controls.ShowPietyGiftsButton:SetDisabled(true)
		end
		Controls.ShowPietyGiftsButton:SetHide(false)
	else
		Controls.ShowPietyGiftsButton:SetHide(true)
	end
	
	Controls.TakeStack:CalculateSize()
	Controls.TakeStack:ReprocessAnchoring()

	Controls.ButtonStack:CalculateSize()
	Controls.ButtonStack:ReprocessAnchoring()

	Controls.ButtonScrollPanel:CalculateInternalSize()
end

function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
			if Controls.BullyConfirm:IsHidden() then
				OnCloseButtonClicked()
			else
				OnNoBully( )
			end
			return true
		end
	end
end
ContextPtr:SetInputHandler( InputHandler )

function ShowHideHandler( bIsHide, bInitState )

	if( not bInitState ) then
		Controls.BackgroundImage:UnloadTexture()
		if( not bIsHide ) then
			Events.SerialEventGameDataDirty.Add( OnDisplay )
			Events.WarStateChanged.Add( OnDisplay )		-- hack to force refresh in vanilla when selecting peace / war
			OnDisplay()
			UI.incTurnTimerSemaphore()
			Events.SerialEventGameMessagePopupShown( m_PopupInfo )
		else
			Events.SerialEventGameDataDirty.Remove( OnDisplay )
			Events.WarStateChanged.Remove( OnDisplay )
			UI.decTurnTimerSemaphore()
			if m_PopupInfo then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate( m_PopupInfo.Type, 0 )
			end
		end
	end
end
ContextPtr:SetShowHideHandler( ShowHideHandler )

-------------------------------------------------
-- On Event Received
-------------------------------------------------
function OnEventReceived( popupInfo )

	if popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_MESSAGE
	or popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO
	then
	elseif popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING then
		m_lastAction = kiGreet
	else
		return
	end

	m_PopupInfo = popupInfo

	g_minorCivID = popupInfo.Data1
	g_minorCivTeamID = Players[g_minorCivID]:GetTeam()

	m_pendingAction = kiNoAction

	m_isNewQuestAvailable = gk_mode and m_PopupInfo.Data2 == 1

	UIManager:QueuePopup( ContextPtr, PopupPriority.CityStateDiplo )

end
Events.SerialEventGameMessagePopup.Add( OnEventReceived )

-------------------------------------------------
-- On Display
-------------------------------------------------
function OnDisplay()

	-- print("Displaying City State Diplo Popup")

	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeamID = Game.GetActiveTeam()
	local activeTeam = Teams[activeTeamID]

	local minorPlayerID = g_minorCivID
	local minorPlayer = Players[minorPlayerID]
	local minorTeamID = g_minorCivTeamID
	local minorTeam = Teams[minorTeamID]
	local minorCivType = minorPlayer:GetMinorCivType()

	local strShortDescKey = minorPlayer:GetCivilizationShortDescriptionKey()

	local isAllies = minorPlayer:IsAllies(activePlayerID)
	local isFriends = minorPlayer:IsFriends(activePlayerID)

	-- At war?
	local isAtWar = activeTeam:IsAtWar(minorTeamID)

	-- Update colors
	local color = GameInfo.PlayerColors[ PreGame.GetCivilizationColor( minorPlayerID ) ]
	color = color and GameInfo.Colors[ color.SecondaryColor or -1 ]
	local textColor = color and { x=color.Red, y=color.Green, z=color.Blue, w=1 } or {x = 1, y = 1, z = 1, w = 1}

	-- Title
	strTitle = Locale.ToUpper( strShortDescKey )
	Controls.TitleLabel:SetText(strTitle)
	Controls.TitleLabel:SetColor(textColor, 0)

	civType = minorPlayer:GetCivilizationType()
	civInfo = GameInfo.Civilizations[civType]

	local trait = GameInfo.MinorCivilizations[minorCivType].MinorCivTrait
	Controls.TitleIcon:SetTexture(GameInfo.MinorCivTraits[trait].TraitTitleIcon)

	-- Set Background Image
	Controls.BackgroundImage:SetTexture( GameInfo.MinorCivTraits[trait].BackgroundImage )

	local iconColor = textColor
	IconHookup( civInfo.PortraitIndex, 32, civInfo.AlphaIconAtlas, Controls.CivIcon )
	Controls.CivIcon:SetColor(iconColor)

	local strStatusText = GetCityStateStatusText(activePlayerID, minorPlayerID)
	local strStatusTT = GetCityStateStatusToolTip(activePlayerID, minorPlayerID, true)
	Controls.StatusIcon:SetTexture(GameInfo.MinorCivTraits[trait].TraitIcon)
	UpdateCityStateStatusUI(activePlayerID, minorPlayerID, Controls.PositiveStatusMeter, Controls.NegativeStatusMeter, Controls.StatusMeterMarker, Controls.StatusIconBG)
	Controls.StatusInfo:SetText(strStatusText)
	Controls.StatusInfo:SetToolTipString(strStatusTT)
	Controls.StatusLabel:SetToolTipString(strStatusTT)
	Controls.StatusIconBG:SetToolTipString(strStatusTT)
	Controls.PositiveStatusMeter:SetToolTipString(strStatusTT)
	Controls.NegativeStatusMeter:SetToolTipString(strStatusTT)

	-- Trait
	local strTraitText = GetCityStateTraitText(minorPlayerID)
	local strTraitTT = GetCityStateTraitToolTip(minorPlayerID)

	strTraitText = "[COLOR_POSITIVE_TEXT]" .. strTraitText .. "[ENDCOLOR]"

	Controls.TraitInfo:SetText(strTraitText)
	Controls.TraitInfo:SetToolTipString(strTraitTT)
	Controls.TraitLabel:SetToolTipString(strTraitTT)

	-- Personality
	local personalityInfo = g_PersonalityInfo[ minorPlayer:GetPersonality() ] or {}
	Controls.PersonalityInfo:SetText( personalityInfo.title )
	Controls.PersonalityInfo:SetToolTipString( personalityInfo.tooltip )
	Controls.PersonalityLabel:SetToolTipString( personalityInfo.tooltip )

	-- Ally Status
	local allyID = minorPlayer:GetAlly()
	local ally = Players[ allyID ]
	local textMode = not ally or allyID == activePlayerID
	Controls.AllyIconContainer:SetHide( textMode )
	Controls.AllyText:SetHide( not textMode )
	if textMode then
		Controls.AllyText:SetText( GetAllyText(activePlayerID, minorPlayerID) )
	else
		CivIconHookup( Teams[ally:GetTeam()]:IsHasMet(activeTeamID) and allyID or -1, 32,
			Controls.AllyIcon, Controls.AllyIconBG, Controls.AllyIconShadow, false, true )
	end

	local strAllyTT = GetAllyToolTip( activePlayerID, minorPlayerID )
	Controls.AllyIcon:SetToolTipString(strAllyTT)
	Controls.AllyIconBG:SetToolTipString(strAllyTT)
	Controls.AllyIconShadow:SetToolTipString(strAllyTT)
	Controls.AllyText:SetToolTipString(strAllyTT)
	Controls.AllyLabel:SetToolTipString(strAllyTT)
	Controls.InfoStack:ReprocessAnchoring()

	-- Nearby Resources
	local pCapital = minorPlayer:GetCapitalCity()
	if (pCapital ~= nil) then

		local strResourceText = ""

		local iNumResourcesFound = 0

		local thisX = pCapital:GetX()
		local thisY = pCapital:GetY()

		local iRange = GameDefines.MINOR_CIV_RESOURCE_SEARCH_RADIUS or 5
		local iCloseRange = math.floor(iRange/2)
		local tResourceList = {}

		for iDX = -iRange, iRange, 1 do
			for iDY = -iRange, iRange, 1 do
				local pTargetPlot = Map.GetPlotXY(thisX, thisY, iDX, iDY)

				if pTargetPlot ~= nil then

					local iOwner = pTargetPlot:GetOwner()

					if (iOwner == minorPlayerID or iOwner == -1) then
						local plotX = pTargetPlot:GetX()
						local plotY = pTargetPlot:GetY()
						local plotDistance = Map.PlotDistance(thisX, thisY, plotX, plotY)

						if (plotDistance <= iRange and (plotDistance <= iCloseRange or iOwner == minorPlayerID)) then

							local iResourceType = pTargetPlot:GetResourceType(activeTeamID)

							if (iResourceType ~= -1) then

								if (Game.GetResourceUsageType(iResourceType) ~= ResourceUsageTypes.RESOURCEUSAGE_BONUS) then

									if (tResourceList[iResourceType] == nil) then
										tResourceList[iResourceType] = 0
									end

									tResourceList[iResourceType] = tResourceList[iResourceType] + pTargetPlot:GetNumResource()

								end
							end
						end
					end

				end
			end
		end

		for iResourceType, iAmount in pairs(tResourceList) do
			if (iNumResourcesFound > 0) then
				strResourceText = strResourceText .. ", "
			end
			local pResource = GameInfo.Resources[iResourceType]
			strResourceText = strResourceText .. pResource.IconString .. " [COLOR_POSITIVE_TEXT]" .. L(pResource.Description) .. " (" .. iAmount .. ") [ENDCOLOR]"
			iNumResourcesFound = iNumResourcesFound + 1
		end

		Controls.ResourcesInfo:SetText(strResourceText)

		Controls.ResourcesLabel:SetHide(false)
		Controls.ResourcesInfo:SetHide(false)

		local strResourceTextTT = L("TXT_KEY_CITY_STATE_RESOURCES_TT")
		Controls.ResourcesInfo:SetToolTipString(strResourceTextTT)
		Controls.ResourcesLabel:SetToolTipString(strResourceTextTT)

	else
		Controls.ResourcesLabel:SetHide(true)
		Controls.ResourcesInfo:SetHide(true)
	end

	-- Body text
	local strText

	-- JFD State Religion
	if minorPlayer:HasStateReligion() then
		local religionID = minorPlayer:GetStateReligion()
		local religion = GameInfo.Religions[religionID]
		Controls.StateReligionLabel:LocalizeAndSetText("TXT_KEY_POP_CSTATE_STATE_RELIGION", religion.IconString, Game.GetReligionName(religionID))
		Controls.StateReligionLabel:LocalizeAndSetToolTip(JFD_GetROStateReligionTT(g_minorCivID))
		Controls.StateReligionLabel:ReprocessAnchoring()
		Controls.StateReligionLabel:SetHide(false)
	elseif minorPlayer:HasSecularized() then
		Controls.StateReligionLabel:LocalizeAndSetText("TXT_KEY_POP_CSTATE_STATE_RELIGION_SECULAR")
	else
		Controls.StateReligionLabel:LocalizeAndSetText("TXT_KEY_POP_CSTATE_STATE_RELIGION_NONE")
		Controls.StateReligionLabel:LocalizeAndSetToolTip(JFD_GetROStateReligionTT(g_minorCivID))
	end
	
	-- Active Quests
	local sToolTipText = GetActiveQuestToolTip(activePlayerID, g_minorCivID)

	Controls.QuestInfo:SetText( GetActiveQuestText(activePlayerID, g_minorCivID) )
	Controls.QuestInfo:SetToolTipString(sToolTipText)
	Controls.QuestLabel:SetToolTipString(sToolTipText)

	-- War
	if isAtWar then

		-- Warmongering player
		if minorPlayer:IsPeaceBlocked(activeTeamID) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_WARMONGER")
			Controls.PeaceButton:SetHide(true)

		-- Normal War
		else
			strText = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_WAR")
			Controls.PeaceButton:SetHide(false)
		end

		Controls.GiveButton:SetHide(true)
		Controls.ShowPietyGiftsButton:SetHide(true) -- JFD Piety
		Controls.TakeButton:SetHide(true)
		Controls.WarButton:SetHide(true)
		Controls.NoUnitSpawningButton:SetHide(true)

	-- Peace
	else

		-- Gifts
		if m_lastAction == kiGreet then
			local iGoldGift = m_PopupInfo.Data2
			local iPietyGift = m_PopupInfo.Data3
			local bFirstMajorCiv = m_PopupInfo.Option1
			local strGiftString = ""

			if (iGoldGift > 0) then
				if (bFirstMajorCiv) then
					strGiftString = strGiftString .. L("TXT_KEY_CITY_STATE_GIFT_FIRST", iGoldGift)
				else
					strGiftString = strGiftString .. L("TXT_KEY_CITY_STATE_GIFT_OTHER", iGoldGift)
				end
			end

			if (iPietyGift > 0) then
				if (iGoldGift > 0) then
					strGiftString = strGiftString .. " "
				end

				--if (bFirstMajorCiv) then
				--	strGiftString = strGiftString .. L("TXT_KEY_CITY_STATE_GIFT_PIETY_FIRST", iPietyGift)
				--else
				--	strGiftString = strGiftString .. L("TXT_KEY_CITY_STATE_GIFT_PIETY_OTHER", iPietyGift)
				--end
			end
			strText = strGiftString
--			strText = L("TXT_KEY_CITY_STATE_MEETING", strShortDescKey, strGiftString, L("TXT_KEY_MINOR_SPEAK_AGAIN", strShortDescKey) )

		-- Were we sent here because we clicked a notification for a new quest?
		elseif (m_lastAction == kiNoAction and m_isNewQuestAvailable) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_QUEST_MESSAGE")

		-- Did we just make peace?
		elseif (m_lastAction == kiMadePeace) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_PEACE_JUST_MADE")

		-- Did we just bully gold?
		elseif (m_lastAction == kiBulliedGold) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_JUST_BULLIED")

		-- Did we just bully a worker?
		elseif (m_lastAction == kiBulliedUnit) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_JUST_BULLIED_WORKER")

		-- Did we just give gold?
		elseif (m_lastAction == kiGiftedGold) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_JUST_SUPPORTED")

		-- Did we just PtP?
		elseif (m_lastAction == kiPledgedToProtect) then
			strText = L("TXT_KEY_CITY_STATE_PLEDGE_RESPONSE")

		-- Did we just revoke a PtP?
		elseif (m_lastAction == kiRevokedProtection) then
			strText = L("TXT_KEY_CITY_STATE_DIPLO_JUST_REVOKED_PROTECTION")

		-- Normal peaceful hello, with info about active quests
		else
			local personalityInfo = g_PersonalityInfo[ minorPlayer:GetPersonality() ]

			if gk_mode and minorPlayer:IsProtectedByMajor(activePlayerID) then
				strText = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_PROTECTED")
			elseif personalityInfo then
				strText = personalityInfo.greeting
			end

			local strQuestString = ""
			local strWarString = ""

			local iNumPlayersAtWar = 0

			-- Loop through all the Majors the active player knows
			for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do

				pOtherPlayer = Players[iPlayerLoop]
				iOtherTeam = pOtherPlayer:GetTeam()

				-- Don't test war with active player!
				if (iPlayerLoop ~= activePlayerID) then
					if (pOtherPlayer:IsAlive()) then
						if (minorTeam:IsAtWar(iOtherTeam)) then
							if minorPlayer:IsMinorWarQuestWithMajorActive(iPlayerLoop) then
								if (iNumPlayersAtWar ~= 0) then
									strWarString = strWarString .. ", "
								end
								strWarString = strWarString .. L(pOtherPlayer:GetNameKey())

								iNumPlayersAtWar = iNumPlayersAtWar + 1
							end
						end
					end
				end
			end
		end

		-- Tell the City State to stop gifting us Units (if they are)
		if isFriends and minorPlayer:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC then
			Controls.NoUnitSpawningButton:SetHide(false)

			-- Player has said to turn it off
			local strSpawnText
			if (minorPlayer:IsMinorCivUnitSpawningDisabled(activePlayerID)) then
				strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_ON")
			else
				strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_OFF")
			end
			Controls.NoUnitSpawningLabel:SetText(strSpawnText)
		else
			Controls.NoUnitSpawningButton:SetHide(true)
		end

		Controls.GiveButton:SetHide(false)
		Controls.ShowPietyGiftsButton:SetHide(false) -- JFD Piety
		Controls.TakeButton:SetHide( not gk_mode )
		Controls.PeaceButton:SetHide(true)
		Controls.WarButton:SetHide(false)
	end

	-- Pledge to Protect
	local isShowPledgeButton = false
	local isEnablePledgeButton = false
	local isShowRevokeButton = false
	local isEnableRevokeButton = false
	local strProtectButton = Locale.Lookup("TXT_KEY_POP_CSTATE_PLEDGE_TO_PROTECT")
	local strProtectTT = Locale.Lookup("TXT_KEY_POP_CSTATE_PLEDGE_TT", GameDefines.MINOR_FRIENDSHIP_ANCHOR_MOD_PROTECTED, GameDefines.BALANCE_MINOR_PROTECTION_MINIMUM_DURATION, GameDefines.BALANCE_INFLUENCE_BOOST_PROTECTION_MINOR, GameDefines.BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS, GameDefines.BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS_MAX);
	local strRevokeProtectButton = Locale.Lookup("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION")
	local strRevokeProtectTT = Locale.Lookup("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION_TT")

	if not isAtWar then
		-- PtP in effect
		if not gk_mode then
			-- Must be at least friends to pledge to protect
			isShowPledgeButton = isFriends and not activePlayer:IsProtectingMinor(minorPlayerID)
			isEnablePledgeButton = isShowPledgeButton

		elseif minorPlayer:IsProtectedByMajor(activePlayerID) then
			isShowRevokeButton = true
			-- Can we revoke it?
			if minorPlayer:CanMajorWithdrawProtection(activePlayerID) then
				isEnableRevokeButton = true
			else
				strRevokeProtectButton = "[COLOR_WARNING_TEXT]" .. strRevokeProtectButton .. "[ENDCOLOR]"
				local iTurnsCommitted = (minorPlayer:GetTurnLastPledgedProtectionByMajor(activePlayerID) + 10) - Game.GetGameTurn()
				strRevokeProtectTT = strRevokeProtectTT .. Locale.Lookup("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION_DISABLED_COMMITTED_TT", iTurnsCommitted)
			end
		-- No PtP
		else
			isShowPledgeButton = true
			-- Can we pledge?
			if minorPlayer:CanMajorStartProtection(activePlayerID) then
				isEnablePledgeButton = true
			else
				strProtectButton = "[COLOR_WARNING_TEXT]" .. strProtectButton .. "[ENDCOLOR]"
				local iLastTurnPledgeBroken = minorPlayer:GetTurnLastPledgeBrokenByMajor(activePlayerID)
				if (iLastTurnPledgeBroken >= 0) then -- (-1) means never happened
					local iTurnsUntilRecovered = (iLastTurnPledgeBroken + 20) - Game.GetGameTurn()
					strProtectTT = strProtectTT .. Locale.Lookup("TXT_KEY_POP_CSTATE_PLEDGE_DISABLED_MISTRUST_TT", iTurnsUntilRecovered)
				else
					local iMinimumInfForPledge = GameDefines["FRIENDSHIP_THRESHOLD_CAN_PLEDGE_TO_PROTECT"]
					strProtectTT = strProtectTT .. Locale.Lookup("TXT_KEY_POP_CSTATE_PLEDGE_DISABLED_INFLUENCE_TT", iMinimumInfForPledge)
				end
			end
		end
	end
	Controls.PledgeAnim:SetHide(not isEnablePledgeButton)
	Controls.PledgeButton:SetHide(not isShowPledgeButton)
	if (isShowPledgeButton) then
		Controls.PledgeLabel:SetText(strProtectButton)
		Controls.PledgeButton:SetToolTipString(strProtectTT)
	end
	Controls.RevokePledgeAnim:SetHide(not isEnableRevokeButton)
	Controls.RevokePledgeButton:SetHide(not isShowRevokeButton)
	if (isShowRevokeButton) then
		Controls.RevokePledgeLabel:SetText(strRevokeProtectButton)
		Controls.RevokePledgeButton:SetToolTipString(strRevokeProtectTT)
	end

	if (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_WAR)) then
		Controls.PeaceButton:SetHide(true)
	end
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_PEACE)) then
		Controls.WarButton:SetHide(true)
	end
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_CHANGING_WAR_PEACE)) then
		Controls.PeaceButton:SetHide(true)
		Controls.WarButton:SetHide(true)
	end

	if gk_mode then
		-- PushClaim (Claims)
		if (userSettingClaimsCoreClaims and minorPlayer:GetCapitalCity() and (not activePlayer:IsAtWarWith(minorPlayerID))) then
			local minorPlayerPop = minorPlayer:GetTotalPopulation() or 0
			local iPushClaimCost = minorPlayer:GetBuyoutCost(activePlayerID)
			local numCauses, causesTT = JFD_GetClaimCauses(activePlayerID, minorPlayerID, true)
			local claimID = JFD_GetMinorClaimID(activePlayerID, minorPlayerID)
			local claim = GameInfo.JFD_Claims[claimID]
			local claimDesc = L("TXT_KEY_POP_CSTATE_JFD_PUSH_CLAIM", claim.Description)
			local claimHelpCauses = L(claim.CausesHelp, numCauses, causesTT)
			local claimGoldCost, claimDignitaryCost, claimResistanceCost = JFD_GetClaimCost(activePlayerID, minorPlayerID, claimID)
			local claimHelp = L(claim.Help, claimDignitaryCost, claimGoldCost, claimResistanceCost, claimHelpCauses)
			local canPushClaim = JFD_CanPushMinorClaim(activePlayerID, minorPlayerID, claimID)
			if (not canPushClaim) then
				Controls.PushClaimButton:SetDisabled(true)
				claimDesc = "[COLOR_WARNING_TEXT]" .. claimDesc .. "[ENDCOLOR]"
			else
				Controls.PushClaimButton:SetDisabled(false)
			end
			Controls.PushClaimButton:SetHide(false)
			Controls.PushClaimButton:LocalizeAndSetText(claimDesc)
			Controls.PushClaimButton:LocalizeAndSetToolTip("TXT_KEY_POP_CSTATE_JFD_PUSH_CLAIM_TT", claimHelp)
		else
			Controls.PushClaimButton:SetHide(true)
		end

		-- Buyout (Austria UA)
		-- local iBuyoutCost = minorPlayer:GetBuyoutCost(activePlayerID)
		-- local strButtonLabel = L( "TXT_KEY_POP_CSTATE_BUYOUT")
		-- local strToolTip = L( "TXT_KEY_POP_CSTATE_BUYOUT_TT", iBuyoutCost )
		-- if minorPlayer:CanMajorBuyout(activePlayerID) and not isAtWar then
			-- Controls.BuyoutButton:SetHide(false)
			-- Controls.BuyoutAnim:SetHide(false)
		-- elseif (activePlayer:IsAbleToAnnexCityStates() and not isAtWar) then
			-- if (minorPlayer:GetAlly() == activePlayerID) then
				-- local iAllianceTurns = minorPlayer:GetAlliedTurns()
				-- strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]"
				-- strToolTip = L("TXT_KEY_POP_CSTATE_BUYOUT_DISABLED_ALLY_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iAllianceTurns, iBuyoutCost)
			-- else
				-- strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]"
				-- strToolTip = L("TXT_KEY_POP_CSTATE_BUYOUT_DISABLED_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iBuyoutCost)
			-- end
			-- antonjs: todo: disable button entirely, in case isAtWar doesn't update in time for the callback to disallow buyout in wartime
			-- Controls.BuyoutButton:SetHide(false)
			-- Controls.BuyoutAnim:SetHide(true)
		-- else
			-- Controls.BuyoutButton:SetHide(true)
		-- end
		-- Controls.BuyoutLabel:SetText( strButtonLabel )
		-- Controls.BuyoutButton:SetToolTipString( strToolTip )
	end
	
	-- CBP
	if(not minorPlayer:IsMarried(activePlayerID)) then
		iBuyoutCost = minorPlayer:GetMarriageCost(activePlayerID);
		local strButtonLabel = Locale.ConvertTextKey( "TXT_KEY_POP_CSTATE_BUYOUT");
		local strToolTip = Locale.ConvertTextKey( "TXT_KEY_POP_CSTATE_MARRIAGE_TT", iBuyoutCost );
		if(minorPlayer:CanMajorMarry(activePlayerID) and not bWar ) then	
			Controls.MarriageButton:SetHide(false);
			Controls.MarriageAnim:SetHide(false);
		elseif (activePlayer:IsDiplomaticMarriage() and not bWar) then
			if (minorPlayer:GetAlly() == activePlayerID) then
				local iAllianceTurns = minorPlayer:GetAlliedTurns();
				strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]";
				strToolTip = Locale.ConvertTextKey("TXT_KEY_POP_CSTATE_MARRIAGE_DISABLED_ALLY_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iAllianceTurns, iBuyoutCost);
			else
				strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]";
				strToolTip = Locale.ConvertTextKey("TXT_KEY_POP_CSTATE_MARRIAGE_DISABLED_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iBuyoutCost);
			end
			--antonjs: todo: disable button entirely, in case bWar doesn't update in time for the callback to disallow buyout in wartime
			Controls.MarriageButton:SetHide(false);
			Controls.MarriageAnim:SetHide(true);
		else
			Controls.MarriageButton:SetHide(true);
		end
		Controls.MarriageLabel:SetText( strButtonLabel );
		Controls.MarriageButton:SetToolTipString( strToolTip );
	else
		Controls.MarriageButton:SetHide(true);
	end
	-- END

	Controls.DescriptionLabel:SetText(strText)

	SetButtonSize(Controls.PeaceLabel, Controls.PeaceButton, Controls.PeaceAnim, Controls.PeaceButtonHL)
	SetButtonSize(Controls.GiveLabel, Controls.GiveButton, Controls.GiveAnim, Controls.GiveButtonHL)
	SetButtonSize(Controls.TakeLabel, Controls.TakeButton, Controls.TakeAnim, Controls.TakeButtonHL)
	SetButtonSize(Controls.WarLabel, Controls.WarButton, Controls.WarAnim, Controls.WarButtonHL)
	SetButtonSize(Controls.PledgeLabel, Controls.PledgeButton, Controls.PledgeAnim, Controls.PledgeButtonHL)
	SetButtonSize(Controls.RevokePledgeLabel, Controls.RevokePledgeButton, Controls.RevokePledgeAnim, Controls.RevokePledgeButtonHL)
	SetButtonSize(Controls.NoUnitSpawningLabel, Controls.NoUnitSpawningButton, Controls.NoUnitSpawningAnim, Controls.NoUnitSpawningButtonHL)
	SetButtonSize(Controls.PushClaimLabel, Controls.PushClaimButton, Controls.PushClaimAnim, Controls.PushClaimButtonHL)
	-- SetButtonSize(Controls.BuyoutLabel, Controls.BuyoutButton, Controls.BuyoutAnim, Controls.BuyoutButtonHL)

	Controls.GiveStackCSD:SetHide(true)
	Controls.GiveStack:SetHide(true)
	Controls.TakeStack:SetHide(true)
	Controls.ButtonStack:SetHide(false)

	UpdateButtonStack()
end

-------------------------------------------------
-- On Quest Info Clicked
-------------------------------------------------
function OnQuestInfoClicked()
	local activePlayerID = Game.GetActivePlayer()
	local minorPlayer = Players[ g_minorCivID ]
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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- MAIN MENU
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

----------------------------------------------------------------
-- Pledge
----------------------------------------------------------------
function OnPledgeButtonClicked ()

	local activePlayerID = Game.GetActivePlayer()
	local minorPlayer = Players[g_minorCivID]

	if gk_mode then
		if minorPlayer:CanMajorStartProtection( activePlayerID ) then
			m_lastAction = kiPledgedToProtect
			Game.DoMinorPledgeProtection( activePlayerID, g_minorCivID, true )
		end
	elseif minorPlayer:IsFriends(activePlayerID) and not Players[activePlayerID]:IsProtectingMinor(minorPlayerID) then
		m_lastAction = kiPledgedToProtect
		Network.SendPledgeMinorProtection( g_minorCivID, true ) -- does not seem to work in 1.0.3.144
		OnDisplay()
	end
end
Controls.PledgeButton:RegisterCallback( Mouse.eLClick, OnPledgeButtonClicked )

----------------------------------------------------------------
-- Revoke Pledge
----------------------------------------------------------------
function OnRevokePledgeButtonClicked ()

	local activePlayerID = Game.GetActivePlayer()
	local minorPlayer = Players[g_minorCivID]

	if gk_mode and minorPlayer:CanMajorWithdrawProtection(activePlayerID) then
		Game.DoMinorPledgeProtection(activePlayerID, g_minorCivID, false)
		m_lastAction = kiRevokedProtection
	end
end
Controls.RevokePledgeButton:RegisterCallback( Mouse.eLClick, OnRevokePledgeButtonClicked )

----------------------------------------------------------------
-- Buyout (Claim)
----------------------------------------------------------------
function ConfirmClaimYes()
	Controls.PushClaimConfirm:SetHide(true)
	OnCloseButtonClicked()
	LuaEvents.JFD_ClaimPushed(Game.GetActivePlayer(), g_minorCivID)
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, ConfirmClaimYes)

function ConfirmClaimNo()
	Controls.PushClaimConfirm:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, ConfirmClaimNo)

function OnPushClaimButtonClicked()
	local activePlayerID = Game.GetActivePlayer()
	local minorPlayer = Players[g_minorCivID]
	local claim = GameInfo.JFD_Claims[JFD_GetMinorClaimID(activePlayerID, g_minorCivID)]
	Controls.PushClaimConfirm:SetHide(false)
	Controls.PushClaimLabelConfirm:LocalizeAndSetText("TXT_KEY_POP_CSTATE_JFD_PUSH_CLAIM_CONFIRM", claim.Description)
end
Controls.PushClaimButton:RegisterCallback( Mouse.eLClick, OnPushClaimButtonClicked )
----------------------------------------------------------------
-- Buyout
----------------------------------------------------------------
-- function OnBuyoutButtonClicked()
	-- local activePlayerID = Game.GetActivePlayer()
	-- local minorPlayer = Players[g_minorCivID]

	-- if gk_mode and minorPlayer:CanMajorBuyout(activePlayerID) then
		-- OnCloseButtonClicked()
		-- Game.DoMinorBuyout(activePlayerID, g_minorCivID)
	-- end
-- end
-- Controls.BuyoutButton:RegisterCallback( Mouse.eLClick, OnBuyoutButtonClicked )

----------------------------------------------------------------
-- Marriage (CBP)
----------------------------------------------------------------
function OnMarriageButtonClicked()
	local iActivePlayer = Game.GetActivePlayer();
	local pMinor = Players[g_iMinorCivID];

	if (pMinor:CanMajorMarry(iActivePlayer)) then
		UIManager:DequeuePopup( ContextPtr );
		pMinor:DoMarriage(iActivePlayer);
	end
end
Controls.MarriageButton:RegisterCallback( Mouse.eLClick, OnMarriageButtonClicked );
----------------------------------------------------------------
-- War
----------------------------------------------------------------
function OnWarButtonClicked ()
	if bnw_mode then
		UI.AddPopup{ Type = ButtonPopupTypes.BUTTONPOPUP_DECLAREWARMOVE, Data1 = g_minorCivTeamID, Option1 = true}
	else
		BullyAction( kiDeclaredWar )
	end
end
Controls.WarButton:RegisterCallback( Mouse.eLClick, OnWarButtonClicked )

----------------------------------------------------------------
-- Peace
----------------------------------------------------------------
function OnPeaceButtonClicked ()

	Network.SendChangeWar(g_minorCivTeamID, false)
	m_lastAction = kiMadePeace

end
Controls.PeaceButton:RegisterCallback( Mouse.eLClick, OnPeaceButtonClicked )

----------------------------------------------------------------
-- Stop/Start Unit Spawning
----------------------------------------------------------------
function OnStopStartSpawning()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()

	local bSpawningDisabled = minorPlayer:IsMinorCivUnitSpawningDisabled(activePlayerID)

	-- Update the text based on what state we're changing to
	local strSpawnText
	if (bSpawningDisabled) then
		strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_OFF")
	else
		strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_ON")
	end

	Controls.NoUnitSpawningLabel:SetText(strSpawnText)

	Network.SendMinorNoUnitSpawning(g_minorCivID, not bSpawningDisabled)
end
Controls.NoUnitSpawningButton:RegisterCallback( Mouse.eLClick, OnStopStartSpawning )

----------------------------------------------------------------
-- Open Give Submenu
----------------------------------------------------------------
function OnGiveButtonClicked ()
	-- Controls.GiveStack:SetHide(false)
	-- Controls.TakeStack:SetHide(true)
	-- Controls.ButtonStack:SetHide(true)
	-- PopulateGiftChoices()
--CSD LUA CHANGE FOR GIFTS
	local iGoldGiftLarge = GameDefines["MINOR_GOLD_GIFT_LARGE"];
	if (iGoldGiftLarge == 0) then
		Controls.GiveStackCSD:SetHide(false);
		Controls.GiveStack:SetHide(true);
		Controls.TakeStack:SetHide(true);
		Controls.ButtonStack:SetHide(true);
		PopulateGiftChoices();
	else
		Controls.GiveStackCSD:SetHide(true);
		Controls.GiveStack:SetHide(false);
		Controls.TakeStack:SetHide(true);
		Controls.ButtonStack:SetHide(true);
		PopulateGiftChoices();
	end
end
Controls.GiveButton:RegisterCallback( Mouse.eLClick, OnGiveButtonClicked )

----------------------------------------------------------------
-- Open Take Submenu
----------------------------------------------------------------
function OnTakeButtonClicked ()
	Controls.GiveStackCSD:SetHide(true)
	Controls.GiveStack:SetHide(true)
	Controls.TakeStack:SetHide(false)
	Controls.ButtonStack:SetHide(true)
	PopulateTakeChoices()
end
Controls.TakeButton:RegisterCallback( Mouse.eLClick, OnTakeButtonClicked )

----------------------------------------------------------------
-- Close or 'Active' (local human) player has changed
----------------------------------------------------------------
function OnCloseButtonClicked ()
	m_lastAction = kiNoAction
	m_pendingAction = kiNoAction
	Controls.PietyGiftStack:SetHide(true) -- JFD Piety
	UIManager:DequeuePopup( ContextPtr )
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnCloseButtonClicked )
Events.GameplaySetActivePlayer.Add( OnCloseButtonClicked )

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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- GIFT MENU
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
local iGoldGiftLarge = GameDefines["MINOR_GOLD_GIFT_LARGE"]
local iGoldGiftMedium = GameDefines["MINOR_GOLD_GIFT_MEDIUM"]
local iGoldGiftSmall = GameDefines["MINOR_GOLD_GIFT_SMALL"]

function PopulateGiftChoices()
	local minorPlayer = Players[g_minorCivID]

	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]

	-- Small Gold
	local iNumGoldPlayerHas = activePlayer:GetGold()

	iGold = iGoldGiftSmall
	iLowestGold = iGold
	iFriendshipAmount = minorPlayer:GetFriendshipFromGoldGift(activePlayerID, iGold)
	local buttonText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount)
	if (iNumGoldPlayerHas < iGold) then
		buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
		Controls.SmallGiftAnim:SetHide(true)
	else
		Controls.SmallGiftAnim:SetHide(false)
	end
	Controls.SmallGift:SetText(buttonText)
	SetButtonSize(Controls.SmallGift, Controls.SmallGiftButton, Controls.SmallGiftAnim, Controls.SmallGiftButtonHL)

	-- Medium Gold
	iGold = iGoldGiftMedium
	iFriendshipAmount = minorPlayer:GetFriendshipFromGoldGift(activePlayerID, iGold)
	local buttonText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount)
	if (iNumGoldPlayerHas < iGold) then
		buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
		Controls.MediumGiftAnim:SetHide(true)
	else
		Controls.MediumGiftAnim:SetHide(false)
	end
	Controls.MediumGift:SetText(buttonText)
	SetButtonSize(Controls.MediumGift, Controls.MediumGiftButton, Controls.MediumGiftAnim, Controls.MediumGiftButtonHL)

	-- Large Gold
	iGold = iGoldGiftLarge
	iFriendshipAmount = minorPlayer:GetFriendshipFromGoldGift(activePlayerID, iGold)
	local buttonText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount)
	if (iNumGoldPlayerHas < iGold) then
		buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
		Controls.LargeGiftAnim:SetHide(true)
	else
		Controls.LargeGiftAnim:SetHide(false)
	end
	Controls.LargeGift:SetText(buttonText)
	SetButtonSize(Controls.LargeGift, Controls.LargeGiftButton, Controls.LargeGiftAnim, Controls.LargeGiftButtonHL)

	-- Unit
	if bnw_mode then
		local iInfluence = minorPlayer:GetFriendshipFromUnitGift(activePlayerID, false, true)
		local iTravelTurns = GameDefines.MINOR_UNIT_GIFT_TRAVEL_TURNS
		local buttonText = L("TXT_KEY_POP_CSTATE_GIFT_UNIT", iInfluence)
		local tooltipText = L("TXT_KEY_POP_CSTATE_GIFT_UNIT_TT", iTravelTurns, iInfluence)
		if minorPlayer:GetIncomingUnitCountdown(activePlayerID) >= 0 then
			buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
			Controls.UnitGiftAnim:SetHide(true)
			Controls.UnitGiftButton:ClearCallback( Mouse.eLClick )
		else
			Controls.UnitGiftAnim:SetHide(false)
			Controls.UnitGiftButton:RegisterCallback( Mouse.eLClick, OnGiftUnit )
		end
		Controls.UnitGift:SetText(buttonText)
		Controls.UnitGiftButton:SetToolTipString(tooltipText)
	end
	if gk_mode then
		SetButtonSize(Controls.UnitGift, Controls.UnitGiftButton, Controls.UnitGiftAnim, Controls.UnitGiftButtonHL)

		-- Tile Improvement
		-- Only allowed for allies
		iGold = minorPlayer:GetGiftTileImprovementCost(activePlayerID)
		local buttonText = L("TXT_KEY_POPUP_MINOR_GIFT_TILE_IMPROVEMENT", iGold)
		if not minorPlayer:CanMajorGiftTileImprovement(activePlayerID) then
			buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
			Controls.TileImprovementGiftAnim:SetHide(true)
		else
			Controls.TileImprovementGiftAnim:SetHide(false)
		end
		Controls.TileImprovementGift:SetText(buttonText)
		SetButtonSize(Controls.TileImprovementGift, Controls.TileImprovementGiftButton, Controls.TileImprovementGiftAnim, Controls.TileImprovementGiftButtonHL)
	end

	-- Tooltip info
	local iFriendsAmount = GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]
	local iAlliesAmount = GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]
	local iFriendship = minorPlayer:GetMinorCivFriendshipWithMajor(activePlayerID)
	local strInfoTT = L("TXT_KEY_POP_CSTATE_GOLD_STATUS_TT", iFriendsAmount, iAlliesAmount, iFriendship)
	strInfoTT = strInfoTT .. "[NEWLINE][NEWLINE]"
	strInfoTT = strInfoTT .. L("TXT_KEY_POP_CSTATE_GOLD_TT")
	Controls.SmallGiftButton:SetToolTipString(strInfoTT)
	Controls.MediumGiftButton:SetToolTipString(strInfoTT)
	Controls.LargeGiftButton:SetToolTipString(strInfoTT)

	UpdateButtonStack()
end

----------------------------------------------------------------
-- Gold Gifts
----------------------------------------------------------------
function OnSmallGold ()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local iNumGoldPlayerHas = activePlayer:GetGold()

	if (iNumGoldPlayerHas >= iGoldGiftSmall) then
		Game.DoMinorGoldGift(g_minorCivID, iGoldGiftSmall)
		m_lastAction = kiGiftedGold
		OnCloseGive()
	end
end
Controls.SmallGiftButton:RegisterCallback( Mouse.eLClick, OnSmallGold )

function OnMediumGold ()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local iNumGoldPlayerHas = activePlayer:GetGold()

	if (iNumGoldPlayerHas >= iGoldGiftMedium) then
		Game.DoMinorGoldGift(g_minorCivID, iGoldGiftMedium)
		m_lastAction = kiGiftedGold
		OnCloseGive()
	end
end
Controls.MediumGiftButton:RegisterCallback( Mouse.eLClick, OnMediumGold )

function OnBigGold ()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local iNumGoldPlayerHas = activePlayer:GetGold()

	if (iNumGoldPlayerHas >= iGoldGiftLarge) then
		Game.DoMinorGoldGift(g_minorCivID, iGoldGiftLarge)
		m_lastAction = kiGiftedGold
		OnCloseGive()
	end
end
Controls.LargeGiftButton:RegisterCallback( Mouse.eLClick, OnBigGold )
----------------------------------------------------------------
-- JFD Piety Gifts
----------------------------------------------------------------
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldGiftMod)/100)
local mathCeil = math.ceil
local pietyGiftLarge 		= GameDefines["MINOR_JFD_PIETY_GIFT_LARGE"]
local pietyGiftLargeReward 	= GameDefines["MINOR_JFD_PIETY_GIFT_LARGE_REWARD"]
local pietyGiftMedium 		= GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM"]
local pietyGiftMediumReward = GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM_REWARD"]
local pietyGiftSmall 		= GameDefines["MINOR_JFD_PIETY_GIFT_SMALL"]
local pietyGiftSmallReward 	= GameDefines["MINOR_JFD_PIETY_GIFT_SMALL_REWARD"]
if pietyGiftLarge then
	pietyGiftLarge 			= mathCeil(pietyGiftLarge*iMod)
	pietyGiftLargeReward 	= mathCeil(pietyGiftLargeReward*iMod)
	pietyGiftMedium 		= mathCeil(pietyGiftMedium*iMod)
	pietyGiftMediumReward 	= mathCeil(pietyGiftMediumReward*iMod)
	pietyGiftSmall 			= mathCeil(pietyGiftSmall*iMod)
	pietyGiftSmallReward 	= mathCeil(pietyGiftSmallReward*iMod)
end

local pietyGiftCost = nil
local pietyGiftReward = nil
function ConfirmSpendPietyYes()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local minorPlayer = Players[g_minorCivID]
	activePlayer:ChangePiety(-pietyGiftCost)
	Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
	minorPlayer:ChangeMinorCivFriendshipWithMajor(activePlayerID, pietyGiftReward)
	Controls.SpendPietyConfirm:SetHide(true)
	OnCloseGive()
end
Controls.ConfirmSpendPietyYes:RegisterCallback(Mouse.eLClick, ConfirmSpendPietyYes)

function ConfirmSpendPietyNo()
	Controls.SpendPietyConfirm:SetHide(true)
end
Controls.ConfirmSpendPietyNo:RegisterCallback(Mouse.eLClick, ConfirmSpendPietyNo)

function OnSpendPietyButton1Clicked()
	pietyGiftCost = pietyGiftSmall
	pietyGiftReward = pietyGiftSmallReward
	Controls.SpendPietyConfirm:SetHide(false)
	Controls.SpendPietyLabelConfirm:LocalizeAndSetText("TXT_KEY_POP_CSTATE_JFD_SPEND_PIETY", pietyGiftCost, pietyGiftReward)
end
Controls.PietyGift1Button:RegisterCallback( Mouse.eLClick, OnSpendPietyButton1Clicked )

function OnSpendPietyButton2Clicked()
	pietyGiftCost = pietyGiftMedium
	pietyGiftReward = pietyGiftMediumReward
	Controls.SpendPietyConfirm:SetHide(false)
	Controls.SpendPietyLabelConfirm:LocalizeAndSetText("TXT_KEY_POP_CSTATE_JFD_SPEND_PIETY", pietyGiftCost, pietyGiftReward)
end
Controls.PietyGift2Button:RegisterCallback( Mouse.eLClick, OnSpendPietyButton2Clicked )

function OnSpendPietyButton3Clicked()
	pietyGiftCost = pietyGiftLarge
	pietyGiftReward = pietyGiftLargeReward
	Controls.SpendPietyConfirm:SetHide(false)
	Controls.SpendPietyLabelConfirm:LocalizeAndSetText("TXT_KEY_POP_CSTATE_JFD_SPEND_PIETY", pietyGiftCost, pietyGiftReward)
end
Controls.PietyGift3Button:RegisterCallback( Mouse.eLClick, OnSpendPietyButton3Clicked )

function JFD_ShowPietyPurchaseOptions()
	Controls.PietyGiftStack:SetHide(false)
	Controls.TakeStack:SetHide(true)
	Controls.ButtonStack:SetHide(true)
	JFD_UpdatePietyGiftsStack()
end
Controls.ShowPietyGiftsButton:RegisterCallback(Mouse.eLClick, JFD_ShowPietyPurchaseOptions)

local friendsAmount = GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]
local alliesAmount 	= GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]
   
function JFD_UpdatePietyGiftsStack()
	local minorPlayer = Players[g_minorCivID]

	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local largeGiftText	 = Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_GIFT_LARGE", pietyGiftLarge, pietyGiftLargeReward)
	local mediumGiftText = Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_GIFT_MEDIUM", pietyGiftMedium, pietyGiftMediumReward)
	local smallGiftText  = Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_GIFT_SMALL", pietyGiftSmall, pietyGiftSmallReward)
	
	-- Small Piety
	local playerPiety = activePlayer:GetPiety()
	if playerPiety < pietyGiftSmall then
		smallGiftText = "[COLOR_WARNING_TEXT]" .. smallGiftText .. "[ENDCOLOR]"
		Controls.PietyGift1Button:SetDisabled(true)
		Controls.PietyGift1Anim:SetHide(true)
	else	
		Controls.PietyGift1Anim:SetHide(false)
	end
	Controls.PietyGift1:SetText(smallGiftText)
	SetButtonSize(Controls.PietyGift1, Controls.PietyGift1Button, Controls.PietyGift1Anim, Controls.PietyGift1ButtonHL)
	
	-- Medium Piety
	local playerPiety = activePlayer:GetPiety()
	if playerPiety < pietyGiftMedium then
		mediumGiftText = "[COLOR_WARNING_TEXT]" .. mediumGiftText .. "[ENDCOLOR]"
		Controls.PietyGift2Button:SetDisabled(true)
		Controls.PietyGift2Anim:SetHide(true)
	else	
		Controls.PietyGift2Anim:SetHide(false)
	end
	Controls.PietyGift2:SetText(mediumGiftText)
	SetButtonSize(Controls.PietyGift2, Controls.PietyGift2Button, Controls.PietyGift2Anim, Controls.PietyGift2ButtonHL)
	
	-- Large Piety
	local playerPiety = activePlayer:GetPiety()
	if playerPiety < pietyGiftLarge then
		largeGiftText = "[COLOR_WARNING_TEXT]" .. largeGiftText .. "[ENDCOLOR]"
		Controls.PietyGift3Button:SetDisabled(true)
		Controls.PietyGift3Anim:SetHide(true)
	else	
		Controls.PietyGift3Anim:SetHide(false)
	end
	Controls.PietyGift3:SetText(largeGiftText)
	SetButtonSize(Controls.PietyGift3, Controls.PietyGift3Button, Controls.PietyGift3Anim, Controls.PietyGift3ButtonHL)
		
	local currentFriendship = minorPlayer:GetMinorCivFriendshipWithMajor(activePlayerID)
	local pietyGiftTT = Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_GIFT_STATUS_TT", friendsAmount, alliesAmount, currentFriendship) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_GIFT_TT")
	Controls.PietyGift1:LocalizeAndSetToolTip(pietyGiftTT)
	Controls.PietyGift2:LocalizeAndSetToolTip(pietyGiftTT)
	Controls.PietyGift3:LocalizeAndSetToolTip(pietyGiftTT)
end
----------------------------------------------------------------
-- Gift Unit
----------------------------------------------------------------
function OnGiftUnit()

	OnCloseButtonClicked()
	UI.SetInterfaceMode( InterfaceModeTypes.INTERFACEMODE_GIFT_UNIT )
	UI.SetInterfaceModeValue( g_minorCivID )

end
Controls.UnitGiftButton:RegisterCallback( Mouse.eLClick, OnGiftUnit )

----------------------------------------------------------------
-- Gift Improvement
----------------------------------------------------------------
function OnGiftTileImprovement()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()

	if gk_mode and minorPlayer:CanMajorGiftTileImprovement(activePlayerID) then
		OnCloseButtonClicked()
		UI.SetInterfaceMode( InterfaceModeTypes.INTERFACEMODE_GIFT_TILE_IMPROVEMENT )
		UI.SetInterfaceModeValue( g_minorCivID )
	end
end
Controls.TileImprovementGiftButton:RegisterCallback( Mouse.eLClick, OnGiftTileImprovement )

----------------------------------------------------------------
-- Close Give Submenu
----------------------------------------------------------------
function OnCloseGive()
	Controls.GiveStackCSD:SetHide(true);
	Controls.GiveStack:SetHide(true)
	Controls.PietyGiftStack:SetHide(true)
	Controls.TakeStack:SetHide(true)
	Controls.ButtonStack:SetHide(false)
	UpdateButtonStack()
end
Controls.ExitGiveButton:RegisterCallback( Mouse.eLClick, OnCloseGive )
Controls.PietyGiftBackButton:RegisterCallback( Mouse.eLClick, OnCloseGive )

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- TAKE MENU
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function PopulateTakeChoices()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()
	local buttonText = ""
	local ttText = ""

	buttonText = Locale.Lookup("TXT_KEY_POPUP_MINOR_BULLY_GOLD_AMOUNT",
			minorPlayer:GetMinorCivBullyGoldAmount(activePlayerID),
			gk_mode and (-GameDefines.MINOR_FRIENDSHIP_DROP_BULLY_GOLD_SUCCESS / 100) or 0 )
	if minorPlayer.GetMajorBullyGoldDetails then
		ttText = minorPlayer:GetMajorBullyGoldDetails(activePlayerID)
	else
		ttText = Locale.Lookup("TXT_KEY_POP_CSTATE_BULLY_GOLD_TT")
	end
	if (not minorPlayer:CanMajorBullyGold(activePlayerID)) then
		buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
		Controls.GoldTributeAnim:SetHide(true)
	else
		Controls.GoldTributeAnim:SetHide(false)
	end
	Controls.GoldTributeLabel:SetText(buttonText)
	Controls.GoldTributeButton:SetToolTipString(ttText)
	SetButtonSize(Controls.GoldTributeLabel, Controls.GoldTributeButton, Controls.GoldTributeAnim, Controls.GoldTributeButtonHL)

	local sBullyUnit = GameInfo.Units.UNIT_WORKER.Description
	buttonText = Locale.Lookup("TXT_KEY_POPUP_MINOR_BULLY_UNIT_AMOUNT", sBullyUnit, gk_mode and (-GameDefines.MINOR_FRIENDSHIP_DROP_BULLY_WORKER_SUCCESS / 100) or 0 )
	if minorPlayer.GetMajorBullyUnitDetails then
		ttText = minorPlayer:GetMajorBullyUnitDetails(activePlayerID)
	else
		ttText = Locale.Lookup("TXT_KEY_POP_CSTATE_BULLY_UNIT_TT", sBullyUnit, 4 )
	end
	if (not minorPlayer:CanMajorBullyUnit(activePlayerID)) then
		buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
		Controls.UnitTributeAnim:SetHide(true)
	else
		Controls.UnitTributeAnim:SetHide(false)
	end
	Controls.UnitTributeLabel:SetText(buttonText)
	Controls.UnitTributeButton:SetToolTipString(ttText)
	SetButtonSize(Controls.UnitTributeLabel, Controls.UnitTributeButton, Controls.UnitTributeAnim, Controls.UnitTributeButtonHL)

	UpdateButtonStack()
end

----------------------------------------------------------------
-- Bully Action
----------------------------------------------------------------
function BullyAction( action )

	local minorPlayer = Players[g_minorCivID]
	if not minorPlayer then
		return
	end
	m_pendingAction = action

	local listofProtectingCivs = {}
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do

		pOtherPlayer = Players[iPlayerLoop]

		-- Don't test protection status with active player!
		if iPlayerLoop ~= Game.GetActivePlayer() and pOtherPlayer:IsAlive() and pOtherPlayer:IsProtectingMinor(g_minorCivID) then
--todo remove unknowns
			table.insert( listofProtectingCivs, Players[iPlayerLoop]:GetCivilizationShortDescription() )
		end
	end

	local cityStateName = Locale.Lookup(minorPlayer:GetCivilizationShortDescriptionKey())

	local bullyConfirmString
	if action == kiDeclaredWar then
		if #listofProtectingCivs >= 1 then
			bullyConfirmString = L("TXT_KEY_CONFIRM_WAR_PROTECTED_CITY_STATE", cityStateName ) .. " " .. table.concat(listofProtectingCivs, ", ")
		else
			bullyConfirmString = cityStateName .. ": " .. L("TXT_KEY_CONFIRM_WAR")
		end
	else
		if #listofProtectingCivs == 1 then
			bullyConfirmString = L("TXT_KEY_CONFIRM_BULLY_PROTECTED_CITY_STATE", cityStateName, listofProtectingCivs[1])
		elseif #listofProtectingCivs > 1 then
			bullyConfirmString = L("TXT_KEY_CONFIRM_BULLY_PROTECTED_CITY_STATE_MULTIPLE", cityStateName, table.concat(listofProtectingCivs, ", "))
		else
			bullyConfirmString = L("TXT_KEY_CONFIRM_BULLY", cityStateName)
		end
	end

	Controls.BullyConfirmLabel:SetText( bullyConfirmString )
	Controls.BullyConfirm:SetHide(false)
	Controls.BGBlock:SetHide(true)
end


----------------------------------------------------------------
-- Take Gold
----------------------------------------------------------------
function OnGoldTributeButtonClicked()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()

	if minorPlayer:CanMajorBullyGold(activePlayerID) then
		BullyAction( kiBulliedGold )
		OnCloseTake()
	end
end
Controls.GoldTributeButton:RegisterCallback( Mouse.eLClick, OnGoldTributeButtonClicked )

----------------------------------------------------------------
-- Take Unit
----------------------------------------------------------------
function OnUnitTributeButtonClicked()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()

	if minorPlayer:CanMajorBullyUnit(activePlayerID) then
		BullyAction( kiBulliedUnit )
		OnCloseTake()
	end
end
Controls.UnitTributeButton:RegisterCallback( Mouse.eLClick, OnUnitTributeButtonClicked )

----------------------------------------------------------------
-- Close Take Submenu
----------------------------------------------------------------
function OnCloseTake()
	Controls.GiveStackCSD:SetHide(true)
	Controls.GiveStack:SetHide(true)
	Controls.TakeStack:SetHide(true)
	Controls.ButtonStack:SetHide(false)
	UpdateButtonStack()
end
Controls.ExitTakeButton:RegisterCallback( Mouse.eLClick, OnCloseTake )

-------------------------------------------------------------------------------
-- Bully Action Confirmation
-------------------------------------------------------------------------------
function OnYesBully( )
	local activePlayerID = Game.GetActivePlayer()
	if m_pendingAction == kiBulliedGold then
		Game.DoMinorBullyGold( activePlayerID, g_minorCivID )

	elseif m_pendingAction == kiBulliedUnit then
		Game.DoMinorBullyUnit( activePlayerID, g_minorCivID )

	elseif m_pendingAction == kiDeclaredWar then
		Network.SendChangeWar( g_minorCivTeamID, true )
		if not gk_mode then
			Network.SendPledgeMinorProtection( g_minorCivID, false ) -- does not seem to work in 1.0.3.144
		end
	else
		print("Scripting error - Selected Yes for bully confirmation dialog, with invalid PendingAction type")
	end
	m_lastAction = m_pendingAction
	m_pendingAction = kiNoAction

	Controls.BullyConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
end
Controls.YesBully:RegisterCallback( Mouse.eLClick, OnYesBully )

function OnNoBully( )
	m_lastAction = kiNoAction
	m_pendingAction = kiNoAction
	Controls.BullyConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
end
Controls.NoBully:RegisterCallback( Mouse.eLClick, OnNoBully )
