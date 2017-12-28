-- Lua Ynaem Extended
-- Author: Firaxis
-- Edited for Ynaem by Gedemon
-------------------------------------------------
-- Advanced Settings Screen
-------------------------------------------------
--[[
	Design Overview
	The UI is made up of a table of *ScreenOptions* which are tables themselves consisting of a common interface.
	These common methods are called one after the other when certain events occur to ensure that the data is 
	up-to-date and valid.
	
	ScreenOption overview
	Each option structure contains the following functions:
		FullSync()		--	Refreshes all possible values and current value from the game.
							This is also where event handlers for controls are typically assigned.
		PartialSync()	--	Refreshes only the current value from the game.
		Validate(args)	--	Verifies that current value is a valid value (if not, will assign args.Valid = false)

	When a value is changed for whatever reason, validation is performed to determine whether 
	or not we can enable/disable the start button.

	When the screen is shown, a partial sync is performed to ensure values are update.
	
	Full syncs are performed either when the screen is initialized or when mods change the game state.
----------------------------------------------------------------------------------------------------------------------]]
include( "IconSupport" );
include( "UniqueBonuses" );
include( "InstanceManager" );

-------------------------------------------------
-- Globals
-------------------------------------------------
g_SlotInstances = {};	-- Container for all player slots 
g_GameOptionsManager = InstanceManager:new("GameOptionInstance", "GameOptionRoot", Controls.GameOptionsStack);
g_DropDownOptionsManager = InstanceManager:new("DropDownOptionInstance", "DropDownOptionRoot", Controls.DropDownOptionsStack);
g_VictoryCondtionsManager = InstanceManager:new("GameOptionInstance", "GameOptionRoot", Controls.VictoryConditionsStack);

g_Hotseat = {} -- Human slots, indexed on playerID

-------------------------------------------------
-- Ynaem
-------------------------------------------------

include( "YnaemDefines" )
include( "ResourcesRules" ) -- load after defines
include( "YnaemUtils" )
include( "YnaemFunctions" )

------------------------------------------------------------------------------------------------------
-- Complex Methods
-- Pulled out from Screen Options since they were so long
------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic drop down game options
function RefreshDropDownGameOptions()
	g_DropDownOptionsManager:ResetInstances();

	local currentMapScript = PreGame.GetMapScript();
	if(PreGame.IsRandomMapScript())then
		currentMapScript = nil;
	end
	
	--local options = {};
	local mapID = modUserData.GetValue ("MapID")
	local options = g_MapPulldownOptions[mapID]

	
	local sortedOptions = {};
	for k,v in pairs(options) do
		table.insert(sortedOptions, v);
	end
	 
	-- Sort the options
	table.sort(sortedOptions, function(a, b) 
		if(a.SortPriority == b.SortPriority) then
			return a.Name < b.Name; 
		else
			return a.SortPriority < b.SortPriority;
		end
	end);
	
	-- Update the UI!
	for _, option in ipairs(sortedOptions) do
		local gameOption = g_DropDownOptionsManager:GetInstance();
				
		gameOption.OptionName:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.OptionName:SetToolTipString(option.ToolTip);
		else
			gameOption.OptionName:SetToolTipString();
		end
		
		gameOption.OptionDropDown:SetDisabled(option.Disabled);
		local dropDownButton = gameOption.OptionDropDown:GetButton();
		
		gameOption.OptionDropDown:ClearEntries();
		for _, possibleValue in ipairs(option.Values) do
			controlTable = {};
			gameOption.OptionDropDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetText(possibleValue.Name);
			
			if(possibleValue.ToolTip ~= nil) then
				controlTable.Button:SetToolTipString(possibleValue.ToolTip);
			else
				controlTable.Button:SetToolTipString();
			end
			
			controlTable.Button:RegisterCallback(Mouse.eLClick, function()
				dropDownButton:SetText(possibleValue.Name);
				if(possibleValue.ToolTip) then
					dropDownButton:SetToolTipString(possibleValue.ToolTip);
				else
					dropDownButton:SetToolTipString();
				end
				PreGame.SetMapOption(option.ID, possibleValue.Value);
				PerformPartialSync()
				if possibleValue.Name == "Only TSL" or possibleValue.Name == "Random and TSL" or possibleValue.Name == "Totally random" then
					PerformCivFullSync()
				end
			end);
				
		end
		
		--Assign the currently selected value.
		local savedValue = PreGame.GetMapOption(option.ID);
		local defaultValue;
		if(savedValue ~= -1) then
			defaultValue = option.Values[savedValue];
		else
			defaultValue = option.Values[option.DefaultValue];
		end
		
		if(defaultValue ~= nil) then
			dropDownButton:SetText(defaultValue.Name);
			
			if(defaultValue.ToolTip ~= nil) then
				dropDownButton:SetToolTipString(defaultValue.ToolTip);
			else
				dropDownButton:SetToolTipString();
			end
		end
	
		if(option.Disabled) then
			dropDownButton:SetDisabled(true);
		end
		
		gameOption.OptionDropDown:CalculateInternals();
	end
	
	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic checkbox game options
