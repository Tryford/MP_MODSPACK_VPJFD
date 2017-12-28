INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
--==========================================================================================================================
-- UI STUFF
--==========================================================================================================================
	(
		'TXT_KEY_SUZERAINITY_ALLY_INACTIVE',
		'ALLY BONUSES: [COLOR_NEGATIVE_TEXT](Inactive)[ENDCOLOR]'
	),
	(
		'TXT_KEY_SUZERAINITY_ALLY_ACTIVE',
		'ALLY BONUSES: [COLOR_POSITIVE_TEXT](Active)[ENDCOLOR]'
	),
	(
		'TXT_KEY_SUZERAINITY_ALLY_TT',
		'If a player becomes the [COLOR_POSITIVE_TEXT]Ally[ENDCOLOR] of this City-State, the player will recieve the following Bonus and Resources (once the City-State has connected them).'
	),
	(
		'TXT_KEY_SUZERAINITY_RELATIONS',
		'NOTABLE RELATIONS:'
	),	
	(
		'TXT_KEY_SUZERAINITY_INFLUENCE_TT',
		'{1_Civ} has {2_INFL} [ICON_INFLUENCE] Influence with {3_CS}.'
	),
	(
		'TXT_KEY_SUZERAINITY_ALLIED',
		'[NEWLINE][ICON_BULLET]They are [ICON_CAPITAL] Allied with {1_CS}.'
	),
	(
		'TXT_KEY_SUZERAINITY_FRIENDS',
		'[NEWLINE][ICON_BULLET]They are [ICON_HAPPINESS_1] Friends with {1_CS}.'
	),
	(
		'TXT_KEY_SUZERAINITY_PLEDGE',
		'[NEWLINE][ICON_BULLET]They have [ICON_STRENGTH] Pledged to Protect {1_CS}.'
	),			
	(
		'TXT_KEY_SUZERAINITY_WAR',
		'[NEWLINE][ICON_BULLET]They are at [ICON_WAR] War with {1_CS}.'
	),
------------------------------------------
-- Used by Oyo AND Aden, which is why it's here 
------------------------------------------
	(
		'TXT_KEY_SUZERAINTRAIT_PURCHASE_RESOURCE',
		'Buy {1} units of {2} - will cost {3} [ICON_GOLD] Gold'
	),		
