-------------------------------------------------
-- TECH PANEL
-------------------------------------------------
include( "InstanceManager" );
include( "IconSupport" );
include("JFD_RTPUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")

local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]

local resourceDignitaryID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local resourceMagistrateID = GameInfoTypes["RESOURCE_MAGISTRATES"]

local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
local reformExecutiveAbsoluteID = GameInfoTypes["REFORM_JFD_EXECUTIVE_ABSOLUTE"]
local reformExecutiveConstitutionalID = GameInfoTypes["REFORM_JFD_EXECUTIVE_CONSTITUTIONAL"]
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1

--local maxSmallButtons = 5;
--
--local eRecentTech = -1;
--local eCurrentTech= -1;
--
--local techPortraitSize = Controls.CivIcon:GetSize().x;
--
--local helpTT = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_NEW_RESEARCH" );
--
function OnCivButtonClicked()
    LuaEvents.JFD_PS_Sovereignty_ShowGovernmentOverview()
end
Controls.CivButton:RegisterCallback( Mouse.eLClick, OnCivButtonClicked );
--Controls.BigCivButton:RegisterCallback( Mouse.eLClick, OnTechnologyButtonClicked );

--function OnTechnologyButtonRClicked()
--
--	local tech = eCurrentTech;
--	if tech == -1 then
--		tech = eRecentTech;
--	end
--	
--	if tech ~= -1 then
--		local pTechInfo = GameInfo.Technologies[tech];
--		if pTechInfo then
--		
--			-- search by name
--			local searchString = Locale.ConvertTextKey( pTechInfo.Description );
--			Events.SearchForPediaEntry( searchString );			
--		end
--	end
--	
--end
--Controls.BigCivButton:RegisterCallback( Mouse.eRClick, OnTechnologyButtonRClicked );