function RefreshCheckBoxGameOptions()
	g_GameOptionsManager:ResetInstances();

	---------------------------------
	-- General Game Options
	local options = {}
		
	-- Ynaem options
	local mapID = modUserData.GetValue ("MapID")
	for i, option in ipairs(g_MapCheckboxOptions[mapID]) do
		--local savedValue = PreGame.GetMapOption(option.ID)

		local savedValue = modUserData.GetValue ("MapOption_"..option.ID)
		if (savedValue == nil) then
			savedValue = PreGame.GetMapOption(option.ID)
		else
			PreGame.SetMapOption(option.ID, savedValue == 1)
		end

		if(savedValue ~= nil) then
			option.Checked = savedValue == 1;
		end

		--if(savedValue ~= nil) and (savedValue > 0) then
		--	option.Checked = savedValue == 1
		--end
		table.insert(options, option)
	end
	
	-- Gather a list of all options
	for option in GameInfo.GameOptions{Visible = 1} do
		-- Ynaemp don't need start bias option
		if option.Type ~= "GAMEOPTION_DISABLE_START_BIAS" then
			local optionToolTip, optionChecked, optionDisabled
			if ( option.Type == "GAMEOPTION_COMPLETE_KILLS" ) and ( g_dynamicCS == 1 ) then
				-- Dynamic history need the complete kills option to be checked
				optionToolTip = "Complete Kills option is mandatory for Dynamic History"
				optionChecked = 1
				optionDisabled = true
				PreGame.SetGameOption(option.Type, 1)
				modUserData.SetValue ("GameOption_"..option.Type, 1)
			elseif ( option.Type == "GAMEOPTION_NO_BARBARIANS" ) and ( g_dynamicCS == 1 ) then
				-- Dynamic history use custom barbarians
				optionToolTip = "Dynamic history use custom barbarians spawning"
				optionChecked = 1
				optionDisabled = true
				PreGame.SetGameOption(option.Type, 1)
				modUserData.SetValue ("GameOption_"..option.Type, 1)
			else
				optionToolTip = (option.Help) and Locale.ConvertTextKey(option.Help) or nil
				optionChecked = (option.Default == 1) and true or false
				optionDisabled = false
			end
			local option = {
				Type = option.Type,
				Name = Locale.ConvertTextKey(option.Description),
				ToolTip = optionToolTip,
				Checked = optionChecked,
				Disabled = optionDisabled,
				GameOption = true,
				SortPriority = 10,
			}
			
			local savedValue = modUserData.GetValue ("GameOption_"..option.Type)
			if (savedValue == nil) then
				savedValue = PreGame.GetGameOption(option.Type);		
			else
				PreGame.SetGameOption(option.Type, savedValue == 1)
			end

			if(savedValue ~= nil) then
				option.Checked = savedValue == 1;
			end
						
			table.insert(options, option)
		end
	end
	
	for option in DB.Query("select * from MapScriptOptions where not exists (select 1 from MapScriptOptionPossibleValues where FileName = MapScriptOptions.FileName and OptionID = MapScriptOptions.OptionID) and Hidden = 0 and FileName = ?", PreGame.GetMapScript()) do
		local option = {
			ID = option.OptionID,
			Name = Locale.ConvertTextKey(option.Name),
			ToolTip = (option.Description) and Locale.ConvertTextKey(option.Description) or nil,
			Checked = (option.DefaultValue == 1) and true or false,
			Disabled = (option.ReadOnly == 1) and true or false,
			GameOption = false,
			SortPriority = option.SortPriority,
		};
		
		local savedValue = modUserData.GetValue ("MapOption_"..option.ID)
		if (savedValue == nil) then
			savedValue = PreGame.GetMapOption(option.ID)
		else
			PreGame.SetMapOption(option.ID, savedValue == 1)
		end

		if(savedValue ~= nil) then
			option.Checked = savedValue == 1;
		end
		
		table.insert(options, option);
	end

	-- Sort the options alphabetically
	table.sort(options, function(a, b) 
		if(a.SortPriority == b.SortPriority) then
			return a.Name < b.Name;
		else
			return a.SortPriority < b.SortPriority;
		end
	end);
	
	-- Add Options to UI.
	local sizeY = 0;
	for _, option in ipairs(options) do
		local gameOption = g_GameOptionsManager:GetInstance();
		
		local gameOptionTextButton = gameOption.GameOptionRoot:GetTextButton();
		gameOptionTextButton:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.GameOptionRoot:SetToolTipString(option.ToolTip);
		end
		
		gameOption.GameOptionRoot:SetDisabled(option.Disabled);
		gameOption.GameOptionRoot:SetCheck(option.Checked);
		sizeY = sizeY + gameOption.GameOptionRoot:GetSizeY();
		if(option.GameOption == true) then
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetGameOption(option.Type, bCheck);
				local value = 0
				if bCheck then value = 1 end
				modUserData.SetValue ("GameOption_"..option.Type, value)
			end);
		else
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetMapOption(option.ID, bCheck);
				local value = 0
				if bCheck then value = 1 end
				modUserData.SetValue ("MapOption_"..option.ID, value)
			end);
		end	
	end	
	
	Controls.CityStateStack:CalculateSize();
	Controls.CityStateStack:ReprocessAnchoring();
	
	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();
		
	Controls.MaxTurnStack:CalculateSize();
	Controls.MaxTurnStack:ReprocessAnchoring();
	
	Controls.GameOptionsStack:CalculateSize();
	Controls.GameOptionsStack:ReprocessAnchoring();
	
	Controls.GameOptionsFullStack:CalculateSize();
	Controls.GameOptionsFullStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------
-- Refreshes all of the player data.
function RefreshPlayerList()

	RefreshHumanPlayer();

	local count = 1;
	if(PreGame.IsRandomWorldSize()) then
		Controls.ListingScrollPanel:SetHide(true);
		Controls.UnknownPlayers:SetHide(false);
		Controls.AddAIButton:SetDisabled(true);
	else
		Controls.UnknownPlayers:SetHide(true);
		Controls.ListingScrollPanel:SetHide(false);
		Controls.AddAIButton:SetDisabled(false);
		
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1 do
			if( PreGame.GetSlotStatus( i ) ~= SlotStatus.SS_COMPUTER ) then
				g_SlotInstances[i].Root:SetHide( true );
				g_Hotseat[i] = false
			else
    			-- Player Listing Entry
    			local controlTable = g_SlotInstances[i];
				controlTable.Root:SetHide( false );
				controlTable.PlayerNameLabel:SetHide( true );
				
				if(i ~= 1) then --Don't allow player to delete first AI so games will always have at least 2 players
					controlTable.RemoveButton:SetHide(false);
					controlTable.RemoveButton:RegisterCallback( Mouse.eLClick, function()
					
						if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER) then
							PreGame.SetSlotStatus(i, SlotStatus.SS_OPEN);
							g_Hotseat[i] = false
						end
						PerformPartialSync();
					
					end);
				else
					controlTable.RemoveButton:SetHide(true);
				end
	            
				local civIndex = PreGame.GetCivilization( i );

				if( civIndex ~= -1 ) then
					local civ = GameInfo.Civilizations[ civIndex ];

					controlTable.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", count + 1);
					
					-- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
					local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
					local leaderDescription = leader.Description;

					--controlTable.LeaderName:SetText( Locale.ConvertTextKey( leaderDescription ) );
					controlTable.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey(leaderDescription), Locale.ConvertTextKey(civ.ShortDescription));

					IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
					IconHookup( civ.PortraitIndex, 64, civ.IconAtlas, controlTable.Icon );
				else
  					controlTable.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", count + 1);
					controlTable.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");

					IconHookup( 22, 64, "LEADER_ATLAS", controlTable.Portrait );
					SimpleCivIconHookup(-1, 64, controlTable.Icon);
				end
				count = count + 1;
			end
		end
	end
	
	Controls.CivCount:SetText(  Locale.ConvertTextKey("TXT_KEY_AD_SETUP_CIVILIZATION", count) );
	modUserData.SetValue ("NumPlayers", count)

	Controls.SlotStack:CalculateSize();
	Controls.SlotStack:ReprocessAnchoring();
	Controls.ListingScrollPanel:CalculateInternalSize();

end
------------------------------------------------------------------------------------------------------
-- Refreshes all of the human player data (called by RefreshPlayerList)
function RefreshHumanPlayer()
	local civIndex = PreGame.GetCivilization(0);

    if( civIndex ~= -1 ) then
        local civ = GameInfo.Civilizations[civIndex];

        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
		local leaderDescription = leader.Description;

		local name = PreGame.GetLeaderName(0);
		local civName = PreGame.GetCivilizationShortDescription(0);

		if(name ~= "") then
			Controls.CivPulldown:SetHide(true);
			Controls.CivName:SetHide(false);
			Controls.CivName:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName ));
			Controls.RemoveButton:SetHide(false);
		else
			Controls.CivName:SetHide(true);
			Controls.RemoveButton:SetHide(true);
			Controls.CivPulldown:SetHide(false);
			Controls.CivPulldown:GetButton():SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey( leaderDescription ), Locale.ConvertTextKey( civ.ShortDescription ) ) );
		end
		
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, Controls.Portrait );
		IconHookup( civ.PortraitIndex, 64, civ.IconAtlas, Controls.Icon );
	else
		Controls.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", 1);
		local name = PreGame.GetLeaderName(0);
		local civName = PreGame.GetCivilizationShortDescription(0);
		
		if(name ~= "") then
			Controls.CivPulldown:SetHide(true);
			Controls.CivName:SetHide(false);
			Controls.CivName:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName ));
			Controls.RemoveButton:SetHide(false);
		else
			Controls.CivName:SetHide(true);
			Controls.RemoveButton:SetHide(true);
			Controls.CivPulldown:SetHide(false);
			Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");
		end

		IconHookup( 22, 64, "LEADER_ATLAS", Controls.Portrait );
		SimpleCivIconHookup(-1, 64, Controls.Icon);
    end
