-- Prosperity
-- Author: Mk Z
-- DateCreated: 5/6/2013 7:34:55 AM
--------------------------------------------------------------
include( "MkzUtils" );
include( "EmigrationDummies" );	-- includes EmigrationRules
--------------------------------------------------------------
--	PROSPERITY FACTORS
--------------------------------------------------------------
local ScienceFactor 		= GameInfo.EmigrationSettings["ScienceFactor"].Value / 100;
local HappinessFactor 		= GameInfo.EmigrationSettings["HappinessFactor"].Value / 100;
local LocalHappinessFactor 	= GameInfo.EmigrationSettings["LocalHappinessFactor"].Value / 100;
local PopulationFactor 		= GameInfo.EmigrationSettings["PopulationFactor"].Value / 100;
local PoliciesFactor		= GameInfo.EmigrationSettings["NumberOfPoliciesFactor"].Value / 100;
local OrderBonus			= GameInfo.EmigrationSettings["OrderBonus"].Value;
--------------------------------------------------------------
--	PROSPERITY MODIFIERS (%)
--------------------------------------------------------------
local ReligionModifier		= GameInfo.EmigrationSettings["ReligionModifier"].Value;
local UnemployedModifier	= GameInfo.EmigrationSettings["UnemployedModifier"].Value;
local WarModifier			= GameInfo.EmigrationSettings["WarModifier"].Value;
local DangerModifier		= GameInfo.EmigrationSettings["DangerModifier"].Value;
local SiegeModifier			= GameInfo.EmigrationSettings["SiegeModifier"].Value;
local StarvationModifier 	= GameInfo.EmigrationSettings["StarvationModifier"].Value;
local FreedomModifier 		= GameInfo.EmigrationSettings["FreedomModifier"].Value;
--------------------------------------------------------------
function GetProsperityFromProductiveness(city)
	local prosp = 0;
	-- add sum of yields (food, production, gold)
	for i = 0, 2 do
		prosp = prosp + city:GetYieldRateTimes100(i);
	end
	prosp = prosp + city:GetYieldRateTimes100(3) * ScienceFactor;	-- add science separately
	prosp = prosp / 100;
	prosp = prosp + city:GetJONSCulturePerTurn();	-- add culture per turn
	prosp = prosp + city:GetGreatPeopleRate();		-- add great people points per turn
	prosp = prosp + city:GetFaithPerTurn();			-- add faith
	prosp = prosp + city:GetBaseTourism();			-- add tourism
	prosp = prosp / city:GetPopulation();		-- calc average per citizen
	--prosp = LogN(prosp, ProductivityLogBase);	-- to nerf super-cities (100+ tourism, caravan income etc)
	return Round(prosp);
end
--------------------------------------------------------------
function GetProsperityFromLocalHappiness(city)	
	return city:GetLocalHappiness() * LocalHappinessFactor;
end
--------------------------------------------------------------
function GetProsperityFromPopulation(city)
	return -1 * city:GetPopulation() * PopulationFactor;
end
--------------------------------------------------------------
function GetProsperityFromHappiness(player)
	return player:GetExcessHappiness() * HappinessFactor;
end
--------------------------------------------------------------
function GetProsperityFromPolicies(player)
	return player:GetNumPolicies() * PoliciesFactor;
end
--------------------------------------------------------------
function GetProsperityFromOrder(player)
	if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) then
		return OrderBonus;
	end
	return 0;
end
--------------------------------------------------------------
function GetFreedomModifier(player)
	if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) then
		return FreedomModifier;
	end
	return 0;
end
--------------------------------------------------------------
function GetReligionModifier(city)
	if Players[city:GetOwner()]:HasPolicy(GameInfoTypes.POLICY_FREE_RELIGION) then
		return 0;
	else
		local numRels = 0;
		for rel in GameInfo.Religions() do
			local num = city:GetNumFollowers(rel.ID);
			if num > 0 then
				numRels = numRels + 1;
			end
		end
		if numRels > 1 then
			return (numRels - 1) * ReligionModifier;
		else
			return 0;
		end
	end
end
--------------------------------------------------------------
function GetUnemployedModifier(city)
	return city:GetSpecialistCount(0) * UnemployedModifier;	-- 0 is SPECIALIST_CITIZEN (unemployed)
