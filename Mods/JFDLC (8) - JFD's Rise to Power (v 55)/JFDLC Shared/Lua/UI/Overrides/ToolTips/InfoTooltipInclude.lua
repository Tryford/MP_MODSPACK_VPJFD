-------------------------------------------------
-- Help text for Info Objects (Units, Buildings, etc.)
------------------------------
-- JFD
------------------------------
include("JFDLCUtils.lua") 
include("JFD_CID_DevelopmentUtils.lua") 

local userSettingCIDCrimeCore 	 			= false
local userSettingCIDDevelopmentCore 	 	= false
local userSettingCIDHealthCore 	 			= false
local userSettingCIDInvestmentsCore		    = false
local userSettingPITProgressBuildCharges    = false
local userSettingRTPSovereigntyCore 		= false

local isUsingCBO							= false
if Game then
	userSettingCIDCrimeCore 	 			= (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
	userSettingCIDDevelopmentCore 	 		= (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1)
	userSettingCIDDevelopmentCoreDistricts 	= (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE_DISTRICTS") == 1)
	userSettingCIDHealthCore 	 			= (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
	userSettingCIDInvestmentsCore		    = (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1)
	userSettingCIDLoyaltyCore		   	    = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
	userSettingPITProgressBuildCharges		= (Game.GetUserSetting("JFD_PIT_PROGRESS_BUILD_CHARGES") == 1)
	userSettingRTPSovereigntyCore 			= (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)

	isUsingCBO								= Game.IsCBOActive()
end


local yieldCultureID 			= GameInfo.Yields["YIELD_CULTURE"].ID
local yieldFaithID 				= GameInfo.Yields["YIELD_FAITH"].ID
local yieldFoodID 				= GameInfo.Yields["YIELD_FOOD"].ID
local yieldHealthID 			= GameInfo.Yields["YIELD_JFD_HEALTH"].ID
local yieldGoldenAgePointsID 	= GameInfo.Yields["YIELD_GOLDEN_AGE_POINTS"].ID
local yieldGoldID 				= GameInfo.Yields["YIELD_GOLD"].ID
local yieldProductionID 		= GameInfo.Yields["YIELD_PRODUCTION"].ID
local yieldScienceID 			= GameInfo.Yields["YIELD_SCIENCE"].ID
local yieldTourismID 			= GameInfo.Yields["YIELD_TOURISM"].ID
------------------------------
-- JFD
------------------------------
-- UNIT
function GetHelpTextForUnit(iUnitID, bIncludeRequirementsInfo, pCity)
	local pUnitInfo = GameInfo.Units[iUnitID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];

	local strHelpText = "";
	
	-- Name
	strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pUnitInfo.Description ));
	
-- CBP
	if (pCity ~= nil) then
		if(pCity:GetUnitInvestment(iUnitID) > 0) then
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_INVESTED");
		end
	end
-- END
			
	-- Cost
	strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
	
-- CBP
	if (pCity ~= nil) then
		if(pCity:GetUnitInvestment(iUnitID) > 0) then
			iCost = pCity:GetUnitInvestment(iUnitID);
		end
	end
-- END

	-- Skip cost if it's 0
	if(pUnitInfo.Cost > 0) then
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", pActivePlayer:GetUnitProductionNeeded(iUnitID));
	end
	
	-- ExtraMaintenance
	if(pUnitInfo.ExtraMaintenanceCost > 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_EXTRA_MAINTENANCE_COST", pUnitInfo.ExtraMaintenanceCost);
	end
	strHelpText = strHelpText .. "[NEWLINE]----------------";
	
	-- Moves
	if pUnitInfo.Domain ~= "DOMAIN_AIR" then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_MOVEMENT", pUnitInfo.Moves);
	end
	
	-- Work Rate
	if pUnitInfo.WorkRate > 1 then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_WORK_RATE", pUnitInfo.WorkRate);
	end

	-- Builds
	if userSettingPITProgressBuildCharges then
		for row in GameInfo.Unit_JFD_BuildCharges("UnitType = '" .. pUnitInfo.Type .. "'") do
			strHelpText = strHelpText .. "[NEWLINE]";
			strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_BUILD_CHARGES", row.NumCharges);
			break
		end
	end

	-- Range
	local iRange = pUnitInfo.Range;
	if (iRange ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RANGE", iRange);
	end
	
	-- Ranged Strength
	local iRangedStrength = pUnitInfo.RangedCombat;
	if (iRangedStrength ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RANGED_STRENGTH", iRangedStrength);
	end
	
	-- Strength
	local iStrength = pUnitInfo.Combat;
	if (iStrength ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_STRENGTH", iStrength);
	end
	
	-- Resource Requirements
	local iNumResourcesNeededSoFar = 0;
	local iNumResourceNeeded;
	local iResourceID;
	for pResource in GameInfo.Resources() do
		iResourceID = pResource.ID;
		iNumResourceNeeded = Game.GetNumResourceRequiredForUnit(iUnitID, iResourceID);
		if (iNumResourceNeeded > 0) then
			-- First resource required
			if (iNumResourcesNeededSoFar == 0) then
				strHelpText = strHelpText .. "[NEWLINE]";
				strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RESOURCES_REQUIRED");
				strHelpText = strHelpText .. " " .. iNumResourceNeeded .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
			else
				strHelpText = strHelpText .. ", " .. iNumResourceNeeded .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
			end
			
			-- JON: Not using this for now, the formatting is better when everything is on the same line
			--iNumResourcesNeededSoFar = iNumResourcesNeededSoFar + 1;
		end
 	end
	
	-- Pre-written Help text
	if (not pUnitInfo.Help) then
		print("Invalid unit help");
		print(strHelpText);
	else
		local strWrittenHelpText = Locale.ConvertTextKey( pUnitInfo.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end	
	end
	
	
	-- Requirements?
	if (bIncludeRequirementsInfo) then
		if (pUnitInfo.Requirements) then
			strHelpText = strHelpText .. Locale.ConvertTextKey( pUnitInfo.Requirements );
		end
	end
	
	-- CBP
	-- if userSettingCIDInvestmentsCore then
		-- if (pCity ~= nil) then
			-- if pCity:GetUnitInvestment(iUnitID) <= 0 then
				-- local strInvestment = "TXT_KEY_PRODUCTION_INVESTMENT_UNIT"
				-- local iAmount = pActivePlayer:GetInvestmentValue(false, false, true)
				-- iAmount = (iAmount * -1);
				-- local localizedText = Locale.ConvertTextKey(strInvestment, -iAmount);
				-- Separator
				-- strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
				-- strHelpText = strHelpText .. localizedText;
			-- end
		-- end
	-- end
	-- END
	
	return strHelpText;
	
end

-- BUILDING
function GetHelpTextForBuilding(iBuildingID, bExcludeName, bExcludeHeader, bNoMaintenance, pCity, bIsMagistrate)
	local pBuildingInfo = GameInfo.Buildings[iBuildingID];
	local thisBuilding = { BuildingType = pBuildingInfo.Type }
			
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local buildingClass = GameInfo.Buildings[iBuildingID].BuildingClass;
	local buildingClassID = GameInfo.BuildingClasses[buildingClass].ID;
	
	local strHelpText = "";
	local lines = {};
	if (not bExcludeHeader) then
		
		if (not bExcludeName) then
			-- Name
			strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pBuildingInfo.Description ));
			if (pCity ~= nil) then
				if(pCity:GetBuildingInvestment(iBuildingID) > 0) then
					-- strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_INVESTED");
					strHelpText = "[COLOR_YIELD_GOLD]" .. strHelpText .. "[ENDCOLOR] - [ICON_INVEST]Invested"
				end
			end
			if userSettingCIDDevelopmentCoreDistricts then
				local districtID = pActivePlayer:GetBuildingDistrictID(pBuildingInfo.Type, buildingClass)
				strHelpText = strHelpText .. "[NEWLINE]" .. Locale.ConvertTextKey(GameInfo.JFD_Districts[districtID].Description) 
			end
			--BEGIN DEVELOPMENT
			if userSettingCIDDevelopmentCore and GameInfo then
				local strDevelopmentTT = ""
				local developmentID = GameInfo.Yields["YIELD_JFD_DEVELOPMENT"].ID
				local iDevelopment = pActivePlayer:GetBuildingDevelopment(pBuildingInfo.Type, pBuildingInfo.BuildingClass)
				if (iDevelopment ~= 0) then		
					if iDevelopment > 0 then
						-- strDevelopmentTT = strDevelopmentTT .. Locale.ConvertTextKey("+{1_Num}[ICON_JFD_DEVELOPMENT]", iDevelopment)
						strHelpText = strHelpText .. " - " .. Locale.ConvertTextKey("(+{1_Num} [ICON_JFD_DEVELOPMENT])", iDevelopment)
						-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DEVELOPMENT", iDevelopment));
					else
						-- strDevelopmentTT = strDevelopmentTT .. Locale.ConvertTextKey("{1_Num}[ICON_JFD_DEVELOPMENT]", iDevelopment)
						-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DEVELOPMENT_NEGATIVE", iDevelopment));
					end
				end
				-- if strDevelopmentTT ~= "" then
					-- strDevelopmentTT = Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_DEVELOPMENT") .. ": " .. strDevelopmentTT 
					-- table.insert(lines, strDevelopmentTT);
				-- end
			end
			--END DEVELOPMENT
			-- table.insert(lines, "[NEWLINE]----------------[NEWLINE]");
		end
		
		-- CBP Num Social Policies
		local iNumPolicies = pBuildingInfo.NumPoliciesNeeded;
		if(pActivePlayer and iNumPolicies > 0) then
			local iNumHave = pActivePlayer:GetNumPolicies(true);
			strHelpText = strHelpText .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POLICY_NEEDED_LABEL", iNumPolicies, iNumHave)  .. "[NEWLINE]"
			-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POLICY_NEEDED_LABEL", iNumPolicies, iNumHave));
		end
	
		--- National/Local Population
		if isUsingCBO then
			if(pActivePlayer) then
				local iNumNationalPop = pActivePlayer:GetScalingNationalPopulationRequrired(iBuildingID);
				if(iNumNationalPop > 0) then
					local iNumHave = pActivePlayer:GetCurrentTotalPop();
					strHelpText = strHelpText .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POPULATION_NATIONAL_NEEDED_LABEL", iNumNationalPop, iNumHave)  .. "[NEWLINE]"
					-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POPULATION_NATIONAL_NEEDED_LABEL", iNumNationalPop, iNumHave));
				end
			end
		end
	
		local iNumLocalPop = pBuildingInfo.LocalPopRequired;
		if(iNumLocalPop > 0) then
			if (pCity) then
				local iNumHave = pCity:GetPopulation();
				strHelpText = strHelpText .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POPULATION_LOCAL_NEEDED_LABEL", iNumLocalPop, iNumHave) .. "[NEWLINE]"
				-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PEDIA_NUM_POPULATION_LOCAL_NEEDED_LABEL", iNumLocalPop, iNumHave));
			end
		end
		
		-- Resource Requirements
		local iNumResourcesNeededSoFar = 0;
		local iNumResourceNeeded;
		local iResourceID;
		for pResource in GameInfo.Resources("Type = 'RESOURCE_JFD_POWER'") do
			iResourceID = pResource.ID;
			iNumResourceNeeded = Game.GetNumResourceRequiredForBuilding(iBuildingID, iResourceID);
			if (iNumResourceNeeded > 0) then
				-- First resource required
				local localizedText = ""
				if (iNumResourcesNeededSoFar == 0) then
					localizedText = localizedText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RESOURCES_REQUIRED");
					localizedText = localizedText .. " " .. iNumResourceNeeded .. " " .. pResource.IconString .. "" .. Locale.ConvertTextKey(pResource.Description);
				else
					localizedText = localizedText .. ", " .. iNumResourceNeeded .. " " .. pResource.IconString .. "" .. Locale.ConvertTextKey(pResource.Description);
				end
				strHelpText = strHelpText .. "[NEWLINE]" .. localizedText
				-- table.insert(lines, localizedText);
		
				-- JON: Not using this for now, the formatting is better when everything is on the same line
				--iNumResourcesNeededSoFar = iNumResourcesNeededSoFar + 1;
			end
		end
		strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
			
		-- strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		-- Cost
		local numCosts = 0
		--Only show cost info if the cost is greater than 0.
		if(pBuildingInfo.Cost > 0) then
			local iCost = pActivePlayer:GetBuildingProductionNeeded(iBuildingID);
-- CBP
			if (pCity ~= nil) then
				if(pCity:GetBuildingInvestment(iBuildingID) > 0) then
					iCost = pCity:GetBuildingInvestment(iBuildingID);
				end
			end
-- END
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", iCost));
			numCosts = numCosts + 1
		end
		
		if(pBuildingInfo.UnlockedByLeague and Game.GetNumActiveLeagues() > 0 and not Game.IsOption("GAMEOPTION_NO_LEAGUES")) then
			local pLeague = Game.GetActiveLeague();
			if (pLeague ~= nil) then
				local iCostPerPlayer = pLeague:GetProjectBuildingCostPerPlayer(iBuildingID);
				local sCostPerPlayer = Locale.ConvertTextKey("TXT_KEY_PEDIA_COST_LABEL");
				sCostPerPlayer = sCostPerPlayer .. " " .. Locale.ConvertTextKey("TXT_KEY_LEAGUE_PROJECT_COST_PER_PLAYER", iCostPerPlayer);
				table.insert(lines, sCostPerPlayer);
				numCosts = numCosts + 1
			end
		end
		
		-- Maintenance
		if (not bNoMaintenance) then
			local iMaintenance = pBuildingInfo.GoldMaintenance;
			if (iMaintenance ~= nil and iMaintenance ~= 0) then		
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_MAINTENANCE", iMaintenance));
				numCosts = numCosts + 1
			end
		end
		
		-- JFD Crime
		if userSettingCIDCrimeCore then
			local crimeID = GameInfo.Yields["YIELD_JFD_CRIME"].ID
			local isBuildingFree = false
			if pCity then
				isBuildingFree = pCity:GetNumFreeBuilding(iBuildingID) > 0
			end
			local iCrime = Game.GetBuildingYieldChange(iBuildingID, crimeID)
			iCrime = iCrime + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, crimeID)
			iCrime = iCrime + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, crimeID)
			if ((not isBuildingFree) and iCrime ~= nil and iCrime ~= 0) then		
				if iCrime > 0 then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CRIME", iCrime));
					numCosts = numCosts + 1
				end
			end
			
			local iCrime = Game.GetBuildingYieldModifier(iBuildingID, crimeID)
			iCrime = iCrime + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, crimeID)
			if iCrime > 0 then
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CRIME_MOD", iCrime));
				numCosts = numCosts + 1
			end
			
			local iCrimeMod = 0
			local pCrime = nil
			for row in GameInfo.Building_JFD_CrimeMods(thisBuilding) do
				iCrimeMod = row.CrimeMod
				pCrime = row.CrimeType
			end
			if iCrimeMod > 0 and pCrime then		
				local pCrimeInfo = GameInfo.JFD_Crimes[pCrime]
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SPECIFIC_CRIME_MOD", iCrimeMod, pCrimeInfo.IconString, pCrimeInfo.Description));
				numCosts = numCosts + 1
			end
		end
		if userSettingCIDHealthCore then
			-- Disease Mod
			local iDisease = Game.GetBuildingYieldModifier(iBuildingID, GameInfoTypes.YIELD_JFD_DISEASE);
			iDisease = iDisease + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE);
			
			if (iDisease ~= nil and iDisease ~= 0) then
				if iDisease >= 0 then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DISEASE_MOD", iDisease));
					numCosts = numCosts + 1
				-- else
					-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DISEASE_MOD_NEGATIVE", iDisease));
				end
			end
			
			iDisease = Game.GetBuildingYieldChange(iBuildingID, GameInfoTypes.YIELD_JFD_DISEASE);
			iDisease = iDisease + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE)
			iDisease = iDisease + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE)
			if (pCity ~= nil) then
				iDisease = iDisease + pCity:GetReligionBuildingClassYieldChange(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE)
				iDisease = iDisease + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE);
				iDisease = iDisease + pCity:GetEventBuildingClassYield(buildingClassID, GameInfoTypes.YIELD_JFD_DISEASE);
			end
			if (iDisease ~= 0) then
				if iDisease > 0 then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DISEASE", iDisease));
					numCosts = numCosts + 1
				-- else
					-- table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DISEASE_NEGATIVE", iDisease));
					-- numCosts = numCosts + 1
				end
			end
		end
		-- JFD Loyalty
		if userSettingCIDLoyaltyCore then
			local loyaltyID = GameInfo.Yields["YIELD_JFD_LOYALTY"].ID
			local iLoyalty = Game.GetBuildingYieldModifier(iBuildingID, loyaltyID);
			iLoyalty = iLoyalty + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, loyaltyID);
			if (pCity ~= nil) then
				iLoyalty = iLoyalty + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, loyaltyID);
			end
			if (iLoyalty ~= nil and iLoyalty < 0) then
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_LOYALTY_MOD", iLoyalty));
				numCosts = numCosts + 1
			end
		end
		-- JFD Sovereignty
		if userSettingRTPSovereigntyCore then
			local sovereigntyID = GameInfo.Yields["YIELD_JFD_SOVEREIGNTY"].ID
			local iSovereignty = Game.GetBuildingYieldModifier(iBuildingID, sovereigntyID)
			iSovereignty = iSovereignty + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, sovereigntyID)
			if iSovereignty < 0 then
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SOVEREIGNTY_MOD_NEGATIVE", iSovereignty));
				numCosts = numCosts + 1
			end
		end
		if numCosts > 0 then table.insert(lines, "----------------"); end
	end
	
	local numYields = 0
	--BEGIN DEFENSE
	-- Defense
	local iDefense = pBuildingInfo.Defense;
	for row in GameInfo.Policy_BuildingClassYieldChanges("BuildingClassType = '" .. pBuildingInfo.BuildingClass .. "' AND YieldType = 'YIELD_DEFENSE'") do
		if pActivePlayer:HasPolicy(GameInfoTypes[row.PolicyType]) then
			iDefense = iDefense + (row.YieldChange*100)
		end
	end
	if (iDefense ~= nil and iDefense ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DEFENSE", iDefense / 100));
		numYields = numYields + 1
	end
	
	-- Hit Points
	local iHitPoints = pBuildingInfo.ExtraCityHitPoints;
	if (iHitPoints ~= nil and iHitPoints ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HITPOINTS", iHitPoints));
		numYields = numYields + 1
	end
	-- END DEFENSE
	
	--BEGIN PRODUCE
	local strGrossProduceTT = ""
	-- Food Mod
	local iFoodMod = Game.GetBuildingYieldModifier(iBuildingID, yieldFoodID);
	iFoodMod = iFoodMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldFoodID);
	if (pCity ~= nil) then
		iFoodMod = iFoodMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldFoodID);
		iFoodMod = iFoodMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldFoodID);
	end
	
	-- Food
	local iFood = Game.GetBuildingYieldChange(iBuildingID, yieldFoodID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldFoodID);
	if (pCity ~= nil) then
		iFood = iFood + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldFoodID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldFoodID);
		iFood = iFood + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldFoodID);
		iFood = iFood + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldFoodID);
		iFood = iFood + pCity:GetLocalBuildingClassYield(buildingClassID, yieldFoodID);
		iFood = iFood + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldFoodID);
		iFood = iFood + pCity:GetEventBuildingClassYield(buildingClassID, yieldFoodID);
	end
	if (iFood ~= nil and iFood ~= 0) then
		if iFood >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_FOOD]", iFood)
			if iFoodMod and iFoodMod > 0 then iFood = iFood .. ",+" .. iFoodMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FOOD", iFood));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_FOOD]", iFood)
			if iFoodMod and iFoodMod < 0 then iFood = iFood .. "," .. iFoodMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FOOD_NEGATIVE", iFood));
			numYields = numYields + 1
		end
	end
	if (iFoodMod ~= nil and iFoodMod ~= 0) and iFood == 0 then
		if iFoodMod >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_FOOD]%", iFoodMod)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FOOD_MOD", iFoodMod));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_FOOD]%", iFoodMod)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FOOD_MOD_NEGATIVE", iFoodMod));
			numYields = numYields + 1
		end
	end
	
	-- Production Mod
	local iProdMod = Game.GetBuildingYieldModifier(iBuildingID, yieldProductionID);
	iProdMod = iProdMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldProductionID);
	if (pCity ~= nil) then
		iProdMod = iProdMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldProductionID);
		iProdMod = iProdMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldProductionID);
	end
	
	-- Production Change
	local iProd = Game.GetBuildingYieldChange(iBuildingID, yieldProductionID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldProductionID) 
	if (pCity ~= nil) then
		iProd = iProd + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldProductionID);
		iProd = iProd + pCity:GetLocalBuildingClassYield(buildingClassID, yieldProductionID);
		iProd = iProd + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldProductionID);
	end
	if (pCity ~= nil) then
		iProd = iProd + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldProductionID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldProductionID);
		iProd = iProd + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldProductionID);
		iProd = iProd + pCity:GetEventBuildingClassYield(buildingClassID, yieldProductionID);
	end
	if (iProd ~= nil and iProd ~= 0) then
		if iProd >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_PRODUCTION]", iProd)
			if iProdMod and iProdMod > 0 then iProd = iProd .. ",+" .. iProdMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION_CHANGE", iProd));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_PRODUCTION]", iProd)
			if iProdMod and iProdMod < 0 then iProd = iProd .. "," .. iProdMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION_NEGATIVE", iProd));
			numYields = numYields + 1
		end
	end
	if (iProdMod ~= nil and iProdMod ~= 0) and iProd == 0 then
		if iProdMod >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_PRODUCTION]%", iProdMod)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION", iProdMod));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_PRODUCTION]%", iProdMod)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION_NEGATIVE", iProdMod));
			numYields = numYields + 1
		end
	end
	
	-- Gold Mods
	local iGoldMod = Game.GetBuildingYieldModifier(iBuildingID, yieldGoldID);
	iGoldMod = iGoldMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldGoldID);
	if (pCity ~= nil) then
		iGoldMod = iGoldMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldGoldID);
		iGoldMod = iGoldMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldGoldID);
	end
	
	-- Gold Change
	local iGold = Game.GetBuildingYieldChange(iBuildingID, yieldGoldID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldGoldID);
	if (pCity ~= nil) then
		iGold = iGold + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldGoldID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldGoldID);
		iGold = iGold + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldGoldID);
		iGold = iGold + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldGoldID);
		iGold = iGold + pCity:GetLocalBuildingClassYield(buildingClassID, yieldGoldID);
		iGold = iGold + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldGoldID);
		iGold = iGold + pCity:GetEventBuildingClassYield(buildingClassID, yieldGoldID);
	end
	if (iGold ~= nil and iGold ~= 0) then
		if iGold >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_GOLD]", iGold)
			if iGoldMod and iGoldMod > 0 then iGold = iGold .. ",+" .. iGoldMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD_CHANGE", iGold));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_GOLD]", iGold)
			if iGoldMod and iGoldMod < 0 then iGold = iGold .. "," .. iGoldMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD_NEGATIVE", iGold));
			numYields = numYields + 1
		end
	end
	if (iGoldMod ~= nil and iGoldMod ~= 0) and iGold == 0 then
		if iGoldMod >= 0 then
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("+{1_Num}[ICON_GOLD]%", iGoldMod)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD", iGoldMod));
			numYields = numYields + 1
		else
			-- strGrossProduceTT = strGrossProduceTT .. Locale.ConvertTextKey("{1_Num}[ICON_GOLD]%", iGold)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD_MOD_NEGATIVE", iGoldMod));
			numYields = numYields + 1
		end
	end
	-- if strGrossProduceTT ~= "" then
		-- strGrossProduceTT = Locale.ConvertTextKey("Produce") .. ": " .. strGrossProduceTT 
		-- table.insert(lines, strGrossProduceTT);
	-- end
	--END PRODUCE
	
	--BEGIN WELFARE
	local strWelfareTT = ""
	-- Happiness (from all sources)
	local iHappinessTotal = 0;
	local iHappiness = pBuildingInfo.Happiness;
	if (iHappiness ~= nil) then
		iHappinessTotal = iHappinessTotal + iHappiness;
	end
	local iHappiness = pBuildingInfo.UnmoddedHappiness;
	if (iHappiness ~= nil) then
		iHappinessTotal = iHappinessTotal + iHappiness;
	end
	iHappinessTotal = iHappinessTotal + pActivePlayer:GetExtraBuildingHappinessFromPolicies(iBuildingID);
	if (pCity ~= nil) then
		iHappinessTotal = iHappinessTotal + pCity:GetReligionBuildingClassHappiness(buildingClassID) + pActivePlayer:GetPlayerBuildingClassHappiness(buildingClassID);
		for row in GameInfo.Building_BuildingHappinessChangesUI(thisBuilding) do
			if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) and pCity:IsHasBuilding(GameInfoTypes[row.RequiredBuildingType]) then
				if row.HappinessChangeIsBuildingCount then
					iHappinessTotal = iHappinessTotal + (row.HappinessChange*pCity:GetNumBuilding(GameInfoTypes[row.RequiredBuildingType]))
				else
					iHappinessTotal = iHappinessTotal + row.HappinessChange
				end
			end
		end
	end
	if (iHappinessTotal ~= 0) then
		if iHappinessTotal >= 0 then
			-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("+{1_Num}[ICON_HAPPINESS_1]", iHappinessTotal)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HAPPINESS", iHappinessTotal));
			numYields = numYields + 1
		else
			-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("{1_Num}[ICON_HAPPINESS_1]", iHappinessTotal)
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HAPPINESS_NEGATIVE", iHappinessTotal));
			numYields = numYields + 1
		end
	end

	-- CBP -- Global Average Modifiers
	local iGetPovertyHappinessChangeBuilding = Game.GetPovertyHappinessChangeBuilding( iBuildingID); 
	if (iGetPovertyHappinessChangeBuilding ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_POVERTY_AVERAGE_MODIFIER", iGetPovertyHappinessChangeBuilding));
		numYields = numYields + 1
	end
	local iGetDefenseHappinessChangeBuilding = Game.GetDefenseHappinessChangeBuilding( iBuildingID); 
	if (iGetDefenseHappinessChangeBuilding ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_DEFENSE_AVERAGE_MODIFIER", iGetDefenseHappinessChangeBuilding));
		numYields = numYields + 1
	end
	local iGetUnculturedHappinessChangeBuilding = Game.GetUnculturedHappinessChangeBuilding( iBuildingID); 
	if (iGetUnculturedHappinessChangeBuilding ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_CULTURE_AVERAGE_MODIFIER", iGetUnculturedHappinessChangeBuilding));
		numYields = numYields + 1
	end
	local iGetIlliteracyHappinessChangeBuilding = Game.GetIlliteracyHappinessChangeBuilding( iBuildingID); 
	if (iGetIlliteracyHappinessChangeBuilding ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_SCIENCE_AVERAGE_MODIFIER", iGetIlliteracyHappinessChangeBuilding));
		numYields = numYields + 1
	end
	local iGetMinorityHappinessChangeBuilding = Game.GetMinorityHappinessChangeBuilding( iBuildingID); 
	if (iGetMinorityHappinessChangeBuilding ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_MINORITY_AVERAGE_MODIFIER", iGetMinorityHappinessChangeBuilding));
		numYields = numYields + 1
	end

	local iGetPovertyHappinessChangeBuildingGlobal = Game.GetPovertyHappinessChangeBuildingGlobal( iBuildingID); 
	if (iGetPovertyHappinessChangeBuildingGlobal ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_POVERTY_GLOBAL_AVERAGE_MODIFIER", iGetPovertyHappinessChangeBuildingGlobal));
		numYields = numYields + 1
	end
	local iGetDefenseHappinessChangeBuildingGlobal = Game.GetDefenseHappinessChangeBuildingGlobal( iBuildingID); 
	if (iGetDefenseHappinessChangeBuildingGlobal ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_DEFENSE_GLOBAL_AVERAGE_MODIFIER", iGetDefenseHappinessChangeBuildingGlobal));
		numYields = numYields + 1
	end
	local iGetUnculturedHappinessChangeBuildingGlobal = Game.GetUnculturedHappinessChangeBuildingGlobal( iBuildingID); 
	if (iGetUnculturedHappinessChangeBuildingGlobal ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_CULTURE_GLOBAL_AVERAGE_MODIFIER", iGetUnculturedHappinessChangeBuildingGlobal));
		numYields = numYields + 1
	end
	local iGetIlliteracyHappinessChangeBuildingGlobal = Game.GetIlliteracyHappinessChangeBuildingGlobal( iBuildingID); 
	if (iGetIlliteracyHappinessChangeBuildingGlobal ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_SCIENCE_GLOBAL_AVERAGE_MODIFIER", iGetIlliteracyHappinessChangeBuildingGlobal));
		numYields = numYields + 1
	end
	local iGetMinorityHappinessChangeBuildingGlobal = Game.GetMinorityHappinessChangeBuildingGlobal( iBuildingID); 
	if (iGetMinorityHappinessChangeBuildingGlobal ~= 0) then
		table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_MINORITY_GLOBAL_AVERAGE_MODIFIER", iGetMinorityHappinessChangeBuildingGlobal));
		numYields = numYields + 1
	end

	if (not OptionsManager.IsNoBasicHelp()) then	
		if (pCity ~= nil) then
			local iPovertyTotal = iGetPovertyHappinessChangeBuilding + iGetPovertyHappinessChangeBuildingGlobal;
			if(iPovertyTotal ~= 0) then
				iNewThreshold = pCity:GetTheoreticalUnhappinessDecrease(buildingID) / 100;
				local iOldThreshold = pCity:GetUnhappinessFromGoldNeeded() / 100;
				if(iNewThreshold ~= 0 and iOldThreshold ~= 0)then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_POVERTY_NEW_THRESHOLD", iNewThreshold, iOldThreshold));
					numYields = numYields + 1
				end
			end		
			local iDefenseTotal = iGetDefenseHappinessChangeBuilding + iGetDefenseHappinessChangeBuildingGlobal;
			if(iDefenseTotal ~= 0) then
				iNewThreshold = pCity:GetTheoreticalUnhappinessDecrease(buildingID) / 100;
				local iOldThreshold = pCity:GetUnhappinessFromDefenseNeeded() / 100;
				if(iNewThreshold ~= 0 and iOldThreshold ~= 0)then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_DEFENSE_NEW_THRESHOLD", iNewThreshold, iOldThreshold));
					numYields = numYields + 1
				end
			end
			local iIlliteracyTotal = iGetIlliteracyHappinessChangeBuilding + iGetIlliteracyHappinessChangeBuildingGlobal;
			if(iIlliteracyTotal ~= 0) then
				iNewThreshold = pCity:GetTheoreticalUnhappinessDecrease(buildingID) / 100;
				local iOldThreshold = pCity:GetUnhappinessFromScienceNeeded() / 100;
				if(iNewThreshold ~= 0 and iOldThreshold ~= 0)then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_ILLITERACY_NEW_THRESHOLD", iNewThreshold, iOldThreshold));
					numYields = numYields + 1
				end
			end
			local iCultureTotal = iGetUnculturedHappinessChangeBuilding + iGetUnculturedHappinessChangeBuildingGlobal;
			if(iCultureTotal ~= 0) then
				iNewThreshold = pCity:GetTheoreticalUnhappinessDecrease(buildingID) / 100;
				local iOldThreshold = pCity:GetUnhappinessFromCultureNeeded() / 100;
				if(iNewThreshold ~= 0 and iOldThreshold ~= 0)then
					table.insert(lines, Locale.ConvertTextKey("TXT_KEY_BUILDING_CULTURE_NEW_THRESHOLD", iNewThreshold, iOldThreshold));
					numYields = numYields + 1
				end
			end		
		end
	end
	
	-- JFD Health
	if userSettingCIDHealthCore then
		-- Health Mods
		local iHealthMod = Game.GetBuildingYieldModifier(iBuildingID, yieldHealthID);
		iHealthMod = iHealthMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldHealthID);
		if (pCity ~= nil) then
			iHealthMod = iHealthMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldHealthID);
			iHealthMod = iHealthMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldHealthID);
		end

		-- Health Change
		local iHealth = Game.GetBuildingYieldChange(iBuildingID, yieldHealthID);
		iHealth = iHealth + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldHealthID)
		iHealth = iHealth + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldHealthID)
		if (pCity ~= nil) then
			iHealth = iHealth + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldHealthID)
			iHealth = iHealth + pCity:GetEventBuildingClassYield(buildingClassID, yieldHealthID);
		end
		if (iHealth ~= 0) then
			if iHealth > 0 then
				if iHealthMod and iHealthMod > 0 then iHealth = iHealth .. ",+" .. iHealthMod .. "%" end
				-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("+{1_Num}[ICON_JFD_HEALTH]", iHealth)
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HEALTH", "+" .. iHealth));
				numYields = numYields + 1
			else
				if iHealthMod and iHealthMod < 0 then iHealth = iHealth .. "," .. iHealthMod .. "%" end
				-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("{1_Num}[ICON_JFD_HEALTH]", iHealth)
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HEALTH_NEGATIVE", iHealth));
				numYields = numYields + 1
			end
		end
		if (iHealthMod ~= nil and iHealthMod ~= 0) and iHealth == 0 then
			if iHealthMod >= 0 then
				-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("+{1_Num}[ICON_JFD_HEALTH]%", iHealthMod)
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HEALTH_MOD", "+" .. iHealthMod));
				numYields = numYields + 1
			else
				-- strWelfareTT = strWelfareTT .. Locale.ConvertTextKey("{1_Num}[ICON_JFD_HEALTH]%", iHealthMod)
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HEALTH_MOD_NEGATIVE", iHealthMod));
				numYields = numYields + 1
			end
		end
	end
	-- if strWelfareTT ~= "" then
		-- strWelfareTT = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_YIELD_2_TEXT") .. ": " .. strWelfareTT 
		-- table.insert(lines, strWelfareTT);
	-- end
	--END WELFARE
	

	--BEGIN LEARNING
	-- Faith Mods
	local iFaithMod = Game.GetBuildingYieldModifier(iBuildingID, yieldFaithID);
	iFaithMod = iFaithMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldFaithID);
	if (pCity ~= nil) then
		iFaithMod = iFaithMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldFaithID);
		iFaithMod = iFaithMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldFaithID);
	end
	
	-- Faith Change
	local iFaith = Game.GetBuildingYieldChange(iBuildingID, yieldFaithID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldFaithID);
	if (pCity ~= nil) then
		iFaith = iFaith + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldFaithID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldFaithID);
		iFaith = iFaith + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldFaithID);
		iFaith = iFaith + pCity:GetLocalBuildingClassYield(buildingClassID, yieldFaithID);
		iFaith = iFaith + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldFaithID);
		iFaith = iFaith + pCity:GetEventBuildingClassYield(buildingClassID, yieldFaithID);
	end
	if (iFaith ~= nil and iFaith ~= 0) then
		if iFaith >= 0 then
			if iFaithMod and iFaithMod > 0 then iFaith = iFaith .. ",+" .. iFaithMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FAITH", iFaith));
			numYields = numYields + 1
		else
			if iFaithMod and iFaithMod < 0 then iFaith = iFaith .. "," .. iFaithMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FAITH_NEGATIVE", iFaith));
			numYields = numYields + 1
		end
	end
	if (iFaithMod ~= nil and iFaithMod ~= 0) and iFaith == 0 then
		if iFaithMod >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FAITH_MOD", "+" .. iFaithMod));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FAITH_MOD_NEGATIVE", iFaithMod));
			numYields = numYields + 1
		end
	end
	
	-- Golden Age Points Mods
	local iGoldenAgePointsMod = Game.GetBuildingYieldModifier(iBuildingID, yieldGoldenAgePointsID);
	iGoldenAgePointsMod = iGoldenAgePointsMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldGoldenAgePointsID);
	if (pCity ~= nil) then
		iGoldenAgePointsMod = iGoldenAgePointsMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldGoldenAgePointsID);
		iGoldenAgePointsMod = iGoldenAgePointsMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldGoldenAgePointsID);
	end
	
	-- Golden Age Points Change
	local iGoldenAgePoints = Game.GetBuildingYieldChange(iBuildingID, yieldGoldenAgePointsID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldGoldenAgePointsID);
	if (pCity ~= nil) then
		iGoldenAgePoints = iGoldenAgePoints + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldGoldenAgePointsID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldGoldenAgePointsID);
		iGoldenAgePoints = iGoldenAgePoints + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldGoldenAgePointsID);
		iGoldenAgePoints = iGoldenAgePoints + pCity:GetEventBuildingClassYield(buildingClassID, yieldGoldenAgePointsID);
	end
	if (iGoldenAgePoints ~= nil and iGoldenAgePoints ~= 0) then
		if iGoldenAgePoints >= 0 then
			if iGoldenAgePointsMod and iGoldenAgePointsMod > 0 then iGoldenAgePoints = iGoldenAgePoints .. ",+" .. iGoldenAgePointsMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLDEN_AGE_POINTS", iGoldenAgePoints));
			numYields = numYields + 1
		else
			if iGoldenAgePointsMod and iGoldenAgePointsMod < 0 then iGoldenAgePoints = iGoldenAgePoints .. "," .. iGoldenAgePointsMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLDEN_AGE_POINTS_NEGATIVE", iGoldenAgePoints));
			numYields = numYields + 1
		end
	end
	if (iGoldenAgePointsMod ~= nil and iGoldenAgePointsMod ~= 0) and iGoldenAgePoints == 0 then
		if iGoldenAgePointsMod >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLDEN_AGE_POINTS_MOD", "+" .. iGoldenAgePointsMod));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLDEN_AGE_POINTS_MOD_NEGATIVE", iGoldenAgePointsMod));
			numYields = numYields + 1
		end
	end
	
	-- Science Mods
	local iScienceMod = Game.GetBuildingYieldModifier(iBuildingID, yieldScienceID);
	iScienceMod = iScienceMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldScienceID);
	if (pCity ~= nil) then
		iScienceMod = iScienceMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldScienceID);
		iScienceMod = iScienceMod + pCity:GetLocalBuildingClassYield(buildingClassID, yieldScienceID);
		iScienceMod = iScienceMod + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldScienceID);
		iScienceMod = iScienceMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldScienceID);
	end
	
	-- Science Change
	local iScience = Game.GetBuildingYieldChange(iBuildingID, yieldScienceID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldScienceID);
	if (pCity ~= nil) then
		iScience = iScience + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldScienceID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldScienceID);
		iScience = iScience + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldScienceID);
		iScience = iScience + pCity:GetEventBuildingClassYield(buildingClassID, yieldScienceID);
	end
	if (iScience ~= nil and iScience ~= 0) then
		if iScience >= 0 then
			if iScienceMod and iScienceMod > 0 then iScience = iScience .. ",+" .. iScienceMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE_CHANGE", iScience));
			numYields = numYields + 1
		else
			if iScienceMod and iScienceMod < 0 then iScience = iScience .. "," .. iScienceMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE_NEGATIVE", iScience));
			numYields = numYields + 1
		end
	end
	if (iScienceMod ~= nil and iScienceMod ~= 0) and iScience == 0 then
		if iScienceMod >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE", iScienceMod));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE_MOD_NEGATIVE", iScienceMod));
			numYields = numYields + 1
		end
	end
	--END LEARNING
	
	--BEGIN HERITAGE
	-- Culture Mods
	local iCultureMod = Game.GetBuildingYieldModifier(iBuildingID, yieldCultureID);
	iCultureMod = iCultureMod + GameInfo.Buildings[iBuildingID].CultureRateModifier
	iCultureMod = iCultureMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldCultureID);
	if (pCity ~= nil) then
		iCultureMod = iCultureMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldCultureID);
		iCultureMod = iCultureMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldCultureID);
	end
	
	-- Culture Change
	local iCulture = Game.GetBuildingYieldChange(iBuildingID, yieldCultureID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldCultureID);
	iCulture = iCulture + pActivePlayer:GetExtraYieldWorldWonder(iBuildingID, yieldCultureID);
	if (pCity ~= nil) then
		iCulture = iCulture + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldCultureID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldCultureID);
		iCulture = iCulture + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldCultureID);
		iCulture = iCulture + pCity:GetBuildingClassCultureChange(buildingClassID);
		iCulture = iCulture + pCity:GetLocalBuildingClassYield(buildingClassID, yieldCultureID);
		iCulture = iCulture + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldCultureID);
		iCulture = iCulture + pCity:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldCultureID);
		iCulture = iCulture + pCity:GetEventBuildingClassYield(buildingClassID, yieldCultureID);
	end
	if (iCulture ~= nil and iCulture ~= 0) then
		if iCulture >= 0 then
			if iCultureMod and iCultureMod > 0 then iCulture = iCulture .. ",+" .. iCultureMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CULTURE", iCulture));
			numYields = numYields + 1
		else
			if iCultureMod and iCultureMod < 0 then iCulture = iCulture .. "," .. iCultureMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CULTURE_NEGATIVE", iCulture));
			numYields = numYields + 1
		end
	end
	if (iCultureMod ~= nil and iCultureMod ~= 0) and iCulture == 0 then
		if iCultureMod >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CULTURE_MOD", iCultureMod));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CULTURE_MOD_NEGATIVE", iCultureMod));
			numYields = numYields + 1
		end
	end
	
	-- Tourism Mods
	local iTourismMod = Game.GetBuildingYieldModifier(iBuildingID, yieldTourismID);
	iTourismMod = iTourismMod + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, yieldTourismID);
	if (pCity ~= nil) then
		iTourismMod = iTourismMod + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, yieldTourismID);
		iTourismMod = iTourismMod + pCity:GetEventBuildingClassModifier(buildingClassID, yieldTourismID);
	end
	
	-- Tourism Change
	local iTourism = Game.GetBuildingYieldChange(iBuildingID, yieldTourismID) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, yieldTourismID);
	iTourism = iTourism + pActivePlayer:GetExtraYieldWorldWonder(iBuildingID, yieldTourismID);
	if (pCity ~= nil) then
		iTourism = iTourism + pCity:GetFaithBuildingTourism();
		iTourism = iTourism + pCity:GetReligionBuildingClassYieldChange(buildingClassID, yieldTourismID) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, yieldTourismID);
		iTourism = iTourism + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, yieldTourismID);
		iTourism = iTourism + pCity:GetEventBuildingClassYield(buildingClassID, yieldTourismID);
	end
	local iTechEnhancedTourism = pBuildingInfo.TechEnhancedTourism;
	local iEnhancingTech = GameInfoTypes[pBuildingInfo.EnhancedYieldTech];
	if(iTechEnhancedTourism > 0 and pActiveTeam:GetTeamTechs():HasTech(iEnhancingTech)) then
		iTourism = iTourism + iTechEnhancedTourism
	end	
	if (iTourism ~= nil and iTourism ~= 0) then
		if iTourism >= 0 then
			if iTourismMod and iTourismMod > 0 then iTourism = iTourism .. ",+" .. iTourismMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_TOURISM", iTourism));
			numYields = numYields + 1
		else
			if iTourismMod and iTourismMod < 0 then iTourism = iTourism .. "," .. iTourismMod .. "%" end
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_TOURISM_NEGATIVE", iTourism));
			numYields = numYields + 1
		end
	end
	if (iTourismMod ~= nil and iTourismMod ~= 0) and iTourism == 0 then
		if iTourismMod >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_TOURISM_MOD", iTourismMod));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_TOURISM_MOD_NEGATIVE", iTourismMod));
			numYields = numYields + 1
		end
	end
	--END HERITAGE
	
	--BEGIN FORCES
	--Great Admiral Points
	local iYieldGreatAdmiralPoints = GameInfo.Yields["YIELD_GREAT_ADMIRAL_POINTS"].ID
	local iGreatAdmiralPoints = Game.GetBuildingYieldChange(iBuildingID, iYieldGreatAdmiralPoints) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, iYieldGreatAdmiralPoints);
	if (pCity ~= nil) then
		iGreatAdmiralPoints = iGreatAdmiralPoints + pCity:GetReligionBuildingClassYieldChange(buildingClassID, iYieldGreatAdmiralPoints) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, iYieldGreatAdmiralPoints);
		iGreatAdmiralPoints = iGreatAdmiralPoints + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, iYieldGreatAdmiralPoints);
		iGreatAdmiralPoints = iGreatAdmiralPoints + pCity:GetEventBuildingClassYield(buildingClassID, iYieldGreatAdmiralPoints);
	end
	if (iGreatAdmiralPoints ~= nil and iGreatAdmiralPoints ~= 0) then
		if iGreatAdmiralPoints >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GREAT_ADMIRAL_POINTS", iGreatAdmiralPoints));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GREAT_ADMIRAL_POINTS_NEGATIVE", iGreatAdmiralPoints));
			numYields = numYields + 1
		end
	end
	--Great General Points
	local iYieldGreatGeneralPoints = GameInfo.Yields["YIELD_GREAT_GENERAL_POINTS"].ID
	local iGreatGeneralPoints = Game.GetBuildingYieldChange(iBuildingID, iYieldGreatGeneralPoints) + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, iYieldGreatGeneralPoints);
	if (pCity ~= nil) then
		iGreatGeneralPoints = iGreatGeneralPoints + pCity:GetReligionBuildingClassYieldChange(buildingClassID, iYieldGreatGeneralPoints) + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, iYieldGreatGeneralPoints);
		iGreatGeneralPoints = iGreatGeneralPoints + pCity:GetLeagueBuildingClassYieldChange(buildingClassID, iYieldGreatGeneralPoints);
		iGreatGeneralPoints = iGreatGeneralPoints + pCity:GetEventBuildingClassYield(buildingClassID, iYieldGreatGeneralPoints);
	end
	if (iGreatGeneralPoints ~= nil and iGreatGeneralPoints ~= 0) then
		if iGreatGeneralPoints >= 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GREAT_GENERAL_POINTS", iGreatGeneralPoints));
			numYields = numYields + 1
		else
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GREAT_GENERAL_POINTS_NEGATIVE", iGreatGeneralPoints));
			numYields = numYields + 1
		end
	end
	--END FORCES
	
	--BEGIN ORDER	
	-- JFD Crime
	if userSettingCIDCrimeCore then
		local crimeID = GameInfo.Yields["YIELD_JFD_CRIME"].ID
		local isBuildingFree = false
		if pCity then
			isBuildingFree = pCity:GetNumFreeBuilding(iBuildingID) > 0
		end
		local iCrime = Game.GetBuildingYieldChange(iBuildingID, crimeID)
		iCrime = iCrime + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, crimeID)
		iCrime = iCrime + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, crimeID)
		if ((not isBuildingFree) and iCrime ~= nil and iCrime ~= 0) then		
			if iCrime < 0 then
				table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CRIME_NEGATIVE", iCrime));
			numYields = numYields + 1
			end
		end
		
		local iCrime = Game.GetBuildingYieldModifier(iBuildingID, crimeID)
		iCrime = iCrime + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, crimeID)
		if iCrime < 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CRIME_MOD_NEGATIVE", iCrime));
			numYields = numYields + 1
		end
		
		local iCrimeMod = 0
		local pCrime = nil
		for row in GameInfo.Building_JFD_CrimeMods(thisBuilding) do
			iCrimeMod = row.CrimeMod
			pCrime = row.CrimeType
		end
		if iCrimeMod < 0 and pCrime then		
			local pCrimeInfo = GameInfo.JFD_Crimes[pCrime]
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SPECIFIC_CRIME_MOD", iCrimeMod, pCrimeInfo.IconString, pCrimeInfo.Description));
			numYields = numYields + 1
		end
	end
		
	-- JFD Loyalty
	if userSettingCIDLoyaltyCore then
		local loyaltyID = GameInfo.Yields["YIELD_JFD_LOYALTY"].ID
		local iLoyalty = Game.GetBuildingYieldModifier(iBuildingID, loyaltyID);
		iLoyalty = iLoyalty + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, loyaltyID);
		if (pCity ~= nil) then
			iLoyalty = iLoyalty + pCity:GetReligionBuildingYieldRateModifier(buildingClassID, loyaltyID);
		end
		if (iLoyalty ~= nil and iLoyalty > 0) then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_LOYALTY_MOD", "+" .. iLoyalty));
			numYields = numYields + 1
		end
	end
	
	-- JFD Sovereignty
	if userSettingRTPSovereigntyCore then
		local sovereigntyID = GameInfo.Yields["YIELD_JFD_SOVEREIGNTY"].ID
		local iSovereignty = Game.GetBuildingYieldChange(iBuildingID, sovereigntyID)
		iSovereignty = iSovereignty + pActivePlayer:GetPlayerBuildingClassYieldChange(buildingClassID, sovereigntyID)
		iSovereignty = iSovereignty + pActivePlayer:GetPolicyBuildingClassYieldChange(buildingClassID, sovereigntyID)
		local iSovereignty = Game.GetBuildingYieldModifier(iBuildingID, sovereigntyID)
		iSovereignty = iSovereignty + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, sovereigntyID)
		if iSovereignty > 0 then
			table.insert(lines, Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SOVEREIGNTY_MOD", iSovereignty));
			numYields = numYields + 1
		end
	end
	if numYields > 0 then table.insert(lines, "----------------"); end
	--END ORDER
	
	-- Resources
	local numResources = 0
	for row in GameInfo.Building_ResourceQuantity("BuildingType = '" .. pBuildingInfo.Type .. "'") do
		local iNumResource = row.Quantity;
		if (iNumResource > 0) then
			local resource = GameInfo.Resources[row.ResourceType]
			table.insert(lines, resource.IconString .. " " .. Locale.ConvertTextKey(resource.Description) .. ": +" .. iNumResource); 
			numResources = numResources + 1
		end
	end
	if numResources > 0 then table.insert(lines, "----------------"); end
	
	-- Great People
	local specialistType = pBuildingInfo.SpecialistType;
	local numGP = 0
	if specialistType ~= nil then
		local iNumPoints = pBuildingInfo.GreatPeopleRateChange;
		if (iNumPoints > 0) then
			table.insert(lines, "[ICON_GREAT_PEOPLE] " .. Locale.ConvertTextKey(GameInfo.Specialists[specialistType].GreatPeopleTitle) .. " " .. iNumPoints); 
			numGP = numGP + 1
		end
		
		if(pBuildingInfo.SpecialistCount > 0) then
			-- Append a key such as TXT_KEY_SPECIALIST_ARTIST_SLOTS
			local specialistSlotsKey = GameInfo.Specialists[specialistType].Description .. "_SLOTS";
			table.insert(lines, "[ICON_GREAT_PEOPLE] " .. Locale.ConvertTextKey(specialistSlotsKey) .. " " .. pBuildingInfo.SpecialistCount);
			numGP = numGP + 1
		end
	end
	for row in GameInfo.Policy_BuildingClassGreatPeoplePointsChange("BuildingClassType = '" .. pBuildingInfo.BuildingClass .. "'") do
		if pActivePlayer:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local iNumPoints = row.PointsChange;
			if (iNumPoints > 0) then
				table.insert(lines, "[ICON_GREAT_PEOPLE] " .. Locale.ConvertTextKey(GameInfo.Specialists[row.SpecialistType].GreatPeopleTitle) .. " " .. iNumPoints); 
				numGP = numGP + 1
			end
		end
	end
-- CBP
	if (pCity ~= nil) then
		local iCorpGPChange = pCity:GetGPRateModifierPerXFranchises();
		if iCorpGPChange ~=0 then
			local localizedText = Locale.ConvertTextKey("TXT_KEY_PEDIA_CORP_GP_CHANGE", iCorpGPChange);
			table.insert(lines, localizedText);
			numGP = numGP + 1
		end
	end
-- END
	if numGP > 0 then table.insert(lines, "----------------"); end
	
	local iNumGreatWorks = pBuildingInfo.GreatWorkCount;
	if(iNumGreatWorks > 0) then
		local greatWorksSlotType = GameInfo.GreatWorkSlots[pBuildingInfo.GreatWorkSlotType];
		local localizedText = Locale.Lookup(greatWorksSlotType.SlotsToolTipText, iNumGreatWorks);
		table.insert(lines, localizedText);
	end
	if iNumGreatWorks > 0 then table.insert(lines, "----------------"); end

	strHelpText = strHelpText .. table.concat(lines, "[NEWLINE]");
	
	-- Pre-written Help text
	local strWrittenHelpText = ""
	if pActivePlayer then
		-- Additional Help
		for row in GameInfo.BuildingClass_JFD_HelpTexts("BuildingClassType = '" .. pBuildingInfo.BuildingClass .. "' AND IsWrittenFirst = 1 AND HelpText IS NOT NULL") do
			local policyType = row.PolicyType
			if (policyType and pActivePlayer:HasPolicy(GameInfoTypes[policyType]) or (not policyType)) then
				if (not row.NotOnceBuilt) or (pCity and (not pCity:HasBuilding(iBuildingID))) then
					strWrittenHelpText = strWrittenHelpText .. Locale.ConvertTextKey( row.HelpText );
				end
			end
		end
		local civID = GameInfo.Civilizations[pActivePlayer:GetCivilizationType()].ID
		for row in GameInfo.Building_JFD_HelpTexts("BuildingType = '" .. pBuildingInfo.Type .. "' AND IsWrittenFirst = 1 AND HelpText IS NOT NULL") do
			local civilizationType = row.CivilizationType
			if (civilizationType and civID == GameInfoTypes[civilizationType] or (not civilizationType)) then
				if (not row.NotOnceBuilt) or (pCity and (not pCity:HasBuilding(iBuildingID))) then
					strWrittenHelpText = strWrittenHelpText .. Locale.ConvertTextKey( row.HelpText );
				end
			end
		end
	end
	if (pBuildingInfo.Help ~= nil) then
		strWrittenHelpText = strWrittenHelpText .. Locale.ConvertTextKey( pBuildingInfo.Help );
	end
	if pActivePlayer then
		-- Additional Help
		for row in GameInfo.BuildingClass_JFD_HelpTexts("BuildingClassType = '" .. pBuildingInfo.BuildingClass .. "' AND IsWrittenFirst = 0 AND HelpText IS NOT NULL") do
			local policyType = row.PolicyType
			if (policyType and pActivePlayer:HasPolicy(GameInfoTypes[policyType]) or (not policyType)) then
				if (not row.NotOnceBuilt) or (pCity and (not pCity:HasBuilding(iBuildingID))) then
					strWrittenHelpText = strWrittenHelpText .. Locale.ConvertTextKey( row.HelpText );
				end
			end
		end
		local civID = GameInfo.Civilizations[pActivePlayer:GetCivilizationType()].ID
		for row in GameInfo.Building_JFD_HelpTexts("BuildingType = '" .. pBuildingInfo.Type .. "' AND IsWrittenFirst = 0 AND HelpText IS NOT NULL") do
			local civilizationType = row.CivilizationType
			if (civilizationType and civID == GameInfoTypes[civilizationType] or (not civilizationType)) then
				if (not row.NotOnceBuilt) or (pCity and (not pCity:HasBuilding(iBuildingID))) then
					strWrittenHelpText = strWrittenHelpText .. Locale.ConvertTextKey( row.HelpText );
				end
			end
		end
	end	
	if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
		-- Separator
		strHelpText = strHelpText .. "[NEWLINE]" .. strWrittenHelpText 
	end

-- CBP
	if ((isUsingCBO or userSettingCIDInvestmentsCore) and (not bIsMagistrate) and pBuildingInfo.Cost > 0) then
		if (pCity ~= nil) then
			if(pCity:GetNumRealBuilding(iBuildingID) <= 0) then
				if(pCity:GetNumFreeBuilding(iBuildingID) <= 0 and (pCity:GetBuildingInvestment(iBuildingID) <= 0)) then
					local pBuildingClassInfo = GameInfo.BuildingClasses[pBuildingInfo.BuildingClass]
					local strInvestment = "TXT_KEY_PRODUCTION_INVESTMENT_BUILDING"
					local isWonder = (pBuildingClassInfo.MaxGlobalInstances >= 1 or pBuildingClassInfo.MaxPlayerInstances >= 1)
					local iAmount = pActivePlayer:GetInvestmentValue(false, isWonder)
					iAmount = (iAmount * -1);
					if isWonder then
						strInvestment = "TXT_KEY_PRODUCTION_INVESTMENT_WONDER"
					end
					local localizedText = Locale.ConvertTextKey(strInvestment, iAmount);
					-- Separator
					strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
					strHelpText = strHelpText .. localizedText;
				end
			end
		end
	end
-- END

	return strHelpText;
	
end


-- IMPROVEMENT
function GetHelpTextForImprovement(iImprovementID, bExcludeName, bExcludeHeader, bNoMaintenance)
	local pImprovementInfo = GameInfo.Improvements[iImprovementID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local strHelpText = "";
	
	if (not bExcludeHeader) then
		
		if (not bExcludeName) then
			-- Name
			strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pImprovementInfo.Description ));
			strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		end
				
	end
		
	-- if we end up having a lot of these we may need to add some more stuff here
	
	-- Pre-written Help text
	if (pImprovementInfo.Help ~= nil) then
		local strWrittenHelpText = Locale.ConvertTextKey( pImprovementInfo.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			-- strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end
	end
	
	return strHelpText;
	
end


-- PROJECT
function GetHelpTextForProject(iProjectID, bIncludeRequirementsInfo)
	local pProjectInfo = GameInfo.Projects[iProjectID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local strHelpText = "";
	
	-- Name
	strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pProjectInfo.Description ));
	
	-- Cost
	local iCost = pActivePlayer:GetProjectProductionNeeded(iProjectID);
	strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
	strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", iCost);
	
	-- Pre-written Help text
	local strWrittenHelpText = Locale.ConvertTextKey( pProjectInfo.Help );
	if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
		-- Separator
		strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		strHelpText = strHelpText .. strWrittenHelpText;
	end
	
	-- Requirements?
	if (bIncludeRequirementsInfo) then
		if (pProjectInfo.Requirements) then
			strHelpText = strHelpText .. Locale.ConvertTextKey( pProjectInfo.Requirements );
		end
	end
	
	return strHelpText;
	
