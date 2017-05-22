--------------------------------------------------------------
-- Emigration 6
-- Author: Mk Z
--------------------------------------------------------------
--print("************* EMIGRATION MOD LOADED *************");
--------------------------------------------------------------
include( "Prosperity.lua" );		-- includes MkzUtils, EmigrationDummies, EmigrationRules
include( "MkzReligion.lua" );
include( "Refugees.lua" ); 
--------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------
function GetProsperityRating(player)
	local prosperityRating = {};	-- list of the cities of the world ordered by prosperity: {prosp, city}
	for n, ownr in pairs(Players) do
		if IsValid(ownr) and (player == ownr or MetAndNoWar(player, ownr)) then
			for city in ownr:Cities() do
				if not city:IsRazing() then	-- and not city:IsResistance()
					table.insert(prosperityRating, 
					{
						pros = GetProsperity(city), 
						city = city,
						pair = GetPairCity(city),
						ebar = GetEmBar(city),
						ownr = ownr,
					});
				end
			end
		end
	end
	table.sort(prosperityRating, function(c1, c2) return c1.pros > c2.pros end);	-- sort cities by prosperity in descending order
	return prosperityRating;
end
--------------------------------------------------------------
function Migration(iPlayer)		-- executed at the start of an each player's turn
	local player = Players[iPlayer];
	--print("\n\n********** " .. GetPlayerName(player) .. " turn " .. Game.GetGameTurn());	
	
	local routes = {};	-- migration by possible trade routes
	--print("available routes: ");
	for i,v in ipairs(player:GetTradeRoutesAvailable()) do
		if routes[v.FromCity] == nil then 
			routes[v.FromCity]={}; 
		end
		routes[v.FromCity][v.ToCity] = true;
		--print(" ", Pad(v.FromCityName), Pad(v.ToCityName), v.Domain);
	end

	local rating = GetProsperityRating(player);
	for i = 1, #rating do
		local entry = rating[i];
		--print(entry.pros, Pad(entry.city:GetName()), entry.ebar);
		if entry.ownr == player then
			--print("its our city");
			DecCooldown(entry.city);
			--if entry.pair ~= nil then
			--	print("has a pair: " .. entry.pair:GetName());
			--end
			-- CLEAR BAR
			if entry.ebar > -1 and entry.pair == nil and entry.pros > 0 then
				local change = math.ceil(math.pow(entry.pros, fDeltaExp));
				--print("no pair, clear the bar", entry.ebar, -1 * change);
				SetEmBar(entry.city, math.max(-1, entry.ebar - change));
			-- FIND A PAIR
			elseif entry.ebar == -1 and entry.pair == nil and entry.pros > 0 and entry.city:FoodDifference() >= 2 and not entry.city:IsForcedAvoidGrowth() then
				--print("find a pair");
				local best = { urge = 0 };
				for j = i+1, #rating do
					local src = rating[j];
					--print(" ", src.city:GetName());
					if routes[entry.city] ~= nil and (routes[entry.city][src.city] or false) then	-- trade route available?
						--print(" ", " ", "trade route available");
						local urge = GetUrge(entry.city, src.city, entry.pros, src.pros);
						--print(" ", " ", "urge=" .. urge);
						if urge > best.urge and src.city:GetPopulation() > 1 and
						(GetSavedUrge(src.city) == 0 or urge >= GetSavedUrge(src.city) + iPoachBlock) then	-- free or can poach from the current pair
							--print(" ", "free or can poach");
							best.urge = urge;
							best.entry = src;
						end
					end
				end
				if best.urge > 0 then
					BreakPair(best.entry.city);	-- snatch a city if already has a pair
					SetPair(entry.city, best.entry.city, best.urge);
					--print("pair is " .. GetPairCity(entry.city):GetName() .. ", urge=" .. best.urge);
				--else
				--	print("no pair found");
				end
			-- FILL THE BAR (AND DO EMIGRATION)
			elseif entry.ebar == -1 and entry.pair ~= nil then
				local urge = GetUrge(entry.city, entry.pair, entry.pros);
				--print("urge=" .. urge);
				if urge == 0 or entry.pair:GetPopulation() == 1 or entry.city:IsForcedAvoidGrowth() then
					BreakPair(entry.city);
				else
					local prog = GetEmBar(entry.pair) + urge;
					if prog >= iEmigrationBar then
						-- do emigration
						MoveCitizen(entry.pair, entry.city);
						SetCooldown(entry.pair);
						SetEmBar(entry.pair, -1);
						BreakPair(entry.city);
					else
						--print("fill the bar, b=" .. prog);
						-- fill bar
						SetEmBar(entry.pair, prog);
						SaveUrge(entry.pair, urge);
					end
				end	-- checking delta
			end -- switch state
		end	-- its our city
	end	-- do rating loop
