-- CityStateInteractions
-- Global Variables
--=======================================================================================================================

g_CurrentMenu = "BaseMenu"
g_Interactions = {}
g_Interactions.BaseMenu = {}

local L = Locale.ConvertTextKey

-------------------------------------------------
-- Back
-- It's a commonly used action, so let's make it global
-------------------------------------------------
tBackInteraction = {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			tInstance.InteractionLabel:SetText(L("TXT_KEY_BACK_BUTTON"))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			g_CurrentMenu = "BaseMenu"
			OnDisplay()
		end,

	ID = "Back"
}
--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Give a Gift
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			tInstance.InteractionLabel:SetText(L("TXT_KEY_POP_CSTATE_GIFT_GOLD"))
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_GIFT_GOLD_TT"))
			tInstance.InteractionButton:SetHide(tInfo.War)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			g_CurrentMenu = "GiveMenu"
			OnDisplay()
		end,
		
	ID = "GiveMenu"

	}
)
-------------------------------------------------
-- Pledge to Protect
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local sText = ""
			local sTT = ""
			local pMinor = Players[iMinor]
			local bEnabled = true

			-- Revoke Protection
			if tInfo.Guardian then

				sText = Locale.Lookup("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION")
				sTT = Locale.Lookup("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION_TT")				
				bEnabled = pMinor:CanMajorWithdrawProtection(iActivePlayer)

				if not bEnabled then
					sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]"
					local iTurnsCommitted = (pMinor:GetTurnLastPledgedProtectionByMajor(iActivePlayer) + GameDefines.BALANCE_MINOR_PROTECTION_MINIMUM_DURATION) - Game.GetGameTurn();
					-- local iTurnsCommitted = (pMinor:GetTurnLastPledgedProtectionByMajor(iActivePlayer) + 10) - Game.GetGameTurn()
					sTT = sTT .. L("TXT_KEY_POP_CSTATE_REVOKE_PROTECTION_DISABLED_COMMITTED_TT", iTurnsCommitted)
				end
			-- Pledge Protection
			else
				sText = L("TXT_KEY_POP_CSTATE_PLEDGE_TO_PROTECT")
				sTT = L("TXT_KEY_POP_CSTATE_PLEDGE_TT", GameDefines.MINOR_FRIENDSHIP_ANCHOR_MOD_PROTECTED, GameDefines.BALANCE_MINOR_PROTECTION_MINIMUM_DURATION, GameDefines.BALANCE_INFLUENCE_BOOST_PROTECTION_MINOR, GameDefines.BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS, GameDefines.BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS_MAX)
				bEnabled = pMinor:CanMajorStartProtection(iActivePlayer)

				if not bEnabled then
					sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]"
					sTT = sTT .. pMinor:GetPledgeProtectionInvalidReason(iActivePlayer);
					-- sTT = "[COLOR_WARNING_TEXT]" .. sTT .. "[ENDCOLOR]";
					local iLastTurnPledgeBroken = pMinor:GetTurnLastPledgeBrokenByMajor(iActivePlayer)
					if (iLastTurnPledgeBroken >= 0) then -- (-1) means never happened
						local iTurnsUntilRecovered = (iLastTurnPledgeBroken + 20) - Game.GetGameTurn()
						sTT = sTT .. L("TXT_KEY_POP_CSTATE_PLEDGE_DISABLED_MISTRUST_TT", iTurnsUntilRecovered)
					else
						-- local iMinimumInfForPledge = GameDefines["FRIENDSHIP_THRESHOLD_CAN_PLEDGE_TO_PROTECT"]
						-- sTT = sTT .. L("TXT_KEY_POP_CSTATE_PLEDGE_DISABLED_INFLUENCE_TT", iMinimumInfForPledge)
					end					
				end
			end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(sTT)
			tInstance.InteractionButton:SetDisabled(not bEnabled)
			tInstance.InteractionAnim:SetHide(not bEnabled)
			tInstance.InteractionButton:SetHide(tInfo.War)			
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]

			-- Revoke Protection
			if tInfo.Guardian then
				if gk_mode and pMinor:CanMajorWithdrawProtection(iActivePlayer) then
					m_LastAction = "MESSAGE_REVOKE_PROTECTION"
					Game.DoMinorPledgeProtection(iActivePlayer, iMinor, false)
				end				
			-- Pledge Protection
			else
				if pMinor:CanMajorStartProtection( iActivePlayer ) then
					m_LastAction = "MESSAGE_PLEDGE_PROTECTION"
					Game.DoMinorPledgeProtection( iActivePlayer, iMinor, true )
				end
			end

			print("m_LastAction changed to " .. m_LastAction)

		end,
		
	ID = "PledgetoProtect"
	
	}
)
-------------------------------------------------
-- Ask for Tribute
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			tInstance.InteractionLabel:SetText(L("TXT_KEY_POP_CSTATE_BULLY"))
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_BULLY_TT"))
			tInstance.InteractionButton:SetHide(tInfo.War)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			g_CurrentMenu = "TakeMenu"
			OnDisplay()
		end,
		
	ID = "TakeMenu"
	
	}
)
-------------------------------------------------
-- Declare War
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			tInstance.InteractionLabel:SetText(L("TXT_KEY_POP_CSTATE_DECLARE_WAR"))
			tInstance.InteractionButton:SetHide(tInfo.War or (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_PEACE)) or (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_CHANGING_WAR_PEACE)))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			if bnw_mode then
				local pMinor = Players[iMinor]
				local iMinorTeam = pMinor:GetTeam()				
				UI.AddPopup{ Type = ButtonPopupTypes.BUTTONPOPUP_DECLAREWARMOVE, Data1 = iMinorTeam, Option1 = true}
				-- force a refresh
				m_OldLastAction = ""
			else
				BullyAction( "MESSAGE_AT_WAR" )
			end
		end,
		
	ID = "DeclareWar"
	
	}
)
-------------------------------------------------
-- Make Peace
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			tInstance.InteractionLabel:SetText(L("TXT_KEY_POP_CSTATE_MAKE_PEACE"))
			tInstance.InteractionButton:SetHide(not(tInfo.War) or (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_WAR)) or (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_CHANGING_WAR_PEACE)))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			m_LastAction = "MESSAGE_MAKE_PEACE"
			local pMinor = Players[iMinor]
			local iMinorTeam = pMinor:GetTeam()	
			Network.SendChangeWar(iMinorTeam, false)
		end,
		
	ID = "MakePeace"
	
	}
)
----------------------------------------------------------------
-- Stop/Start Unit Spawning
----------------------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			if tInfo.Friends and pMinor:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC then

				local strSpawnText
				local bSpawningDisabled = pMinor:IsMinorCivUnitSpawningDisabled(iActivePlayer)
				
				if (bSpawningDisabled) then
					strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_ON")
				else
					strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_OFF")
				end

				tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_STOP_UNITS_TT"))
				tInstance.InteractionLabel:SetText(strSpawnText)

				return
			end
			tInstance.InteractionButton:SetHide(true)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			local pMinor = Players[iMinor]

			local bSpawningDisabled = pMinor:IsMinorCivUnitSpawningDisabled(iActivePlayer)
			Network.SendMinorNoUnitSpawning(iMinor, not(bSpawningDisabled))

			local strSpawnText
			if (not(bSpawningDisabled)) then
				strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_ON")
			else
				strSpawnText = L("TXT_KEY_CITY_STATE_TURN_SPAWNING_OFF")
			end
			tInstance.InteractionLabel:SetText(strSpawnText)

		end,
		
	ID = "UnitSpawning"
	
	}
)
-------------------------------------------------
-- Marriage (Vanilla Austria)
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local bWar = tInfo.War
			local iBuyoutCost = pMinor:GetBuyoutCost(iActivePlayer)
			local strButtonLabel = L( "TXT_KEY_POP_CSTATE_BUYOUT")
			local strToolTip = L("TXT_KEY_POP_CSTATE_BUYOUT_TT", iBuyoutCost)

			if pMinor:CanMajorBuyout(iActivePlayer) and not bWar then
				tInstance.InteractionButton:SetHide(false)
				tInstance.InteractionAnim:SetHide(false)
			elseif (Players[iActivePlayer]:IsAbleToAnnexCityStates() and not bWar) then
				if (pMinor:GetAlly() == iActivePlayer) then
					local iAllianceTurns = pMinor:GetAlliedTurns()
					strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]"
					strToolTip = L("TXT_KEY_POP_CSTATE_BUYOUT_DISABLED_ALLY_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iAllianceTurns, iBuyoutCost)
				else
					strButtonLabel = "[COLOR_WARNING_TEXT]" .. strButtonLabel .. "[ENDCOLOR]"
					strToolTip = L("TXT_KEY_POP_CSTATE_BUYOUT_DISABLED_TT", GameDefines.MINOR_CIV_BUYOUT_TURNS, iBuyoutCost)
				end
				tInstance.InteractionButton:SetHide(false)
				tInstance.InteractionAnim:SetHide(true)
			else
				tInstance.InteractionButton:SetHide(true)
			end
			tInstance.InteractionLabel:SetText( strButtonLabel )
			tInstance.InteractionButton:SetToolTipString( strToolTip )

		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)
			local pMinor = Players[iMinor]

			if gk_mode and pMinor:CanMajorBuyout(iActivePlayer) then
				OnClose()
				Game.DoMinorBuyout(iActivePlayer, iMinor)
			end

		end,
		
	ID = "AustriaUA"
	
	}
)
--=======================================================================================================================
-- GIVE MENU ACTIONS
--=======================================================================================================================