end


-- PROCESS
function GetHelpTextForProcess(iProcessID, bIncludeRequirementsInfo)
	local pProcessInfo = GameInfo.Processes[iProcessID];
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local strHelpText = "";
	
	-- Name
	strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey(pProcessInfo.Description));
	
	-- Pre-written Help text
	local strWrittenHelpText = Locale.ConvertTextKey(pProcessInfo.Help);
	if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
		strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		strHelpText = strHelpText .. strWrittenHelpText;
	end
	
	-- League Project text
	if (not Game.IsOption("GAMEOPTION_NO_LEAGUES")) then
		local tProject = nil;
		
		for t in GameInfo.LeagueProjects() do
			if (iProcessID == GameInfo.Processes[t.Process].ID) then
				tProject = t;
				break;
			end
		end

		local pLeague = Game.GetActiveLeague();

		if (tProject ~= nil and pLeague ~= nil) then
			strHelpText = strHelpText .. "[NEWLINE][NEWLINE]";
			strHelpText = strHelpText .. pLeague:GetProjectDetails(GameInfo.LeagueProjects[tProject.Type].ID, Game.GetActivePlayer());
		end
	end

	return strHelpText;
end

-------------------------------------------------
-- Tooltips for Yield & Similar (e.g. Culture)
-------------------------------------------------

