print("This is the JFD's Global Modded Top Panel")
-------------------------------
-- User Settings
-------------------------------
include("JFD_CID_LoyaltyUtils.lua");
include("JFD_CID_SlaveryUtils.lua");
include("JFD_RTPUtils.lua");
include("JFD_RTP_MercenariesUtils.lua");
include("JFD_PietyUtils.lua");
include("JFD_RTP_ProsperityUtils.lua");
include("JFD_RTP_SovereigntyUtils.lua");
include("JFD_TopPanelUtils.lua"); 
local isUsingCBP = JFD_IsUsingCBP()
local userSettingClock			    = JFD_GetUserSetting("JFD_RTP_MISC_CLOCK") == 1
local userSettingLoyaltyCoreGlobal	= JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_GLOBAL_MEASURE") == 1
local userSettingPietyCore			= JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
local userSettingMercenariesCore	= JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE") == 1 
local userSettingProsperityCore		= JFD_GetUserSetting("JFD_RTP_PROSPERITY_CORE") == 1 
local userSettingSlaveryCore		= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE") == 1 
local userSettingSovereigntyCore	= JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1 
--All CBP changes marked with CBP
--All JFD changes marked with JFD
-------------------------------
-- TopPanel.lua
-------------------------------
function UpdateData()

	local iPlayerID = Game.GetActivePlayer();

	if( iPlayerID >= 0 ) then
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
		
		if (pPlayer:GetNumCities() > 0) then
			
			Controls.TopPanelInfoStack:SetHide(false);
			
			if (pCity ~= nil and UI.IsCityScreenUp()) then		
				Controls.MenuButton:SetText(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_RETURN")));
				Controls.MenuButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_EXIT_TOOLTIP"));
			else
				Controls.MenuButton:SetText(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_MENU")));
				Controls.MenuButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_MENU_TOOLTIP"));
			end
			-----------------------------
			-- Update science stats
			-----------------------------
			local strScienceText;
			
			if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
				strScienceText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_SCIENCE_OFF");
			else
			
				local sciencePerTurn = pPlayer:GetScience();
				--===============================
				--JFD's Top Panel Addins BEGINS
				--===============================
				local tJFDAddins = JFD_GetYieldAddins("YIELD_SCIENCE")
				sciencePerTurn = sciencePerTurn + (tJFDAddins:YieldSum())
				--===============================
				--JFD's Top Panel Addins ENDS
				--===============================
				
				-- No Science
				if (sciencePerTurn <= 0) then
					strScienceText = string.format("[COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_NO_SCIENCE") .. "[/COLOR]");
				-- We have science
				else
					strScienceText = string.format("+%i", sciencePerTurn);

					local iGoldPerTurn = pPlayer:CalculateGoldRate();
					
					-- Gold being deducted from our Science
					if (pPlayer:GetGold() + iGoldPerTurn < 0) then
						strScienceText = "[COLOR:255:60:0:255]" .. strScienceText .. "[/COLOR]";
					-- Normal Science state
					else
						strScienceText = "[COLOR:33:190:247:255]" .. strScienceText .. "[/COLOR]";
					end
				end
			
				strScienceText = "[ICON_RESEARCH]" .. strScienceText;
			end
			
			Controls.SciencePerTurn:SetText(strScienceText);
			
			-----------------------------
			-- Update gold stats
			-----------------------------
			local iTotalGold = pPlayer:GetGold();
			local iGoldPerTurn = pPlayer:CalculateGoldRate();
			--===============================
			--JFD's Top Panel Addins BEGINS
			--===============================
			local tJFDAddins = JFD_GetYieldAddins("YIELD_GOLD")
			iGoldPerTurn = iGoldPerTurn + tJFDAddins:YieldSum()
			--===============================
			--JFD's Top Panel Addins ENDS
			--===============================	
			
			-- Accounting for positive or negative GPT - there's obviously a better way to do this.  If you see this comment and know how, it's up to you ;)
			-- Text is White when you can buy a Plot
			--if (iTotalGold >= pPlayer:GetBuyPlotCost(-1,-1)) then
				--if (iGoldPerTurn >= 0) then
					--strGoldStr = string.format("[COLOR:255:255:255:255]%i (+%i)[/COLOR]", iTotalGold, iGoldPerTurn)
				--else
					--strGoldStr = string.format("[COLOR:255:255:255:255]%i (%i)[/COLOR]", iTotalGold, iGoldPerTurn)
				--end
			---- Text is Yellow or Red when you can't buy a Plot
			--else
			local strGoldStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn);
			--end
			
			Controls.GoldPerTurn:SetText(strGoldStr);

			-----------------------------
			-- JFD Update prosperity stats 
			-----------------------------
			if userSettingProsperityCore then
				local strProsperityStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY", JFD_GetProsperityScore(iPlayerID))
				Controls.ProsperityScore:SetText(strProsperityStr);
				Controls.ProsperityScore:SetHide(false);
			end			
			-----------------------------
			-- Update international trade routes
			-----------------------------
			local iUsedTradeRoutes = pPlayer:GetNumInternationalTradeRoutesUsed();
			local iAvailableTradeRoutes = pPlayer:GetNumInternationalTradeRoutesAvailable();
			local strInternationalTradeRoutes = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_INTERNATIONAL_TRADE_ROUTES", iUsedTradeRoutes, iAvailableTradeRoutes);
			Controls.InternationalTradeRoutes:SetText(strInternationalTradeRoutes);
			
			-----------------------------
			-- Update Happiness
			-----------------------------
			local strHappiness;
			
			if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
				strHappiness = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_HAPPINESS_OFF");
			else
				local iHappiness = pPlayer:GetExcessHappiness();
				local tHappinessTextColor;

				-- Empire is Happiness
				if (not pPlayer:IsEmpireUnhappy()) then
					strHappiness = string.format("[ICON_HAPPINESS_1][COLOR:60:255:60:255]%i[/COLOR]", iHappiness);
				
				-- Empire Really Unhappy
				elseif (pPlayer:IsEmpireVeryUnhappy()) then
					strHappiness = string.format("[ICON_HAPPINESS_4][COLOR:255:60:60:255]%i[/COLOR]", -iHappiness);
				
				-- Empire Unhappy
				else
					strHappiness = string.format("[ICON_HAPPINESS_3][COLOR:255:60:60:255]%i[/COLOR]", -iHappiness);
				end
			end
			
			Controls.HappinessString:SetText(strHappiness);
			
			-----------------------------
			-- Update Golden Age Info
			-----------------------------
			local strGoldenAgeStr;

			if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
				strGoldenAgeStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLDEN_AGES_OFF");
			else
				if (pPlayer:GetGoldenAgeTurns() > 0) then
				    if (pPlayer:GetGoldenAgeTourismModifier() > 0) then
						strGoldenAgeStr = string.format(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_UNIQUE_GOLDEN_AGE_ANNOUNCE")) .. " (%i)", pPlayer:GetGoldenAgeTurns());
					else
						strGoldenAgeStr = string.format(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_GOLDEN_AGE_ANNOUNCE")) .. " (%i)", pPlayer:GetGoldenAgeTurns());
					end
				else
					local goldenAgePointsPerTurn = JFD_GetGoldenAgePointsPerTurn(iPlayerID) + JFD_GetYieldAddins("YIELD_GOLDEN_AGE"):YieldSum()
					if goldenAgePointsPerTurn >= 0 then
						strGoldenAgeStr = string.format("%i/%i (+%i)", pPlayer:GetGoldenAgeProgressMeter(), pPlayer:GetGoldenAgeProgressThreshold(), goldenAgePointsPerTurn);
					else
						strGoldenAgeStr = string.format("%i/%i ([COLOR_WARNING_TEXT]%i[ENDCOLOR])", pPlayer:GetGoldenAgeProgressMeter(), pPlayer:GetGoldenAgeProgressThreshold(), goldenAgePointsPerTurn);
					end
				end	
				strGoldenAgeStr = "[ICON_GOLDEN_AGE][COLOR:255:255:255:255]" .. strGoldenAgeStr .. "[/COLOR]";
			end
			
			

			Controls.GoldenAgeString:SetText(strGoldenAgeStr);
			
			-----------------------------
			-- Update Culture
			-----------------------------

			local strCultureStr;
			local iCulturePerTurn;
			
			if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_POLICIES)) then
				strCultureStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_POLICIES_OFF");
			else
				iCulturePerTurn = pPlayer:GetTotalJONSCulturePerTurn()
				--===============================
				--JFD's Top Panel Addins BEGINS
				--===============================
				local tJFDAddins = JFD_GetYieldAddins("YIELD_CULTURE")
				iCulturePerTurn = iCulturePerTurn + tJFDAddins:YieldSum()
				--===============================
				--JFD's Top Panel Addins ENDS
				--===============================	
				if (pPlayer:GetNextPolicyCost() > 0) then
					strCultureStr = string.format("%i/%i (+%i)", pPlayer:GetJONSCulture(), pPlayer:GetNextPolicyCost(), iCulturePerTurn);
				else
					strCultureStr = string.format("%i (+%i)", pPlayer:GetJONSCulture(), iCulturePerTurn);
				end
			
				strCultureStr = "[ICON_CULTURE][COLOR:255:0:255:255]" .. strCultureStr .. "[/COLOR]";
			end
			
			Controls.CultureString:SetText(strCultureStr);
			-----------------------------
			-- JFD Update Loyalty
			-----------------------------
			--if userSettingLoyaltyCoreGlobal then
			--	local strLoyaltyStr;
			--	local iLoyalty, pLoyaltyColour, pLoyaltyFontIcon = JFD_GetGlobalLoyalty(iPlayerID)
			--	strLoyaltyStr = Locale.ConvertTextKey("TXT_KEY_JFD_LOYALTY_TOP", pLoyaltyColour, pLoyaltyFontIcon, iLoyalty) 
			--	Controls.LoyaltyString:SetText(strLoyaltyStr);
			--	Controls.LoyaltyString:SetHide(false);
			--end

			-----------------------------
			-- JFD Update Sovereignty
			-----------------------------
			if userSettingSovereigntyCore then
				if pPlayer:HasGovernment() then
					local strSovereigntyStr;
					local iSovereignty = pPlayer:GetSovereignty()
					local pSovereigntyColour = "[COLOR_JFD_SOVEREIGNTY]"
					if iSovereignty < 50 then
						pSovereigntyColour = "[COLOR_JFD_SOVEREIGNTY_FADING]"
					end
					strSovereigntyStr = Locale.ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP", pSovereigntyColour, iSovereignty, JFD_GetMaxSovereignty(iPlayerID)) 
					Controls.SovereigntyString:SetText(strSovereigntyStr);
					Controls.SovereigntyString:SetHide(false);
				end
			end
			-----------------------------
			-- Update Tourism
			-----------------------------
			local strTourism;
			strTourism = string.format("[ICON_TOURISM] +%i", pPlayer:GetTourism());
			Controls.TourismString:SetText(strTourism);
			
			-----------------------------
			-- Update Piety
			-----------------------------
			if (userSettingPietyCore and pPlayer:HasStateReligion()) then
				local iPietyPerTurn;
				iPietyPerTurn = pPlayer:GetPietyRate()
				--===============================
				--JFD's Top Panel Addins BEGINS
				--===============================
				local tJFDAddins = JFD_GetYieldAddins("YIELD_JFD_PIETY")
				iPietyPerTurn = iPietyPerTurn + tJFDAddins:YieldSum()
				--===============================
				--JFD's Top Panel Addins ENDS
				--===============================	
				local strPietyStr = JFD_GetPietyTopPanelInfo(iPlayerID, iPietyPerTurn)
				Controls.PietyString:SetText(strPietyStr);
				Controls.PietyString:SetHide(false)
			else
				Controls.PietyString:SetHide(true)
			end
	
			-----------------------------
			-- Update Faith
			-----------------------------
			local strFaithStr;
			local iFaithPerTurn;
			if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
				strFaithStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_RELIGION_OFF");
			else
				iFaithPerTurn =pPlayer:GetTotalFaithPerTurn()
				--===============================
				--JFD's Top Panel Addins BEGINS
				--===============================
				local tJFDAddins = JFD_GetYieldAddins("YIELD_FAITH")
				iFaithPerTurn = iFaithPerTurn + tJFDAddins:YieldSum()
				--===============================
				--JFD's Top Panel Addins ENDS
				--===============================	
				strFaithStr = string.format("%i (+%i)", pPlayer:GetFaith(), iFaithPerTurn);
				strFaithStr = "[ICON_PEACE]" .. strFaithStr;
			end
			Controls.FaithString:SetText(strFaithStr);
	
			-----------------------------
			-- Update Resources
			-----------------------------
			local pResource;
			local bShowResource;
			local iNumAvailable;
			local iNumUsed;
			local iNumTotal;
			
			local strResourceText = "";
			local strResourcesMagistratesDignitariesText = "";
			local strTempText = "";

			for pResource in GameInfo.Resources("Type = 'RESOURCE_JFD_DIGNITARIES' OR Type = 'RESOURCE_MAGISTRATES'") do
				local iResourceLoop = pResource.ID;
				
				iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
				iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
					
				local text = Locale.ConvertTextKey(pResource.IconString);
				strTempText = string.format("%i %s   ", iNumAvailable, text);
				
				-- Colorize for amount available
				if (iNumAvailable > 0) then
					strTempText = "[COLOR_POSITIVE_TEXT]" .. strTempText .. "[ENDCOLOR]";
				elseif (iNumAvailable < 0) then
					strTempText = "[COLOR_WARNING_TEXT]" .. strTempText .. "[ENDCOLOR]";
				end
				
				strResourceText = strResourceText .. strTempText;
				strResourcesMagistratesDignitariesText = strResourcesMagistratesDignitariesText .. strTempText;
			end
			
			for pResource in GameInfo.Resources() do
				local iResourceLoop = pResource.ID;
				if Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC then
					
					bShowResource = false;
					
					if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechReveal])) then
						if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechCityTrade])) then
							bShowResource = true;
						end
					end
					if pResource.Type == "RESOURCE_JFD_SHACKLES" then
						bShowResource = JFD_CanPurchaseSlaves(iPlayerID)
					end
					
					iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
					iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
					iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
					
					if (iNumUsed > 0) then
						bShowResource = true;
					end
							
					if (bShowResource) then
						local text = Locale.ConvertTextKey(pResource.IconString);
						if pResource.Type == "RESOURCE_JFD_POWER" then
							strTempText = string.format("%i %s  ", iNumAvailable, text);
						else
							strTempText = string.format("%i %s   ", iNumAvailable, text);
						end

						-- Colorize for amount available
						if (iNumAvailable > 0) then
							strTempText = "[COLOR_POSITIVE_TEXT]" .. strTempText .. "[ENDCOLOR]";
						elseif (iNumAvailable < 0) then
							strTempText = "[COLOR_WARNING_TEXT]" .. strTempText .. "[ENDCOLOR]";
						end
						
						strResourceText = strResourceText .. strTempText;
					end
				end
			end
			
			Controls.ResourceString:SetText(strResourceText);
			Controls.MagistratesDignitaries:SetText(strResourcesMagistratesDignitariesText);
			
		-- No Cities, so hide science
		else
			
			Controls.TopPanelInfoStack:SetHide(true);
			
		end

		-- Update the time
		Controls.CurrentTime:SetText(os.date(Locale.ConvertTextKey("TXT_KEY_JFD_MENU_TIME_24_HR")))
		if (not userSettingClock) then Controls.CurrentTime:SetHide(true) end
		
		-- Update turn counter
		local turn = Locale.ConvertTextKey("TXT_KEY_TP_TURN_COUNTER", Game.GetGameTurn());
		Controls.CurrentTurn:SetText(turn);
		
		-- Update Unit Supply
		
		-- local iUnitSupplyMod = pPlayer:GetUnitProductionMaintenanceMod();
		-- if (iUnitSupplyMod ~= 0) then
			-- local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
			-- local iUnitsOver = pPlayer:GetNumUnitsOutOfSupply();
			-- local strUnitSupplyToolTip = Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REACHED_TOOLTIP", iUnitsSupplied, iUnitsOver, -iUnitSupplyMod);
			
			-- Controls.UnitSupplyString:SetToolTipString(strUnitSupplyToolTip);
			-- Controls.UnitSupplyString:SetHide(false);
		-- else
			-- Controls.UnitSupplyString:SetHide(true);
		-- end
		local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
			local iUnitsTotal = pPlayer:GetNumUnitsNoCivilian();

			local strSupplyStr = "";
			if(iUnitsTotal > iUnitsSupplied) then
				strSupplyStr = string.format(" [COLOR_NEGATIVE_TEXT](%i/%i)[ENDCOLOR]", iUnitsTotal, iUnitsSupplied);
			else
				strSupplyStr = string.format(" (%i/%i)", iUnitsTotal, iUnitsSupplied);
			end
			strSupplyStr = "[ICON_WAR]" .. strSupplyStr;

			Controls.UnitSupplyString:SetText(strSupplyStr);
		
		-- Update date
		local date;
		local traditionalDate = Game.GetTurnString();
		
		if (pPlayer:IsUsingMayaCalendar()) then
			date = pPlayer:GetMayaCalendarString();
			local toolTipString = Locale.ConvertTextKey("TXT_KEY_MAYA_DATE_TOOLTIP", pPlayer:GetMayaCalendarLongString(), traditionalDate);
			Controls.CurrentDate:SetToolTipString(toolTipString);
		else
			date = traditionalDate;
		end
		
		Controls.CurrentDate:SetText("(" .. date .. ")");
	end
