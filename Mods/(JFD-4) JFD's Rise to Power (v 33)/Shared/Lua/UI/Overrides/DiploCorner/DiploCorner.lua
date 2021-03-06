-------------------------------------------------
-- Diplomacy and Advisors Buttons that float out in the screen
-------------------------------------------------
include( "IconSupport" );
include( "SupportFunctions"  );
include( "InstanceManager" );
include( "JFD_CIDUtilities.lua" );
include( "JFD_RTPUtils.lua" );
include( "JFD_PietyUtils.lua" );
local g_ChatInstances = {};

local g_iChatTeam   = -1;
local g_iChatPlayer = -1;

local g_iLocalPlayer = Game.GetActivePlayer();
local g_pLocalPlayer = Players[ g_iLocalPlayer ];
local g_iLocalTeam = g_pLocalPlayer:GetTeam();
local g_pLocalTeam = Teams[ g_iLocalTeam ];
local g_DiploCornerManager = InstanceManager:new("DiploCornerButton", "Button", Controls.DiploButtonStack)

local m_bChatOpen = not Controls.ChatPanel:IsHidden();

local isUsingDecisions = JFD_IsUsingEventsDecisions()
-------------------------------------------------
-------------------------------------------------
-- This method refreshes the entries that are in the additional information dropdown.
-- Modders can use the Lua event "AdditionalInformationDropdownGatherEntries" to 
-- add entries to the list.

function RefreshAdditionalInformationEntries()

	local function Popup(popupType, data1, data2)
		Events.SerialEventGameMessagePopup{ 
			Type = popupType,
			Data1 = data1,
			Data2 = data2
		};
	end

	local additionalEntries = {
		{ text = Locale.Lookup("TXT_KEY_ADVISOR_COUNSEL"),                  call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_ADVISOR_COUNSEL); end};
		{ text = Locale.Lookup("TXT_KEY_ADVISOR_SCREEN_TECH_TREE_DISPLAY"), call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, nil, -1); end };
		{ text = Locale.Lookup("TXT_KEY_DIPLOMACY_OVERVIEW"),               call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_DIPLOMATIC_OVERVIEW); end };
		{ text = Locale.Lookup("TXT_KEY_MILITARY_OVERVIEW"),                call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_MILITARY_OVERVIEW); end };
		{ text = Locale.Lookup("TXT_KEY_ECONOMIC_OVERVIEW"),                call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW); end };
		{ text = Locale.Lookup("TXT_KEY_VP_TT"),                            call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_VICTORY_INFO); end };
		{ text = Locale.Lookup("TXT_KEY_DEMOGRAPHICS"),                     call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_DEMOGRAPHICS); end };
		{ text = Locale.Lookup("TXT_KEY_POP_NOTIFICATION_LOG"),             call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_NOTIFICATION_LOG,Game.GetActivePlayer()); end };
		{ text = Locale.Lookup("TXT_KEY_TRADE_ROUTE_OVERVIEW"),             call=function() Popup(ButtonPopupTypes.BUTTONPOPUP_TRADE_ROUTE_OVERVIEW); end };
	};

	-- Obtain any modder/dlc entries.
	LuaEvents.AdditionalInformationDropdownGatherEntries(additionalEntries);
	
	-- Now that we have all entries, call methods to sort them
	LuaEvents.AdditionalInformationDropdownSortEntries(additionalEntries);

	Controls.MultiPull:ClearEntries();
	g_DiploCornerManager:ResetInstances()
	Controls.MultiPull:RegisterSelectionCallback(function(id)
		local entry = additionalEntries[id];
		if(entry and entry.call ~= nil) then
			entry.call();
		end
	end);
		 
	local numCustomIcons = 0
	for i,v in ipairs(additionalEntries) do
		local controlTable = {};
		Controls.MultiPull:BuildEntry( "InstanceOne", controlTable );

		controlTable.Button:SetText( v.text );
		controlTable.Button:LocalizeAndSetToolTip( v.tip );
		controlTable.Button:SetVoid1(i);

		if v.forceDisplay then
			numCustomIcons = numCustomIcons + 1
			g_DiploCornerManager:BuildInstance()
			local instance = g_DiploCornerManager:GetInstance()
			instance.Button:SetTexture(v.art)
			instance.Button:RegisterCallback( Mouse.eLClick, v.call )
			instance.Button:SetToolTipString( v.text )
		end
	end

	Controls.DiploAdditionalButton:SetOffsetX(6)
	if numCustomIcons < 1 then Controls.DiploAdditionalButton:SetOffsetX(0) end

	Controls.DiploButtonStack:CalculateSize()
	Controls.DiploButtonStack:ReprocessAnchoring()
	Controls.DiploButtonStack:SetHide(numCustomIcons < 1)
	Controls.LargeButtonStack:CalculateSize()
	Controls.LargeButtonStack:ReprocessAnchoring()

	-- STYLE HACK
	-- The grid has a nice little footer that will overlap entries if it is not resized to be larger than everything else.
	Controls.MultiPull:CalculateInternals();
	local dropDown = Controls.MultiPull;
	local width, height = dropDown:GetGrid():GetSizeVal();
	dropDown:GetGrid():SetSizeVal(width, height+100);