end
--------------------------------------------------------------
function GetWarModifier(city)
	if Teams[Players[city:GetOwner()]:GetTeam()]:GetAtWarCount(false) > 0 then	-- false means city states too
		return WarModifier;
	end
	return 0;
end
--------------------------------------------------------------
function GetDangerModifier(city)
	local danger = Players[city:GetOwner()]:GetPlotDanger(city:Plot());
	----print(city:GetName() .. " danger = " .. danger);
	if danger > 0 then
		return DangerModifier;
	end
	return 0;
end
--------------------------------------------------------------
function GetSiegeModifier(city)
	if city:GetDamage() > 0 then
		local p = city:GetDamage() / city:GetMaxHitPoints();
		return Round(SiegeModifier * p);
	end
	return 0;
end
--------------------------------------------------------------
function GetStarvationModifier(city)
	if city:FoodDifference() < 0 then
		local p = math.floor(100 * city:GetFood() / city:GrowthThreshold());	-- storage fill percent = 0..99
		return math.ceil(StarvationModifier / (math.sqrt(p + 1)));				-- full modifier at p=0, 1/10 at p=100
	end
	return 0;
end
--------------------------------------------------------------
function GetBaseProsperity(city)	-- local + macro prosperity
	local prosp = 0;
	prosp = prosp + GetProsperityFromProductiveness(city);
	prosp = prosp + GetProsperityFromLocalHappiness(city);
	prosp = prosp + GetProsperityFromPopulation(city);
	local player = Players[city:GetOwner()];	
	prosp = prosp + GetProsperityFromHappiness(player);
	prosp = prosp + GetProsperityFromPolicies(player);
	prosp = prosp + GetProsperityFromOrder(player);
	return prosp;
end
--------------------------------------------------------------
function GetProsperityModifier(city)
	local mod = 0;
	mod = mod + GetStarvationModifier(city);
	mod = mod + GetReligionModifier(city);
	mod = mod + GetUnemployedModifier(city);
	mod = mod + GetDangerModifier(city);	-- barbs too
	local war = GetWarModifier(city);
	mod = mod + war;
	if war ~= 0 then
		mod = mod + GetSiegeModifier(city);
	end
	mod = mod + GetFreedomModifier(Players[city:GetOwner()]);
	return mod;
end
--------------------------------------------------------------
function GetProsperity(city)	-- modifiers applied
	local val = GetBaseProsperity(city);
	local mod = GetProsperityModifier(city) / 100;
	val = val + mod * math.abs(val);
	return math.floor(val);
end
--------------------------------------------------------------
-- EMIGRATION URGE
--------------------------------------------------------------
function GetBarrierBase()
	return EmbBase;
end
--------------------------------------------------------------
function GetBarrierCS(em)
	if Players[em:GetOwner()]:IsMinorCiv() then
		return EmbCS * Game.GetCurrentEra();
	end
	return 0;
end
--------------------------------------------------------------
function GetBarrierPop(im, em)
	local imp = im:GetPopulation();
	local emp = em:GetPopulation();
	if imp > emp then
		return Round((imp - emp) * EmbPop);
	end
	return 0;
end
--------------------------------------------------------------
function GetBarrierDist(im, em)
	local d = Map.PlotDistance(im:GetX(), im:GetY(), em:GetX(), em:GetY());
	local barr = Round(math.log(d)/math.log(2) - 1);
	--print(" ", " ", "dist barrier = " .. barr);
	return barr;
end
--------------------------------------------------------------
function GetBarrierAut(em)
	local player = Players[em:GetOwner()];
	if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY) then
		return EmbAut;
	end
	return 0;
end
--------------------------------------------------------------
function GetEmigrationBarrier(im, em)
	local barr = GetBarrierBase() + GetBarrierCS(em) + GetBarrierPop(im, em) + GetBarrierDist(im, em) + GetCooldownBarrier(em) + GetBarrierAut(em);
	--print(" ", " ", "full barrier = " .. barr);
	return barr;
end
--------------------------------------------------------------
function GetUrge(im, em, imPros, emPros)
	imPros = imPros or GetProsperity(im);
	emPros = emPros or GetProsperity(em);
	local d = imPros - emPros - GetEmigrationBarrier(im, em);
	if d > 0 then
		return math.floor(math.pow(d, fDeltaExp));
	else
		return 0;	-- no urge
	end