g_Interactions.GiveMenu = {}

local iGoldGiftLarge = GameDefines["MINOR_GOLD_GIFT_LARGE"]
local iGoldGiftMedium = GameDefines["MINOR_GOLD_GIFT_MEDIUM"]
local iGoldGiftSmall = GameDefines["MINOR_GOLD_GIFT_SMALL"]

-------------------------------------------------
-- Small Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, iGoldGiftSmall)
			local bGiftDisabled = (iGold < iGoldGiftSmall)
			local sText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGoldGiftSmall, iFriendshipAmount)
			if bGiftDisabled then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_GOLD_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			if (iGold >= iGoldGiftSmall) then
				Game.DoMinorGoldGift(iMinor, iGoldGiftSmall)
				m_LastAction = "MESSAGE_GOLD_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
		
	ID = "SmallGift"
	
	}
)
-------------------------------------------------
-- Medium Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, iGoldGiftMedium)
			local bGiftDisabled = (iGold < iGoldGiftMedium)
			local sText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGoldGiftMedium, iFriendshipAmount)
			if bGiftDisabled then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_GOLD_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			if (iGold >= iGoldGiftMedium) then
				Game.DoMinorGoldGift(iMinor, iGoldGiftMedium)
				m_LastAction = "MESSAGE_GOLD_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
		
	ID = "MediumGift"
	
	}
)
-------------------------------------------------
-- Large Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, iGoldGiftLarge)
			local bGiftDisabled = (iGold < iGoldGiftLarge)
			local sText = L("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGoldGiftLarge, iFriendshipAmount)
			if bGiftDisabled then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_GOLD_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pPlayer = Players[tInfo.Player]
			local iGold = pPlayer:GetGold()
			if (iGold >= iGoldGiftLarge) then
				Game.DoMinorGoldGift(iMinor, iGoldGiftLarge)
				m_LastAction = "MESSAGE_GOLD_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
		
	ID = "LargeGift"
	
	}
)
-------------------------------------------------
-- Unit Gift
-------------------------------------------------
if bnw_mode then
table.insert(g_Interactions.GiveMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local iInfluence = pMinor:GetFriendshipFromUnitGift(tInfo.Player, false, true)
			local iTravelTurns = GameDefines.MINOR_UNIT_GIFT_TRAVEL_TURNS
			local buttonText = L("TXT_KEY_POP_CSTATE_GIFT_UNIT", iInfluence)
			local tooltipText = L("TXT_KEY_POP_CSTATE_GIFT_UNIT_TT", iTravelTurns, iInfluence)

			if pMinor:GetIncomingUnitCountdown(tInfo.Player) >= 0 then
				buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
				tInstance.InteractionButton:ClearCallback( Mouse.eLClick )
			else
				tInstance.InteractionAnim:SetHide(false)
				tInstance.InteractionButton:RegisterCallback( Mouse.eLClick, OnGiftUnit )
			end
			tInstance.InteractionLabel:SetText(buttonText)
			tInstance.InteractionButton:SetToolTipString(tooltipText)
		end,
		
	ID = "UnitGift"
	
	}
)
end
-------------------------------------------------
-- Improvement Gift
-------------------------------------------------
if gk_mode then
table.insert(g_Interactions.GiveMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]

			iGold = pMinor:GetGiftTileImprovementCost(tInfo.Player)
			local buttonText = L("TXT_KEY_POPUP_MINOR_GIFT_TILE_IMPROVEMENT", iGold)
			if not pMinor:CanMajorGiftTileImprovement(tInfo.Player) then
				buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
				tInstance.InteractionButton:ClearCallback( Mouse.eLClick )
			else
				tInstance.InteractionAnim:SetHide(false)
				tInstance.InteractionButton:RegisterCallback( Mouse.eLClick, OnGiftTileImprovement )
			end
			tInstance.InteractionLabel:SetText(buttonText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_POP_CSTATE_GIFT_TILE_IMPROVEMENT_TT"))
		end,
		
	ID = "ImprovementGift"
	
	}
)
end
-------------------------------------------------
-- Back
-------------------------------------------------
table.insert(g_Interactions.GiveMenu, tBackInteraction)

