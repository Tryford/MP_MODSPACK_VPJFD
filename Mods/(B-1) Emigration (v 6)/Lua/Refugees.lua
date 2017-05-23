------------------------------------------------------------
local fRefugeesMod = GameInfo.EmigrationSettings["RefugeesPercent"].Value / 100;
------------------------------------------------------------
function OnCityCapture(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	if not bConquest then
		return;
	end
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();
	--print("old pop = " .. iPop);
	--print("new pop = " .. city:GetPopulation());
	local refs = math.floor((iPop - city:GetPopulation()) * fRefugeesMod);
	if refs > 0 then
		local prox = GetProximityRating(city, iOldOwner);
		if #prox == 0 then
			return;	-- no destinations
		end
		city:SetPopulation(city:GetPopulation() + refs, true);
		--print("moving " .. refs .. " refugees!");
		for i = 1, refs do
			local dest = GetDestination(prox);
			--print("dest is " .. dest:GetName());
			MoveCitizen(city, dest);
		end
	end
end
------------------------------------------------------------
function GetProximityRating(from, iOldOwner)
	local rating = {};
	local player = Players[iOldOwner];
	for n, ownr in pairs(Players) do
		if IsValid(ownr) and (player == ownr or MetAndNoWar(player, ownr)) then
			for city in ownr:Cities() do
				if not city:IsRazing() and city ~= from then
					local dist = Map.PlotDistance(from:GetX(), from:GetY(), city:GetX(), city:GetY()) - 2;	-- 3 being a minimal possible distance
					if from:GetOriginalOwner() == city:GetOwner() then
						dist = dist / 2;
					end
					local wght = math.floor(99999 / dist^2);	-- inversely proportional to dist^2
					----print(city:GetName() .. " wght = " .. wght);
					table.insert(rating,
					{
						city = city,
						wght = wght,
					});
				end
			end
		end
	end
	return rating;
end
------------------------------------------------------------
function GetDestination(rating)
	local weights = {};
	local sumWgt = 0;
	for i = 1, #rating do
		local wgt = rating[i].wght;
		sumWgt = sumWgt + wgt;
		weights[i] = wgt;
	end
	local roll = Map.Rand(sumWgt, "Emigration - Determine dest city roll");
	local accWgt = 0;
	for i = 1, #rating do
		accWgt = accWgt + weights[i];
		if roll < accWgt then
			return rating[i].city;
		end
	end
end
------------------------------------------------------------
GameEvents.CityCaptureComplete.Add(OnCityCapture);
------------------------------------------------------------