end
--------------------------------------------------------------
function GetMigrationInfo(city)
	--print(">>>getting migration info");
	local info = { turns = nil };
	info.pair = GetPairCity(city);
	--[[
	if info.pair ~= nil then
		print("pair is " .. info.pair:GetName());
	else
		print("pair is nil");
	end
	]]--
	info.ebar = GetEmBar(city);	-- emigration bar
	--print("bar =" .. info.ebar);
	if info.pair ~= nil then
		--print(" ", "urge", "bar", "turns");
		if info.ebar == -1 then
			-- immigration
			info.urge = GetUrge(city, info.pair);
			info.ibar = GetEmBar(info.pair);	-- immigration bar
			if info.urge > 0 then
				info.turns = math.ceil((iEmigrationBar - info.ibar) / info.urge);
			end
			--print(" ", info.urge, info.ibar, info.turns);
		else
			-- emigration
			info.urge = GetUrge(info.pair, city);
			if info.urge > 0 then
				info.turns = math.ceil((iEmigrationBar - info.ebar) / info.urge);
			end
			--print(" ", info.urge, info.ebar, info.turns);
		end
	end
	return info;
end
--------------------------------------------------------------
-- CITYVIEW
--------------------------------------------------------------
function AddLine(tips, key, value)
	if value ~= 0 then
		local str = Locale.ConvertTextKey(key, value);
		if value < 0 then
			str = "[COLOR_WARNING_TEXT]" .. str .. "[ENDCOLOR]";
		end
		table.insert(tips, "[ICON_BULLET]" .. str);
	end
end
--------------------------------------------------------------
function GetMigrationTooltip(city)
	local player = Players[city:GetOwner()];
	local prospTips = {};
	
	local pair = GetPairCity(city);
	local bar = GetEmBar(city);

	if pair == nil then
		return "";
	end
	
	local im, em;

	if bar == -1 then
		im = city;
		em = pair;
		table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_IMMIGRATION_SRC", pair:GetName()));
		bar = GetEmBar(em);
	else
		im = pair;
		em = city;
		table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_EMIGRATION_DEST", pair:GetName()));
	end
	local diff = math.abs(GetProsperity(city) - GetProsperity(pair));
	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_PROSPERITY_DIFF", diff));
	
	local barr = GetEmigrationBarrier(im, em);
	if barr > 0 then
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_BASE",	GetBarrierBase());
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_REC",	GetCooldownBarrier(em));
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_DIST",	GetBarrierDist(im, em));
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_POP",	GetBarrierPop(im, em));
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_CS",		GetBarrierCS(em));
		AddLine(prospTips, "TXT_KEY_EMIGRATION_BARRIER_AUT",	GetBarrierAut(em));
		table.insert(prospTips, "----------------");
		table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_PROSPERITY_TOTAL", diff - barr));
	end

	local urge = GetUrge(im, em);	
	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_EMIGRATION_URGE", urge));
	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_EMIGRATION_PROGRESS", bar, iEmigrationBar));
	
	return table.concat(prospTips, "[NEWLINE]");