-- FOOD
function GetFoodTooltip(pCity)
	
	local iYieldType = yieldFoodID;
	local strFoodToolTip = "";
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strFoodToolTip = strFoodToolTip .. Locale.ConvertTextKey("TXT_KEY_FOOD_HELP_INFO");
		strFoodToolTip = strFoodToolTip .. "[NEWLINE][NEWLINE]";
	end
	
	local fFoodProgress = pCity:GetFoodTimes100() / 100;
	local iFoodNeeded = pCity:GrowthThreshold();
	
	strFoodToolTip = strFoodToolTip .. Locale.ConvertTextKey("TXT_KEY_FOOD_PROGRESS", fFoodProgress, iFoodNeeded);
	
	strFoodToolTip = strFoodToolTip .. "[NEWLINE][NEWLINE]";
	strFoodToolTip = strFoodToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_FOOD]");
	
	return strFoodToolTip;
end

-- GOLD
function GetGoldTooltip(pCity)
	
	local iYieldType = yieldGoldID;

	local strGoldToolTip = "";
	if (not OptionsManager.IsNoBasicHelp()) then
		strGoldToolTip = strGoldToolTip .. Locale.ConvertTextKey("TXT_KEY_GOLD_HELP_INFO");
		strGoldToolTip = strGoldToolTip .. "[NEWLINE][NEWLINE]";
	end
	
	strGoldToolTip = strGoldToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_GOLD]");
	
	return strGoldToolTip;
