------------------------------------------------------------------------------
--	FILE:	 MapGenerator.lua
--	AUTHORS: Shaun Seckman
--	         Bob Thomas
--	PURPOSE: Base logic for map generation.
------------------------------------------------------------------------------
--	Copyright (c) 2010 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include("MapGenerator.lua");

function ResourceIgnoresLatitudes(resource)
	return false;
end

function CaclulateNumResourcesToAdd(resource)

	-- Calculate resourceCount, the amount of this resource to be placed:
	local rand1 = Map.Rand(resource.RandApp1, "MapGenerator CalculateNumResourcesToAdd-1")
	local rand2 = Map.Rand(resource.RandApp2, "MapGenerator CalculateNumResourcesToAdd-2")
	local rand3 = Map.Rand(resource.RandApp3, "MapGenerator CalculateNumResourcesToAdd-3")
	local rand4 = Map.Rand(resource.RandApp4, "MapGenerator CalculateNumResourcesToAdd-4")
	local baseCount = resource.ConstAppearance + rand1 + rand2 + rand3 + rand4
	
	-- ynaem option
	--print (" resource quantity option is " .. modUserData.GetValue ("ResourceQuantity"))
	local coeff = g_ResourceQuantityCoeff[modUserData.GetValue ("ResourceQuantity")]
	if coeff then
		baseCount = baseCount * coeff
	end

	local ignoreLatitude = ResourceIgnoresLatitudes(resource)

	-- Calculate numPossible, the number of plots that are eligible to have this resource:
	local landTiles = 0
	
	local numPossible = 0
	-- ynaem could have placed deposits before...
	local alreadyPlaced = 0
	for index, plot in Plots() do
		if (plot:CanHaveResource(resource.ID, ignoreLatitude)) then
			numPossible = numPossible + 1
		elseif (plot:GetResourceType(-1) == resource.ID) then
			numPossible = numPossible + 1
			alreadyPlaced = alreadyPlaced + 1
		end
	end

	-- override all other calculation if AbsoluteBaseAmount is used
	if resource.AbsoluteBaseAmount and resource.AbsoluteBaseAmount > 0 then
		local absoluteAmount = resource.AbsoluteBaseAmount
		local absoluteVar = 0
		if resource.AbsoluteVarPercent and resource.AbsoluteVarPercent > 0 then
			local rand1 = resource.AbsoluteBaseAmount-(resource.AbsoluteBaseAmount*resource.AbsoluteVarPercent/100)
			local rand2 = resource.AbsoluteBaseAmount+(resource.AbsoluteBaseAmount*resource.AbsoluteVarPercent/100)
			absoluteAmount = math.random( rand1, rand2 )
		end
		absoluteAmount = absoluteAmount - alreadyPlaced
		print ("try to place " .. absoluteAmount .." " .. resource.Type .. " (absolute number used, " .. alreadyPlaced .. " already placed)" )
		return absoluteAmount
	end 
	
	if (resource.TilesPer > 0) then
		landTiles = landTiles + math.floor(numPossible / resource.TilesPer)
	end
	
	-- ynaemp fix
	local realNumCivAlive
	if modUserData.GetValue ("ResourceScale") and modUserData.GetValue ("ResourceScale") > 0 then
		-- the don't scale option is selected,
		-- set arbitrary a virtual average number of civs in game (including CS)
		local mapID = modUserData.GetValue ("MapID")		
		realNumCivAlive = math.floor((g_MapList[mapID].Civs + g_MapList[mapID].Minors) / 2)
		realNumCivAlive = math.max(15, realNumCivAlive)
	else
		local reqNumMinor = math.min(modUserData.GetValue("NumMinorCivs"), GameDefines.MAX_CIV_PLAYERS -1 - GameDefines.MAX_MAJOR_CIVS)
		local maxMinor = GameDefines.MAX_CIV_PLAYERS -1 - GameDefines.MAX_MAJOR_CIVS
		local excedent = maxMinor - reqNumMinor
		realNumCivAlive = Game.CountCivPlayersAlive() -1 - excedent
		--print ("scaling resources with number of players..." )
		--print ("  - reqNumMinor = " .. reqNumMinor ..",  maxMinor = " .. maxMinor .. ", excedent = " .. excedent .. ", realNumCivAlive = " .. realNumCivAlive )
	end
	
	local players = math.floor((realNumCivAlive * resource.Player) / 100)
	local resourceCount = math.floor((baseCount * (landTiles + players)) / 100)
	resourceCount = math.max(1, resourceCount)

	if resourceCount < alreadyPlaced then
		resourceCount = 0
	else
		resourceCount = resourceCount - alreadyPlaced 
	end
	print ("try to place " .. resourceCount .." " .. resource.Type .. " (" .. alreadyPlaced .. " already placed)" )

	return resourceCount