end
--------------------------------------------------------------
function GetProsperityTooltip(city)

	local player = Players[city:GetOwner()];
	local prospTips = {};

	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_ORDER", 			GetProsperityFromOrder(player));
	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_POLICIES", 			GetProsperityFromPolicies(player));
	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_HAPPINESS", 		GetProsperityFromHappiness(player));
	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_LOCAL_HAPPINESS",	GetProsperityFromLocalHappiness(city));
	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_PRODUCTIVENESS", 	GetProsperityFromProductiveness(city));
	AddLine(prospTips, "TXT_KEY_PROSPERITY_FROM_POPULATION", 		GetProsperityFromPopulation(city));
	table.insert(prospTips, "----------------");

	prosp = GetBaseProsperity(city);

	-- Modifiers
	if GetProsperityModifier(city) ~= 0 then
		table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_PROSPERITY_BASE", prosp));	-- subtotal
		table.insert(prospTips, "----------------");
		-- FREEDOM
		local modFreedom = GetFreedomModifier(player);
		if modFreedom > 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_FREEDOM", modFreedom));
		end
		-- WAR
		local modWar = GetWarModifier(city);
		if modWar < 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_WAR", modWar));
		end
		-- DANGER
		local modDanger = GetDangerModifier(city);
		if modDanger < 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_DANGER", modDanger));
		end
		-- SIEGE
		if modWar < 0 then	-- applied only in case of war
			local modSiege = GetSiegeModifier(city);
			if modSiege < 0 then
				table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_SIEGE", modSiege));
			end
		end
		-- STARVATION
		local modStarv = GetStarvationModifier(city);
		if modStarv < 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_STARVATION", modStarv));
		end
		-- RELIGION
		local modRelig = GetReligionModifier(city);
		if modRelig < 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_RELIGION", modRelig));
		end
		-- UNEMPLOYED
		local modUnemp = GetUnemployedModifier(city);
		if modUnemp < 0 then
			table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_MOD_UNEMPLOYED", modUnemp));
		end
		table.insert(prospTips, "----------------");
	end
	
	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_PROSPERITY_TOTAL", GetProsperity(city)));

	--[[
	-- emigration city list
	local infos = nil;
	for k,v in pairs(ProsperityInfos) do
		----print(k:GetID() .. " " .. k:GetName() .. "\t" .. #v .. " infos");
		if k:Plot() == city:Plot() then	-- ProsperityInfos[city] just doesn't work for some reason
			--print("found infos");
			infos = v;
			break;
		end
	end
	--print(">>> infos for " .. city:GetName() .. "");
	--if infos ~= nil then
	--	for i = 1,	#infos do 
	--		print(" ", infos[i].urge, infos[i].prosp, infos[i].city:GetName()) 
	--	end 
	--else
	--	print("infos are nil");
	--end
	if infos ~= nil and #infos > 0 then
		--print("there are emigration infos...");
		table.insert(prospTips, " ");
		table.insert(prospTips, "Emigration urge: " .. infos[1].urge .. "[ICON_MOVES]");
		table.insert(prospTips, "Better cities:");
		for i = 1, math.min(3, #infos) do
			table.insert(prospTips, "[ICON_BULLET]" .. infos[i].urge .. "[ICON_MOVES] " .. infos[i].prosp .. "[ICON_FLOWER] " .. infos[i].city:GetName());
		end
		if #infos > 3 then
			table.insert(prospTips, "...");
		end
	--else
	--	print("no infos");
	end
	-- immigration city list
	--print(">>> create an immigration city list");
	local imm = {};
	for city,infos in pairs(ProsperityInfos) do
		for i = 1, #infos do
			local info = infos[i];
			----print(city:GetName() .. " > " .. info.city:GetName() .. ", urge=" .. info.urge);
			local info = infos[i];
			if info.city:Plot() == city:Plot() then
				--print("destination city is ours!");
				table.insert(imm, { urge=info.urge, city=city, prosp=info.prosp0 });	-- not info.city but key city
				break;
			end
		end
	end
	table.sort(imm, function(c1, c2) return c1.urge > c2.urge end);
	if #imm > 0 then
		table.insert(prospTips, " ");
		table.insert(prospTips, "Possible immigration from:");
		for i = 1, math.min(3, #imm) do
			table.insert(prospTips, "[ICON_BULLET]" .. imm[i].urge .. "[ICON_MOVES] " .. imm[i].prosp .. "[ICON_FLOWER] " .. imm[i].city:GetName());
		end
	end
	--]]
	-- no emigration turns
	--local iEmigrationDice = GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent;
	--local CooldownTurns	= math.floor(GameInfo.EmigrationSettings["CooldownTurns"].Value * iEmigrationDice / 100 + .5);
	--local lastEmigrationTurn = GetSavedValue(city:Plot(), "Emigration", "lastEmigrationTurn") or -100;
	--print("emigration turn: " .. lastEmigrationTurn);
	--local turnsGone = Game.GetGameTurn() - lastEmigrationTurn;
	--print("turns gone: " .. turnsGone);
	--local safeTurns = CooldownTurns - turnsGone;
	--print("safe turns: " .. safeTurns);
	--if safeTurns > 0 then
	--	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_EMIGRATION_SAFE_TURNS", safeTurns));
	--end

	return table.concat(prospTips, "[NEWLINE]");
end
--------------------------------------------------------------