end
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries.Add(RefreshAdditionalInformationEntries);

function SortAdditionalInformationDropdownEntries(entries)
	table.sort(entries, function(a,b)
		return (Locale.Compare(a.text, b.text) == -1);
	end);
end
LuaEvents.AdditionalInformationDropdownSortEntries.Add(SortAdditionalInformationDropdownEntries);

-------------------------------------------------
-------------------------------------------------
function OnAdvisorsOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_ADVISOR_COUNSEL,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.AdvisorsCounselButton:RegisterCallback( Mouse.eLClick, OnAdvisorsOverview );

function OnCorporationsOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_MODDER_5,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.CorporationsOverviewButton:RegisterCallback( Mouse.eLClick, OnCorporationsOverview );

function OnCultureOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.CultureOverviewButton:RegisterCallback( Mouse.eLClick, OnCultureOverview );

function OnDecisionsOverview()
	LuaEvents.OnEnactDecisionsPopup()
end
Controls.DecisionsButton:RegisterCallback( Mouse.eLClick, OnDecisionsOverview );

function OnDemographicsOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_DEMOGRAPHICS,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.DemographicsButton:RegisterCallback( Mouse.eLClick, OnDemographicsOverview );

function OnEspionageButton()
	Events.SerialEventGameMessagePopup{ 
		Type = ButtonPopupTypes.BUTTONPOPUP_ESPIONAGE_OVERVIEW,
	};
end
Controls.EspionageButton:RegisterCallback(Mouse.eLClick, OnEspionageButton);

function OnEconomicOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.EconomicOverviewButton:RegisterCallback( Mouse.eLClick, OnEconomicOverview );

function OnEventsOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_MODDER_6,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.EventsOverviewButton:RegisterCallback( Mouse.eLClick, OnEventsOverview );

function OnGreatWorksManager()
   LuaEvents.GreatWorkmanagerDisplay()
end
Controls.GreatWorksManagerButton:RegisterCallback( Mouse.eLClick, OnGreatWorksManager );

function OnGovernmentOverview()
	LuaEvents.JFD_RTP_Sovereignty_ShowGovernmentOverview()
end
Controls.GovernmentOverviewButton:RegisterCallback( Mouse.eLClick, OnGovernmentOverview );

function OnInfoAddict()
   UIManager:PushModal(MapModData.InfoAddict.InfoAddictScreenContext)
end
Controls.InfoAddictButton:RegisterCallback( Mouse.eLClick, OnInfoAddict );

function OnMercenariesOverview()
	LuaEvents.JFD_RTP_Mercenaries_ShowMercenaryOverview()
end
Controls.MercenariesOverviewButton:RegisterCallback( Mouse.eLClick, OnMercenariesOverview );

function OnMilitaryOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_MILITARY_OVERVIEW,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.MilitaryOverviewButton:RegisterCallback( Mouse.eLClick, OnMilitaryOverview );

function OnNotificationOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_NOTIFICATION_LOG,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.NotificationLogButton:RegisterCallback( Mouse.eLClick, OnNotificationOverview );

function OnReligionOverviewButton()
	Events.SerialEventGameMessagePopup{ 
		Type = ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW,
	};
end
Controls.ReligionOverviewButton:RegisterCallback(Mouse.eLClick, OnReligionOverviewButton);

function OnTradeRoutesOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_TRADE_ROUTE_OVERVIEW, nil, -1,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.TradeRoutesOverviewButton:RegisterCallback( Mouse.eLClick, OnTradeRoutesOverview );

function OnVassalsOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_MODDER_11,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.VassalsOverviewButton:RegisterCallback( Mouse.eLClick, OnVassalsOverview );

function OnVictoryOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_VICTORY_INFO,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.VictoryProgressButton:RegisterCallback( Mouse.eLClick, OnVictoryOverview );

function OnWorldCongressOverview()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_LEAGUE_OVERVIEW,
	}
	Events.SerialEventGameMessagePopup(popupInfo);

end
Controls.WorldCongressButton:RegisterCallback( Mouse.eLClick, OnWorldCongressOverview );
-------------------------------------------------
-- On ChatToggle
-------------------------------------------------
function OnChatToggle()

	m_bChatOpen = not m_bChatOpen;

	if( m_bChatOpen ) then
		Controls.ChatPanel:SetHide( false );
		Controls.ChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOn.dds" );
		Controls.HLChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOffHL.dds" );
		Controls.MOChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOff.dds" );
	else
		Controls.ChatPanel:SetHide( true );
		Controls.ChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOff.dds" );
		Controls.HLChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOnHL.dds" );
		Controls.MOChatToggle:SetTexture( "assets/UI/Art/Icons/MainChatOn.dds" );
	end

	LuaEvents.ChatShow( m_bChatOpen );