end
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- Screen Options
------------------------------------------------------------------------------------------------------
ScreenOptions = {

----------------------------------------------------------------
["Civs"] = {
	FullSync = function()
	
		function GetPlayableCivInfo()
			local civs = {};
			local sql = [[Select	Civilizations.ID as CivID, 
									Leaders.ID as LeaderID, 
									Civilizations.Description, 
									Civilizations.ShortDescription, 
									Leaders.Description as LeaderDescription 
									from Civilizations, Leaders, Civilization_Leaders 
									where Civilizations.Playable = 1 and CivilizationType = Civilizations.Type and LeaderheadType = Leaders.Type]];
	
			for row in DB.Query(sql) do
				-- Allow only civs with TSL to be selected
				if CivHasTSL(row.CivID) or (PreGame.GetMapOption(MAJOR_PLACEMENT) ~= MAJOR_TSL_ONLY) then
					table.insert(civs, {
						CivID = row.CivID,
						LeaderID = row.LeaderID,
						LeaderDescription = row.LeaderDescription,
						ShortDescription = row.ShortDescription,
						Description = row.Description,
					});
				end
			end
			
			return civs;
		end
	
		function PopulateCivPulldown( playableCivs, pullDown, playerID )
			-- clear previous entry (could change from map selection)
			pullDown:ClearEntries();

			-- set up the random slot
			local controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetVoids( playerID, -1 );
			controlTable.Button:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER");
			controlTable.Button:LocalizeAndSetToolTip("TXT_KEY_RANDOM_LEADER_HELP");
	
			for id, civ in ipairs(playableCivs) do
				local controlTable = {};
				pullDown:BuildEntry( "InstanceOne", controlTable );

				controlTable.Button:SetVoids( playerID, id );
				controlTable.Button:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey(civ.LeaderDescription), Locale.ConvertTextKey(civ.ShortDescription));
				controlTable.Button:LocalizeAndSetToolTip(civ.Description);
			end    
		    
			pullDown:CalculateInternals();
			pullDown:RegisterSelectionCallback(function(playerID, id)
				local civID = playableCivs[id] and playableCivs[id].CivID or -1;
			
				PreGame.SetCivilization( playerID, civID);
				PerformPartialSync();
			end);
		end
		
		local playableCivs = GetPlayableCivInfo();
		PopulateCivPulldown(playableCivs, Controls.CivPulldown, 0 );
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			PopulateCivPulldown(playableCivs, g_SlotInstances[i].CivPulldown, i );
		end
	end,
	
	PartialSync = function()
		RefreshPlayerList();
	end,
	
},
----------------------------------------------------------------