end

function OnTopPanelDirty()
	UpdateData();
end
-------------------------------------------------
-------------------------------------------------
function OnCivilopedia()	
	-- In City View, return to main game
	--if (UI.GetHeadSelectedCity() ~= nil) then
		--Events.SerialEventExitCityScreen();
	--end
	--
	-- opens the Civilopedia without changing its current state
	Events.SearchForPediaEntry("");
end
Controls.CivilopediaButton:RegisterCallback( Mouse.eLClick, OnCivilopedia );


-------------------------------------------------
-------------------------------------------------
function OnMenu()
	
	-- In City View, return to main game
	if (UI.GetHeadSelectedCity() ~= nil) then
		Events.SerialEventExitCityScreen();
		--UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
	-- In Main View, open Menu Popup
	else
	    UIManager:QueuePopup( LookUpControl( "/InGame/GameMenu" ), PopupPriority.InGameMenu );
	end
end
Controls.MenuButton:RegisterCallback( Mouse.eLClick, OnMenu );


-------------------------------------------------
-------------------------------------------------
function OnCultureClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY, Data2 = -1 } );

end
Controls.CultureString:RegisterCallback( Mouse.eLClick, OnCultureClicked );

-------------------------------------------------
-- JFD Sovereignty
-------------------------------------------------
function OnSovereigntyClicked()
	
	LuaEvents.JFD_RTP_Sovereignty_ShowGovernmentOverview()

