-------------------------------------------------
-- New Era Popup
-------------------------------------------------
include("JFD_CulDivUtilities")
local m_PopupInfo = nil;
local lastBackgroundImage = "ERA_Medievel.dds"

-------------------------------------------------
-- On Popup
-------------------------------------------------
function OnPopup( popupInfo )

	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_NEW_ERA ) then
		return;
	end

	m_PopupInfo = popupInfo;

    local iEra = popupInfo.Data1;
	Controls.DescriptionLabel:LocalizeAndSetText("TXT_KEY_POP_NEW_ERA_DESCRIPTION", GameInfo.Eras[iEra].Description);
	
	local strEra = GameInfo.Eras[iEra].Type;
	
	-- Change Image for Era
	if (strEra == "ERA_MEDIEVAL") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Medievel");
	elseif (strEra == "ERA_CLASSICAL") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Classical");
	elseif (strEra == "ERA_RENAISSANCE") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Renissance");
	elseif (strEra == "ERA_ENLIGHTENMENT") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Enlightenment");
	elseif (strEra == "ERA_INDUSTRIAL") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Industrial");
	elseif (strEra == "ERA_MODERN") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Modern");
	elseif (strEra == "ERA_POSTMODERN") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Atomic");
	elseif (strEra == "ERA_FUTURE") then
		lastBackgroundImage = JFD_GetCultureSplashScreen("Future");
	end
	Controls.EraImage:SetTexture(lastBackgroundImage);
	
	UIManager:QueuePopup( ContextPtr, PopupPriority.NewEraPopup );
end
Events.SerialEventGameMessagePopup.Add( OnPopup );


----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
    UIManager:DequeuePopup( ContextPtr );
    Controls.EraImage:UnloadTexture();
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    if( not bInitState ) then
       Controls.EraImage:UnloadTexture();
       if( not bIsHide ) then
        	Controls.EraImage:SetTexture(lastBackgroundImage);
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_NEW_ERA, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnClose);