----------------------------------------------------------------
["CustomOptions"] = {
	FullSync = function()
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
	
	PartialSync = function()
		-- Still doing a full sync here..
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["Eras"] = {
	FullSync = function()
		local pullDown = Controls.EraPullDown;
		pullDown:ClearEntries();
		for info in GameInfo.Eras() do

			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:LocalizeAndSetText(info.Description);
			instance.Button:SetVoid1( info.ID );
		end
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback( function(id)
			local era = GameInfo.Eras[id];
			PreGame.SetEra( id );
			modUserData.SetValue ("StartEra", id);
			pullDown:GetButton():LocalizeAndSetText(era.Description);
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.Eras[ PreGame.GetEra() ];
		Controls.EraPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.EraPullDown:GetButton():LocalizeAndSetToolTip(info.Strategy);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["GameSpeeds"] = {
	FullSync = function()
		local pullDown = Controls.GameSpeedPullDown;
		
		pullDown:ClearEntries();
	
		local gameSpeeds = {};
		for row in GameInfo.GameSpeeds() do
			table.insert(gameSpeeds, row);
		end
		table.sort(gameSpeeds, function(a, b) return b.VictoryDelayPercent < a.VictoryDelayPercent end);

		for _, v in ipairs(gameSpeeds) do
			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:SetText( Locale.ConvertTextKey( v.Description ) );
			instance.Button:SetToolTipString( Locale.ConvertTextKey( v.Help ) );
			instance.Button:SetVoid1( v.ID );
		end
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback( function(id)
			PreGame.SetGameSpeed( id );
			modUserData.SetValue ("Speed", id);			
			local gameSpeed = GameInfo.GameSpeeds[id];
			pullDown:GetButton():LocalizeAndSetText(gameSpeed.Description);
			pullDown:GetButton():SetToolTipString( Locale.ConvertTextKey( gameSpeed.Help ) );
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ];
		Controls.GameSpeedPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.GameSpeedPullDown:GetButton():SetToolTipString( Locale.ConvertTextKey( info.Help ) );
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["Handicaps"] = {
	FullSync = function()
		local pullDown = Controls.HandicapPullDown;
		pullDown:ClearEntries();
		for info in GameInfo.HandicapInfos() do

			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:LocalizeAndSetText(info.Description);
			instance.Button:LocalizeAndSetToolTip(info.Help);
			instance.Button:SetVoid1( info.ID );
		end
		
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback(function(id)
			local handicap = GameInfo.HandicapInfos[id];
			PreGame.SetHandicap( 0, id );
			modUserData.SetValue ("Handicap", id);
			pullDown:GetButton():LocalizeAndSetText(handicap.Description);
			pullDown:GetButton():LocalizeAndSetToolTip(handicap.Help);
		
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.HandicapInfos[PreGame.GetHandicap(0)];
		Controls.HandicapPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.HandicapPullDown:GetButton():LocalizeAndSetToolTip(info.Help);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------

----------------------------------------------------------------

----------------------------------------------------------------
["MapTypes"] = {
	FullSync = function()
		local pullDown = Controls.MapTypePullDown
		pullDown:ClearEntries()	
		controlTable = {}		
		local mapScripts = {}

		for i, row in pairs(g_MapList) do
			local script = {};
			local file = Modding.GetEvaluatedFilePath(YnaemModId, YnaemModVersion, row.File)
			script.FileName = file.EvaluatedPath
			script.ID = row.ID
			script.IconIndex = 0
			script.Name = row.Name
			script.Description = row.Description or ""
			script.Size = row.Size
			script.Civs = row.Civs
			script.Minors = row.Minors
			
			table.insert(mapScripts, script);	
		end	
		table.sort(mapScripts, function(a,b) return Locale.Compare(a.Name, b.Name) < 0 end)
		for i, script in ipairs(mapScripts) do
			controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );
		    
			controlTable.Button:SetText(script.Name);
			controlTable.Button:SetToolTipString(script.Description);
			controlTable.Button:SetVoid1(i);
		end
		pullDown:CalculateInternals();

		pullDown:RegisterSelectionCallback( function(id)
			local mapScript = mapScripts[id]
			
			PreGame.SetLoadWBScenario(false)
			
			PreGame.SetEarthMap(false)
			PreGame.SetRandomMapScript(false)
			PreGame.SetMapScript(mapScript.FileName)

			--PreGame.SetNumMinorCivs(mapScript.Minors)

			-- defaut Major placement
			PreGame.SetMapOption(MAJOR_PLACEMENT, MAJOR_TSL_RANDOM)
			-- defaut City States placement
			PreGame.SetMapOption(MINOR_PLACEMENT, MINOR_TSL_ONLY)
			-- defaut City States distance
			PreGame.SetMapOption(MINOR_DISTANCE, MINOR_DISTANCE_MINI)

			mapSize = GameInfo["Worlds"][mapScript.Size]["ID"]
			PreGame.SetWorldSize(mapSize)

			modUserData.SetValue ("MapID", mapScript.ID)
						
			local numPlayers = mapScript.Civs
			for i = 1, numPlayers do
					PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
					g_Hotseat[i] = false
			end
				
			for i = numPlayers, GameDefines.MAX_MAJOR_CIVS do
				if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER) then
					PreGame.SetSlotStatus(i, SlotStatus.SS_OPEN)
					g_Hotseat[i] = false
				end
			end
					
			ScreenOptions["Teams"].FullSync()
			ScreenOptions["MinorCivs"].FullSync()
			ScreenOptions["Civs"].FullSync()
			ScreenOptions["Hotseat"].FullSync()
						
			PerformPartialSync()
		end)	
	end,
	
	PartialSync = function()
		local pullDown = Controls.MapTypePullDown
		local mapScriptFileName = PreGame.GetMapScript()

		for i, row in pairs(g_MapList) do
			local file = Modding.GetEvaluatedFilePath(YnaemModId, YnaemModVersion, row.File)
			if file.EvaluatedPath == mapScriptFileName then
				pullDown:GetButton():LocalizeAndSetText(row.Name)
				pullDown:GetButton():LocalizeAndSetToolTip(row.Description or "")
				break
			end
		end

		--Controls.MapTypePullDown:GetButton():SetDisabled(true)
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["MaxTurns"] = {
	FullSync = function()
		Controls.MaxTurnsCheck:RegisterCallback( Mouse.eLClick, function()
			if(Controls.MaxTurnsCheck:IsChecked()) then
				Controls.MaxTurnsEditbox:SetHide(false);
			else
				Controls.MaxTurnsEditbox:SetHide(true);
				PreGame.SetMaxTurns(0);
			end
			
			PerformPartialSync();
		end);

		Controls.MaxTurnsEdit:RegisterCallback(function()
			PreGame.SetMaxTurns(Controls.MaxTurnsEdit:GetText());
		end);
		
		ScreenOptions["MaxTurns"].PartialSync();
	end,
	
	PartialSync = function()
		local maxTurns = PreGame.GetMaxTurns();
		if(maxTurns > 0) then
			Controls.MaxTurnsCheck:SetCheck(true);
		end
		Controls.MaxTurnsEditbox:SetHide(not Controls.MaxTurnsCheck:IsChecked());
		Controls.MaxTurnsEdit:SetText(maxTurns);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["MinorCivs"] = {
	FullSync = function()
		function OnMinorCivsSlider( fValue )
			local maxMinor = GetMaxMinor()
			modUserData.SetValue ("NumMinorCivs", math.floor( fValue * maxMinor ) )
			--PreGame.SetNumMinorCivs( math.floor( fValue * #GameInfo.MinorCivilizations ) );
			if maxMinor == 0 then
				Controls.MinorCivsSlider:SetValue( 0 );
			else
				Controls.MinorCivsSlider:SetValue( modUserData.GetValue("NumMinorCivs") / maxMinor );
			end
			Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", math.floor(fValue * maxMinor));
		end
		Controls.MinorCivsSlider:RegisterSliderCallback( OnMinorCivsSlider );
	end,
	
	PartialSync = function()
		if ( not PreGame.IsRandomWorldSize() ) then
			
			Controls.MinorCivsSlider:SetHide(false);
			Controls.MinorCivsLabel:SetHide(false);

			Controls.MinorCivsSlider:SetValue( modUserData.GetValue("NumMinorCivs") / GetMaxMinor() );
			Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", modUserData.GetValue("NumMinorCivs"));
		else
			Controls.MinorCivsSlider:SetHide(true);
			Controls.MinorCivsLabel:SetHide(true);

			Controls.MinorCivsSlider:SetValue(modUserData.GetValue("NumMinorCivs") / GetMaxMinor() );
			Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", modUserData.GetValue("NumMinorCivs"));
		end
	end,	
},
----------------------------------------------------------------

----------------------------------------------------------------
["Teams"] = {
	FullSync = function()
		function PopulateTeamPulldown( pullDown, playerID )
			local count = 0;

			pullDown:ClearEntries();
			
			-- Display Each Player
			local controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );
			
			controlTable.Button:LocalizeAndSetText("TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", 1);
			controlTable.Button:SetVoids( playerID, 0 );
			
			for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				if( PreGame.GetSlotStatus( i ) == SlotStatus.SS_COMPUTER ) then
					local controlTable = {};
					pullDown:BuildEntry( "InstanceOne", controlTable );
					
					controlTable.Button:LocalizeAndSetText("TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", i + 1);
					controlTable.Button:SetVoids( playerID, i );
				end
			end    

			pullDown:CalculateInternals();
			pullDown:RegisterSelectionCallback(function(playerID, playerChoiceID)
				
				PreGame.SetTeam(playerID, playerChoiceID);
				local slotInstance = g_SlotInstances[playerID];
				
				if( slotInstance ~= nil ) then
					slotInstance.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(playerID) + 1 );
				else
					Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(playerID) + 1 );
				end
				
				PerformValidation();
			end);
			
			
			local team = PreGame.GetTeam(playerID);
			local slotInstance = g_SlotInstances[playerID];
			
			if( slotInstance ~= nil ) then
				slotInstance.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
			else
				Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
			end

		end
	
		PopulateTeamPulldown( Controls.TeamPullDown, 0);
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			PopulateTeamPulldown( g_SlotInstances[i].TeamPullDown, i);
		end		
	end,
	
	PartialSync = function()
		Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(0) + 1 );
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local team = PreGame.GetTeam(i);
			g_SlotInstances[i].TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
		end		
	end,
	
	Validate = function(args)
		local playerTeam = PreGame.GetTeam(0);
	    
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1 do
			if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER ) then
        		if( PreGame.GetTeam(i) ~= playerTeam ) then
        			return;
        		end
    		end
		end
		
		args.Valid = false;
		args.Reason = "TXT_KEY_BAD_TEAMS";
	end,
},
-------------------------------------------------

----------------------------------------------------------------
["Hotseat"] = {
	FullSync = function()
		function PopulateHotseatPulldown( pullDown, playerID )
			local count = 0;
			
			pullDown:ClearEntries();
			
			-- Display Each Player
			local controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );			
			controlTable.Button:LocalizeAndSetText("A.I.");
			controlTable.Button:SetVoids( playerID, 0 );
			
			pullDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:LocalizeAndSetText("Human");
			controlTable.Button:SetVoids( playerID, 1 );


			pullDown:CalculateInternals();
			pullDown:RegisterSelectionCallback(function(playerID, playerChoiceID)
				
				g_Hotseat[playerID] = (playerChoiceID == 1) -- set playerID hotseat value to true if playerChoiceID = 1

				local slotInstance = g_SlotInstances[playerID];
				
				if g_Hotseat[playerID] then
					if( slotInstance ~= nil ) then
						slotInstance.HotseatLabel:LocalizeAndSetText( "Human" );
					else
						Controls.HotseatLabel:LocalizeAndSetText( "Human" );
					end
				else
					if( slotInstance ~= nil ) then
						slotInstance.HotseatLabel:LocalizeAndSetText( "A.I." );
					else
						Controls.HotseatLabel:LocalizeAndSetText( "A.I." );
					end
				end
				
				--PerformValidation();
			end);
						

			local slotInstance = g_SlotInstances[playerID];
			
			if g_Hotseat[playerID] then
				if( slotInstance ~= nil ) then
					slotInstance.HotseatLabel:LocalizeAndSetText( "Human" );
				else
					Controls.HotseatLabel:LocalizeAndSetText( "Human" );
				end
			else
				if( slotInstance ~= nil ) then
					slotInstance.HotseatLabel:LocalizeAndSetText( "A.I." );
				else
					Controls.HotseatLabel:LocalizeAndSetText( "A.I." );
				end
			end

		end	

		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do -- i = 0 is always human
			PopulateHotseatPulldown( g_SlotInstances[i].HotseatPullDown, i);
		end		
	end,
	
	PartialSync = function()
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do -- i = 0 is always human
			if g_Hotseat[i] then
				g_SlotInstances[i].HotseatLabel:LocalizeAndSetText( "Human" );
			else
				g_SlotInstances[i].HotseatLabel:LocalizeAndSetText( "A.I." );
			end
		end	
	end,
},
-------------------------------------------------

----------------------------------------------------------------
["VictoryConditions"] =	{
	FullSync = function()
		g_VictoryCondtionsManager:ResetInstances();
	
		for row in GameInfo.Victories() do
			local victoryCondition = g_VictoryCondtionsManager:GetInstance();
			
			local victoryConditionTextButton = victoryCondition.GameOptionRoot:GetTextButton();
			victoryConditionTextButton:LocalizeAndSetText(row.Description);
			
			local checked = modUserData.GetValue ("victoryCondition"..row.ID)
			if(checked ~= nil) then
				checked = checked == 1; -- convert 0 or 1 to false or true
				PreGame.SetVictory(row.ID, checked)
			end
			if (checked == nil) then
				checked = PreGame.IsVictory(row.Type);
			end
			victoryCondition.GameOptionRoot:SetCheck(checked);
			
			victoryCondition.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetVictory(row.ID, bCheck);
				local value = 0
				if bCheck then value = 1 end
				modUserData.SetValue ("victoryCondition"..row.ID, value)
			end);
		end
		
		Controls.VictoryConditionsStack:CalculateSize();
		Controls.VictoryConditionsStack:ReprocessAnchoring();
	end,
	
	PartialSync = function()
		ScreenOptions["VictoryConditions"].FullSync();
	end,
},
----------------------------------------------------------------

}
-------------------------------------------------