end
Controls.SovereigntyString:RegisterCallback( Mouse.eLClick, OnSovereigntyClicked );


-------------------------------------------------
-------------------------------------------------
function OnTechClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, Data2 = -1} );

end
Controls.SciencePerTurn:RegisterCallback( Mouse.eLClick, OnTechClicked );

-------------------------------------------------
-------------------------------------------------
function OnTourismClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW, Data2 = 4 } );

end
Controls.TourismString:RegisterCallback( Mouse.eLClick, OnTourismClicked );


-------------------------------------------------
-------------------------------------------------
function OnFaithClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW } );

end
Controls.FaithString:RegisterCallback( Mouse.eLClick, OnFaithClicked );

-------------------------------------------------
-- JFD Piety
-------------------------------------------------
function OnPietyClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW } );

end
Controls.PietyString:RegisterCallback( Mouse.eLClick, OnPietyClicked );

-------------------------------------------------
-------------------------------------------------
function OnSupplyClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_MILITARY_OVERVIEW } );

end
Controls.UnitSupplyString:RegisterCallback( Mouse.eLClick, OnSupplyClicked );

-------------------------------------------------
-------------------------------------------------
function OnGoldClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW } );

end
Controls.GoldPerTurn:RegisterCallback( Mouse.eLClick, OnGoldClicked );

-------------------------------------------------
-- JFD Prosperity
-------------------------------------------------
function OnProsperityClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW } );

end
Controls.ProsperityScore:RegisterCallback( Mouse.eLClick, OnProsperityClicked );

-------------------------------------------------
-------------------------------------------------
function OnTradeRouteClicked()
	
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TRADE_ROUTE_OVERVIEW } );

end
Controls.InternationalTradeRoutes:RegisterCallback( Mouse.eLClick, OnTradeRouteClicked );


-------------------------------------------------
-- TOOLTIPS
-------------------------------------------------


-- Tooltip init
function DoInitTooltips()
	Controls.SciencePerTurn:SetToolTipCallback( ScienceTipHandler );
	Controls.GoldPerTurn:SetToolTipCallback( GoldTipHandler );
	Controls.ProsperityScore:SetToolTipCallback( ProsperityTipHandler ); -- JFD
	Controls.HappinessString:SetToolTipCallback( HappinessTipHandler );
	Controls.GoldenAgeString:SetToolTipCallback( GoldenAgeTipHandler );
	Controls.SovereigntyString:SetToolTipCallback( SovereigntyTipHandler ); -- JFD
	Controls.CultureString:SetToolTipCallback( CultureTipHandler );
	Controls.TourismString:SetToolTipCallback( TourismTipHandler );
	Controls.PietyString:SetToolTipCallback( PietyTipHandler ); -- JFD
	Controls.FaithString:SetToolTipCallback( FaithTipHandler );
	Controls.ResourceString:SetToolTipCallback( ResourcesTipHandler );
	Controls.MagistratesDignitaries:SetToolTipCallback( ResourcesTipHandler );
	Controls.InternationalTradeRoutes:SetToolTipCallback( InternationalTradeRoutesTipHandler );
	Controls.UnitSupplyString:SetToolTipCallback( UnitSupplyHandler );
end

