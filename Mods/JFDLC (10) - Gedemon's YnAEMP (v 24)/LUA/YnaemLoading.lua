-- Lua Ynaem Extended
-- Author: Gedemon
-- DateCreated: 10/31/2010
--------------------------------------------------------------

include( "YnaemDefines" )
include( "YnaemUtils" )
include( "YnaemFunctions" )

--------------------------------------------------------------

----------------------------------
-- common functions
----------------------------------

function CheckVicinity(minDistance, type, value, x, y)
	-- Ynaem borrowed this from AssignStartingPlots.lua
	-- check the plots around a central plot
	-- available check type are
	-- StartingPlot : return the number of starting plots already set around this plot
	-- RequestedResource : return the available plots to put a ressource in a table, and true if the resource was already at checked distance in this plot:area()
	-- Test : used to test the function by creating a circle of fish at given position

	local iW, iH = Map.GetGridSize()
	local wrapX = Map:IsWrapX()
	local wrapY = Map:IsWrapY()	
	local odd = {{1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, 0}, {0, 1}}
	local even = {{0, 1}, {1, 0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}}
	local nextX, nextY, plot_adjustments
	local checkNum = 0
	local plotNum = 0
	local returnTable = {}
	local bTest = false
	local startArea
		
	if minDistance == 0 then
		-- no need to check anything in this case
		return false
	end

	--print ("Starting search at (" .. y .. "," .. x .. ")")
	--print ("Map size (" .. iW .. "," .. iH .. ")")
	if wrapX then
		--print ("Map is X wrapped")
	end
	if wrapY then
		--print ("Map is Y wrapped")
	end

	-- first, test starting plot
	local plot=Map:GetPlotXY(x,y)
	if plot then
		if type == "StartingPlot" and plot:IsStartingPlot() then
			--print ("Starting plot already set at (" .. y .. "," .. x .. ") - distance = 0")
			checkNum = checkNum + 1
		elseif type == "Test" then
			plotNum = plotNum + 1
			print (plotNum)
			--plot:SetTerrainType(TerrainTypes.TERRAIN_COAST)
		elseif type == "RequestedResource" then
			startArea =	plot:GetArea()
		end
	end
			
	for radius = 1, minDistance do
		--print ("   radius = " .. radius)
		-- Moving clockwise around the ring, the first direction to travel will be Northeast.
		-- This matches the direction-based data in the odd and even tables. Each
		-- subsequent change in direction will correctly match with these tables, too.
		--
		-- Locate the plot within this ring that is due West of the start Plot.
		local currentX = x - radius
		local currentY = y
		-- Now loop through the six directions, moving ripple_radius number of times
		-- per direction. At each plot in the ring, test for type
		for direction_index = 1, 6 do
			--print ("   direction_index = " .. direction_index)
			for plot_to_handle = 1, radius do
				--print ("   plot_to_handle = " .. plot_to_handle)
				-- Must account for hex factor.
			 	if currentY / 2 > math.floor(currentY / 2) then -- Current Y is odd. Use odd table.
					--print ("   Use odd table ")
					plot_adjustments = odd[direction_index];
				else -- Current Y is even. Use plot adjustments from even table.
					--print ("   Use even table ")
					plot_adjustments = even[direction_index];
				end
				-- Identify the next plot in the ring.
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				-- Make sure the plot exists
				-- ynaem : there's something wrong here, don't know if it is also wrong in vanilla placement
				--if wrapX == false and (nextX < 0 or nextX >= iW) then -- X is out of bounds.
					-- Do nothing.
				--elseif wrapY == false and (nextY < 0 or nextY >= iH) then -- Y is out of bounds.
					-- Do nothing.
				--else -- Plot is in bounds, process it.
					-- Handle any world wrap.
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- test this plot.
					-- can't remember who's working inversed now, but double inversed = no inversion...
					
					--print ("   selecting plot at (" .. realY .. "," .. realX .. ")")
					local plot=Map:GetPlotXY(realX,realY)

					if plot then
						--print ("   plot exist at (" .. realY .. "," .. realX .. ")")
						if type == "StartingPlot" and plot:IsStartingPlot() then
							print ("Starting plot already set at (" .. realY .. "," .. realX .. ") - distance = " .. radius)
							checkNum = checkNum + 1

						elseif type =="Test" then
							plotNum = plotNum + 1
							--print ("-> test plot "..plotNum..", at (" .. realY .. "," .. realX .. ") - distance = " .. radius .. " parameters = ".. minDistance .."," ..type..",".. value..","..x..",".. y )
							local silly = 0
							while silly < 9900000 do
								silly = silly + 1
							end
							--plot:SetTerrainType(TerrainTypes.TERRAIN_COAST)
							plot:SetResourceType(11, 1)

						elseif type =="RequestedResource" then
							local resourceID = value
							--print ("test plot for resource " .. resourceID .. " at (" .. realY .. "," .. realX .. ") - distance = " .. radius .. " - area = " .. plot:GetArea())
							if plot:GetResourceType(-1) == resourceID then
								if (not plot:IsWater()) and (plot:GetArea() == startArea) then 
									bTest = true
								else
									--print ("  Resource" .. resourceID .. " was found at (" .. realY .. "," .. realX .. ") but not in the same area or in water." )
								end
							elseif CanPlaceDepositAt (resourceID, realX, realY) then
								if (plot:IsWater()) or (plot:GetArea() == startArea) then
									--print (" Plot at (" .. realY .. "," .. realX .. ") is eligible for " .. resourceID)
									table.insert ( returnTable, plot )
								else
									--print ("  Plot at (" .. realY .. "," .. realX .. ") was eligible for " .. resourceID .. " but not in the same area." )
								end
							end
						end
					end
				--end
				currentX, currentY = nextX, nextY;
			end
		end
	end
	if type == "StartingPlot" then
		if checkNum > 0 then
			--print ("vicinity : " .. checkNum)
			return checkNum
		else
			--print ("vicinity : none")
			return false
		end
	elseif type =="RequestedResource" then
		return returnTable, bTest
	end
