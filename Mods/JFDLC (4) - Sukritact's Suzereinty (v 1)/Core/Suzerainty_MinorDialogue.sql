--==========================================================================================================================
-- CS DIALOGUE
--==========================================================================================================================
-- Suk_MinorDialogue
-- The following MessageTypes are the defaults, you are free to create your own however:
--
-- MESSAGE_FIRST_GREETING
-- MESSAGE_GREETING
-- MESSAGE_BULLIED_GOLD
-- MESSAGE_BULLIED_UNIT
-- MESSAGE_GOLD_GIFT
-- MESSAGE_AT_WAR
-- MESSAGE_AT_WAR_WARMONGER
-- MESSAGE_MAKE_PEACE
-- MESSAGE_PLEDGE_PROTECTION
-- MESSAGE_REVOKE_PROTECTION
--
--------------------------------------------------------------------------------------------------------------------------
-- Defaults/Vanilla Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suk_MinorDialogue 	
		(MessageType, 								Message,																MinorCivType,		MinorCivTrait,				MinorCivPersonality)
VALUES	('MESSAGE_FIRST_GREETING',					'TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING',								NULL,				NULL,						NULL),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_NEUTRAL',							NULL,				NULL,						NULL),
	
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_FRIENDLY',						NULL,				NULL,						'MINOR_CIV_PERSONALITY_FRIENDLY'),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_NEUTRAL',							NULL,				NULL,						'MINOR_CIV_PERSONALITY_NEUTRAL'),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_HOSTILE',							NULL,				NULL,						'MINOR_CIV_PERSONALITY_HOSTILE'),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_IRRATIONAL',						NULL,				NULL,						'MINOR_CIV_PERSONALITY_IRRATIONAL'),
	
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_CULTURED',								NULL,				'MINOR_TRAIT_CULTURED',		NULL),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_FERTILE',								NULL,				'MINOR_TRAIT_MARITIME',		NULL),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_MERCANTILE',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_MILITARISTIC',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL),
		('MESSAGE_GREETING',						'TXT_KEY_CITY_STATE_DIPLO_HELLO_RELIGIOUS',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL),
			
		('MESSAGE_BULLIED_GOLD',					'TXT_KEY_CITY_STATE_DIPLO_JUST_BULLIED',								NULL,				NULL,						NULL),
		('MESSAGE_BULLIED_UNIT',					'TXT_KEY_CITY_STATE_DIPLO_JUST_BULLIED_WORKER',							NULL,				NULL,						NULL),
		('MESSAGE_GOLD_GIFT',						'TXT_KEY_CITY_STATE_DIPLO_JUST_SUPPORTED',								NULL,				NULL,						NULL),
		('MESSAGE_AT_WAR',							'TXT_KEY_CITY_STATE_DIPLO_HELLO_WAR',									NULL,				NULL,						NULL),
		('MESSAGE_AT_WAR_WARMONGER',				'TXT_KEY_CITY_STATE_DIPLO_HELLO_WARMONGER',								NULL,				NULL,						NULL),
		('MESSAGE_MAKE_PEACE',						'TXT_KEY_CITY_STATE_DIPLO_PEACE_JUST_MADE',								NULL,				NULL,						NULL),
		('MESSAGE_PLEDGE_PROTECTION',				'TXT_KEY_CITY_STATE_PLEDGE_RESPONSE',									NULL,				NULL,						NULL),		
		('MESSAGE_REVOKE_PROTECTION',				'TXT_KEY_CITY_STATE_DIPLO_JUST_REVOKED_PROTECTION',						NULL,				NULL,						NULL);
--------------------------------------------------------------------------------------------------------------------------
-- First Meeting
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suk_MinorDialogue 	
		(MessageType, 								Message,																MinorCivType,		MinorCivTrait,				MinorCivPersonality, 	Bias)
-- Cultured
VALUES	('MESSAGE_FIRST_GREETING',					'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_1',								NULL,				'MINOR_TRAIT_CULTURED',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_2',								NULL,				'MINOR_TRAIT_CULTURED',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_3',								NULL,				'MINOR_TRAIT_CULTURED',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_4',								NULL,				'MINOR_TRAIT_CULTURED',		NULL,					2),				
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_5',								NULL,				'MINOR_TRAIT_CULTURED',		NULL,					2),
-- Martime
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_1',								NULL,				'MINOR_TRAIT_MARITIME',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_2',								NULL,				'MINOR_TRAIT_MARITIME',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_3',								NULL,				'MINOR_TRAIT_MARITIME',		NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_4',								NULL,				'MINOR_TRAIT_MARITIME',		NULL,					2),				
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_5',								NULL,				'MINOR_TRAIT_MARITIME',		NULL,					2),
-- Mercantile
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_1',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_2',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_3',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_4',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL,					2),				
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_5',							NULL,				'MINOR_TRAIT_MERCANTILE',	NULL,					2),		
-- Militaristic
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_1',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_2',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_3',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_4',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL,					2),				
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_5',							NULL,				'MINOR_TRAIT_MILITARISTIC',	NULL,					2),		
-- Religious
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_1',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_2',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_3',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL,					2),
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_4',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL,					2),				
		('MESSAGE_FIRST_GREETING',					'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_5',								NULL,				'MINOR_TRAIT_RELIGIOUS',	NULL,					2);		
