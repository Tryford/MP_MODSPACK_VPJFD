-- CAPTURE CITY POPUP
-- This popup occurs when a city is capture and must be annexed or puppeted.
------------------------------
-- JFD
------------------------------
include("JFD_ChurchStates_Utils.lua")
include("JFD_CID_MiscUtils.lua")
include("JFD_CID_SlaveryUtils.lua")
local userSettingColoniesCore   = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingHappinessCore  = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingMiscSatellites = JFD_GetUserSetting("JFD_CID_MISC_SATELLITES") == 1
local userSettingSlaveryCore 	= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE") == 1
local userSettingSlaveryCoreEnslavement	= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE_ENSLAVEMENT") == 1
local defineInfluenceFromStallite = GameDefines["JFD_CID_INFLUENCE_FROM_STALLITE"]
------------------------------
-- JFD
------------------------------

PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_CITY_CAPTURED] = function(popupInfo)

	local cityID				= popupInfo.Data1;
	local iCaptureGold			= popupInfo.Data2;
	local iCaptureCulture		= popupInfo.Data3;
	local iCaptureGreatWorks    = popupInfo.Data4;
	local iLiberatedPlayer		= popupInfo.Data5;
	local bMinorCivBuyout		= popupInfo.Option1;
	local bConquest				= popupInfo.Option2;
	
	local activePlayerID = Game.GetActivePlayer();
	local activePlayer	 = Players[activePlayerID];
	local newCity		 = activePlayer:GetCityByID(cityID);
	
	if newCity == nil then
		return false;
	end

	local isCityColony = false
	if userSettingColoniesCore then
		isCityColony = JFD_IsCityColony(newCity)
	end
	
	local iPreviousOwner = newCity:GetPreviousOwner();
	
	-- Initialize popup text.	
	local cityNameKey = newCity:GetNameKey();
	if (iCaptureCulture > 0 or iCaptureGold > 0 or iCaptureGreatWorks > 0) then
	    if (iCaptureCulture >0 or iCaptureGreatWorks > 0) then
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_GOLD_AND_CULTURE_CITY_CAPTURE", iCaptureGold, iCaptureCulture, iCaptureGreatWorks, cityNameKey);
	    else
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_GOLD_CITY_CAPTURE", iCaptureGold, cityNameKey);
		end
	else
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO_GOLD_CITY_CAPTURE", cityNameKey);
	end
		
	-- Ask the player what he wants to do with this City
	popupText = popupText .. "  " .. Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO");
	
	SetPopupText(popupText);
	
	-- Calculate Happiness info
	local iUnhappinessNoCity = activePlayer:GetUnhappiness();
	local iUnhappinessAnnexedCity = activePlayer:GetUnhappinessForecast(newCity, nil);	-- pAssumeCityAnnexed, pAssumeCityPuppeted
	if (bMinorCivBuyout) then
		-- For minor civ buyout (Austria UA), there are no unhappiness benefits of annexing because the city is not occupied
		iUnhappinessAnnexedCity = activePlayer:GetUnhappinessForecast(nil, newCity);
	end
	local iUnhappinessPuppetCity = activePlayer:GetUnhappinessForecast(nil, newCity);		-- pAssumeCityAnnexed, pAssumeCityPuppeted
	
	local iUnhappinessForAnnexing = iUnhappinessAnnexedCity - iUnhappinessNoCity;
	local iUnhappinessForPuppeting = iUnhappinessPuppetCity - iUnhappinessNoCity;
	
	-- Initialize 'Liberate' button.
	if (iLiberatedPlayer ~= -1) then
		local OnLiberateClicked = function()
			Network.SendLiberateMinor(iLiberatedPlayer, cityID);
		end
		
		local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_LIBERATE_CITY");
		local strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_LIBERATE", Players[iLiberatedPlayer]:GetNameKey());
		strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
		strToolTip = strToolTip .. activePlayer:GetLiberationPreviewString(iLiberatedPlayer, newCity, newCity:IsCapital(), activePlayerID);
		AddButton(buttonText, OnLiberateClicked, strToolTip);
	end
	
	-- Initialize 'Annex' button.
	if (not isCityColony) then
		local OnCaptureClicked = function()
			Network.SendDoTask(cityID, TaskTypes.TASK_ANNEX_PUPPET, -1, -1, false, false, false, false);
			newCity:ChooseProduction();
		end
		
		if (not activePlayer:MayNotAnnex()) then
			local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_ANNEX_CITY");
			local strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_ANNEX", iUnhappinessForAnnexing);
			if (userSettingHappinessCore and userSettingSlaveryCoreEnslavement) then
				strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_CITY_CAPTURE_INFO_ANNEX", iUnhappinessForAnnexing, newCity:GetPopulation()*3);
			end
			if (newCity:GetOriginalOwner() ~= Game.GetActivePlayer() and bConquest == true) then
				strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
				strToolTip = strToolTip .. activePlayer:GetWarmongerPreviewString(iPreviousOwner, newCity, newCity:IsCapital(), Game.GetActivePlayer());
			end
			AddButton(buttonText, OnCaptureClicked, strToolTip);
		end
	end
		
	-- Initialize 'Puppet' button.
	local OnPuppetClicked = function()
		Network.SendDoTask(cityID, TaskTypes.TASK_CREATE_PUPPET, -1, -1, false, false, false, false);
	end
	
	buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_PUPPET_CAPTURED_CITY");
	strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_PUPPET", iUnhappinessForPuppeting);
	if isCityColony then
		buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_COLONY_CAPTURED_CITY");
		strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_JFD_COLONY", iUnhappinessForPuppeting);
	end
	if (newCity:GetOriginalOwner() ~= Game.GetActivePlayer() and bConquest == true) then
		strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
		strToolTip = strToolTip .. activePlayer:GetWarmongerPreviewString(iPreviousOwner, newCity, newCity:IsCapital(), Game.GetActivePlayer());
	end
	AddButton(buttonText, OnPuppetClicked, strToolTip);
	
	-- Initialize 'Satellite' button.
	if userSettingMiscSatellites then
		if Players[iPreviousOwner]:IsMinorCiv() then
			local OnSatelliteClicked = function()
				LuaEvents.JFD_SatelliteInstalled(Game.GetActivePlayer(), iPreviousOwner, cityID, newCity)
				UIManager:DequeuePopup(Controls.EmptyPopup)
			end
			buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_SATELLITE_CITY");
			strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_SATELLITE_CITY_TT", defineInfluenceFromStallite);
			if (newCity:GetOriginalOwner() ~= Game.GetActivePlayer() and bConquest == true) then
				strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
				strToolTip = strToolTip .. activePlayer:GetWarmongerPreviewString(iPreviousOwner, newCity, newCity:IsCapital(), Game.GetActivePlayer());
			end
			AddButton(buttonText, OnSatelliteClicked, strToolTip);
		end
	end
	
	-- Initialize 'Enslave' button.
	if (userSettingSlaveryCoreEnslavement and newCity:GetPopulation() > 1 and JFD_CanPurchaseSlaves(Game.GetActivePlayer())) then
		local OnEnslavementClicked = function()
			JFD_DoEnslaveCity(Game.GetActivePlayer(), newCity)
			if isCityColony then
				Network.SendDoTask(cityID, TaskTypes.TASK_CREATE_PUPPET, -1, -1, false, false, false, false);
			else
				Network.SendDoTask(cityID, TaskTypes.TASK_ANNEX_PUPPET, -1, -1, false, false, false, false);
				newCity:ChooseProduction();
			end
			UIManager:DequeuePopup(Controls.EmptyPopup)
		end
		buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_ENSLAVE_CITY");
		if (newCity:GetOriginalOwner() ~= Game.GetActivePlayer() and bConquest == true) then
			strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
			strToolTip = strToolTip .. activePlayer:GetWarmongerPreviewString(iPreviousOwner, newCity, newCity:IsCapital(), Game.GetActivePlayer());
		end
		AddButton(buttonText, OnEnslavementClicked, JFD_GetEnslaveTT(Game.GetActivePlayer(), newCity));
	end
	
	-- Initialize 'Raze' button.
	local bRaze = activePlayer:CanRaze(newCity);
	if (bRaze) then
		local OnRazeClicked = function()
			Network.SendDoTask(cityID, TaskTypes.TASK_RAZE, -1, -1, false, false, false, false);
		end
		
		buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_RAZE_CAPTURED_CITY");
		strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_RAZE", iUnhappinessForAnnexing);
		if (newCity:GetOriginalOwner() ~= Game.GetActivePlayer() and bConquest == true) then
			strToolTip = strToolTip .. "[NEWLINE][NEWLINE]"
			strToolTip = strToolTip .. activePlayer:GetWarmongerPreviewString(iPreviousOwner, newCity, newCity:IsCapital(), Game.GetActivePlayer());
		end
		AddButton(buttonText, OnRazeClicked, strToolTip);
	end

	-- CITY SCREEN CLOSED - Don't look, Marc
	local CityScreenClosed = function()
		UIManager:DequeuePopup(Controls.EmptyPopup);
		Events.SerialEventExitCityScreen.Remove(CityScreenClosed);
	end
	
	-- Initialize 'View City' button.
	local OnViewCityClicked = function()
		
		-- Queue up an empty popup at a higher priority so that it prevents other cities from appearing while we're looking at this one!
		UIManager:QueuePopup(Controls.EmptyPopup, PopupPriority.GenericPopup+1);
		
		Events.SerialEventExitCityScreen.Add(CityScreenClosed);
		
		UI.SetCityScreenViewingMode(true);
		UI.DoSelectCityAtPlot( newCity:Plot() );
	end
	
	buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_VIEW_CITY");
	strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_VIEW_CITY_DETAILS");
	AddButton(buttonText, OnViewCityClicked, strToolTip, true);	-- true is bPreventClose
end
