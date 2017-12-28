-- Lua YnAEMP Utils
-- Author: Gedemon
-- DateCreated: 5/8/2011 3:32:29 PM
--------------------------------------------------------------

function GetPlot (x,y)
	local plot = Map:GetPlotXY(y,x)
	return plot
end

function ListAllCivs()
	print ("+++++++++++++++++++")
	print ("---- civ list -----")
	for iPlayer = 0, GameDefines.MAX_PLAYERS do
		local player = Players[iPlayer]
		if player ~= nil then
			local str = "- " .. iPlayer .. " - "
			if player:IsMinorCiv() then
				local minorCivType = player:GetMinorCivType();
				local civInfo = GameInfo.MinorCivilizations[minorCivType];
				local minorName = Locale.ConvertTextKey( civInfo.Description ) 
				str = str .. "Minor civ " .. minorName .. " (" .. minorCivType ..") - "
			else
				local majorCivType = player:GetCivilizationType();
				local civInfo = GameInfo.Civilizations[majorCivType];
				local minorName = Locale.ConvertTextKey( civInfo.Description ) 
				str = str .. "Major civ " .. minorName .. " (" .. majorCivType ..") - "
			end
			if player:IsAlive() then
				str = str .. " alive - "
			end
			print (str)
		end
	end
	print ("+++++++++++++++++++")
end

------------------------------------------------------------------------------------------------------------------------
--JFD_IsUsingCulturalDiversity
------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingCulturalDiversity()
	local culDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
	local isUsingCulDiv = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == culDivModID) then
	    isUsingCulDiv = true
	    break
	  end
	end

	return true--isUsingCulDiv
end
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------