----------------------------------------------------------------
-- ScreenOptions methods
-- Used to manage the entries in ScreenOptions
----------------------------------------------------------------
function ForEachScreenOption(func, ...)
	for _,v in pairs(ScreenOptions) do
		if(v[func]) then
			v[func](...);
		end
	end
end
------------------------------------------------------------------
function PerformCivFullSync()
	ScreenOptions["Civs"].FullSync()
end
------------------------------------------------------------------
function PerformFullSync()
	ForEachScreenOption("FullSync");
end
------------------------------------------------------------------
function PerformPartialSync()
	ForEachScreenOption("PartialSync");
end
------------------------------------------------------------------
function PerformValidation()
	local args = {Valid = true};
	ForEachScreenOption("Validate", args);
	
	Controls.StartButton:SetDisabled(not args.Valid);
	
	if(not args.Valid) then
		Controls.StartButton:LocalizeAndSetToolTip(args.Reason);
	else
		Controls.StartButton:SetToolTipString(nil);
	end
end
------------------------------------------------------------------

------------------------------------------------------------------
-- Edit Player Details
------------------------------------------------------------------
Controls.EditButton:RegisterCallback( Mouse.eLClick, function()
	UIManager:PushModal(Controls.SetCivNames);
end);
-------------------------------------------------
function OnCancelEditPlayerDetails()
	Controls.RemoveButton:SetHide(true);
	Controls.CivName:SetHide(true);
	Controls.CivPulldown:SetHide(false);

	PreGame.SetLeaderName( 0, "");
	PreGame.SetCivilizationDescription( 0, "");
	PreGame.SetCivilizationShortDescription( 0, "");
	PreGame.SetCivilizationAdjective( 0, "");
	
	local civIndex = PreGame.GetCivilization( 0 );
    if( civIndex ~= -1 ) then
		local civ = GameInfo.Civilizations[ civIndex ];

        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
		local leaderDescription = leader.Description;
		
		Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey(leaderDescription), Locale.ConvertTextKey(civ.ShortDescription));
	else
		Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");
	end
end
Controls.RemoveButton:RegisterCallback( Mouse.eLClick, OnCancelEditPlayerDetails );
------------------------------------------------------------------



   
---------------------------------------------------------------- 
-- Add AI Button Handler
---------------------------------------------------------------- 
function OnAdAIClicked()
    -- skip player 0 
    for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        if( PreGame.GetSlotStatus(i) ~= SlotStatus.SS_COMPUTER) then
            PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER);
            PreGame.SetCivilization(i, -1);
            break;
        end
    end
	ScreenOptions["Teams"].FullSync();
	ScreenOptions["Hotseat"].FullSync()
    PerformPartialSync();
end
Controls.AddAIButton:RegisterCallback(Mouse.eLClick, OnAdAIClicked);


---------------------------------------------------------------- 
-- Back Button Handler
---------------------------------------------------------------- 
function OnBackClicked()
	-- remove YnAEMP check
	modUserData.SetValue("LoadingYnaem", "false")

    UIManager:DequeuePopup( ContextPtr );
end
Controls.BackButton:RegisterCallback(Mouse.eLClick, OnBackClicked);