--==========================================================================================================================
-- City-States
--==========================================================================================================================
	(
		'TXT_KEY_MINOR_CIV_SUK_NAQADA',
		'Naqada'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_NAQADA_ADJ',
		'Naqada'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA',
		'+3 [ICON_CULTURE] Culture from the Palace. May spend [ICON_GOLD] Gold to purchase Archaeologists at Naqada after they have been unlocked.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA_BUY',
		'Recruit {1_Unit} - will cost {2_Cost} [ICON_GOLD] Gold)'
	),		
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA_REQUIRES_TECH',
		'[COLOR_NEGATIVE_TEXT]You must have researched the appropriate tech to recruit an {1_Unit}.[ENDCOLOR]'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_BRATISLAVA',
		'Bratislava'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_BRATISLAVA_ADJ',
		'Bratislavan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_BRATISLAVA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_BOLOGNA',
		'Bologna'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_BOLOGNA_ADJ',
		'Bolognese'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_BOLOGNA',
		'+2 [ICON_CULTURE] Culture from Scientist Specialists. +33% [ICON_PRODUCTION] Production towards Libraries and Universities.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ABOMEY',
		'Abomey'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ABOMEY_ADJ',
		'Abomeyan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ABOMEY',
		'The Palace provides +3 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_PEACE] Faith.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN',
		'Sicán'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN_ADJ',
		'Sicán'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SICAN',
		'May spend [ICON_CULTURE] Culture to gain [ICON_INFLUENCE] Influence with City-States other than Sicán.'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL',
		'Exert Cultural Influence'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN_GIFT',
		'{1} [ICON_CULTURE] Culture - will earn {2} [ICON_INFLUENCE] Influence'
	),	
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT',
		'You may spend [ICON_CULTURE] Culture to improve your [ICON_INFLUENCE] Influence with City-States other than Sicán.'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SICAN_DIALOGUE_RESPONSE',
		'Your cultural achievements are truly awe inspiring.'
	),			
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_URBINO',
		'Urbino'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_URBINO_ADJ',
		'Urbinati'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_URBINO',
		'Randomly receive a Great Artist, Musician or Writer every 60 turns (On Standard).'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_PALMYRA',
		'Palmyra'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_PALMYRA_ADJ',
		'Palmyrene'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_PALMYRA',
		'+15% [ICON_PRODUCTION] Production when building Wonders.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_LWOW',
		'Lwów'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_LWOW_ADJ',
		'Lwów'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_LWOW',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_NAN_MADOL',
		'Nan Madol'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_NAN_MADOL_ADJ',
		'Nan Madol'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAN_MADOL',
		'+1 [ICON_CULTURE] Culture from Coast and Ocean Tiles.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SAN_JOSE',
		'San José'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SAN_JOSE_ADJ',
		'Josefino'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SAN_JOSE',
		'+3 [ICON_RESEARCH] Science, +3 [ICON_CULTURE] Culture, +3 [ICON_GOLD] Gold from Natural Wonders.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SOBA',
		'Soba'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SOBA_ADJ',
		'Soban'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SOBA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MONACO',
		'Monaco'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MONACO_ADJ',
		'Monégasque'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MONACO',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ULM',
		'Ulm'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ULM_ADJ',
		'Ulmian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ULM',
		'+1 [ICON_CULTURE] Culture, +1 [ICON_GOLD] Gold from Merchant Specialists. +1 [ICON_CULTURE] Culture, +1 [ICON_PRODUCTION] Production from Engineer Specialists.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_AVA',
		'Ava'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_AVA_ADJ',
		'Avan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVA',
		'+2 [ICON_CULTURE] Culture, +3 [ICON_GOLDEN_AGE] Golden Age Points from Artist, Musician, and Writer Specialists.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SYRACUSE',
		'Syracuse'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SYRACUSE_ADJ',
		'Syracusan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SYRACUSE',
		'+1 [ICON_FOOD] Food, +2 [ICON_CULTURE] Culture from Wheat.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MESA_VERDE',
		'Mesa Verde'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MESA_VERDE_ADJ',
		'Mesa Verdean'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE',
		'May comission Pithouses in your Cities, causing them to grow by 1 [ICON_CITIZEN] Population, and granting them +10% [ICON_FOOD] Food.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_LABEL',
		'Comission a Pithouse'
	),	
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_LABEL2',
		'Comission a Pithouse in {1} - will cost {2} [ICON_GOLD] Gold'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_TT',
		'Pithouses grant an instant +1 [ICON_CITIZEN] Population boost, and a permanent +10% [ICON_FOOD] Food bonus.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_VIJAYA',
		'Vijaya'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_VIJAYA_ADJ',
		'Vijayan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_VIJAYA',
		'+1 [ICON_FOOD] Food from Lumber Mills.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ANTANANARIVO',
		'Antananarivo'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ANTANANARIVO_ADJ',
		'Antananarivan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ANTANANARIVO',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_REVAL',
		'Reval'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_REVAL_ADJ',
		'Reval'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_REVAL',
		'+1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold from Lakes.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ORMUS',
		'Ormus'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ORMUS_ADJ',
		'Ormusi'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ORMUS',
		'+1 [ICON_HAPPINESS_1] Happiness from each type of Luxury resource you own.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SAN_JUAN',
		'San Juan'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SAN_JUAN_ADJ',
		'Sanjuanero'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SAN_JUAN',
		'+50% [ICON_PRODUCTION] Production when training Cargo Ship or Work Boats.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ISANAPURA',
		'Isanapura'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ISANAPURA_ADJ',
		'Isanapuran'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ISANAPURA',
		'+1 [ICON_FOOD] Food, +2 [ICON_GOLDEN_AGE] Golden Age Points from Wonders.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_NOK',
		'Nok'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_NOK_ADJ',
		'Nok'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NOK',
		'+1 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production from Artifacts and Great Works of Art. Recieve [ICON_GREAT_PEOPLE] Great Artist points when a city grows.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NOK_NOTIFICATION',
		'+{1_Num} [ICON_GREAT_PEOPLE] [COLOR_POSITIVE_TEXT]Great Artist[ENDCOLOR] points from city growth.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_RIGA',
		'Riga'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_RIGA_ADJ',
		'Rigan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_RIGA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_BONGA',
		'Bonga'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_BONGA_ADJ',
		'Bongan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_BONGA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_CATALHOYUK',
		'Çatalhöyük'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_CATALHOYUK_ADJ',
		'Çatalhöyük'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_CATALHOYUK',
		'+2 [ICON_GOLDEN_AGE] Golden Age Points from Bonus Resources.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SNAKETOWN',
		'Snaketown'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SNAKETOWN_ADJ',
		'Snaketown'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SNAKETOWN',
		'+2 [ICON_CULTURE] Culture from Granaries, Watermills and Aqueducts'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_KUK',
		'Kuk'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_KUK_ADJ',
		'Kuk'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_KUK',
		'+3 [ICON_FOOD] Food from Marshes.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MOGADISHU',
		'Mogadishu'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MOGADISHU_ADJ',
		'Mogadishan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MOGADISHU',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MARIEHAMN',
		'Mariehamn'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MARIEHAMN_ADJ',
		'Mariehamn'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MARIEHAMN',
		'+30% [ICON_PRODUCTION] Production towards Coastal Buildings.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_DORPAT',
		'Dorpat'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_DORPAT_ADJ',
		'Dorpat'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_DORPAT',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ANURADHAPURA',
		'Anuradhapura'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ANURADHAPURA_ADJ',
		'Anuradhapuran'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ANURADHAPURA',
		'+1 [ICON_GOLD] Gold from Farm and Plantation Resources.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_GADIR',
		'Gadir'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_GADIR_ADJ',
		'Gadir'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GADIR',
		'+4 [ICON_GOLD] Gold from Internal Trade Routes.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_HONG_KONG',
		'Hong Kong'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_HONG_KONG_ADJ',
		'Hong Kongese'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_HONG_KONG',
		'+2 [ICON_PRODUCTION] and +10% [ICON_PRODUCTION] from Seaport, Banks, and Stock Exchanges.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_HONG_KONG_EE',
		'+2 [ICON_PRODUCTION] and +10% [ICON_PRODUCTION] from Weigh Houses, Banks, and Stock Exchanges.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MALACCA',
		'Malacca'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MALACCA_ADJ',
		'Malaccan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MALACCA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_OYO_ILE',
		'Oyo-Ile'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_OYO_ILE_ADJ',
		'Oyo'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE',
		'May purchase [ICON_RES_HORSE] Horses and [ICON_RES_IRON] Iron from Oyo-Ile with [ICON_GOLD] Gold.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE_LABEL',
		'Purchase Resources'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE_TT',
		'If Allied, you may purchase [ICON_RES_HORSE] Horses and [ICON_RES_IRON] Iron from Oyo-Ile with [ICON_GOLD] Gold.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SAMARKAND',
		'Samarkand'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SAMARKAND_ADJ',
		'Samarkandian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SAMARKAND',
		'Recieve 2 Trade Route Slots.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SINGAPORE',
		'Singapore'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SINGAPORE_ADJ',
		'Singaporean'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE',
		'Gain [ICON_GOLD] Gold when you finish researching a new Technology.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SINGAPORE_NOTIFICATION',
		'+{1} [ICON_GOLD] Gold from researching a new Technology.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_ADEN',
		'Aden'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_ADEN_ADJ',
		'Adenian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_ADEN',
		''
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_KATSINA',
		'Katsina'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_KATSINA_ADJ',
		'Katsina'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_KATSINA',
		''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_MANICA',
		'Manyika'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_MANICA_ADJ',
		'Manyika'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MANICA',
		'+1 [ICON_GOLD] Gold from Pasture Resources. +50% [ICON_PRODUCTION] Production when training Caravans.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_LUBECK',
		'Lübeck'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_LUBECK_ADJ',
		'Lübecker'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_LUBECK',
		'+5 [ICON_GOLD] Gold for Trade Routes with City-States.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_HOLMGARD',
		'Holmgård'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_HOLMGARD_ADJ',
		'Holmgårdian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_HOLMGARD',
		'Units Purchased with [ICON_GOLD] Gold start with an extra 30 XP.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_SOKOTO',
		'Sokoto'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_SOKOTO_ADJ',
		'Sokoto'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SOKOTO',
		'Religious Buildings provide +10 XP for new units.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_JERICHO',
		'Jericho'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_JERICHO_ADJ',
		'Jerichoan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_JERICHO',
		'+33% [ICON_PRODUCTION] Production towards Walls and Castles. +2 [ICON_CULTURE] Culture from Walls and Castles.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_DALI',
		'Dali'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_DALI_ADJ',
		'Dali'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_DALI',
		'[ICON_GOLD] Gold cost of upgrading military units reduced by 33%.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_TLAXCALA',
		'Tlaxcala'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_TLAXCALA_ADJ',
		'Tlaxcalan'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_TLAXCALA',
		'Melee and Gun Units recieve a +33% Combat Bonus in Forest and Jungle.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_TLAXCALA_PROMOTION',
		'+33% Combat Bonus in Forest/Jungle.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_GIBRALTAR',
		'Gibraltar'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_GIBRALTAR_ADJ',
		'Gibraltarian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GIBRALTAR',
		'+15% [ICON_PRODUCTION] Production and +10 XP for Naval Units.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_PSKOV',
		'Pskov'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_PSKOV_ADJ',
		'Pskovian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_PSKOV',
		'+25 HP, +2.5 [ICON_STRENGTH] Defense in all Cities.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_VALLETTA',
		'Valletta'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_VALLETTA_ADJ',
		'Valletta'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_VALLETTA',
		'All units in tiles adjacent to Recon and Religious Units Heal 5 Additional HP per turn.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_VALLETTA_PROMOTION',
		'All units in adjacent tiles [COLOR_POSITIVE_TEXT]Heal 5 Additional HP[ENDCOLOR] per turn.'
	),	
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_LINDISFARNE',
		'Lindisfarne'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_LINDISFARNE_ADJ',
		'Lindisfarne'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_LINDISFARNE',
		'+1 [ICON_RESEARCH] Science, +2 [ICON_PEACE] Faith from Great Works of Writing. Receive a Great Writer when allying with them for the first time.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_IFE',
		'Ife'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_IFE_ADJ',
		'Ife'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_IFE',
		'While Allied, the [ICON_CAPITAL] Capital undergoes a perpetual ''We Love the King Day.'''
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_JERUSALEM',
		'Jerusalem'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_JERUSALEM_ADJ',
		'Jerusalemite'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_JERUSALEM',
		'Great Prophets gained while allied recieve an extra spread.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_UKONSAARI',
		'Ukonsaari'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_UKONSAARI_ADJ',
		'Ukonsaari'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_UKONSAARI',
		'+1 [ICON_PEACE] Faith from Forests. +50% [ICON_PRODUCTION] towards Shrines.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_GOBEKLI_TEPE',
		'Nevalı Çori'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_GOBEKLI_TEPE_ADJ',
		'Nevalı Çori'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE',
		'May spend [ICON_PEACE] Faith at Nevalı Çori to build a random Religious building in one of your Cities.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_LABEL',
		'Commission a Temple'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_BUY',
		'Commission a Temple in {1} - will cost {2} [ICON_PEACE] Faith'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_TT',
		'One of the following structures will be built in {1}.
		[NEWLINE]--------------{2}'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_NOTIFICATION',
		'{1} Constructed'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_NOTIFICATION_DESC',
		'The workers of Nevalı Çori have constructed a {1} in {2}!'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_VARANASI',
		'Varanasi'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_VARANASI_ADJ',
		'Varanasian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_VARANASI',
		'+2 [ICON_PEACE] Faith from every [ICON_CITIZEN] Citizen in the [ICON_CAPITAL] Capital.'
	),
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_AVIGNON',
		'Avignon'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_AVIGNON_ADJ',
		'Avignonian'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON',
		'May purchase Missionaries and Inquisitors from Avignon with [ICON_GOLD] Gold.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_LABEL',
		'Request Ecclesiastical Services'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_TT',
		'If Allied, you may purchase Missionaries and Inquisitors from Avignon with [ICON_GOLD] Gold.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_BUY',
		'Request {1_Unit} ({2_Religion}, Costs {3_Cost} [ICON_GOLD] Gold)'
	),			
  --------------------------------------------------------------------------
	(
		'TXT_KEY_MINOR_CIV_SUK_WITTENBERG',
		'Wittenberg'
	),
	(
		'TXT_KEY_MINOR_CIV_SUK_WITTENBERG_ADJ',
		'Wittenberger'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG',
		'Gain [ICON_PEACE] Faith when you finish researching a new Technology.'
	),
	(
		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_WITTENBERG_NOTIFICATION',
		'+{1} [ICON_PEACE] Faith from researching a new Technology.'
	);	