local gridX = 470
local gridY = 45
function OnCivPanelUpdated()
	
	--local pPlayer = Players[Game.GetActivePlayer()];
	--local pTeam = Teams[pPlayer:GetTeam()];
	--local pTeamTechs = pTeam:GetTeamTechs();
	--
	--eCurrentTech = pPlayer:GetCurrentResearch();
	--eRecentTech = pTeamTechs:GetLastTechAcquired();
	--
	--local fResearchProgressPercent = 0;
	--local fResearchProgressPlusThisTurnPercent = 0;
	--
	--local researchStatus = "";
	--local szText = "";
	--
	--techPediaSearchStrings = {};
	--
	--	
	--local iResearchTurnsLeft = pPlayer:GetResearchTurnsLeft(eCurrentTech, true);
	--local iCurrentResearchProgress = pPlayer:GetResearchProgress(eCurrentTech);
	--local iResearchNeeded = pPlayer:GetResearchCost(eCurrentTech);
	--local iResearchPerTurn = pPlayer:GetScience();
	--local iCurrentResearchPlusThisTurn = iCurrentResearchProgress + iResearchPerTurn;
	--
	--fResearchProgressPercent = iCurrentResearchProgress / iResearchNeeded;
	--fResearchProgressPlusThisTurnPercent = iCurrentResearchPlusThisTurn / iResearchNeeded;
	--
	--if (fResearchProgressPlusThisTurnPercent > 1) then
	--	fResearchProgressPlusThisTurnPercent = 1
	--end
	
	local civilization = GameInfo.Civilizations[activePlayer:GetCivilizationType()]
	if civilization then
		--Update civ and leader icon
		local civilization = GameInfo.Civilizations[activePlayer:GetCivilizationType()]
		local leader = GameInfo.Leaders[activePlayer:GetLeaderType()]
		IconHookup( civilization.PortraitIndex, 45, civilization.IconAtlas, Controls.CivIcon )
		IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.LeaderIcon )
		Controls.LeaderIcon:LocalizeAndSetToolTip(JFD_GetLeaderTitle(activePlayerID))
		Controls.CivIcon:LocalizeAndSetToolTip(activePlayer:GetCivilizationShortDescription())
		
		--Update civ description
		-- local leaderTitle = JFD_GetLeaderTitle(activePlayerID)
		-- if (not leaderTitle) then leaderTitle = activePlayer:GetName() end
		Controls.CivText:SetText(activePlayer:GetCivilizationDescription())
		Controls.CivText:LocalizeAndSetToolTip(activePlayer:GetCivilizationDescription())
		-- Controls.LeaderTitle:SetText(leaderTitle)
		-- Controls.LeaderTitle:SetToolTipString(leaderTitle)
		
		--Update box
		-- local titleX, titleY = Controls.LeaderTitle:GetSizeVal()
		-- Controls.ActiveStyle:SetSizeVal(gridX, gridY+titleY)
		
		-- if IconHookup( civilization.PortraitIndex, 128, civilization.IconAtlas, Controls.CivIcon ) then
			-- Controls.CivIcon:SetHide( false );
		-- else
			-- Controls.CivIcon:SetHide( true );
		-- end

		---- Update the little icons
		--local numButtonsAdded = AddSmallButtonsToCivButton( Controls, pTechInfo, maxSmallButtons, 64 );
		--numButtonsAdded = math.max( 0, numButtonsAdded );
		--
		--AddCallbackToSmallButtons( Controls, maxSmallButtons, -1, -1, Mouse.eLClick, OnTechnologyButtonClicked );
		--
		--if numButtonsAdded > 0 then
		--	if OptionsManager.GetSmallUIAssets() then		
		--		Controls.ActiveStyle:SetSizeVal( numButtonsAdded*56 + 76, 126 );
		--	else
		--		Controls.ActiveStyle:SetSizeVal( numButtonsAdded*56 + 130, 126 );
		--	end
		--	Controls.ActiveStyle:SetHide( false );
		--else
		--	Controls.ActiveStyle:SetHide( true );
		--end
		local civDesc = activePlayer:GetCivilizationDescription()
		Controls.CivText:SetText(civDesc);
		Controls.CivText:SetHide(false);
		Controls.LeaderText:SetText(activePlayer:GetName());
		Controls.LeaderText:LocalizeAndSetToolTip(JFD_GetLeaderTitle(activePlayerID));
		Controls.LeaderText:SetHide(false);

		--Update box
		-- Controls.CivTitleGrid:SetSizeVal(civTitleGridX, civTitleGridY)
		local politicX, politicY = Controls.Politics:GetSizeVal()
		-- if JFD_HasLegislature(playerID) then
			-- Controls.CivTitleGrid:SetSizeVal(civTitleGridX+(politicX/2), civTitleGridY)
		-- end
		
		--Update government
		local currentGovernmentID = activePlayer:GetGovernment()
		local currentPoliticID = -1
		local govtPortraitIndex = 0
		local govtIconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ATLAS"
		local govermentDesc = "Government: [COLOR_JFD_SOVEREIGNTY]Tribe[ENDCOLOR]"
		local powerDesc = "(Despotic)"
		local politicDesc = "Politics: [COLOR_JFD_SOVEREIGNTY_FADING]None[ENDCOLOR]"
		Controls.Politics:SetHide(true)
		if currentGovernmentID > -1 then
			currentPoliticID = JFD_GetDominantPoliticID(activePlayerID)
			local government = GameInfo.JFD_Governments[currentGovernmentID]
			govtPortraitIndex = government.PortraitIndex
			govtIconAtlas = government.IconAtlas
			if JFD_HasReform(activePlayerID, reformExecutiveAbsoluteID) then
				powerDesc = "(Absolute)"
			elseif JFD_HasReform(activePlayerID, reformExecutiveConstitutionalID) then
				powerDesc = "(Constitutional)"
			end
			govermentDesc = Locale.ConvertTextKey("Government: [COLOR_JFD_SOVEREIGNTY] {1_GovtDesc} {2_PowerDesc}[ENDCOLOR]", government.Description, powerDesc)
			if currentGovernmentID == governmentTheocracyID then
				politicDesc = Locale.ConvertTextKey("Dominant: [COLOR_JFD_SOVEREIGNTY_FADING] {2_FontIcon}{1_PoliticDesc}[ENDCOLOR]", JFD_GetPoliticDescription(activePlayerID, currentReligionID, true), "[ICON_JFD_CLERGY]")
				Controls.Politics:SetHide(false)
				Controls.Politics:LocalizeAndSetText(politicDesc)
			elseif currentPoliticID and currentPoliticID > -1 then
				local politicInfo = GameInfo.JFD_Politics[currentPoliticID]
				politicDesc = Locale.ConvertTextKey("Dominant: [COLOR_JFD_SOVEREIGNTY_FADING] {3_FontIcon} {1_PoliticDesc} ({2_ShortDesc})[ENDCOLOR]", JFD_GetPoliticDescription(activePlayerID, currentPoliticID), politicInfo.ShortDescription, politicInfo.FontIcon)
				Controls.Politics:SetHide(false)
				Controls.Politics:LocalizeAndSetText(politicDesc)
			end
		end
		IconHookup( govtPortraitIndex, 45, govtIconAtlas, Controls.GovtIcon )
		Controls.GovtButton:LocalizeAndSetToolTip(govermentDesc)
		
		--Update religion
		local currentReligionID = JFD_GetMainReligionID(activePlayerID)
		if currentReligionID == -1 then currentReligionID = 0 end
		local currentReligionDesc = "[ICON_RELIGION]Religion: [COLOR_WHITE]None[ENDCOLOR]"
		local religion = GameInfo.Religions[currentReligionID]
		-- Controls.CurrentReligion:SetHide(true)
		if currentReligionID > 0 and activePlayer:GetCapitalCity() and Game.GetHolyCityForReligion(currentReligionID, activePlayerID) then
			currentReligionDesc = Locale.ConvertTextKey("[ICON_RELIGION]Religion: [COLOR_WHITE] {2_ReliFont}{1_ReliDesc}[ENDCOLOR]", Game.GetReligionName(currentReligionID), religion.IconString)
			-- Controls.CurrentReligion:SetHide(false)
		end		
		IconHookup( religion.PortraitIndex, 45, religion.IconAtlas, Controls.ReligionIcon )
		Controls.ReligionButton:SetText(religion.IconString)
		if not Controls.ReligionIcon == nil then
		Controls.ReligionIcon:LocalizeAndSetToolTip(currentReligionDesc)
		end
		
		if resourceMagistrateID then
			Controls.DecisionsText:LocalizeAndSetText("TXT_KEY_CIVILIZATION_PANEL_JFD_DECISIONS", JFD_GetNumEnactableDecisions(activePlayerID))
			Controls.DecisionsText:SetHide(false);
			Controls.MagistratesText:LocalizeAndSetText("TXT_KEY_CIVILIZATION_PANEL_JFD_MAGISTRATES", activePlayer:GetNumResourceAvailable(resourceMagistrateID, false))
			Controls.MagistratesText:SetHide(false);
			--if resourceDignitaryID then
				Controls.DignitariesText:LocalizeAndSetText("TXT_KEY_CIVILIZATION_PANEL_JFD_DIGNITARIES", activePlayer:GetNumResourceAvailable(resourceDignitaryID, false))
				Controls.DignitariesText:SetHide(false);
			--else
				--Controls.DignitariesText:SetHide(true);
			--end
		else
			Controls.DecisionsText:SetHide(true);
			Controls.DignitariesText:SetHide(true);
			Controls.MagistratesText:SetHide(true);
		end
	end
	
	

	--- Tech Text
	--Controls.CivText:SetText(researchStatus .. " " .. szText);
	--Controls.FinishedCivText:SetText(researchStatus .. " " .. szText);
	