end

----------------------------------
-- civs and CS placement functions
----------------------------------

function CheckMap()

	local mapID = modUserData.GetValue ("MapID")
	local iW, iH = Map.GetGridSize()
	if (mapID == GIANT_EARTH) and (iW ~= 180 or iH ~= 94) then
		print ("Giant Earth is (180x94), loaded map is (".. iW .. "x" .. iH .. ")")
		return false
	end
	return true
end

function GetStartingPositionCiv(civID)
	local mapID = modUserData.GetValue ("MapID")
	tableName = "Civilizations_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
	for row in GameInfo[tableName]() do
		if MajorCivExist ( row.Type ) then
			if civID == GameInfo["Civilizations"][row.Type]["ID"] then
				-- Bosphorus case
				local x = row.X
				local y = row.Y 
				if (g_BosphorusPlot[mapID]) then
					if row.Y == g_BosphorusPlot[mapID].y and row.X == g_BosphorusPlot[mapID].x and modUserData.GetValue("Bosphorus") == 1 then
						x = g_BosphorusPlot[mapID].replX
						y = g_BosphorusPlot[mapID].replY
					end
				end
				print (" Civtype : " .. row.Type)
				-- X,Y still inversed...
				local plot = Map:GetPlotXY(y, x)
				CheckVicinity(10, "StartingPlot", 0, y, x)
				return plot
			end
		else
			--print (" Warning : " .. row.Type .. " is not in Civilizations !" )
		end
	end
	print (" No TSL for : " .. civID)
	return false
end