end
Controls.ChatToggle:RegisterCallback( Mouse.eLClick, OnChatToggle );


-------------------------------------------------
-------------------------------------------------
local bFlipper = false;
function OnChat( fromPlayer, toPlayer, text, eTargetType )

	local controlTable = {};
	ContextPtr:BuildInstanceForControl( "ChatEntry", controlTable, Controls.ChatStack );
  
	table.insert( g_ChatInstances, controlTable );
	if( #g_ChatInstances > 100 ) then
		Controls.ChatStack:ReleaseChild( g_ChatInstances[ 1 ].Box );
		table.remove( g_ChatInstances, 1 );
	end
	
	TruncateString( controlTable.String, 200, Players[fromPlayer]:GetNickName() );
	local fromName = controlTable.String:GetText();
	
	if( eTargetType == ChatTargetTypes.CHATTARGET_TEAM ) then
		controlTable.String:SetColorByName( "Green_Chat" );
		controlTable.String:SetText( fromName .. ": " .. text ); 
		
	elseif( eTargetType == ChatTargetTypes.CHATTARGET_PLAYER ) then
	
		local toName;
		if( toPlayer == g_iLocalPlayer ) then
			toName = Locale.ConvertTextKey( "TXT_KEY_YOU" );
		else
			TruncateString( controlTable.String, 200, Players[toPlayer]:GetNickName() );
			toName = Locale.ConvertTextKey( "TXT_KEY_DIPLO_TO_PLAYER", controlTable.String:GetText() );
		end
		controlTable.String:SetText( fromName .. " (" .. toName .. "): " .. text ); 
		controlTable.String:SetColorByName( "Magenta_Chat" );
		
	elseif( fromPlayer == g_iLocalPlayer ) then
		controlTable.String:SetColorByName( "Gray_Chat" );
		
		controlTable.String:SetText( fromName .. ": " .. text ); 
	else
		controlTable.String:SetText( fromName .. ": " .. text ); 
	end
	  
	controlTable.Box:SetSizeY( controlTable.String:GetSizeY() + 8 );
	controlTable.Box:ReprocessAnchoring();

	if( bFlipper ) then
		controlTable.Box:SetColorChannel( 3, 0.4 );
	end
	bFlipper = not bFlipper;
	
	Events.AudioPlay2DSound( "AS2D_IF_MP_CHAT_DING" );      

	Controls.ChatStack:CalculateSize();
	Controls.ChatScroll:CalculateInternalSize();
	Controls.ChatScroll:SetScrollValue( 1 );
end
Events.GameMessageChat.Add( OnChat );


-------------------------------------------------
-------------------------------------------------
function SendChat( text )
	if( string.len( text ) > 0 ) then
		Network.SendChat( text, g_iChatTeam, g_iChatPlayer );
	end
	Controls.ChatEntry:ClearString();
end
Controls.ChatEntry:RegisterCallback( SendChat );

-------------------------------------------------
-------------------------------------------------
function ShowHideInviteButton()
	local bShow = PreGame.IsInternetGame();
	Controls.MPInvite:SetHide( not bShow );
end

-------------------------------------------------
-- On MPInvite
-------------------------------------------------
function OnMPInvite()
	Steam.ActivateInviteOverlay();  
end
Controls.MPInvite:RegisterCallback( Mouse.eLClick, OnMPInvite );

----------------------------------------------------------------
----------------------------------------------------------------
function OnPlayerDisconnect( playerID )
	if( ContextPtr:IsHidden() == false ) then
		ShowHideInviteButton();
	end
end
Events.MultiplayerGamePlayerDisconnected.Add( OnPlayerDisconnect );

-------------------------------------------------
-------------------------------------------------
function ShowHideHandler( bIsHide )
	Controls.CornerAnchor:SetHide( false );
	
	if(not bIsHide) then
		ShowHideInviteButton();
		LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();
	end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

-------------------------------------------------
-------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
	if( m_bChatOpen 
		and uiMsg == KeyEvents.KeyUp
		and wParam == Keys.VK_TAB ) then
		Controls.ChatEntry:TakeFocus();
		return true;
	end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnSocialPoliciesClicked()
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY } );
end
Controls.SocialPoliciesButton:RegisterCallback( Mouse.eLClick, OnSocialPoliciesClicked );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnDiploClicked()
	Controls.DiploList:SetHide( not Controls.DiploList:IsHidden() );
	-- Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_DIPLOMACY } );
