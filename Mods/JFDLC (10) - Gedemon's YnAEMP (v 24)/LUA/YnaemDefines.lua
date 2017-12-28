-- Ynaem
-- Author: Gedemon
-- DateCreated: 11/3/2010
--------------------------------------------------------------

--print ("---- Loading YnAEMP defines -----")

-- Get YnAEMP related mods
defaultCSModID = "53da86d6-4a0d-4f92-a489-4d1a7fb7cd30"
madeiraCSModID = "9f6d56dd-d653-4c8a-b3a7-4a30582c86c2"
extendedCSModID = "77214b67-d97a-4359-bfe6-b534905528f1"
dynamicModID = "97837c72-d198-49d2-accd-31101cfc048a"

-- Used to find YnAEMP mod files (basically : maps files)
YnaemModId = "36e88483-48fe-4545-b85f-bafc50dde315"
YnaemModVersion = Modding.GetActivatedModVersion(YnaemModId)

g_defaultCS = 0
g_madeiraCS = 0
g_extendedCS = 0
g_dynamicCS = 0
g_dynamicMod = false
g_bBadCS = false

local unsortedInstalledMods = Modding.GetInstalledMods()
for key, modInfo in pairs(unsortedInstalledMods) do
	for k, v in pairs(modInfo) do
		if modInfo.Enabled then
			--print (k)
			if modInfo.ID == defaultCSModID then
				g_defaultCS = 1
			end
			if modInfo.ID == madeiraCSModID then
				g_madeiraCS = 1
			end
			if modInfo.ID == extendedCSModID then
				g_extendedCS = 1
			end
			if modInfo.ID == dynamicModID then
				g_dynamicCS = 1
				g_dynamicMod = true
			end
		end
	end
end

-- more than one CS mod activated ?
if ( g_defaultCS + g_madeiraCS + g_extendedCS + g_dynamicCS > 1 ) then
	g_bBadCS = true
end


-- use mod data to save / load data between game initialisation phases
dynHistModVersion = Modding.GetLatestInstalledModVersion(dynamicModID) -- use DynHist mod ID for components intercompatibility
modUserData = Modding.OpenUserData(dynamicModID, dynHistModVersion)

-- map type
GIANT_EARTH = 1
HUGE_EARTH = 2
LARGE_GREATEST_EARTH = 3
STANDARD_CORDIFORM_EARTH = 4
GIANT_EUROPE = 5
LARGE_EUROPE = 6
NORTHWEST_EUROPE = 7
LARGE_AFRICA = 8
WEST_AFRICA = 9
AMERICAS = 10
ASIA = 11
EAST_ASIA = 12
NORTHEAST_ASIA = 13
NORTH_ATLANTIC = 14
AEGEAN = 15
APENNINE = 16
BRITISH_ISLES = 17
CARIBBEAN = 18
MEDITERRANEAN = 19
MESOPOTAMIA = 20
NILE_VALLEY = 21
PACIFIC = 22
SOUTH_PACIFIC = 23
MESOPOTAMIA_GIANT = 24
ASIA_SMALL = 25 -- re-test
LARGE_EUROPE_NEW = 26
ADRIATIC = 27
CAUCASUS = 28
ASIA_MONGOL_STEPPE = 29
CENTRAL_ASIA = 30
EASTERN_EUROPE = 31
NORTH_SEA_EUROPE = 32
AFRICA_ASIA_OCEANIA = 33
AFRICA_SOUTH_EUROPE = 34
AFRICA_GIANT = 35
SOUTH_AMERICA_GIANT = 36
AUSTRALIA_SOUTHEAST_ASIA = 37
INDIAN_OCEAN = 38
AMERICAS_GIANT = 39
INDIA_GIANT = 40
SOUTH_CENTRAL_AMERICA_HUGE = 41
SOUTH_CENTRAL_AMERICA_GIANT = 42
SCOTLAND_IRELAND_HUGE = 43
SOUTH_AMERICA_LARGE = 44
ASIA_SOUTH_HUGE = 45
SOUTH_PACIFIC_GIANT = 46
NORTH_AMERICA_GIANT = 47
NORTH_AMERICA_HUGE = 48
STANDARD_EARTH = 49



-- List of available maps
-- todo: ID as index
if ( g_madeiraCS == 1 ) then
	local str = "[NEWLINE]No other map available for Madeira's CS"
	g_MapList = { 
		[GIANT_EARTH] = { ID = GIANT_EARTH, File = "Earth_Giant_blank.Civ5Map", Name = "Giant Earth", Description = "180x96 giant earth" .. str, Size = "WORLDSIZE_HUGE", Civs = 20, Minors = 36, TablePrefix = "Yagem" },
	}