end
Events.SerialEventGameDataDirty.Add(OnCivPanelUpdated);
	
	
-------------------------------------------------
-------------------------------------------------
function OnOpenInfoCorner( iInfoType )
    -- show if it's our id and we're not already visible
    if( iInfoType == InfoCornerID.Civilization ) then
        ContextPtr:SetHide( false );
    else
        ContextPtr:SetHide( true );
    end
end
Events.OpenInfoCorner.Add( OnOpenInfoCorner );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnPopup( popupInfo )	
    if( (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CHOOSETECH or popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CHOOSE_TECH_TO_STEAL) and
        ContextPtr:IsHidden() == true ) then
        Events.OpenInfoCorner( InfoCornerID.Civilization );
    end
end
--Events.SerialEventGameMessagePopup.Add( OnPopup );

----------------------------------------------------------------
----------------------------------------------------------------
--function UpdatePlayerData()
--	local playerID = Game.GetActivePlayer();	
--	local player = Players[playerID];
--	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
--	GatherInfoAboutUniqueStuff( civType );
--end

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnCivPanelActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	-- UpdatePlayerData();    
	OnCivPanelUpdated();
end
Events.GameplaySetActivePlayer.Add(OnCivPanelActivePlayerChanged);

-- UpdatePlayerData();    
OnCivPanelUpdated();