end
Controls.DiploButton:RegisterCallback( Mouse.eLClick, OnDiploClicked );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnOpenPlayerDealScreen( iOtherPlayer )
	local iUs = Game.GetActivePlayer();
	local iUsTeam = Players[ iUs ]:GetTeam();
	local pUsTeam = Teams[ iUsTeam ];

	-- any time we're legitimately opening the pvp deal screen, make sure we hide the diplolist.
	local iOtherTeam = Players[iOtherPlayer]:GetTeam();
	local iProposalTo = UI.HasMadeProposal( iUs );
   
	  -- this logic should match OnOpenPlayerDealScreen in TradeLogic.lua, DiploCorner.lua, and DiploList.lua  
	if( (pUsTeam:IsAtWar( iOtherTeam ) and (g_bAlwaysWar or g_bNoChangeWar) ) or                                                                                     -- Always at War
		(iProposalTo ~= -1 and iProposalTo ~= iOtherPlayer and not UI.ProposedDealExists(iOtherPlayer, iUs)) ) then -- Only allow one proposal from us at a time.
		-- do nothing
		return;
	else
		Controls.CornerAnchor:SetHide( true );
	end

end
Events.OpenPlayerDealScreenEvent.Add( OnOpenPlayerDealScreen );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnChatTarget( iTeam, iPlayer )
	g_iChatTeam = iTeam;
	g_iChatPlayer = iPlayer;

	if( iTeam ~= -1 ) then
		TruncateString( Controls.LengthTest, Controls.ChatPull:GetSizeX(), Locale.ConvertTextKey("TXT_KEY_DIPLO_TO_TEAM"));
		Controls.ChatPull:GetButton():SetText( Controls.LengthTest:GetText() );
	else
		if( iPlayer ~= -1 ) then
			TruncateString( Controls.LengthTest, Controls.ChatPull:GetSizeX(), Locale.ConvertTextKey("TXT_KEY_DIPLO_TO_PLAYER", Players[ iPlayer ]:GetNickName()));
			Controls.ChatPull:GetButton():SetText( Controls.LengthTest:GetText() );
		else
			Controls.ChatPull:GetButton():LocalizeAndSetText( "TXT_KEY_DIPLO_TO_ALL" );
		end
	end
end
Controls.ChatPull:RegisterSelectionCallback( OnChatTarget );


-------------------------------------------------------
-------------------------------------------------------
function PopulateChatPull()

	Controls.ChatPull:ClearEntries();

	-------------------------------------------------------
	-- Add All Entry
	local controlTable = {};
	Controls.ChatPull:BuildEntry( "InstanceOne", controlTable );
	controlTable.Button:SetVoids( -1, -1 );
	local textControl = controlTable.Button:GetTextControl();
	textControl:LocalizeAndSetText( "TXT_KEY_DIPLO_TO_ALL" );


	-------------------------------------------------------
	-- See if Team has more than 1 other human member
	local iTeamCount = 0;
	for iPlayer = 0, GameDefines.MAX_PLAYERS do
		local pPlayer = Players[iPlayer];

		if( iPlayer ~= g_iLocalPlayer and pPlayer ~= nil and pPlayer:IsHuman() and pPlayer:GetTeam() == g_iLocalTeam ) then
			iTeamCount = iTeamCount + 1;
		end
	end

	if( iTeamCount > 0 ) then
		local controlTable = {};
		Controls.ChatPull:BuildEntry( "InstanceOne", controlTable );
		controlTable.Button:SetVoids( g_iLocalTeam, -1 );
		local textControl = controlTable.Button:GetTextControl();
		textControl:LocalizeAndSetText( "TXT_KEY_DIPLO_TO_TEAM" );
	end


	-------------------------------------------------------
	-- Humans
	for iPlayer = 0, GameDefines.MAX_PLAYERS do
		local pPlayer = Players[iPlayer];

		if( iPlayer ~= g_iLocalPlayer and pPlayer ~= nil and pPlayer:IsHuman() ) then

			controlTable = {};
			Controls.ChatPull:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetVoids( -1, iPlayer );
			textControl = controlTable.Button:GetTextControl();
			TruncateString( textControl, Controls.ChatPull:GetSizeX()-20, Locale.ConvertTextKey("TXT_KEY_DIPLO_TO_PLAYER", pPlayer:GetNickName()));
		end
	end
	
	Controls.ChatPull:GetButton():LocalizeAndSetText( "TXT_KEY_DIPLO_TO_ALL" );
	Controls.ChatPull:CalculateInternals();
