--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDSlaveryCore= (Game.GetUserSetting("JFD_CID_SLAVERY_CORE") == 1)
--=======================================================================================================================
--=======================================================================================================================
-------------------------------------------------
-- Barbarian Camp Popup
-------------------------------------------------

local m_PopupInfo = nil;

-------------------------------------------------
-------------------------------------------------
function OnPopup( popupInfo )

	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_BARBARIAN_CAMP_REWARD ) then
		return;
	end

	m_PopupInfo = popupInfo;

    local iNumGold = popupInfo.Data1;
	local iNumShackles = Players[Game.GetActivePlayer()]:GetNumShacklesFromBarbarianCampCleared()
	
	if userSettingCIDSlaveryCore and iNumShackles > 0 then
		Controls.DescriptionLabel:SetText(Locale.ConvertTextKey("TXT_KEY_BARB_CAMP_CLEARED_JFD_SLAVERY", iNumGold, iNumShackles));
	else
		Controls.DescriptionLabel:SetText(Locale.ConvertTextKey("TXT_KEY_BARB_CAMP_CLEARED", iNumGold));
	end
	
	UIManager:QueuePopup( ContextPtr, PopupPriority.BarbarianCamp );
end
Events.SerialEventGameMessagePopup.Add( OnPopup );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnCloseButtonClicked ()
	UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnCloseButtonClicked );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnCloseButtonClicked();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_BARBARIAN_CAMP_REWARD, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnCloseButtonClicked);