--=======================================================================================================================
-- TAKE MENU ACTIONS
--=======================================================================================================================

g_Interactions.TakeMenu = {}

-------------------------------------------------
-- Take Gold
-------------------------------------------------
table.insert(g_Interactions.TakeMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local sText = ""
			local sTT = ""

			sText = Locale.Lookup("TXT_KEY_POPUP_MINOR_BULLY_GOLD_AMOUNT",
				pMinor:GetMinorCivBullyGoldAmount(iActivePlayer),
				gk_mode and (-GameDefines.MINOR_FRIENDSHIP_DROP_BULLY_GOLD_SUCCESS / 100) or 0
			)
			if pMinor.GetMajorBullyGoldDetails then
				sTT = pMinor:GetMajorBullyGoldDetails(iActivePlayer)
			else
				sTT = Locale.Lookup("TXT_KEY_POP_CSTATE_BULLY_GOLD_TT")
			end

			if (not pMinor:CanMajorBullyGold(iActivePlayer)) then
				sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
			else
				tInstance.InteractionAnim:SetHide(false)
			end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(sTT)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local minorPlayer = Players[iMinor]
			if minorPlayer:CanMajorBullyGold(iActivePlayer) then
				BullyAction( "MESSAGE_BULLIED_GOLD" )

				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
		
	ID = "TakeGold"
	
	}
)
-------------------------------------------------
-- Take Unit
-------------------------------------------------
table.insert(g_Interactions.TakeMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local sText = ""
			local sTT = ""

			local sBullyUnit = GameInfo.Units.UNIT_WORKER.Description
			sText = Locale.Lookup("TXT_KEY_POPUP_MINOR_BULLY_UNIT_AMOUNT", sBullyUnit, gk_mode and (-GameDefines.MINOR_FRIENDSHIP_DROP_BULLY_WORKER_SUCCESS / 100) or 0 )
			if pMinor.GetMajorBullyUnitDetails then
				sTT = pMinor:GetMajorBullyUnitDetails(iActivePlayer)
			else
				sTT = Locale.Lookup("TXT_KEY_POP_CSTATE_BULLY_UNIT_TT", sBullyUnit, 4 )
			end
			if (not pMinor:CanMajorBullyUnit(iActivePlayer)) then
				sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
			else
				tInstance.InteractionAnim:SetHide(false)
			end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(sTT)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local minorPlayer = Players[iMinor]
			if minorPlayer:CanMajorBullyUnit(iActivePlayer) then
				BullyAction( "MESSAGE_BULLIED_UNIT" )

				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
		
	ID = "TakeUnit"
	
	}
)
-------------------------------------------------
-- Back
-------------------------------------------------
table.insert(g_Interactions.TakeMenu, tBackInteraction)
--=======================================================================================================================
-- INHERITED CODE
-- This is code inherited from the original screen, because I'm too lazy to rewrite all this.
--=======================================================================================================================
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
end
-------------------------------------------------------------------------------
-- Bully Action Confirmation
-------------------------------------------------------------------------------
function OnYesBully( )
	local activePlayerID = Game.GetActivePlayer()
	if m_pendingAction == "MESSAGE_BULLIED_GOLD" then
		m_LastAction = m_pendingAction
		m_pendingAction = ""	
		Game.DoMinorBullyGold( activePlayerID, g_minorCivID )
	elseif m_pendingAction == "MESSAGE_BULLIED_UNIT" then
		m_LastAction = m_pendingAction
		m_pendingAction = ""	
		Game.DoMinorBullyUnit( activePlayerID, g_minorCivID )
	elseif m_pendingAction == "MESSAGE_AT_WAR" then
		Network.SendChangeWar( g_minorCivTeamID, true )
		if not gk_mode then
			m_LastAction = m_pendingAction
			m_pendingAction = ""			
			Network.SendPledgeMinorProtection( g_minorCivID, false ) -- does not seem to work in 1.0.3.144
		end
	else
		print("Scripting error - Selected Yes for bully confirmation dialog, with invalid PendingAction type")
	end

	Controls.BullyConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
end
Controls.YesBully:RegisterCallback( Mouse.eLClick, OnYesBully )

function OnNoBully( )
	m_pendingAction = ""
	Controls.BullyConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
end
Controls.NoBully:RegisterCallback( Mouse.eLClick, OnNoBully )
----------------------------------------------------------------
-- Gift Unit
----------------------------------------------------------------
function OnGiftUnit()

	OnClose()
	UI.SetInterfaceMode( InterfaceModeTypes.INTERFACEMODE_GIFT_UNIT )
	UI.SetInterfaceModeValue( g_minorCivID )

end
----------------------------------------------------------------
-- Gift Improvement
----------------------------------------------------------------
function OnGiftTileImprovement()
	local minorPlayer = Players[g_minorCivID]
	local activePlayerID = Game.GetActivePlayer()

	if gk_mode and minorPlayer:CanMajorGiftTileImprovement(activePlayerID) then
		OnClose()
		UI.SetInterfaceMode( InterfaceModeTypes.INTERFACEMODE_GIFT_TILE_IMPROVEMENT )
		UI.SetInterfaceModeValue( g_minorCivID )
	end
end
--=======================================================================================================================
--=======================================================================================================================