end

-- SCIENCE
function GetScienceTooltip(pCity)
	
	local strScienceToolTip = "";

	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
		strScienceToolTip = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_SCIENCE_OFF_TOOLTIP");
	else

		local iYieldType = yieldScienceID;
	
		if (not OptionsManager.IsNoBasicHelp()) then
			strScienceToolTip = strScienceToolTip .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_HELP_INFO");
			strScienceToolTip = strScienceToolTip .. "[NEWLINE][NEWLINE]";
		end
	
		strScienceToolTip = strScienceToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_RESEARCH]");
	end
	
	return strScienceToolTip;
end

-- PRODUCTION
function GetProductionTooltip(pCity)

	local iBaseProductionPT = pCity:GetBaseYieldRate(yieldProductionID);
	local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100;--pCity:GetYieldRate(yieldProductionID);
	local strCodeToolTip = pCity:GetYieldModifierTooltip(yieldProductionID);
	
	local strProductionBreakdown = GetYieldTooltip(pCity, yieldProductionID, iBaseProductionPT, iProductionPerTurn, "[ICON_PRODUCTION]", strCodeToolTip);
	
	-- Basic explanation of production
	local strProductionHelp = "";
	if (not OptionsManager.IsNoBasicHelp()) then
		strProductionHelp = strProductionHelp .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFO");
		strProductionHelp = strProductionHelp .. "[NEWLINE][NEWLINE]";
		--Controls.ProductionButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CHANGE_PROD_TT"));
	else
		--Controls.ProductionButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CHANGE_PROD"));
	end
	
	return strProductionHelp .. strProductionBreakdown;