--==========================================================================================================================
-- EN_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
--------------------------------------------------------------------------------------------------------------------------
-- Cultured First Greeting
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_1',
		'Welcome to {1}, a city of artists and artistsans. We offer you this gift as a sign of our goodwill.'
	),
	(
		'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_2',
		'Well met stranger, and welcome to {1} Please accept this gift, and our offer to show you the architectural marvels of {1}!'
	),
	(
		'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_3',
		'{1} greets you! We give you this golden statuette to commemorate this meeting. Would you like to see our sculpture garden?'
	),
	(
		'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_4',
		'{1} welcomes you! Please accept this golden flute, and our invitation to stay for tonight''s performances.'
	),
	(
		'TXT_KEY_CULTURED_DIPLO_FIRST_GREETING_5',
		'Welcome stranger, to {1}, the most cultured city in all the world! Please accept this gift in honor of our meeting.'
	),
--------------------------------------------------------------------------------------------------------------------------
-- Martime First Greeting
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_1',
		'Welcome to {1}. You''ve come at an excellent time. The harvest has just come in, and we''ve plenty to go around.'
	),
	(
		'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_2',
		'{1} has the freshest meats and produce you''ll ever see stranger. Stick around for tonight''s feast and you''ll see for yourself.'
	),
	(
		'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_3',
		'A gift for you, great leader, from the citizens of {1}: some fine wine, of a most excellent vintage!'
	),
	(
		'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_4',
		'The people of {1} bid you welcome. Come! Let us hold a feast in honor of your visit!'
	),
	(
		'TXT_KEY_MARITIME_DIPLO_FIRST_GREETING_5',
		'Hail stranger! Welcome to {1}. Accept this gift from us, and allow us to show you our fertile fields and abundant orchards.'
	),
--------------------------------------------------------------------------------------------------------------------------
-- Mercantile First Greeting
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_1',
		'We share with you great leader, the riches of {1}! May our city and your nation flourish in peace and friendship.'
	),
	(
		'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_2',
		'Greetings stranger, and welcome to {1}. Our merchandise is the finest in the world, let us send you a shipment so you can see its quality for yourself.'
	),
	(
		'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_3',
		'We merchants of {1} greet you. Please, come down to the market and let us show you our wares.'
	),
	(
		'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_4',
		'The guildmasters of {1} bid you welcome. Please let us know if there''s anything we can help you with: we''re always eager to strike a deal.'
	),
	(
		'TXT_KEY_MERCANTILE_DIPLO_FIRST_GREETING_5',
		'Admiring our silks I see: welcome to {1}. Let us know if anything catches your fancy: everything here has a price.'
	),
--------------------------------------------------------------------------------------------------------------------------
-- Militaristic First Greeting
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_1',
		'Hail! We are the warriors and guardians of {1}. Please, accept this magnificent sword as a gift and a token of our budding friendship.'
	),
	(
		'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_2',
		'Admiring our walls great leader? Welcome to {1}. We present to you this suit of armour as a sign of good faith.'
	),
	(
		'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_3',
		'A gift for you great leader. Let {1} know if you are ever in need of good warriors: there are no better fighters than us!'
	),
	(
		'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_4',
		'A stranger visits {1}? Take this bow in welcome. Would you like to try it out? There''s an archery competition going on.'
	),
	(
		'TXT_KEY_MILITARISTIC_DIPLO_FIRST_GREETING_5',
		'We have a most impressive armoury, do we not? Welcome great leader to {1}. Why don''t I make you a gift of one of these axes?'
	),
--------------------------------------------------------------------------------------------------------------------------
-- Religious First Greeting
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_1',
		'Welcome to {1} child. We are the elders of {1}. Come, join us for our morning prayers.'
	),
	(
		'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_2',
		'Welcome to {1}, a holy sanctuary for the faithful. Won''t you take a copy of our holy book? Perhaps you will find it enlightening.'
	),
	(
		'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_3',
		'Ah, a lost soul has made its way to {1} it seems. Will you not join us in our temple to contemplate our place in the universe?'
	),
	(
		'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_4',
		'His Holiness is regretfully unable to meet you personally: he is in deep meditaion. But on, his behalf, we welcome you to {1}.'
	),
	(
		'TXT_KEY_RELIGIOUS_DIPLO_FIRST_GREETING_5',
		'Pray you not disturb the monks. Their work here at {1} is of the utmost importance. Feel free to join them in prayer however.' 
	),
--------------------------------------------------------------------------------------------------------------------------
-- Defaults
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING',
		'Greetings great leader. We, the elders of {1_CS}, bid you welcome.'
	),
	(
		'TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_GOLD_GIFT',
		'[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT](You have recieved {1} [ICON_GOLD] Gold in tribute).[ENDCOLOR]'
	),
	(
		'TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_FAITH_GIFT',
		'[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT](You have recieved {1} [ICON_PEACE] Faith in tribute).[ENDCOLOR]'
	),	
	(
		'TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_GOLD_FAITH_GIFT',
		'[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT](You have recieved {1} [ICON_GOLD] Gold, {2} [ICON_PEACE] Faith in tribute).[ENDCOLOR]'
	),
--------------------------------------------------------------------------------------------------------------------------
-- Type Greetings
--------------------------------------------------------------------------------------------------------------------------
	(
		'TXT_KEY_CITY_STATE_DIPLO_HELLO_CULTURED',
		'Greetings, have you come to attend tonight''s performances?'
	),
	(
		'TXT_KEY_CITY_STATE_DIPLO_HELLO_FERTILE',
		'Hello again. Come, join me; we can speak in the orchard.'
	),
	(
		'TXT_KEY_CITY_STATE_DIPLO_HELLO_MERCANTILE',
		'Greetings! We just recieved a large shipment of goods. Come take a look!'
	),	
	(
		'TXT_KEY_CITY_STATE_DIPLO_HELLO_MILITARISTIC',
		'I was just about to inspect the soldiers. Come join me!'
	),
	(
		'TXT_KEY_CITY_STATE_DIPLO_HELLO_RELIGIOUS',
		'Have you come to join us in prayer? Or is there something to discuss?'
	);	