end
Events.MultiplayerGamePlayerUpdated.Add(PopulateChatPull);


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function DoUpdateLeagueCountdown()
	local bHide = true;
	local sTooltip = Locale.ConvertTextKey("TXT_KEY_EO_DIPLOMACY");
				
	if (Game.GetNumActiveLeagues() > 0) then
		local pLeague = Game.GetActiveLeague();
		if (pLeague ~= nil) then
			local iCountdown = pLeague:GetTurnsUntilSession();
			if (iCountdown ~= 0 and not pLeague:IsInSession()) then
				bHide = false;
				if (PreGame.IsVictory(GameInfo.Victories["VICTORY_DIPLOMATIC"].ID) and Game.IsUnitedNationsActive() and Game.GetGameState() == GameplayGameStateTypes.GAMESTATE_ON) then
					local iCountdownToVictorySession = pLeague:GetTurnsUntilVictorySession();
					if (iCountdownToVictorySession <= iCountdown) then
						Controls.UNTurnsLabel:SetText("[COLOR_POSITIVE_TEXT]" .. iCountdownToVictorySession .. "[ENDCOLOR]");
					else
						Controls.UNTurnsLabel:SetText(iCountdown);
					end
					sTooltip = Locale.ConvertTextKey("TXT_KEY_EO_DIPLOMACY_AND_VICTORY_SESSION", iCountdown, iCountdownToVictorySession);
				else
					Controls.UNTurnsLabel:SetText(iCountdown);
					sTooltip = Locale.ConvertTextKey("TXT_KEY_EO_DIPLOMACY_AND_LEAGUE_SESSION", iCountdown);
				end
			end
		end
	end
	
	Controls.UNTurnsLabel:SetHide(bHide);
	Controls.DiploButton:SetToolTipString(sTooltip);
end
Events.SerialEventGameDataDirty.Add(DoUpdateLeagueCountdown);

-- Also call it once so it starts correct - surprisingly enough, GameData isn't dirtied as we're loading a game
DoUpdateLeagueCountdown();

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function DoUpdateEspionageButton()
	local iLocalPlayer = Game.GetActivePlayer();
	local pLocalPlayer = Players[iLocalPlayer];
	local iNumUnassignedSpies = pLocalPlayer:GetNumUnassignedSpies();
	
	local strToolTip = Locale.ConvertTextKey("TXT_KEY_EO_TITLE");
	
	if (iNumUnassignedSpies > 0) then
		strToolTip = strToolTip .. "[NEWLINE][NEWLINE]";
		strToolTip = strToolTip .. Locale.ConvertTextKey("TXT_KEY_EO_UNASSIGNED_SPIES_TT", iNumUnassignedSpies);
		Controls.UnassignedSpiesLabel:SetHide(false);
		Controls.UnassignedSpiesLabel:SetText(iNumUnassignedSpies);
	else
		Controls.UnassignedSpiesLabel:SetHide(true);
	end
	
	Controls.EspionageButton:SetToolTipString(strToolTip);
end
Events.SerialEventEspionageScreenDirty.Add(DoUpdateEspionageButton);

--------------------------------------------------------------------
function HandleNotificationAdded(notificationId, notificationType, toolTip, summary, gameValue, extraGameData)
	
	-- In the event we receive a new spy, make sure the large button is displayed.
	if(ContextPtr:IsHidden() == false) then
		if(notificationType == NotificationTypes.NOTIFICATION_SPY_CREATED_ACTIVE_PLAYER) then
			CheckEspionageStarted();
		end
	end
end
Events.NotificationAdded.Add(HandleNotificationAdded);

DoUpdateEspionageButton();

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
if( Game.IsGameMultiPlayer() ) then
	PopulateChatPull();

	if ( not Game.IsHotSeat() ) then
		Controls.ChatToggle:SetHide( false );
		OnChatToggle();
	end
end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnEndGameButton()

	local which = math.random( 1, 6 );
	
	if( which == 1 ) then Events.EndGameShow( EndGameTypes.Technology, Game.GetActivePlayer() ); 
	elseif( which == 2 ) then Events.EndGameShow( EndGameTypes.Domination, Game.GetActivePlayer() );
	elseif( which == 3 ) then Events.EndGameShow( EndGameTypes.Culture, Game.GetActivePlayer() );
	elseif( which == 4 ) then Events.EndGameShow( EndGameTypes.Diplomatic, Game.GetActivePlayer() );
	elseif( which == 5 ) then Events.EndGameShow( EndGameTypes.Time, Game.GetActivePlayer() );
	elseif( which == 6 ) then Events.EndGameShow( EndGameTypes.Time, Game.GetActivePlayer() + 1 ); 
	end
end
Controls.EndGameButton:RegisterCallback( Mouse.eLClick, OnEndGameButton );

local g_PerPlayerState = {};
----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnDiploCornerActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	-- Restore the state per player
	local bIsHidden = Controls.DiploList:IsHidden() == true;
	-- Save the state per player
	if (iPrevActivePlayer ~= -1) then
		g_PerPlayerState[ iPrevActivePlayer + 1 ] = bIsHidden;
	end
	
	if (iActivePlayer ~= -1) then
		if (g_PerPlayerState[ iActivePlayer + 1 ] == nil or g_PerPlayerState[ iActivePlayer + 1 ] == -1) then
			Controls.DiploList:SetHide( true );
		else
			local bWantHidden = g_PerPlayerState[ iActivePlayer + 1 ];
			if ( bWantHidden ~= Controls.DiploList:IsHidden()) then
				Controls.DiploList:SetHide( bWantHidden );
			end
		end
	end

	g_iLocalPlayer = Game.GetActivePlayer();
	g_pLocalPlayer = Players[ g_iLocalPlayer ];
	g_iLocalTeam = g_pLocalPlayer:GetTeam();
	g_pLocalTeam = Teams[ g_iLocalTeam ];
	PopulateChatPull();
