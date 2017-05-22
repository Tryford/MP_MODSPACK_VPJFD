--=======================================================================================================================
-- Events_CulturalDevelopments
--=======================================================================================================================
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default NULL,
	CultureType				text									default NULL,
	Description				text									default NULL);

INSERT INTO Events_CulturalDevelopments 
		(Description,							CivilizationType,			CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_GENERAL_01',		NULL,						NULL),
		('TXT_KEY_EVENT_CULDEV_GENERAL_02',		NULL,						NULL),
		('TXT_KEY_EVENT_CULDEV_GENERAL_03',		NULL,						NULL),
		('TXT_KEY_EVENT_CULDEV_GENERAL_04',		NULL,						NULL);
------------------------------						
-- Language_en_US
------------------------------
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_CULTURALDEVELOPMENT',
		'Cultural Development'
	),
	(
		'TXT_KEY_EVENT_CULTURALDEVELOPMENT_OUTCOME_1',
		'Interesting...'
	),
	(
		'TXT_KEY_EVENT_CULTURALDEVELOPMENT_INFLUENTIAL',
		'{1_Development} This development is rapidly spreading across our nation!'
	),
	(
		'TXT_KEY_EVENT_CULTURALDEVELOPMENT_OUTCOME_1_DESC',
		'[ICON_BULLET][COLOR_POSITIVE_TEXT]{1_City} begins celebrating ''We Love the King Day'' for {2_Turns} Turns'
	),
	------------------------------
	-- General Events
	------------------------------
	(
		'TXT_KEY_EVENT_CULDEV_GENERAL_01',
		'An artist in {1_City} has developed a way of accurately representing perspective in drawings.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_GENERAL_02',
		'Hunters in {1_City} have managed to tame birds of prey as part of a practice they term Falconry.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_GENERAL_03',
		'A device that tells the time of day by the position of the Sun in the sky has been invented in {1_City}, they call it a "Sundial."'
	),
	(
		'TXT_KEY_EVENT_CULDEV_GENERAL_04',
		'Cloisonné, a decorative technique where enamel is applied and fired in raised cells on a metal background has become popular in {1_City}.'
	);
------------------------------
-- Events_CulturalDevelopments
------------------------------