function GetStartingPositionMinorCiv(minorCivID)
	-- to do : add a check to prevent placing SP too close of major civs
	local mapID = modUserData.GetValue ("MapID")
	tableName = "MinorCiv_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
	for row in GameInfo[tableName]() do
		if MinorCivExist(row.Type) then
			if minorCivID == GameInfo["MinorCivilizations"][row.Type]["ID"] then
				-- Bosphorus case
				local x = row.X
				local y = row.Y 
				if (g_BosphorusPlot[mapID]) then
					if row.Y == g_BosphorusPlot[mapID].y and row.X == g_BosphorusPlot[mapID].x and modUserData.GetValue("Bosphorus") == 1 then
						x = g_BosphorusPlot[mapID].replX
						y = g_BosphorusPlot[mapID].replY
					end
				end
				print (" MinorCivtype : " .. row.Type)
				-- X,Y still inversed...
				local plot = Map:GetPlotXY(y, x)
				local numCheck
				local wantedSeparation = g_MinorDistanceValue[modUserData.GetValue("MinorDistance")]
				-- dont test collision if we use a selection already without collision...
				-- to do : set this in option tab, something like NeedCollisionCheck = true
				--if modUserData.GetValue("MinorSelection") == MINOR_AMERICAN_NATION or modUserData.GetValue("MinorSelection") == MINOR_PRESELECT then
					--print ("MinorSelection option = " .. modUserData.GetValue("MinorSelection"))
				--	numCheck = false 
				--else
					numCheck = CheckVicinity(wantedSeparation, "StartingPlot", 0, y, x)
				--end
				-- return plot if no one is too close 
				if not numCheck then
					return plot
				else
					return false
				end
			end
		else
			--print (" Warning : " .. row.Type .. " is not in MinorCivilizations !" )
		end
	end
	print (" No TSL for : " .. minorCivID)
	return false
end

function PopulateWorld ()
	print("-------------------------------")
	print("Hello World, ready to be populated ?")
	-- the CheckVicinity test will draw a round of fish tile in the middle of south atlantic ocean on giant map...
	--CheckVicinity(5, "Test", 0, 10, 10)
	print("-------------------------------")
	print("Set major civs Starting Plots")

	-- place major civs first
	if modUserData.GetValue("MajorPlacement") ~= MAJOR_ALL_RANDOM then
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local player = Players[i]
			local civID = player:GetCivilizationType() 
			print("-------------------------------")
			print ("Search starting position for Civ : " .. civID )
			local plot = GetStartingPositionCiv(civID)
			if plot then
				--print ("Found starting position for Civ : " .. civID )
				player:SetStartingPlot(plot)
			end
		end
	else
		print("-------------------------------")
		print("Major civs option = all random")
	end

	-- test
	--ListAllCivs()

	if modUserData.GetValue("MinorPlacement") ~= MINOR_ALL_RANDOM then
		print("-------------------------------")
		print("Set minor civs Starting Plots")

		-- place minor civs
		local toRemove = {}
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[i]
			local minorCivID = player:GetMinorCivType() 
			print("-------------------------------")
			print ("Search starting position for Minor Civ : " .. minorCivID )
			local plot = GetStartingPositionMinorCiv(minorCivID)
			if plot then
				--print ("Found starting position for Minor Civ : " .. minorCivID )
				player:SetStartingPlot(plot)
			elseif modUserData.GetValue("MinorPlacement") ~= MINOR_TSL_RANDOM then
				-- no random placement allowed, mark civ to be removed
				--print("Minor civ marked for removing : " .. minorCivID)
				table.insert(toRemove, "minor"..minorCivID.."tr")
			end
	    end
		modUserData.SetValue("ToRemove", table.concat(toRemove,","))
		print("To remove : " .. table.concat(toRemove,","))
	else
		print("-------------------------------")
		print("Minor civs option = all random")
	end
	print("-------------------------------")

end

-------------------------------
-- resource placement functions
-------------------------------