end
Events.GameplaySetActivePlayer.Add(OnDiploCornerActivePlayerChanged);


function CheckEspionageStarted()
	function TestEspionageStarted()
		local player = Players[Game.GetActivePlayer()];
		return player:GetNumSpies() > 0;
	end

	local bEspionageStarted = TestEspionageStarted();
	Controls.CornerAnchor:SetHide(bEspionageStarted);
	Controls.CornerAnchor_Espionage:SetHide(not bEspionageStarted);
	Controls.EspionageButton:SetHide(not bEspionageStarted);
	if(bEspionageStarted) then
		DoUpdateEspionageButton();
	end
end

function OnActivePlayerTurnStart()
	CheckEspionageStarted();
	
end
Events.ActivePlayerTurnStart.Add(OnActivePlayerTurnStart);


OnActivePlayerTurnStart();
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--Hide Corporation Overview, if disabled.
if (not JFD_IsUsingCBP()) then
	Controls.CorporationsOverviewButton:SetHide(true);
end

--Hide Culture Overview, if disabled.
if(Game.IsOption("GAMEOPTION_NO_CULTURE_OVERVIEW_UI")) then
	Controls.CultureOverviewButton:SetHide(true);
end

--Hide Decisions Overview, if disabled.
if (not isUsingDecisions) then
	Controls.DecisionsButton:SetHide(true)
end

--Hide Events Overview, if disabled
if (not Game.IsOption("GAMEOPTION_EVENTS")) then
	Controls.EventsOverviewButton:SetHide(true)
end

--Hide Great Works Manager, if disabled
if (not JFD_IsUsingGreatWorksManager()) then
	Controls.GreatWorksManagerButton:SetHide(true);
end

--Hide Government Overview, if disabled.
if (JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 0 or (not JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE"))) then
	Controls.GovernmentOverviewButton:SetHide(true)
end

--Hide Mercenaries Overview, if disabled.
if (JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE") == 0 or (not JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE"))) then
	Controls.MercenariesOverviewButton:SetHide(true)
end

--Hide Religion Overview, if disabled.
if(Game.IsOption("GAMEOPTION_NO_RELIGION")) then
	Controls.ReligionOverviewButton:SetHide(true);
end

--Hide Vassal Overview, if disabled.
if(Game.IsOption("GAMEOGAMEOPTION_NO_VASSALAGE")) then
	Controls.VassalsOverviewButton:SetHide(true);
end

--Hide World Congress, if disabled.
if (Game.IsOption("GAMEOPTION_NO_LEAGUES")) then
	Controls.WorldCongressButton:SetHide(true);
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function RefreshButtons()
	Controls.AdvisorsCounselButton:SetHide(not Controls.Advisors:IsChecked());
	Controls.CorporationsOverviewButton:SetHide(not Controls.Corporations:IsChecked());
	Controls.DemographicsButton:SetHide(not Controls.Demographics:IsChecked());
	Controls.EconomicOverviewButton:SetHide(not Controls.Economic:IsChecked());
	Controls.EventsOverviewButton:SetHide(not Controls.Events:IsChecked());
	Controls.CultureOverviewButton:SetHide(not Controls.Culture:IsChecked());
	Controls.InfoAddictButton:SetHide(not Controls.InfoAddict:IsChecked());
	Controls.GreatWorksManagerButton:SetHide(not Controls.GreatWorks:IsChecked());
	Controls.MercenariesOverviewButton:SetHide(not Controls.Mercenaries:IsChecked());
	Controls.MilitaryOverviewButton:SetHide(not Controls.Military:IsChecked());
	Controls.NotificationLogButton:SetHide(not Controls.Notifications:IsChecked());
	Controls.ReligionOverviewButton:SetHide(not Controls.Religion:IsChecked());
	Controls.SocialPoliciesButton:SetHide(not Controls.Policies:IsChecked());
	Controls.TradeRoutesOverviewButton:SetHide(not Controls.TradeRoutes:IsChecked());
	Controls.VassalsOverviewButton:SetHide(not Controls.Vassals:IsChecked());
	Controls.VictoryProgressButton:SetHide(not Controls.Victory:IsChecked());
	Controls.WorldCongressButton:SetHide(not Controls.WorldCongress:IsChecked());
end