--------------------------------------------------------------------------------------------------------------------------
-- Maritime to Fertile
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US
SET Text = replace(Text, "Maritime", "Fertile")
WHERE Tag IN ('TXT_KEY_CITYSTATE_MARITIME_HEADING3_TITLE', 'TXT_KEY_CITY_STATE_MARITIME_ADJECTIVE', 'TXT_KEY_NOTIFICATION_MINOR_NOW_ALLIES_MARITIME', 'TXT_KEY_NOTIFICATION_MINOR_NOW_FRIENDS_MARITIME', 'TXT_KEY_CITY_STATE_MARITIME_TT', 'TXT_KEY_CITY_STATE_GREETING_MARITIME', 'TXT_KEY_MINOR_TRAIT_MARITIME', 'TXT_KEY_FOOD_MARITIME_HEADING3_TITLE');

UPDATE Language_en_US
SET Text = replace(Text, "maritime", "fertile")
WHERE Tag IN ('TXT_KEY_CITYSTATE_FRIENDS_HEADING4_BODY', 'TXT_KEY_CITYSTATE_MARITIME_ADV_QUEST', 'TXT_KEY_CITYSTATE_MARITIME_HEADING3_BODY');

--Dignitaries Reqs.
UPDATE Language_en_US
SET Text = 'Buy {1} units of {2} - will cost {4} [ICON_JFD_DIGNITARY] Dignitaries and {3} [ICON_GOLD] Gold'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_PURCHASE_RESOURCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'May spend [ICON_JFD_DIGNITARY] Dignitaries and [ICON_PEACE] Faith at Nevalı Çori to build a random Religious building in one of your Cities.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'Commission a Temple in {1} - will cost {3} [ICON_JFD_DIGNITARY] Dignitaries and {2} [ICON_PEACE] Faith'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_BUY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'Comission a Pithouse in {1} - will cost {3| [ICON_JFD_DIGNITARY] Dignitaries and {2} [ICON_GOLD] Gold'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_LABEL2'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = '+3 [ICON_CULTURE] Culture from the Palace. May spend [ICON_JFD_DIGNITARY] Dignitaries and [ICON_GOLD] Gold to purchase Archaeologists at Naqada after they have been unlocked.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'Recruit {1_Unit} - will cost {3_Cost} [ICON_JFD_DIGNITARY] Dignitaries and {2_Cost} [ICON_GOLD] Gold'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA_BUY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'May purchase [ICON_RES_HORSE] Horses and [ICON_RES_IRON] Iron from Oyo-Ile with [ICON_JFD_DIGNITARY] Dignitaries and [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'If Allied, you may purchase [ICON_RES_HORSE] Horses and [ICON_RES_IRON] Iron from Oyo-Ile with [ICON_JFD_DIGNITARY] Dignitaries and [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'May spend [ICON_JFD_DIGNITARY] Dignitaries and [ICON_CULTURE] Culture to gain [ICON_INFLUENCE] Influence with City-States other than Sicán.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SICAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = '{3} [ICON_JFD_DIGNITARY] and {1} [ICON_CULTURE] Culture - will earn {2} [ICON_INFLUENCE] Influence'
WHERE Tag = 'TXT_KEY_MINOR_CIV_SUK_SICAN_GIFT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

UPDATE Language_en_US
SET Text = 'You may spend [ICON_JFD_DIGNITARY] Dignitaries and [ICON_CULTURE] Culture to improve your [ICON_INFLUENCE] Influence with City-States other than Sicán.'
WHERE Tag = 'TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

--Directors
UPDATE Language_en_US
SET Text = '+2 [ICON_CULTURE] Culture, +3 [ICON_GOLDEN_AGE] Golden Age Points from Artist, Director, Musician, and Writer Specialists.'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);

--Rice/Maize support
UPDATE Language_en_US
SET Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SYRACUSE_JFD_EXCE'
WHERE Tag = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_SYRACUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================