INSERT INTO Events_CulturalDevelopments 
		(Description,									CivilizationType,					CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_AMERICA_01',				'CIVILIZATION_AMERICA',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_ARABIA_01',				'CIVILIZATION_ARABIA',				'JFD_Islamic'),
		('TXT_KEY_EVENT_CULDEV_ASSYRIA_01',				'CIVILIZATION_ASSYRIA',				'JFD_Mesopotamic'),
		('TXT_KEY_EVENT_CULDEV_AUSTRIA_01',				'CIVILIZATION_AUSTRIA',				'JFD_Central'),
		('TXT_KEY_EVENT_CULDEV_AZTEC_01',				'CIVILIZATION_AZTEC',				'JFD_Mesoamerican'),
		('TXT_KEY_EVENT_CULDEV_BABYLON_01',				'CIVILIZATION_BABYLON',				'JFD_Mesopotamic'),
		('TXT_KEY_EVENT_CULDEV_BRAZIL_01',				'CIVILIZATION_BRAZIL',				'JFD_Colonial'),
		('TXT_KEY_EVENT_CULDEV_BYZANTIUM_01',			'CIVILIZATION_BYZANTIUM',			'JFD_Classical'),
		('TXT_KEY_EVENT_CULDEV_CARTHAGE_01',			'CIVILIZATION_CARTHAGE',			'JFD_Classical'),
		('TXT_KEY_EVENT_CULDEV_CELTS_01',				'CIVILIZATION_CELTS',				'JFD_Northern'),
		('TXT_KEY_EVENT_CULDEV_CELTS_02',				'CIVILIZATION_CELTS',				'JFD_Northern'),
		('TXT_KEY_EVENT_CULDEV_CHINA_01',				'CIVILIZATION_CHINA',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_CHINA_02',				'CIVILIZATION_CHINA',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_CHINA_03',				'CIVILIZATION_CHINA',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_DENMARK_01',				'CIVILIZATION_DENMARK',				'JFD_Northern'),
		('TXT_KEY_EVENT_CULDEV_EGYPT_01',				'CIVILIZATION_EGYPT',				'JFD_Mesopotamic'),
		('TXT_KEY_EVENT_CULDEV_EGYPT_02',				'CIVILIZATION_EGYPT',				'JFD_Mesopotamic'),
		('TXT_KEY_EVENT_CULDEV_ENGLAND_01',				'CIVILIZATION_ENGLAND',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_ENGLAND_02',				'CIVILIZATION_ENGLAND',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_ENGLAND_03',				'CIVILIZATION_ENGLAND',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_ETHIOPIA_01',			'CIVILIZATION_ETHIOPIA',			'JFD_Semitic'),
		('TXT_KEY_EVENT_CULDEV_FRANCE_01',				'CIVILIZATION_FRANCE',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_FRANCE_02',				'CIVILIZATION_FRANCE',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_GERMANY_01',				'CIVILIZATION_GERMANY',				'JFD_Central'),
		('TXT_KEY_EVENT_CULDEV_GREECE_01',				'CIVILIZATION_GREECE',				'JFD_Classical'),
		('TXT_KEY_EVENT_CULDEV_HUNS_01',				'CIVILIZATION_HUNS',				'JFD_Steppe'),
		('TXT_KEY_EVENT_CULDEV_INDIA_01',				'CIVILIZATION_INDIA',				'JFD_Bharata'),
		('TXT_KEY_EVENT_CULDEV_INCA_01',				'CIVILIZATION_INCA',				'JFD_Andean'),
		('TXT_KEY_EVENT_CULDEV_INCA_02',				'CIVILIZATION_INCA',				'JFD_Andean'),
		('TXT_KEY_EVENT_CULDEV_INDONESIA_01',			'CIVILIZATION_INDONESIA',			'JFD_Mandala'),
		('TXT_KEY_EVENT_CULDEV_INDONESIA_02',			'CIVILIZATION_INDONESIA',			'JFD_Mandala'),
		('TXT_KEY_EVENT_CULDEV_IROQUOIS_01',			'CIVILIZATION_IROQUOIS',			'JFD_TribalAmerican'),
		('TXT_KEY_EVENT_CULDEV_JAPAN_01',				'CIVILIZATION_JAPAN',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_KOREA_01',				'CIVILIZATION_KOREA',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_KOREA_02',				'CIVILIZATION_KOREA',				'JFD_Oriental'),
		('TXT_KEY_EVENT_CULDEV_MAYA_01',				'CIVILIZATION_MAYA',				'JFD_Mesoamerican'),
		('TXT_KEY_EVENT_CULDEV_MONGOL_01',				'CIVILIZATION_MONGOL',				'JFD_Steppe'),
		('TXT_KEY_EVENT_CULDEV_MOROCCO_01',				'CIVILIZATION_MOROCCO',				'JFD_Islamic'),
		('TXT_KEY_EVENT_CULDEV_NETHERLANDS_01',			'CIVILIZATION_NETHERLANDS',			'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_NETHERLANDS_02',			'CIVILIZATION_NETHERLANDS',			'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_OTTOMAN_01',				'CIVILIZATION_OTTOMAN',				'JFD_Islamic'),
		('TXT_KEY_EVENT_CULDEV_OTTOMAN_02',				'CIVILIZATION_OTTOMAN',				NULL),
		('TXT_KEY_EVENT_CULDEV_PERSIA_01',				'CIVILIZATION_PERSIA',				'JFD_Mesopotamic'),
		('TXT_KEY_EVENT_CULDEV_POLAND_01',				'CIVILIZATION_POLAND',				'JFD_Eastern'),
		('TXT_KEY_EVENT_CULDEV_POLYNESIA_01',			'CIVILIZATION_POLYNESIA',			'JFD_Oceanic'),
		('TXT_KEY_EVENT_CULDEV_POLYNESIA_02',			'CIVILIZATION_POLYNESIA',			'JFD_Oceanic'),
		('TXT_KEY_EVENT_CULDEV_PORTUGAL_01',			'CIVILIZATION_PORTUGAL',			'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_ROME_01',				'CIVILIZATION_ROME',				'JFD_Classical'),
		('TXT_KEY_EVENT_CULDEV_ROME_02',				'CIVILIZATION_ROME',				'JFD_Classical'),
		('TXT_KEY_EVENT_CULDEV_RUSSIA_01',				'CIVILIZATION_RUSSIA',				'JFD_Eastern'),
		('TXT_KEY_EVENT_CULDEV_SHOSHONE_01',			'CIVILIZATION_SHOSHONE',			'JFD_TribalAmerican'),
		('TXT_KEY_EVENT_CULDEV_SIAM_01',				'CIVILIZATION_SIAM',				'JFD_Mandala'),
		('TXT_KEY_EVENT_CULDEV_SIAM_02',				'CIVILIZATION_SIAM',				'JFD_Mandala'),
		('TXT_KEY_EVENT_CULDEV_SONGHAI_01',				'CIVILIZATION_SONGHAI',				'JFD_WestAfrican'),
		('TXT_KEY_EVENT_CULDEV_SPAIN_01',				'CIVILIZATION_SPAIN',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_SPAIN_02',				'CIVILIZATION_SPAIN',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_SWEDEN_01',				'CIVILIZATION_SWEDEN',				'JFD_Western'),
		('TXT_KEY_EVENT_CULDEV_SWEDEN_02',				'CIVILIZATION_SWEDEN',				'JFD_Northern'),
		('TXT_KEY_EVENT_CULDEV_SWEDEN_03',				'CIVILIZATION_SWEDEN',				'JFD_Northern'),
		('TXT_KEY_EVENT_CULDEV_VENICE_01',				'CIVILIZATION_VENICE',				'JFD_Southern'),
		('TXT_KEY_EVENT_CULDEV_VENICE_02',				'CIVILIZATION_VENICE',				'JFD_Southern'),
		('TXT_KEY_EVENT_CULDEV_ZULU_01',				'CIVILIZATION_ZULU',				'JFD_Bantu');
------------------------------
-- Language_en_US
------------------------------
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_CULDEV_AMERICA_01',
		'Culinary masters in {1_City} have developed an extraordinary new dish comprised of thinly-chopped potatoes fried in great vats of oil. For some reason, they have termed this wondrous invention the French Fry.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ARABIA_01',
		'The Oud, a pear-shaped stringed instrument, is now commonly used by musicians in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ASSYRIA_01',
		'Those plagued by sorrow and grief need no longer despair, for a physician in {1_City} has invented an anti-depressent inhalant!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_AUSTRIA_01',
		'Bakers of {1_City} are now making delicious pastries they call "Apfelstrudel".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_AZTEC_01',
		'A strategy board game called "Patolli", played with red and blue stones, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_BABYLON_01',
		'Glazed bricks painted with icons and images have begun to be used in decorating buildings in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_BRAZIL_01',
		'A priest from {1_City} has begun experimenting with what he calls the hot air balloon. By heating air into a bag, the man says that he will be able to lift himself entirely off the ground!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_BYZANTIUM_01',
		'Construction of a circular dome built atop a rectangular floor, an innovation called the pendentive dome, has begun in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CARTHAGE_01',
		'Craftsmen in {1_City} have discovered a process to blow pure crystal-clear glass. No longer will their windows be a garish assortment of obnoxious colors!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CELTS_01',
		'A new armour consisting of small metal rings linked together, called chainmail, has been invented by a blacksmith in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CELTS_02',
		'A new fashion trend has originated in {1_City}: men are now prancing around in skirts with brilliant plaid patterning that they call kilts. They assure everyone that it is, in fact, perfectly manly to wear a skirt.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_01',
		'A game called "Mahjong", played with a set of 144 tiles, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_02',
		'A strategy board game called "Weiqi", played with black and white stones, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_03',
		'The elite of {1_City} have begun playing a strategy board game called "Xiangqi".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_DENMARK_01',
		'A carpenter from {1_City} has begun making wooden toys which lock together, what he calls Lego.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_EGYPT_01',
		'Men and women in {1_City} have begun wearing eyeliner; called "Kohl"  by the locals. As a result, sales of cosmetic palletes have skyrocketed.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_EGYPT_02',
		'It has become popular among the elite crowd of {1_City}, upon death, to embalm their bodies in linen and bury them along with their most valued possessions.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ENGLAND_01',
		'A new sport invented in {1_City} which the locals call "cricket" is rapidly gaining popularity. Unfortunately, everyone to whom the sport is taught seem to be better at it than its inventors.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ENGLAND_02',
		'Men in {1_City} have begun to wear tall, flat-crowned, broad-brimmed hats, popularly called a ''Top Hat''.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ENGLAND_03',
		'A new sport invented in {1_City} which the locals call "Rugby" is rapidly gaining popularity. Unfortunately, everyone to whom the sport is taught seem to be better at it than its inventors.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ETHIOPIA_01',
		'The krar, a five- or six-stringed bowl-shaped lyre, has become popular amongst musicians in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_FRANCE_01',
		'An extraordinarily long and thin loaf of bread called a "Baguette" has been invented by bakers in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_FRANCE_02',
		'Wineries in {1_City} have begun producing a type of clear white wine they call "Champagne".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_GERMANY_01',
		'Beer has become a central part of daily life in {1_City}. Officials are worried about the effects this will have on productivity.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_GREECE_01',
		'A blind poet from {1_City} has compiled his epic cycle recounting the confrontation between the Greeks and Trojans over the beautiful Helen. Unfortunately, being blind he seems to have misplaced all but two of them.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_HUNS_01',
		'The people of {1_City} have invented a very filthy joke involving a Horse, an onion, and the corpse of a dethroned emperor that we best not mention.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_INDIA_01',
		'The "Namaste", a greeting usually spoken with a slight bow and hands pressed together, palms touching and fingers pointing upwards, is now the expected greeting in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_INCA_01',
		'Freeze-drying foods for the winter has become common practice amongst the people of {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_INCA_02',
		'A new system of record keeping involving the use of knotted string, referred to as Quipu, has been developed in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_INDONESIA_01',
		'Batik, a technique of wax-resist dyeing applied to whole cloth, has been developed in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_INDONESIA_02',
		'Born of the rich spices in their diet, the people of {1_City} have begun to blend tobacco, cloves, and other spices into a type of cigarette called the kretek.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_IROQUOIS_01',
		'A syrup made from sap of maple trees is now commonly consumed by the citizens of {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_JAPAN_01',
		'For some inexplicable reason, the citizens of {1_City} have now begun eating raw fish as part of dishes they call "Sushi" and "Sashimi".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_KOREA_01',
		'A Military technician in {1_City} has invented a new bomb which can be triggered to explode after a certain amount of time.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_KOREA_02',
		'Kimchi, a dish consisting of fermented chili peppers and vegetables, usually based on cabbage, has become a staple dish in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_MAYA_01',
		'As human skulls can be fragile and crack when bounced, people in {1_City} have begun creating balls made from latex and plants.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_MONGOL_01',
		'Women of {1_City} have begun sewing in a colourful new technique known as applique.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_MOROCCO_01',
		'Men in {1_City} have begun to wear what they are calling the babouche - a heel-less slipper.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_NETHERLANDS_01',
		'Farmers in {1_City} have begun to cultivate carrots that are neither black, purple, nor white, but orange and sweet!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_NETHERLANDS_02',
		'Fashionable citizens of {1_City} have begun wearing shoes made from wood. Foot injuries from splinters have, predictably, risen dramatically.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_OTTOMAN_01',
		'The intellectual elite of {1_City} have taken to wearing a cylindrical hat with a tastle and flat top knwon as a "Fez".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_OTTOMAN_02',
		'Comfortable footstools with cushions have become a mainstay in households in {1_City}. Apparently, they have been named "Ottomans" after the empire in which they were invented. This has caused much confusion worldwide.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_PERSIA_01',
		'A sporting team game called ''Chovgan'', or ''Polo'', played on horseback with balls and clubs, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_POLAND_01',
		'Brewers in {1_City} boast about a new, fiery drink they created thanks to new methods of distillation. They called it "vodka", meaning "small water".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_POLYNESIA_01',
		'A new type of canoe capable of traversing vast distances of open ocean has been invented by fishermen in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_POLYNESIA_02',
		'Residents in {1_City} have taken to cooking great feasts by means of hot stones placed in a large hole in the ground, which is then filled in for hours, in a practice known as the Hangi.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_PORTUGAL_01',
		'A new product made from the peel of citrus fruits boiled in sugar and water, called Marmalade, has emerged in the city of {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ROME_01',
		'In an unusual development; a single piece of cloth is now acceptable formal wear in {1_City}; they call the dress a "Toga".'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ROME_02',
		'Politicians in {1_City} have begun using statues and busts as a form of political campaigning.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_RUSSIA_01',
		'Fancy jeweled eggs are now popular decorative collectables amongst the eltie of {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SHOSHONE_01',
		'The use of the stone seed herb as a form of contraceptive to avoid pregnancy has been innovated by the people of {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SIAM_01',
		'A strategy board game called "Mak Ruk" has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SIAM_02',
		'The khim, a wooden trapezoidal-shaped stringed instrument, played by striking the strings with two flexible bamboo sticks, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SONGHAI_01',
		'Weavers in {1_City} have developed Bògòlanfini; a cotton fabric dyed with fermented mud.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SPAIN_01',
		'A new beverage made from cocoa and sugar has reached {1_City}. Heated, the drink makes a fine hot chocolate!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SPAIN_02',
		'It has become a custom in {1_City} for certain daring citizens to goad belligerent bulls and slay them in front of large crowds.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SWEDEN_01',
		'In {1_City}, Mathematician Anders Celsius has innovated a new method for measuring temperature, by what he calls the 100-point thermometer scale.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SWEDEN_02',
		'A store selling ready-to-assemble furniture called IKEA has opened in {1_City}. We hear they also sell excellent meatballs.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_SWEDEN_03',
		'''Surströmming'', A pungent dish made of fermented Baltic Sea herring, has gained popularity in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_VENICE_01',
		'The government in {1_City} have opened the doors to the Ridotto - the world''s first gambling house!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_VENICE_02',
		'During the annual festival in {1_City} partygoers have taken to wearing elaborate masks and costumes of various characters and creatures. "Masquerades" are now the hit party trend of the season!'
	),
	(
		'TXT_KEY_EVENT_CULDEV_ZULU_01',
		'Shields made from oxhide and wood, known as "Isihlangu" have become staple equipment among warriors in {1_City}.'
	);
--=======================================================================================================================
--=======================================================================================================================