function OnOpenOptions()
	Controls.OptionsBoxBlock:SetHide(false)
	Controls.OptionsBox:SetHide(false)
	if (not JFD_IsUsingCBP()) then
		Controls.Corporations:SetDisabled(true)
		Controls.Corporations:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if (Game.IsOption("GAMEOPTION_NO_CULTURE_OVERVIEW_UI")) then
		Controls.Culture:SetDisabled(true)
		Controls.Culture:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if (not Game.IsOption("GAMEOPTION_EVENTS")) then
		Controls.Events:SetDisabled(true)
		Controls.Events:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if (not JFD_IsUsingGreatWorksManager()) then
		Controls.GreatWorks:SetDisabled(true)
		Controls.GreatWorks:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if(not JFD_IsUsingInfoAddict()) then
		Controls.InfoAddict:SetDisabled(true)
		Controls.InfoAddict:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if (JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE") == 0 or (not JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE"))) then
		Controls.Mercenaries:SetCheck(false)
		Controls.Mercenaries:SetDisabled(true)
		Controls.Mercenaries:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if(Game.IsOption("GAMEOPTION_NO_RELIGION")) then
		Controls.Religion:SetCheck(false)
		Controls.Religion:SetDisabled(true)
		Controls.Religion:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if(Game.IsOption("GAMEOPTION_NO_VASSALAGE")) or (not JFD_IsUsingCIVDiplo()) then
		Controls.Vassals:SetDisabled(true)
		Controls.Vassals:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if (Game.IsOption("GAMEOPTION_NO_LEAGUES")) then
		Controls.WorldCongress:SetDisabled(true)
		Controls.WorldCongress:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
end

function OnCloseOptions()
	Controls.OptionsBoxBlock:SetHide(true)
	Controls.OptionsBox:SetHide(true)
	RefreshButtons()
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnCloseOptions);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
function RefreshYields()
	ContextPtr:LookUpControl("/InGame/TopPanel/CultureString"):SetHide(not Controls.Culture:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetHide(not Controls.Gold:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/FaithString"):SetHide(not Controls.Faith:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/SciencePerTurn"):SetHide(not Controls.Science:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldenAgeString"):SetHide(not Controls.GoldenAgePoints:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/HappinessString"):SetHide(not Controls.Happiness:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/InternationalTradeRoutes"):SetHide(not Controls.TradeRoute:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/CurrentTime"):SetHide(not Controls.Time:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/CurrentTurn"):SetHide(not Controls.Turn:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/CurrentDate"):SetHide(not Controls.Date:IsChecked())
	ContextPtr:LookUpControl("/InGame/TopPanel/TourismString"):SetHide(not Controls.Tourism:IsChecked())
	if JFD_GetUserSetting("JFD_RTP_PROSPERITY_CORE") == 1 then
		if activePlayer:HasCurrency() then
			ContextPtr:LookUpControl("/InGame/TopPanel/ProsperityBox"):SetHide(not Controls.Prosperity:IsChecked())
		else
			ContextPtr:LookUpControl("/InGame/TopPanel/ProsperityBox"):SetHide(true)
		end
	end
	if JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1 then
		if activePlayer:HasGovernment() then
			ContextPtr:LookUpControl("/InGame/TopPanel/SovereigntyString"):SetHide(not Controls.Sovereignty:IsChecked())
		else
			ContextPtr:LookUpControl("/InGame/TopPanel/SovereigntyString"):SetHide(true)
		end
	end
	if JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1 then
		if activePlayer:HasStateReligion() then
			ContextPtr:LookUpControl("/InGame/TopPanel/PietyString"):SetHide(not Controls.Piety:IsChecked())
		else
			ContextPtr:LookUpControl("/InGame/TopPanel/PietyString"):SetHide(true)
		end
	end
end

function OnOpenTopPanelOptions()
	Controls.TopPanelOptionsBoxBlock:SetHide(false)
	Controls.TopPanelOptionsBox:SetHide(false)
	if JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 0 or (not activePlayer:HasStateReligion()) then
		Controls.Piety:SetCheck(false)
		Controls.Piety:SetDisabled(true)
		Controls.Piety:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if JFD_GetUserSetting("JFD_RTP_PROSPERITY_CORE") == 0 or (not activePlayer:HasCurrency()) then
		Controls.Prosperity:SetCheck(false)
		Controls.Prosperity:SetDisabled(true)
		Controls.Prosperity:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
	if JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 0 or (not activePlayer:HasGovernment()) then
		Controls.Sovereignty:SetCheck(false)
		Controls.Sovereignty:SetDisabled(true)
		Controls.Sovereignty:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_DISABLED")
	end
end

function OnCloseTopPanelOptions()
	Controls.TopPanelOptionsBoxBlock:SetHide(true)
	Controls.TopPanelOptionsBox:SetHide(true)
	RefreshYields();
end
Controls.TopPanelCloseButton:RegisterCallback(Mouse.eLClick, OnCloseTopPanelOptions);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries,
	{
	text = Locale.ConvertTextKey("TXT_KEY_JFD_OVERVIEW_OPTIONS"), 
	call = OnOpenOptions
	}
	)
	table.insert(additionalEntries,
	{
	text = Locale.ConvertTextKey("TXT_KEY_JFD_TOP_PANEL_OPTIONS"), 
	call = OnOpenTopPanelOptions
	}
	)
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
function OnRightClickPiety()
	if activePlayer:HasStateReligion() then
		if Controls.PietyTurns:IsHidden() then
			Controls.PietyTurns:SetHide(false)
		else
			Controls.PietyTurns:SetHide(true)
		end
	else
		Controls.PietyTurns:SetHide(true)
	end