elseif ( g_dynamicCS == 1 ) then
	local str = "[NEWLINE]Limited list for Dynamic History"
	g_MapList = { 
		[GIANT_EARTH] = { ID = GIANT_EARTH, File = "Earth_Giant_blank.Civ5Map", Name = "Giant Earth", Description = "180x96 giant earth" .. str, Size = "WORLDSIZE_HUGE", Civs = 20, Minors = 36, TablePrefix = "Yagem" },
		[LARGE_EUROPE] = { ID = LARGE_EUROPE, File = "Europe_Large_blank.Civ5Map", Name = "Large Europe", Description = "79x73 large Europe by Dieter VonClam" .. str, Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "EuroLarge" },
	}
else
	g_MapList = { 
		[GIANT_EARTH] = { ID = GIANT_EARTH, File = "Earth_Giant_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "180x96 Earth, conversion of Genghis Kai's GEM for civ4", Size = "WORLDSIZE_HUGE", Civs = 22, Minors = 41, TablePrefix = "Yagem",},
		[HUGE_EARTH] = { ID = HUGE_EARTH, File = "Earth_Huge_blank.Civ5Map", 	Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "120x80 Earth by Dale with enlarged Europe", Size = "WORLDSIZE_HUGE", Civs = 18, Minors = 20, TablePrefix = "Yahem" },
		[LARGE_GREATEST_EARTH] = { ID = LARGE_GREATEST_EARTH, File = "Earth_Greatest_Large_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Greatest ([COLOR_CYAN]Large[ENDCOLOR])", Description = "104x64 Earth by djvandyke, with massively rescaled regions for better Gameplay", Size = "WORLDSIZE_LARGE", Civs = 22, Minors = 16, TablePrefix = "GreatestEarth" },
		[STANDARD_EARTH] = { ID = EARTH_STANDARD, File = "Earth_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "Standard Earth by Greizer85", Size = "WORLDSIZE_STANDARD", Civs = 10, Minors = 8, TablePrefix = "EarthStandard" },
		[STANDARD_CORDIFORM_EARTH] = { ID = STANDARD_CORDIFORM_EARTH, File = "Earth_Standard_Cordiform_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Cordiform ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "80x52 standard Earth using Werner projection by smellymummy", Size = "WORLDSIZE_STANDARD", Civs = 12, Minors = 12, TablePrefix = "Cordiform" },
		[AFRICA_ASIA_OCEANIA] = { ID = AFRICA_ASIA_OCEANIA, File = "Africa_Asia_Oceania_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Africa, Asia, & Aus. ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "128x80 huge Africa, Asia & Australia (Oceania)", Size = "WORLDSIZE_HUGE", Civs = 12, Minors = 12, TablePrefix = "AfriAsiaAust" },
		[AFRICA_SOUTH_EUROPE] = { ID = AFRICA_SOUTH_EUROPE, File = "Africa_Southern_Europe_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] & Southern Europe ([COLOR_CYAN]Large[ENDCOLOR])", Description = "128x80 large Africa & Southern Europe", Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "AfriSouthEuro" },
		[AFRICA_GIANT] = { ID = AFRICA_GIANT, File = "Africa_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Africa[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "140x140 giant Africa by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 9, Minors = 10, TablePrefix = "AfriGiant" },
		[GIANT_EUROPE] = { ID = GIANT_EUROPE, File = "Europe_Giant_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "166x118 Europe by Damasc", Size = "WORLDSIZE_HUGE", Civs = 18, Minors = 24, TablePrefix = "EuroGiant" },
		[LARGE_EUROPE] = { ID = LARGE_EUROPE, File = "Europe_Large_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe[ENDCOLOR] ([COLOR_CYAN]Large[ENDCOLOR])", Description = "79x73 Europe by Dieter VonClam", Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "EuroLarge" },
		[LARGE_EUROPE_NEW] = { ID = LARGE_EUROPE_NEW, File = "Europe_Greatest_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Greatest ([COLOR_CYAN]Large[ENDCOLOR])", Description = "86x76 Europe by JanBoruta", Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "EuroLargeNew" },
		[EASTERN_EUROPE] = { ID = EASTERN_EUROPE, File = "Eastern_Europe_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Eastern ([COLOR_CYAN]Large[ENDCOLOR])", Description = "103x80 Europe by Lungora", Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "EuroEastern" },
		[NORTH_SEA_EUROPE] = { ID = NORTH_SEA_EUROPE, File = "North_Sea_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] North Sea ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "127x80 huge North Sea map by Lungora", Size = "WORLDSIZE_STANDARD", Civs = 10, Minors = 8, TablePrefix = "NorthSeaEurope" },
		[NORTHWEST_EUROPE] = { ID = NORTHWEST_EUROPE, File = "Europe_North_West_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] North-West ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "56x67 standard North-West Europe by jordie", Size = "WORLDSIZE_STANDARD", Civs = 10, Minors = 8, TablePrefix = "NorthWestEurope" },
		[AEGEAN] = { ID = AEGEAN, File = "Aegean_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Aegea/Greece ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "61x51 Aegean by Evanescence", Size = "WORLDSIZE_STANDARD", Civs = 3, Minors = 14, TablePrefix = "Aegean" },
		[APENNINE] = { ID = APENNINE, File = "Apennine_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Apennine/Italy ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "60x58 Apennine by Evanescence", Size = "WORLDSIZE_STANDARD", Civs = 3, Minors = 6, TablePrefix = "Apennine" },
		[BRITISH_ISLES] = { ID = BRITISH_ISLES, File = "British_Isles_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Great Britain ([COLOR_CYAN]Standard[ENDCOLOR]])", Description = "61x74 British Isles by Firaxis", Size = "WORLDSIZE_STANDARD", Civs = 3, Minors = 0, TablePrefix = "BritishIsles" },
		[MEDITERRANEAN] = { ID = MEDITERRANEAN, File = "Mediterranean_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Mediterranean ([COLOR_CYAN]Large[ENDCOLOR])", Description = "103x64 Mediterranean", Size = "WORLDSIZE_LARGE", Civs = 13, Minors = 20, TablePrefix = "Mediterranean" },
		[ADRIATIC] = { ID = ADRIATIC, File = "Adriatic_Sea_Balkans_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Balkans ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "103x64 Adriatic Sea by Lungora", Size = "WORLDSIZE_HUGE", Civs = 2, Minors = 0, TablePrefix = "Adriatic" },
		[ASIA] = { ID = ASIA, File = "Asia_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia[ENDCOLOR] ([COLOR_CYAN]Large[ENDCOLOR])", Description = "104x64 Asia", Size = "WORLDSIZE_LARGE", Civs = 8, Minors = 14, TablePrefix = "Asia" },
		[ASIA_SMALL] = { ID = ASIA_SMALL, File = "Asia_East_Small.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] East ([COLOR_CYAN]Small[ENDCOLOR])", Description = "57x48 East Asia by ?", Size = "WORLDSIZE_SMALL", Civs = 5, Minors = 8, TablePrefix = "AsiaSmall" },
		[EAST_ASIA] = { ID = EAST_ASIA, File = "Asia_South_East_Large_blank.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] South East ([COLOR_CYAN]Large[ENDCOLOR])", Description = "80x80 East Asia", Size = "WORLDSIZE_LARGE", Civs = 6, Minors = 9, TablePrefix = "EastAsia" },
		[AUSTRALIA_SOUTHEAST_ASIA] = { ID = AUSTRALIA_SOUTHEAST_ASIA, File = "Australasia_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] Australia & S-E Asia ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "140x135 Australia & South East Asia by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 2, Minors = 4, TablePrefix = "AustralasiaGiant" },
		[NORTHEAST_ASIA] = { ID = NORTHEAST_ASIA, File = "Asia_North_East_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] North-East ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "64x56 North-East Asia by Evanescence", Size = "WORLDSIZE_STANDARD", Civs = 3, Minors = 1, TablePrefix = "NorthEastAsia" },
		[ASIA_MONGOL_STEPPE] = { ID = ASIA_MONGOL_STEPPE, File = "Mongol_Steppe_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Steppes ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "180x94 Central Asia (Mongol Steppe) by Lungora", Size = "WORLDSIZE_HUGE", Civs = 3, Minors = 1, TablePrefix = "AsiaSteppeGiant" },
		[CAUCASUS] = { ID = CAUCASUS, File = "Caucasus_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Caucasus ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "180x94 Caucasus by Lungora", Size = "WORLDSIZE_HUGE", Civs = 8, Minors = 12, TablePrefix = "Caucasus" },
		[CENTRAL_ASIA] = { ID = CENTRAL_ASIA, File = "Central_Asia_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Central ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "128x80 Central Asia by Lungora", Size = "WORLDSIZE_HUGE", Civs = 8, Minors = 12, TablePrefix = "CentralAsia" },
		[NORTH_ATLANTIC] = { ID = NORTH_ATLANTIC, File = "North_Atlantic_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Atlantic ([COLOR_CYAN]Large[ENDCOLOR])", Description = "106x58 North Atlantic", Size = "WORLDSIZE_LARGE", Civs = 18, Minors = 19, TablePrefix = "NorthAtlantic" },
		[PACIFIC] = { ID = PACIFIC, File = "Pacific_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] Pacific ([COLOR_CYAN]Large[ENDCOLOR])", Description = "115x80 Pacific by kevincbryan", Size = "WORLDSIZE_LARGE", Civs = 8, Minors = 13, TablePrefix = "Pacific" },
		[SOUTH_PACIFIC] = { ID = SOUTH_PACIFIC, File = "South_Pacific_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "100x96 South Pacific by Firaxis", Size = "WORLDSIZE_HUGE", Civs = 1, Minors = 14, TablePrefix = "SouthPacific" },
		[INDIAN_OCEAN] = { ID = INDIAN_OCEAN, File = "Indian_Ocean_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Indian Ocean ([COLOR_CYAN]Large[ENDCOLOR])", Description = "97x72 Indian Ocean", Size = "WORLDSIZE_LARGE", Civs = 8, Minors = 14, TablePrefix = "IndianOcean" },
		[AMERICAS] = { ID = AMERICAS, File = "Americas_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "67x80 Americas (North+South) by ?", Size = "WORLDSIZE_STANDARD", Civs = 16, Minors = 6, TablePrefix = "Americas" },
		[SOUTH_AMERICA_GIANT] = { ID = SOUTH_AMERICA_GIANT, File = "South_America_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR][ENDCOLOR] South ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "South America by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 10, Minors = 8, TablePrefix = "SouthAmericaGiant" },
		[CARIBBEAN] = { ID = CARIBBEAN, File = "Caribbean_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] Caribbean ([COLOR_CYAN]Large[ENDCOLOR])", Description = "100x70 Caribbean by Firaixs", Size = "WORLDSIZE_LARGE", Civs = 8, Minors = 2, TablePrefix = "Caribbean" },
		[MESOPOTAMIA_GIANT] = { ID = MESOPOTAMIA_GIANT, File = "Mesopotamia_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Mesopotamia ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "180x94 Levant by Lungora", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 6, TablePrefix = "MesopotamiaGiant" },
		[MESOPOTAMIA] = { ID = MESOPOTAMIA, File = "Mesopotamia_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Mesopotamia ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "80x50 Mesopotamia", Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 7, TablePrefix = "Mesopotamia" },
		[LARGE_AFRICA] = { ID = LARGE_AFRICA, File = "Africa_Standard.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", Description = "65x74 Africa by jordie", Size = "WORLDSIZE_LARGE", Civs = 6, Minors = 24, TablePrefix = "AfricaLarge" },
		[NILE_VALLEY] = { ID = NILE_VALLEY, File = "NileValley_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Nile Valley ([COLOR_CYAN]Large[ENDCOLOR])", Description = "81x80 Nile Valley by Admiral Ackbar", Size = "WORLDSIZE_LARGE", Civs = 6, Minors = 10, TablePrefix = "NileValley" },
		[WEST_AFRICA] = { ID = WEST_AFRICA, File = "West_Africa_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] West ([COLOR_CYAN]Large[ENDCOLOR])", Description = "101x80 West Africa by Lungora", Size = "WORLDSIZE_LARGE", Civs = 6, Minors = 10, TablePrefix = "WestAfrica" },
		[AMERICAS_GIANT] = { ID = AMERICAS_GIANT, File = "Americas_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "Giant Americas by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "AmericasGiant" },
		[INDIA_GIANT] = { ID = INDIA_GIANT, File = "India_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] India ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "Giant Indian Subcontinent by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "IndiaGiant" },
		[SOUTH_CENTRAL_AMERICA_HUGE] = { ID = SOUTH_CENTRAL_AMERICA_HUGE, File = "South_America_Central_America_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South & Central ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "South & Central America Huge by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "SouthAmericaCentralHuge" },
		[SOUTH_CENTRAL_AMERICA_GIANT] = { ID = SOUTH_CENTRAL_AMERICA_GIANT, File = "South_America_Central_America_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South & Central ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "South & Central America Giant by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "SouthAmericaCentralGiant" },
		[SCOTLAND_IRELAND_HUGE] = { ID = SCOTLAND_IRELAND_HUGE, File = "Scotland_Ireland_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Scotland & Ireland ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "Scotland and Ireland by Lungora", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "ScotlandIrelandHuge" },
		[SOUTH_AMERICA_LARGE] = { ID = SOUTH_AMERICA_LARGE, File = "South_America_Large.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South ([COLOR_CYAN]Large[ENDCOLOR])", Description = "South America Large by Imperator/Elite999", Size = "WORLDSIZE_LARGE", Civs = 6, Minors = 10, TablePrefix = "SouthAmericaLarge" },
		[ASIA_SOUTH_HUGE] = { ID = ASIA_SOUTH_HUGE, File = "Asia_South_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "South Asia by ???", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "SouthAsiaHuge" },
		[SOUTH_PACIFIC_GIANT] = { ID = SOUTH_PACIFIC_GIANT, File = "South_Pacific_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "South Pacific Giant by Lungora", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "SouthPacificGiant" },
		[NORTH_AMERICA_GIANT] = { ID = NORTH_AMERICA_GIANT, File = "North_America_Giant.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] North ([COLOR_CYAN]Giant[ENDCOLOR])", Description = "Giant North America by Imperator/Elite999", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "NorthAmericaGiant" },
		[NORTH_AMERICA_HUGE] = { ID = NORTH_AMERICA_HUGE, File = "North_America_Huge.Civ5Map", Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] North ([COLOR_CYAN]Huge[ENDCOLOR])", Description = "Huge North America by Lungora", Size = "WORLDSIZE_HUGE", Civs = 6, Minors = 10, TablePrefix = "NorthAmericaHuge" },

	}
end

-- Bosphorus Strait position
-- x, y are plot coordinate, replX and replY the replacement plot for any civ starting here
-- riverX, riverY are the coordinate of the plot NW or W to the strait as a river (see position)
g_BosphorusPlot = { 
	[GIANT_EARTH] = {x=31, y=59, replX=32, replY=59, riverX=31, riverY=60, position = "NW"},
	[HUGE_EARTH] = {x=69, y=54, replX=69, replY=53, riverX=69, riverY=54, position = "NW"},
	[STANDARD_CORDIFORM_EARTH] = {x=45, y=24, replX=45, replY=23, riverX=44, riverY=24, position = "W"},
	[LARGE_EUROPE] = {x=53, y=31, replX=54, replY=31, riverX=53, riverY=31, position = "W-NW"},
	[LARGE_GREATEST_EARTH] = {x=58, y=45, replX=59, replY=45, riverX=57, riverY=45, position = "W"},
	[GIANT_EUROPE] = {x=110, y=34, replX=110, replY=33, riverX=110, riverY=34, position = "W-NW"},
	[MESOPOTAMIA_GIANT] = {x=19, y=91, replX=20, replY=91, riverX=19, riverY=91, position = "W-NW"},
	[LARGE_EUROPE_NEW] = {x=59, y=23, replX=58, replY=23, riverX=58, riverY=23, position = "W"},
	[CAUCASUS] = {x=44, y=39, replX=43, replY=39, riverX=43, riverY=39, position = "W"},
	[AFRICA_SOUTH_EUROPE] = {x=51, y=71, replX=51, replY=72, riverX=51, riverY=72, position = "NW"},
	[AFRICA_ASIA_OCEANIA] = {x=39, y=74, replX=40, replY=74, riverX=39, riverY=74, position = "W"},
}

-- Natural Wonder renaming
g_NaturalWonderName = { 
	[GIANT_EARTH] = {},
	[HUGE_EARTH] = {},
	[STANDARD_EARTH] = {},
	[STANDARD_CORDIFORM_EARTH] = {},
	[LARGE_EUROPE] = { TXT_KEY_FEATURE_VOLCANO = "Santorini", TXT_KEY_FEATURE_REEF = "Coral Reef", TXT_KEY_FEATURE_GEYSER = "The Great Geysir", TXT_KEY_FEATURE_CRATER = "Tin Bider crater", TXT_KEY_FEATURE_POTOSI = "The Great Copper Mountain" },
	[LARGE_GREATEST_EARTH] = {},
	[GIANT_EUROPE] = { 
		TXT_KEY_FEATURE_VOLCANO = "Santorini",
		TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT = "Santorini is an island located in the southern Aegean Sea. The island is the site of one of the largest volcanic eruptions in recorded history: the Minoan eruption, sometimes called the Thera eruption, which occurred some 3600 years ago at the height of the Minoan civilization. The eruption left a large caldera surrounded by volcanic ash deposits hundreds of feet deep and may have led indirectly to the collapse of the Minoan civilization on the island of Crete, 110 km to the south, through a gigantic tsunami. Another popular theory holds that the Thera eruption is the source of the legend of Atlantis.",		
		TXT_KEY_FEATURE_REEF = "The Sula Reef",
		TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT = "The Sula Reef is a deep-water coral reef off the coast of Norway. It is located on the Sula Ridge, named after the island of Sula. The reef is generated by the coral Lophelia pertusa. It has a length extension of about thirteen kilometers, and is 700 meters wide. The thickness of the reef is up to 35 meters. Until the discovery of the Røst Reef in 2002, the Sula Reef was the world's largest known Lophelia reef.",
		TXT_KEY_FEATURE_GEYSER = "The Great Geysir",
		TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT = "Geysir sometimes known as The Great Geysir, is a geyser in southwestern Iceland. It was the first geyser described in a printed source and the first known to modern Europeans. The English word geyser (a periodically spouting hot spring) derives from Geysir. The name Geysir itself is derived from the Icelandic verb geysa. Geysir lies in the Haukadalur valley on the slopes of Laugarfjall hill, which is also the home to Strokkur geyser about 50 metres south.",
		TXT_KEY_FEATURE_CRATER = "Tin Bider crater",
		TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT = "Tin Bider is an impact crater that sits in dry, rugged terrain in Algeria. The crater was formed in the last 70 million years, perhaps in the late Cretaceous or early Tertiary Period. Spanning 6 kilometres, the crater sits at the southern end of a range of hills. The elevated position and concentric rings of Tin Bider suggest that its structure is complex.",
		TXT_KEY_FEATURE_POTOSI = "The Great Copper Mountain",
		TXT_KEY_CIV5_FEATURES_POTOSI_TEXT =  "Falun Mine was a mine in Falun, Sweden, that operated for a millennium from the 10th century to 1992. It produced as much as two thirds of Europe's copper needs and helped fund many of Sweden's wars in the 17th century. Technological developments at the mine had a profound influence on mining globally for two centuries. Since 2001 it has been designated a UNESCO world heritage site as well as a museum.",
		TXT_KEY_FEATURE_MT_FUJI = "Mt. Etna",
		TXT_KEY_CIV5_FEATURES_FUJI_TEXT = "Mount Etna is an active stratovolcano on the east coast of Sicily, Italy, in the Province of Catania, between Messina and Catania. It lies above the convergent plate margin between the African Plate and the Eurasian Plate. It is the tallest active volcano on the European continent, currently 3,329 m (10,922 ft) high, though this varies with summit eruptions.",
		TXT_KEY_FEATURE_MT_KAILASH = "Mont Blanc",
		TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT = "Mont Blanc is the highest mountain in the Alps, Western Europe and the European Union. The mountain lies between the regions of Aosta Valley, Italy, and Haute-Savoie, France. It rises 4,810 m above sea level and is ranked 11th in the world in topographic prominence. The summit of Mont Blanc is a thick, perennial ice and snow dome whose thickness varies, so no exact and permanent summit elevation can be determined, although accurate measurements have been made. It was first climbed in 1786 by Michel-Gabriel Paccard and Jacques Balmat. In 1886, future U.S. President Theodore Roosevelt led an expedition to the peak. Today it is one of the most visited tourist destinations in the world.",
		TXT_KEY_FEATURE_MESA = "Siligo Mesa",
		TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT = "Siligo is a town in the region of Logudoro, in northern Sardinia, Italy. It is known for the mesa of Monte Santu, an elevated area of land with a flat top formed by weathering and erosion of horizontally layered rocks that have been uplifted by tectonic activity. The place hosts an archaeological site and a prehistoric Nuragic Sanctuary.",
		TXT_KEY_FEATURE_SRI_PADA = "Kirkjufell",
		TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT = "Kirkjufell (Icelandic: Church mountain) is a 463m high mountain on the north coast of Iceland's Snæfellsnes peninsula, near the town of Grundarfjörður.",
		TXT_KEY_FEATURE_LAKE_VICTORIA = "Lake Ladoga",
		TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT = "Lake Ladoga is a freshwater lake located in the Republic of Karelia and Leningrad Oblast in northwestern Russia just outside the outskirts of Saint Petersburg. It is the largest lake in Europe, and the 15th largest freshwater lake by area in the world.",
		TXT_KEY_FEATURE_KILIMANJARO = "Mt. Elbrus",
		TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT = "Mount Elbrus is a dormant volcano located in the western Caucasus mountain range, in Kabardino-Balkaria and Karachay–Cherkessia of Russia, near the border with Georgia. Mt. Elbrus's peak is the highest in the Caucasus Mountains and in Europe."
		},
	[APENNINE] = {},
	[EAST_ASIA] = {},
	[BRITISH_ISLES] = {},
	[NORTHEAST_ASIA] = {},
	[AEGEAN] = {},
	[NORTH_ATLANTIC] = {},
	[PACIFIC] = {},
	[SOUTH_PACIFIC] = {},
	[NORTHWEST_EUROPE] = {},
	[CARIBBEAN] = {},
	[ASIA] = {},
	[MEDITERRANEAN] = {},
	[MESOPOTAMIA] = {},
	[LARGE_AFRICA] = {},
	[NILE_VALLEY] = {},
	[AMERICAS] = {},
	[MESOPOTAMIA_GIANT] = {},
	[ASIA_SMALL] = {},
	[LARGE_EUROPE_NEW] = {},
	[ADRIATIC] = {},
	[WEST_AFRICA] = {},	
	[CAUCASUS] = {},
	[ASIA_MONGOL_STEPPE] = {},
	[CENTRAL_ASIA] = {},
	[EASTERN_EUROPE] = {},
	[NORTH_SEA_EUROPE] = {},
	[AFRICA_SOUTH_EUROPE] = {},
	[AFRICA_ASIA_OCEANIA] = {},
	[INDIAN_OCEAN] = {},
	[AFRICA_GIANT] = {},
	[SOUTH_AMERICA_GIANT] = {},
	[AUSTRALIA_SOUTHEAST_ASIA] = {},
	[AMERICAS_GIANT] = {},
	[INDIA_GIANT] = {},
	[SOUTH_CENTRAL_AMERICA_HUGE] = {},
	[SOUTH_CENTRAL_AMERICA_GIANT] = {},
	[SCOTLAND_IRELAND_HUGE] = {},
	[SOUTH_AMERICA_LARGE] = {},
	[ASIA_SOUTH_HUGE] = {},
	[SOUTH_PACIFIC_GIANT] = {},
	[NORTH_AMERICA_GIANT] = {},
	[NORTH_AMERICA_HUGE] = {},
}


g_NaturalWonderPlacement = { 
	[GIANT_EARTH] = {
		["FEATURE_POTOSI"] = {X=157, Y=21},
		["FEATURE_MT_SINAI"] = {X=34, Y=47},
		["FEATURE_SRI_PADA"] = {X=63, Y=33},
		["FEATURE_MT_KAILASH"] = {X=65, Y=56},
		["FEATURE_ULURU"] = {X=92, Y=16},
		["FEATURE_LAKE_VICTORIA"] = {X=34, Y=28},
		["FEATURE_KILIMANJARO"] = {X=36, Y=26},
	},
	[HUGE_EARTH] = {
		["FEATURE_POTOSI"] = {X=35, Y=21},
		["FEATURE_MT_SINAI"] = {X=73, Y=46},
		["FEATURE_SRI_PADA"] = {X=92, Y=33},
		["FEATURE_MT_KAILASH"] = {X=92, Y=51},
		["FEATURE_ULURU"] = {X=112, Y=17},
	},
	[STANDARD_CORDIFORM_EARTH] = {
		["FEATURE_POTOSI"] = {X=16, Y=10},
		["FEATURE_MT_SINAI"] = {X=47, Y=18},
		["FEATURE_SRI_PADA"] = {X=61, Y=17},
		["FEATURE_MT_KAILASH"] = {X=58, Y=26},
		["FEATURE_ULURU"] = {X=72, Y=10},
	},
	[LARGE_EUROPE] = {
		["FEATURE_MT_SINAI"] = {X=61, Y=12},
	},
	[LARGE_GREATEST_EARTH] = {
		["FEATURE_LAKE_VICTORIA"] = {X=60, Y=18},
		["FEATURE_KILIMANJARO"] = {X=61, Y=15},
	},
	[AFRICA_GIANT] = {
		["FEATURE_LAKE_VICTORIA"] = {X=99, Y=65},
		["FEATURE_KILIMANJARO"] = {X=104, Y=62},
	},
}
--------------------------------------------------------------

-- max number of resource tiles around civ starting position (see CivilizationsStartTable.xml)
MAX_REQUESTED_RESOURCE = 6

--------------------
-- Map option : Type
--------------------
-- Major placement
MAJOR_PLACEMENT = 1
-- City States placement
MINOR_PLACEMENT = 2
-- Bosphorus tile
BOSPHORUS = 3
-- City States minimum distance
MINOR_DISTANCE = 4
-- Remove United States
NO_US = 5
-- Resources option
RESOURCE_GEO = 6
RESOURCE_DEPOSIT = 7
RESOURCE_QUANTITY = 8
RESOURCE_SCALE = 9
RESOURCE_REQUESTED = 10

--------------------
-- Map option : Value
--------------------
-- Map option : Civilization placement
MAJOR_TSL_ONLY = 1
MAJOR_TSL_RANDOM = 2
MAJOR_ALL_RANDOM = 3
-- Map option : City States placement
MINOR_TSL_ONLY = 1
MINOR_TSL_RANDOM = 2
MINOR_ALL_RANDOM = 3
-- Map option : City States minimum distance
g_MinorDistanceValue = {0,2,4,6,9}
MINOR_DISTANCE_NO = 1
MINOR_DISTANCE_MINI = 2
MINOR_DISTANCE_CLOSE = 3
MINOR_DISTANCE_MEDIUM = 4
MINOR_DISTANCE_AWAY = 5
-- Map option : Resources quantity
g_ResourceQuantityCoeff = {0.25,0.5,1,2,4}
RESOURCE_POOR = 1
RESOURCE_SPARSE = 2
RESOURCE_STANDARD = 3
RESOURCE_ABUNDANT = 4
RESOURCE_RICHE = 5

-------------------------------
-- Map Options : Mod dependency
-------------------------------

if g_bBadCS then
	MajorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		}

elseif ( g_madeiraCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Madeira's selection with True Starting Location", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random", ToolTip = "Madeira's selection with random placement", Value = MINOR_ALL_RANDOM,},
		}
elseif ( g_dynamicCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "Dynamic Placement", ToolTip = "Dynamic History mod is activated", Value = MINOR_TSL_ONLY,},
		}
else
	MajorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		}
end

if ( g_dynamicCS == 1 ) then
	NoUSOption = 	{
		ID = NO_US,
		Name = "Delayed start for civilizations",
		ToolTip = "Dynamic History Mod is selected, if checked Civilizations will start at real date",
		Disabled = false,
		GameOption = false,
		Checked = true,
		SortPriority = 3,
	}
else
	NoUSOption = 	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 3,
	}
end

---------------------- 
-- Map Options : Table 
----------------------
g_MapPulldownOptions = {
---------------
[GIANT_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[HUGE_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_GREATEST_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},---------------
[STANDARD_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[STANDARD_CORDIFORM_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AFRICA_ASIA_OCEANIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_ATLANTIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[SOUTH_PACIFIC_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[INDIAN_OCEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[GIANT_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[LARGE_EUROPE_NEW] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------- 
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[EAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_SMALL] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_MONGOL_STEPPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CENTRAL_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CAUCASUS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NILE_VALLEY] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[WEST_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MEDITERRANEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[APENNINE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AEGEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ADRIATIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[BRITISH_ISLES] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[EASTERN_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHWEST_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_SEA_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CARIBBEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
}
---------------
g_MapCheckboxOptions = {
---------------- 
[GIANT_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Add major deposits of strategic resources",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[HUGE_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Add major deposits of strategic resources",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[STANDARD_EARTH] = {
	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[STANDARD_CORDIFORM_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_GREATEST_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
---------------- 
[GIANT_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[APENNINE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[EAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[BRITISH_ISLES] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AEGEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTH_ATLANTIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTHWEST_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[CARIBBEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[MEDITERRANEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[LARGE_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NILE_VALLEY] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AMERICAS] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait is a sea",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
}, 
----------------
[ASIA_SMALL] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[LARGE_EUROPE_NEW] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[ADRIATIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[WEST_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[CAUCASUS] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[ASIA_MONGOL_STEPPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[CENTRAL_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[EASTERN_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTH_SEA_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AFRICA_ASIA_OCEANIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AFRICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[INDIAN_OCEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[AMERICAS_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[INDIA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "Use true geographic resource placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false,
		SortPriority = 1,
	},	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "Don't scale resources with players",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Add specific resources at starting positions",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false,
		SortPriority = 2,
	},
},
----------------
}

--print ("---- YnAEMP defines loaded -----")