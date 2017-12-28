-- Lua YnaemScenario
-- Author: Gedemon
-- DateCreated: 11/3/2010
--------------------------------------------------------------
-- use XML instead ?

g_YnaemScenario = {
-------------------------
-- Start Scenario list --
-------------------------
[SCN_AMERICAN_NATION] = {
	[GIANT_EARTH] = {
		{	type = "MINOR_CIV_CHEYENNE", 
			killUnits = true,
			cities = {	{ name = "Sutaio", x = 142, y = 63, population = 1 },
						{ name = "Tsitsistas", x = 145, y = 65, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_SIOUX", 
			killUnits = true,
			cities = {	{ name = "Lakota", x = 139, y = 70, population = 1 },
						{ name = "Santee", x = 143, y = 72, population = 1 },
						{ name = "Yankton", x = 147, y = 70, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_MAYA",
			killUnits = true,
			cities = {	{ name = "Tikal", x = 146, y = 46, population = 1 },
						{ name = "Uxmal", x = 146, y = 50, population = 1 },
						{ name = "Copan", x = 148, y = 43, population = 1 },		}, 
		},
	},
	[HUGE_EARTH] = {
		{	type = "MINOR_CIV_CHEYENNE", 
			killUnits = true,
			cities = {	{ name = "Sutaio", x = 22, y = 54, population = 1 },
						{ name = "Tsitsistas", x = 24, y = 56, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_SIOUX", 
			killUnits = true,
			cities = {	{ name = "Lakota", x = 20, y = 59, population = 1 },
						{ name = "Santee", x = 22, y = 61, population = 1 },
						{ name = "Yankton", x = 24, y = 59, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_MAYA",
			killUnits = true,
			cities = {	{ name = "Tikal", x = 25, y = 41, population = 1 },
						{ name = "Uxmal", x = 25, y = 44, population = 1 },
						{ name = "Copan", x = 28, y = 39, population = 1 },		}, 
		},
	},
	[STANDARD_CORDIFORM_EARTH] = {
		{	type = "MINOR_CIV_CHEYENNE", 
			killUnits = true,
			cities = {	{ name = "Sutaio", x = 10, y = 34, population = 1 },
						{ name = "Tsitsistas", x = 12, y = 35, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_SIOUX", 
			killUnits = true,
			cities = {	{ name = "Lakota", x = 14, y = 41, population = 1 },
						{ name = "Santee", x = 14, y = 38, population = 1 },		}, 
		},
		{	type = "MINOR_CIV_MAYA",
			killUnits = true,
			cities = {	{ name = "Tikal", x = 8, y = 22, population = 1 },
						{ name = "Uxmal", x = 10, y = 20, population = 1 },		}, 
		},
	},
},

-----------------------
-- End Scenario List --
-----------------------
}