end
Controls.ReligionOverviewButton:RegisterCallback(Mouse.eRClick, OnRightClickPiety);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
function OnRightClickPolicies()
	if Controls.SocialPolicyTurns:IsHidden() then
		Controls.SocialPolicyTurns:SetHide(false)
	else
		Controls.SocialPolicyTurns:SetHide(true)
	end
end
Controls.SocialPoliciesButton:RegisterCallback(Mouse.eRClick, OnRightClickPolicies);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnRightClickDecisions()
	if Controls.DecisionsEnactable:IsHidden() then
		Controls.DecisionsEnactable:SetHide(false)
	else
		Controls.DecisionsEnactable:SetHide(true)
	end
end
Controls.DecisionsButton:RegisterCallback(Mouse.eRClick, OnRightClickDecisions);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
local governmentDictatorshipID = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
function OnRightClickGovernment()
	if (activePlayer:HasGovernment() and activePlayer:GetGovernment() ~= governmentDictatorshipID) then
		if Controls.GovernmentCooldown:IsHidden() then
			Controls.GovernmentCooldown:SetHide(false)
			Controls.ReformCooldown:SetHide(true)
		else
			Controls.GovernmentCooldown:SetHide(true)
			Controls.ReformCooldown:SetHide(false)
		end
	elseif activePlayer:GetGovernment() == governmentDictatorshipID then
		Controls.GovernmentCooldown:SetHide(true)
		Controls.ReformCooldown:SetHide(false)
	else
		Controls.GovernmentCooldown:SetHide(true)
		Controls.ReformCooldown:SetHide(true)
	end
end
Controls.GovernmentOverviewButton:RegisterCallback(Mouse.eRClick, OnRightClickGovernment);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function DoUpdateOverviewButtons()
	--if isUsingDecisions then
	--  local enactableDecisions = JFD_GetNumEnactableDecisions(activePlayerID)
	--  Controls.DecisionsEnactable:SetText(enactableDecisions)
	--  Controls.DecisionsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_DECISIONS_OVERVIEW_SCREEN_TITLE_TT", enactableDecisions)
	--end
		
	if activePlayer:HasGovernment() then
		local govtCooldown = activePlayer:GetGovernmentCooldown()
		local reformCooldown = activePlayer:GetReformCooldown()
		Controls.GovernmentCooldown:SetText(govtCooldown)
		Controls.ReformCooldown:SetText(reformCooldown)
		Controls.GovernmentOverviewButton:LocalizeAndSetToolTip("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_SCREEN_TITLE_TT", reformCooldown, govtCooldown)
		Controls.GovernmentCooldown:SetHide(true)
		Controls.ReformCooldown:SetHide(false)
	end

	if activePlayer:HasStateReligion() then
		if activePlayer:GetPietyRate() == 0 then
			local pietyTurns = "?"
			Controls.PietyTurns:SetText(pietyTurns)
			Controls.PietyTurns:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_RELIGION_TURNS_TT", pietyTurns)
		else
			local pietyTurns = JFD_GetTurnsUntilPietyLevelDrop(Game.GetActivePlayer())
			Controls.PietyTurns:SetText(pietyTurns)
			Controls.PietyTurns:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_RELIGION_TURNS_TT", pietyTurns)
		end
	else
		Controls.PietyTurns:SetHide(true)
	end
	
	local policyTurns = 0
	local cultureNeeded = (activePlayer:GetNextPolicyCost()-activePlayer:GetJONSCulture())
	if (cultureNeeded <= 0) then
		policyTurns = 0
	else
		if activePlayer:GetTotalJONSCulturePerTurn() == 0 then
			policyTurns = "?"
		else
			policyTurns = cultureNeeded / activePlayer:GetTotalJONSCulturePerTurn()
			policyTurns = math.ceil(policyTurns)
		end
	end
	Controls.SocialPolicyTurns:LocalizeAndSetText(policyTurns)
	Controls.SocialPolicyTurns:LocalizeAndSetToolTip("TXT_KEY_JFD_BUTTON_OPTIONS_POLICIES_TURNS_TT", policyTurns)
end
Events.SerialEventGameDataDirty.Add(DoUpdateOverviewButtons)
RefreshButtons()