-- test if a resource exist
function ResourceExist ( ResourceType )
	local resExist = false
	for row in GameInfo.Resources() do
		if row.Type == ResourceType then
			resExist = true
		end
	end
	return resExist
end

-- test function
function NoRegion()
	local mapID = modUserData.GetValue ("MapID")
	local posTableName = "Resource_" .. g_MapList[mapID].TablePrefix .. "RegionPosition"
	local gridWidth, gridHeight = Map.GetGridSize()

	for x = 1, gridWidth do
		for y = 1, gridHeight do			
			local isInRegion = false
			for posRow in GameInfo[posTableName]() do
				if (posRow.X <= x and posRow.Y <= y) and (posRow.X + posRow.Width >= x and posRow.Y + posRow.Height >= y) then
					isInRegion = true
				end
			end
			if not isInRegion then
				local plot=Map:GetPlotXY(y,x)
				if plot and plot:GetResourceType() then
					local resID = plot:GetResourceType()
					if resID >= 0 then
						print ("Not in any region at (" .. x ..",".. y .. ") and having resource : " .. resID)
					end
				end
			end
		end
	end
end

-- Ynaem check if this resource is exclude from this plot's region
function ResourceIsExclude(resourceType, plotX, plotY)
	if modUserData.GetValue ("ResourceGeo") == 0 then
		return false
	end
	local mapID = modUserData.GetValue ("MapID")
	local posTableName = "Resource_" .. g_MapList[mapID].TablePrefix .. "RegionPosition"
	local excTableName = "Resource_" .. g_MapList[mapID].TablePrefix .. "RegionExclude"
	for posRow in GameInfo[posTableName]() do
		-- here we check if the plot is in a defined region and if the resource is exclude from that region
		-- we are already in the region position table, row.Type is the region name, check if the resource's plot is in this region
		if (posRow.X <= plotX and posRow.Y <= plotY) and (posRow.X + posRow.Width >= plotX and posRow.Y + posRow.Height >= plotY) then
			local condition = "Resource = '" .. resourceType .. "'"
			for excRow in GameInfo[excTableName](condition) do
				-- we've got all the regions where the resource is exclude, now we check if the region we're in is one of them
				if (excRow.Type == posRow.Type ) then
					--print ("trying to place " .. resourceType .." in region : " .. posRow.Type .. " at " .. plotX .."," .. plotY)
					--print ("but resource is not allowed here !")
					return true
				end
			end
		end
	end
	return false
end


function CanPlaceDepositAt (resourceID, plotX, plotY)
	local plot = Map:GetPlotXY(plotX, plotY)
	local ignoreLatitude = true

	local resource = GameInfo["Resources"][resourceID]
	
	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		-- don't use "CanHaveResource" if the plot is a ocean
		-- else all water resource will be placed immediatly at the coast
		-- we want some resources being almost out of reach
		-- to do : replace hardcoding by xml/DB settings

		if plot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN then
			-- allow resource on ocean ?
			return false
		end
		if plot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
			-- allow resource under ice ?
			-- melting mod someone ? :-)
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

	-- check if there's not a ressource of another type on the surrounding tiles
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local otherPlot = Map.PlotDirection(plotY, plotX, direction)
		if (otherPlot ~= nil) then
			if ((otherPlot:GetResourceType() ~= -1) and (otherPlot:GetResourceType() ~= resourceID)) then
				return false
			end
		end
	end
	return true
end