end

function CanPlaceResourceAt(resource, plot, ignoreLatitude)

	local resourceID = resource.ID;
	local area = plot:Area();

	local plotX = plot:GetX();
	local plotY = plot:GetY();

	-- YnAEMP
	local resourceType = resource.Type

	-- no resource on starting plots
	if plot:IsStartingPlot() then
		return false
	end

	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		-- don't use "CanHaveResource" if the plot is ocean
		-- else all water resource will be placed immediatly at the coast
		-- we want some resources being almost out of reach
		-- to do : replace hardcoding by xml/DB settings
		if plot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN then
			-- allow resource on ocean ?
			-- can we get culture here ?
			return false
		end
		if plot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
			-- allow resource under ice ?
			-- melting mod someone ? :-)
			return false
		end
		if plot:GetFeatureType() == FeatureTypes.FEATURE_ATOLL then
			-- no resource on atoll
			return false
		end
		if plot:GetResourceType(-1) ~= -1 then
			-- Plot already had a resource.
			return false
		end
		local condition = "ResourceType = '" .. resource.Type .. "'"
		local bIsWater = false
		for row in GameInfo["Resource_TerrainBooleans"](condition) do
			if row.TerrainType == "TERRAIN_COAST" then
				bIsWater = true
			end
		end
		if not bIsWater then
			-- this resource can't be placed on water...
			return false
		end
		if plot:IsLake() then
			-- the real hardcoding start here...
			-- no whales or oil in lakes
			if resource.Type == "RESOURCE_WHALE" or resource.Type == "RESOURCE_OIL" then
				return false
			end
		end
		if plot:IsAdjacentToLand() then
			-- no whales or oil near the coast
			if resource.Type == "RESOURCE_WHALE" or resource.Type == "RESOURCE_OIL" then
				return false
			end
		end
	elseif (not plot:CanHaveResource(resourceID, ignoreLatitude)) then
		return false
	end

	if (ResourceIsExclude(resourceType, plotX, plotY)) then
		return false
	end

	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local otherPlot = Map.PlotDirection(plotX, plotY, direction);

		if (otherPlot ~= nil) then
			if ((otherPlot:GetResourceType() ~= -1) and (otherPlot:GetResourceType() ~= resourceID)) then
				return false;
			end
		end
	end

	if (plot:IsWater()) then
		if (((Map.GetNumResourcesOnLand(resourceID) * 100) / (Map.GetNumResources(resourceID) + 1)) < resource.MinLandPercent) then
			return false;
		end
	end

	-- Make sure there are no resources of the same class (but a different type) nearby:
	local resourceClass = GameInfo.ResourceClasses[resource.ResourceClassType];
	local uniqueRange = resourceClass.UniqueRange;
	for dx = -uniqueRange, uniqueRange - 1, 1 do
	
		for dy = -uniqueRange, uniqueRange - 1, 1 do
		
			local otherPlot	= Map.GetPlotXY(plotX, plotY, dx, dy);

			if (otherPlot ~= nil) then
			
				local otherArea = otherPlot:Area();
				if (otherArea:GetID() == area:GetID()) then
				
					if (Map.PlotDistance(plotX, plotY, otherPlot:GetX(), otherPlot:GetY()) <= uniqueRange) then
					
						local otherResource = GameInfo.Resources[otherPlot:GetResourceType()];
						if (otherResource ~= nil) then
						
							if (otherResource.ResourceClassType == resource.ResourceClassType) then
							
								return false;
							end
						end
					end
				end
			end
		end
	end
	
	-- Make sure there are none of the same resource nearby:
	uniqueRange = resource.Unique;
	for dx = -uniqueRange, uniqueRange - 1, 1 do
		for dy = -uniqueRange, uniqueRange - 1, 1 do
			local otherPlot	= Map.GetPlotXY(plotX, plotY, dx, dy);

			if (otherPlot ~= nil) then
				local otherArea = otherPlot:Area();
				if (otherArea:GetID() == area:GetID()) then
				
					if (Map.PlotDistance(plotX, plotY, otherPlot:GetX(), otherPlot:GetY()) <= uniqueRange) then
						if (otherPlot:GetResourceType() == resourceID) then
							return false;
						end
					end
				end
			end
		end
	end
	
	return true;
end