end

-- CULTURE
function GetCultureTooltip(pCity)
	local pPlayer = Players[pCity:GetOwner()]

	local strCultureToolTip = "";
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_POLICIES)) then
		strCultureToolTip = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_POLICIES_OFF_TOOLTIP");
	else
		if (not OptionsManager.IsNoBasicHelp()) then
			strCultureToolTip = strCultureToolTip .. Locale.ConvertTextKey("TXT_KEY_CULTURE_HELP_INFO");
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
		end
		
		local bFirst = true;
		
		-- Culture from Buildings
		local iCultureFromBuildings = pCity:GetJONSCulturePerTurnFromBuildings()
		if (iCultureFromBuildings ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_BUILDINGS", iCultureFromBuildings);
		end
		
		-- Culture from Policies
		local iCultureFromPolicies = pCity:GetJONSCulturePerTurnFromPolicies();
		if (iCultureFromPolicies ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_POLICIES", iCultureFromPolicies);
		end
		
		-- Culture from Specialists
		local iCultureFromSpecialists = pCity:GetJONSCulturePerTurnFromSpecialists();
		if (iCultureFromSpecialists ~= 0) then
			--CBP
			iCultureFromSpecialists = (iCultureFromSpecialists + pCity:GetBaseYieldRateFromSpecialists(yieldCultureID));
			--END
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_SPECIALISTS", iCultureFromSpecialists);
		end
		
		-- Culture from Great Works
		local iCultureFromGreatWorks = pCity:GetJONSCulturePerTurnFromGreatWorks();
		if (iCultureFromGreatWorks ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_GREAT_WORKS", iCultureFromGreatWorks);
		end
		
		-- Culture from Religion
		local iCultureFromReligion = pCity:GetJONSCulturePerTurnFromReligion();
		if ( iCultureFromReligion ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_RELIGION", iCultureFromReligion);
		end

-- CBP

		-- Base Yield from Pop
		local iYieldPerPop = pCity:GetYieldPerPopTimes100(yieldCultureID);
		if (iYieldPerPop ~= 0) then
			iYieldPerPop = iYieldPerPop * pCity:GetPopulation();
			iYieldPerPop = iYieldPerPop / 100;
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_POPULATION", iYieldPerPop);
		end
-- END

-- CBP -- Yield Increase from Piety
		local iYieldFromPiety = pCity:GetReligionYieldRateModifier(yieldCultureID);
		if ( iYieldFromPiety ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_PIETY", iYieldFromPiety);
		end
-- END
-- CBP -- Yield Increase from CS Alliance
		local iYieldFromCSAlliance = pCity:GetBaseYieldRateFromCSAlliance(yieldCultureID);
		if ( iYieldFromCSAlliance ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_CS_ALLIANCE", iYieldFromCSAlliance);
		end
-- END		
		-- Culture from Leagues
		local iCultureFromLeagues = pCity:GetJONSCulturePerTurnFromLeagues();
		if ( iCultureFromLeagues ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_LEAGUES", iCultureFromLeagues);
		end
		
		-- Culture from Terrain
		local iCultureFromTerrain = pCity:GetBaseYieldRateFromTerrain(yieldCultureID);
		if (iCultureFromTerrain ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_TERRAIN", iCultureFromTerrain);
		end
		
		-- Culture from Units
		local iCultureFromUnits = pCity:GetYieldFromUnitsInCity(yieldFaithID);
		if (iCultureFromUnits ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_UNIT", iCultureFromUnits, "[ICON_CULTURE]");
		end

		-- Culture from Traits
		local iCultureFromTraits = pCity:GetJONSCulturePerTurnFromTraits();
		iCultureFromTraits = (iCultureFromTraits + pCity:GetYieldPerTurnFromTraits(yieldCultureID));
		if (iCultureFromTraits ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_TRAITS", iCultureFromTraits);
		end

		-- CP Events
		-- Culture from Events
		local iCultureFromEvent = pCity:GetEventCityYield(yieldCultureID);
		if (iCultureFromEvent ~= 0) then
			
			-- Spacing
			if (bFirst) then
				bFirst = false;
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
			end
			
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_EVENTS", iCultureFromEvent);
		end
		-- END 
		
		-- Empire Culture modifier
		local iAmount = Players[pCity:GetOwner()]:GetCultureCityModifier();
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_PLAYER_MOD", iAmount);
		end
		
		-- City Culture modifier
		local iAmount = pCity:GetCultureRateModifier();
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_CITY_MOD", iAmount);
		end

		-- City Culture League modifier (CSD)
		local iAmount = Players[pCity:GetOwner()]:GetLeagueCultureCityModifier();
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_LEAGUE_MOD", iAmount);
		end
		
		-- Culture Wonders modifier
		if (pCity:GetNumWorldWonders() > 0) then
			iAmount = Players[pCity:GetOwner()]:GetCultureWonderMultiplier();
			
			if (iAmount ~= 0) then
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_WONDER_BONUS", iAmount);
			end
		end

		-- CBP -- Resource Monopoly
		if (pCity:GetCityYieldModFromMonopoly(yieldCultureID) > 0) then
			iAmount = pCity:GetCityYieldModFromMonopoly(yieldCultureID);
			
			if (iAmount ~= 0) then
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_RESOURCE_MONOPOLY", iAmount);
			end
		end

		if (pCity:GetTradeRouteCityMod(yieldCultureID) > 0) then
			iAmount = pCity:GetTradeRouteCityMod(yieldCultureID);
			
			if (iAmount ~= 0) then
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_CORPORATION", iAmount);
			end
		end
		local iAmount = pCity:GetCultureModFromCarnaval();
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_WLTKD_TRAIT", iAmount);
		end
		-- END

		-- CBP
		local iAmount = pCity:GetModFromWLTKD(yieldCultureID);
		if (iAmount ~= 0) then
			if iAmount > 0 then
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_WLTKD", "+" .. iAmount);
			else
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_WLTKD", iAmount);
			end
		end

		local iAmount = pCity:GetModFromGoldenAge(yieldCultureID);
		for row in GameInfo.Policy_GoldenAgeYieldMod("YieldType = 'YIELD_CULTURE' AND Yield <> 0") do
			if pPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) then
				iAmount = iAmount + row.Yield
			end
		end
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			if iAmount > 0 then
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_GOLDEN_AGE", "+" .. iAmount);
			else
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_GOLDEN_AGE", iAmount);
			end
		end
		-- END
-- CBP Yield from Great Works
		--local iYieldFromGreatWorks = pCity:GetBaseYieldRateFromGreatWorks(yieldCultureID);
		--if (iYieldFromGreatWorks ~= 0) then
		--	strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
		--	strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_ART_CBP_CULTURE", iYieldFromGreatWorks);
		--end
-- END		

		-- JFD Culture from Crime
		if userSettingCIDCrimeCore then
			local iAmount, iAmountMod, strYieldFromCrime = pPlayer:GetCrimeYields(pCity, GameInfoTypes["CRIME_JFD_CULTURE"])
			if iAmount and iAmount ~= 0 then
				if iAmount > 0 then iAmount = "+" .. iAmount end
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iAmount);
			end
			if iAmountMod and iAmountMod ~= 0 then
				if iAmountMod > 0 then iAmountMod = "+" .. iAmountMod end
				strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
				strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iAmountMod .. "%");
			end
		end
		-- Puppet modifier
		if (pCity:IsPuppet()) then
			iAmount = GameDefines.PUPPET_CULTURE_MODIFIER;
			
			if (iAmount ~= 0) then
				strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
				strCultureToolTip = strCultureToolTip .. Locale.ConvertTextKey("TXT_KEY_PRODMOD_PUPPET", iAmount);
			end
		end
	end
	
	
	-- Tile growth
	local iCulturePerTurn = pCity:GetJONSCulturePerTurn();
	local iCultureStored = pCity:GetJONSCultureStored();
	local iCultureNeeded = pCity:GetJONSCultureThreshold();

	strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
	strCultureToolTip = strCultureToolTip .. Locale.ConvertTextKey("TXT_KEY_CULTURE_INFO", iCultureStored, iCultureNeeded);
	
	if iCulturePerTurn > 0 then
		local iCultureDiff = iCultureNeeded - iCultureStored;
		local iCultureTurns = math.ceil(iCultureDiff / iCulturePerTurn);
		strCultureToolTip = strCultureToolTip .. " " .. Locale.ConvertTextKey("TXT_KEY_CULTURE_TURNS", iCultureTurns);
	end
	
	return strCultureToolTip;
end

-- FAITH
function GetFaithTooltip(pCity)
	local pPlayer = Players[pCity:GetOwner()]
	local faithTips = {};
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_RELIGION_OFF_TOOLTIP"));
	else

		if (not OptionsManager.IsNoBasicHelp()) then
			table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_FAITH_HELP_INFO"));
		end
	
		-- Faith from Buildings
		local iFaithFromBuildings = pCity:GetFaithPerTurnFromBuildings()
		if (iFaithFromBuildings ~= 0) then
		
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_BUILDINGS", iFaithFromBuildings));
		end
-- CBP

		-- Base Yield from Pop
		local iYieldPerPop = pCity:GetYieldPerPopTimes100(yieldFaithID);
		if (iYieldPerPop ~= 0) then
			iYieldPerPop = iYieldPerPop * pCity:GetPopulation();
			iYieldPerPop = iYieldPerPop / 100;
			
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_POP", iYieldPerPop));
		end
		-- Faith from Specialists
		local iYieldFromSpecialists = pCity:GetBaseYieldRateFromSpecialists(yieldFaithID);
		if (iYieldFromSpecialists ~= 0) then
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_SPECIALISTS_FAITH", iYieldFromSpecialists));
		end
-- END
		-- Faith from Traits
		local iFaithFromTraits = pCity:GetFaithPerTurnFromTraits();
		iFaithFromTraits = (iFaithFromTraits + pCity:GetYieldPerTurnFromTraits(yieldFaithID));
		if (iFaithFromTraits ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_TRAITS", iFaithFromTraits));
		end

-- CBP -- Yield Increase from Piety
		local iYieldFromPiety = pCity:GetReligionYieldRateModifier(yieldFaithID);
		if (iYieldFromPiety ~= 0) then
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_PIETY", iYieldFromPiety));
		end
-- END
-- CBP -- Yield Increase from CS Alliance
		local iYieldFromCSAlliance = pCity:GetBaseYieldRateFromCSAlliance(yieldFaithID);
		if (iYieldFromCSAlliance ~= 0) then
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_CS_ALLIANCE", iYieldFromCSAlliance));
		end
-- END		
		-- Faith from Terrain
		local iFaithFromTerrain = pCity:GetBaseYieldRateFromTerrain(yieldFaithID);
		if (iFaithFromTerrain ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_TERRAIN", iFaithFromTerrain));
		end
		
		-- Faith from Units
		local iFaithFromUnits = pCity:GetYieldFromUnitsInCity(yieldFaithID);
		if (iFaithFromUnits ~= 0) then
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_UNIT", iFaithFromUnits, "[ICON_PEACE]"));
		end

		-- Faith from Policies
		local iFaithFromPolicies = pCity:GetFaithPerTurnFromPolicies();
		if (iFaithFromPolicies ~= 0) then
					
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_POLICIES", iFaithFromPolicies));
		end

		-- Faith from Religion
		local iFaithFromReligion = pCity:GetFaithPerTurnFromReligion(); 
		if (iFaithFromReligion ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_RELIGION", iFaithFromReligion));
		end
		-- CP Events
		-- Faith from Events
		local iFaithFromEvent = pCity:GetEventCityYield(yieldFaithID);
		if (iFaithFromEvent ~= 0) then
			
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_EVENTS", iFaithFromEvent));
		end
		-- END 
		-- CBP
		local iFaithWLTKDMod = pCity:GetModFromWLTKD(yieldFaithID);
		if (iFaithWLTKDMod ~= 0) then
			if iFaithWLTKDMod > 0 then
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_WLTKD", "+" .. iFaithWLTKDMod));
			else
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_WLTKD", iFaithWLTKDMod));
			end
		end

		local iFaithGoldenAgeMod = pCity:GetModFromGoldenAge(yieldFaithID);
		if (iFaithGoldenAgeMod ~= 0) then
			if iFaithGoldenAgeMod > 0 then
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_GOLDEN_AGE", "+" .. iFaithWLTKDMod));
			else
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_GOLDEN_AGE", iFaithWLTKDMod));
			end
		end
		-- END

-- CBP Yield from Great Works
		local iYieldFromGreatWorks = pCity:GetBaseYieldRateFromGreatWorks(yieldFaithID);
		if (iYieldFromGreatWorks ~= 0) then
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_ART_CBP_FAITH", iYieldFromGreatWorks));
		end
-- END

		-- CBP -- Resource Monopoly
		if (pCity:GetCityYieldModFromMonopoly(yieldFaithID) > 0) then
			iAmount = pCity:GetCityYieldModFromMonopoly(yieldFaithID);
			
			if (iAmount ~= 0) then
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_RESOURCE_MONOPOLY", iAmount));
			end
		end
		-- END
		
		-- JFD Faith from Crime
		if userSettingCIDCrimeCore then
			local iYieldFromCrime, iYieldModFromCrime, strYieldFromCrime = pPlayer:GetCrimeYields(pCity, GameInfoTypes["CRIME_JFD_FAITH"])
			if iYieldFromCrime ~= 0 then
				if iYieldFromCrime > 0 then iYieldFromCrime = "+" .. iYieldFromCrime end
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iYieldFromCrime));
			end
			if iYieldModFromCrime ~= 0 then
				if iYieldModFromCrime > 0 then iYieldModFromCrime = "+" .. iYieldModFromCrime end
				table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iYieldModFromCrime .. "%"));
			end
		end
		
		-- Modifiers
		local iFaith = pCity:GetYieldRateModifier(yieldFaithID) + pCity:GetYieldModifierFromDevelopment(yieldFaithID)
		local pGarrison = pCity:GetGarrisonedUnit()
		for row in GameInfo.UnitPromotions_YieldModifiers("YieldType = 'YIELD_FAITH'") do
			if pCity:IsWithinDistanceOfUnitPromotion(GameInfoTypes[row.PromotionType], 0, true, false) then
				iFaith = iFaith + row.Yield
			end
		end
		if iFaith ~= 0 then
			if iFaith > 0 then iFaith = "+" .. iFaith end
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_MODIFIERS", iFaith));
		end
		
		-- Puppet modifier
		if (pCity:IsPuppet()) then
			iAmount = GameDefines.PUPPET_FAITH_MODIFIER;
		
			if (iAmount ~= 0) then
				table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_PRODMOD_PUPPET", iAmount));
			end
		end
	
		-- Citizens breakdown
		table.insert(faithTips, "----------------");

		table.insert(faithTips, GetReligionTooltip(pCity));
	end
	
	local strFaithToolTip = table.concat(faithTips, "[NEWLINE]");
	return strFaithToolTip;
end

-- TOURISM
function GetTourismTooltip(pCity)
	local pPlayer = Players[pCity:GetOwner()]
	local strTourismToolTip = pCity:GetTourismTooltip();
	for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_TOURISM' AND Yield > 0") do
		if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) then
			local excludes = false
			for hide in GameInfo.JFD_Civilopedia_HideFromPedia("Type = '" .. row.BuildingType .. "'") do
				excludes = true
			end
			if (not excludes) then
				strTourismToolTip = strTourismToolTip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_TOURISM_FROM_BUILDINGS", row.Yield)
			end
		end
	end
	-- JFD
	if userSettingCIDCrimeCore then
		local tourismFromCrime, tourismModFromCrime, strYieldFromCrime = pPlayer:GetCrimeYields(pCity, GameInfoTypes["CRIME_JFD_TOURISM"])
		if tourismFromCrime ~= 0 then
			if tourismFromCrime > 0 then tourismFromCrime = "+" .. tourismFromCrime end
			strTourismToolTip = strTourismToolTip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(strYieldFromCrime, tourismFromCrime)
		end
		if tourismModFromCrime ~= 0 then
			if tourismModFromCrime > 0 then tourismModFromCrime = "+" .. tourismModFromCrime end
			strTourismToolTip = strTourismToolTip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(strYieldFromCrime, tourismModFromCrime .. "%")
		end
	end
	return strTourismToolTip
end

-- CBP
function GetCityHappinessTooltip(pCity)
	
	local strHappinessBreakdown = "";

	if(pCity) then
		local iStarvingUnhappiness = pCity:GetUnhappinessFromStarving();
		local iPillagedUnhappiness = pCity:GetUnhappinessFromPillaged();
		local iGoldUnhappiness = pCity:GetUnhappinessFromGold();
		local iDefenseUnhappiness = pCity:GetUnhappinessFromDefense();
		local iConnectionUnhappiness = pCity:GetUnhappinessFromConnection();
		local iMinorityUnhappiness = pCity:GetUnhappinessFromMinority();
		local iScienceUnhappiness = pCity:GetUnhappinessFromScience();
		local iCultureUnhappiness = pCity:GetUnhappinessFromCulture();
		local iResistanceUnhappiness = 0;
		if(pCity:IsRazing()) then
			iResistanceUnhappiness = (pCity:GetPopulation() / 2);
		elseif(pCity:IsResistance()) then
			iResistanceUnhappiness = (pCity:GetPopulation() / 2);
		end
		local iOccupationUnhappiness = 0;
		if(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) then
			iOccupationUnhappiness = (pCity:GetPopulation() * GameDefines.UNHAPPINESS_PER_OCCUPIED_POPULATION);
		end
			
		local iTotalUnhappiness = iScienceUnhappiness + iCultureUnhappiness + iDefenseUnhappiness + iGoldUnhappiness + iConnectionUnhappiness + iPillagedUnhappiness + iStarvingUnhappiness + iMinorityUnhappiness + iOccupationUnhappiness + iResistanceUnhappiness;

		local iPuppetMod = 0;
		if(pCity:IsPuppet()) then
			iPuppetMod = Players[pCity:GetOwner()]:GetPuppetUnhappinessMod();
		end

		local iCapitalMod = 0;
		if(pCity:IsCapital()) then
			iCapitalMod = Players[pCity:GetOwner()]:GetCapitalUnhappinessModCBP();
		end

		local iThresholdAdditions = (pCity:getThresholdAdditions() - iCapitalMod);
		local iThresholdSubtractionsGold = pCity:getThresholdSubtractions(yieldGoldID);
		local iThresholdSubtractionsDefense = pCity:getThresholdSubtractions(yieldProductionID);
		local iThresholdSubtractionsScience = pCity:getThresholdSubtractions(yieldScienceID);
		local iThresholdSubtractionsCulture = pCity:getThresholdSubtractions(yieldCultureID);

		iThresholdSubtractionsGold = iThresholdAdditions + (iThresholdSubtractionsGold + (iPuppetMod * -1));
		iThresholdSubtractionsDefense = iThresholdAdditions + (iThresholdSubtractionsDefense + (iPuppetMod * -1));
		iThresholdSubtractionsScience = iThresholdAdditions + (iThresholdSubtractionsScience + (iPuppetMod * -1));
		iThresholdSubtractionsCulture = iThresholdAdditions + (iThresholdSubtractionsCulture + (iPuppetMod * -1));

		local iCultureYield = pCity:GetUnhappinessFromCultureYield() / 100;
		local iDefenseYield = pCity:GetUnhappinessFromDefenseYield() / 100;
		local iGoldYield = pCity:GetUnhappinessFromGoldYield() / 100;
		local iCultureNeeded = pCity:GetUnhappinessFromCultureNeeded() / 100;
		local iDefenseNeeded = pCity:GetUnhappinessFromDefenseNeeded() / 100;
		local iGoldNeeded = pCity:GetUnhappinessFromGoldNeeded() / 100;
		local iScienceYield = pCity:GetUnhappinessFromScienceYield() / 100;
		local iScienceNeeded = pCity:GetUnhappinessFromScienceNeeded() / 100;
		
		local iCultureDeficit = pCity:GetUnhappinessFromCultureDeficit() / 100;
		local iDefenseDeficit = pCity:GetUnhappinessFromDefenseDeficit() / 100;
		local iGoldDeficit = pCity:GetUnhappinessFromGoldDeficit() / 100;
		local iScienceDeficit = pCity:GetUnhappinessFromScienceDeficit() / 100;


		local iTotalHappiness = pCity:GetLocalHappiness();

		strHappinessBreakdown = Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_HAPPINESS", iTotalHappiness);

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_HAPPINESS_EXPLANATION");
		end

		strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_UNHAPPINESS", iTotalUnhappiness);
		
		-- Occupation tooltip
		if (iOccupationUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_OCCUPATION_UNHAPPINESS", iOccupationUnhappiness);
		end
		-- Resistance tooltip
		if (iResistanceUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_RESISTANCE_UNHAPPINESS", iResistanceUnhappiness);
		end
		-- Starving tooltip
		if (iStarvingUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_STARVING_UNHAPPINESS", iStarvingUnhappiness);
		end
		-- Pillaged tooltip
		if (iPillagedUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PILLAGED_UNHAPPINESS", iPillagedUnhappiness);
		end
		-- Gold tooltip
		if (iGoldUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS", iGoldUnhappiness, iGoldYield, iGoldNeeded, iGoldDeficit);
		end
		if ((iGoldYield - iGoldNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS_SURPLUS", (iGoldYield - iGoldNeeded));
		end
		-- Defense tooltip
		if (iDefenseUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS", iDefenseUnhappiness, iDefenseYield, iDefenseNeeded, iDefenseDeficit);
		end
		if ((iDefenseYield - iDefenseNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS_SURPLUS", (iDefenseYield - iDefenseNeeded));
		end
		-- Connection tooltip
		if (iConnectionUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CONNECTION_UNHAPPINESS", iConnectionUnhappiness);
		end
		-- Minority tooltip
		if (iMinorityUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_MINORITY_UNHAPPINESS", iMinorityUnhappiness);
		end
		-- Science tooltip
		if (iScienceUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS", iScienceUnhappiness, iScienceYield, iScienceNeeded, iScienceDeficit);
		end
		if ((iScienceYield - iScienceNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS_SURPLUS", (iScienceYield - iScienceNeeded));
		end
		-- Culture tooltip
		if (iCultureUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS", iCultureUnhappiness, iCultureYield, iCultureNeeded, iCultureDeficit);
		end
		if ((iCultureYield - iCultureNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS_SURPLUS", (iCultureYield - iCultureNeeded));
		end

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_UNHAPPINESS_EXPLANATION");
		end

		strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_GLOBAL_AVERAGE_MODS");

		if (iPuppetMod ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PUPPET_UNHAPPINESS_MOD", iPuppetMod);
		end

		if (iCapitalMod ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CAPITAL_UNHAPPINESS_MOD", iCapitalMod);
		end

		if(pCity:IsRazing()) then
			return strHappinessBreakdown;
		end
		if(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) then
			return strHappinessBreakdown;
		end

		if(iThresholdSubtractionsGold > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_GOLD_POSITIVE", iThresholdSubtractionsGold);
		elseif(iThresholdSubtractionsGold < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_GOLD", iThresholdSubtractionsGold);
		end

		if(iThresholdSubtractionsDefense > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_DEFENSE_POSITIVE", iThresholdSubtractionsDefense);
		elseif(iThresholdSubtractionsDefense < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_DEFENSE", iThresholdSubtractionsDefense);
		end

		if(iThresholdSubtractionsScience > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_SCIENCE_POSITIVE", iThresholdSubtractionsScience);
		elseif(iThresholdSubtractionsScience < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_SCIENCE", iThresholdSubtractionsScience);
		end

		if(iThresholdSubtractionsCulture > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_CULTURE_POSITIVE", iThresholdSubtractionsCulture);
		elseif(iThresholdSubtractionsCulture < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_CULTURE", iThresholdSubtractionsCulture);
		end

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_GLOBAL_AVERAGE_MODS_EXPLANATION");
		end

	end

	return strHappinessBreakdown;
end
-- END

-- Yield Tooltip Helper
function GetYieldTooltipHelper(pCity, iYieldType, strIcon)
	
	local strModifiers = "";
	
	-- Base Yield
	local iBaseYield = pCity:GetBaseYieldRate(iYieldType);

	local iYieldPerPop = pCity:GetYieldPerPopTimes100(iYieldType);
	if (iYieldPerPop ~= 0) then
		iYieldPerPop = iYieldPerPop * pCity:GetPopulation();
		iYieldPerPop = iYieldPerPop / 100;
		
		iBaseYield = iBaseYield + iYieldPerPop;
	end

	-- Total Yield
	local iTotalYield;
	
	-- Food is special
	if (iYieldType == yieldFoodID) then
		iTotalYield = pCity:FoodDifferenceTimes100() / 100;
	else
		iTotalYield = pCity:GetYieldRateTimes100(iYieldType) / 100;
	end
	
	-- Yield modifiers string
	strModifiers = strModifiers .. pCity:GetYieldModifierTooltip(iYieldType);
	
	-- Build tooltip
	local strYieldToolTip = GetYieldTooltip(pCity, iYieldType, iBaseYield, iTotalYield, strIcon, strModifiers);
	
	return strYieldToolTip;

end


------------------------------
-- Helper function to build yield tooltip string
function GetYieldTooltip(pCity, iYieldType, iBase, iTotal, strIconString, strModifiersString)
	local pPlayer = Players[pCity:GetOwner()]
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	
	local strYieldBreakdown = "";
	
	-- Base Yield from terrain
	local iYieldFromTerrain = pCity:GetBaseYieldRateFromTerrain(iYieldType);
	if (iYieldFromTerrain ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_TERRAIN", iYieldFromTerrain, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- JFDLC
	-- Base Yield from Buildings
	local iYieldFromBuildings = pCity:GetBaseYieldRateFromBuildings(iYieldType);
	--JFD Yield from Pillaged Tiles Begins
	local traitType = activePlayer:GetTraitType()
	for row in GameInfo.Trait_YieldChangesFromPillagedTiles("TraitType = '" .. traitType .. "' AND BuildingType IS NOT NULL AND YieldType = '" .. GameInfo.Yields[iYieldType].Type .. "'") do
		local iYieldFromPillagedTiles = pCity:GetNumBuilding(GameInfoTypes[row.BuildingType])
		if iYieldFromPillagedTiles ~= 0 then
			if (row.RequiresUnit and pCity:GetProductionUnit() > -1) then
				strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_PILLAGED_TILES", iYieldFromPillagedTiles, strIconString);
				strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
			elseif (not row.RequiresUnit) then
				strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_PILLAGED_TILES", iYieldFromPillagedTiles, strIconString);
				strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";	
			end
			if (iYieldFromBuildings + iYieldFromPillagedTiles) > 0 then
				iYieldFromBuildings = iYieldFromBuildings - iYieldFromPillagedTiles
			end
		end
	end
	--JFD Yield from Pillaged Tiles Ends
	if (iYieldFromBuildings ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_BUILDINGS", iYieldFromBuildings, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	
	-- Base Yield from Happiness 
	local iYieldFromHappiness = pCity:GetYieldFromHappiness(iYieldType);
	if (iYieldFromHappiness ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_HAPPINESS", iYieldFromHappiness, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	-- Base Yield from Health 
	local iYieldFromHealth = pCity:GetYieldFromHealth(iYieldType);
	if (iYieldFromHealth ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_HEALTH", iYieldFromHealth, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Specialists
	local iYieldFromSpecialists = pCity:GetBaseYieldRateFromSpecialists(iYieldType);
	if (iYieldFromSpecialists ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_SPECIALISTS", iYieldFromSpecialists, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	-- JFDLC
	
	-- Base Yield from Misc
	local iYieldFromMisc = pCity:GetBaseYieldRateFromMisc(iYieldType);
	if (iYieldFromMisc ~= 0) then
		if (iYieldType == yieldScienceID) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_POP", iYieldFromMisc, strIconString);
		else
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_MISC", iYieldFromMisc, strIconString);
		end
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	-- CP Events
	-- Base Yield from Events
	local iYieldFromEvents = pCity:GetEventCityYield(iYieldType);
	if (iYieldFromEvents ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_EVENTS", iYieldFromEvents, strIconString);
	end

	-- Yield Increase from City Yields
	if (iYieldType == yieldScienceID) then
		local iYieldFromYields = pCity:GetScienceFromCityYield(iYieldType);
		if (iYieldFromYields ~= 0) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_CITY_YIELDS", iYieldFromYields, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end
		-- CBP -- Yield Increase from CS Alliance (Germany)
	local iYieldFromCSAlliance = pCity:GetBaseYieldRateFromCSAlliance(iYieldType);
	if (iYieldFromCSAlliance ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_CS_ALLIANCE", iYieldFromCSAlliance, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end

	-- CBP -- Yield Increase from Corporation Franchises
	local iYieldFromCorps = pCity:GetYieldChangeFromCorporationFranchises(iYieldType);
	if (iYieldFromCorps ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_CORPORATIONS", iYieldFromCorps, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end

	-- CBP -- Yield Increase from Piety
	local iYieldFromPiety = pCity:GetReligionYieldRateModifier(iYieldType);
	if (iYieldFromPiety ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_PIETY", iYieldFromPiety, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Pop
	local iYieldPerPop = pCity:GetYieldPerPopTimes100(iYieldType);
	if (iYieldPerPop ~= 0) then
		local iYieldFromPop = iYieldPerPop * pCity:GetPopulation();
		iYieldFromPop = iYieldFromPop / 100;
		
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_POP_EXTRA", iYieldFromPop, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Religion
	local iYieldFromReligion = pCity:GetBaseYieldRateFromReligion(iYieldType);
	if (iYieldFromReligion ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_RELIGION", iYieldFromReligion, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	if (iYieldType == yieldFoodID) then
		local iYieldFromTrade = pCity:GetYieldRate(yieldFoodID, false) - pCity:GetYieldRate(yieldFoodID, true);
		if (iYieldFromTrade ~= 0) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FOOD_FROM_TRADE_ROUTES", iYieldFromTrade);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end

	-- CBP Base Yield From City Connections
	local iYieldFromConnection = pCity:GetYieldChangeTradeRoute(iYieldType);
	if (iYieldFromConnection ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_CONNECTION", iYieldFromConnection, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end

	-- Base Yield from League Art (CSD)
	local iYieldFromLeague = pCity:GetBaseYieldRateFromLeague(iYieldType);
	if (iYieldFromLeague ~= 0) then
		if (iYieldType == yieldScienceID) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_YIELD_FROM_LEAGUE_ART", iYieldFromLeague, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end

-- CBP Yield from Great Works
	if (iYieldType ~= yieldCultureID) then
		local iYieldFromGreatWorks = pCity:GetBaseYieldRateFromGreatWorks(iYieldType);
		if (iYieldFromGreatWorks ~= 0) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_ART_CBP", iYieldFromGreatWorks, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end

	if (iYieldType ~= yieldCultureID) then
		local iYieldFromTraits = pCity:GetYieldPerTurnFromTraits(iYieldType);
		if (iYieldFromTraits ~= 0) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_TRAIT_BONUS", iYieldFromTraits, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end
-- END

	local iYieldFromUnit = pCity:GetYieldFromUnitsInCity(iYieldType);
	if iYieldFromUnit ~= 0 then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_UNIT", iYieldFromUnit, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end

	-- JFD Crime
	if userSettingCIDCrimeCore then
		local crimeID = nil
		for crime in GameInfo.JFD_Crimes("YieldType = '" .. GameInfo.Yields[iYieldType].Type .. "'") do
			crimeID = crime.ID
		end
		local iYieldFromCrime, iYieldModFromCrime, strYieldFromCrime = pPlayer:GetCrimeYields(pCity, crimeID)
		if iYieldFromCrime ~= 0 then
			if iYieldFromCrime > 0 then iYieldFromCrime = "+" .. iYieldFromCrime end
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iYieldFromCrime);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
		--if iYieldModFromCrime ~= 0 then
		--	if iYieldModFromCrime > 0 then iYieldModFromCrime = "+" .. iYieldModFromCrime end
		--	strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey(strYieldFromCrime, iYieldModFromCrime .. "%");
		--	strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		--end
	end
	
	-- WLTKD MOD
	local iYieldFromWLTKD = pCity:GetModFromWLTKD(iYieldType);
	if(iYieldFromWLTKD ~= 0) then
		if iYieldFromWLTKD > 0 then
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_WLTKD", "+" .. iYieldFromWLTKD, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		else
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_WLTKD", iYieldFromWLTKD, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end

	-- Golden Age MOD
	local iYieldFromGA = pCity:GetModFromGoldenAge(iYieldType);
	if(iYieldFromGA ~= 0) then
		if iYieldFromGA > 0 then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_GOLDEN_AGE", "+" .. iYieldFromGA, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		else
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_GOLDEN_AGE", iYieldFromGA, strIconString);
			strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
		end
	end
-- END CBP
	local strExtraBaseString = "";

-- CBP Changes -- made YieldRateTimes100	
	-- Food eaten by pop
	local iYieldEaten = 0;
	if (iYieldType == yieldFoodID) then
		local iFoodYield = (pCity:GetYieldRateTimes100(yieldFoodID, false) / 100);
		iYieldEaten = pCity:FoodConsumption(true, 0);
		if (iYieldEaten ~= 0) then
			--strModifiers = strModifiers .. "[NEWLINE]";
			--strModifiers = strModifiers .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_EATEN_BY_POP", iYieldEaten, "[ICON_FOOD]");
			--strModifiers = strModifiers .. "[NEWLINE]----------------[NEWLINE]";			
			strExtraBaseString = strExtraBaseString .. "   " .. Locale.ConvertTextKey("TXT_KEY_FOOD_USAGE", iFoodYield, iYieldEaten);
			
			local iFoodSurplus = iFoodYield - iYieldEaten;
			iBase = iFoodSurplus;
-- END
			
			--if (iFoodSurplus >= 0) then
				--strModifiers = strModifiers .. Locale.ConvertTextKey("TXT_KEY_YIELD_AFTER_EATEN", iFoodSurplus, "[ICON_FOOD]");
			--else
				--strModifiers = strModifiers .. Locale.ConvertTextKey("TXT_KEY_YIELD_AFTER_EATEN_NEGATIVE", iFoodSurplus, "[ICON_FOOD]");
			--end
		end
	end
	
	local strTotal;
	if (iTotal >= 0) then
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", iTotal, strIconString);
	else
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", iTotal, strIconString);
	end
	
	strYieldBreakdown = strYieldBreakdown .. "----------------";
	
	-- Build combined string
	if (iBase ~= iTotal or strExtraBaseString ~= "") then
		local strBase = Locale.ConvertTextKey("TXT_KEY_YIELD_BASE", iBase, strIconString) .. strExtraBaseString;
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]" .. strBase;
	end
	
	-- Modifiers
	if (strModifiersString ~= "") then
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]----------------" .. strModifiersString .. "[NEWLINE]----------------";
	end
	strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]" .. strTotal;
	
	return strYieldBreakdown;

end


----------------------------------------------------------------        
-- MOOD INFO
----------------------------------------------------------------        
function GetMoodInfo(iOtherPlayer)
	
	local strInfo = "";
	
	-- Always war!
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_WAR)) then
		return "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_ALWAYS_WAR_TT");
	end
	
	local iActivePlayer = Game.GetActivePlayer();
	local pActivePlayer = Players[iActivePlayer];
	local pActiveTeam = Teams[pActivePlayer:GetTeam()];
	local pOtherPlayer = Players[iOtherPlayer];
	local iOtherTeam = pOtherPlayer:GetTeam();
	local pOtherTeam = Teams[iOtherTeam];
	
	--local iVisibleApproach = Players[iActivePlayer]:GetApproachTowardsUsGuess(iOtherPlayer);
	
	-- At war right now
	--[[if (pActiveTeam:IsAtWar(iOtherTeam)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_AT_WAR") .. "[NEWLINE]";
		
	-- Not at war right now
	else
		
		-- We've fought before
		if (pActivePlayer:GetNumWarsFought(iOtherPlayer) > 0) then
			-- They don't appear to be mad
			if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY or 
				iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_NEUTRAL) then
				strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAST_WAR_NEUTRAL") .. "[NEWLINE]";
			-- They aren't happy with us
			else
				strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAST_WAR_BAD") .. "[NEWLINE]";
			end
		end
	end]]--
		
	-- Neutral things
	--[[if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_AFRAID") .. "[NEWLINE]";
	end]]--
		
	-- Good things
	--[[if (pOtherPlayer:WasResurrectedBy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_RESURRECTED") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:IsDoF(iOtherPlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DOF") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:IsPlayerDoFwithAnyFriend(iOtherPlayer)) then		-- Human has a mutual friend with the AI
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MUTUAL_DOF") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:IsPlayerDenouncedEnemy(iOtherPlayer)) then		-- Human has denounced an enemy of the AI
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MUTUAL_ENEMY") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNumCiviliansReturnedToMe(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CIVILIANS_RETURNED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherTeam:HasEmbassyAtTeam(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HAS_EMBASSY") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNumTimesIntrigueSharedBy(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_SHARED_INTRIGUE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerForgivenForSpying(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_FORGAVE_FOR_SPYING") .. "[NEWLINE]";
	end]]--
	
	-- Bad things
	--[[if (pOtherPlayer:IsFriendDeclaredWarOnUs(iActivePlayer)) then		-- Human was a friend and declared war on us
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_FRIEND_DECLARED_WAR") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsFriendDenouncedUs(iActivePlayer)) then			-- Human was a friend and denounced us
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_FRIEND_DENOUNCED") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:GetWeDeclaredWarOnFriendCount() > 0) then		-- Human declared war on friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DECLARED_WAR_ON_FRIENDS") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:GetWeDenouncedFriendCount() > 0) then			-- Human has denounced his friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIENDS") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:GetNumFriendsDenouncedBy() > 0) then			-- Human has been denounced by friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_BY_FRIENDS") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:IsDenouncedPlayer(iOtherPlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DENOUNCED_BY_US") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsDenouncedPlayer(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DENOUNCED_BY_THEM") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerDoFwithAnyEnemy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DOF_WITH_ENEMY") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerDenouncedFriend(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIEND") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerNoSettleRequestEverAsked(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NO_SETTLE_ASKED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerStopSpyingRequestEverAsked(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_STOP_SPYING_ASKED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsDemandEverMade(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_TRADE_DEMAND") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNumTimesRobbedBy(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CAUGHT_STEALING") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNumTimesCultureBombed(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CULTURE_BOMB") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNegativeReligiousConversionPoints(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_RELIGIOUS_CONVERSIONS") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:HasOthersReligionInMostCities(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ADOPTING_MY_RELIGION") .. "[NEWLINE]";
	end]]--
	--[[if (pActivePlayer:HasOthersReligionInMostCities(iOtherPlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ADOPTING_HIS_RELIGION") .. "[NEWLINE]";
	end]]--
	--[[local myLateGamePolicies = pActivePlayer:GetLateGamePolicyTree();
	local otherLateGamePolicies = pOtherPlayer:GetLateGamePolicyTree();
	if (myLateGamePolicies ~= PolicyBranchTypes.NO_POLICY_BRANCH_TYPE and otherLateGamePolicies ~= PolicyBranchTypes.NO_POLICY_BRANCH_TYPE) then
	    local myPoliciesStr = Locale.ConvertTextKey(GameInfo.PolicyBranchTypes[myLateGamePolicies].Description);
	    print (myPoliciesStr);
		if (myLateGamePolicies == otherLateGamePolicies) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_SAME_LATE_POLICY_TREES", myPoliciesStr) .. "[NEWLINE]";
		else
			local otherPoliciesStr = Locale.ConvertTextKey(GameInfo.PolicyBranchTypes[otherLateGamePolicies].Description);
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DIFFERENT_LATE_POLICY_TREES", myPoliciesStr, otherPoliciesStr) .. "[NEWLINE]";
		end
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenMilitaryPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MILITARY_PROMISE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredMilitaryPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MILITARY_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenExpansionPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_EXPANSION_PROMISE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredExpansionPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_EXPANSION_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenBorderPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BORDER_PROMISE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredBorderPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BORDER_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenAttackCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CITY_STATE_PROMISE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredAttackCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CITY_STATE_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenBullyCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_BROKEN") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredBullyCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenSpyPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_SPY_PROMISE_BROKEN") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredSpyPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_SPY_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenNoConvertPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NO_CONVERT_PROMISE_BROKEN") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerIgnoredNoConvertPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NO_CONVERT_PROMISE_IGNORED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerBrokenCoopWarPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_COOP_WAR_PROMISE") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsPlayerRecklessExpander(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_RECKLESS_EXPANDER") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetNumRequestsRefused(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_REFUSED_REQUESTS") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:GetRecentTradeValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_TRADE_PARTNER") .. "[NEWLINE]";	
	end]]--
	--[[if (pOtherPlayer:GetCommonFoeValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_COMMON_FOE") .. "[NEWLINE]";	
	end]]--
	--[[if (pOtherPlayer:GetRecentAssistValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ASSISTANCE_TO_THEM") .. "[NEWLINE]";	
	end	]]--
	--[[if (pOtherPlayer:IsLiberatedCapital(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LIBERATED_CAPITAL") .. "[NEWLINE]";	
	end]]--
	--[[if (pOtherPlayer:IsLiberatedCity(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LIBERATED_CITY") .. "[NEWLINE]";	
	end	]]--
	--[[if (pOtherPlayer:IsGaveAssistanceTo(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ASSISTANCE_FROM_THEM") .. "[NEWLINE]";	
	end	]]--	
	--[[if (pOtherPlayer:IsHasPaidTributeTo(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAID_TRIBUTE") .. "[NEWLINE]";	
	end	]]--
	--[[if (pOtherPlayer:IsNukedBy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NUKED") .. "[NEWLINE]";	
	end]]--	
	--[[if (pOtherPlayer:IsCapitalCapturedBy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CAPTURED_CAPITAL") .. "[NEWLINE]";	
	end	]]--

	-- Protected Minors
	--[[if (pOtherPlayer:IsAngryAboutProtectedMinorKilled(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PROTECTED_MINORS_KILLED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsAngryAboutProtectedMinorAttacked(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PROTECTED_MINORS_ATTACKED") .. "[NEWLINE]";
	end]]--
	--[[if (pOtherPlayer:IsAngryAboutProtectedMinorBullied(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PROTECTED_MINORS_BULLIED") .. "[NEWLINE]";
	end]]--
	
	-- Bullied Minors
	--[[if (pOtherPlayer:IsAngryAboutSidedWithTheirProtectedMinor(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_SIDED_WITH_MINOR") .. "[NEWLINE]";
	end]]--
	
	--local iActualApproach = pOtherPlayer:GetMajorCivApproach(iActivePlayer)
	
	-- MOVED TO LUAPLAYER
	--[[
	-- Bad things we don't want visible if someone is friendly (acting or truthfully)
	if (iVisibleApproach ~= MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY) then-- and
		--iActualApproach ~= MajorCivApproachTypes.MAJOR_CIV_APPROACH_DECEPTIVE) then
		if (pOtherPlayer:GetLandDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LAND_DISPUTE") .. "[NEWLINE]";
		end
		--if (pOtherPlayer:GetVictoryDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			--strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_VICTORY_DISPUTE") .. "[NEWLINE]";
		--end
		if (pOtherPlayer:GetWonderDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_WONDER_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetMinorCivDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MINOR_CIV_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetWarmongerThreat(iActivePlayer) > ThreatTypes.THREAT_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_WARMONGER_THREAT") .. "[NEWLINE]";
		end
	end
	]]--
	
	local aOpinion = pOtherPlayer:GetOpinionTable(iActivePlayer);
	--local aOpinionList = {};
	for i,v in ipairs(aOpinion) do
		--aOpinionList[i] = "[ICON_BULLET]" .. v .. "[NEWLINE]";
		strInfo = strInfo .. "[ICON_BULLET]" .. v .. "[NEWLINE]";
	end
	--strInfo = table.cat(aOpinionList, "[NEWLINE]");

	--  No specific events - let's see what string we should use
	if (strInfo == "") then
		
		-- Appears Friendly
		if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_FRIENDLY");
		-- Appears Guarded
		elseif (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_GUARDED");
		-- Appears Hostile
		elseif (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HOSTILE");
		-- Neutral - default string
		else
			strInfo = "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DEFAULT_STATUS");
		end
	end
	
	-- Remove extra newline off the end if we have one
	if (Locale.EndsWith(strInfo, "[NEWLINE]")) then
		local iNewLength = Locale.Length(strInfo)-9;
		strInfo = Locale.Substring(strInfo, 1, iNewLength);
	end
	
	return strInfo;
	
end
------------------------------
-- Helper function to build religion tooltip string
function GetReligionTooltip(city)

	local religionToolTip = "";
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		return religionToolTip;
	end

	local bFoundAFollower = false;
	local eReligion = city:GetReligiousMajority();
	local bFirst = true;
	
	if (eReligion >= 0) then
		bFoundAFollower = true;
		local religion = GameInfo.Religions[eReligion];
		local strReligion = Locale.ConvertTextKey(Game.GetReligionName(eReligion));
	    local strIcon = religion.IconString;
		local strPressure = "";
			
		if (city:IsHolyCityForReligion(eReligion)) then
			if (not bFirst) then
				religionToolTip = religionToolTip .. "[NEWLINE]";
			else
				bFirst = false;
			end
			religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_HOLY_CITY_TOOLTIP_LINE", strIcon, strReligion);			
		end

		local iPressure;
		local iNumTradeRoutesAddingPressure;
		iPressure, iNumTradeRoutesAddingPressure = city:GetPressurePerTurn(eReligion);
		if (iPressure > 0) then
			strPressure = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_PRESSURE_STRING", math.floor(iPressure/GameDefines["RELIGION_MISSIONARY_PRESSURE_MULTIPLIER"]));
		end
		
		local iFollowers = city:GetNumFollowers(eReligion)			
		if (not bFirst) then
			religionToolTip = religionToolTip .. "[NEWLINE]";
		else
			bFirst = false;
		end
		
		--local iNumTradeRoutesAddingPressure = city:GetNumTradeRoutesAddingPressure(eReligion);
		if (iNumTradeRoutesAddingPressure > 0) then
			religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_RELIGION_TOOLTIP_LINE_WITH_TRADE", strIcon, iFollowers, strPressure, iNumTradeRoutesAddingPressure);
		else
			religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_RELIGION_TOOLTIP_LINE", strIcon, iFollowers, strPressure);
		end
	end	
		
	local iReligionID;
	for pReligion in GameInfo.Religions() do
		iReligionID = pReligion.ID;
		
		if (iReligionID >= 0 and iReligionID ~= eReligion and city:GetNumFollowers(iReligionID) > 0) then
			bFoundAFollower = true;
			local religion = GameInfo.Religions[iReligionID];
			local strReligion = Locale.ConvertTextKey(Game.GetReligionName(iReligionID));
			local strIcon = religion.IconString;
			local strPressure = "";

			if (city:IsHolyCityForReligion(iReligionID)) then
				if (not bFirst) then
					religionToolTip = religionToolTip .. "[NEWLINE]";
				else
					bFirst = false;
				end
				religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_HOLY_CITY_TOOLTIP_LINE", strIcon, strReligion);			
			end
				
			local iPressure = city:GetPressurePerTurn(iReligionID);
			if (iPressure > 0) then
				strPressure = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_PRESSURE_STRING", math.floor(iPressure/GameDefines["RELIGION_MISSIONARY_PRESSURE_MULTIPLIER"]));
			end
			
			local iFollowers = city:GetNumFollowers(iReligionID)			
			if (not bFirst) then
				religionToolTip = religionToolTip .. "[NEWLINE]";
			else
				bFirst = false;
			end
			
			local iNumTradeRoutesAddingPressure = city:GetNumTradeRoutesAddingPressure(iReligionID);
			if (iNumTradeRoutesAddingPressure > 0) then
				religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_RELIGION_TOOLTIP_LINE_WITH_TRADE", strIcon, iFollowers, strPressure, iNumTradeRoutesAddingPressure);
			else
				religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_RELIGION_TOOLTIP_LINE", strIcon, iFollowers, strPressure);
			end
		end
	end
	
	if (not bFoundAFollower) then
		religionToolTip = religionToolTip .. Locale.ConvertTextKey("TXT_KEY_RELIGION_NO_FOLLOWERS");
	end
		
	return religionToolTip;
end