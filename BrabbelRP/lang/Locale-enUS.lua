AceLibrary("AceLocale-2.2"):new("BrabbelRP"):RegisterTranslations("enUS", function() return {
    ["BrabbelRP initialized"] = true, -- same as ["BrabbelRP initialized"] = "BrabbelRP initialized"
	["Debug mode"] = true,
	["Mute in stealth mode"] = true,
	["Minimap icon visible"] = true,
	["Hide minimap icon"] = true,
	["Cancel"] = true,
    ["Good evening"] = true, -- only easier to manage
    ["Monkey"] = true,
    ["This category does not exist."] = true,
    ["Lines in this category:"] = true,
    ["Categories"] = true,
    ["category"] = true,
    ["A category with this name exists already."] = true,
    ["There are no categories registered for this character."] = true,
    ["There are no lines for this category."] = true,
    ["No category chosen at the moment."] = true,
    ["active category"] = true,
    ["show active category"]= true,
    ["old"] = true,
    ["new"] = true,
    ["an unknown error occured"] = true,
    ["The postition of the line is invalid!"] = true,
    ["change active category"] = true,
    ["show active category"] = true,
    ["add a new category"] = true,
    ["show all categories"] = true,
    ["add a new line to a category"] = true,
    ["change an old line to a new line"] = true,
    ["change a category-name"] = true,
    ["show all lines for a certain category"] = true,
    ["delete a certain category and all its lines!"] = true,
    ["Category Name here"] = true,
    ["The category"] = true,
    ["does not exist."] = true,
    ["Usage"] = true,
    ["old categorie name"] = true,
    ["new categorie name"] = true,
    ["line number"] = true,
    ["line"] = true,
    ["The line does not contain any characters."] = true,
    ["add new Category named"] = true,
    ["unknown error creating category"] = true,
    ["second(s)"] = true,
    ["timer for category"] = true,
    ["chance for category"] = true,
    ["value is not valid"] = true,
    ["chance set"] = true,
    ["timer set"] = true,
    ["activated category"] = true,
    ["deactivated category"] = true,
    ["active categories"] = true,
    ["/yell"] = true,
    ["/say"] = true,
    
    -- GUI Texts
    ["General Settings"] = true,
    ["This cat has no quotes yet."] = true,
    ["choose a quote first"] = true,
    ["repPreventionFrame_note"] ="Here you can set the time that must have been passed to allow the next gebrabbel.",
    ["timerFrame_note"] = "This default timer is used as the initial timer when you create a new category.|nThough you can adjust the timers separately.",
    ["chanceFrame_note"] = "This default chance is used as the initial timer when you create a new category.|nThough you can adjust the chances separately.",
    ["Repeating prevention"] = true,
    ["Save Quote"] = true,
    ["Status"] = true,
	["Mode"] = true,
    ["Timer"] = true,
    ["Chance"] = "Chance",
    ["Add new category"] = true,
    ["Delete selected category"] = true,
	["Deactivate all"] = true,
	["Activate all"] = true,
    ["Quotes"] = true,
    ["Add new quote"] = true,
    ["Delete selected quote"] = true,
    ["Really delete? (doubleclick)"] = true,
    ["Default timer"] = true,
    ["Default chance"] = true,
	["newCategory_defaultName"] = "New category",
	["Select a category"] = true,
    
    -- more GUI Texts
    ["remove category "] = true,
    ["added new line to cat"] = true,
    ["category changed"] = true,
    ["No categories active at the moment."] = true,
    ["category already active"] = true,
    ["Category is active but has no entries"] = true,
    ["Timer set to"] = true,
    ["Chance set to"] = true,
    ["RepPrevent set to"] = true,
    ["BrabbelRP enabled"] = true,
    ["active"] = true,
	["semi-active"] = true,
    ["inactive"] = true,
	["newCategory_defaultName"] = "New category",
	["Really delete? (doubleclick)"] = true,
	["Load defaults"] = true,
	["Really load default cats and overwrite current categories? (doubleclick)"] = true,
	["Choose a mode"] = true,
	["Standard mode"] = "Standard mode",
	["Set standard mode"] = true,
	["Set_standard_mode_tooltiptext"] = "In this mode the category does not listen to any event and only fires within the given time.",
	["Instant modes"] = true,
	["Normal modes"] = true,
	["You will need to install the addon 'PetEmote' to use this command"] = true,
    
    -- error messages
    ["Message type or channel unknown"] = true,
    ["Please enter some value for the repeating prevention time."] = true,
    ["Please enter some value for the default timer."] = true,
    ["Please enter some value for the default chance."] = true,
    ["Category name can not be empty"] = true,
    ["A category with this name already exists"] = true,
    ["Timer can not be empty"] = true,
    ["Chance can not be empty"] = true,
    ["New category name can not be empty"] = true,
	["You will need to install the addon '"] = "Du musst das Addon '",
	["' to use this command"] = "' installieren, um dieses Kommando zu nutzen",
	
	-- tooltips TODO: uebersetzen!
	["TT_FIRST_HELP_TITLE"] = "Help",
	["TT_FIRST_HELP_TEXT"] = ""..
	"* The BrabbelRP-Window is easy to use.\n"..
	"\n"..
	"Category - Overview:\n"..
	"In order to change a category's settings doubleclick onto the stuff you want to change\n"..
	"If you want to rename a category simply click '...' next to the category\n"..
	"\n"..
	"When you doubleclick the category-name you will see the lines/emotes that are in this category\n"..
	"\n"..
	"Lines/Emotes - Overview:\n"..
	"Just as simple as on the category overview, only click onto the line/emote you want to change and then click into the editbox below to change its contents.\n"..
	"You also can use the action buttons to add or delete a line/emote *",
	["TT_ACTIVE_HELP_TITLE"] = "Status",
	["TT_ACTIVE_HELP_TEXT_SHORT"] = "This is the category's current status.",
	["TT_ACTIVE_HELP_TEXT_ACTIVE"] = "active\n"..
	"\n"..
	"* This category is active at the moment and will brabbel due to its Events, probability and (if set) timer *\n"..
	"\n"..
	"Doubleclick to deactivate...",
	
	["TT_LOAD_DEFAULTS_TITLE"] = "Load standard categories",
	["TT_LOAD_DEFAULTS_SHORT"] = "Reset the category list to its defaults.",
	["TT_LOAD_DEFAULTS_TEXT"] = "Attention: If you click OK, all your categories will be deleted and replaced by their defaults.\nAre you sure you want to do this?",
	
	["TT_ACTIVE_HELP_TEXT_INACTIVE"] = "inactive\n"..
		"\n"..
		"* This category is not active at the moment and will not produce any output. *\n"..
		"\n"..
		"Doubleclick to activate...",
	["TT_ACTIVE_HELP_TEXT_SEMI"] = "semiactive\n"..
		"\n"..
		"* This category is in a standby-mode. That means it's waiting for some game-events to happen.\n"..
		"example: A category with mode 'in town' is semiactive while the character is outside town.\n"..
		"When the character enters a town the category will be activated until the character leaves town again.\n"..
		"\n"..
		"Doubleclick to activate...",
	["TT_MODUS_HELP_TITLE"] = "mode",
	["TT_MODUS_HELP_TEXT"] = "* The mode defines when a category will react.\n"..
		"\n"..
		"If the mode is set to 'standard' the category will simply brabbel every x seconds with the set probability.\n"..
		"\n"..
		"A mode with this symbol: '#' is an Instant-mode, that means whenever the described event occurs the category will try to brabbel (using the set probability) immediately.\n"..
		"\n"..
		"A mode without '#' refers to a certain area or event in which the category will brabbel using the set timer and probability *",
	["TT_TIMER_HELP_TITLE"] = "timer",
	["TT_TIMER_HELP_TEXT"] = "* The timer defines how often the category tries to brabbel. *",
	["TT_TIMER_HELP_INACTIVE"] = "This category does not have a timer because it's mode is instant. That means it reacts to a certain event and does not need a timer.\n"..
		"\n"..
		"It is important to add as many lines/emotes to a category that fit the settings. Otherwise the category might brabbel the same sentence over and over again... *",
	["TT_CHANCE_HELP_TITLE"] = "probability",
	["TT_CHANCE_HELP_TEXT"] = "* Here you can set the probability for a category.\n"..
		"\n"..
		"example: A category with a timer of 60 seconds can !try! to brabbel with a probability of 25%. That means it will brabbel in about 1 of 4 tries.\n"..
		"But remember that it won't brabbel 'exactly' every 4th try... It's still random so the Brabbeling is more realistic.\n"..
		"\n"..
		"It is important to add as many lines/emotes to a category that fit the settings. Otherwise the category might brabbel the same sentence over and over again... *",
	["TT_COUNT_HELP_TITLE"] = "lines/emotes - amount",
	["TT_COUNT_HELP_TEXT"] = "* This number tells you how many lines/emotes are in this category. *",
	["TT_IMPORTANT_HELP_TITLE"] = "Important Category",
	["TT_IMPORTANT_HELP_TEXT"] = "* Categories marked as 'important' do talk despite of an unexpired repeating prevention time *",
	["TT_LINES_TABLE_HELP_TITLE"] = "Brabbeling - Overview",
	["TT_LINES_TABLE_HELP_TEXT"] = "* Chose one of the entries or add a new one..\n"..
		"You can be as creative as you want. That way you will have your very own personal character!\n"..
		"A large number of entries in a category is very useful if you don't want your character to say/do the same thing again and again. *",
	["TT_LINES_HELP_TITLE"] = "Brabbeling - Editor",
	["TT_LINES_HELP_TEXT"] = "* You can add multiple lines to one Brabbeling (use ENTER for a new line).\n"..
		"\n"..
		"That means you can add an emote to a sentence you want to say.\n"..
		"example: You want your character to say 'Hello' and wave at the same time. Your line will look like this:\n"..
		"/say Hello\n/emote waves. *",
	["TT_DEBUG_HELP_TITLE"] = "Debug - Mode",
	["TT_DEBUG_HELP_TEXT"] = "* The debug-mode is for tests. It will produce quite some output in your chat-window (but only you will see it! ;))\n"..
		"It is used for finding errors in the code or the logic of the Addon and should be left deactivated for normal usage. *",
	["TT_STEALTHP_HELP_TITLE"] = "Stealth-Protection",
	["TT_STEALTHP_HELP_TEXT"] = "* When activated your character will be muted while you're in stealth mode. This is very useful for rogues. *",


	["TT_ICONSW_HELP_TITLE"] = "Show/Hide the BrabbelRP minimap icon",
	["TT_ICONSW_HELP_TITLE2"] = "Hide the BrabbelRP-Icon minimap icon",
	["TT_ICONSW_HELP_TEXT"] = "* If you hide the icon, you can still open the BrabbelRP window with the chat command '/brp toggleWindow'. To set the icon visible/invisible you can also use '/brp toggleIcon' in chat. *",
	
	--[[ TRADE CHANNEL REGEX
	the name of the trade-channel in the game
	this is used to find out whether the character has joined the trade-channel
	]]--
	["MM-TRADE-CHANNEL-REGEX"] = "Trade",
	
	-- Mode Menu
	-- Mode Menu - Titel
	["MMT-MORE"] = "More",
	["MMT-QUESTS"] = "Quests/NPCs",
	["MMT-TRADE"] = "Trade",
	["MMT-LOOT"] = "Loot",
	["MMT-PET"] = "Pet",
	["MMT-RAID"] = "Raid",
	["MMT-COMBAT"] = "Combat",
	["MMT-AREA-EVENTS"] = "Areas",
	["MMT-MOUNT-EVENTS"] = "Mounts",
	["MMT-FISHING-EVENTS"] = "Fishing",
	["MMT-DRUNKARD-EVENTS"] = "Tipsy and Drunken",
	
	-- ModeMenu - Eintraege
	["MM-FISHING-TITLE"] = "While fishing",
	["MM-FISHING-TEXT"] = "Talks while the fishing pole is out",
	
	["MM-FISHING_START-TITLE"] = "# Throwing the fishing pole",
	["MM-FISHING_START-TEXT"] = "Fired when you throw out the fishing pole",
	
	["MM-FISHING_END-TITLE"] = "# Pulling out the fishing pole",
	["MM-FISHING_END-TEXT"] = "Fired when you pull out the fishing hole",
	
	["MM-FISHING_LUCK-TITLE"] = "# Fishing luck",
	["MM-FISHING_LUCK-TEXT"] = "If there's something on the fishing pole",
	
	["MM-MOUNTED-TITLE"] = "While mounted",
	["MM-MOUNTED-TEXT"] = "Talks while sitting on a mount",
	
	["MM-MOUNTING-TITLE"] = "# When mounting",
	["MM-MOUNTING-TEXT"] = "Fired when mounting",
	
	["MM-UNMOUNTING-TITLE"] = "# When unmounting",
	["MM-UNMOUNTING-TEXT"] = "Fired when unmounting",
	
	["MM-SOBER-TITLE"] = "# Getting sober again",
	["MM-SOBER-TEXT"] = "Fired when the character is getting sober again",
	
	["MM-DRUNKEN-TITLE"] = "# Getting drunk",
	["MM-DRUNKEN-TEXT"] = "Fired when the character is getting drunk",
	
	["MM-DRUNKEN_TIMED-TITLE"] = "Is drunk",
	["MM-DRUNKEN_TIMED-TEXT"] = "Talks while the character is drunken",
	
	["MM_EVENT_TESTING_TITLE"] = "Event-Testing",
	["MM-EVENT-TESTING-TEXT"] = "** only used  for testing**",
	
	["MM-LEVELUP-TITLE"] = "# I level up",
	["MM-LEVELUP-TEXT"] = "Fired when you level up",
	
	["MM-LEAVING-TITLE"] = "# I am leaving",
	["MM-LEAVING-TEXT"] = "Fired when you camp to leave wow",
	
	["MM-QUEST-COMPLETE-TITLE"] = "# Quest completed",
	["MM-QUEST-COMPLETE-TEXT"] = "Fired when you complete a quest.",
	
	["MM-NPC-TALK-START-TITLE"] = "# Start talking to NPC",
	["MM-NPC-TALK-START-TEXT"] = "Fired when you talk to an npc\nThis event typically fires when you are given several choices, including choosing to sell item, select available and active quests, just talk about something, or bind to a location. Even when the the only available choices are quests.",
	
	["MM-NPC-TALK-END-TITLE"] ="# End talking to NPC",
	["MM-NPC-TALK-END-TEXT"] = "Fired when you close the talk window for an npc.",
	
	["MM-NPC-TALKING-TITLE"] = "While talking to NPC",
	["MM-NPC-TALKING-TEXT"] = "Talks while you are talking to an npc.",
	
	["MM-TRADE-SHOW-TITLE"] = "# Trade window opened",
	["MM-TRADE-SHOW-TEXT"] = "Fired when you open the trade window",
	
	["MM-MERCHANT-SHOW-TITLE"] = "While merchant window shown",
	["MM-MERCHANT-SHOW-TEXT"] = "Talking while the merchant window is shown.",
	
	["MM-MERCHANT-OPENED-TITLE"] = "# Merchant window opened",
	["MM-MERCHANT-OPENED-TEXT"] = "Fired when the merchant window is opened.",
	
	["MM-MERCHANT-CLOSED-TITLE"] = "# Merchant window closed",
	["MM-MERCHANT-CLOSED-TEXT"] = "Fired when the merchant window is closed.",
	
	["MM-TRADE-MONEY-CHANGED-TITLE"] = "# Trade money value changed",
	["MM-TRADE-MONEY-CHANGED-TEXT"] = "Fired when the counterpart changes the value of the money in the trade window.",
	
	["MM-TRADE-CLOSED-TITLE"] = "# Trade window closed",
	["MM-TRADE-CLOSED-TEXT"] = "Fired when you closed the trade window",
	
	["MM-LOOTING-TITLE"] = "Looting",
	["MM-LOOTING-TEXT"] = "Talks when you are looting a corpse",
	
	["MM-LOOTING-START-TITLE"] = "# Start looting",
	["MM-LOOTING-START-TEXT"] = "Fired when you start looting a corpse",
	
	["MM-LOOTING-END-TITLE"] = "# Stop looting",
	["MM-LOOTING-END-TEXT"] = "Fired when you stop looting a corpse",
	
	["MM-PET-ATTACK-START-TITLE"] = "# Pet begings attacking",
	["MM-PET-ATTACK-START-TEXT"] = "Fired when the player's pet begins attacking.",
	
	["MM-READY-CHECK-TITLE"] = "# Raid checks ready",
	["MM-READY-CHECK-TEXT"] = "Fired when a Ready Check is performed by the raid leader.",
	
	["MM-DUEL-REQUESTED-TITLE"] = "# Duel request",
	["MM-DUEL-REQUESTED-TEXT"] = "Fired when someone requests a duel",
	
	["MM-UNIT-SPELLCAST-START-TITLE"] = "# Casting a timed spell",
	["MM-UNIT-SPELLCAST-START-TEXT"] = "Fired when you cast a spell with a cast time (not instant or channeled)",
	
	["MM-DUEL-FINISHED-TITLE"] = "# Duel finished",
	["MM-DUEL-FINISHED-TEXT"] = "Fired when you finish a duel",
	
	["MM-LOSE-CONTROL-TITLE"] = "# Loosing control",
	["MM-LOSE-CONTROL-TEXT"] = "Fired whenever you are unable to control the character. Examples are when afflicted by fear or when using a taxi.",
	
	["MM-KILLED_HOSTILE-TITLE"] = "# Killed hostile",
	["MM-KILLED_HOSTILE-TEXT"] = "Fired when you are the killing blow against any NPC or player.",
	
	["MM-I-WAS-HIT-TITLE"] = "# I was hit",
	["MM-I-WAS-HIT-TEXT"] = "Fired when somebody hits you",
	
	["MM-SELF-HEALING-TIMED-TITLE"] = "While healing myself",
	["MM-SELF-HEALING-TIMED-TEXT"] = "Talking while i am healing",
	
	["MM-SELF-HEALING-START-TITLE"] = "# Someone heals me",
	["MM-SELF-HEALING-START-TEXT"] = "Fired when someone set a heal on me",
	
	["MM-ENEMY-MISSES-TITLE"] = "# Hostile misses me",
	["MM-ENEMY-MISSES-TEXT"] = "Fired when a hostile misses you",
	
	["MM-ME-HITS-TITLE"] = "# I made damage",
	["MM-ME-HITS-TEXT"] = "Fired when you make damage to someone",
	
	["MM-PET-HITS-TITLE"] = "# My pet made damage",
	["MM-PET-HITS-TEXT"] = "Fired when your pet makes damage to someone",
	
	["MM-PET-PET-HAPPY-TITLE"]= "Pet is happy",
	["MM-PET-PET-HAPPY-TEXT"]= "Talking while pet is happy",
	
	["MM-PET-PET-CONTENT-TITLE"]= "Pet is content",
	["MM-PET-PET-CONTENT-TEXT"]= "Talking while pet is content",
	
	["MM-PET-PET-UNHAPPY-TITLE"]= "Pet is unhappy",
	["MM-PET-PET-UNHAPPY-TEXT"]= "Talking while pet is unhappy",
	
	["MM-PET-PET-CONTENT2UNHAPPY-TITLE"]= "# Pet becomes unhappy",
	["MM-PET-PET-CONTENT2UNHAPPY-TEXT"]= "Fired when pet becomes unhappy",
	
	["MM-IN-COMBAT-TITLE"] = "I'm in a combat",
	["MM-IN-COMBAT-TEXT"] = "Talking when you're in a combat",
	
	["MM-FRIENDLY-PLAYER-DIES-TITLE"] = "# friendly player dies",
	["MM-FRIENDLY-PLAYER-DIES-TEXT"] = "Fired when a friendly player dies",
	
	["MM-CITY-ENTER-TITLE"] = "# Entering the city", 
	["MM-CITY-ENTER-TEXT"] = "Fired if you are entering the city.",
	
	["MM-CITY-LEAVE-TITLE"] = "# Leaving the city", 
	["MM-CITY-LEAVE-TEXT"] = "Fired if you are leaving the city.",
	
	["MM-CITY-TITLE"] = "City", 
	["MM-CITY-TEXT"] = "Talking while you are in the city",
	
	["MM-OUTSIDE-THE-CITY-TITLE"] = "Outside the city",
	["MM-OUTSIDE-THE-CITY-TEXT"] = "Talking while you are NOT in the city",
	
	["MM-STEALTH_START-TITLE"] = "# Stealth is activated",
	["MM-STEALTH_START-TEXT"] = "Fired when you going into stealth mode",
	
	["MM-STEALTH_END-TITLE"] = "# Stealth is removed",
	["MM-STEALTH_END-TEXT"] = "Fired when you leaving the stealth mode",
	
	["MM-SPELLBOOK_OPEN-TITLE"] = "# I open the spellbook",
	["MM-SPELLBOOK_OPEN-TEXT"] = "Fired when you open your spellbook",
	
	["MM-OUT-COMBAT-TITLE"] = "I'm not in a combat",
	["MM-OUT-COMBAT-TEXT"] = "Talking when you're NOT in a combat",
	
	["MM-PET-DIES-TITLE"] = "# Pet dies",
	["MM-PET-DIES-TEXT"] = "Fired when your pet dies.",
	
	["MM-OOM-TITLE"] = "# Out of mana",
	["MM-OOM-TEXT"] = "Fired when mana is falling under 20%.",
	
	["MM-OOH-TITLE"] = "# Out of health",
	["MM-OOH-TEXT"] = "Fired when health is falling under 25%.",
	
	["MM-TAXIMAP-OPENED-TITLE"] = "# Opening taximap",
	["MM-TAXIMAP-OPENED-TEXT"] = "Fired when the taxi viewer is opened.",
	
	["MM-TAXIMAP-CLOSED-TITLE"] = "# Closing taximap",
	["MM-TAXIMAP-CLOSED-TEXT"] = "Fired when the taxi frame is closed.",
	
} end )