end
--------------------------------------------------------------
function MoveCitizen(fromCity, toCity)
	local fromPlayer= Players[fromCity:GetOwner()];
	local toPlayer = Players[toCity:GetOwner()];

	--print("religious migration!");
	--PrintFollowers(fromCity);
	local iRel = RemoveRandomFollower(fromCity);
	fromCity:SetPopulation(fromCity:GetPopulation() - 1, true);
	RecomputeFollowers(fromCity);
	--print("follower distribution after emigration: ");
	--PrintFollowers(fromCity);
	
	--print(">>> immigration:");
	--PrintFollowers(toCity);
	AddFollowerSafe(iRel, toCity);
	toCity:SetPopulation(toCity:GetPopulation() + 1, true);
	RecomputeFollowers(toCity);
	--print("follower distribution after immigration:");
	--PrintFollowers(toCity);

	-- create a notification to the player:
	local sIcon = "";
	if iRel > -1 then
		sIcon = GameInfo.Religions[iRel].IconString;
	end
	if fromPlayer:IsHuman() and fromPlayer ~= toPlayer then	-- show only in case of foreign emigration
		local destination = GetPlayerName(toPlayer);
		local smr = Locale.ConvertTextKey("TXT_KEY_EMIGRATION_SUMMARY", sIcon, fromCity:GetName(), destination);
		local txt = Locale.ConvertTextKey("TXT_KEY_EMIGRATION_TEXT", destination);
		fromPlayer:AddNotification(NotificationTypes.NOTIFICATION_STARVING, smr, txt, fromCity:GetX(), fromCity:GetY());
	elseif toPlayer:IsHuman() then
		local source = fromCity:GetName();
		if fromPlayer ~= toPlayer and not fromPlayer:IsMinorCiv() then
			source = source .. ", " .. GetPlayerName(fromPlayer);
		end
		local smr = Locale.ConvertTextKey("TXT_KEY_IMMIGRATION_SUMMARY", sIcon, source, toCity:GetName());
		local txt = Locale.ConvertTextKey("TXT_KEY_IMMIGRATION_TEXT", source);
		toPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_GROWTH, smr, txt, toCity:GetX(), toCity:GetY());
	end
	--print("a citizen was moved");
end
--------------------------------------------------------------
function BreakPairsOnWarDeclared(teamA, teamB, bWar)
	if bWar then
		for n, p in pairs(Players) do
			if p:GetTeam() == teamA then
				for city in p:Cities() do
					local pair = GetPairCity(city);
					if pair ~= nil then
						local teamX = Players[pair:GetOwner()]:GetTeam();
						if teamX == teamB then
							BreakPair(city);
						end
					end
				end
			end
		end
	end
end
--------------------------------------------------------------
GameEvents.PlayerDoTurn.Add( Migration );
Events.WarStateChanged.Add( BreakPairsOnWarDeclared );
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function hasSOL(player)
	return player:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_STATUE_OF_LIBERTY) > 0;
end
--------------------------------------------------------------
function IsValid(player)	-- this player is in game
	return player ~= nil and player:IsAlive();
end
--------------------------------------------------------------
function GetPlayerName(player)	-- get player's name for notification
	if player:IsMinorCiv() then
		local minorCivType = player:GetMinorCivType();
		local minorCivInfo = GameInfo.MinorCivilizations[minorCivType];
		return Locale.ConvertTextKey(minorCivInfo.Description);
	end
	local iCivType = player:GetCivilizationType();
	local civInfo = GameInfo.Civilizations[iCivType];			
	return Locale.ConvertTextKey(civInfo.Description);	
end
--------------------------------------------------------------
function MetAndNoWar(playerA, playerB)
	if playerA == playerB then
		return true;
	end
	local teamA = Teams[playerA:GetTeam()];
	local teamB = playerB:GetTeam();	-- id
	return teamA:IsHasMet(teamB) and not teamA:IsAtWar(teamB);
end
--------------------------------------------------------------