---------------------------------------------------------------- 
-- Start Button Handler
---------------------------------------------------------------- 
function OnStartClicked()
	PreGame.SetPersistSettings(true)
	-- Initialise hotseat table
	bHotseat = false
	for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if i < modUserData.GetValue ("NumPlayers") then
			print("-------------------------------------")	
			print(" - initialize player " .. i+1)
			if g_Hotseat[i] then
				print("   - human player : " .. tostring(SlotStatus.SS_TAKEN))
				bHotseat = true
				PreGame.SetSlotStatus( i, SlotStatus.SS_TAKEN )
				PreGame.SetSlotClaim( i, SlotClaim.SLOTCLAIM_RESERVED )
				PreGame.SetHandicap( i, modUserData.GetValue ("Handicap") )

				local civIndex = PreGame.GetCivilization( i )
				if( civIndex ~= -1 ) then
					local civ = GameInfo.Civilizations[ civIndex ]
					local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType]
					PreGame.SetNickName( i, Locale.ConvertTextKey(leader.Description))
				else
					PreGame.SetNickName( i, "Player " .. i+1 )
				end
			else			
				print("   - computer player : " .. tostring(SlotStatus.SS_COMPUTER))				
				PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
				PreGame.SetSlotClaim(i, SlotClaim.SLOTCLAIM_ASSIGNED)
			end
		else
			print("-------------------------------------")	
			print(" - initialize player " .. i+1)
			print("   - empty slot : " .. tostring(PreGame.GetSlotStatus(i) ) )
			PreGame.SetSlotStatus(i, SlotStatus.SS_CLOSED)
		end
	end	
	print("-------------------------------------")

	local gameText = "game"

	if bHotseat then
		PreGame.SetGameType(GameTypes.GAME_HOTSEAT_MULTIPLAYER)
		local civIndex = PreGame.GetCivilization( 0 )
		if( civIndex ~= -1 ) then
			local civ = GameInfo.Civilizations[ civIndex ]
			local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType]
			PreGame.SetNickName( 0, Locale.ConvertTextKey(leader.Description)) -- this isn't working...
			PreGame.SetLeaderName(0, Locale.ConvertTextKey(leader.Description)) -- neither does this...
		else
			PreGame.SetNickName( 0, "The Player One" ) -- or this...
			PreGame.SetLeaderName(0, "The Player One") -- or even this !
		end

		gameText = "hotseat game"
	end

	-- on start, Ynaem save some data in mod DB
	-- in YnaemLoading.lua, we can't use PreGame
	modUserData.SetValue ("MajorPlacement", PreGame.GetMapOption(MAJOR_PLACEMENT))
	modUserData.SetValue ("MinorPlacement", PreGame.GetMapOption(MINOR_PLACEMENT))
	modUserData.SetValue ("Bosphorus", PreGame.GetMapOption(BOSPHORUS))
	modUserData.SetValue ("MinorDistance", PreGame.GetMapOption(MINOR_DISTANCE))
	modUserData.SetValue ("ResourceGeo", PreGame.GetMapOption(RESOURCE_GEO))
	modUserData.SetValue ("ResourceDeposit", PreGame.GetMapOption(RESOURCE_DEPOSIT))
	modUserData.SetValue ("ResourceQuantity", PreGame.GetMapOption(RESOURCE_QUANTITY))
	modUserData.SetValue ("ResourceScale", PreGame.GetMapOption(RESOURCE_SCALE))
	modUserData.SetValue ("ResourceRequested", PreGame.GetMapOption(RESOURCE_REQUESTED))
	-- reset this before loading to prevent unwanted removing of minor civ
	modUserData.SetValue("ToRemove", ".")
	-- this will allow the other parts of the mod to check if they should initialize or not
	modUserData.SetValue("LoadingYnaem", "true")

	-- no CS at start for DynHist, so tell it to Revolution mod...
	if g_dynamicMod then
		modUserData.SetValue("NumMinorCivs", 0)
	end

	print ("Launching game...")
	print ("Selected option :")	
	if	PreGame.GetMapOption(MAJOR_PLACEMENT) then print ("  MAJOR_PLACEMENT :" .. PreGame.GetMapOption(MAJOR_PLACEMENT)) end
	if	PreGame.GetMapOption(MINOR_PLACEMENT) then print ("  MINOR_PLACEMENT :" .. PreGame.GetMapOption(MINOR_PLACEMENT)) end
	if	PreGame.GetMapOption(BOSPHORUS) then print ("  BOSPHORUS :" .. PreGame.GetMapOption(BOSPHORUS)) end
	if	PreGame.GetMapOption(MINOR_DISTANCE) then print ("  MINOR_DISTANCE :" .. PreGame.GetMapOption(MINOR_DISTANCE)) end
	if	PreGame.GetMapOption(RESOURCE_GEO) then print ("  RESOURCE_GEO :" .. PreGame.GetMapOption(RESOURCE_GEO)) end
	if	PreGame.GetMapOption(RESOURCE_DEPOSIT) then print ("  RESOURCE_DEPOSIT :" .. PreGame.GetMapOption(RESOURCE_DEPOSIT)) end
	if	PreGame.GetMapOption(RESOURCE_QUANTITY) then print ("  RESOURCE_QUANTITY :" .. PreGame.GetMapOption(RESOURCE_QUANTITY)) end
	if	PreGame.GetMapOption(RESOURCE_SCALE) then print ("  RESOURCE_SCALE :" .. PreGame.GetMapOption(RESOURCE_SCALE)) end
	if	PreGame.GetMapOption(RESOURCE_REQUESTED) then print ("  RESOURCE_REQUESTED :" .. PreGame.GetMapOption(RESOURCE_REQUESTED)) end
	print("-------------------------------")
	print("Selected map : " .. PreGame.GetMapScript() )
	print("-------------------------------")
	-- some default options are not set when switching between map type
	-- this need to be fixed, or we should assume default value here or when the value is called :-/
	-- (need example here)

	-- Custom selection of city states : update database with only the needed CS
	-- removed, loading game can't use that, reversing to default database, resulting in bad naming for CS
	--if PreGame.GetMapOption(MINOR_SELECTION) == MINOR_PRESELECT or PreGame.GetMapOption(MINOR_SELECTION) == MINOR_AMERICAN_NATION then
	--	Modding.PerformActions("DeleteMinorCiv")
	--	Modding.PerformActions("YnaempSelection")
	--end	
	--if PreGame.GetMapOption(MINOR_SELECTION) == MINOR_MADEIRA then
	--	Modding.PerformActions("DeleteMinorCiv")
	--	Modding.PerformActions("MadeiraSelection")
	--end

	--if ( g_dynamicCS == 1 ) then -- Add all available civs for Dynamic History
	--	for i = 1, GameDefines.MAX_MAJOR_CIVS do
	--		PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
	--	end
	--end

	-- Set custom placement rules for resources
	local mapID = modUserData.GetValue ("MapID")
	local resourcesRules = g_ResourcesRules[mapID]
	if resourcesRules then
		for i, query in ipairs (resourcesRules) do
			print (query)
			for row in DB.Query(query) do
			end
		end 
	end



	-- Don't allow random AI without TSL to be used
	for row in GameInfo.Civilizations() do
		if not CivHasTSL(row.ID) then
			local sql = "UPDATE Civilizations SET AIPlayable = 0 WHERE ID = ".. row.ID	
			for row in DB.Query(sql) do
			end
			local sql = "UPDATE Civilizations SET Playable = 0 WHERE ID = ".. row.ID	
			for row in DB.Query(sql) do
			end
		end
	end

	if ( g_bBadCS ) then
		Controls.StartButton:SetText("[COLOR_WARNING_TEXT]Mod Error ![ENDCOLOR]")
		Controls.StartButton:SetToolTipString("Only one of the following mods should be activated:[NEWLINE]-Ynaemp City States[NEWLINE]-Ynaemp City States Extended[NEWLINE]-Ynaemp City States Madeira[NEWLINE]-Ynaemp Dynamic History[NEWLINE]Please return to the mod selection menu and uncheck all uneeded mod")
	else
		Events.SerialEventStartGame()
		UIManager:SetUICursor( 1 )
	end
