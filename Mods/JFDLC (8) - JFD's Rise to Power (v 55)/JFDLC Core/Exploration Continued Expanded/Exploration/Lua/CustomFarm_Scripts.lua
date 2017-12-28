--===========================================================================================================
-- Scripts for Rice and Maize Farms:
-- ---------------------------------
-- What these scripts do is workaround the fact we can't add Crop textures in any way (we can add them but there's no way of referencing the new ones)
-- In order to do this, we are changing all plots that are of America and Asia continents. Except for those with our required resources.
-- The plots with our required resources are assigned the correct continent (America for Maize, Asia for Rice)
--
-- The script also puts a temporary dummy improvement once the farm has been created, and then it reverts back to a farm.
-- This is because otherwise the resource model is still visible (feel free to put a false on HideResourceModel)
--============================================================================================================
--============================================================================================================
-- To use simply change these resource definitions
-------------------------------
print("Rice and Maize scripts executing")

iRiceResource = GameInfoTypes["RESOURCE_JFD_RICE"]
iRiceContinent = 2 -- Asia
iRiceHideResourceModel = true

iMaizeResource = GameInfoTypes["RESOURCE_JFD_MAIZE"]
iMaizeContinent = 1 -- America
iMaizeHideResourceModel = true

--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================
--=============================================================================================================

function StartGameCheck (iPlayer)
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		PrereqContinent = 0
		if (plot:GetNumResource() > 0) then
			if plot:GetResourceType() == iRiceResource then
				print("Found Rice")
				PrereqContinent = iRiceContinent

					--if plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FARM then
					--print("Found Rice Farm")
					--plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX)
					--plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM)
					--end

			elseif plot:GetResourceType() == iMaizeResource then
				print("Found Maize")
				PrereqContinent = iMaizeContinent

					--if plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FARM then
					--print("Found Maize Farm")
					--plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX)
					--plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM)
					--end

			end
		end
		CurrentContinent = plot:GetContinentArtType()
		if PrereqContinent > 0 then
			print("Changing Continent for Rice or Maize")
			plot:SetContinentArtType(PrereqContinent)
		else
			if CurrentContinent == iRiceContinent or CurrentContinent == iMaizeContinent then
				--print("Changing Continent for not Rice or not Maize")
				plot:SetContinentArtType(CurrentContinent + 2)
			end
		end
	end
end

--Events.LoadScreenClose.Add(StartGameCheck)

function StartGameFarmCheck (iPlayer)
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		plot = Map.GetPlotByIndex(iPlotLoop)
		if (plot:GetNumResource() > 0) then

			if plot:GetResourceType() == iRiceResource then
					if plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FARM then

					print("Found Rice Farm")
					print(plot)

					Events.SerialEventImprovementCreated.Add(ChangeFakeFarms)
					plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX)

					end

			elseif plot:GetResourceType() == iMaizeResource then
					if plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FARM then

					print("Found Maize Farm")
					print(plot)

					Events.SerialEventImprovementCreated.Add(ChangeFakeFarms)
					plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX)

					end
			end
		end
	end
end

Events.LoadScreenClose.Add(StartGameFarmCheck)

function ImprovementReplace (playerID, plotX, plotY, improvementID) 
	if improvementID == GameInfoTypes.IMPROVEMENT_FARM then
		plot = Map.GetPlot(plotX, plotY)
		change = false
		if plot:GetResourceType() == iRiceResource then
			if iRiceHideResourceModel == true then
				change = true
			end
		end
		if plot:GetResourceType() == iMaizeResource then		
			if iMaizeHideResourceModel == true then
				change = true
			end
		end
		if change == true then
			Events.SerialEventImprovementCreated.Add(ChangeFakeFarms)
			plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX)
		end
	end
end

function ChangeFakeFarms()
	
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local iPlot = Map.GetPlotByIndex(iPlotLoop)
		if iPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FAKE_FARM_FIX then
			print(iPlot)
			iPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM)
			print("changed back")
		end
	end
	Events.SerialEventImprovementCreated.Remove(ChangeFakeFarms)	
end

GameEvents.BuildFinished.Add(ImprovementReplace)