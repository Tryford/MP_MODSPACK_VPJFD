-- JFD_SD_IdealsUtils
-- Author: JFD
-- DateCreated: 7/8/2016 10:37:33 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local mathMin		 = math.min
------------------------------------------------------------------------------------------------------------------------
-- IDEALS
------------------------------------------------------------------------------------------------------------------------
--Player:GetCultureIdealTag
function Player.GetCultureIdealTag(player)
	local cultureID = player:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local ideasTag = culture.IdealsTag
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND IdealsTag IS NOT NULL") do
		if row.IdealsTag then ideasTag = row.IdealsTag end
	end
	return ideasTag
end

--Player:HasIdeal
function Player.HasIdeal(player, idealID)
	return player:HasPolicy(GameInfoTypes[GameInfo.JFD_Ideals[idealID].PolicyType])
end

--Player:GetNumIdeals
function Player.GetNumIdeals(player)
	local numIdeals = 0
	for ideal in GameInfo.JFD_Ideals("IdealTag = '" .. player:GetCultureIdealTag() .. "'") do
		if player:HasIdeal(ideal.ID) then
			numIdeals = numIdeals + 1
		end
	end
	return numIdeals
end

--Player:CanAdoptIdeal
local domainSeaID	  = GameInfoTypes["DOMAIN_SEA"]
local plotHillsID	  = GameInfoTypes["PLOT_HILLS"]
local plotMountainID  = GameInfoTypes["PLOT_MOUNTAIN"]
function Player.CanAdoptIdeal(player, idealID)
	local playerID = player:GetID()
	local team = Teams[player:GetTeam()]
	local teamTech = team:GetTeamTechs()
	local capital = player:GetCapitalCity()
	local stateReligionID = player:GetStateReligion()
	local numCities = player:GetNumCities()
	local numConqueredCities = player:GetNumConqueredCities()
	local cultureCost = player:GetNextPolicyCost()
	local ideal = GameInfo.JFD_Ideals[idealID]
	local idealType = ideal.Type
	local maxValidEraID = GameInfoTypes[ideal.MaxValidEra] or -1
	local canAdoptIdeal = true
	local isNotValid = false
	local cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq)
	if player:GetCurrentEra() > maxValidEraID then return false, true, cultureIdealHelp end
	--Buildings
	local countBuildings = 0
	for row in GameInfo.JFD_Ideals_BuildingRequirements("IdealType = '" .. idealType .. "' AND CheckAllCities = 0") do
		local buildingClass1ID	  = GameInfoTypes[row.BuildingClassType1]
		local buildingClass1Count = player:GetBuildingClassCount(buildingClass1ID) or 0
		local buildingClass2ID	  = GameInfoTypes[row.BuildingClassType2]
		local buildingClass2Count = player:GetBuildingClassCount(buildingClass2ID) or 0
		local buildingClass3ID	  = GameInfoTypes[row.BuildingClassType3]
		local buildingClass3Count = player:GetBuildingClassCount(buildingClass3ID) or 0
		if row.RequiresOR then
			if buildingClass1ID then countBuildings = countBuildings + buildingClass1Count end
			if buildingClass2ID then countBuildings = countBuildings + buildingClass2Count end
			if buildingClass3ID then countBuildings = countBuildings + buildingClass3Count end
			if countBuildings < row.RequiresNum then canAdoptIdeal = false end
			if (row.RequiresAllCities and countBuildings < numCities) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countBuildings)
		else
			if (buildingClass1ID and (buildingClass1Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (buildingClass2ID and (buildingClass2Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (buildingClass3ID and (buildingClass3Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and buildingClass1ID and (buildingClass1Count < numCities)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and buildingClass2ID and (buildingClass2Count < numCities)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and buildingClass3ID and (buildingClass3Count < numCities)) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, buildingClass1Count, buildingClass2Count, buildingClass3Count)
		end
	end
	for row in GameInfo.JFD_Ideals_BuildingRequirements("IdealType = '" .. idealType .. "' AND CheckAllCities = 1") do
		local buildingID = GameInfoTypes[row.BuildingType]
		local buildingClassID = GameInfoTypes[row.BuildingClassType1]
		for city in player:Cities() do
			if (buildingID and city:HasBuilding(buildingID)) then
				countBuildings = countBuildings + 1
			end
			if (buildingClassID and city:HasBuildingClass(buildingClassID)) then
				if (row.RequiresConqueredCity and city:GetOriginalOwner() ~= playerID) then
					countBuildings = countBuildings + 1
				end
				if (row.RequiresHillsOrMountain and (city:IsOnPlotType(plotHillsID) or city:IsOnPlotType(plotMountainID))) then
					countBuildings = countBuildings + 1
				end
				local terrainType = row.RequiresTerrainType
				if (terrainType and (city:IsOnTerrain(GameInfoTypes[terrainType]) or city:IsAdjacentToTerrain(GameInfoTypes[terrainType]))) then
					countBuildings = countBuildings + 1	
				end
			end
		end
		if countBuildings < row.RequiresNum then canAdoptIdeal = false end
		if (row.RequiresAllCities and countBuildings < numCities) then canAdoptIdeal = false end
		if (row.RequiresAllConqueredCities and countBuildings < numConqueredCities) then canAdoptIdeal = false end
		cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countBuildings)
	end
	--Cities
	local countCities = 0
	for row in GameInfo.JFD_Ideals_CityRequirements("IdealType = '" .. idealType .. "'") do
		local requiresNumSpecialists = row.RequiresNumSpecialists
		for city in player:Cities() do
			if (row.RequiresCoastalCities and (not row.RequiresHighestNumCoastalCities)) then
				if city:IsCoastal() then
					countCities = countCities + 1
				end
			end
			if (row.RequiresColonies and (not row.RequiresHighestNumColonies)) then
				if city:IsColony() then
					countCities = countCities + 1
				end
			end
			if row.RequiresConnections then
				if city:IsConnectedToCapital() then
					countCities = countCities + 1
				end	
			end
			if row.RequiresConquests then
				if city:GetOriginalOwner() ~= playerID then
					countCities = countCities + 1
				end
			end
			if row.RequiresFeatureType then
				if row.RequiresAdjacent then
					if city:IsAdjacentToFeature(GameInfoTypes[row.RequiresFeatureType]) then
						countCities = countCities + 1
					end
				else
					if city:HasFeature(GameInfoTypes[row.RequiresFeatureType]) then
						countCities = countCities + 1
					end
				end
			end
			if row.RequiresHillRoadConnections then
				if ((city:IsOnPlotType(plotHillsID) or city:IsAdjacentToPlotType(plotMountainID)) and isCityConnected(player, capital, city, 'Road', false, false, nil)) then
					countCities = countCities + 1
				end
			end
			if row.RequiresLoyaltyType then
				if city:HasLoyaltyState(GameInfoTypes[row.RequiresLoyaltyType]) then
					countCities = countCities + 1
				end
			end
			if row.RequiresMountainHolyCity then
				if (city:IsHolyCityAnyReligion() and city:HasPlotType(plotMountainID)) then
					countCities = countCities + 1
				end
			end
			if row.RequiresPantheon then
				if (not player:HasCreatedPantheon()) then canAdoptIdeal = false end
			end
			if row.RequiresPlotType then
				if row.RequiresAdjacent then
					if city:IsAdjacentToPlotType(GameInfoTypes[row.RequiresPlotType]) then
						countCities = countCities + 1
					end
				else
					if city:HasPlot(GameInfoTypes[row.RequiresPlotType]) then
						countCities = countCities + 1
					end
				end
			end
			if row.RequiresPuppets then
				if (city:IsPuppet() and city:GetOriginalOwner() ~= playerID) then
					countCities = countCities + 1
				end
			end
			if row.RequiresPuppetCapitals then
				if (city:IsPuppet() and city:IsOriginalCapital()) then
					countCities = countCities + 1
				end
			end
			if row.RequiresStateReligion then
				if (stateReligionID > 0 and city:GetReligiousMajority() == stateReligionID) then
					countCities = countCities + 1
				end
			end
			if row.RequiresTerrainType then
				if row.RequiresAdjacent then
					if city:IsAdjacentToTerrain(GameInfoTypes[row.RequiresTerrainType]) then
						countCities = countCities + 1
					end
				else
					if city:IsOnTerrain(GameInfoTypes[row.RequiresTerrainType]) then
						countCities = countCities + 1
					end
				end
			end
			if row.RequiresWLTKD then
				if city:GetWeLoveTheKingDayCounter() > 0 then
					countCities = countCities + 1
				end
			end	
			if requiresNumSpecialists > 0 then
				if city:GetTotalSpecialistCount() >= requiresNumSpecialists then
					countCities = countCities + 1
				end
			end
		end
		cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countCities)
		if row.RequiresHighestNumCoastalCities then
			local hasHighestNumCoastCities, highestNumCoastCities, highestNumCoastCitiesPlayerID, playerNumCoastCities = player:HasMostCities(true)
			local otherPlayer = Players[highestNumCoastCitiesPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumCoastCitiesPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			countCities = playerNumCoastCities
			if (not hasHighestNumCoastCities) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumCoastCities, otherPlayerDesc, highestNumCoastCities)
		end
		if row.RequiresHighestNumColonies then
			local hasHighestNumColonies, highestNumColonies, highestNumColoniesPlayerID, playerNumColonies = player:HasMostCities(false, true)
			local otherPlayer = Players[highestNumColoniesPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumColoniesPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			countCities = playerNumColonies
			if (not hasHighestNumColonies) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumColonies, otherPlayerDesc, highestNumColonies)
		end
		if countCities < row.RequiresNum then canAdoptIdeal = false end
		if (row.RequiresAllCities and countCities < numCities) then canAdoptIdeal = false end
	end
	--Features
	local countFeatures = 0
	for row in GameInfo.JFD_Ideals_FeatureRequirements("IdealType = '" .. idealType .. "'") do
		local feature1ID = GameInfoTypes[row.FeatureType1]
		local feature1Count = 0
		local feature2ID = GameInfoTypes[row.FeatureType2]
		local feature2Count = 0
		local feature3ID = GameInfoTypes[row.FeatureType3]
		local feature3Count = 0
		if (player:HasNaturalWonder(feature1ID) and row.BypassOtherReqs) then return true, false end
		if (not row.BypassOtherReqs) then
			if (not row.IsCapital) then
				for city in player:Cities() do
					feature1Count = feature1Count + city:CountNumWorkedFeature(feature1ID)
					feature2Count = feature2Count + city:CountNumWorkedFeature(feature2ID)
					feature3Count = feature3Count + city:CountNumWorkedFeature(feature3ID)
				end
			else
				local capital = player:GetCapitalCity()
				if capital:HasFeature(feature1ID) then
					feature1Count = feature1Count + capital:CountNumWorkedFeature(feature1ID)
				end
				if capital:HasFeature(feature2ID) then
					feature2Count = feature2Count + capital:CountNumWorkedFeature(feature2ID)
				end
				if capital:HasFeature(feature3ID) then
					feature3Count = feature3Count + capital:CountNumWorkedFeature(feature3ID)
				end
			end
			if row.RequiresOR then
				if feature1ID then countFeatures = countFeatures + feature1Count end
				if feature2ID then countFeatures = countFeatures + feature2Count end
				if feature3ID then countFeatures = countFeatures + feature3Count end
				if countFeatures < row.RequiresNum then canAdoptIdeal = false end
				if (row.RequiresAllCities and countFeatures < numCities) then canAdoptIdeal = false end
				cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countFeatures)
				if countFeatures < row.RequiresNum then canAdoptIdeal = false end
			else
				if (feature1ID and (feature1Count < row.RequiresNum)) then canAdoptIdeal = false end
				if (feature2ID and (feature2Count < row.RequiresNum)) then canAdoptIdeal = false end
				if (feature3ID and (feature3Count < row.RequiresNum)) then canAdoptIdeal = false end
				if (row.RequiresAllCities and feature1ID and (feature1Count < row.RequiresNum)) then canAdoptIdeal = false end
				if (row.RequiresAllCities and feature2ID and (feature2Count < row.RequiresNum)) then canAdoptIdeal = false end
				if (row.RequiresAllCities and feature3ID and (feature3Count < row.RequiresNum)) then canAdoptIdeal = false end
				cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, feature1Count, feature2Count, feature3Count)
			end
		end
	end
	--Globals
	local countGlobal = 0
	for row in GameInfo.JFD_Ideals_GlobalRequirements("IdealType = '" .. idealType .. "'") do
		if row.RequiresAllies then
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:IsAllies(playerID)) then
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresFollowers then
			local religionID = player:GetReligionCreatedByPlayer()
			if religionID >= 0 then
				countGlobal = countGlobal + player:GetNumTotalFollowers(religionID)
			end
		end
		if row.RequiresWorldFollowers then
			local religionID = player:GetReligionCreatedByPlayer()
			if religionID >= 0 then
				countGlobal = countGlobal + Game.GetNumTotalFollowers(religionID)
			end
		end
		if row.RequiresGoldenAge then
			if (not player:IsGoldenAge()) then canAdoptIdeal = false end
		end
		if row.RequiresGovernment then
			if (not player:HasGovernment()) then canAdoptIdeal = false end
		end
		if row.RequiresMercContracts then
			countGlobal = countGlobal + player:GetNumActivePlayerContracts()
		end
		if row.RequiresMaxSovereignty then
			if player:GetSovereignty() < player:GetMaxSovereignty() then canAdoptIdeal = false end
		end
		if row.RequiresNationalWonders then
			countGlobal = countGlobal + player:GetNumNationalWonders()
		end
		if row.RequiresNaturalWonders then
			for feature in GameInfo.Features("NaturalWonder = 1") do
				if player:HasNaturalWonder(feature.ID) then
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresPantheon then
			if (not player:HasCreatedPantheon()) then canAdoptIdeal = false end
		end
		if row.RequiresPopulation then
			if row.RequiresCapital then
				countGlobal = countGlobal + capital:GetPopulation()	
			else
				countGlobal = countGlobal + player:GetTotalPopulation()
			end
		end
		if row.RequiresPopulationConquered then
			for city in player:Cities() do
				if city:GetOriginalOwner() ~= playerID then
					countGlobal = countGlobal + city:GetPopulation()
				end
			end	
		end
		if row.RequiresReligion then
			if player:GetReligionCreatedByPlayer() <= 0 then canAdoptIdeal = false end
		end
		if row.RequiresSocialPolicies then
			countGlobal = countGlobal + player:GetNumPolicies()
		end
		if row.RequiresSocialPolicyBranchesUnlocked then
			countGlobal = countGlobal + player:GetNumPolicyBranchesUnlocked()
		end
		if row.RequiresSocialPolicyBranchesFinished then
			countGlobal = countGlobal + player:GetNumPolicyBranchesFinished()
		end
		if row.RequiresStateReligion then
			if (not player:HasStateReligion()) then canAdoptIdeal = false end
		end
		if row.RequiresStateReligionOther then
			if (not player:HasStateReligion()) then canAdoptIdeal = false end
			if player:GetStateReligion() <= 0 then canAdoptIdeal = false end
			if player:GetStateReligion() == player:GetReligionCreatedByPlayer() then canAdoptIdeal = false end
		end
		if row.RequiresTechnologies then
			countGlobal = countGlobal + teamTech:GetNumTechsKnown()
		end
		if row.RequiresTechType then
			if (not player:HasTech(GameInfoTypes[row.RequiresTechType])) then canAdoptIdeal = false end
		end
		if row.RequiresTiles then
			countGlobal = countGlobal + player:GetNumPlots()
		end
		if row.RequiresTilesDiscovered then
			for plotID = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(plotID)
				if (plot and plot:IsPlotOcean() and plot:IsVisible(team:GetID())) then
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresTradeRoutes then
			countGlobal = countGlobal + #player:GetTradeRoutes()
		end
		if row.RequiresTradeRoutesDiffCiv then
			local playerTradeRoutes = player:GetTradeRoutes()
			local playerTradeRouteID = -1
			for _,tradeRoute in ipairs(playerTradeRoutes) do
				if tradeRoute.ToID ~= playerTradeRouteID then
					playerTradeRouteID = tradeRoute.ToID
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresTradeRoutesInternal then
			local playerTradeRoutes = player:GetTradeRoutes()
			for _,tradeRoute in ipairs(playerTradeRoutes) do
				if tradeRoute.ToID == tradeRoute.FromID then
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresTradeRoutesExternal then
			local playerTradeRoutes = player:GetTradeRoutes()
			for _,tradeRoute in ipairs(playerTradeRoutes) do
				if tradeRoute.ToID ~= tradeRoute.FromID then
					countGlobal = countGlobal + 1
				end
			end
		end
		if row.RequiresTradeRoutesDomain then
			local playerTradeRoutes = player:GetTradeRoutes()
			for _,tradeRoute in ipairs(playerTradeRoutes) do
				if tradeRoute.Domain == GameInfoTypes[row.RequiresTradeRoutesDomain] then
					countGlobal = countGlobal + 1
				end
			end
		end
		local pietyLevelID = GameInfoTypes[row.RequiresPietyLevel]
		if pietyLevelID then
			if player:GetPietyLevel() < pietyLevelID then canAdoptIdeal = false end
		end
		if row.RequiresWars then
			countGlobal = countGlobal + team:GetAtWarCount(true)
		end
		if row.RequiresWonders then
			if row.RequiresCapital then
				countGlobal = countGlobal + capital:GetNumWorldWonders() + capital:GetNumNationalWonders()	
			else
				countGlobal = countGlobal + player:GetNumWorldWonders() + player:GetNumNationalWonders()	
			end
		end
		if row.RequiresNationalWonders then
			if row.RequiresCapital then
				countGlobal = countGlobal + capital:GetNumNationalWonders()	
			else
				countGlobal = countGlobal + player:GetNumNationalWonders()	
			end
		end
		if row.RequiresWorldWonders then
			if row.RequiresCapital then
				countGlobal = countGlobal + capital:GetNumWorldWonders()	
			else
				countGlobal = countGlobal + player:GetNumWorldWonders()	
			end
		end
		if countGlobal < row.RequiresNum then canAdoptIdeal = false end
		cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countGlobal)
		if (row.RequiresFollowers and row.RequiresHighestNum) then
			local hasHighestFollowers, highestFollowers, highestFollowersPlayerID, playerFollowers = player:HasMostFollowers()
			local otherPlayer = Players[highestFollowersPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestFollowersPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestFollowers) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerFollowers, otherPlayerDesc, highestFollowers)
		end
		if (row.RequiresWorldFollowers and row.RequiresHighestNum) then
			local hasHighestFollowers, highestFollowers, highestFollowersPlayerID, playerFollowers = player:HasMostFollowers(true)
			local otherPlayer = Players[highestFollowersPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestFollowersPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestFollowers) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerFollowers, otherPlayerDesc, highestFollowers)
		end
		if (row.RequiresPopulation and row.RequiresHighestNum) then
			local hasHighestPopulation, highestPopulation, highestPopulationPlayerID, playerPopulation = player:HasMostPopulation(row.RequiresCapital)
			local otherPlayer = Players[highestPopulationPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestPopulationPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestPopulation) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerPopulation, otherPlayerDesc, highestPopulation)
		end
		if (row.RequiresTiles and row.RequiresHighestNum) then
			local hasHighestTiles, highestTiles, highestTilesPlayerID, playerTiles = player:HasMostTiles()
			local otherPlayer = Players[highestTilesPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestTilesPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestTiles) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerTiles, otherPlayerDesc, highestTiles)
		end
	end
	--Great Works
	local countGreatWorks = 0
	for row in GameInfo.JFD_Ideals_GreatWorkRequirements("IdealType = '" .. idealType .. "'") do
		if (not row.RequiresGreatWorksType) then
			countGreatWorks = player:GetNumGreatWorks()
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countGreatWorks)
		else
			countGreatWorks = #player:GetGreatWorks(GameInfoTypes[row.RequiresGreatWorksType])
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countGreatWorks)
			if row.RequiresHighestNum then
				local hasHighestNumGreatWorks, highestNumGreatWorks, highestNumGreatWorksPlayerID, playerNumGreatWorks = player:HasMostGreatWorks(countGreatWorks, GameInfoTypes[row.RequiresGreatWorksType])
				local otherPlayer = Players[highestNumGreatWorksPlayerID]
				local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
				local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
				if playerID == highestNumGreatWorksPlayerID then
					otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
				elseif otherPlayerTeam:IsHasMet(playerTeamID) then
					otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
				end
				countGreatWorks = playerNumGreatWorks
				if (not hasHighestNumGreatWorks) then canAdoptIdeal = false end
				cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumGreatWorks, otherPlayerDesc, highestNumGreatWorks)
			end
		end
		if countGreatWorks < row.RequiresNum then canAdoptIdeal = false end
	end
	--Improvements
	local countImprovements = 0
	for row in GameInfo.JFD_Ideals_ImprovementRequirements("IdealType = '" .. idealType .. "'") do
		local improvement1ID = GameInfoTypes[row.ImprovementType1]
		local improvement1Count = 0
		local improvement2ID = GameInfoTypes[row.ImprovementType2]
		local improvement2Count = 0
		local improvement3ID = GameInfoTypes[row.ImprovementType3]
		local improvement3Count = 0
		local improvement4ID = GameInfoTypes[row.ImprovementType4]
		local improvement4Count = 0
		local improvement5ID = GameInfoTypes[row.ImprovementType5]
		local improvement5Count = 0
		local improvement6ID = GameInfoTypes[row.ImprovementType6]
		local improvement6Count = 0
		if (not row.IsCapital) then
			for city in player:Cities() do
				improvement1Count = improvement1Count + city:CountNumWorkedImprovement(improvement1ID)
				improvement2Count = improvement2Count + city:CountNumWorkedImprovement(improvement2ID)
				improvement3Count = improvement3Count + city:CountNumWorkedImprovement(improvement3ID)
				improvement4Count = improvement4Count + city:CountNumWorkedImprovement(improvement4ID)
				improvement5Count = improvement5Count + city:CountNumWorkedImprovement(improvement5ID)
				improvement6Count = improvement6Count + city:CountNumWorkedImprovement(improvement6ID)
			end
		else
			local capital = player:GetCapitalCity()
			if capital:HasImprovement(improvement1ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement1ID)
			end
			if capital:HasImprovement(improvement2ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement2ID)
			end
			if capital:HasImprovement(improvement3ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement3ID)
			end
			if capital:HasImprovement(improvement4ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement4ID)
			end
			if capital:HasImprovement(improvement5ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement5ID)
			end
			if capital:HasImprovement(improvement6ID) then
				countImprovements = countImprovements + capital:CountNumWorkedImprovement(improvement6ID)
			end
		end
		if row.RequiresOR then
			if improvement1ID then countImprovements = countImprovements + improvement1Count end
			if improvement2ID then countImprovements = countImprovements + improvement2Count end
			if improvement3ID then countImprovements = countImprovements + improvement3Count end
			if improvement4ID then countImprovements = countImprovements + improvement4Count end
			if improvement5ID then countImprovements = countImprovements + improvement5Count end
			if improvement6ID then countImprovements = countImprovements + improvement6Count end
			if countImprovements < row.RequiresNum then canAdoptIdeal = false end
			if (row.RequiresAllCities and countImprovements < numCities) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countImprovements)
		else
			if (improvement1ID and (improvement1Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (improvement2ID and (improvement2Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (improvement3ID and (improvement3Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (improvement4ID and (improvement4Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (improvement5ID and (improvement5Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (improvement6ID and (improvement6Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement1ID and (improvement1Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement2ID and (improvement2Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement3ID and (improvement3Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement4ID and (improvement4Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement5ID and (improvement5Count < row.RequiresNum)) then canAdoptIdeal = false end
			if (row.RequiresAllCities and improvement6ID and (improvement6Count < row.RequiresNum)) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, improvement1Count, improvement2Count, improvement3Count, improvement4Count, improvement5Count, improvement6Count)
		end
		if countImprovements < row.RequiresNum then canAdoptIdeal = false end
	end
	--Policies
	for row in GameInfo.JFD_Ideals_PolicyRequirements("IdealType = '" .. idealType .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if policyID then
			if (not player:HasPolicy(policyID)) then canAdoptIdeal = false end
		end
	end
	--Reforms
	for row in GameInfo.JFD_Ideals_ReformRequirements("IdealType = '" .. idealType .. "'") do
		local reform1ID = GameInfoTypes[row.ReformType1]
		local reform2ID = GameInfoTypes[row.ReformType2]
		if (not row.RequiresOR) then
			if reform1ID then
				if (not player:HasReform(reform1ID)) then canAdoptIdeal = false end
			end
			if reform2ID then
				if (not player:HasReform(reform2ID)) then canAdoptIdeal = false end
			end
		else
			if (reform1ID and (not player:HasReform(reform1ID))) and (reform2ID and (not player:HasReform(reform2ID))) then canAdoptIdeal = false end
		end
	end
	--Resources
	local countResources = 0
	for row in GameInfo.JFD_Ideals_ResourceRequirements("IdealType = '" .. idealType .. "'") do
		local resource1ID = GameInfoTypes[row.ResourceType1]
		local resource2ID = GameInfoTypes[row.ResourceType2]
		local resource3ID = GameInfoTypes[row.ResourceType3]
		local resource4ID = GameInfoTypes[row.ResourceType4]
		local resource5ID = GameInfoTypes[row.ResourceType5]
		if row.RequiresOR then
			if resource1ID then countResources = countResources + player:GetNumResourceTotal(resource1ID, row.IncludesImport) end
			if resource2ID then countResources = countResources + player:GetNumResourceTotal(resource2ID, row.IncludesImport) end
			if resource3ID then countResources = countResources + player:GetNumResourceTotal(resource3ID, row.IncludesImport) end
			if resource4ID then countResources = countResources + player:GetNumResourceTotal(resource4ID, row.IncludesImport) end
			if resource5ID then countResources = countResources + player:GetNumResourceTotal(resource5ID, row.IncludesImport) end
			if resource6ID then countResources = countResources + player:GetNumResourceTotal(resource6ID, row.IncludesImport) end
			if countResources < row.RequiresNum then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countResources)
		else
			if (resource1ID and (player:GetNumResourceTotal(resource1ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (resource2ID and (player:GetNumResourceTotal(resource2ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (resource3ID and (player:GetNumResourceTotal(resource3ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (resource4ID and (player:GetNumResourceTotal(resource4ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (resource5ID and (player:GetNumResourceTotal(resource5ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (resource6ID and (player:GetNumResourceTotal(resource6ID) < row.RequiresNum)) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, player:GetNumResourceTotal(resource1ID, row.IncludesImport), player:GetNumResourceTotal(resource2ID, row.IncludesImport), player:GetNumResourceTotal(resource3ID, row.IncludesImport), player:GetNumResourceTotal(resource4ID, row.IncludesImport), player:GetNumResourceTotal(resource5ID, row.IncludesImport), player:GetNumResourceTotal(resource6ID, row.IncludesImport))
		end
		if row.RequiresHighestNum then
			local hasHighestNumResource, highestNumResource, highestNumResourcePlayerID, playerNumResource = player:HasMostResources(resource1ID)
			local otherPlayer = Players[highestNumResourcePlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumResourcePlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestNumResource) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumResource, otherPlayerDesc, highestNumResource)
		end
	end
	--Specialists
	local countSpecialists = 0
	for row in GameInfo.JFD_Ideals_SpecialistRequirements("IdealType = '" .. idealType .. "' AND CheckAllCities = 0") do
		local specialist1ID = GameInfoTypes[row.SpecialistType1]
		local specialist2ID = GameInfoTypes[row.SpecialistType2]
		local specialist3ID = GameInfoTypes[row.SpecialistType3]
		local specialist4ID = GameInfoTypes[row.SpecialistType4]
		if row.RequiresOR then
			if specialist1ID then countSpecialists = countSpecialists + player:GetTotalSpecialistCount(specialist1ID) end
			if specialist2ID then countSpecialists = countSpecialists + player:GetTotalSpecialistCount(specialist2ID) end
			if specialist3ID then countSpecialists = countSpecialists + player:GetTotalSpecialistCount(specialist3ID) end
			if specialist4ID then countSpecialists = countSpecialists + player:GetTotalSpecialistCount(specialist4ID) end
			if countSpecialists < row.RequiresNum then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countSpecialists)
		else
			if (specialist1ID and (player:GetTotalSpecialistCount(specialist1ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (specialist2ID and (player:GetTotalSpecialistCount(specialist2ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (specialist3ID and (player:GetTotalSpecialistCount(specialist3ID) < row.RequiresNum)) then canAdoptIdeal = false end
			if (specialist4ID and (player:GetTotalSpecialistCount(specialist4ID) < row.RequiresNum)) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, player:GetTotalSpecialistCount(specialist1ID), player:GetTotalSpecialistCount(specialist2ID), player:GetTotalSpecialistCount(specialist3ID), player:GetTotalSpecialistCount(specialist4ID))
		end
		if row.RequiresHighestNum then
			local hasHighestNumSpecialist, highestNumSpecialist, highestNumSpecialistPlayerID, playerNumSpecialist = player:HasMostSpecialists(specialist1ID)
			local otherPlayer = Players[highestNumSpecialistPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumSpecialistPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestNumSpecialist) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumSpecialist, otherPlayerDesc, highestNumSpecialist)
		end
	end
	for row in GameInfo.JFD_Ideals_SpecialistRequirements("IdealType = '" .. idealType .. "' AND CheckAllCities = 1") do
		local specialist1ID = GameInfoTypes[row.SpecialistType1]
		local specialist2ID = GameInfoTypes[row.SpecialistType2]
		local specialist3ID = GameInfoTypes[row.SpecialistType3]
		local specialist4ID = GameInfoTypes[row.SpecialistType4]
		for city in player:Cities() do
			if row.RequiresOR then 
				if ((specialist1ID and (not city:HasSpecialist(specialist1ID))) and
				(specialist2ID and (not city:HasSpecialist(specialist2ID))) and
				(specialist3ID and (not city:HasSpecialist(specialist3ID))) and
				(specialist4ID and (not city:HasSpecialist(specialist4ID)))) then canAdoptIdeal = false end
			else
				if (specialist1ID and (not city:HasSpecialist(specialist1ID))) then canAdoptIdeal = false end
				if (specialist2ID and (not city:HasSpecialist(specialist2ID))) then canAdoptIdeal = false end
				if (specialist3ID and (not city:HasSpecialist(specialist3ID))) then canAdoptIdeal = false end
				if (specialist4ID and (not city:HasSpecialist(specialist4ID))) then canAdoptIdeal = false end
			end
		end
	end
	--Units
	local countUnits = 0
	for row in GameInfo.JFD_Ideals_UnitRequirements("IdealType = '" .. idealType .. "'") do
		for unit in player:Units() do
			if (row.RequiresPromotionType and (not row.RequiresHighestNum)) then
				if (unit:IsHasPromotion(GameInfoTypes[row.RequiresPromotionType])) then
					countUnits = countUnits + 1
				end
			end
			if (row.RequiresNavalUnits and (not row.RequiresHighestNum)) then
				if (unit:IsCombatUnit() and unit:GetDomainType() == domainSeaID) then
					countUnits = countUnits + 1
				end
			end
			if (row.RequiresUnitClassType1 and (not row.RequiresHighestNum)) then
				if unit:GetUnitClassType() == GameInfoTypes[row.RequiresUnitClassType1] then
					countUnits = countUnits + 1
				end
			end
			if (row.RequiresUnitClassType2 and (not row.RequiresHighestNum)) then
				if unit:GetUnitClassType() == GameInfoTypes[row.RequiresUnitClassType2] then
					countUnits = countUnits + 1
				end
			end
			if (row.RequiresUnitCombatType and (not row.RequiresHighestNum)) then
				if unit:GetUnitCombatType() == GameInfoTypes[row.RequiresUnitCombatType] then
					countUnits = countUnits + 1
				end
			end
			if row.RequiresLevel > 0 then
				if (unit:GetLevel() < row.RequiresLevel and countUnits > 0) then
					countUnits = countUnits - 1
				elseif unit:GetLevel() >= row.RequiresLevel then
					countUnits = countUnits + 1	
				end
			end
		end
		cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, countUnits)
		if (row.RequiresNavalUnits and row.RequiresHighestNum) then
			local hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits = player:HasMostUnits(nil, domainSeaID)
			local otherPlayer = Players[highestNumUnitsPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumUnitsPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			countUnits = playerNumUnits
			if (not hasHighestNumUnits) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumUnits, otherPlayerDesc, highestNumUnits)
		end
		if (row.RequiresUnitCombatType and row.RequiresHighestNum) then
			local hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits = player:HasMostUnits(nil, nil, GameInfoTypes[row.RequiresUnitCombatType])
			local otherPlayer = Players[highestNumUnitsPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumUnitsPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			countUnits = playerNumUnits
			if (not hasHighestNumUnits) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumUnits, otherPlayerDesc, highestNumUnits)
		end
		if (row.RequiresUnitClassType1 and row.RequiresHighestNum) then
			local hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits = player:HasMostUnits(nil, nil, nil, GameInfoTypes[row.RequiresUnitClassType1])
			local otherPlayer = Players[highestNumUnitsPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestNumUnitsPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			countUnits = playerNumUnits
			if (not hasHighestNumUnits) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerNumUnits, otherPlayerDesc, highestNumUnits)
		end
		if countUnits < row.RequiresNum then canAdoptIdeal = false end
	end
	--Yields
	for row in GameInfo.JFD_Ideals_YieldRequirements("IdealType = '" .. idealType .. "'") do
		local yieldID = GameInfoTypes[row.YieldType]
		if row.RequiresMinimumPerTurn > 0 then
			local numYieldPerTurn = player:CalculateTotalYield(yieldID)
			if numYieldPerTurn < row.RequiresMinimumPerTurn then canAdoptIdeal = false end
			if (not row.RequiresHighestPerTurn) then
				cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, numYieldPerTurn)
			end
		end
		if row.RequiresMinimumStored > 0 then
			local numYieldStored = player:GetStoredYield(yieldID)
			if numYieldStored < row.RequiresMinimumStored then canAdoptIdeal = false end
			if (not row.RequiresHighestStored) then
				cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, numYieldStored)
			end
		end
		if row.RequiresHighestPerTurn then
			local yieldID = GameInfoTypes[row.YieldType]
			local hasHighestYield, highestYield, highestYieldPlayerID, playerYield = player:HasMostYields(yieldID)
			local otherPlayer = Players[highestYieldPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestYieldPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestYield) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerYield, otherPlayerDesc, highestYield)
		end
		if row.RequiresHighestStored then
			local yieldID = GameInfoTypes[row.YieldType]
			local hasHighestYield, highestYield, highestYieldPlayerID, playerYield = player:HasMostYields(yieldID, true)
			local otherPlayer = Players[highestYieldPlayerID]
			local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
			local otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_UNKNOWN"
			if playerID == highestYieldPlayerID then
				otherPlayerDesc = "TXT_KEY_OTHER_PLAYER_YOU"
			elseif otherPlayerTeam:IsHasMet(playerTeamID) then
				otherPlayerDesc = otherPlayer:GetCivilizationShortDescription()
			end
			if (not hasHighestYield) then canAdoptIdeal = false end
			cultureIdealHelp = Locale.ConvertTextKey(ideal.HelpReq, playerYield, otherPlayerDesc, highestYield)
		end
	end
	return canAdoptIdeal, isNotValid, cultureIdealHelp
end
----------------
-- HIGHEST UTILS
----------------
--Player:HasMostCities
function Player.HasMostCities(player, isCoast, isColonies)
	local playerID = player:GetID()
	if isCoast then
		local playerNumCoastCities = 0
		for city in player:Cities() do
			if city:IsCoastal() then
				playerNumCoastCities = playerNumCoastCities + 1
			end
		end
		local highestNumCoastCities = playerNumCoastCities
		local highestNumCoastCitiesPlayerID = playerID
		local hasHighestNumCoastCities = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumCoastCities = 0
				for city in otherPlayer:Cities() do
					if city:IsCoastal() then
						otherPlayerNumCoastCities = otherPlayerNumCoastCities + 1
					end
				end	
				if otherPlayerNumCoastCities >= highestNumCoastCities then
					highestNumCoastCities = otherPlayerNumCoastCities
					highestNumCoastCitiesPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumCoastCitiesPlayerID then hasHighestNumCoastCities = true end
		return hasHighestNumCoastCities, highestNumCoastCities, highestNumCoastCitiesPlayerID, playerNumCoastCities
	end
	if isColonies then
		local playerNumColonies = 0
		for city in player:Cities() do
			if city:IsColony() then
				playerNumColonies = playerNumColonies + 1
			end
		end
		local highestNumColonies = playerNumColonies
		local highestNumColoniesPlayerID = playerID
		local hasHighestNumColonies = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumColonies = 0
				for city in otherPlayer:Cities() do
					if city:IsColony() then
						otherPlayerNumColonies = otherPlayerNumColonies + 1
					end
				end	
				if otherPlayerNumColonies >= highestNumColonies then
					highestNumColonies = otherPlayerNumColonies
					highestNumColoniesPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumColoniesPlayerID then hasHighestNumColonies = true end
		return hasHighestNumColonies, highestNumColonies, highestNumColoniesPlayerID, playerNumColonies
	end
end

--Player:HasMostFollowers
function Player.HasMostFollowers(player, isWorld)
	local playerID = player:GetID()
	local religionID = player:GetReligionCreatedByPlayer()
	local playerFollowers = 0
	if isWorld then playerFollowers = Game.GetNumTotalFollowers(religionID)
	else playerFollowers = player:GetNumTotalFollowers(religionID) end
	local highestFollowers = playerFollowers
	local highestFollowersPlayerID = playerID
	local hasHighestFollowers = false
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:GetCapitalCity()) then
			local otherReligionID = otherPlayer:GetReligionCreatedByPlayer()
			if (otherReligionID > 0 and otherReligionID ~= religionID) then
				local otherPlayerFollowers = otherPlayer:GetNumTotalFollowers(otherReligionID)
				if isWorld then otherPlayerFollowers = Game.GetNumTotalFollowers(otherReligionID) end
				if otherPlayerFollowers >= highestFollowers then
					highestFollowers = otherPlayerFollowers
					highestFollowersPlayerID = otherPlayerID
				end
			end
		end
	end 
	if religionID <= 0 then playerFollowers = 0 highestFollowers = 0 end
	if playerID == highestFollowersPlayerID then hasHighestFollowers = true end
	return hasHighestFollowers, highestFollowers, highestFollowersPlayerID, playerFollowers
end

--Player:HasMostGreatWorks
function Player.HasMostGreatWorks(player, numGreatWorks, greatWorkID)
	local playerID = player:GetID()
	if greatWorkID then
		if (not numGreatWorks) then numGreatWorks = #player:GetGreatWorks(greatWorkID) end
		local playerNumGreatWorks = numGreatWorks
		local highestNumGreatWorks = playerNumGreatWorks
		local highestNumGreatWorksPlayerID = playerID
		local hasHighestNumGreatWorks = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumGreatWorks = #otherPlayer:GetGreatWorks(greatWorkID)
				if otherPlayerNumGreatWorks >= highestNumGreatWorks then
					highestNumGreatWorks = otherPlayerNumGreatWorks
					highestNumGreatWorksPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumGreatWorksPlayerID then hasHighestNumGreatWorks = true end
		return hasHighestNumGreatWorks, highestNumGreatWorks, highestNumGreatWorksPlayerID, playerNumGreatWorks
	end
end

--Player:HasMostPopulation
function Player.HasMostPopulation(player, isCapital)
	local playerID = player:GetID()
	local playerPopulation = player:GetTotalPopulation()
	if isCapital then playerPopulation = player:GetCapitalCity():GetPopulation() end
	local highestPopulation = playerPopulation
	local highestPopulationPlayerID = playerID
	local hasHighestPopulation = false
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:GetCapitalCity()) then
			local otherPlayerPopulation = otherPlayer:GetTotalPopulation()
			if isCapital then otherPlayerPopulation = otherPlayer:GetCapitalCity():GetPopulation() end
			if otherPlayerPopulation >= highestPopulation then
				highestPopulation = otherPlayerPopulation
				highestPopulationPlayerID = otherPlayerID
			end
		end
	end 
	if playerID == highestPopulationPlayerID then hasHighestPopulation = true end
	return hasHighestPopulation, highestPopulation, highestPopulationPlayerID, playerPopulation
end

--Player:HasMostResources
function Player.HasMostResources(player, resourceID)
	local playerID = player:GetID()
	local playerNumResource = player:GetNumResourceTotal(resourceID, true)
	local highestNumResource = playerNumResource
	local highestNumResourcePlayerID = playerID
	local hasHighestNumResource = false
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:GetCapitalCity()) then
			local otherPlayerNumResource = otherPlayer:GetNumResourceTotal(resourceID)
			if otherPlayerNumResource >= highestNumResource then
				highestNumResource = otherPlayerNumResource
				highestNumResourcePlayerID = otherPlayerID
			end
		end
	end 
	if playerID == highestNumResourcePlayerID then hasHighestNumResource = true end
	return hasHighestNumResource, highestNumResource, highestNumResourcePlayerID, playerNumResource
end

--Player:HasMostTiles
function Player.HasMostTiles(player)
	local playerID = player:GetID()
	local playerTiles = player:GetNumPlots()
	local highestTiles = playerTiles
	local highestTilesPlayerID = playerID
	local hasHighestTiles = false
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:GetCapitalCity()) then
			local otherPlayerTiles = otherPlayer:GetNumPlots()
			if otherPlayerTiles >= highestTiles then
				highestTiles = otherPlayerTiles
				highestTilesPlayerID = otherPlayerID
			end
		end
	end 
	if playerID == highestTilesPlayerID then hasHighestTiles = true end
	return hasHighestTiles, highestTiles, highestTilesPlayerID, playerTiles
end

--Player:HasMostSpecialists
function Player.HasMostSpecialists(player, specialistID)
	local playerID = player:GetID()
	local playerNumSpecialist = player:GetTotalSpecialistCount(specialistID)
	local highestNumSpecialist = playerNumSpecialist
	local highestNumSpecialistPlayerID = playerID
	local hasHighestNumSpecialist = false
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:GetCapitalCity()) then
			local otherPlayerNumSpecialist = otherPlayer:GetTotalSpecialistCount(specialistID)
			if otherPlayerNumSpecialist >= highestNumSpecialist then
				highestNumSpecialist = otherPlayerNumSpecialist
				highestNumSpecialistPlayerID = otherPlayerID
			end
		end
	end 
	if playerID == highestNumSpecialistPlayerID then hasHighestNumSpecialist = true end
	return hasHighestNumSpecialist, highestNumSpecialist, highestNumSpecialistPlayerID, playerNumSpecialist
end

--Player:HasMostUnits
function Player.HasMostUnits(player, unitCount, domainID, unitCombatID, unitClassID)
	local playerID = player:GetID()
	if domainID then
		local playerNumUnits = 0
		if (not unitCount) then
			for unit in player:Units() do
				if (unit:IsCombatUnit() and unit:GetDomainType() == domainID) then
					playerNumUnits = playerNumUnits + 1
				end
			end
		else
			playerNumUnits = unitCount
		end
		local highestNumUnits = playerNumUnits
		local highestNumUnitsPlayerID = playerID
		local hasHighestNumUnits = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumUnits = 0
				for unit in otherPlayer:Units() do
					if (unit:IsCombatUnit() and unit:GetDomainType() == domainID) then
						otherPlayerNumUnits = otherPlayerNumUnits + 1
					end
				end	
				if otherPlayerNumUnits >= highestNumUnits then
					highestNumUnits = otherPlayerNumUnits
					highestNumUnitsPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumUnitsPlayerID then hasHighestNumUnits = true end
		return hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits
	elseif unitCombatID then
		local playerNumUnits = 0
		if (not unitCount) then
			for unit in player:Units() do
				if (unit:IsCombatUnit() and unit:GetUnitCombatType() == unitCombatID) then
					playerNumUnits = playerNumUnits + 1
				end
			end
		else
			playerNumUnits = unitCount
		end
		local highestNumUnits = playerNumUnits
		local highestNumUnitsPlayerID = playerID
		local hasHighestNumUnits = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumUnits = 0
				for unit in otherPlayer:Units() do
					if (unit:IsCombatUnit() and unit:GetUnitCombatType() == unitCombatID) then
						otherPlayerNumUnits = otherPlayerNumUnits + 1
					end
				end	
				if otherPlayerNumUnits >= highestNumUnits then
					highestNumUnits = otherPlayerNumUnits
					highestNumUnitsPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumUnitsPlayerID then hasHighestNumUnits = true end
		return hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits
	elseif unitClassID then
		local playerNumUnits = 0
		if (not unitCount) then
			for unit in player:Units() do
				if unit:GetUnitClassType() == unitClassID then
					playerNumUnits = playerNumUnits + 1
				end
			end
		else
			playerNumUnits = unitCount
		end
		local highestNumUnits = playerNumUnits
		local highestNumUnitsPlayerID = playerID
		local hasHighestNumUnits = false
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				local otherPlayerNumUnits = 0
				for unit in otherPlayer:Units() do
					if unit:GetUnitClassType() == unitClassID then
						otherPlayerNumUnits = otherPlayerNumUnits + 1
					end
				end	
				if otherPlayerNumUnits >= highestNumUnits then
					highestNumUnits = otherPlayerNumUnits
					highestNumUnitsPlayerID = otherPlayerID
				end
			end
		end 
		if playerID == highestNumUnitsPlayerID then hasHighestNumUnits = true end
		return hasHighestNumUnits, highestNumUnits, highestNumUnitsPlayerID, playerNumUnits
	end
end

--Player:HasMostYields
function Player.HasMostYields(player, yieldID, isStored)
	local playerID = player:GetID()
	local playerYield = player:CalculateTotalYield(yieldID)
	if isStored then playerYield = player:GetStoredYield(yieldID) end
	local highestYield = playerYield
	local highestYieldPlayerID = playerID
	local hasHighestYield = false
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() then
			local otherPlayerYield = otherPlayer:CalculateTotalYield(yieldID)
			if isStored then otherPlayerYield = otherPlayer:GetStoredYield(yieldID) end
			if otherPlayerYield >= highestYield then
				highestYield = otherPlayerYield
				highestYieldPlayerID = otherPlayerID
			end
		end
	end 
	if playerID == highestYieldPlayerID then hasHighestYield = true end
	return hasHighestYield, highestYield, highestYieldPlayerID, playerYield
end
--=======================================================================================================================
--=======================================================================================================================