-- Science Tooltip
local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );
function ScienceTipHandler( control )

	local strText = "";
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_SCIENCE_OFF_TOOLTIP");
	else
	
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
	
		local iSciencePerTurn = pPlayer:GetScience();
	
		if (pPlayer:IsAnarchy()) then
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns());
			strText = strText .. "[NEWLINE][NEWLINE]";
		end
	
		-- Science
		--===============================
		--JFD's Top Panel Addins BEGINS
		--===============================
		--This is for showing the total Science Per Turn in the tooltip
		local tJFDAddins = JFD_GetYieldAddins("YIELD_SCIENCE")
		iSciencePerTurn = iSciencePerTurn + (tJFDAddins:YieldSum())
		--===============================
		--JFD's Top Panel Addins ENDS
		--===============================	
		
		if (not OptionsManager.IsNoBasicHelp()) then
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE", iSciencePerTurn);
		
			if (pPlayer:GetNumCities() > 0) then
				strText = strText .. "[NEWLINE][NEWLINE]";
			end
		end
	
		local bFirstEntry = true;
	
		-- Science LOSS from Budget Deficits
		local iScienceFromBudgetDeficit = pPlayer:GetScienceFromBudgetDeficitTimes100();
		if (iScienceFromBudgetDeficit ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end

			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_BUDGET_DEFICIT", iScienceFromBudgetDeficit / 100);
			strText = strText .. "[NEWLINE]";
		end
	
		-- Science from Cities
		local iScienceFromCities = pPlayer:GetScienceFromCitiesTimes100(true);
		if (iScienceFromCities ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end

			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_CITIES", iScienceFromCities / 100);
		end
	
		-- Science from Trade Routes
		local iScienceFromTrade = pPlayer:GetScienceFromCitiesTimes100(false) - iScienceFromCities;
		if (iScienceFromTrade ~= 0) then
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
			
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_ITR", iScienceFromTrade / 100);
		end
	
		-- Science from Other Players
		local iScienceFromOtherPlayers = pPlayer:GetScienceFromOtherPlayersTimes100();
		if (iScienceFromOtherPlayers ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end

			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_MINORS", iScienceFromOtherPlayers / 100);
		end
	
		-- Science from Happiness
		local iScienceFromHappiness = pPlayer:GetScienceFromHappinessTimes100();
		if (iScienceFromHappiness ~= 0) then
			
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_HAPPINESS", iScienceFromHappiness / 100);
		end
	
		-- Science from Research Agreements
		local iScienceFromRAs = pPlayer:GetScienceFromResearchAgreementsTimes100();
		if (iScienceFromRAs ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_FROM_RESEARCH_AGREEMENTS", iScienceFromRAs / 100);
		end
		
		-- C4DF
		-- Science from Vassals
		local iScienceFromVassals = pPlayer:GetYieldPerTurnFromVassals(YieldTypes.YIELD_SCIENCE);
		if (iScienceFromVassals ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_VASSALS", iScienceFromVassals / 100);
		end

		-- Science from Allies (CSD MOD)
		local iScienceFromAllies = pPlayer:GetScienceRateFromMinorAllies();
		if (iScienceFromAllies ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_MINOR_SCIENCE_FROM_LEAGUE_ALLIES", iScienceFromAllies);
		end

		-- Science from Funding from League (CSD MOD)
		local iScienceFromLeague = pPlayer:GetScienceRateFromLeagueAid();
		if (iScienceFromLeague ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_FUNDING_FROM_LEAGUE", iScienceFromLeague);
		end

-- CBP Science from Religion
		local iScienceFromReligion = pPlayer:GetYieldPerTurnFromReligion(YieldTypes.YIELD_SCIENCE);
		if (iScienceFromReligion ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_FROM_RELIGION", iScienceFromReligion);
		end
-- COMMUNITY PATCH CHANGE
		local iScienceFromMinors = pPlayer:GetSciencePerTurnFromMinorCivs();
		if (iScienceFromMinors ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_FROM_MINORS", iScienceFromMinors);
		end
		-- Science % lost from unhappiness
		local iScienceChange = pPlayer:CalculateUnhappinessTooltip(YieldTypes.YIELD_SCIENCE);
		if (iScienceChange ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strText = strText .. "[NEWLINE]";
			end
	
			if(iScienceChange > 0) then
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_GAINED_FROM_HAPPINESS", iScienceChange / 100);
			else
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_SCIENCE_LOST_FROM_UNHAPPINESS", iScienceChange / 100);
			end
		end
--END
		--===============================
		--JFD's Top Panel Addins BEGINS
		--===============================
		--This is for any extra Science Per Turn addins
		local toolTipAddinsScience = JFD_GetYieldAddins("YIELD_SCIENCE")
		local toolTipAddinsPositive = toolTipAddinsScience:YieldTooltipsPositive(toolTipAddinsScience)
		local toolTipAddinsNegative = toolTipAddinsScience:YieldTooltipsNegative(toolTipAddinsScience)
		strText = strText .. toolTipAddinsPositive
		strText = strText .. toolTipAddinsNegative
		--===============================
		--JFD's Top Panel Addins ENDS
		--===============================
		-- Let people know that building more cities makes techs harder to get
		if (not OptionsManager.IsNoBasicHelp()) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_TECH_CITY_COST", Game.GetNumCitiesTechCostMod());
		end
		--===============================
		--JFD's Top Panel Addins BEGINS
		--===============================
		--This is for any miscellaneous tooltip info you want to display
		local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_SCIENCE")
		if (miscToolTip and miscToolTip ~= "") then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  miscToolTip
		end
		--===============================
		--JFD's Top Panel Addins ENDS
		--===============================
	end
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Gold Tooltip
function GoldTipHandler( control )

	local strText = "";
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	local iTotalGold = pPlayer:GetGold();

	local iGoldPerTurnFromOtherPlayers = pPlayer:GetGoldPerTurnFromDiplomacy();
	local iGoldPerTurnToOtherPlayers = 0;
	if (iGoldPerTurnFromOtherPlayers < 0) then
		iGoldPerTurnToOtherPlayers = -iGoldPerTurnFromOtherPlayers;
		iGoldPerTurnFromOtherPlayers = 0;
	end
	
	local iGoldPerTurnFromReligion = pPlayer:GetGoldPerTurnFromReligion();

	local fTradeRouteGold = (pPlayer:GetGoldFromCitiesTimes100() - pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100()) / 100;
	local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100() / 100;
	local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100;
	--local fInternationalTradeRouteGold = pPlayer:GetGoldPerTurnFromTradeRoutesTimes100() / 100;
	local fTraitGold = pPlayer:GetGoldPerTurnFromTraits();
	-- CBP
	local iInternalRouteGold = pPlayer:GetInternalTradeRouteGoldBonus();
	local iGoldChange = pPlayer:CalculateUnhappinessTooltip(YieldTypes.YIELD_GOLD) / 100;
	local iMinorGold = pPlayer:GetGoldPerTurnFromMinorCivs();
	-- END
-- C4DF
	-- Gold from Vassals
	local iGoldFromVassals = pPlayer:GetYieldPerTurnFromVassals(YieldTypes.YIELD_GOLD);
	local iGoldFromVassalTax = math.floor(pPlayer:GetMyShareOfVassalTaxes() / 100);
-- END
-- C4DF CHANGE
	local fTotalIncome = fGoldPerTurnFromCities + iGoldPerTurnFromOtherPlayers + fCityConnectionGold + iGoldPerTurnFromReligion + fTradeRouteGold + fTraitGold + iMinorGold + iGoldChange + iInternalRouteGold;
	if (iGoldFromVassals > 0) then
		fTotalIncome = fTotalIncome + iGoldFromVassals;
	end
	if (iGoldFromVassalTax > 0) then
		fTotalIncome = fTotalIncome + iGoldFromVassalTax;
	end
-- C4DF END CHANGE	
	if (pPlayer:IsAnarchy()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns());
		strText = strText .. "[NEWLINE][NEWLINE]";
	end
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_AVAILABLE_GOLD", iTotalGold);
		strText = strText .. "[NEWLINE][NEWLINE]";
	end
	
	--===============================
	--JFD's Top Panel Addins BEGINS
	--===============================
	local tJFDAddins = JFD_GetYieldAddins("YIELD_GOLD")
	fTotalIncome = fTotalIncome + (tJFDAddins:YieldSum())
	--===============================
	--JFD's Top Panel Addins ENDS
	--===============================	
	strText = strText .. "[COLOR:150:255:150:255]";
	if fTotalIncome > 0 then
		strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome));
	else
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome));
	end
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities);
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_CITY_CONNECTIONS", math.floor(fCityConnectionGold));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_ITR", math.floor(fTradeRouteGold));
	if (math.floor(fTraitGold) > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TRAITS", math.floor(fTraitGold));
	end
	--CBP
	if (iInternalRouteGold > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_INTERNAL_TRADE", iInternalRouteGold);
	end
	if (iGoldPerTurnFromOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers);
	end
	if (iGoldPerTurnFromReligion > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_RELIGION", iGoldPerTurnFromReligion);
	end
-- C4DF
	-- Gold from Vassals
	if (iGoldFromVassals > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_VASSALS", iGoldFromVassals);
	end

	-- Gold from Vassal Tax
	if (iGoldFromVassalTax > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_VASSAL_TAX", iGoldFromVassalTax);
	end
--  END
-- COMMUNITY PATCH CHANGE
	if (iMinorGold > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_MINORS", iMinorGold);
	end
		-- Gold gained from happiness
		if (iGoldChange > 0) then
			strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_GAINED_FROM_HAPPINESS", iGoldChange);
		end
--END
	--===============================
	--JFD's Top Panel Addins BEGINS
	--===============================
	--This is for any extra positive Gold Per Turn addins
	local toolTipAddinsGold = JFD_GetYieldAddins("YIELD_GOLD")
	local toolTipAddinsPositive = toolTipAddinsGold:YieldTooltipsPositive(toolTipAddinsGold)
	strText = strText .. toolTipAddinsPositive
	--===============================
	--JFD's Top Panel Addins ENDS
	--===============================
	strText = strText .. "[/COLOR]";
	
	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance();
	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance();
	local iContractMaintenance = pPlayer:GetContractGoldMaintenance()
-- BEGIN C4DF
	local iExpenseFromVassalTaxes = pPlayer:GetExpensePerTurnFromVassalTaxes();
	local iVassalMaintenance = pPlayer:GetVassalGoldMaintenance();
-- END C4DF
	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers + iContractMaintenance;
-- BEGIN C4DF
	if (iVassalMaintenance > 0) then
		iTotalExpenses = iTotalExpenses + iVassalMaintenance;
	end
	if (iExpenseFromVassalTaxes > 0) then
		iTotalExpenses = iTotalExpenses + iExpenseFromVassalTaxes;
	end
-- END C4DF
-- COMMUNITY PATCH CHANGE
	if (iGoldChange < 0) then
		iGoldChange = (iGoldChange * -1);
		iTotalExpenses = iTotalExpenses + iGoldChange;
	end	
--END
	strText = strText .. "[NEWLINE]";
	strText = strText .. "[COLOR:255:150:150:255]";
	strText = strText .. "[NEWLINE]-" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_EXPENSES", iTotalExpenses);
	if (iUnitCost ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNIT_MAINT", iUnitCost);
	end
	if (iUnitSupply ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_UNIT_SUPPLY", iUnitSupply);
	end
	if (iBuildingMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_BUILDING_MAINT", iBuildingMaintenance);
	end
	if (iContractMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_CONTRACT_MAINT", iContractMaintenance);
	end
	if (iImprovementMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TILE_MAINT", iImprovementMaintenance);
	end
	if (iGoldPerTurnToOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TO_OTHERS", iGoldPerTurnToOtherPlayers);
	end
-- COMMUNITY PATCH CHANGE
	-- Gold % lost from unhappiness
	local iGoldChange = (pPlayer:CalculateUnhappinessTooltip(YieldTypes.YIELD_GOLD) / 100);
	if (iGoldChange < 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_LOST_FROM_UNHAPPINESS", (iGoldChange * -1));
	end
--END
-- C4DF
	if (iVassalMaintenance > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_VASSAL_MAINT", iVassalMaintenance);
	end

	-- Gold from Vassal Tax
	if (iExpenseFromVassalTaxes > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TOP_GOLD_VASSAL_TAX", iExpenseFromVassalTaxes);
	end
--  END
	--===============================
	--JFD's Top Panel Addins BEGINS
	--===============================
	--This is for any extra negative Gold Per Turn addins
	local toolTipAddinsNegative = toolTipAddinsGold:YieldTooltipsNegative(toolTipAddinsGold)
	strText = strText .. toolTipAddinsNegative
	--===============================
	--JFD's Top Panel Addins ENDS
	--===============================
	strText = strText .. "[/COLOR]";
	
	if (fTotalIncome + iTotalGold < 0) then
		strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]";
	end
	
	-- Basic explanation of Happiness
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLD_EXPLANATION");
	end
	
	--===============================
	--JFD's Top Panel Addins BEGIN
	--===============================
	--This is for any miscellaneous tooltip info you want to display
	local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_GOLD")
	if (miscToolTip and miscToolTip ~= "") then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  miscToolTip
	end
	--===============================
	--JFD's Top Panel Addins END
	--===============================
	--Controls.GoldPerTurn:SetToolTipString(strText);
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- JFD Prosperity Tooltip 
function ProsperityTipHandler( control )

	local iProsperity, strText = JFD_CalculateProsperity(Game.GetActivePlayer(), true);
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
end

-- Happiness Tooltip
function HappinessTipHandler( control )

	local strText;
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_HAPPINESS_OFF_TOOLTIP");
	else
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
	
		local iHappiness = pPlayer:GetExcessHappiness();
		-- CBP EDITS HERE
		local iTestHappiness = iHappiness;
		local iMilitaryHappiness = iHappiness;
		if(iTestHappiness > 10)then
			iTestHappiness = 10;
		end
		if(iTestHappiness < -30)then
			iTestHappiness = -30;
		end
		if(iMilitaryHappiness < -20)then
			iMilitaryHappiness = -20;
		end
		if(iTestHappiness < 0) then
			iTestHappiness = (iTestHappiness * -1);
		end
		if(iMilitaryHappiness < 0) then
			iMilitaryHappiness = (iMilitaryHappiness * -1);
		end
		if (not pPlayer:IsEmpireUnhappy()) then
			strText = Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_HAPPINESS", iHappiness, iTestHappiness);
		elseif (pPlayer:IsEmpireVeryUnhappy()) then
			strText = Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_UNHAPPINESS", "[ICON_HAPPINESS_4]", -iHappiness);
		else
			strText = Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_UNHAPPINESS", "[ICON_HAPPINESS_3]", -iHappiness);
		end
	
		local iPoliciesHappiness = pPlayer:GetHappinessFromPolicies();
		local iResourcesHappiness = pPlayer:GetHappinessFromResources();
		local iExtraLuxuryHappiness = pPlayer:GetExtraHappinessPerLuxury();
		local iCityHappiness = pPlayer:GetHappinessFromCities();
		local iBuildingHappiness = pPlayer:GetHappinessFromBuildings();
		local iTradeRouteHappiness = pPlayer:GetHappinessFromTradeRoutes();
		local iReligionHappiness = pPlayer:GetHappinessFromReligion();
		local iNaturalWonderHappiness = pPlayer:GetHappinessFromNaturalWonders();
		local iExtraHappinessPerCity = pPlayer:GetExtraHappinessPerCity() * pPlayer:GetNumCities();
		local iMinorCivHappiness = pPlayer:GetHappinessFromMinorCivs();
		local iLeagueHappiness = pPlayer:GetHappinessFromLeagues();
-- CBP
		local iHappinessFromBonusResources = pPlayer:GetBonusHappinessFromLuxuries();
		local iHappinessFromMonopoly = pPlayer:GetHappinessFromResourceMonopolies();
		local iHappinessFromEvent = pPlayer:GetEventHappiness();
-- END	
-- CBP Edit
		local iHandicapHappiness = pPlayer:GetHappiness() - iPoliciesHappiness - iResourcesHappiness - iCityHappiness - iBuildingHappiness - iTradeRouteHappiness - iReligionHappiness - iNaturalWonderHappiness - iMinorCivHappiness - iExtraHappinessPerCity - iLeagueHappiness - iHappinessFromBonusResources - iHappinessFromMonopoly - iHappinessFromEvent;
	
		if (pPlayer:IsEmpireVeryUnhappy()) then
		
			if (pPlayer:IsEmpireSuperUnhappy()) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_EMPIRE_SUPER_UNHAPPY") .. "[/COLOR]";
			end
		
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText .. "[COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_EMPIRE_VERY_UNHAPPY", iTestHappiness, iMilitaryHappiness) .. "[/COLOR]";
		elseif (pPlayer:IsEmpireUnhappy()) then
		
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText .. "[COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_EMPIRE_UNHAPPY", iTestHappiness, iMilitaryHappiness) .. "[/COLOR]";
		end

-- C4DF
		-- Happiness from Vassals
		local iHappinessFromVassals = pPlayer:GetHappinessFromVassals();	-- Compatibility with Putmalk's Civ IV Diplomacy Features Mod
--  END

		local iTotalHappiness = iPoliciesHappiness + iResourcesHappiness + iCityHappiness + iBuildingHappiness + iMinorCivHappiness + iHandicapHappiness + iTradeRouteHappiness + iReligionHappiness + iNaturalWonderHappiness + iExtraHappinessPerCity + iLeagueHappiness + iHappinessFromBonusResources + iHappinessFromMonopoly + iHappinessFromEvent;
		
-- C4DF
		if(iHappinessFromVassals > 0) then
			iTotalHappiness = iTotalHappiness + iHappinessFromVassals;
		end
-- C4DF END
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText .. "[COLOR:150:255:150:255]";
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_SOURCES", iTotalHappiness);
	
		strText = strText .. "[NEWLINE]";
		strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_FROM_RESOURCES", iResourcesHappiness);
	
		-- Individual Resource Info
	
		local iBaseHappinessFromResources = 0;
		local iNumHappinessResources = 0;


		for resource in GameInfo.Resources() do
			local resourceID = resource.ID;
			local iHappiness = pPlayer:GetHappinessFromLuxury(resourceID);
			if (iHappiness > 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. "          +" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_EACH_RESOURCE", iHappiness, resource.IconString, resource.Description);
				iNumHappinessResources = iNumHappinessResources + 1;
				iBaseHappinessFromResources = iBaseHappinessFromResources + iHappiness;
			end
		end
		if (iHappinessFromEvent > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_EVENT", iHappinessFromEvent);
		end

-- CBP
		if isUsingCBP then
		if (iHappinessFromMonopoly > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_RESOURCE_MONOPOLY", iHappinessFromMonopoly);
		end
		if (iHappinessFromBonusResources > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_RESOURCE_POP_BONUS", iHappinessFromBonusResources);
		end
		end
		-- Happiness/Population calculation.
		if isUsingCBP then
		local iPopulation = pPlayer:GetCurrentTotalPop();
		local iPopNeeded = pPlayer:GetPopNeededForLux();
		local iGetLuxuryBonus = pPlayer:GetLuxuryBonusPlusOne(0);
		local iGetLuxuryBonusPlusOne = (100 + pPlayer:GetLuxuryBonusPlusOne(1));
		if(iGetLuxuryBonusPlusOne > 0) then
			strText = strText .. "[NEWLINE][NEWLINE][ENDCOLOR]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_THRESHOLD_VALUE", iPopNeeded, iPopulation, Locale.ToNumber( ((iGetLuxuryBonusPlusOne - iGetLuxuryBonus) / 100), "#.##" ));
		end
		end
-- END
-- C4DF
		if (iHappinessFromVassals > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "          +" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_VASSALS", iHappinessFromVassals);
		end
-- END
	
		-- Happiness from Luxury Variety
		local iHappinessFromExtraResources = pPlayer:GetHappinessFromResourceVariety();
		if (iHappinessFromExtraResources > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "          +" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_RESOURCE_VARIETY", iHappinessFromExtraResources);
		end
	
		-- Extra Happiness from each Luxury
		if (iExtraLuxuryHappiness >= 1) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "          +" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_EXTRA_PER_RESOURCE", iExtraLuxuryHappiness, iNumHappinessResources);
		end
	
		-- Misc Happiness from Resources
		local iMiscHappiness = iResourcesHappiness - iBaseHappinessFromResources - iHappinessFromExtraResources - (iExtraLuxuryHappiness * iNumHappinessResources);
		if (iMiscHappiness > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "          +" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_OTHER_SOURCES", iMiscHappiness);
		end
	
		strText = strText .. "[NEWLINE]";
		strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_CITIES", iCityHappiness);
		if (iPoliciesHappiness >= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_POLICIES", iPoliciesHappiness);
		end
		strText = strText .. "[NEWLINE]";
		strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_BUILDINGS", iBuildingHappiness);
		if (iTradeRouteHappiness ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_CONNECTED_CITIES", iTradeRouteHappiness);
		end
		if (iReligionHappiness ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_STATE_RELIGION", iReligionHappiness);
		end
		if (iNaturalWonderHappiness ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_NATURAL_WONDERS", iNaturalWonderHappiness);
		end
		if (iExtraHappinessPerCity ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_CITY_COUNT", iExtraHappinessPerCity);
		end
		if (iMinorCivHappiness ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_CITY_STATE_FRIENDSHIP", iMinorCivHappiness);
		end
		if (iLeagueHappiness ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_LEAGUES", iLeagueHappiness);
		end
		strText = strText .. "[NEWLINE]";
		strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_DIFFICULTY_LEVEL", iHandicapHappiness);
		strText = strText .. "[/COLOR]";
	
		-- Unhappiness
		local iTotalUnhappiness = pPlayer:GetUnhappiness();
		local iUnhappinessFromUnits = Locale.ToNumber( pPlayer:GetUnhappinessFromUnits() / 100, "#.##" );
		local iUnhappinessFromCityCount = Locale.ToNumber( pPlayer:GetUnhappinessFromCityCount() / 100, "#.##" );
		local iUnhappinessFromCapturedCityCount = Locale.ToNumber( pPlayer:GetUnhappinessFromCapturedCityCount() / 100, "#.##" );
		
		local iUnhappinessFromPupetCities = pPlayer:GetUnhappinessFromPuppetCityPopulation();
		local unhappinessFromSpecialists = pPlayer:GetUnhappinessFromCitySpecialists();
-- COMMUNITY PATCH CHANGES BELOW
		--local unhappinessFromPop = pPlayer:GetUnhappinessFromCityPopulation() - unhappinessFromSpecialists - iUnhappinessFromPupetCities;
		local unhappinessFromPop = pPlayer:GetUnhappinessFromCityPopulation() - iUnhappinessFromPupetCities;
--END			
		local iUnhappinessFromPop = Locale.ToNumber( unhappinessFromPop / 100, "#.##" );
		local iUnhappinessFromOccupiedCities = Locale.ToNumber( pPlayer:GetUnhappinessFromOccupiedCities() / 100, "#.##" );
		local iUnhappinessPublicOpinion = pPlayer:GetUnhappinessFromPublicOpinion();
-- COMMUNITY PATCH CHANGES BELOW
		iUnhappinessPublicOpinion = iUnhappinessPublicOpinion + pPlayer:GetUnhappinessFromWarWeariness();
		local iUnhappinessFromStarving = pPlayer:GetUnhappinessFromCityStarving();
		local iUnhappinessFromPillaged = pPlayer:GetUnhappinessFromCityPillaged();
		local iUnhappinessFromGold = pPlayer:GetUnhappinessFromCityGold();
		local iUnhappinessFromDefense = pPlayer:GetUnhappinessFromCityDefense();
		local iUnhappinessFromConnection = pPlayer:GetUnhappinessFromCityConnection();
		local iUnhappinessFromMinority = pPlayer:GetUnhappinessFromCityMinority();
		local iUnhappinessFromScience = pPlayer:GetUnhappinessFromCityScience();
		local iUnhappinessFromCulture = pPlayer:GetUnhappinessFromCityCulture();
--END
		
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText .. "[COLOR:255:150:150:255]";
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_TOTAL", iTotalUnhappiness);
-- CBP
		if (iUnhappinessFromCityCount ~= "0") then
-- END
		strText = strText .. "[NEWLINE]";
		strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_CITY_COUNT", iUnhappinessFromCityCount);
-- CBP
		end
-- END
		if (iUnhappinessFromCapturedCityCount ~= "0") then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_CAPTURED_CITY_COUNT", iUnhappinessFromCapturedCityCount);
		end
-- COMMUNITY PATCH CHANGES BELOW
		if (iUnhappinessFromPop ~= "0") then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_POPULATION", iUnhappinessFromPop);
		end
--END
		
		if(iUnhappinessFromPupetCities > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_PUPPET_CITIES", iUnhappinessFromPupetCities / 100);
		end
		
		if(unhappinessFromSpecialists > 0) then
			strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_SPECIALISTS", unhappinessFromSpecialists / 100);
		end
		
		if (iUnhappinessFromOccupiedCities ~= "0") then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_OCCUPIED_POPULATION", iUnhappinessFromOccupiedCities);
		end
		if (iUnhappinessFromUnits ~= "0") then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_UNITS", iUnhappinessFromUnits);
		end
		if (iPoliciesHappiness < 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_POLICIES", iPoliciesHappiness);
		end		
		if (iUnhappinessPublicOpinion > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_PUBLIC_OPINION", iUnhappinessPublicOpinion);
		end
--COMMUNITY PATCH CHANGES
		if isUsingCBP then
		if (iUnhappinessFromStarving > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_STARVING", iUnhappinessFromStarving);
		end
		if (iUnhappinessFromPillaged > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_PILLAGED", iUnhappinessFromPillaged);
		end
		if (iUnhappinessFromGold > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_GOLD", iUnhappinessFromGold);
		end
		if (iUnhappinessFromDefense > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_DEFENSE", iUnhappinessFromDefense);
		end
		if (iUnhappinessFromConnection > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_CONNECTION", iUnhappinessFromConnection);
		end
		if (iUnhappinessFromMinority > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_MINORITY", iUnhappinessFromMinority);
		end		
		if (iUnhappinessFromScience > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_SCIENCE", iUnhappinessFromScience);
		end	
		if (iUnhappinessFromCulture > 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. "  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNHAPPINESS_CULTURE", iUnhappinessFromCulture);
		end
		end
--END CHANGES	
		strText = strText .. "[/COLOR]";
	
		-- Basic explanation of Happiness
		if (not OptionsManager.IsNoBasicHelp()) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_HAPPINESS_EXPLANATION");
		end

		--===============================
		--JFD's Top Panel Addins BEGIN
		--===============================
		--This is for any miscellaneous tooltip info you want to display
		local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_HAPPINESS")
		if (miscToolTip and miscToolTip ~= "") then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  miscToolTip
		end
		--===============================
		--JFD's Top Panel Addins END
		--===============================
	end
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Golden Age Tooltip
function GoldenAgeTipHandler( control )

	local strText;
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_HAPPINESS_OFF_TOOLTIP");
	else
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
	
		if (pPlayer:GetGoldenAgeTurns() > 0) then
			strText = Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_NOW", pPlayer:GetGoldenAgeTurns());
		else
			local iHappiness = pPlayer:GetExcessHappiness();

			strText = Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_PROGRESS", pPlayer:GetGoldenAgeProgressMeter(), pPlayer:GetGoldenAgeProgressThreshold());
			strText = strText .. "[NEWLINE]";
		
			if (iHappiness >= 0) then
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_ADDITION", iHappiness);
			else
				strText = strText .. "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_LOSS", -iHappiness) .. "[ENDCOLOR]";
			end

			--CBP
			local iGAPReligion = pPlayer:GetGAPFromReligion();
			if (iGAPReligion > 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_ADDITION_RELIGION", iGAPReligion);
			end
			local iGAPTrait = pPlayer:GetGAPFromTraits();
			if (iGAPTrait > 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_ADDITION_TRAIT", iGAPTrait);
			end
			local iGAPCities = pPlayer:GetGAPFromCities();
			if (iGAPCities > 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_ADDITION_CITIES", iGAPCities);
			end
			-- END
			--===============================
			--JFD's Top Panel Addins BEGIN
			--===============================
			local toolTipAddinsGoldenAge = JFD_GetYieldAddins("YIELD_GOLDEN_AGE")
			local toolTipAddinsPositive = toolTipAddinsGoldenAge:YieldTooltipsPositive(toolTipAddinsGoldenAge)
			local toolTipAddinsNegative = toolTipAddinsGoldenAge:YieldTooltipsNegative(toolTipAddinsGoldenAge)
			strText = strText .. toolTipAddinsPositive
			strText = strText .. toolTipAddinsNegative
			--===============================
			--JFD's Top Panel Addins END
			--===============================
		end
	
		strText = strText .. "[NEWLINE][NEWLINE]";
		if (pPlayer:IsGoldenAgeCultureBonusDisabled()) then
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_EFFECT_NO_CULTURE");		
		else
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_EFFECT");		
		end
		
		if (pPlayer:GetGoldenAgeTurns() > 0 and pPlayer:GetGoldenAgeTourismModifier() > 0) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_CARNIVAL_EFFECT");			
		end
		--===============================
		--JFD's Top Panel Addins BEGIN
		--===============================
		--This is for any miscellaneous tooltip info you want to display
		local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_GOLDEN_AGE")
		if (miscToolTip and miscToolTip ~= "") then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  miscToolTip
		end
		--===============================
		--JFD's Top Panel Addins END
		--===============================
	end
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- JFD Sovereignty Tooltip
function SovereigntyTipHandler( control )

	local strText = JFD_GetSovereigntyTopPanelInfoTT(Game.GetActivePlayer())
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Culture Tooltip
function CultureTipHandler( control )

	local strText = "";
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_POLICIES)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_POLICIES_OFF_TOOLTIP");
	else
	
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];
    
	    local iTurns;
		local iCultureNeeded = pPlayer:GetNextPolicyCost() - pPlayer:GetJONSCulture();
	    if (iCultureNeeded <= 0) then
			iTurns = 0;
		else
			if (pPlayer:GetTotalJONSCulturePerTurn() == 0) then
				iTurns = "?";
			else
				iTurns = iCultureNeeded / pPlayer:GetTotalJONSCulturePerTurn();
				iTurns = math.ceil(iTurns);
			end
	    end
	    
	    if (pPlayer:IsAnarchy()) then
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns());
		end
	    
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_NEXT_POLICY_TURN_LABEL", iTurns);
	
		if (not OptionsManager.IsNoBasicHelp()) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_ACCUMULATED", pPlayer:GetJONSCulture());
			strText = strText .. "[NEWLINE]";
		
			if (pPlayer:GetNextPolicyCost() > 0) then
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_NEXT_POLICY", pPlayer:GetNextPolicyCost());
			end
		end

		if (pPlayer:IsAnarchy()) then
			tipControlTable.TooltipLabel:SetText( strText );
			tipControlTable.TopPanelMouseover:SetHide(false);
			tipControlTable.TopPanelMouseover:DoAutoSize();
			return;
		end

		local bFirstEntry = true;
		
		-- Culture for Free
		local iCultureForFree = pPlayer:GetJONSCulturePerTurnForFree();
		if (iCultureForFree ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FOR_FREE", iCultureForFree);
		end
	
		-- Culture from Cities
		local iCultureFromCities = pPlayer:GetJONSCulturePerTurnFromCities();
		if (iCultureFromCities ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_CITIES", iCultureFromCities);
		end
	
		-- Culture from Excess Happiness
		local iCultureFromHappiness = pPlayer:GetJONSCulturePerTurnFromExcessHappiness();
		if (iCultureFromHappiness ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_HAPPINESS", iCultureFromHappiness);
		end
	
		-- Culture from Traits
		local iCultureFromTraits = pPlayer:GetJONSCulturePerTurnFromTraits();
		if (iCultureFromTraits ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_TRAITS", iCultureFromTraits);
		end
-- C4DF
		local iCultureFromVassals = pPlayer:GetYieldPerTurnFromVassals(YieldTypes.YIELD_CULTURE);
		if (iCultureFromVassals ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_VASSALS", iCultureFromVassals);
		end
-- END	
		-- Culture from Minor Civs
		local iCultureFromMinors = pPlayer:GetCulturePerTurnFromMinorCivs();
		if (iCultureFromMinors ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_MINORS", iCultureFromMinors);
		end

		-- Culture from Religion
		local iCultureFromReligion = pPlayer:GetCulturePerTurnFromReligion();
		if (iCultureFromReligion ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_RELIGION", iCultureFromReligion);
		end
		
		-- Culture from a bonus turns (League Project)
		local iCultureFromBonusTurns = pPlayer:GetCulturePerTurnFromBonusTurns();
		if (iCultureFromBonusTurns ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end

			local iBonusTurns = pPlayer:GetCultureBonusTurns();
			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_BONUS_TURNS", iCultureFromBonusTurns, iBonusTurns);
		end
		
		-- Culture from Golden Age (COMMUNITY PATCH EDIT)
		local iCommunityCulture = pPlayer:CalculateUnhappinessTooltip(YieldTypes.YIELD_CULTURE);
		local iCultureFromGoldenAge = pPlayer:GetTotalJONSCulturePerTurn() - iCultureForFree - iCultureFromCities - iCultureFromHappiness - iCultureFromMinors - iCultureFromReligion - iCultureFromTraits - iCultureFromBonusTurns - iCommunityCulture - iCultureFromVassals; -- last part added (COMMUNITY PATCH)
		if (iCultureFromGoldenAge ~= 0) then
		
			-- Add separator for non-initial entries
			if (bFirstEntry) then
				strText = strText .. "[NEWLINE]";
				bFirstEntry = false;
			end
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_FROM_GOLDEN_AGE", iCultureFromGoldenAge);
		end
-- COMMUNITY PATCH CHANGE
		if(iCommunityCulture ~= 0) then

			if(iCommunityCulture < 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_LOST_FROM_UNHAPPINESS", iCommunityCulture);
			else
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_GAINED_FROM_HAPPINESS", iCommunityCulture);
			end
		end
-- END

		--===============================
		--JFD's Top Panel Addins BEGINS
		--===============================
		--This is for any extra positive Culture Per Turn addins
		local toolTipAddinsCulture = JFD_GetYieldAddins("YIELD_CULTURE")
		local toolTipAddinsPositive = toolTipAddinsCulture:YieldTooltipsPositive(toolTipAddinsCulture)
		local toolTipAddinsNegative = toolTipAddinsCulture:YieldTooltipsNegative(toolTipAddinsCulture)
		strText = strText .. toolTipAddinsPositive
		strText = strText .. toolTipAddinsNegative
		--===============================
		--JFD's Top Panel Addins ENDS
		--===============================
		
		-- Let people know that building more cities makes policies harder to get
		if (not OptionsManager.IsNoBasicHelp()) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_CULTURE_CITY_COST", Game.GetNumCitiesPolicyCostMod());
		end

		--===============================
		--JFD's Top Panel Addins BEGINS
		--===============================
		--This is for any miscellaneous tooltip info you want to display
		local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_CULTURE")
		if (miscToolTip and miscToolTip ~= "") then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  miscToolTip
		end
		--===============================
		--JFD's Top Panel Addins ENDS
		--===============================
	end
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Tourism Tooltip
function TourismTipHandler( control )

	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	
	local iTotalGreatWorks = pPlayer:GetNumGreatWorks();
	local iTotalSlots = pPlayer:GetNumGreatWorkSlots();
	
	local strText1 = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_TOURISM_TOOLTIP_1", iTotalGreatWorks);
	local strText2 = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_TOURISM_TOOLTIP_2", (iTotalSlots - iTotalGreatWorks));
		
	local strText = strText1 .. "[NEWLINE]" .. strText2;
		
	local cultureVictory = GameInfo.Victories["VICTORY_CULTURAL"];
	if(cultureVictory ~= nil and PreGame.IsVictory(cultureVictory.ID)) then
	    local iNumInfluential = pPlayer:GetNumCivsInfluentialOn();
		local iNumToBeInfluential = pPlayer:GetNumCivsToBeInfluentialOn();
		local szText = Locale.ConvertTextKey("TXT_KEY_CO_VICTORY_INFLUENTIAL_OF", iNumInfluential, iNumToBeInfluential);

		local strText3 = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_TOURISM_TOOLTIP_3", szText);
		
		strText = strText .. "[NEWLINE][NEWLINE]" .. strText3;
	end	

	--===============================
	--JFD's Top Panel Addins BEGINS
	--===============================
	--This is for any miscellaneous tooltip info you want to display
	local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_TOURISM")
	if (miscToolTip and miscToolTip ~= "") then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  miscToolTip
	end
	--===============================
	--JFD's Top Panel Addins ENDS
	--===============================

	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- JFD Piety Tooltip
function PietyTipHandler( control )

	local strText = JFD_GetPietyTopPanelInfoTT(Game.GetActivePlayer())
	
	--===============================
	--JFD's Top Panel Addins BEGIN
	--===============================
	--This is for any miscellaneous tooltip info you want to display
	local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_JFD_PIETY")
	if (miscToolTip and miscToolTip ~= "") then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  miscToolTip
	end
	--===============================
	--JFD's Top Panel Addins END
	--===============================
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- FaithTooltip
function FaithTipHandler( control )

	local strText = "";

	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_RELIGION_OFF_TOOLTIP");
	else
	
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];

	    if (pPlayer:IsAnarchy()) then
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns());
			strText = strText .. "[NEWLINE]";
			strText = strText .. "[NEWLINE]";
		end
	    
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_ACCUMULATED", pPlayer:GetFaith());
		strText = strText .. "[NEWLINE]";
	
		-- Faith from Cities
		local iFaithFromCities = pPlayer:GetFaithPerTurnFromCities();
		if (iFaithFromCities ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_FROM_CITIES", iFaithFromCities);
		end
	
		-- Faith from Minor Civs
		local iFaithFromMinorCivs = pPlayer:GetFaithPerTurnFromMinorCivs();
		if (iFaithFromMinorCivs ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_FROM_MINORS", iFaithFromMinorCivs);
		end

		--===============================
		--JFD's Top Panel Addins BEGIN
		--===============================
		--This is for any extra Faith Per Turn addins
		local toolTipAddinsFaith = JFD_GetYieldAddins("YIELD_FAITH")
		local toolTipAddinsPositive = toolTipAddinsFaith:YieldTooltipsPositive(toolTipAddinsFaith)
		local toolTipAddinsNegative = toolTipAddinsFaith:YieldTooltipsNegative(toolTipAddinsFaith)
		strText = strText .. toolTipAddinsPositive
		strText = strText .. toolTipAddinsNegative
		--===============================
		--JFD's Top Panel Addins END
		--===============================

		-- Faith from Religion
		local iFaithFromReligion = pPlayer:GetFaithPerTurnFromReligion();
		if (iFaithFromReligion ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_FROM_RELIGION", iFaithFromReligion);
		end
-- C4DF
		local iFaithFromVassals = pPlayer:GetYieldPerTurnFromVassals(YieldTypes.YIELD_FAITH);
		if (iFaithFromVassals ~= 0) then
			strText = strText .. "[NEWLINE]";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_VASSALS", iFaithFromVassals);
		end
-- END	
-- COMMUNITY PATCH CHANGE
		-- Faith % lost from unhappiness
		local iFaithChange = pPlayer:CalculateUnhappinessTooltip(YieldTypes.YIELD_FAITH);
		if (iFaithChange ~= 0) then
			if(iFaithChange > 0) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_GAINED_FROM_HAPPINESS", iFaithChange);
			else
				strText = strText .. "[NEWLINE]";
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_LOST_FROM_UNHAPPINESS", iFaithChange);
			end
		end
--END
		
		if (iFaithFromCities ~= 0 or iFaithFromMinorCivs ~= 0 or iFaithFromReligion ~= 0) then
			strText = strText .. "[NEWLINE]";
		end
	
		strText = strText .. "[NEWLINE]";

		if (pPlayer:HasCreatedPantheon()) then
			if (Game.GetNumReligionsStillToFound() > 0 or pPlayer:HasCreatedReligion()) then
				if (pPlayer:GetCurrentEra() < GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
					strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_NEXT_PROPHET", pPlayer:GetMinimumFaithNextGreatProphet());
					strText = strText .. "[NEWLINE]";
					strText = strText .. "[NEWLINE]";
				end
			end
		else
			if (pPlayer:CanCreatePantheon(false)) then
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_NEXT_PANTHEON", Game.GetMinimumFaithNextPantheon());
				strText = strText .. "[NEWLINE]";
			else
				strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_PANTHEONS_LOCKED");
				strText = strText .. "[NEWLINE]";
			end
			strText = strText .. "[NEWLINE]";
		end

		if (Game.GetNumReligionsStillToFound() < 0) then
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_RELIGIONS_LEFT", 0);
		else
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_RELIGIONS_LEFT", Game.GetNumReligionsStillToFound());
		end
		
		if (pPlayer:GetCurrentEra() >= GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
		    local bAnyFound = false;
			strText = strText .. "[NEWLINE]";		
			strText = strText .. "[NEWLINE]";		
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_FAITH_NEXT_GREAT_PERSON", pPlayer:GetMinimumFaithNextGreatProphet());	
			
			local capital = pPlayer:GetCapitalCity();
			if(capital ~= nil) then	
				for info in GameInfo.Units{Special = "SPECIALUNIT_PEOPLE"} do
					local infoID = info.ID;
					local faithCost = capital:GetUnitFaithPurchaseCost(infoID, true);
					if(faithCost > 0 and pPlayer:IsCanPurchaseAnyCity(false, true, infoID, -1, YieldTypes.YIELD_FAITH)) then
						if (pPlayer:DoesUnitPassFaithPurchaseCheck(infoID)) then
							strText = strText .. "[NEWLINE]";
							strText = strText .. "[ICON_BULLET]" .. Locale.ConvertTextKey(info.Description);
							bAnyFound = true;
						end
					end
				end
			end
						
			if (not bAnyFound) then
				strText = strText .. "[NEWLINE]";
				strText = strText .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_RO_YR_NO_GREAT_PEOPLE");
			end
		end
	end

	--===============================
	--JFD's Top Panel Addins BEGIN
	--===============================
	--This is for any miscellaneous tooltip info you want to display
	local miscToolTip = JFD_GetYieldMiscToolTipAddins("YIELD_FAITH")
	if (miscToolTip and miscToolTip ~= "") then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  miscToolTip
	end
	--===============================
	--JFD's Top Panel Addins END
	--===============================

	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

function UnitSupplyHandler(control)

	local strUnitSupplyToolTip = "";
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];

	local iUnitSupplyMod = pPlayer:GetUnitProductionMaintenanceMod();
	if (iUnitSupplyMod ~= 0) then
		local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
		local iUnitsTotal = pPlayer:GetNumUnitsNoCivilian();
		local iPercentPerPop = pPlayer:GetNumUnitsSuppliedByPopulation();
		local iPerCity = pPlayer:GetNumUnitsSuppliedByCities();
		local iPerHandicap = pPlayer:GetNumUnitsSuppliedByHandicap();
		local iWarWearinessReduction = pPlayer:GetWarWeariness();
		local iWarWearinessActualReduction = pPlayer:GetWarWearinessSupplyReduction();
		local iTechReduction = pPlayer:GetTechSupplyReduction();

		local iUnitsOver = pPlayer:GetNumUnitsOutOfSupply();
		strUnitSupplyToolTip = "[COLOR_NEGATIVE_TEXT]";
		strUnitSupplyToolTip = strUnitSupplyToolTip .. Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REACHED_TOOLTIP", iUnitsSupplied, iUnitsOver, -iUnitSupplyMod);
		strUnitSupplyToolTip = strUnitSupplyToolTip .. "[ENDCOLOR]";

		local strUnitSupplyToolUnderTip = Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REMAINING_TOOLTIP", iUnitsSupplied, iUnitsTotal, iPercentPerPop, iPerCity, iPerHandicap, iWarWearinessReduction, iWarWearinessActualReduction, iTechReduction);

		strUnitSupplyToolTip = strUnitSupplyToolTip .. "[NEWLINE][NEWLINE]" .. strUnitSupplyToolUnderTip;
	else
		local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
		local iUnitsTotal = pPlayer:GetNumUnitsNoCivilian();
		local iPercentPerPop = pPlayer:GetNumUnitsSuppliedByPopulation();
		local iPerCity = pPlayer:GetNumUnitsSuppliedByCities();
		local iPerHandicap = pPlayer:GetNumUnitsSuppliedByHandicap();
		local iWarWearinessReduction = pPlayer:GetWarWeariness();
		local iWarWearinessActualReduction = pPlayer:GetWarWearinessSupplyReduction();
		local iTechReduction = pPlayer:GetTechSupplyReduction();

		strUnitSupplyToolTip = Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REMAINING_TOOLTIP", iUnitsSupplied, iUnitsTotal, iPercentPerPop, iPerCity, iPerHandicap, iWarWearinessReduction, iWarWearinessActualReduction, iTechReduction);
	end

	if(strUnitSupplyToolTip ~= "") then
		tipControlTable.TopPanelMouseover:SetHide(false);
		tipControlTable.TooltipLabel:SetText( strUnitSupplyToolTip );
	else
		tipControlTable.TopPanelMouseover:SetHide(true);
	end
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
end

-- Resources Tooltip
function ResourcesTipHandler( control )

	local strText;
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	strText = "";
	
	local pResource;
	local bShowResource;
	local bThisIsFirstResourceShown = true;
	local iNumAvailable;
	local iNumUsed;
	local iNumTotal;
	
	for pResource in GameInfo.Resources() do
		local iResourceLoop = pResource.ID;
		if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
			bShowResource = false;
			if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechReveal])) then
				if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechCityTrade])) then
					bShowResource = true;
				end
			end
			if pResource.Type == "RESOURCE_JFD_SHACKLES" then
				bShowResource = JFD_CanPurchaseSlaves(iPlayerID)
			end

			if (bShowResource) then
				iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
				iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				
				-- Add newline to the front of all entries that AREN'T the first
				if (bThisIsFirstResourceShown) then
					strText = "";
					bThisIsFirstResourceShown = false;
				else
					strText = strText .. "[NEWLINE][NEWLINE]";
				end
				
				strText = strText .. iNumAvailable .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
				
				-- Details
				if (iNumUsed ~= 0 or iNumTotal ~= 0) then
					strText = strText .. ": ";
					strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_RESOURCE_INFO", iNumTotal, iNumUsed);
				end
			end
		end
	end

	for pResource in GameInfo.Resources("Type = 'RESOURCE_JFD_DIGNITARIES' OR Type = 'RESOURCE_MAGISTRATES'") do
		local iResourceLoop = pResource.ID;
		iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
		iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
		iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
		
		-- Add newline to the front of all entries that AREN'T the first
		if (bThisIsFirstResourceShown) then
			strText = "";
			bThisIsFirstResourceShown = false;
		else
			strText = strText .. "[NEWLINE][NEWLINE]";
		end
		
		strText = strText .. iNumAvailable .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
		
		-- Details
		if (iNumUsed ~= 0 or iNumTotal ~= 0) then
			strText = strText .. ": ";
			strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_RESOURCE_INFO", iNumTotal, iNumUsed);
		end
	end
	
	--print(strText);
	if(strText ~= "") then
		tipControlTable.TopPanelMouseover:SetHide(false);
		tipControlTable.TooltipLabel:SetText( strText );
	else
		tipControlTable.TopPanelMouseover:SetHide(true);
	end
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-------------------------------------------------
-------------------------------------------------
function HideResources()
	if (not Controls.ResourceString:IsHidden()) then
		Controls.ResourceString:SetHide(true)
		Controls.HideResources:SetHide(true)
		Controls.UnhideResources:SetHide(false)
		Controls.MagistratesDignitaries:SetHide(false)
	end	
end
Controls.HideResources:RegisterCallback( Mouse.eLClick, HideResources );

function UnhideResources()
	if Controls.ResourceString:IsHidden() then
		Controls.ResourceString:SetHide(false)
		Controls.HideResources:SetHide(false)
		Controls.UnhideResources:SetHide(true)
		Controls.MagistratesDignitaries:SetHide(true)
	end	
end
Controls.UnhideResources:RegisterCallback( Mouse.eLClick, UnhideResources );
-------------------------------------------------

-- International Trade Route Tooltip
function InternationalTradeRoutesTipHandler( control )

	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	
	local strTT = "";
	
	local iNumLandTradeUnitsAvail = pPlayer:GetNumAvailableTradeUnits(DomainTypes.DOMAIN_LAND);
	if (iNumLandTradeUnitsAvail > 0) then
		local iTradeUnitType = pPlayer:GetTradeUnitType(DomainTypes.DOMAIN_LAND);
		local strUnusedTradeUnitWarning = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_INTERNATIONAL_TRADE_ROUTES_TT_UNASSIGNED", iNumLandTradeUnitsAvail, GameInfo.Units[iTradeUnitType].Description);
		strTT = strTT .. strUnusedTradeUnitWarning;
	end
	
	local iNumSeaTradeUnitsAvail = pPlayer:GetNumAvailableTradeUnits(DomainTypes.DOMAIN_SEA);
	if (iNumSeaTradeUnitsAvail > 0) then
		local iTradeUnitType = pPlayer:GetTradeUnitType(DomainTypes.DOMAIN_SEA);
		local strUnusedTradeUnitWarning = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_INTERNATIONAL_TRADE_ROUTES_TT_UNASSIGNED", iNumLandTradeUnitsAvail, GameInfo.Units[iTradeUnitType].Description);	
		strTT = strTT .. strUnusedTradeUnitWarning;
	end
	
	if (strTT ~= "") then
		strTT = strTT .. "[NEWLINE]";
	end
	
	local iUsedTradeRoutes = pPlayer:GetNumInternationalTradeRoutesUsed();
	local iAvailableTradeRoutes = pPlayer:GetNumInternationalTradeRoutesAvailable();
	
	local strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_INTERNATIONAL_TRADE_ROUTES_TT", iUsedTradeRoutes, iAvailableTradeRoutes);
	strTT = strTT .. strText;
	
	local strYourTradeRoutes = pPlayer:GetTradeYourRoutesTTString();
	if (strYourTradeRoutes ~= "") then
		strTT = strTT .. "[NEWLINE][NEWLINE]"
		strTT = strTT .. Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_ITR_ESTABLISHED_BY_PLAYER_TT");
		strTT = strTT .. "[NEWLINE]";
		strTT = strTT .. strYourTradeRoutes;
	end

	local strToYouTradeRoutes = pPlayer:GetTradeToYouRoutesTTString();
	if (strToYouTradeRoutes ~= "") then
		strTT = strTT .. "[NEWLINE][NEWLINE]"
		strTT = strTT .. Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_ITR_ESTABLISHED_BY_OTHER_TT");
		strTT = strTT .. "[NEWLINE]";
		strTT = strTT .. strToYouTradeRoutes;
	end
	
	----print(strText);
	if(strText ~= "") then
		tipControlTable.TopPanelMouseover:SetHide(false);
		tipControlTable.TooltipLabel:SetText( strTT );
	else
		tipControlTable.TopPanelMouseover:SetHide(true);
	end
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
end

-- COMMUNITY PATCH CHANGE
-------------------------------------------------
-------------------------------------------------
function OpenEcon()
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW } );
end
Controls.HappinessString:RegisterCallback( Mouse.eLClick, OpenEcon );
--END

-------------------------------------------------
-- On Top Panel mouseover exited
-------------------------------------------------
--function HelpClose()
	---- Hide the help text box
	--Controls.HelpTextBox:SetHide( true );
--end


-- Register Events
Events.SerialEventGameDataDirty.Add(OnTopPanelDirty);
Events.SerialEventTurnTimerDirty.Add(OnTopPanelDirty);
Events.SerialEventCityInfoDirty.Add(OnTopPanelDirty);

-- Update data at initialization
UpdateData();
DoInitTooltips();