end
Controls.StartButton:RegisterCallback(Mouse.eLClick, OnStartClicked);


---------------------------------------------------------------- 
-- Defaults Button Handler
---------------------------------------------------------------- 
function OnDefaultsClicked()
	Controls.RemoveButton:SetHide(true);

	-- Default custom civ names
	PreGame.SetLeaderName( 0, "");
	PreGame.SetCivilizationDescription( 0, "");
	PreGame.SetCivilizationShortDescription( 0, "");
	PreGame.SetCivilizationAdjective( 0, "");
	
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		PreGame.SetCivilization(i, -1);
		PreGame.SetTeam(i, i);
	end

	-- set the defaut map = Yagem
	local mapID = GIANT_EARTH
	mapFile = g_MapList[mapID].File
	local file = Modding.GetEvaluatedFilePath(YnaemModId, YnaemModVersion, mapFile)
	PreGame.SetMapScript(file.EvaluatedPath)
	modUserData.SetValue ("MapID", mapID)
	
	-- Default Map Size
	-- yagem world size is huge
	PreGame.SetWorldSize(GameInfo.Worlds.WORLDSIZE_HUGE.ID)
	
	-- defaut Major placement
	PreGame.SetMapOption(MAJOR_PLACEMENT, MAJOR_TSL_ONLY)
	
	-- defaut City states number
	tableName = "MinorCiv_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
	modUserData.SetValue ("NumMinorCivs", #GameInfo[tableName])
	-- defaut City States placement
	PreGame.SetMapOption(MINOR_PLACEMENT, MINOR_TSL_ONLY)
	-- defaut City States distance
	PreGame.SetMapOption(MINOR_DISTANCE, MINOR_DISTANCE_CLOSE)
	
	-- Default Game Pace
	local gameSpeed = GameInfo.GameSpeeds["GAMESPEED_STANDARD"];
	if(gameSpeed == nil) then
		gameSpeed = GameInfo.GameSpeeds()();
	end
	PreGame.SetGameSpeed(gameSpeed.ID);
	
	-- Default Start Era
	local era = GameInfo.Eras["ERA_ANCIENT"];
	if(era == nil) then
		era = GameInfo.Eras()();
	end
	PreGame.SetEra(era.ID);
	
	--Default Difficulty to Prince
	local handicap = GameInfo.HandicapInfos["HANDICAP_PRINCE"];
	if(handicap == nil) then
		handicap = GameInfo.HandicapInfos()(); --Get first handicap info found.
	end
	PreGame.SetHandicap( 0, handicap.ID );
	
	-- Initialise hotseat table
	for i = 1, GameDefines.MAX_MAJOR_CIVS-1 do
		g_Hotseat[i] = false
	end


	for row in GameInfo.Victories() do
		PreGame.SetVictory(row.ID, true);
	end
		
	-- Reset Max Turns
	PreGame.SetMaxTurns(0);
	
	PreGame.ResetGameOptions();
	PreGame.ResetMapOptions();

	-- defaut number of player
	local numPlayers = g_MapList[mapID].Civs
	for i = 1, numPlayers do
			PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
			g_Hotseat[i] = false
	end
	for i = numPlayers, GameDefines.MAX_MAJOR_CIVS do
		if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER) then
			PreGame.SetSlotStatus(i, SlotStatus.SS_OPEN)
			g_Hotseat[i] = false
		end
	end
	
	-- Update elements
	PerformPartialSync();
	PerformValidation();
end
Controls.DefaultButton:RegisterCallback( Mouse.eLClick, OnDefaultsClicked );
---------------------------------------------------------------- 

----------------------------------------------------------------
-- Input Handler
----------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
		    OnBackClicked();
        	return true;
		end
	end
	
end
ContextPtr:SetInputHandler( InputHandler );
----------------------------------------------------------------     

----------------------------------------------------------------
-- Visibility Handler
---------------------------------------------------------------- 
function ShowHideHandler( bIsHide )
	-- Note: Must be called even when bIsHide == true due to the 
	-- way the edit player details screen works.
	if( not bIsHide ) then
        Controls.YnaempScreenLogo:SetTexture( "WorldMap.dds" );
    else
        Controls.YnaempScreenLogo:UnloadTexture();
    end
	PerformPartialSync();
	PerformValidation();
end
ContextPtr:SetShowHideHandler( ShowHideHandler );
---------------------------------------------------------------- 

-----------------------------------------------------------------
-- Adjust for resolution
-----------------------------------------------------------------
function AdjustScreenSize()
    local _, screenY = UIManager:GetScreenSizeVal();

    local TOP_COMPENSATION = 52 + ((screenY - 768) * 0.3 );
    local BOTTOM_COMPENSATION = 190;
    local LOCAL_SLOT_COMPENSATION = 74;

    Controls.MainGrid:SetSizeY( screenY - TOP_COMPENSATION );
    Controls.ListingScrollPanel:SetSizeY( screenY - TOP_COMPENSATION - BOTTOM_COMPENSATION - LOCAL_SLOT_COMPENSATION );
    Controls.OptionsScrollPanel:SetSizeY( screenY - TOP_COMPENSATION - BOTTOM_COMPENSATION );
    
    Controls.ListingScrollPanel:CalculateInternalSize();
    Controls.OptionsScrollPanel:CalculateInternalSize();
end

-------------------------------------------------
-------------------------------------------------
function OnUpdateUI( type )
    if( type == SystemUpdateUIType.ScreenResize ) then
        AdjustScreenSize();
    end
end
Events.SystemUpdateUI.Add( OnUpdateUI );


-- When mods affect game state, perform a full sync.
Events.AfterModsActivate.Add(function()
	PerformFullSync();
end);

Events.AfterModsDeactivate.Add(function()
	PerformFullSync();
end);

-- This is a one time initialization function for UI elements.
-- It should NEVER be called more than once.
function CreateSlotInstances()
	for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		g_SlotInstances[i] = {};
		ContextPtr:BuildInstanceForControl( "PlayerSlot", g_SlotInstances[i], Controls.SlotStack );
		g_SlotInstances[i].Root:SetHide( true );	
	end
end

------------------
-- Ynaem functions
------------------