function AddUniqueResourceType(resource)

	local resourceID = resource.ID;
	local resourceCount = CaclulateNumResourcesToAdd(resource);
	local ignoreLatitude = ResourceIgnoresLatitudes(resource);

	local triedAreas = {};
	
	while (true) do
	
		local bestValue = 0;
		local bestArea;
		for id, area in Map.Areas() do
			if(triedAreas[area:GetID()] == nil) then
			
				local numUniqueResourcesOnArea = area:CountNumUniqueResourceTypes() + 1; -- number of unique resources starting on the area, plus this one
				local numTiles = area:GetNumTiles();
				local value = numTiles / numUniqueResourcesOnArea;

				if (value > bestValue) then
					bestValue = value;
					bestArea = area;
				end
			
			end
		end

		if (bestArea == nil) then
			return; -- Can't place resource on any area.
		end
		
		triedAreas[bestArea:GetID()] = true;
		
		-- Place the resources:
		for i, plot in Plots(Shuffle) do
		
			if (Map.GetNumResources(resourceID) >= resourceCount) then
				break; -- We already have enough
			end

			if (bestArea:GetID() == plot:Area():GetID() ) then
			
				if (CanPlaceResourceAt(resource, plot, ignoreLatitude)) then
				
					local resourceNum = Map.GetRandomResourceQuantity(resourceID);
					plot:SetResourceType(resourceID, resourceNum);

					local groupRange = resource.GroupRange;
					for dx = -groupRange, groupRange - 1, 1 do
						for dy = -groupRange, groupRange - 1, 1 do
							if (Map.GetNumResources(resourceID) < resourceCount) then
							
								local otherPlot	= Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, groupRange);
							
								if (otherPlot ~= nil and (otherPlot:Area():GetID() == bestArea:GetID() )) then
									if (CanPlaceResourceAt(resource, otherPlot, ignoreLatitude)) then
									
										if (Map.Rand(100, "addUniqueResourceType") < resource.GroupRand) then
									
											local resourceNum = Map.GetRandomResourceQuantity(resourceID);
											otherPlot:SetResourceType(resourceID, resourceNum);
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function AddNonUniqueResourceType(resource)
	local resourceID = resource.ID;
	local resourceCount = CaclulateNumResourcesToAdd(resource);
	local ignoreLatitude = ResourceIgnoresLatitudes(resource);
	
	if (resourceCount == 0) then
		return;
	end

	for i, plot in Plots(Shuffle) do
		
		if (CanPlaceResourceAt(resource, plot, bIgnoreLatitude)) then
		
			local resourceNum = Map.GetRandomResourceQuantity(resourceID);
			plot:SetResourceType(resourceID, resourceNum);
			resourceCount = resourceCount - 1;

			local groupRange = resource.GroupRange;
			for dx = -groupRange, groupRange - 1, 1 do
				for dy = -groupRange, groupRange - 1, 1 do
				
					if (resourceCount > 0) then
					
						local otherPlot	= Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, groupRange);

						if (otherPlot ~= nil) then
							if (CanPlaceResourceAt(resource, otherPlot, ignoreLatitude)) then
								if (Map.Rand(100, "addNonUniqueResourceType") < resource.GroupRand) then
								
									local resourceNum = Map.GetRandomResourceQuantity(resourceID);
									otherPlot:SetResourceType(resourceID, resourceNum);
									resourceCount = resourceCount - 1;
								end
							end
						end
					end
				end
			end

			if (resourceCount == 0) then
				return;
			end
		end
	end
end

-- Adds resources without regard to player starting positions
-- This function is valuable because it is decoupled from the
-- start position generation.  It is used by world builder maps
-- that have the radomize resources option turned on.
function AddResourcesForWorldBuilderMap()
	print("Map Generation - Adding Resources");
	print("-------------------------------")
	
	--Obtain a list of all resources
	local i = 1;
	local resources = {};
	for resource in GameInfo.Resources() do
		resources[i] = resource;
		i = i + 1;
	end
	
	-- Sort the resources by PlacementOrder
	local PlacementOrderSort = function(a, b)
		return a.PlacementOrder < b.PlacementOrder;
	end
	table.sort(resources, PlacementOrderSort);
	
	-- Add resources
	for i, resource in ipairs(resources) do
		if(AddResourceType == nil or AddResourceType(resource.ID) ~= true) then
			if(resource.Area) then
				AddUniqueResourceType(resource);
			else
				AddNonUniqueResourceType(resource);
			end		
		end
	end
	
	print("-------------------------------")
	-- Show number of resources placed
	for i, resource in ipairs(resources) do
		--if(AddResourceType == nil or AddResourceType(resource.ID) ~= true) then
		local resourcePlaced = 0
		for index, plot in Plots() do
			if (plot:GetResourceType(-1) == resource.ID) then
				resourcePlaced = resourcePlaced + 1
			end
		end
		print ("Counted " .. resourcePlaced .." of " .. resource.Type .. " placed on map" )
	end

end
