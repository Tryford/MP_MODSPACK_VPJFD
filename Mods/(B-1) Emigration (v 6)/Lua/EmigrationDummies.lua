--------------------------------------------------------------
-- EmigrationDummies
-- Author: Mk Z
--------------------------------------------------------------
include( "EmigrationRules" );	-- to get the bar size
--------------------------------------------------------------
-- DUMMY BUILDINGS
-- cooldown
-- pair city X
-- pair city Y
-- emigration urge
-- emigration bar
--------------------------------------------------------------
function SetCooldown(city)
	local t = city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_COOLDOWN);
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_COOLDOWN, t + iCooldown);	-- stacks
end
function DecCooldown(city)
	local t = city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_COOLDOWN);
	if t > 0 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_COOLDOWN, t - 1);
	end
end
function GetCooldownBarrier(city)
	return math.ceil(city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_COOLDOWN) / iCooldown) * EmbRec;	-- stacks
end
function SetEmBar(city, val)
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_BAR, val + 1);	-- to store -1
end
function GetEmBar(city)
	return city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_BAR) - 1;
end
function SetPair(im, em, urge)
	im:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_X, em:Plot():GetX());
	im:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_Y, em:Plot():GetY());
	em:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_X, im:Plot():GetX());
	em:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_Y, im:Plot():GetY());
	em:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_URGE, urge);
	if GetEmBar(em) == -1 then
		SetEmBar(em, 0);
	end
end
function GetPairCity(city)
	local x = city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_X);
	local y = city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_Y);
	----print(city:GetName() .. " get pair: ", "x=" .. x .. ", y=" .. y);
	local pair = Map.GetPlot(x, y):GetPlotCity();
	--[[
	if pair ~= nil then
		print("the pair is " .. pair:GetName());
	else
		print("pair is nil");
	end
	]]--
	return pair;
end
function GetSavedUrge(city)
	return city:GetNumRealBuilding(GameInfoTypes.BUILDING_EM_URGE);
end
function SaveUrge(city, val)
	return city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_URGE, val);
end
function BreakPair(city)
	local other = GetPairCity(city);
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_X, 0);
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_Y, 0);
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_URGE, 0);
	if other ~= nil then
		other:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_X, 0);
		other:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_PAIR_Y, 0);
		other:SetNumRealBuilding(GameInfoTypes.BUILDING_EM_URGE, 0);
	end
end