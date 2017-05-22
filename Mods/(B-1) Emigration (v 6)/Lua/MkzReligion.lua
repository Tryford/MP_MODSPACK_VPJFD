-- Religion
-- Author: Mk Z
-- DateCreated: 3/16/2016 2:43:26 PM
--------------------------------------------------------------
include("MkzUtils");
--------------------------------------------------------------
local numRels = -1;	-- not counting pantheon
for rel in GameInfo.Religions() do
	numRels = numRels + 1;
end
--print("Religions=" .. numRels);
--------------------------------------------------------------
function GetReligions(city)	-- table of { [id] = followers }
	local rels = {};
	for i = -1, numRels do
		local f = city:GetNumFollowers(i);
		if f > 0 then
			table.insert(rels, { id = i, followers = f });
		end
	end
	return rels;
end
--------------------------------------------------------------
function PrintFollowers(city)
	print(">>> " .. Pad(city:GetName()) .. " sz " .. city:GetPopulation());
	for id = -1, numRels do
		local f = city:GetNumFollowers(id);
		if f > 0 then
			print("\t\t" .. id .. "\t" .. f);
		end
	end
end
--------------------------------------------------------------
function RecomputeFollowers(city)
	city:ConvertPercentFollowers(-1, -1, 0);
end
--------------------------------------------------------------
function RemoveRandomFollower(city)	-- returns chosen religion id
	local p = city:GetPopulation();
	local rels = GetReligions(city);
	local iRel = rels[Map.Rand(#rels, "Emigration - Determine migrant religion") + 1].id;
	--print("iRel="..iRel);
	local af = city:GetNumFollowers(-1);	-- atheism followers
	local pf = city:GetNumFollowers(0);		-- pantheon followers
	-- in case there is pantheon save it to atheism so it could survive:
	if pf > 0 then
		if af > 0 then
			rels[1].followers = af + pf;	-- increase atheism followers
			table.remove(rels, 2);			-- remove pantheon
		else	-- no atheism?
			table.remove(rels, 1);	-- rels[1] should be pantheon, remove it
			table.insert(rels, { id = -1, followers = pf });	-- add atheism
		end
		city:ConvertPercentFollowers(-1, 0, 100);
		--print("convert pantheon to atheism:");
		--PrintFollowers(city);
	end
	-- if we chose pantheon:
	local bPantheon = false;
	if iRel == 0 then
		iRel = -1; 
		bPantheon = true;
	end
	-- make all the conversions:
	local f = city:GetNumFollowers(iRel);
	local x=(f-p)/(1-p)/f;	-- x% points from iRel should be transfered to other rels
	--print("x="..x);
	local corr = 1;	-- correction to diminishing iRel points
	for i,rel in ipairs(rels) do
		if rel.id ~= iRel then
			--print("corr="..corr);
			local conv = x * corr * rel.followers / (p - f);	-- conversion percent
			--print("conv="..conv);
			city:ConvertPercentFollowers(rel.id, iRel, Round(conv * 100));
			corr = corr * (1 + conv);	-- update correction
		end
	end
	-- recover pantheon
	if pf > 0 then
		local conv = 0;
		if bPantheon then
			iRel = 0;	-- was set to -1 previously to save pantheon
			conv = (pf-1)/(pf-1+af);
		elseif iRel == -1 then
			conv = pf/(pf+af-1);
		else -- a major religion
			conv = pf/(pf+af);
		end
		if conv > 0 then
			--print("restore pantheon");
			--print("conv="..conv);
			city:ConvertPercentFollowers(0, -1, Round(conv * 100));
		end
	end
	return iRel;
end
--------------------------------------------------------------
function AddFollower(iRel, city)
	local p = city:GetPopulation();
	local conv = Round(100 / p);
	for id = -1, numRels do
		city:ConvertPercentFollowers(iRel, id, conv);
	end
end
--------------------------------------------------------------
function AddFollowerSafe(iRel, city)	-- takes care of pantheon
	local af = city:GetNumFollowers(-1);
	local pf = city:GetNumFollowers(0);
	local p = city:GetPopulation() + 1;	-- after migration
	if iRel == -1 then
		AddFollower(-1, city);
	elseif iRel == 0 then
		local player = Players[city:GetOwner()];
		if player:HasCreatedPantheon() or player:HasCreatedReligion() then
			AddFollower(0, city);
		else
			AddFollower(-1, city);
		end
	else
		if pf == 0 then
			AddFollower(iRel, city);
		else
			-- there are some pantheon followers in the city!
			-- the only special case, requires to save pantheon in atheism while reilgion is spread

			local convPA = Round(100*(1+1/pf));	-- convert pantheon to atheism
			--print("convPA="..convPA);
			city:ConvertPercentFollowers(-1, 0, convPA);

			local convAR = Round(100/(af+pf+1));	-- atheism to religion
			--print("convAR="..convAR);
			city:ConvertPercentFollowers(iRel, -1, convAR);

			local convAP = Round(100*pf/(af+pf));	-- convert atheism to pantheon
			--print("convAP="..convAP);
			city:ConvertPercentFollowers(0, -1, convAP);
		end
	end
end
--------------------------------------------------------------