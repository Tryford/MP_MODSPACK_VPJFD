--------------------------------------------------------------
-- Emigration 6
-- Author: Mk Z
--------------------------------------------------------------
include( "MkzUtils" );
--------------------------------------------------------------
-- GENERAL RULES
--------------------------------------------------------------
local iSpeedMod = GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent;	-- 67, 100, 150, 300 (quick - marathon)
iEmigrationBar = Round(iSpeedMod * GameInfo.EmigrationSettings["EmigrationBar"].Value / 100);
fDeltaExp = GameInfo.EmigrationSettings["DeltaExponent"].Value;
iPoachBlock = GameInfo.EmigrationSettings["PoachBlock"].Value;	-- should have x more urge on a target to poach it from another city
iCooldown = Round(iSpeedMod * GameInfo.EmigrationSettings["Cooldown"].Value / 100);

--print(Pad("Speed modifier") .. iSpeedMod);
--print(Pad("Bar size")		.. iEmigrationBar);
--print(Pad("Delta exponent") .. fDeltaExp);
--print(Pad("Poach block")	.. iPoachBlock);
--print(Pad("Cooldown") 		.. iCooldown);
--------------------------------------------------------------
--	EMIGRATION BARRIERS
--------------------------------------------------------------
EmbBase	= GameInfo.EmigrationSettings["BaseReluctance"].Value;
EmbPop	= GameInfo.EmigrationSettings["PerExtraPop"].Value;
EmbCS	= GameInfo.EmigrationSettings["CityState"].Value;
EmbRec	= GameInfo.EmigrationSettings["RecentEmigration"].Value;
EmbAut	= GameInfo.EmigrationSettings["AutocracyBarrier"].Value;

--print("Emigration barriers:");
--print(Pad("> Base reluctance")	.. EmbBase);
--print(Pad("> Per extra pop")	.. EmbPop);
--print(Pad("> City state bonus")	.. EmbCS);
--print(Pad("> Recent emigration").. EmbRec);
--print(Pad("> Autocracy barrier").. EmbAut);
--------------------------------------------------------------