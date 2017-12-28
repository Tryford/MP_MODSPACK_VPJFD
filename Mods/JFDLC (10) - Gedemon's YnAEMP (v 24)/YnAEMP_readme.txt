Yet (not) Another Earth Maps Pack
for Civilization 5
v.23

	-- Presentation --

YnAEMP is a map pack using a custom advanced setup menu and realistic random resource placement. Now you can use a TSL map with custom option : select exactly how many and which civilizations you want in game, set your victory condition and other game options usually unavailable when using this kind of maps.
thread on civfanatics : http://forums.civfanatics.com/showthread.php?t=397387

	-- Installation --

- Important : when updating always remove the previous version of any mod from your mod folder

- update your version of Civilization to at least patch 1.0.1.217
- download the civ5mod file to your mod folder (..\My Documents\My Games\Sid Meier's Civilization 5\MODS).
- launch civ5, go to the mod browser and click "install mod"
- find the "Yet (not) Another Earth Maps Pack" line and activate the mod.
- from the mod section, go to single player and then to custom game
- do not use the classic set up game option, to get the new advanced setup menu, you must go in custom game, then select "Yet (not) Another Earth Maps" and click on Load Mod


	-- Compatibility --

- Some files may need to be merged : MapGenerator.lua and WorldBuilderRandomItems.lua if they are used by another mod.
- This mod reinitialize and change 3 resources table : Resource_TerrainBooleans, Resource_FeatureTerrainBooleans, and Resource_FeatureBooleans. Any mod updating those tables should be loaded after this one.


	-- Credits & thanx --

Genghis Kai, Dale, smellymummy, Dieter VonClam for their great maps
Madeira, PseRamesses and everyone on the civfanatics thread for testing, comments, suggestions and help debugging the mod
mihaifx: City States Leaders mod
Ekmek: CS TSL for the cordiform earth
Montijin: TSL for BNW Civs on the Huge Earth Map
Al-Iskander: TSL for BNW Civs and CS on djvandyke's standard sized Earth Map 


	-- To do --

- convert the realistic random resource placement for the standard map
- add new natural wonders at semi-random position


	-- version history --
	
v.22 (Jul 20, 2013)
- Move Babylon 2 tiles south on the Giant Earth to allow Assyria to settle it's first city.
- Fix the number of resources placed on the map when playing with no city-states
- Fix the maximum possible number of CS shown on the setup screen (to reflect the change from the 28, 34, or 43 civs DLL)
- Add djvandyke's "Greatest Earth Map" with realistic resource placement (but not the "add major deposit" option yet)
- Add TSL for BNW Civs on the Huge Earth Map thanks to Montijin
- Add TSL for BNW Civs and CS on djvandyke's "Greatest Earth Map" thanks to Al-Iskander
- Add a lake near Aztec TSL on the Giant Earth map
- Change the "No US" option to "Only native American" option (remove USA and Brazil from the game)
	
v.21 (Jul 08, 2013)
- Added Starting Positions for Brave New World Civilizations and City-States on Giant Earth and Large Europe maps.
- Bugfix: make Spain selectable when using a resolution height of 768 pixels or less
- Small edit on Australia for the Giant Earth map
- Add Neva river on the Giant Earth map
- Add Kilimandjaro and Lake Victoria position on the Giant Earth map

v.20 (May 23, 2013)
- Bugfix: wrong starting location for Songhai on the Large Europe Map

v.19 (May 12, 2013)
- Bugfix: wrong version of Giant Earth Map released
- Redrawn Denmark, part of Baltic States and White Sea area, South-America west coast (from Cap Horn to Mexico)

v.18 (May 12, 2013)
- Add City-States TSL for cordiform earth map (thanks to Ekmek)
- Edit Large European map (add sub-Sahara) & add Songhai TSL.
- Small edit to the Giant Earth map near Persia starting position and North-america.
- Small change for compatibility with "Historical Spawn Dates" mod.
- Add Garama (Garamantes) City-States to all YnAEMP CS mods, add corresponding starting position to Giant Earth and Large Europe maps

v.17 (Oct 22, 2012)
- bugfix: new placement system for DLC Natural Wonders was crashing the mod when using vanilla civ5. 
	
v.16 (Oct 20, 2012)
- Minor changes to the Giant Earth Map (remove some mountains, prepare position of new natural wonders, redraw north Africa coast to allow placement of Malte...)
- Add G&K natural wonders on all maps
- Add G&K City States TSL for Giant Earth Map
- Set citrus and truffle restrictions for Giant Earth Map
	
v.15 (Jun 22, 2012)
- Added Starting Positions for G&K civilizations on giant Earth, huge Earth and large Europe map.
- Moved Ottoman starting position a few tiles east.
- Denmark renamed to original value, no more Scandinavia.

v.14 (Jun 16, 2012)
- rebuild Mod project after HDD crash.
- add hotseat feature.
- upload to steam workshop

v.13 (Sept 07, 2011):
- 2 more maps added by Ambrox62 for AMC mod
- 2 small bugfix and 1 typo 

v.12 (Aug 13, 2011):
- added Western Mediterranean standard map by Ambrox62 for AMC mod
- added Mediterranean Large map by Ambrox62 for AMC mod
- added Korea TSL on all earth maps
- fixed requested resource for Songhai (typo)
- fixed resource shouldn't be placed on the starting plot of a civ
- fixed resource shouldn't be placed on an atoll
- added map specific configurable resources placement rules

v.11 (Jun 28, 2011):
- patch compatibility : allow stone placement on maps

v.10 (Jun 18, 2011):
- added Dieter's Europe map
- added TSL for vanilla civilizations and City-States to Dieter's Europe
- added TSL for ambrox62's Ancient Mediterranean Civilizations to Dieter's Europe
- added realistic resource placement option for Dieter's Europe map
- added code to rename natural wonder depending on map choice
- changed civs selection menu code, only civilizations with TSL for the current map can be selected
- fixed river error in Mesopotamia on giant earth
- added some grassland in Norway on giant earth
- removed City-States selection option, this is now done by choosing one of YnAEMP CS mod
- rewrite and clean some parts of the code
	
v0.9 (May 08, 2011):
- redrawned Scandinavia on giant map
- added TSL for Denmark on all maps
- added Rotterdam and Reykjavic CS to defaut and extended CS mod, with TSL for Giant and huge map.
- removed some european CS (Venice, Brussel, Budapest, Bucharest) from the default CS mod
- renamed Denmark civilization to Scandinavia
- City States : keep Oslo and Copenhagen, add Sydney and Quebec City TSL
- tweaked : change Iroquois TSL to make room for Quebec city
- added TSL for almost all CS on huge map
- bug fix : final map setup was called only when starting a game in ancient era, works with all start eras now.
- added function : save values for general options (game speed, era, difficulty)
- changed Ragusa TSL to Croatia
- Oslo and Copenhagen automatically removed from CS database when using Denmark DLC and any of YnAEMP CS mod. (note : if you don't use CS mod, only Copenhagen will be removed from the DB. Oslo will be removed from the game only if Denmark is one of the civs selected at game launch)

v0.8 (Apr 10, 2011):
- tweaked : minimum city distance reset to pre-patch value (=2)
- added custom setup art file
- added some atolls in Pacific Ocean on all earth maps, add/redrawn Hawaii
- added polynesia start position on all earth maps
- balance : add some requested starting resources (whale and silver to England, wine and marble to Rome and Greece)
- tweaked resource placement order : place requested resource first then major deposit
- tweaked requested resource placement : on larger search always try to place the requested resource, even if a duplicate exist (could belong to another civ)
- tweaked vanilla resources table placement for Silver
- tweaked England on giant map : swap position of one land tile to make London a coastal city, added hills in city second ring for production, added 2 rivers  
- tweaked Edinburgh on giant map : moved one tile north to give more room to England

v0.7 (Jan 31, 2011):
- added a third independant City State mod "extended" with 45 CS with TSL. Due to game engine limitation, only 41 can be loaded, and on those, some may be erased at start because of overlapping start location.
- tweaked the default CS mod (remove some overlapping CS transfered to the "extended" mod)
- added Lisbon (Portugal) City-State in default and extended CS mods 
- Madrid and Cuzco automatically removed from CS database when using newworld DLC and any of YnAEMP CS mod
- fix Inca/Maya starting position on huge map
- Ynaemp city State Leaders mod is now independant
- Compatibility check (only one of YnAEMP city state mod allowed) added to the custom setup screen 
- lots of small tweaks to prepare the (future) inclusion of Dynamic History mod
- added some more debug output to track the wrong map loading bug
- added Potoso position on the Giant Map (if the DLC is available)

v0.6 (Jan 16, 2011):
- changed name of map files
- added realistic resource placement option for huge map
- added deposit resource placement option for huge map
- added Rabat (Morroco) and Dakar (Senegal) City-States
- the special selections of city states are now independant mods to prevent bugs when reloading a game
- added background picture

v0.5 (Dec 18, 2010):
- compatibility: update mod for patch 1.0.1.135
- redraw (enlarge) UK islands
- splitted CS ingame option to selection option and placement option
- added Madeira's selection for testing purpose on giant earth
- added True Starting Location for Spain and Inca on all maps
- fixed bug: no resources where placed if using civs with no TSL
- fixed bug: don't assume that preselected civs alway exist
- fixed bug: once selected, the "no us" option wasn't modifiable
- tweaked civ's specific resources: added fish and fur to England, fish and pearl to Japan
- changed separation option (minimum, close, medium, away) for CS to 2,4,6,9 tiles (was 2,5,7,10)
- changed resource quantity option (poor, sparse, standard, abundant, riche) coefficient to 0.25, 0.5, 1, 2, 4 (was 0.33, 0.75, 1, 1.5, 2) 
- tweaked some civs starting positions on giant earth (thanx to PseRamesses)
- compatibility: removed dependancy to ingame.xml (thanx to smellymummy)
- merged "City States Leaders" mod by mihaifx

v0.4 (Nov 16, 2010):
- added option "Add specific resources at starting positions" for all maps
- "resource quantity" and "don't scale resouce" are now available for huge and standard map
- fixed position of Kuala Lumpur and  Jakarta on huge map

v0.3 (Nov 14, 2010):
- fix a bug allowing (sometime a lot) more resources than needed to be placed
- added options for giant map: one to specify the quantity of resources to place and the "don't scale the resource with number of players" option
- tweak the resources placement (and edit the existing resources tables for more freedom in placement on earth maps)
- use much better code for deposits placement
- allow water resource to be placed really offshore 

v0.2 (Nov 12, 2010):
- added the realistic random resource placement function
- create the XML files to use the r.r.r. placement with the Giant map
- some fixes and bug squashing

v0.1 (Nov 8, 2010):
- first release

-----------------------------------------------------------------------------------------------------------------
Internal stuff under those lines, don't bother, just keeping it here for quick reference when I need it...
-----------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------
Formatted presentation for Steam Workshop
-----------------------------------------------------------------------------------------------------------------

Earth maps with True Starting Location and custom options featuring advanced setup screen, optional realistic resources placement and hotseat.

Compatibility: Civ5 vanilla, Gods+Kings, Brave New World and all DLC

[b]Installation[/b]
==========================================================================

1/ Click the "subscribe" button and go back in game, in the mod section, it will be downloaded automatically.
2/ Once downloaded, click the checkbox on the right of the mod line to enabled it.
3/ After you've enabled all the mods you want to play with, click "next"
4/ Choose SINGLE PLAYER and CUSTOM GAME to get the new setup menu. You must use the custom game menu.

For Mac users, here's the direct download link on [url=http://forums.civfanatics.com/downloads.php?do=file&id=15875] Civfanatics File Database[/url]


[b]Troubleshooting[/b]
==========================================================================

If the mod is not downloaded automatically even after unsubscribing/restarting the game, here's detailled instructions to reset the download and try again.

- first, check your game files integrity, instruction to do so are on [url=https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335] Steam Support[/url]


- second try to "reset" the download:

1/ unsubscribe to the mod
2/ close steam (not just the windows, the compete program, in doubt restart your computer)
3/ delete all the content of the civ5 cache folder ("\My Documents\My Games\Sid Meier's Civilization 5\cache")
4/ go into your civ5 mods folder ("\My Documents\My Games\Sid Meier's Civilization 5\MODS") and delete any file or folder named "R.E.D. Modpack".
5/ launch steam then civ5 and subscribe again from ingame.



[b]Map list[/b]
==========================================================================

- Giant Earth (180x96): edited conversion of Genghis Kai GEM for civ4. You MUST have a very fast computer to use this map, quadcore CPU, 4GB RAM minimum on a 64bits OS.

- Huge Earth (120x80): Dale's huge map edited with Europe and Japan upscaled

- Standard Earth (82x50): a Werner projection Earth map by smellymummy

- Large Europe (79x73): Dieter's Europe CiV map

- A pack of Mediterranean maps made by Ambrox62's for his Ancient Mediteranean Civilizations mod. You can get AMC for Civ5 on [url=http://forums.civfanatics.com/showthread.php?t=416671] CivFanatics[/url] or G&K conversion on [url=http://steamcommunity.com/sharedfiles/filedetails/?id=92186405]Steam Workshop[/url]


[b]More infos[/b]
==========================================================================

See the first post on the thread on [url=http://http://forums.civfanatics.com/showthread.php?t=397387] CivFanatics[/url] for more details on available option & how to add TSL for custom civilization