-- add deposit
function AddDeposit()
	if modUserData.GetValue ("ResourceDeposit") == 0 then
		return
	end
	print ("Adding major deposits...")
	print("-------------------------------")
	local mapID = modUserData.GetValue ("MapID")
	local depTableName = "Resource_" .. g_MapList[mapID].TablePrefix .. "GisementPosition"
	for depRow in GameInfo[depTableName]() do
		print ("Placing deposit of " .. depRow.Resource .. " in " .. depRow.Type)
		local resourceID = GameInfo["Resources"][depRow.Resource]["ID"]
		-- put the available plots of the region in a table
		local plotTable= {}
		for x = depRow.X, depRow.X + depRow.Width do
			for y = depRow.Y, depRow.Y + depRow.Height do
				if CanPlaceDepositAt (resourceID, y, x) then
					local plot = Map:GetPlotXY(y,x)
					if plot then
						table.insert ( plotTable, plot )
					end
				end
			end
		end
		-- shuffle it
		for i = #plotTable, 2, -1 do
			local r = math.random(i)
			plotTable[i], plotTable[r] = plotTable[r], plotTable[i]
		end
		-- place deposits
		local placed = math.min(depRow.Deposit, #plotTable)
		for i = 1, placed do
			local plot = plotTable[i]
			local yield = math.random(depRow.MinYield, depRow.MaxYield)
			plot:SetResourceType(resourceID, yield)
		end
		print ("Asked for " .. depRow.Deposit .. ", placed " .. placed .. " (available plots = " .. #plotTable .. " )" )
	end
	print("-------------------------------")
end

-- add civ's specific resources
function AddResourcesForCivs()
	if modUserData.GetValue ("ResourceRequested") == 0 then
		return
	end
	print("-------------------------------")
	print("Adding requested resources for civs...")
	print("-------------------------------")
		
	local mapID = modUserData.GetValue ("MapID")
	tableName = "Civilizations_" .. g_MapList[mapID].TablePrefix .. "RequestedResource"

	--for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
	for i = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[i]
		if player:IsAlive() then
			local civID, civType
			if player:IsMinorCiv() then			
				civID = player:GetMinorCivType()
				civType = GameInfo.MinorCivilizations[civID].Type
			else
				civID = player:GetCivilizationType()
				civType = GameInfo.Civilizations[civID].Type
			end
			local startPlot = player:GetStartingPlot()
			if startPlot then
				local startX = startPlot:GetX()
				local startY = startPlot:GetY()
			
				local condition = "Type = '" .. civType .. "'"
				for row in GameInfo[tableName](condition) do
					local i = 1
					local reqResource = row["Req" .. i]
					while reqResource do
						if ResourceExist ( reqResource ) then
							local resourceID = GameInfo["Resources"][reqResource]["ID"]
							local yield = row["Yield" .. i]
							-- put the available plots of the region in a table
							local plotTable= {}
							local alreadyPlaced = false
							-- x,y reversed, not reversed, just print test and set...
							plotTable, alreadyPlaced = CheckVicinity(3, "RequestedResource", resourceID, startY, startX)
							-- if no result at close proximity, try larger
							if (#plotTable == 0) and (not alreadyPlaced) and not player:IsMinorCiv() then
								print (" no result, try a larger search...")
								plotTable, alreadyPlaced = CheckVicinity(6, "RequestedResource", resourceID, startY, startX)
								-- on larger search, place the resource anyway, a duplicate could belong to another civ...
								alreadyPlaced = false 
							end
							-- select a plot randomly to place the resource
							if alreadyPlaced then
								print ("  The requested " .. reqResource .. " was already available for " .. civType .. ", there was " .. #plotTable .. " other plot(s) available")
							elseif #plotTable > 0 then
								local r = math.random(#plotTable)
	
								local plot = plotTable[r]
								plot:SetResourceType(resourceID, yield)
								print ("placed " .. reqResource .. " for " .. civType .. ", there was " .. #plotTable .. " plot(s) available" )
							else
								print ("no plot available to place " .. reqResource .. " for " .. civType)
							end
						else
							print ("  The requested " .. reqResource .. " can't be placed for " .. civType .. ", it wasn't found in resource table")
						end
						-- next resource...
						i = i + 1
						if i > MAX_REQUESTED_RESOURCE then
							break
						end
						reqResource = row["Req" .. i]
					end
				end
			end
		end
	end
	print("-------------------------------")
end


-----------------
-- Initialize map
-----------------

-- this function is called from the placegoodyhut function
-- I've not found a better "hook" yet, when it's called the civ placement is already done,
-- the populate function will change the civs starting location, not set it, that's done before.
-- that means that a custom civ without TSL could be placed by the game at a TSL of another civ
-- To do : do not allow that by removing the custom civs without TSL from the setup menu,
-- including the random selection.
-- On the other hand the CS are not placed yet, so we place the ones we knew the TSL of
-- and simply leave the placement of the others to the game engine.
 
function InitializeYnaem()
	-- first, check if we're currently loading a Ynaemp's map
	-- true is set when launching a game from the custom advanced setup menu	
	if modUserData.GetValue("LoadingYnaem") == "true" then
		print ("Setup ask to configure map, checking...")
		-- reset for next game
		modUserData.SetValue("LoadingYnaem", "false")
		if CheckMap() then
			print ("Map confirmed, initializing, now...")
			modUserData.SetValue("MapChecked", "true")
			local mapID = modUserData.GetValue ("MapID")			
			print ("Map ID : " .. mapID)
			-- update map tiles
			-- Is there a Bosphorus Strait to configure ?
			if (g_BosphorusPlot[mapID]) then
				print ("Map has Bosphorus setting, check for option...")
				if modUserData.GetValue("Bosphorus") == 1 then
					print ("Making Bosphorus a sea tile...")
					-- inversed x,y...
					local plot=Map:GetPlotXY(g_BosphorusPlot[mapID].y,g_BosphorusPlot[mapID].x)
					plot:SetPlotType(PlotTypes.PLOT_OCEAN)
					plot:SetTerrainType(TerrainTypes.TERRAIN_COAST)
				else
					print ("Making Bosphorus a river...")
					-- inversed x,y...
					local plot=Map:GetPlotXY( g_BosphorusPlot[mapID].riverY , g_BosphorusPlot[mapID].riverX )
					if g_BosphorusPlot[mapID].position == "NW" then
						plot:SetNWOfRiver(true, FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST)
					end
					if g_BosphorusPlot[mapID].position == "W" then
						plot:SetWOfRiver(true, FlowDirectionTypes.FLOWDIRECTION_SOUTH)
					end
					if g_BosphorusPlot[mapID].position == "W-NW" then
						plot:SetNWOfRiver(true, FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST)
						plot:SetWOfRiver(true, FlowDirectionTypes.FLOWDIRECTION_NORTH)
					end
				end
			end

			-- Place extra natural wonders if available (from DLC & expansion)
			local extraFeatures = g_NaturalWonderPlacement[mapID]
			if extraFeatures then
				for feature, data in pairs(extraFeatures) do
					if GameInfo["Features"][feature] then -- so we don't crah everything if the feature does not exist !
						featureID = GameInfo["Features"][feature].ID
						print ("Placing " .. tostring(feature))
						local plot = GetPlot(data.X,data.Y)
						plot:SetPlotType(PlotTypes.PLOT_LAND, false, false)
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, false)
						plot:SetFeatureType(featureID)
					end
				end
			end

			-- set starting locations
			PopulateWorld ()
			
			-- resource : first, Civ's requested resources placement
			AddResourcesForCivs()

			-- deposit placement
			AddDeposit()

			-- to do : get rid of WorldBuilderRandomItems.lua dependancy
			-- Resources placement
			if modUserData.GetValue ("ResourceGeo") == 1 then
				print ("Using True Geographic Resource placement...")
			end
			AddResourcesForWorldBuilderMap()
		else
			print ("Size mismatch, do nothing...")
			modUserData.SetValue ("MapChecked", "false")
		end
	else
		print ("Not loading from Ynaemp setup, do nothing...")
		modUserData.SetValue ("MapChecked", "false")
	end
	
	print("-------------------------------")
	print("Ynaem pre-load setup finished")
	print("-------------------------------")
end