function GetMaxMinor()
	local maxMinor = GameDefines.MAX_CIV_PLAYERS - GameDefines.MAX_MAJOR_CIVS
	local minorPlacement = PreGame.GetMapOption(MINOR_PLACEMENT)
	local numMinor = modUserData.GetValue ("NumMinorCivs")
	local mapID = modUserData.GetValue ("MapID")

	if ( g_dynamicCS == 1 ) then
		return maxMinor
	end

	if minorPlacement == MINOR_TSL_ONLY then
		local numTSL = 0
		tableName = "MinorCiv_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
		for rowMinor in GameInfo.MinorCivilizations() do
			for rowTSL in GameInfo[tableName]() do
				if rowMinor.Type == rowTSL.Type then
					numTSL = numTSL + 1
				end
			end
		end
		maxMinor = math.min(numTSL, GameDefines.MAX_CIV_PLAYERS - GameDefines.MAX_MAJOR_CIVS)
	end
	if numMinor > maxMinor then
		modUserData.SetValue ("NumMinorCivs", maxMinor)
	end
	if maxMinor == nil then maxMinor = 0 end -- Why this is needed ???
	return maxMinor
end

function YnaemSetup ()
	--local myModId = "36e88483-48fe-4545-b85f-bafc50dde315"
	--local myModVersion = Modding.GetActivatedModVersion(myModId)
	print("-------------------------------")
	print ("Entering Ynaemp setup...")
	local gameVersion = UI.GetVersionInfo()
	print ("game version : " .. gameVersion )
	print("-------------------------------")
	
	-- list mods
	print("Enabled mods :")
	local unsortedInstalledMods = Modding.GetInstalledMods()
	for key, modInfo in pairs(unsortedInstalledMods) do
		if modInfo.Enabled then
			if (modInfo.Name) then
				print (" - " .. modInfo.Name .. " (v." .. modInfo.Version ..")")
			end
		end
	end
	print("Disabled mods :")
	local unsortedInstalledMods = Modding.GetInstalledMods()
	for key, modInfo in pairs(unsortedInstalledMods) do
		if not (modInfo.Enabled) then
			if (modInfo.Name) then
				print (" - " .. modInfo.Name .. " (v." .. modInfo.Version ..")")
			end
		end
	end	
	print("-------------------------------")
	
	-- set the defaut map
	-- get last selection
	local mapID = modUserData.GetValue ("MapID")
	if not mapID or mapID < 1 or not g_MapList[mapID] then
		-- defaut = Yagem
		mapID = GIANT_EARTH
		modUserData.SetValue ("MapID", mapID)
	end
	mapFile = g_MapList[mapID].File
	local file = Modding.GetEvaluatedFilePath(YnaemModId, YnaemModVersion, mapFile)
	PreGame.SetMapScript(file.EvaluatedPath)
	
	print ("Map ID: " .. mapID )
	print ("Map path: " .. file.EvaluatedPath )

	-- minor civs set to max available, we'll sort them later
	-- but we'll store the user wanted number in modUserData
	-- defaut number is max available city States with TSL
	-- to do : add a max number...
	-- on worst case remove some entry from DB keeping only the pre-list
	PreGame.SetNumMinorCivs(#GameInfo.MinorCivilizations)
	tableName = "MinorCiv_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
	local numMinorCivs = 0
	if GameInfo[tableName] then numMinorCivs = #GameInfo[tableName] end
	modUserData.SetValue("NumMinorCivs", numMinorCivs)

	-- world size
	local worldSize = g_MapList[mapID].Size
	PreGame.SetWorldSize(GameInfo.Worlds[worldSize].ID)
	
	-- defaut Major placement	
	local majorPlacement = modUserData.GetValue ("MajorPlacement")
	if not majorPlacement or majorPlacement < 1 then
		-- defaut = TSL
		majorPlacement = MAJOR_TSL_ONLY
		modUserData.SetValue ("MajorPlacement", MAJOR_TSL_ONLY)
	end
	PreGame.SetMapOption(MAJOR_PLACEMENT, majorPlacement)
	
	-- defaut City States placement	
	local minorPlacement = modUserData.GetValue ("MinorPlacement")
	if not minorPlacement or minorPlacement < 1 then
		-- defaut = TSL
		minorPlacement = MINOR_TSL_ONLY
		modUserData.SetValue ("MinorPlacement", MINOR_TSL_ONLY)
	end
	PreGame.SetMapOption(MINOR_PLACEMENT, minorPlacement)

	-- defaut City States distance
	local minorDistance = modUserData.GetValue ("MinorDistance")
	if not minorDistance or minorDistance < 1 then
		-- defaut = close
		minorDistance = MINOR_DISTANCE_CLOSE
		modUserData.SetValue ("MinorDistance", MINOR_DISTANCE_CLOSE)
	end
	PreGame.SetMapOption(MINOR_DISTANCE, minorDistance)

	-- defaut Resource Quantity
	local resourceQuantity = modUserData.GetValue ("ResourceQuantity")
	if not resourceQuantity or resourceQuantity < 1 then
		-- defaut = standard
		resourceQuantity = RESOURCE_STANDARD
		modUserData.SetValue ("ResourceQuantity", RESOURCE_STANDARD)
	end
	PreGame.SetMapOption(RESOURCE_QUANTITY, resourceQuantity)
	
	-- default level
	local handicap = modUserData.GetValue ("Handicap")
	if not handicap or handicap < 1 then
		-- defaut = prince
		handicap = GameInfo.HandicapInfos["HANDICAP_PRINCE"].ID
		modUserData.SetValue ("Handicap", handicap)
	end
	PreGame.SetHandicap(0, handicap)

	-- Default Start Era	
	local startEra = modUserData.GetValue ("StartEra")
	if (startEra == nil) then
		local era = GameInfo.Eras["ERA_ANCIENT"]
		if(era == nil) then
			era = GameInfo.Eras()()
		end
		startEra = era.ID
		modUserData.SetValue ("StartEra", era.ID)
	end
	PreGame.SetEra(startEra)

	-- defaut game speed	
	local speed = modUserData.GetValue ("Speed")
	if (speed == nil) then
		local gameSpeed = GameInfo.GameSpeeds["GAMESPEED_STANDARD"]
		if(gameSpeed == nil) then
			gameSpeed = GameInfo.GameSpeeds()()
		end
		speed = gameSpeed.ID
		modUserData.SetValue ("Speed", gameSpeed.ID)	
	end
	PreGame.SetGameSpeed(speed)

	-- defaut number of player
	local numPlayers = modUserData.GetValue ("NumPlayers")
	if not numPlayers or numPlayers < 1 then
		numPlayers = g_MapList[mapID].Civs
		modUserData.SetValue ("NumPlayers", numPlayers)
	end
	for i = 1, numPlayers do
			PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
			g_Hotseat[i] = false
	end
	for i = numPlayers, GameDefines.MAX_MAJOR_CIVS do
		if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER) then
			PreGame.SetSlotStatus(i, SlotStatus.SS_OPEN)
			g_Hotseat[i] = false
		end
	end
end

YnaemSetup()
AdjustScreenSize()
CreateSlotInstances()
PerformFullSync()