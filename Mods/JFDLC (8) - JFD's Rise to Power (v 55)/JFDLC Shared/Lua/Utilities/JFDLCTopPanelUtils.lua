-- JFD_TopPanelUtils
-- Author: JFD
-- DateCreated: 12/10/2015 4:05:32 PM
--=======================================================================================================================
-- UTILS
--=======================================================================================================================
-- DYNAMIC TOP PANEL
--------------------------------------------------------------------------------------------------------------------------
--Dynamic Top Panel
for row in GameInfo.JFD_TopPanelIncludes() do
	include(row.FileName)
end

local JFD_YieldAddinMetatable = {}
-- JFD_YieldAddinMetatable
function JFD_YieldAddinMetatable:YieldSum()
	local yieldSum = 0
	for _, entry in ipairs(self) do
		if entry.Yield then
			yieldSum = yieldSum + entry.Yield
		end
	end
	return yieldSum
end

-- JFD_YieldAddinMetatable
function JFD_YieldAddinMetatable:YieldTooltips(tTooltips)
	local toolTipText = ""
	for _, entry in ipairs(self) do
		if entry.ToolTip and entry.Yield then
			local toolTip
			if isUsingEUI then
				toolTip = "[ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
			else
				toolTip = "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
			end
			toolTipText = toolTipText .. toolTip
		end
	end
	return toolTipText
end

-- JFD_YieldAddinMetatable
function JFD_YieldAddinMetatable:YieldTooltipsPositive(tTooltips)
	local toolTipText = ""
	for _, entry in ipairs(self) do
		if entry.Yield > 0 then
			local toolTip
			if isUsingEUI then
				toolTip = "[ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
			else
				toolTip = "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
				if entry.YieldType == "YIELD_GOLD" then
					toolTip = "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
				end
			end
			toolTipText = toolTipText .. toolTip
		end
	end
	return toolTipText
end

-- JFD_YieldAddinMetatable
function JFD_YieldAddinMetatable:YieldTooltipsNegative(tTooltips)
	local toolTipText = ""
	for _, entry in ipairs(self) do
		if entry.Yield < 0 then
			local toolTip
			if isUsingEUI then
				toolTip = "[ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
			else
				toolTip = "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
				if entry.YieldType == "YIELD_GOLD" then
					toolTip = "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey(entry.ToolTip, entry.Yield)
				end
			end
			toolTipText = toolTipText .. toolTip
		end
	end
	return toolTipText
end

-- JFD_GetYieldAddins
function JFD_GetYieldAddins(yieldType)
	local tableYieldAddins = {}
	setmetatable(tableYieldAddins, { __index = JFD_YieldAddinMetatable})
	for row in GameInfo.JFD_TopPanelAdditions("YieldType = '" .. yieldType .. "'") do
		local entry = {}
		local yieldSourceFunction = row.YieldSourceFunction
		if yieldSourceFunction ~= null then
			local yield = loadstring("return " .. yieldSourceFunction .. "(Game.GetActivePlayer())")()
			local civType = row.CivilizationType 
			if civType then
				if Players[Game.GetActivePlayer()]:GetCivilizationType() == GameInfoTypes[civType] then
					if yield ~= 0 then
						entry.YieldType = yieldType
						entry.Yield = yield
						entry.ToolTip = row.YieldSourceToolTip
					end
				end
			end
			
			if (not civType) then
				if yield ~= 0 then
					entry.YieldType = yieldType
					entry.Yield = yield
					entry.ToolTip = row.YieldSourceToolTip
				end
			end		
		end
		if entry.Yield then
			table.insert(tableYieldAddins, entry)
		end
	end
	return tableYieldAddins
end

-- JFD_GetYieldMiscToolTipAddins
function JFD_GetYieldMiscToolTipAddins(yieldType)
	local toolTipText
	for row in GameInfo.JFD_TopPanelAdditions("YieldType = '" .. yieldType .. "'") do
		local miscToolTipFunction = row.MiscToolTipFunction
		if miscToolTipFunction then
			toolTipText = ""
			local civType = row.CivilizationType 
			if civType then
				if Players[Game.GetActivePlayer()]:GetCivilizationType() == GameInfoTypes[civType] then
					local miscToolTip = loadstring("return " .. miscToolTipFunction .. "(Game.GetActivePlayer())")()
					if miscToolTip then
						toolTipText = toolTipText .. "[NEWLINE][NEWLINE]";
						toolTipText = toolTipText ..  miscToolTip
					end
				end
			end
			if (not civType) then
				local miscToolTip = loadstring("return " .. miscToolTipFunction .. "(Game.GetActivePlayer())")()
				if miscToolTip then
					toolTipText = toolTipText .. "[NEWLINE][NEWLINE]";
					toolTipText = toolTipText ..  miscToolTip
				end
			end
		end
	end
	return toolTipText
end
--==========================================================================================================================
--==========================================================================================================================