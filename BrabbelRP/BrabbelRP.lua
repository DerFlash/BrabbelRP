--[[

Die Modi sollten eventuell noch untereinander abhänig gemacht werden können.
Dafür wiederum wäre eine aktive Liste von Event-States nötig, welche zum einen States der genutzten aber auch states der abhängigen events enthält, statt nur die derzeit aktive states der aktiven kategorien...
Beispiel: Ausserhalb/Innerhalb der Stadt sollte dennoch nur ausserhalb des Kampfes aktiv sein.

]]--

local Translate = AceLibrary("AceLocale-2.2"):new("BrabbelRP")

-- holds the default "Gebrabbel"
BrabbelRP_default = {}

BrabbelRP = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0")

Translate:EnableDebugging()

-- register chat commands
-- now we can use /brabbelrp ingame to configure the BrabbelRP
local options = { 
    type='group',
    args = {
		toggleWindow = {
	    	type = 'execute',
	    	name = "toggleWindow",
		    desc = "Show the BrabbelRP window",
		    func = "ToggleWindowOpen"
    	},
		toggleIcon = {
	    	type = 'execute',
	    	name = "toggleIcon",
		    desc = "Sets the BrabbelRP icon visible/invisible",
		    func = "toggleIcon"
    	},
		translate = {
    		type='text',
    		name = "translate",
    		desc = "This function is only used by developers",
    		usage = "<Category Name here>",
    		get = false,
    		set = "translate",
    	},
    	activateCat = {
    		type='text',
    		name = "activateCat",
    		desc = "activate category",
    		usage = "<Category Name here>",
    		get = false,
    		set = "activateCat",
    	},
		deactivateCat = {
    		type='text',
    		name = "deactivateCat",
    		desc = "deactivate category",
    		usage = "<Category Name here>",
    		get = false,
    		set = "deactivateCat",
    	},
    	showActiveCats = {
    		type='execute',
    		name = "showActiveCats",
    		desc = "show active category",
    		func = "showActiveCats"
    	},
    	addCat = {
	    	type = 'text',
	    	name = "addCategory",
		    desc = "add a new category",
		    usage = "<Category Name here>",
		    get = false,
		    set = "addCategory"
    	},
    	showCats = {
	    	type = 'execute',
	    	name = "showCategories",
		    desc = "show all categories",
		    func = "showCategories"
    	},
    	addLine = {
	    	type = 'text',
	    	name = "addLine",
		    desc = "add a new line to a category",
		    usage = "<Category Name here> line='<Line text here>'",		    
		    get = false,
		    set = "consoleAddLine"
    	},
    	changeLine = {
	    	type = 'text',
	    	name = "changeLine",
		    desc = "change an old line to a new line",
		    usage = "<Category Name here> pos=<Linenumber here> line='<Line text here>'",
		    get = false,
		    set = "consoleChangeLine"
    	},
    	changeCat = {
	    	type = 'text',
	    	name = "changeCategory",
		    desc = "change a category-name",
		    usage = "<old Category Name here> new=<new Category name here>",
		    get = false,
		    set = "consoleChangeCategory"
    	},
    	showLines = {
	    	type = 'text',
	    	name = "showCategory",
		    desc = "show all lines for a certain category",
		    usage = "<Category Name here>",
		    get = false,
		    set = "showLines"
    	},
    	delCat = {
	    	type = 'text',
	    	name = "delCategory",
		    desc = "delete a certain category and all its lines!",
		    usage = "<Category Name here>",
		    get = false,
		    set = "deleteCategory"
    	},
    	setDefaultTimer = {
	    	type = 'text',
	    	name = "setDefaultTimer",
		    desc = "set the time after which the addon will try to do something with the specified probability!",
		    usage = "<Seconds here>",
		    get = false,
		    set = "setDefaultTimer"
    	},
		setRepPrevent = {
	    	type = 'text',
	    	name = "setRepPrevent",
		    desc = "set the time for the repeating prevention!",
		    usage = "<Seconds here>",
		    get = false,
		    set = "setRepPrevent"
    	},
		getRepPrevent = {
	    	type = 'execute',
	    	name = "getRepPrevent",
		    desc = "get the time for the repeating prevention!",
		    func = "getRepPrevent"
    	},
        getDefaultTimer = {
	    	type = 'execute',
	    	name = "getDefaultTimer",
		    desc = "get the time after which the addon will try to do something with the specified probability!",
		    func = "getDefaultTimer"
    	},
    	setDefaultChance = {
	    	type = 'text',
	    	name = "setDefaultChance",
		    desc = "set the probability with which the addon will try to do something with the specified time!",
		    usage = "<Chance in percent>",
		    get = false,
		    set = "setDefaultChance"
    	},
        getDefaultChance = {
	    	type = 'execute',
	    	name = "getDefaultChance",
		    desc = "get the probability with which the addon will try to do something with the specified time!",
		    func = "getDefaultChance"
    	},
        getTimerFor = {
	    	type = 'text',
	    	name = "getTimerFor",
		    desc = "get timer of a category",
		    usage = "<Categoryname here>",
		    get = false,
		    set = "getTimerFor"
    	},
    	getChanceFor = {
	    	type = 'text',
	    	name = "getChanceFor",
		    desc = "get chance of a category",
		    usage = "<Categoryname here>",
		    get = false,
		    set = "getChanceFor"
    	},
    	
    	setTimerFor = {
	    	type = 'text',
	    	name = "setTimerFor",
		    desc = "set timer of a category",
		    usage = "<Categoryname here> <Timer here>",
		    get = false,
		    set = "consoleSetTimerFor"
    	},
    	setChanceFor = {
	    	type = 'text',
	    	name = "setChanceFor",
		    desc = "set chance of a category",
		    usage = "<Categoryname here> <Chance here>",
		    get = false,
		    set = "consoleSetChanceFor"
    	},
    },
}
BrabbelRP:RegisterChatCommand({"/brabbelrp", "/brp","/brabbel"}, options)
BrabbelRP:RegisterDB("BrabbelRPDB", "BrabbelRPDBPC", "char")

BrabbelRP:RegisterDefaults("char",
  {
	--so soll die DB intern aussehen
	["categories"] = {
	},
	["activeCats"] = {
	},
	["defaultTimer"]	= 300,
	["repPrevent"]		= 30,
	["defaultChance"]	= 5,
	["active"] 			= true,
	["debug"] 			= false,
	["firstStart"] 		= true,
	["stealthProtected"] = true,
  }
)

--[[
	BrabbelModi_Data - Format:
	["MODE_KATEGORY_NAME1"] = {
		["SOME_UNIQUE_MODE_ID_LIKE_M1_E1"] = {
			["name"]			= "City", 
			["tooltip"]			= "Dieser Modus laesst diese Kategorie nur innerhalb einer Stadt brabbeln",
			["isInstantEvent"]		= false,
			["activating_events"]	= {
				  -- these events set the category with this non-instant mode active
				[1]	= "ZONE_CHANGED_INDOORS",	-- you can add regexp-tests for arg1,arg2,... by addin "|regexp|regexp|..."
				...
			}
			["deactivating_events"]	= {
				-- these events set the category with this non-instant mode deactive
				[1]	= "ZONE_CHANGED_NEW_AREA",
				...
			}

		} ,
		["SOME_UNIQUE_MODE_ID_LIKE_M1_E2"] = {
			["name"]			= "Outside the city", 
			["tooltip"]			= "Dieser Modus laesst diese Kategorie nur ausserhalb einer Stadt brabbeln",
			["isInstantEvent"]		= true,
			["activating_events"]	= {
				-- these events throw the "tryToSaySomtehting" for the category with this instant mode
				[1]	= "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS",
				...
			}
			["deactivating_events"]	= nil -- an instante mode does not need to have deactivating events
		} ,
		...
	},
	["MODE_KATEGORY_NAME2"] = {
		...
	}
	...
]]--
-- REQUESTS:
-- atm none
BrabbelModi_Data = {}

function BrabbelRP:initModeMenu()

	BrabbelModi_Data = {
		["Tests"] = {
			["TESTING"] = {
				["name"]				= Translate["MM_EVENT_TESTING_TITLE"],
				["tooltip"]				= Translate["MM-EVENT-TESTING-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					-- "CHAT_MSG_SYSTEM"
					[1]	= "CHAT_MSG_MONSTER_EMOTE",
					[2]	= "CHAT_MSG_BG_SYSTEM_NEUTRAL",
					[3]	= "PLAYER_ENTERING_WORLD",
					[4]	= "CHAT_MSG_EMOTE",
					[5]	= "CHAT_MSG_TEXT_EMOTE",
					[6]	= "CHAT_MSG_COMBAT_FRIENDLY_DEATH",
					[7]	= "UPDATE_SHAPESHIFT_FORM",
				},
				["deactivating_events"] = nil,
			},
		},
		[Translate["MMT-DRUNKARD-EVENTS"]] = {
			["BRP_NUECHTERN"] = {
				["name"]				= Translate["MM-SOBER-TITLE"],
				["tooltip"]				= Translate["MM-SOBER-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "CHAT_MSG_SYSTEM@" .. [[BRABBELBOOL = function () if (arg1:find("DRUNK_MESSAGE_SELF1") ~= nil) then return true; end; end]],
				},
				["deactivating_events"]	= nil,
			},
			["BRP_BETRUNKEN"] = {
				["name"]				= Translate["MM-DRUNKEN-TITLE"],
				["tooltip"]				= Translate["MM-DRUNKEN-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "CHAT_MSG_SYSTEM@" .. [[BRABBELBOOL = function () if (arg1:find("DRUNK_MESSAGE_SELF2") ~= nil or arg1:find("DRUNK_MESSAGE_SELF3") ~= nil or arg1:find("DRUNK_MESSAGE_SELF4") ~= nil) then return true; end; end]],
				},
				["deactivating_events"]	= nil,
			},
			["BRP_BETRUNKEN_TIMED"] = {
				["name"]				= Translate["MM-DRUNKEN_TIMED-TITLE"],
				["tooltip"]				= Translate["MM-DRUNKEN_TIMED-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1] = "CHAT_MSG_SYSTEM@" .. [[BRABBELBOOL = function () if (arg1:find("DRUNK_MESSAGE_SELF2") ~= nil or arg1:find("DRUNK_MESSAGE_SELF3") ~= nil or arg1:find("DRUNK_MESSAGE_SELF4") ~= nil) then return true; end; end]],
				},
				["deactivating_events"]	= {
					[1] = "CHAT_MSG_SYSTEM@" .. [[BRABBELBOOL = function () if (arg1:find("DRUNK_MESSAGE_SELF1") ~= nil) then return true; end; end]],
				},
			},
		},
		[Translate["MMT-FISHING-EVENTS"]] = {
			["BRP_ANGELN"] = {
				["name"]				= Translate["MM-FISHING-TITLE"],
				["tooltip"]				= Translate["MM-FISHING-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1] = "COMBAT_TEXT_UPDATE|AURA_START|Angeln",
					--PLAYER_AURAS_CHANGED
				},
				["deactivating_events"]	= {
					[1] = "COMBAT_TEXT_UPDATE|AURA_END|Angeln",
					--[1] = "UNIT_AURA", -- may also work, but not sure if this will be fired on other times while mounted...
				},
			},
			["BRP_ANGELN_START"] = {
				["name"]				= Translate["MM-FISHING_START-TITLE"],
				["tooltip"]				= Translate["MM-FISHING_START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "COMBAT_TEXT_UPDATE|AURA_START|Angeln",
				},
				["deactivating_events"]	= nil,
			},
			["BRP_ANGELN_END"] = {
				["name"]				= Translate["MM-FISHING_END-TITLE"],
				["tooltip"]				= Translate["MM-FISHING_END-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "COMBAT_TEXT_UPDATE|AURA_END|Angeln",
				},
				["deactivating_events"]	= nil,
			},
			["BRP_ANGELN_FANG"] = {
				["name"]				= Translate["MM-FISHING_LUCK-TITLE"],
				["tooltip"]				= Translate["MM-FISHING_LUCK-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "LOOT_OPENED@" .. [[BRABBELBOOL = function() if (IsFishingLoot()) then return true; end; end]],
				},
				["deactivating_events"]	= nil,
			},
		},
		[Translate["MMT-MOUNT-EVENTS"]] = {
			["BRP_MOUNTED"] = {
				["name"]				= Translate["MM-MOUNTED-TITLE"],
				["tooltip"]				= Translate["MM-MOUNTED-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1] = "PLAYER_AURAS_CHANGED@isMounted",
					--PLAYER_AURAS_CHANGED
				},
				["deactivating_events"]	= {
					[1] = "PLAYER_AURAS_CHANGED@isUnMounted",
					--[1] = "UNIT_AURA", -- may also work, but not sure if this will be fired on other times while mounted...
				},
			},
			["BRP_MOUNTING"] = {
				["name"]				= Translate["MM-MOUNTING-TITLE"],
				["tooltip"]				= Translate["MM-MOUNTING-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "PLAYER_AURAS_CHANGED@isMounting",
				},
				["deactivating_events"]	= nil,
			},
			["BRP_UNMOUNTING"] = {
				["name"]				= Translate["MM-UNMOUNTING-TITLE"],
				["tooltip"]				= Translate["MM-UNMOUNTING-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "PLAYER_AURAS_CHANGED@isUnMounting",
				},
				["deactivating_events"]	= nil,
			},
			["TAXIMAP_OPENED"] = {
				["name"]				= Translate["MM-TAXIMAP-OPENED-TITLE"],
				["tooltip"]				= Translate["MM-TAXIMAP-OPENED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "TAXIMAP_OPENED@" .. [[BRABBELBOOL = function() if (TaxiNodeGetType(1) ~= "NONE") then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["TAXIMAP_CLOSED"] = {
				["name"]				= Translate["MM-TAXIMAP-CLOSED-TITLE"],
				["tooltip"]				= Translate["MM-TAXIMAP-CLOSED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "TAXIMAP_CLOSED@" .. [[BRABBELBOOL = function() if (TaxiNodeGetType(1) ~= "NONE") then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
		},
		[Translate["MMT-MORE"]] = {
			["STEALTH_START"] = {
				["name"]				= Translate["MM-STEALTH_START-TITLE"],
				["tooltip"]				= Translate["MM-STEALTH_START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "UPDATE_STEALTH@" .. [[BRABBELBOOL = function() if (IsStealthed()) then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["STEALTH_END"] = {
				["name"]				= Translate["MM-STEALTH_END-TITLE"],
				["tooltip"]				= Translate["MM-STEALTH_END-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "UPDATE_STEALTH@" .. [[BRABBELBOOL = function() if (not IsStealthed()) then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["SPELLBOOK_OPEN"] = {
				["name"]				= Translate["MM-SPELLBOOK_OPEN-TITLE"],
				["tooltip"]				= Translate["MM-SPELLBOOK_OPEN-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "SPELLS_CHANGED|LeftButton|false",
					[2]	= "SPELLS_CHANGED|RightButton|false",
				},
				["deactivating_events"] = nil,
			},
			["LEVEL_UP"] = {
				["name"]				= Translate["MM-LEVELUP-TITLE"],
				["tooltip"]				= Translate["MM-LEVELUP-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "PLAYER_LEVEL_UP",
				},
				["deactivating_events"] = nil,
			},
			["LEAVING"] = {
				["name"]				= Translate["MM-LEAVING-TITLE"],
				["tooltip"]				= Translate["MM-LEAVING-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "PLAYER_CAMPING",
				},
				["deactivating_events"] = nil,
			},
		},
		[Translate["MMT-QUESTS"]] = {
			["QUEST_COMPLETE"] = {
				["name"]				= Translate["MM-QUEST-COMPLETE-TITLE"],
				["tooltip"] 			= Translate["MM-QUEST-COMPLETE-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"] = {
					[1] = "QUEST_COMPLETE",
				},
				["deactivating_events"] = nil,
			},
			-- "GOSSIP_SHOW"	Example: Talking to a guard or the beginning of talking to an innkeeper.
			["NPC_TALK_START"] = {
				["name"]				= Translate["MM-NPC-TALK-START-TITLE"],
				["tooltip"]				= Translate["MM-NPC-TALK-START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "GOSSIP_SHOW",
				},
				["deactivating_events"]	= nil,
			},
			["NPC_TALK_END"] = {
				["name"]				= Translate["MM-NPC-TALK-END-TITLE"],
				["tooltip"]				= Translate["MM-NPC-TALK-END-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "GOSSIP_CLOSED",
				},
				["deactivating_events"]	= nil,
			},
			["NPC_TALKING"] = {
				["name"]				= Translate["MM-NPC-TALKING-TITLE"],
				["tooltip"]				= Translate["MM-NPC-TALKING-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "GOSSIP_SHOW",
				},
				["deactivating_events"]	= {
					[1] = "GOSSIP_CLOSED",
				},
			},
		},
		[Translate["MMT-TRADE"]] = {
			["TRADE_SHOW"] = {
				["name"]				= Translate["MM-TRADE-SHOW-TITLE"],
				["tooltip"]				= Translate["MM-TRADE-SHOW-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "TRADE_SHOW",
				},
				["deactivating_events"]	= nil,
			},
			["MERCHANT_SHOWN"] = {
				["name"]				= Translate["MM-MERCHANT-SHOW-TITLE"],
				["tooltip"]				= Translate["MM-MERCHANT-SHOW-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1] = "MERCHANT_SHOW", -- "MERCHANT_SHOW"	When you first see a vendor's goods
				},
				["deactivating_events"]	= {
					[1] = "MERCHANT_CLOSED",
				},
			},
			["MERCHANT_OPENED"] = {
				["name"]				= Translate["MM-MERCHANT-OPENED-TITLE"],
				["tooltip"]				= Translate["MM-MERCHANT-OPENED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "MERCHANT_SHOW", -- "MERCHANT_SHOW"	When you first see a vendor's goods
				},
				["deactivating_events"]	= nil,
			},
			["MERCHANT_CLOSED"] = {
				["name"]				= Translate["MM-MERCHANT-CLOSED-TITLE"],
				["tooltip"]				= Translate["MM-MERCHANT-CLOSED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "MERCHANT_CLOSED",
				},
				["deactivating_events"]	= nil,
			},
			["TRADE_MONEY_CHANGED"] = {
				["name"]				= Translate["MM-TRADE-MONEY-CHANGED-TITLE"],
				["tooltip"]				= Translate["MM-TRADE-MONEY-CHANGED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "TRADE_MONEY_CHANGED",
				},
				["deactivating_events"]	= nil,
			},
			["TRADE_CLOSED"] = {
				["name"]				= Translate["MM-TRADE-CLOSED-TITLE"],
				["tooltip"]				= Translate["MM-TRADE-CLOSED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "TRADE_CLOSED",
				},
				["deactivating_events"]	= nil,
			},
		},
		[Translate["MMT-LOOT"]] = {
			["LOOTING"] = {
				["name"]				= Translate["MM-LOOTING-TITLE"],
				["tooltip"]				= Translate["MM-LOOTING-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "LOOT_OPENED@" .. [[BRABBELBOOL = function() if (not IsFishingLoot()) then return true; end; end]],
				},
				["deactivating_events"]	= {
					[1]	= "LOOT_CLOSED@" .. [[BRABBELBOOL = function() if (not IsFishingLoot()) then return true; end; end]],
				},
			},
			["LOOTING_START"] = {
				["name"]				= Translate["MM-LOOTING-START-TITLE"],
				["tooltip"]				= Translate["MM-LOOTING-START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "LOOT_OPENED@" .. [[BRABBELBOOL = function() if (not IsFishingLoot()) then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["LOOTING_END"] = {
				["name"]				= Translate["MM-LOOTING-END-TITLE"],
				["tooltip"]				= Translate["MM-LOOTING-END-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "LOOT_CLOSED@" .. [[BRABBELBOOL = function() if (not IsFishingLoot()) then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
		},
		[Translate["MMT-PET"]] = {
			["PET_ATTACK_START"] = {
				["name"]				= Translate["MM-PET-ATTACK-START-TITLE"],
				["tooltip"]				= Translate["MM-PET-ATTACK-START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "PET_ATTACK_START",
				},
				["deactivating_events"] = nil,
			},
			["PET_DIES"] = {
				["name"]				= Translate["MM-PET-DIES-TITLE"],
				["tooltip"]				= Translate["MM-PET-DIES-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_COMBAT_FRIENDLY_DEATH@" .. [[ BRABBELBOOL = function () if (UnitName("pet") and arg1 ~= nil and string.find( arg1, (UnitName("pet")) )) then return true; end; end ]],
				},
				["deactivating_events"] = nil,
			},
			["PET_HAPPY"] = {
				["name"]				= Translate["MM-PET-PET-HAPPY-TITLE"],
				["tooltip"]				= Translate["MM-PET-PET-HAPPY-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr == 3) then return true; end; end]],
				},
				["deactivating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr ~= 3) then return true; end; end]],
				},
			},
			["PET_CONTENT"] = {
				["name"]				= Translate["MM-PET-PET-CONTENT-TITLE"],
				["tooltip"]				= Translate["MM-PET-PET-CONTENT-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr == 2) then return true; end; end]],
				},
				["deactivating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr ~= 2) then return true; end; end]],
				},
			},
			["PET_UNHAPPY"] = {
				["name"]				= Translate["MM-PET-PET-UNHAPPY-TITLE"],
				["tooltip"]				= Translate["MM-PET-PET-UNHAPPY-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr == 1) then return true; end; end]],
				},
				["deactivating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function() local zufr, faktor, status = GetPetHappiness(); if (zufr ~= 1) then return true; end; end]],
				},
			},
			["PET_CONTENT2UNHAPPY"] = {
				["name"]				= Translate["MM-PET-PET-CONTENT2UNHAPPY-TITLE"],
				["tooltip"]				= Translate["MM-PET-PET-CONTENT2UNHAPPY-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "UNIT_HAPPINESS|pet@".. [[BRABBELBOOL = function()
						local zufr, faktor, status = GetPetHappiness();
						if (status < 0 and zufr == 1 and alreadyC2Ued == nil) then
							alreadyC2Ued = true;
							return true;
						elseif (status > 0 and zufr ~= 1 and alreadyC2Ued ~= nil) then
							alreadyC2Ued = nil;
						end;
					end]],
				},
				["deactivating_events"]	= nil,
			},
			
		},
		[Translate["MMT-RAID"]] = {
			["READY_CHECK"] = {
				["name"]				= Translate["MM-READY-CHECK-TITLE"],
				["tooltip"]				= Translate["MM-READY-CHECK-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "READY_CHECK",
				},
				["deactivating_events"] = nil,
			},
		},
		[Translate["MMT-COMBAT"]] = {
			["PLAYER_OOM"] = {
				["name"]				= Translate["MM-OOM-TITLE"],
				["tooltip"]				= Translate["MM-OOM-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "UNIT_MANA|player@isOom,20",
				},
				["deactivating_events"] = nil,
			},
			["PLAYER_OOH"] = {
				["name"]				= Translate["MM-OOH-TITLE"],
				["tooltip"]				= Translate["MM-OOH-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "UNIT_HEALTH|player@isOoh,25",
				},
				["deactivating_events"] = nil,
			},
			["DUEL_REQUESTED"] = {
				["name"]				= Translate["MM-DUEL-REQUESTED-TITLE"],
				["tooltip"]				= Translate["MM-DUEL-REQUESTED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "DUEL_REQUESTED",
				},
				["deactivating_events"] = nil,
			},
			["UNIT_SPELLCAST_START"] = {
				["name"]				= Translate["MM-UNIT-SPELLCAST-START-TITLE"],
				["tooltip"]				= Translate["MM-UNIT-SPELLCAST-START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1] = "UNIT_SPELLCAST_SUCCEEDED@" .. [[BRABBELBOOL = function () if (arg3 ~= nil and arg3 ~= "") then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["DUEL_FINISHED"] = {
				["name"]				= Translate["MM-DUEL-FINISHED-TITLE"],
				["tooltip"]				= Translate["MM-DUEL-FINISHED-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "DUEL_FINISHED",
				},
				["deactivating_events"] = nil,
			},
			["LOSE_CONTROL"] = {
				["name"]				= Translate["MM-LOSE-CONTROL-TITLE"],
				["tooltip"]				= Translate["MM-LOSE-CONTROL-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "PLAYER_CONTROL_LOST",
				},
				["deactivating_events"] = nil,
			},
			["KILLED_HOSTILE"] = {
				["name"]				= Translate["MM-KILLED_HOSTILE-TITLE"],
				["tooltip"]				= Translate["MM-KILLED_HOSTILE-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_COMBAT_HOSTILE_DEATH@" .. [[BRABBELBOOL = function () if (arg1:find("SELFKILLOTHER") ~= nil) then return true; end; end]],
					[2]	= "CHAT_MSG_COMBAT_FRIENDLY_DEATH@" .. [[BRABBELBOOL = function () if (arg1:find("SELFKILLOTHER") ~= nil) then return true; end; end]],
				},
				["deactivating_events"] = nil,
			},
			["I_WAS_HIT"] = {
				["name"]				= Translate["MM-I-WAS-HIT-TITLE"],
				["tooltip"]				= Translate["MM-I-WAS-HIT-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "COMBAT_TEXT_UPDATE|DAMAGE",
					[2]	= "COMBAT_TEXT_UPDATE|SPELL_DAMAGE",
					[3]	= "COMBAT_TEXT_UPDATE|DAMAGE_CRIT",
					--[4]	= "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS",
					--[5]	= "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
				},
				["deactivating_events"] = nil,
			},
--[[	funktioniert nciht wirklich
			["SELF_HEALING_TIMED"] = {
				["name"]				= Translate["MM-SELF-HEALING-TIMED-TITLE"],
				["tooltip"]				= Translate["MM-SELF-HEALING-TIMED-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_SPELL_SELF_BUFF",
					[2]	= "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS",
				},
				["deactivating_events"]	= {
					
				},
			},
]]--
			["SELF_HEALING_START"] = {
				["name"]				= Translate["MM-SELF-HEALING-START-TITLE"],
				["tooltip"]				= Translate["MM-SELF-HEALING-START-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "COMBAT_TEXT_UPDATE|HEAL",
				},
				["deactivating_events"]	= nil,
			},
			["ENEMY_MISSES"] = {
				["name"]				= Translate["MM-ENEMY-MISSES-TITLE"],
				["tooltip"]				= Translate["MM-ENEMY-MISSES-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES",
					[2]	= "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES",
				},
				["deactivating_events"] = nil,
			},
			["ME_HITS"] = {
				["name"]				= Translate["MM-ME-HITS-TITLE"],
				["tooltip"]				= Translate["MM-ME-HITS-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_COMBAT_SELF_HITS@" .. [[BRABBELBOOL = function () if (arg1:find("VSENVIRONMENTALDAMAGE_HURTED_MYSELF") == nil) then return true; end; end]], -- in 'OnInititialize' werden einige PATTERNS des events markiert, welche eigens bekommenen Schaden bezeichnen... (da dieses event eigentlich nur feuern soll, wenn der char anderen schaden zufügt
					[2] = "CHAT_MSG_SPELL_SELF_DAMAGE",
				},
				["deactivating_events"] = nil,
			},
			["PET_HITS"] = {
				["name"]				= Translate["MM-PET-HITS-TITLE"],
				["tooltip"]				= Translate["MM-PET-HITS-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_SPELL_PET_DAMAGE",
				},
				["deactivating_events"] = nil,
			},
			["IN_COMBAT"] = {
				["name"]				= Translate["MM-IN-COMBAT-TITLE"],
				["tooltip"]				= Translate["MM-IN-COMBAT-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "PLAYER_REGEN_DISABLED",
				},
				["deactivating_events"]	= {
					[1]	= "PLAYER_REGEN_ENABLED",
				},
			},
			["OUT_COMBAT"] = {
				["name"]				= Translate["MM-OUT-COMBAT-TITLE"],
				["tooltip"]				= Translate["MM-OUT-COMBAT-TEXT"],
				["isInstantEvent"] 		= false,
				["activating_events"]	= {
					[1]	= "PLAYER_REGEN_ENABLED",
				},
				["deactivating_events"]	= {
					[1]	= "PLAYER_REGEN_DISABLED",
				},
			},
			["FRIENDLY_PLAYER_DIES"] = {
				["name"]				= Translate["MM-FRIENDLY-PLAYER-DIES-TITLE"],
				["tooltip"]				= Translate["MM-FRIENDLY-PLAYER-DIES-TEXT"],
				["isInstantEvent"] 		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_COMBAT_FRIENDLY_DEATH@" .. [[BRABBELBOOL = function ()
																	status, more = pcall(
																		function ()
																			x = string.find(arg1, "%s");
																			if (x == nil) then
																				return false;
																			end;
																			return UnitIsPlayer(string.sub(arg1, 1, x-1));
																		end
																	);
																	if (status) then return more;
																	else return false;
																	end
																end]],
				},
				["deactivating_events"]	= nil,
			},
		},
		[Translate["MMT-AREA-EVENTS"]] = {
			["CITY_ENTER"] = {
				["name"]				= Translate["MM-CITY-ENTER-TITLE"], 
				["tooltip"]				= Translate["MM-CITY-ENTER-TEXT"],
				["isInstantEvent"]		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|JOINED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
				},
				["deactivating_events"]	= nil,
			} ,
			["CITY_LEAVE"] = {
				["name"]				= Translate["MM-CITY-LEAVE-TITLE"], 
				["tooltip"]				= Translate["MM-CITY-LEAVE-TEXT"],
				["isInstantEvent"]		= true,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|SUSPENDED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
				},
				["deactivating_events"]	= nil,
			} ,
			["CITY"] = {
				["name"]				= Translate["MM-CITY-TITLE"], 
				["tooltip"]				= Translate["MM-CITY-TEXT"],
				["isInstantEvent"]		= false,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|JOINED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
					--[1]	= "ZONE_CHANGED_NEW_AREA@city",
				},
				["deactivating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|SUSPENDED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
				},
			} ,
			["OUTSIDE_THE_CITY"] = {
				["name"]				= Translate["MM-OUTSIDE-THE-CITY-TITLE"],
				["tooltip"]				= Translate["MM-OUTSIDE-THE-CITY-TEXT"],
				["isInstantEvent"]		= false,
				["activating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|SUSPENDED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
				},
				["deactivating_events"]	= {
					[1]	= "CHAT_MSG_CHANNEL_NOTICE|JOINED|||"..Translate["MM-TRADE-CHANNEL-REGEX"],
				},
			} ,
		},
	}

end

-- these words will be replaced when a quote is spoken
local ReplaceSomeWords_List = {
	["%pet"]	= [[BRABBELVALUE = UnitName("pet")]],
	["%p"]		= [[BRABBELVALUE = UnitName("pet")]],
	["%race"]	= [[BRABBELVALUE = UnitRace("player")]],
};

---------- startup functions ----------

function BrabbelRP:OnInitialize()
    -- Called when the addon is loaded
	
	-- initialize ModeMenu
	BrabbelRP:initModeMenu();
    
    --initialize localised GUI
    -- main title of mod
    BrabbelRPGUITitel:SetText(BrabbelRP.title)
    -- tabs
    BrabbelRPFormTab1:SetText("BrabbelRP")
    BrabbelRPFormTab2:SetText(Translate["General Settings"])
    title_general_settings:SetText(Translate["General Settings"])
    
    no_lines_in_this_cat:SetText(Translate["This cat has no quotes yet."])
    choose_quote_First:SetText(Translate["choose a quote first"])
    
    repPreventionFrame_note:SetText(Translate["repPreventionFrame_note"])
    timerFrame_note:SetText(Translate["timerFrame_note"])
    chanceFrame_note:SetText(Translate["chanceFrame_note"])
    
    -- Buttons
    SaveQuote_Text:SetText(Translate["Save Quote"])
    CatsScrollFrame_Title_Text:SetText(Translate["Categories"])
    CatsScrollFrame_Status_Text:SetText(Translate["Status"])
	CatsScrollFrame_Mode_Text:SetText(Translate["Mode"])
    CatsScrollFrame_TimerTitle_Text:SetText(Translate["Timer"])
    CatsScrollFrame_ChanceTitle_Text:SetText(Translate["Chance"])
    AddCat_Text:SetText(Translate["Add new category"])
    DeleteCat_Text:SetText(Translate["Delete selected category"])
	DeActivateAll_Text:SetText(Translate["Deactivate all"])
    LinesScrollFrame_Title_Text:SetText(Translate["Quotes"])
    AddLine_Text:SetText(Translate["Add new quote"])
    DeleteLine_Text:SetText(Translate["Delete selected quote"])
	BRP_CheckEnabledText:SetText(Translate["BrabbelRP enabled"])	
	BRP_DebugEnabledText:SetText(Translate["Debug mode"])
	BRP_StealthProtectText:SetText(Translate["Mute in stealth mode"])
	BRP_IconEnabledText:SetText(Translate["Minimap icon visible"])
    repPreventionFrame_Title_Text:SetText(Translate["Repeating prevention"])
    defaultTimerFrame_Title_Text:SetText(Translate["Default timer"])
    defaultChanceFrame_Title_Text:SetText(Translate["Default chance"])
	
	BrabbelRPForm_Defaults:SetText(Translate["Load defaults"]);
	CatLineSelection_Cats_Text:SetText(Translate["Categories"]);
	CatLineSelection_Cat_Text:SetText(Translate["Select a category"]);
	
	-- Tooltips localized
	
	TT_FIRST_HELP_TITLE = Translate["TT_FIRST_HELP_TITLE"];
	BrabbelRPForm_Help:SetText(Translate["TT_FIRST_HELP_TITLE"]);
	TT_FIRST_HELP_TEXT = Translate["TT_FIRST_HELP_TEXT"];
	
	TT_LOAD_DEFAULTS_TITLE = Translate["TT_LOAD_DEFAULTS_TITLE"];
	TT_LOAD_DEFAULTS_SHORT = Translate["TT_LOAD_DEFAULTS_SHORT"];
	TT_LOAD_DEFAULTS_TEXT = Translate["TT_LOAD_DEFAULTS_TEXT"];
	
	TT_ACTIVE_HELP_TITLE = Translate["TT_ACTIVE_HELP_TITLE"];
	TT_ACTIVE_HELP_TEXT_SHORT = Translate["TT_ACTIVE_HELP_TEXT_SHORT"];
	TT_ACTIVE_HELP_TEXT_ACTIVE = Translate["TT_ACTIVE_HELP_TEXT_ACTIVE"];
	TT_ACTIVE_HELP_TEXT_INACTIVE = Translate["TT_ACTIVE_HELP_TEXT_INACTIVE"];
	TT_ACTIVE_HELP_TEXT_SEMI = Translate["TT_ACTIVE_HELP_TEXT_SEMI"];

	TT_MODUS_HELP_TITLE = Translate["TT_MODUS_HELP_TITLE"];
	TT_MODUS_HELP_TEXT = Translate["TT_MODUS_HELP_TEXT"];
		
	TT_TIMER_HELP_TITLE = Translate["TT_TIMER_HELP_TITLE"];
	TT_TIMER_HELP_TEXT = Translate["TT_TIMER_HELP_TEXT"];
	TT_TIMER_HELP_INACTIVE = Translate["TT_TIMER_HELP_INACTIVE"];

	TT_CHANCE_HELP_TITLE = Translate["TT_CHANCE_HELP_TITLE"];
	TT_CHANCE_HELP_TEXT = Translate["TT_CHANCE_HELP_TEXT"];

	TT_COUNT_HELP_TITLE = Translate["TT_COUNT_HELP_TITLE"];
	TT_COUNT_HELP_TEXT = Translate["TT_COUNT_HELP_TEXT"];
	
	TT_IMPORTANT_HELP_TITLE = Translate["TT_IMPORTANT_HELP_TITLE"];
	TT_IMPORTANT_HELP_TEXT = Translate["TT_IMPORTANT_HELP_TEXT"];

	TT_LINES_TABLE_HELP_TITLE = Translate["TT_LINES_TABLE_HELP_TITLE"];
	TT_LINES_TABLE_HELP_TEXT = Translate["TT_LINES_TABLE_HELP_TEXT"];

	TT_LINES_HELP_TITLE = Translate["TT_LINES_HELP_TITLE"];
	TT_LINES_HELP_TEXT = Translate["TT_LINES_HELP_TEXT"];
		
	TT_DEBUG_HELP_TITLE = Translate["TT_DEBUG_HELP_TITLE"];
	TT_DEBUG_HELP_TEXT = Translate["TT_DEBUG_HELP_TEXT"];
	
	TT_STEALTHP_HELP_TITLE = Translate["TT_STEALTHP_HELP_TITLE"];
	TT_STEALTHP_HELP_TEXT = Translate["TT_STEALTHP_HELP_TEXT"];
	
	TT_ICONSW_HELP_TITLE = Translate["TT_ICONSW_HELP_TITLE"];
	TT_ICONSW_HELP_TITLE2 = Translate["TT_ICONSW_HELP_TITLE2"];
	TT_ICONSW_HELP_TEXT = Translate["TT_ICONSW_HELP_TEXT"];
	
	BRPInfo_Text:SetText("Version "..BrabbelRP.version.." - "..BrabbelRP.website);
    
	CreateFrame("Frame","BrabbelEventFrame"):SetScript("OnEvent", BrabbelRP_OnEvent); -- creates the frame that handels our events
	
	if (BrabbelRP:IsDebug()) then Translate:Debug(); end
	
	-- zeige den "lade default" button nur, wenn es auch default cats gibt!
	BrabbelRP:Try2Show_LoadDefaultButton()
	
	-- maybe we should load the default cats
	if (BrabbelRP.db.char.firstStart == true) then
	
		sprache = Translate:GetLocale();
		
		-- count the categories
		count = 0;
		foreach(self.db.char.categories, function(arg) count = count+1 end);
		
		if (count == 0 and BrabbelRP_default ~= nil and BrabbelRP_default[sprache] ~= nil) then
			BrabbelRP:LoadDefaultCats(sprache);
		end
		
		BrabbelRP.db.char.firstStart = false;
	end
	
	self:Print(Translate["BrabbelRP initialized"]); -- so bitte Lokalisierung nutzen

	-- todo: später entfernen... löscht derzeit die cats im alten format
	for i in ipairs(BrabbelRP.db.char.activeCats) do
		table.remove(BrabbelRP.db.char.activeCats, i);
	end
	
	
	if (BrabbelRP.db.char.showIcon ~= nil and BrabbelRP.db.char.showIcon == false) then
		getglobal("BrabbelButtonFrame"):Hide();
		getglobal("BRP_IconEnabled"):SetChecked(false);
	end
	
	
	-- diese Patterns werden ergänzt um sie beim Modus-Check besser zu erkennen.
	SELFKILLOTHER  = SELFKILLOTHER  .. "[SELFKILLOTHER]";
	VSENVIRONMENTALDAMAGE_DROWNING_SELF = VSENVIRONMENTALDAMAGE_DROWNING_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	VSENVIRONMENTALDAMAGE_FALLING_SELF = VSENVIRONMENTALDAMAGE_FALLING_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	VSENVIRONMENTALDAMAGE_FATIGUE_SELF = VSENVIRONMENTALDAMAGE_FATIGUE_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	VSENVIRONMENTALDAMAGE_FIRE_SELF = VSENVIRONMENTALDAMAGE_FIRE_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	VSENVIRONMENTALDAMAGE_LAVA_SELF = VSENVIRONMENTALDAMAGE_LAVA_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	VSENVIRONMENTALDAMAGE_SLIME_SELF = VSENVIRONMENTALDAMAGE_SLIME_SELF .. "[VSENVIRONMENTALDAMAGE_HURTED_MYSELF]";
	DRUNK_MESSAGE_SELF1 = DRUNK_MESSAGE_SELF1 .. "[DRUNK_MESSAGE_SELF1]";
	DRUNK_MESSAGE_SELF2 = DRUNK_MESSAGE_SELF2 .. "[DRUNK_MESSAGE_SELF2]";
	DRUNK_MESSAGE_SELF3 = DRUNK_MESSAGE_SELF3 .. "[DRUNK_MESSAGE_SELF3]";
	DRUNK_MESSAGE_SELF4 = DRUNK_MESSAGE_SELF4 .. "[DRUNK_MESSAGE_SELF4]";
	
	
end

function BrabbelRP:OnEnable()
    -- Called when the addon is enabled
    self.db.char.active = true;
    self:startAllTimersAndEvents();
end

function BrabbelRP:OnDisable()
    -- Called when the addon is disabled
    self.db.char.active = false;
    self:stopAllTimersAndEvents();
end

---------- TIMER, CHANCE -------------------
-- getTimerFor category
function BrabbelRP:getTimerFor(catname)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end
	
  cattimer = self.db.char.categories[catname].timer;
  
	--if (BrabbelRP:IsDebug()) then self:Print(Translate["timer for category"].." '"..catname.."': "..cattimer.." "..Translate["second(s)"]); end

	return cattimer
end

-- getChanceFor category
function BrabbelRP:getChanceFor(catname)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end
	
  catchance = self.db.char.categories[catname].chance;
  
	--if (BrabbelRP:IsDebug()) then self:Print(Translate["chance for category"].." '"..catname.."': "..catchance.."%"); end

	return catchance
end

-- setTimerForParse - for textbased mod
function BrabbelRP:consoleSetTimerFor(arg)
	arglen = string.len(arg)
	x,y = string.find(arg, " ")
	if (x == nil or y == nil) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["Usage"]..": /brabbelrp setTimerFor <"..Translate["category"].."> <"..Translate["second(s)"]..">'"); end
		return
	end
	
	--extract category and time information
	catname = string.sub(arg, 0, x-1)
	time = tonumber(string.sub(arg, y+1, arglen))

	return self:setTimerFor(catname, time)
end

function BrabbelRP:toggleImportantFor(catname)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end

	if (BrabbelRP.db.char.categories[catname].isImportant == nil or BrabbelRP.db.char.categories[catname].isImportant == false) then
		BrabbelRP.db.char.categories[catname].isImportant = true;
	else
		BrabbelRP.db.char.categories[catname].isImportant = false;
	end
	if (BrabbelRP:IsDebug()) then self:Print("Set importance for ("..catname.."): "..tostring(BrabbelRP.db.char.categories[catname].isImportant)); end
	
	UpdateGui(); -- UI updaten
	
	return true
end

-- setTimerFor category
function BrabbelRP:setTimerFor(catname, timer)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end

	if (timer<1) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["value is not valid"]..": "..timer); end
		return nil
	end
	
	self.db.char.categories[catname].timer = tonumber(timer);
	if (BrabbelRP:IsDebug()) then self:Print(Translate["timer set"].."("..catname.."): "..timer.." "..Translate["second(s)"]); end

	BrabbelRP:restartTimersAndEvents(catname); -- timer reinitialisieren
	UpdateGui(); -- UI updaten
	
	return true
end

-- consoleSetChanceForParse - for textbased mod
function BrabbelRP:consoleSetChanceFor(arg)
	arglen = string.len(arg)
	x,y = string.find(arg, " ")
	if (x == nil or y == nil) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["Usage"]..": /brabbelrp setChanceFor <"..Translate["category"].."> <chance in %>'"); end
		return
	end
	
	--extract category and line information
	catname = string.sub(arg, 0, x-1)
	chance = tonumber(string.sub(arg, y+1, arglen))
	
	return self:setChanceFor(catname, chance);
end

-- set chance for category
function BrabbelRP:setChanceFor(catname, chance)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end

	if (chance<1 or chance>100) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["value is not valid"]..": "..chance); end
		return nil
	end
	
	self.db.char.categories[catname].chance = tonumber(chance);
	if (BrabbelRP:IsDebug()) then self:Print(Translate["chance set"].."("..catname.."): "..chance.."%"); end
  
	BrabbelRP:restartTimersAndEvents(catname); -- timer reinitialisieren
	UpdateGui(); -- UI updaten
  
	return true
end

------------ DB admin functions ------------

--------------------------
-- CATEGORY MANAGEMENT
--------------------------
-- check Category
function BrabbelRP:checkCatExists(catname)
	-- check if category exists
	if(self.db.char.categories[catname] == nil) then
		--Error
		if (BrabbelRP:IsDebug()) then self:Print(Translate["The category"].." '"..catname.."' "..Translate["does not exist."]); end
		return nil
	end
	return true
end

-- add new category
function BrabbelRP:addCategory(catname)
	-- check if category exists already
	if (self:checkCatExists(catname) ~= nil) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["A category with this name exists already."].." ("..catname..")"); end
		return nil
	end
	
	-- add category
    self.db.char.categories[catname] = {};
	self.db.char.categories[catname].mode = "STANDARD";
    self.db.char.categories[catname].timer = self.db.char.defaultTimer;
    self.db.char.categories[catname].chance = self.db.char.defaultChance;
    self.db.char.categories[catname].lines = {};
    if (self.db.char.categories[catname] == nil) then
    	if (BrabbelRP:IsDebug()) then self:Print(Translate["unknown error creating category"]); end
    	return nil
	end
	
	if (BrabbelRP:IsDebug()) then self:Print(Translate["add new Category named"].." '"..catname.."'"); end
  
	selectedCat = catname; -- highlight this cat
	selectedLine = nil;
  
	-- GUI updaten
	UpdateGui()
  
	return true
end

--delete category
function BrabbelRP:deleteCategory(catname)
	if (self:checkCatExists(catname) == nil) then
		return nil;
	end
	
	BrabbelRP:deactivateCat(catname);
	
	if (BrabbelRP:IsDebug()) then self:Print(Translate["remove category "].." '"..catname.."'"); end
	self.db.char.categories[catname] = nil;
	
	if (catname == selectedCat) then
		selectedCat = nil;
	end
  
end

-- add new line to category
function BrabbelRP:addLine(catname, line)
	-- check if category exists
	if (self:checkCatExists(catname) == nil) then
		return nil
	end
	
	-- check that line is not null
	if (line == nil or string.len(line) == 0) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["The line does not contain any characters."]); end
		return nil
	end

	if (BrabbelRP:IsDebug()) then self:Print(Translate["added new line to cat"].." '"..catname.."' ["..line.."]"); end
	table.insert(BrabbelRP.db.char.categories[catname].lines, line)

	-- GUI updaten
	UpdateGui()
	
	return true
end

-- change a categorys name
function BrabbelRP:changeCategory(old, new)
	-- check if old category exists
	if (self:checkCatExists(old) == nil) then
		return nil
	end
	
	if (self:addCategory(new) == nil) then
		return nil
	end
	
	self.db.char.categories[new] = self.db.char.categories[old]
	self:deleteCategory(old)
	
	if (BrabbelRP:IsDebug()) then self:Print(Translate["category changed"].." '"..old.."' -> '"..new.."'"); end
	
	-- GUI updaten
	UpdateGui();
	
	return true
end

-- parse from console in order to change category name
function BrabbelRP:consoleChangeCategory(arg)
	x,y = string.find(arg, " new=")
	if (x == nil or y == nil) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["Usage"]..": /brabbelrp changeCat <"..Translate["old categorie name"].."> new=<"..Translate["new categorie name"]..">"); end
		return
	end
	
	--extract category and line information
	old = string.sub(arg, 0, x-1)
	new = string.sub(arg, y+1)
	self:changeCategory(old, new)
end

-- list all categories
function BrabbelRP:showCategories()
    -- count the categories.	
	n = 0;
	foreach(self.db.char["categories"], function(arg) n = n+1 end);
	
	-- check if there are any categories
	if ((self.db.char["categories"] == nil) or (n<1)) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["There are no categories registered for this character."]); end
		return
	end
	
	-- print categories
	if (BrabbelRP:IsDebug()) then self:Print(Translate["Categories"]); end
	-- iterate over entries and show them
	table.foreach(self.db.char["categories"],
		function(catname)
			if (BrabbelRP:IsDebug()) then self:Print(" - "..catname.." ["..self.db.char.categories[catname].timer.." seconds]["..self.db.char.categories[catname].chance.."%]"); end
		end
	);
end

--------------------------------
-- LINE MANAGEMENT
--------------------------------

-- parse string from console in order to add a line
function BrabbelRP:consoleAddLine(arg)
	arglen = string.len(arg)
	x,y = string.find(arg, " line='")
	if (x == nil or y == nil or string.sub(arg, arglen) ~= "'") then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["Usage"]..": /brabbelrp addLine <"..Translate["category"].."> line='<"..Translate["line"]..">'"); end
		return
	end
	
	--extract category and line information
	catname = string.sub(arg, 0, x-1)
	line = string.sub(arg, y+1, arglen-1)
	--if (BrabbelRP:IsDebug()) then self:Print(Translate["category"]..": "..catname); end
	--if (BrabbelRP:IsDebug()) then self:Print(Translate["line"]..": "..line); end
	self:addLine(catname, line)
end

-- parse string from console in order to change a line
function BrabbelRP:consoleChangeLine(arg)
	arglen = string.len(arg)
	lx,ly = string.find(arg, " line='")
	px,py = string.find(arg, " pos=")
	if (lx == nil or ly == nil or px == nil or py == nil or string.sub(arg, arglen) ~= "'") then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["Usage"]..": /brabbelrp changeLine <"..Translate["category"].."> pos=<"..Translate["line number"].."> line='<"..Translate["line"]..">'"); end
		return
	end
	
	catname = string.sub(arg, 0, px-1)
	position = tonumber(string.sub(arg, py+1, lx-1))
	newline = string.sub(arg, ly+1, arglen-1)
	
	self:changeLine(catname, position, newline)
end

-- change Line
function BrabbelRP:changeLine(cat, linePos, newLine)
	-- check category
	if (self:checkCatExists(cat) == nil) then
		return nil
	end
    
	-- check position
	if (linePos == nil or linePos < 0 or linePos > table.getn(self.db.char.categories[cat].lines)) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["The postition of the line is invalid!"]); end
		return nil;
	end
	
	old = self.db.char.categories[cat].lines[linePos];
	
	-- set new line to the position
	self.db.char.categories[cat].lines[linePos] = newLine
	if (self.db.char.categories[cat].lines[linePos] ~= newLine) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["an unknown error occured"]); end
		return nil
	end
	
	if (BrabbelRP:IsDebug()) then self:Print(Translate["old"]..": ["..old.."]"); end
	if (BrabbelRP:IsDebug()) then self:Print(Translate["new"]..": ["..newLine.."]"); end

    return true;
end

--list all lines in a specific category
function BrabbelRP:showLines(cat)
	-- check if category cat exists
	if (self:checkCatExists(cat) == nil) then
		return nil
	end
	-- check if there are any lines in the category
	if (table.getn(self.db.char.categories[cat].lines)<1) then
		if (BrabbelRP:IsDebug()) then self:Print("'"..cat.."': "..Translate["There are no lines for this category."]); end
		return
	end
	-- print all lines
	if (BrabbelRP:IsDebug()) then self:Print(Translate["Lines in this category:"].." "..cat); end
	for i,v in ipairs(self.db.char.categories[cat].lines) do
		if (BrabbelRP:IsDebug()) then self:Print("("..i..") "..v); end
	end
end

function deleteLineFromCat(selectedCat, selectedLine)
	table.remove(BrabbelRP.db.char.categories[selectedCat].lines,selectedLine);
end

-----------------------
-- TIMER MANAGEMENT
------------------------

-- init all timers and events for all active cats
function BrabbelRP:startAllTimersAndEvents()
	if (BrabbelRP:IsActive()) then	-- wenn aktiviert
		if(self.db.char.activeCats ~= nil) then -- und auch aktivie Kategorien vorhanden
			table.foreach(BrabbelRP.db.char.activeCats, function(cat)
				BrabbelRP:startTimersAndEvents(cat);
			end);
		end
	end
end

-- init timer and events for a special cat
function BrabbelRP:startTimersAndEvents(cat)
	if (BrabbelRP:IsActive() and BrabbelRP:isActiveCategory(cat)) then	-- wenn aktiviert
		if (BrabbelRP.db.char.categories[cat].mode == "STANDARD") then
			BrabbelRP:startSingleTimer(cat);
		else
		
			if (checkModeExists(BrabbelRP.db.char.categories[cat].mode)) then
				if (not isInstantMode(BrabbelRP.db.char.categories[cat].mode)) then
					BrabbelRP:startSingleTimer(cat);
				end
				BrabbelRP:registerCatEvents(cat);
				
			else
				BrabbelRP:Print("Category '"..cat.."' has a mode which does not exist (any longer?!). Setting to 'standard' and disabled.");
				BrabbelRP.db.char.categories[cat].mode = "STANDARD";
				BrabbelRP:deactivateCat(cat);
			end
		end
	end
end

-- inits a single timer for a cat
function BrabbelRP:startSingleTimer(cat)
	if (BrabbelRP:IsActive() and table.getn(self.db.char.categories[cat].lines) > 0) then	-- wenn aktiviert
		if (BrabbelRP.db.char.categories[cat].mode == "STANDARD" or (BrabbelRP.db.char.activeCats[cat].state ~= nil and BrabbelRP.db.char.activeCats[cat].state == 1)) then
			if (Chronos.isScheduledByName(cat.."0") == nil and Chronos.isScheduledByName(cat.."1") == nil) then -- wenn diese Kategorie noch nicht aktiv ist
				Chronos.scheduleByName(cat.."0",self.db.char.categories[cat].timer,brpTimer,cat,0);
				if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Scheduling timer for category: "..cat); end
			end
		end
	end
end

-- registers all events used by this cat
function BrabbelRP:registerCatEvents(cat)
	if (BrabbelRP:IsActive()) then	-- wenn aktiviert
		for eventId, eventName in pairs(getActivatingEventsOfMode(self.db.char.categories[cat].mode)) do
			getglobal("BrabbelEventFrame"):RegisterEvent(trimEventName(eventName));
			if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Registering event: " .. trimEventName(eventName)); end
		end

		for eventId, eventName in pairs(getDeactivatingEventsOfMode(self.db.char.categories[cat].mode)) do
			getglobal("BrabbelEventFrame"):RegisterEvent(trimEventName(eventName));
			if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Registering event: " .. trimEventName(eventName)); end
		end
	end
end

-- stop all timers and events
function BrabbelRP:stopAllTimersAndEvents()
    if(self.db.char.activeCats ~= nil) then
		table.foreach(BrabbelRP.db.char.activeCats, function(cat)
			BrabbelRP:stopTimersAndEvents(cat)
        end);
    end
end

-- stop timers and events for a special cat
function BrabbelRP:stopTimersAndEvents(cat)
	if (self.db.char.categories[cat].mode == "STANDARD") then
		BrabbelRP:stopSingleTimer(cat);
	else
		if (not isInstantMode(self.db.char.categories[cat].mode)) then
			BrabbelRP:stopSingleTimer(cat);
		end
		BrabbelRP:unregisterCatEvents(cat);
	end
end

-- stops a single timer for a cat
function BrabbelRP:stopSingleTimer(cat)
	if (Chronos.isScheduledByName(cat.."0") ~= nil or Chronos.isScheduledByName(cat.."1") ~= nil) then -- wenn diese Kategorie noch nicht aktiv ist
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Unscheduling timer for category: "..cat); end
		Chronos.unscheduleByName(cat.."0");
		Chronos.unscheduleByName(cat.."1");
	end
end

-- unregisters all events used by this cat TODO: eventuell werden die events ja noch gebraucht...
function BrabbelRP:unregisterCatEvents(cat)
	for eventId, eventName in pairs(getActivatingEventsOfMode(self.db.char.categories[cat].mode)) do
		if (not itIsUsedByOtherActiveCatThanThis(cat,eventName)) then
			getglobal("BrabbelEventFrame"):UnregisterEvent(trimEventName(eventName));
			if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Unregistering event: " .. trimEventName(eventName)); end
		end
		
	end
	for eventId, eventName in pairs(getDeactivatingEventsOfMode(self.db.char.categories[cat].mode)) do
		if (not itIsUsedByOtherActiveCatThanThis(cat,eventName)) then
			getglobal("BrabbelEventFrame"):UnregisterEvent(trimEventName(eventName));
			if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Unegistering event: " .. trimEventName(eventName)); end
		end
	end
end

-- reactivate all timers and events
function BrabbelRP:restartAllTimersAndEvents()
	BrabbelRP:stopAllTimersAndEvents();
	BrabbelRP:startAllTimersAndEvents();
end

-- reactivate timer for a category (fired when chance or timer of a category has been changed)
function BrabbelRP:restartTimersAndEvents(cat)
	BrabbelRP:stopTimersAndEvents(cat);
	BrabbelRP:startTimersAndEvents(cat);
end

------------------------------
-- active Category MANAGEMENT
------------------------------

-- show the active category
function BrabbelRP:showActiveCats()
    if(self.db.char.activeCats ~= nil) then
        if (BrabbelRP:IsDebug()) then self:Print(Translate["active categories"]..":"); end
        table.foreach(BrabbelRP.db.char.activeCats, function(cat)
            if (BrabbelRP:IsDebug()) then self:Print("- "..": "..cat); end
        end);
    else
        if (BrabbelRP:IsDebug()) then self:Print(Translate["No categories active at the moment."]); end
    end
end

-- activate category
function BrabbelRP:activateCat(cat)
	if (BrabbelRP:checkCatExists(cat) == nil) then
		return nil
	end

	if (BrabbelRP:isActiveCategory(cat) == true) then
		if (BrabbelRP:IsDebug()) then self:Print(Translate["category already active"]..": "..v); end
		return;
	end

	BrabbelRP.db.char.activeCats[cat] = {};
	if (isInstantMode(BrabbelRP.db.char.categories[cat].mode) or BrabbelRP.db.char.categories[cat].mode == "STANDARD") then
		BrabbelRP.db.char.activeCats[cat].state = 1;
	end
	
	-- todo: nach derzeitigem modus-state fragen, falls nicht gesetzt

	BrabbelRP:startTimersAndEvents(cat);
      
	if (BrabbelRP:IsDebug()) then self:Print(Translate["activated category"]..": "..cat); end
end

-- check if a category is active
function BrabbelRP:isActiveCategory(catName)
	if (self:checkCatExists(catName) == nil) then
		return nil
	end

	if (BrabbelRP.db.char.activeCats[catName] ~= nil) then
		return true
	else
		return false
	end
	--[[
	local found = false;
	if(self.db.char.activeCats ~= nil) then
		table.foreach(BrabbelRP.db.char.activeCats, function(cat)
			if (cat == catName) then
				found = true;
				return;
			end
		end);
	end
  
	return found;
	]]--
end

-- deactivate category
function BrabbelRP:deactivateCat(catName)
	BrabbelRP:stopTimersAndEvents(catName);
	
	if(self.db.char.activeCats ~= nil) then
		BrabbelRP.db.char.activeCats[catName] = nil;
	else
		if (BrabbelRP:IsDebug()) then self:Print(Translate["No categories active at the moment."]); end
	end
    
end

-------------------------
-- AUTOMATED TALKING
-------------------------

-- function that calculates output due to the set chance
function brpTimer(catName,count)
    self = BrabbelRP;

    if (table.getn(self.db.char.categories[catName].lines) > 0 and self.db.char.categories[catName].chance ~= 0) then
        BrabbelRP:tryToSaySomethingFrom(catName);
    end
    
    -- i have to use count, because of a bug in chronos does not let me use the same timername when rescheduling
    if (count == 0) then
        Chronos.scheduleByName(catName.."1",self.db.char.categories[catName].timer,brpTimer,catName,1);
    else
        Chronos.scheduleByName(catName.."0",self.db.char.categories[catName].timer,brpTimer,catName,0);
    end
    
end

function BrabbelRP:tryToSaySomethingFrom(catName)
	dice = random(100);
	cT_delta,cT_start = Chronos.getTimer("repPrevTimer");
	cT_delta = floor(cT_delta);

	 --if (BrabbelRP:IsDebug()) then self:Print("Role the dice for '"..catName.."' [Dice: "..dice.."<="..self.db.char.categories[catName].chance.."?!][RepPrev: "..cT_delta.."/"..self.db.char.repPrevent.."]"); end

	if (dice <= floor(BrabbelRP.db.char.categories[catName].chance)) then

		-- if [repPrevent] seconds ago another timer called, then be quiet...
		-- or if this is an important category
		if (cT_start == 0 or cT_delta >= floor(BrabbelRP.db.char.repPrevent) or (BrabbelRP.db.char.categories[catName].isImportant ~= nil and BrabbelRP.db.char.categories[catName].isImportant == true)) then
			if (not BrabbelRP.db.char.stealthProtected or not IsStealthed() or strlower(BrabbelRP.db.char.categories[catName].mode):find("stealth") ~= nil) then
				-- fire output function!
				--if (BrabbelRP:IsDebug()) then self:Print("Ohhkeeeyyy! ("..catName..")"); end
				BrabbelRP:saySomethingFrom(catName);
				
				Chronos.endTimer("repPrevTimer");
				Chronos.startTimer("repPrevTimer");
			end
		end
	end
end

-- function that chooses a line from given category and parses it for final output
function BrabbelRP:saySomethingFrom(catName)
    -- check there are enough lines to roll for
    if (table.getn(BrabbelRP.db.char.categories[catName].lines) > 0) then
		-- roll the dice
	    dice = random(table.getn(BrabbelRP.db.char.categories[catName].lines));

		-- get the line (can be more than one actual line) to output
	    fulltext = BrabbelRP.db.char.categories[catName].lines[dice];
  		newlinePos = fulltext:find("\n")
  		aLine = fulltext
  		if (newlinePos ~= nil) then
  			aLine = fulltext:sub(0,newlinePos-1)
  		end
  
  		lineText, lineChannel,lineEmote = BrabbelRP:parseChatMessage(aLine);
      
		-- if error happened do not print any output!
		BrabbelRP:SendChatMessageModified(lineText,lineChannel,lineEmote)
	
  		while(newlinePos~=nil) do
  			aLine=string.sub(fulltext,newlinePos+1)
  			fulltext=aLine
  			newlinePos=fulltext:find("\n")
  			q = newlinePos
  			if (q~=nil) then
  				aLine = aLine:sub(0, q-1)
  			end
  	
  			lineText, lineChannel,lineEmote = BrabbelRP:parseChatMessage(aLine);
			BrabbelRP:SendChatMessageModified(lineText,lineChannel,lineEmote);
  		end
    else
      if (BrabbelRP:IsDebug()) then BrabbelRP:Print(Translate["Category is active but has no entries"]..": "..catName); end
    end
end

-- modified SendChatMessage, prints error Message if no text or channel is nil
function BrabbelRP:SendChatMessageModified(text, channel, emote)
	if (text ~= nil and channel ~= nil) then
		
		-- replace some args
		text = string.gsub(text, "(%%%w+)",	function(w)
												if (ReplaceSomeWords_List[w]) then
													
													RunScript(ReplaceSomeWords_List[w]);
													if (type(BRABBELVALUE)=="function") then
															BRABBELVALUE = BRABBELVALUE();
															
													end
													if (BRABBELVALUE==nil) then
														BRABBELVALUE = "(dnf:" .. w ..")";
													end
													thisWord = BRABBELVALUE;
													
													return tostring(thisWord);
												else
													return w;
												end
											end);
											
		if (channel == "EMOTE_TOKEN") then
			DoEmote(emote,text);
			
		elseif (channel == "PETEMOTE") then
			if (IsAddOnLoaded("PetEmote")) then
				ConsoleExec("/pet "..text);
			else
				outE(Translate["You will need to install the addon '"] .. "PetEmote" .. Translate["' to use this command"]..": "..msg);
			end

		elseif (channel == "WOWQUOTE") then
			if (IsAddOnLoaded("WoWQuote")) then
				ConsoleExec("/wqs "..text);
			else
				outE(Translate["You will need to install the addon '"] .. "WoWQuote" .. Translate["' to use this command"]..": "..msg);
			end
		
		else
			-- print given text to given channel
			SendChatMessage(text, channel);
			
		end
	end
end




-- send Message to BrabbelRP-error Frame
function outE(text)
	-- UIErrorsFrame:AddMessage(text, 1.0, 0, 0, 1, 5);
	BrabbelRPErrorFrame:AddMessage(text, 1.0, 0.1, 0.1, 1.0);
end

-- parse a message: extract channel-info from actual text
function BrabbelRP:parseChatMessage(msg)
	msg = trim(msg); -- trim the string
   
	local text = msg
	local typeInfo = "/say" -- nothing, so standard-channel will be used

	-- suche nach einem initialen '/'
	if (msg:find("/") ~= nil and msg:find("/") == 1) then
		-- wenn ein command inkl. folgetext gefunden wurde...
		if (msg:find("/%w+%s+.+") and msg:find("/%w+%s+.+") == 1) then
			
			typeEndPos = msg:find(" ")
			text = trim(msg:sub(typeEndPos+1))
			typeInfo = trim(msg:sub(0, typeEndPos-1))
			
		-- wenn es nur ein command ist
		elseif (msg:find("/%w+") and msg:find("/%w+") == 1) then
		
			if (BrabbelRP:getEmote(msg)) then
				return "","EMOTE_TOKEN",BrabbelRP:getEmote(msg);
			else
				outE(Translate["Message type or channel unknown"]..": "..msg);
				return msg, nil;
			end
			
		-- wenn es irgend ein murks ist, trotz slash
		else

			-- return no channel, so error will be print to userscreen
			outE(Translate["Message type or channel unknown"]..": "..msg);
			return msg, nil
			
		end
	
	end
   
	local typeChannel = self:getTypeForChatMessage(typeInfo);
	if (typeChannel == nil) then
		outE(Translate["Message type or channel unknown"]..": "..msg);
		return text, typeChannel
		
	elseif (typeChannel == "EMOTE_TOKEN") then
		return text, typeChannel, BrabbelRP:getEmote(typeInfo)
	
	elseif (typeChannel == "PETEMOTE" and not IsAddOnLoaded("PetEmote")) then
		outE(Translate["You will need to install the addon '"] .. "PetEmote" .. Translate["' to use this command"]..": "..msg);
		return text, nil
	
	elseif (typeChannel == "WOWQUOTE" and not IsAddOnLoaded("WoWQuote")) then
		outE(Translate["You will need to install the addon '"] .. "WoWQuote" .. Translate["' to use this command"]..": "..msg);
		return text, nil
	
	else
		return text, typeChannel
		
	end
end

function BrabbelRP:getEmote(checkCmd)
	local i = 1;
	local token = getglobal("EMOTE"..i.."_TOKEN");
	while ( token ) do
		local cmd = getglobal("EMOTE"..i.."_CMD1");
		if ("/"..strlower(token) == strlower(checkCmd) or strlower(cmd) == strlower(checkCmd) ) then
			return token
		end
		i = i + 1;
		token = getglobal("EMOTE"..i.."_TOKEN");
	end
	return nil
end

-- get the type for a channel (only EMOTE, YELL and SAY are allowed!)
function BrabbelRP:getTypeForChatMessage(checkString)
	checkString = strlower(checkString);
	
	if (BrabbelRP:getEmote(checkString)) then
		return "EMOTE_TOKEN"
	elseif (checkString == "/pet") then
		return "PETEMOTE"
	elseif (checkString == "/wqs") then
		return "WOWQUOTE"
	elseif (checkString == "/e" or checkString=="/me" or checkString=="/emote" or checkString=="/"..strlower(getglobal("EMOTE_MESSAGE"))) then
		return "EMOTE"
	elseif (checkString=="/y" or checkString=="/yell" or checkString=="/"..strlower(getglobal("YELL_MESSAGE"))) then
		return "YELL"
	elseif (checkString=="/s" or checkString=="/say" or checkString=="/"..strlower(getglobal("SAY_MESSAGE"))) then
		return "SAY"
	end

   -- if type is unknown, give nil for error
   return nil
end

-----------------------
-- GENERAL SETTINGS
-----------------------
---- TIMER
-----------------------
function BrabbelRP:setDefaultTimer(time)
    self.db.char.defaultTimer = tonumber(time);
    if (BrabbelRP:IsDebug()) then self:Print(Translate["Timer set to"].." " .. self.db.char.defaultTimer .. Translate["second(s)"]); end
end

function BrabbelRP:getDefaultTimer()
    if (BrabbelRP:IsDebug()) then self:Print(Translate["Timer set to"] .. self.db.char.defaultTimer .. Translate["second(s)"]); end
    return self.db.char.defaultTimer;
end

-----------------------
---- CHANCE
-----------------------
function BrabbelRP:setDefaultChance(percent)
    self.db.char.defaultChance = tonumber(percent);
    if (BrabbelRP:IsDebug()) then self:Print(Translate["Chance set to"]..": " .. self.db.char.defaultChance .. "%!"); end
end

function BrabbelRP:getDefaultChance()
    if (BrabbelRP:IsDebug()) then self:Print(Translate["Chance set to"]..": " .. self.db.char.defaultChance .. "%!"); end
    return self.db.char.defaultChance;
end

-----------------------
---- REPPREVENT
-----------------------
function BrabbelRP:setRepPrevent(repPrevent)
		self.db.char.repPrevent = tonumber(repPrevent);
		if (BrabbelRP:IsDebug()) then self:Print(Translate["RepPrevent set to"]..": " .. self.db.char.repPrevent.. " seconds!"); end
end

function BrabbelRP:getRepPrevent()
    if (BrabbelRP:IsDebug()) then self:Print(Translate["RepPrevent set to"]..": " .. self.db.char.repPrevent .. " seconds!"); end
    return self.db.char.repPrevent;
end


---------------------
---- EVENTS
---------------------
function BrabbelRP_OnEvent()
	
	if (BrabbelRP:IsDebug()) then
		BrabbelRP:Print("Fired event: " ..event);
		if (arg1 ~= nil and arg1 ~= "") then BrabbelRP:Print("Arg1 ["..tostring(arg1).."]"); end
		if (arg2 ~= nil and arg2 ~= "") then BrabbelRP:Print("Arg2 ["..tostring(arg2).."]"); end
		if (arg3 ~= nil and arg3 ~= "") then BrabbelRP:Print("Arg3 ["..tostring(arg3).."]"); end
		if (arg4 ~= nil and arg4 ~= "") then BrabbelRP:Print("Arg4 ["..tostring(arg4).."]"); end
		if (arg5 ~= nil and arg5 ~= "") then BrabbelRP:Print("Arg5 ["..tostring(arg5).."]"); end
		if (arg6 ~= nil and arg6 ~= "") then BrabbelRP:Print("Arg6 ["..tostring(arg6).."]"); end
		if (arg7 ~= nil and arg7 ~= "") then BrabbelRP:Print("Arg7 ["..tostring(arg7).."]"); end
		if (arg8 ~= nil and arg8 ~= "") then BrabbelRP:Print("Arg8 ["..tostring(arg8).."]"); end
		if (arg9 ~= nil and arg9 ~= "") then BrabbelRP:Print("Arg9 ["..tostring(arg9).."]"); end
		
	end
	
	if (BrabbelRP:IsActive()) then	-- wenn aktiviert

		if(BrabbelRP.db.char.activeCats ~= nil) then -- und auch aktivie Kategorien vorhanden
			table.foreach(BrabbelRP.db.char.activeCats, function(cat)
			
				if (isInstantMode(BrabbelRP.db.char.categories[cat].mode)) then
					for eventId, eventName in pairs(getActivatingEventsOfMode(BrabbelRP.db.char.categories[cat].mode)) do
						if (compareEvents(eventName,{event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9})) then
							BrabbelRP:tryToSaySomethingFrom(cat);
							return
						end
					end
				else

					for eventId, eventName in pairs(getActivatingEventsOfMode(BrabbelRP.db.char.categories[cat].mode)) do
						if (compareEvents(eventName,{event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9}) and (BrabbelRP.db.char.activeCats[cat].state == nil or BrabbelRP.db.char.activeCats[cat].state == 0)) then

							if (BrabbelRP:IsDebug()) then BrabbelRP:Print("activating: " .. cat .. " with event: "..event); end
							BrabbelRP.db.char.activeCats[cat].state = 1;
							BrabbelRP:startSingleTimer(cat);
							UpdateGui();
							break;
							
						end
					end
					
					for eventId, eventName in pairs(getDeactivatingEventsOfMode(BrabbelRP.db.char.categories[cat].mode)) do
						if (compareEvents(eventName,{event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9}) and (BrabbelRP.db.char.activeCats[cat].state == nil or BrabbelRP.db.char.activeCats[cat].state == 1)) then

							if (BrabbelRP:IsDebug()) then BrabbelRP:Print("deactivating: " .. cat .. " with event: "..event); end
							BrabbelRP.db.char.activeCats[cat].state = 0;
							BrabbelRP:stopSingleTimer(cat);
							UpdateGui();
							break;
							
						end
					end
				
				end
			end);
		end

	end
end

function compareEvents(eventName,test)
	local myString = eventName;
	local counter = 1;
	local testToo = nil;
	
	while (myString:find("|") ~= nil) do
		if (test[counter] == nil) then return nil end -- check if enough arguments passed to check this
		
		temp_string = myString:sub(0,myString:find("|")-1);
		-- when counter == 1 then check whole strings against each other... otherwise try a match giving the ability to use regexp
		if ((counter == 1 and (temp_string ~= test[counter])) or (counter > 1 and test[counter]:match(temp_string) == nil)) then
			return false;
		else
			counter = counter + 1;
			myString = myString:sub(myString:find("|")+1);
		end
	end

	if (test[counter] == nil) then return nil end -- check if enough arguments passed to check this
	
	-- check if theres a appended function to check too
	local foundAt = myString:find("@");
	if (foundAt ~= nil) then
		testToo = myString:sub(foundAt+1);
		myString = myString:sub(0,foundAt-1);
	end

	-- when counter == 1 then check whole strings against each other... otherwise try a match giving the ability to use regexp
	if ((counter == 1 and (myString == test[counter])) or (counter > 1 and tostring(test[counter]):match(myString) ~= nil)) then
		
		-- wenn noch mehr zu testen ist (erkannt durch das @testToo im event
		if (testToo ~= nil) then
			return eventTestTooFunction(testToo, test);
		end
	
		return true
	else
		return false
	end
end

-- diese funktion testet den status von bestimmten events, wenn diese ein "@testToo" enthalten...
--[[ args:#
	args[1] == event
	args[2] == arg1 from event
	args[3] == arg2 from event
	...
]]--
function eventTestTooFunction(testToo, args)
	
	-- look for inline functions
	if (testToo:find("BRABBELBOOL")) then
		BRABBELBOOL = nil;

		RunScript(testToo);
		
		if (type(BRABBELBOOL)=="function") then
			BRABBELBOOL = BRABBELBOOL();
		end
		
		if (BRABBELBOOL==nil or BRABBELBOOL ~= true) then
			BRABBELBOOL = false;
		end
		
		return BRABBELBOOL;
	end
	
	
	-- or try some more...
	if (testToo:find("isOom")) then
		
		-- wenn es ein druide ist und er nicht in der normal,moonkin oder treeform ist, kann er kein oom haben (auch wenn wow das wirft) (WOW-BUG)
		local localizedClass, englishClass = UnitClass("player");
		if (englishClass == "DRUID" and not (GetShapeshiftForm() == 0 or GetShapeshiftForm() == 5)) then
			return false;
		end
		
		local brp_mana_min = 20; -- standard
		if (testToo:find(",")) then
			brp_mana_min = trim(testToo:sub(testToo:find(",")+1));
		end
		
		local maxMana = UnitManaMax("player");
		local currentMana = UnitMana("player");
		
		if (currentMana < (maxMana / (100 / brp_mana_min)) and alreadyOOMed == nil) then
			alreadyOOMed = true;
			return true;
		elseif (alreadyOOMed and currentMana > (maxMana / (100 / brp_mana_min))) then
			alreadyOOMed = nil;
		end

		
	elseif (testToo:find("isOoh")) then
		
		local brp_health_min = 25; -- standard
		if (testToo:find(",")) then
			brp_health_min = trim(testToo:sub(testToo:find(",")+1));
		end
		
		local maxHealth = UnitHealthMax("player");
		local currentHealth = UnitHealth("player");
		
		if (currentHealth < (maxHealth / (100 / brp_health_min)) and alreadyOOHed == nil) then
			alreadyOOHed = true;
			return true;
		elseif (alreadyOOHed and currentHealth > (maxHealth / (100 / brp_health_min))) then
			alreadyOOHed = nil;
		end
		
	elseif (testToo == "isMounted") then
	
		-- wenn ein druide ist und er nicht in seiner normalform ist, wird ab und an IsMounted == true gegeben, was nur falsch sein kann... (WOW-BUG)
		local localizedClass, englishClass = UnitClass("player");
		if (englishClass == "DRUID" and not GetShapeshiftForm() == 0) then
			return false;
		end
		
		
		for Index = 1, 16 do
			local Buff = GetPlayerBuffTexture(Index);
			if Buff then
				if (string.lower(Buff):find("mount")) then
					if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Found Mount-Buff > is mounted"); end
					return true;
				end
			end
		end
		
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Did not find Mount-Buff > is not mounted"); end
		return false
		
	elseif (testToo == "isUnMounted") then
		
		local isUnmounted = true;
		for Index = 1, 16 do
			local Buff = GetPlayerBuffTexture(Index);
			if Buff then
				if (string.lower(Buff):find("mount")) then
					if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Found Mount-Buff > is mounted"); end
					isUnmounted = false;
				end
			end
		end
		
		if (BrabbelRP:IsDebug() and isUnmounted) then BrabbelRP:Print("Did not find Mount-Buff > is not mounted"); end
		return isUnmounted;
		
	elseif (testToo == "isMounting") then
		
		-- wenn ein druide ist und er nicht in seiner normalform ist, wird ab und an IsMounted == true gegeben, was nur falsch sein kann... (WOW-BUG)
		local localizedClass, englishClass = UnitClass("player");
		if (englishClass == "DRUID" and not GetShapeshiftForm() == 0) then
			return false;
		end
		
		-- already mounted?! > return false
		if (IsMounted() ~= nil) then
			return false
		end
		
		for Index = 1, 16 do
			local Buff = GetPlayerBuffTexture(Index);
			if Buff then
				if (string.lower(Buff):find("mount")) then
					if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Found Mount-Buff + was unmounted > mounting"); end
					return true;
				end
			end
		end
		
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Did not find Mount-Buff and was not mounted > do nothing"); end
		
	elseif (testToo == "isUnMounting") then
		
		-- already unmounted?! > return false
		if (IsMounted() == nil) then
			return false
		end
		
		local isUnmounted = true;
		for Index = 1, 16 do
			local Buff = GetPlayerBuffTexture(Index);
			if Buff then
				if (string.lower(Buff):find("mount")) then
					if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Found Mount-Buff and was mounted > do nothing"); end
					isUnmounted = false;
				end
			end
		end
		
		if (BrabbelRP:IsDebug() and isUnmounted) then BrabbelRP:Print("Did not find mount buff, but was mounted before > unmounting"); end
		return isUnmounted;
		
	end
	
	return false
end

---------------------
-- UI functions
---------------------
---- BASIC GUI
---------------------
function ResetGui()

	if (not HideAllOpenEdits(false)) then
		return
	end

	selectedCat = nil;
	selectedLine = nil;
	
	CatLineSelection_Cat_Text:SetText(Translate["Select a category"]);
	
	CatsScrollFrame:Show();
	CatActionButtons:Show();
	
	LinesScrollFrame:Hide();
	LinesActionButtons:Hide();
	
	QuoteFrame:Hide();
	QuoteActionButtons:Hide();
	
	UpdateGui();
end

function UpdateGui()
	BrabbelRPScrollBar_Update();
	BrabbelRPScrollLines_Update();
	BrabbelRPScrollText_Update();
	
	DeActivateAll_Text:SetText(Translate["Deactivate all"]);
	
	collectgarbage();
end

function BRP_ShowWindow()
	BRP_CheckEnabled:SetChecked(BrabbelRP:IsActive());
	BRP_DebugEnabled:SetChecked(BrabbelRP:IsDebug());
	BRP_StealthProtect:SetChecked(BrabbelRP.db.char.stealthProtected);
	repPreventionFrame_InputBox:SetText(BrabbelRP.db.char.repPrevent);
	defaultChanceFrame_InputBox:SetText(BrabbelRP.db.char.defaultChance);
	defaultTimerFrame_InputBox:SetText(BrabbelRP.db.char.defaultTimer);
	
	UpdateGui();
end

function BRP_ToggleStealthProtection()
	if (this:GetChecked() and not BrabbelRP.db.char.stealthProtected) then
		if (ValidateSettings() == true) then
			BrabbelRP.db.char.stealthProtected = true;
		else
			this:SetChecked(false);
			BrabbelRP.db.char.stealthProtected = false;
		end
	elseif (not this:GetChecked() and BrabbelRP.db.char.stealthProtected) then
		BrabbelRP.db.char.stealthProtected = false
	end
end

function BRP_ToggleDebugActive()
	if (this:GetChecked() and not BrabbelRP:IsDebug()) then
		if (ValidateSettings() == true) then
			BrabbelRP:SetDebug(true);
		else
			this:SetChecked(false);
			BrabbelRP:SetDebug(false);
		end
	elseif (not this:GetChecked() and BrabbelRP:IsDebug()) then
		BrabbelRP:SetDebug(false);
	end
end

function BRP_ToggleActive()
	this = getglobal("BRP_CheckEnabled");
		
	if (not BrabbelRP:IsActive()) then
		if (ValidateSettings() == true) then
			BrabbelRP:ToggleActive(true);
			this:SetChecked(true);
		else
			BrabbelRP:ToggleActive(false);
			this:SetChecked(false);
		end
	elseif (BrabbelRP:IsActive()) then
		BrabbelRP:ToggleActive(false);
		this:SetChecked(false);
	end
end

function BRP_ValueChar(arg1)
		this:SetText(string.gsub(this:GetText(),"[^%d]",""));
end

function BRP_ValueChanged()
   if (this:GetText() ~= nil) then
	if (this:GetName() == "repPreventionFrame_InputBox") then
		if (this:GetText() ~= "") then
			BrabbelRP.db.char.repPrevent = tonumber(this:GetText());
			repPreventionFrame_InputBox_red:Hide();
		end

	elseif (this:GetName() == "defaultTimerFrame_InputBox") then
		if (this:GetText() ~= "" and tonumber(this:GetText()) > 0 ) then
			BrabbelRP.db.char.defaultTimer = tonumber(this:GetText());
			defaultTimerFrame_InputBox_red:Hide();
		end

	elseif (this:GetName() == "defaultChanceFrame_InputBox") then
		if (this:GetText() ~= "" and tonumber(this:GetText()) > 0 and tonumber(this:GetText()) <= 100) then
			BrabbelRP.db.char.defaultChance = tonumber(this:GetText());
			defaultChanceFrame_InputBox_red:Hide();
		end
	end
   end
end


function BrabbelRP:ToggleWindowOpen()
	if(BrabbelButtonFrame:GetAlpha() == 1) then
		BrabbelButtonFrame:SetAlpha(0.5);
		BrabbelRPForm:Show();
	elseif (getglobal("DropDownList1"):IsVisible()) then
		HideDropDownMenu(1);
	elseif (getglobal("LinesScrollFrame"):IsVisible()) then	
		ResetGui();
	else
		Try2Hide();		
	end
end

function Try2Hide()
	if (ValidateSettings() == true and HideAllOpenEdits(false)) then
		HideUIPanel(BrabbelRPForm);
		BrabbelButtonFrame:SetAlpha(1);
		return true;
	else
		return false;
	end
end

function Try2Switch2Tab1()
	if (ValidateSettings() == true and HideAllOpenEdits(false)) then
		PanelTemplates_SetTab(BrabbelRPForm, 1);
		myTabPage1:Show();
		General_Settings:Hide();
	end
end

function Try2Switch2Tab2()
	if (ValidateSettings() == true and HideAllOpenEdits(false)) then
		PanelTemplates_SetTab(BrabbelRPForm, 2);
      	myTabPage1:Hide();
      	General_Settings:Show();
	end
end


function ValidateSettings()
	settingsOK = true;
	if (General_Settings:IsVisible() ~= nil) then
		if (repPreventionFrame_InputBox:GetText() == "") then
			settingsOK = false;
			repPreventionFrame_InputBox_red:Show();
			outE(Translate["Please enter some value for the repeating prevention time."]);
		end

		if (defaultTimerFrame_InputBox:GetText() == "") then
			settingsOK = false;
			defaultTimerFrame_InputBox_red:Show();
			outE(Translate["Please enter some value for the default timer."]);
		end

		if (defaultChanceFrame_InputBox:GetText() == "") then
			settingsOK = false;
			defaultChanceFrame_InputBox_red:Show();
			outE(Translate["Please enter some value for the default chance."]);
		end
	elseif (myTabPage1:IsVisible() ~= nil) then
		-- die HideAllOpenEdits solllten eher hier hin... mal schauen
	end
	
	return settingsOK;
end


function brp_sort_Alphabetical(a,b)
	return string.lower(a) < string.lower(b);	
end


-- Update scroll-dings 1
function BrabbelRPScrollBar_Update()
	local linesToDisplay = 16;
	
	-- count the categories.	
	local brp_local_categoryCounter = 1;
	local brp_local_categoryTempArray = {}
	
	foreach(BrabbelRP.db.char.categories, function(catname)
		brp_local_categoryTempArray[brp_local_categoryCounter] = catname
		brp_local_categoryCounter = brp_local_categoryCounter + 1
	end);
	
	-- sort the array
	table.sort(brp_local_categoryTempArray,brp_sort_Alphabetical);
	
	FauxScrollFrame_Update(BrabbelRPScrollBar,brp_local_categoryCounter - 1,linesToDisplay,16);
	
	local line; -- 1 through 6 of our window to scroll
	local lineplusoffset; -- an index into our data calculated from the scroll offset
  
	for line = 1,linesToDisplay do
		lineplusoffset = line + FauxScrollFrame_GetOffset(BrabbelRPScrollBar);
		
		if (lineplusoffset < brp_local_categoryCounter) then
			local brp_local_categoryName = brp_local_categoryTempArray[lineplusoffset];
			local brp_local_infotext = BrabbelRP:getTimerFor(brp_local_categoryName);
			local brp_local_chancetext = BrabbelRP:getChanceFor(brp_local_categoryName);
			
			-- maybe we should fix unknown modes
			if (BrabbelRP.db.char.categories[brp_local_categoryName].mode == nil or BrabbelRP.db.char.categories[brp_local_categoryName].mode == "") then
				BrabbelRP.db.char.categories[brp_local_categoryName].mode = "STANDARD";
			end
			
			getglobal("CategoryEntry"..line):SetText(brp_local_categoryName);
			getglobal("CategoryEntry"..line.."_timer"):SetScript("OnDoubleClick", function () BrabbelRP:TableDoubleClick(this:GetName(),nil) end);
			getglobal("CategoryEntry"..line.."_timer_text"):SetText(brp_local_infotext.."s");
			getglobal("CategoryEntry"..line.."_chance_text"):SetText(brp_local_chancetext.."%");
			getglobal("CategoryEntry"..line.."_count_text"):SetText(table.getn(BrabbelRP.db.char.categories[brp_local_categoryName].lines));
			
			if (BrabbelRP.db.char.categories[brp_local_categoryName].isImportant ~= nil and BrabbelRP.db.char.categories[brp_local_categoryName].isImportant == true) then
				getglobal("CategoryEntry"..line.."_important_text"):SetText("x");
			else
				getglobal("CategoryEntry"..line.."_important_text"):SetText("");
			end
			
			if (BrabbelRP.db.char.categories[brp_local_categoryName].mode == nil or BrabbelRP.db.char.categories[brp_local_categoryName].mode == "STANDARD") then
				getglobal("CategoryEntry"..line.."_mode_text"):SetText("Standard");
			else
				-- search for the current mode
				local found = false;
				for modeCatName, mode in pairs(BrabbelModi_Data) do	-- go through the modeData categories
					for modeName, modeContent in pairs(mode) do					-- go through the content of the mode
						if (modeName == BrabbelRP.db.char.categories[brp_local_categoryName].mode) then
							getglobal("CategoryEntry"..line.."_mode_text"):SetText(modeContent["name"]);

							if (modeContent["isInstantEvent"] == true) then
								--getglobal("CategoryEntry"..line.."_timer"):Disable();
								getglobal("CategoryEntry"..line.."_timer"):SetScript("OnDoubleClick", nil);
								getglobal("CategoryEntry"..line.."_timer_text"):SetText("-");
							end

							found = true;
						end
					end
				end
				if (not found) then
					getglobal("CategoryEntry"..line.."_mode_text"):SetText("Standard");
				end
			end

			if (BrabbelRP:isActiveCategory(brp_local_categoryName) and BrabbelRP.db.char.activeCats[brp_local_categoryName].state ~= nil and BrabbelRP.db.char.activeCats[brp_local_categoryName].state == 1) then
				getglobal("CategoryEntry"..line.."_active_text"):SetText(Translate["active"]);
			elseif (BrabbelRP:isActiveCategory(brp_local_categoryName)) then
				getglobal("CategoryEntry"..line.."_active_text"):SetText(Translate["semi-active"]);
			else
				getglobal("CategoryEntry"..line.."_active_text"):SetText(Translate["inactive"]);
			end
			
			if (selectedCat ~= nil and brp_local_categoryName == selectedCat) then
				getglobal("CategoryEntry"..line.."_selected"):Show();
			else
				getglobal("CategoryEntry"..line.."_selected"):Hide();
			end
      
			getglobal("CategoryEntry"..line):Show();
		else
			getglobal("CategoryEntry"..line):Hide();
		end
	end
  
end

function BrabbelRPScrollLines_Update()
	local linesToDisplay = 16;
	local brp_local_categoryCounter = 0;
	
	-- check first if a category is selected
	if (selectedCat ~= nil) then
		-- how many lines?!
		brp_local_categoryCounter = table.getn(BrabbelRP.db.char.categories[selectedCat].lines);
	end
	
	if (brp_local_categoryCounter == 0) then
		getglobal("no_lines_in_this_cat"):Show();
	else
		getglobal("no_lines_in_this_cat"):Hide();
	end
	
	FauxScrollFrame_Update(BrabbelRPScrollLines,brp_local_categoryCounter,linesToDisplay,16);
	
	local line; -- 1 through 6 of our window to scroll
	local lineplusoffset; -- an index into our data calculated from the scroll offset
  
	-- update all rows
	for line=1,linesToDisplay do
		lineplusoffset = line + FauxScrollFrame_GetOffset(BrabbelRPScrollLines);
		
		if (lineplusoffset <= brp_local_categoryCounter) then
			local lineText = BrabbelRP.db.char.categories[selectedCat].lines[lineplusoffset];
			
			-- remove nextLines & to much text
			local addP;
			if (lineText:find("\n")) then
				lineText = lineText:sub(0,lineText:find("\n")-1);
				addP = true;
			end
			if (lineText:len() > 63) then
				lineText = lineText:sub(0,60);
				addP = true;
			end
			if (addP) then
				lineText = lineText.. " ...";
			end
      
			getglobal("LinesEntry"..line):SetText(lineText);
			getglobal("LinesEntry"..line):SetID(lineplusoffset);
			
			if (selectedLine ~= nil and lineplusoffset == selectedLine) then
				getglobal("LinesEntry"..line.."_selected"):Show();
			else
				getglobal("LinesEntry"..line.."_selected"):Hide();
			end

			getglobal("LinesEntry"..line):Show();
		else
			getglobal("LinesEntry"..line):Hide();
		end
	end
  
end

function BrabbelRPScrollText_Update()

	if (selectedLine == nil) then
		getglobal("choose_quote_First"):Show();
	else
		getglobal("choose_quote_First"):Hide();
	end

	local textFrame = getglobal("QuoteFrame_ScrollFrame_ChildFrame_TextFrame");
	local editBox = getglobal("QuoteFrame_ScrollFrame_ChildFrame_EditBox");
	
	if (textFrame:IsVisible()) then
		if (selectedCat ~= nil and selectedLine ~= nil) then
			textFrame:SetText(BrabbelRP.db.char.categories[selectedCat].lines[selectedLine]);
		else
			textFrame:SetText("");
		end
		
	elseif (editBox:IsVisible()) then
	
		getglobal("choose_quote_First"):Hide();
		
		if (selectedCat ~= nil and selectedLine ~= nil) then
			editBox:SetText(BrabbelRP.db.char.categories[selectedCat].lines[selectedLine]);
			editBox:SetFocus();
		end
		
	end
	
	getglobal("QuoteFrame_ScrollFrame"):UpdateScrollChildRect();
end

function resetEditBox()
	if (selectedLine == nil) then
		editBox:SetText("");
	else
		editBox:SetText(BrabbelRP.db.char.categories[selectedCat].lines[selectedLine]);
	end
end

function SaveQuote()	
	-- save current text to cat
	if (selectedLine == nil) then
		if (this:GetText() ~= "") then
			BrabbelRP:addLine(selectedCat, this:GetText());
		end
	else
		if (trim(this:GetText()) == "") then
			deleteLineFromCat(selectedCat, selectedLine)
		else
			BrabbelRP.db.char.categories[selectedCat].lines[selectedLine] = this:GetText();
		end
	end
	
end


-- select category and show lines in scrollframe below!
function BrabbelRP:UISelectCategory(catname)
	if (HideAllOpenEdits(false)) then
		if (catname ~= selectedCat) then
			selectedLine = nil;
			selectedCat = catname;
			
			CatLineSelection_Cat_Text:SetText(catname);
			
			UpdateGui();
		end
	end
end

function BrabbelRP:UISelectLine()
	if (HideAllOpenEdits(false)) then
		selectedLine = this:GetID();
		
		UpdateGui();
	end
end

function BrabbelRP:UIEditLine()
	editBox = getglobal("QuoteFrame_ScrollFrame_ChildFrame_EditBox");
	
	if (not editBox:IsVisible() and selectedLine ~= nil) then
		getglobal("QuoteFrame_ScrollFrame_ChildFrame_TextFrame"):Hide();
		editBox:Show();
		
		UpdateGui();
	end
end

-- toggle category: active/inactive
function BrabbelRP:TableDoubleClick(item,text)
	
	-- if the categoryname was doubleclicked
	if (text ~= nil and string.find(item, "CategoryEntry") ~= nil and HideAllOpenEdits(false)) then
		getglobal(item.."_EditBox"):SetText(text);
		getglobal(item.."_EditBox"):Show();
		SetScrollBarEnabled(false);
	end
	
	if (string.find(item, "_active") ~= nil) then
		catname = this:GetParent():GetText();
		if (self:isActiveCategory(catname) == true) then
			self:deactivateCat(catname);
		else
			self:activateCat(catname);
		end
		
	elseif (string.find(item, "_timer") ~= nil and selectedCat ~= nil) then
		getglobal(item.."_EditBox"):SetText(BrabbelRP:getTimerFor(selectedCat));
		getglobal(item.."_EditBox"):Show();
		SetScrollBarEnabled(false);
		
	elseif (string.find(item, "_chance") ~= nil and selectedCat ~= nil) then
		getglobal(item.."_EditBox"):SetText(BrabbelRP:getChanceFor(selectedCat));
		getglobal(item.."_EditBox"):Show();
		SetScrollBarEnabled(false);
	elseif (string.find(item, "_important") ~= nil and selectedCat ~= nil) then
		BrabbelRP:toggleImportantFor(selectedCat);
	end
	
	-- GUI updaten
	UpdateGui();
end

function HideAllOpenEdits(cancel)
	if (getglobal("BrabbelRPForm") == nil or not getglobal("BrabbelRPForm"):IsVisible()) then
		return true
	end

	for line=1,16 do
		editBox = getglobal("CategoryEntry"..line.."_EditBox");
		if (editBox:IsVisible()) then
			newCatName = editBox:GetText();
			
			if (newCatName == "" and cancel == false) then
				outE(Translate["Category name can not be empty"]);
				return false
			end
				
			if (cancel == false) then
				oldCatName = getglobal("CategoryEntry"..line):GetText();
				
				if (oldCatName ~= newCatName) then
					if (BrabbelRP:checkCatExists(newCatName)) then
						outE(Translate["A category with this name already exists"]);
						return false
					end
					
					BrabbelRP.db.char.categories[newCatName] = BrabbelRP.db.char.categories[oldCatName];
					if (BrabbelRP:isActiveCategory(oldCatName)) then
						BrabbelRP:activateCat(newCatName);
					end
					BrabbelRP:deleteCategory(oldCatName);
					
				end
				
				selectedLine = nil;
				selectedCat = newCatName;
				CatLineSelection_Cat_Text:SetText(newCatName);
				
			end
			
			editBox:Hide();
			SetScrollBarEnabled(true);
			
		end
		
		timerBox = getglobal("CategoryEntry"..line.."_timer_EditBox");
		if (timerBox:IsVisible()) then
			newTimer = timerBox:GetText();
			
			if (newTimer == "" and cancel == false) then
				outE(Translate["Timer can not be empty"]);
				return false
			end
			
			if (cancel == false) then
				BrabbelRP:setTimerFor(selectedCat, tonumber(newTimer))
			end
			
			timerBox:Hide();
			SetScrollBarEnabled(true);
		end
		
		chanceBox = getglobal("CategoryEntry"..line.."_chance_EditBox");
		if (chanceBox:IsVisible()) then
			newChance = chanceBox:GetText();
			
			if (newChance == "" and cancel == false) then
				outE(Translate["Chance can not be empty"]);
				return false
			end
			
			if (cancel == false) then
				BrabbelRP:setChanceFor(selectedCat, tonumber(newChance))
			end
			
			chanceBox:Hide();
			SetScrollBarEnabled(true);
		end
	end
	
	addBox = getglobal("AddCat_EditBox");
	if (addBox:IsVisible()) then
		newCatName = addBox:GetText();
		
		if (newCatName == "" and cancel == false) then
			outE(Translate["New category name can not be empty"]);
			return false
		end
		
		if (cancel == false) then
			BrabbelRP:addCategory(newCatName);
		end
		
		addBox:Hide();
		getglobal("AddCat"):Show();
	end
	
	editBox = getglobal("QuoteFrame_ScrollFrame_ChildFrame_EditBox");
	if (editBox:IsVisible()) then
		if (not BrabbelRP:CheckQuotes(editBox:GetText())) then
			return false
		end
		editBox:Hide();	
		getglobal("QuoteFrame_ScrollFrame_ChildFrame_TextFrame"):Show();
	end
	
	UpdateGui();
	
	return true;
end


function Try2DeleteCat(state)
	stdTxt = Translate["Delete selected category"];
	reallyTxt = Translate["Really delete? (doubleclick)"];
	
	if (selectedCat == nil) then
		return
	end
	
	if (state == 0) then
		getglobal(this:GetName().."_Text"):SetText(stdTxt);
		
	elseif (state == 1 and getglobal(this:GetName().."_Text"):GetText() == stdTxt) then
		getglobal(this:GetName().."_Text"):SetText(reallyTxt);
		
	elseif (state == 2 and getglobal(this:GetName().."_Text"):GetText() == reallyTxt) then
		getglobal(this:GetName().."_Text"):SetText(stdTxt);
		
		BrabbelRP:deactivateCat(selectedCat);
		BrabbelRP:deleteCategory(selectedCat);
		
		ResetGui();
	end
	
	UpdateGui();
end

function AddNewCat()
	if (not HideAllOpenEdits(false)) then
		return
	end
	
	getglobal("AddCat"):Hide();
	
	-- maybe another cat with the "newCatName" already exists
	newCatName = Translate["newCategory_defaultName"];
	i = 1;
	while BrabbelRP:checkCatExists(newCatName) do
        newCatName = Translate["newCategory_defaultName"].."#"..i;
		i = i + 1;
    end
	
	getglobal("AddCat_EditBox"):SetText(newCatName);
	getglobal("AddCat_EditBox"):Show();
	
	UpdateGui();
end

function AddNewQuote()
	editBox = getglobal("QuoteFrame_ScrollFrame_ChildFrame_EditBox");
	
	if (selectedLine == nil and editBox:IsVisible()) then
		return
	end

	if (not HideAllOpenEdits(false) or selectedCat == nil) then
		return
	end
	
	selectedLine = nil;

	getglobal("QuoteFrame_ScrollFrame_ChildFrame_TextFrame"):Hide();
	
	editBox:SetText("You jaemmerlicher alter Narr wirst noch schmoren in the hell!");
	editBox:SetFocus();
	editBox:HighlightText();
	editBox:Show();
	
	UpdateGui();
end

function Try2DeleteLine(state)
	if (not HideAllOpenEdits(false)) then
		return
	end

	stdTxt = Translate["Delete selected quote"];
	reallyTxt = Translate["Really delete? (doubleclick)"];
	
	if (selectedCat == nil or selectedLine == nil) then
		return
	end
	
	if (state == 0) then
		getglobal(this:GetName().."_Text"):SetText(stdTxt);
		
	elseif (state == 1 and getglobal(this:GetName().."_Text"):GetText() == stdTxt) then
		getglobal(this:GetName().."_Text"):SetText(reallyTxt);
		
	elseif (state == 2 and getglobal(this:GetName().."_Text"):GetText() == reallyTxt) then
		getglobal(this:GetName().."_Text"):SetText(stdTxt);
		
		deleteLineFromCat(selectedCat, selectedLine);
		selectedLine = nil;
		UpdateGui();
	end
	
end

function SetScrollBarEnabled(boolVal)
	if (boolVal) then
		getglobal("BrabbelRPScrollBarScrollBar"):EnableMouse(true);
		getglobal("BrabbelRPScrollBarScrollBarScrollDownButton"):EnableMouse(true);
		getglobal("BrabbelRPScrollBarScrollBarScrollUpButton"):EnableMouse(true);
		getglobal("BrabbelRPScrollBar"):EnableMouseWheel(true);
	else
		getglobal("BrabbelRPScrollBarScrollBar"):EnableMouse(false);
		getglobal("BrabbelRPScrollBarScrollBarScrollDownButton"):EnableMouse(false);
		getglobal("BrabbelRPScrollBarScrollBarScrollUpButton"):EnableMouse(false);
		getglobal("BrabbelRPScrollBar"):EnableMouseWheel(false);	
	end	
end

-----------------------
---- UNCATEGORIZED ;-)
-----------------------

function BrabbelRP:CheckQuotes(text)
	
	-- get the line (can be more than one actual line) to output
	newlinePos = text:find("\n")
	
	while(newlinePos~=nil) do
		line = text:sub(0,newlinePos-1)	
		
		-- wenn in dieser Zeile ein Fehler gefunden wird, gib false zurueck
		if (not BrabbelRP:CheckSingleQuote(line)) then
			return false
		end
	
		text=string.sub(text,newlinePos+1)
		newlinePos=text:find("\n")
	end
	
	-- wenn in dieser ersten Zeile ein Fehler gefunden wird, gib false zurueck
	if (not BrabbelRP:CheckSingleQuote(text)) then
		return false
	end
  
	return true
end

function BrabbelRP:CheckSingleQuote(line)
	lineText, lineChannel = self:parseChatMessage(line);
	if (lineText == nil or lineChannel == nil) then
		return false
	end
	return true
end

function trim(text)
	return string.gsub(text, "^%s*(.-)%s*$", "%1");
end


local info = {}
function ModeButton_OnLoad(level, value)
	if (not HideAllOpenEdits(false)) then
		return
	end
	level = level or 1;
	
	if (level == 1) then
		info.tooltipTitle = nil;
		info.tooltipText = nil;
	
		info.hasArrow = nil;
		info.text = Translate["Choose a mode"];
		info.isTitle = true;
		UIDropDownMenu_AddButton(info);
		info.isTitle = nil;
		info.disabled = true;
		info.text = nil;
		UIDropDownMenu_AddButton(info);
		info.disabled = nil;
		
		info.text = Translate["Standard mode"];
		info.tooltipTitle = Translate["Set standard mode"];
		info.tooltipText = Translate["Set_standard_mode_tooltiptext"];
		info.value = {
			["category"] = UIDROPDOWNMENU_MENU_VALUE;
			["selected"] = "STANDARD";
		};
		info.func = handleModeButton;
		UIDropDownMenu_AddButton(info);
		info.tooltipTitle = nil;
		info.tooltipText = nil;
		
		info.disabled = true;
		info.text = nil;
		UIDropDownMenu_AddButton(info, level);
		info.disabled = nil;
		
		for key, subarray in sortedpairs(BrabbelModi_Data,brp_sort_Alphabetical) do

			info.hasArrow = true; -- creates submenu
			info.notCheckable = true;
			info.text = key;
			info.value = {
				["menuItem"] = key;
				["category"] = UIDROPDOWNMENU_MENU_VALUE;
			};
			UIDropDownMenu_AddButton(info, level);
			
		end -- for key, subarray
	end -- if level 1

	if (level == 2) then
	
		-- display first header for instants
		info.isTitle = true;
		info.disabled = true;
		info.text = Translate["Instant modes"];
		UIDropDownMenu_AddButton(info, level);
		info.isTitle = nil;
		info.disabled = nil;
	
		local temp_last = "";
		for key,value in sortedpairs(BrabbelModi_Data[UIDROPDOWNMENU_MENU_VALUE["menuItem"]],brp_sort_Alphabetical) do
			
			info.hasArrow = false; -- no submenues this time
			info.notCheckable = true;
		
			-- display second header
			if (temp_last:match("# .*") and not value["name"]:match("# .*")) then
				info.disabled = true;
				info.text = nil;
				UIDropDownMenu_AddButton(info, level);
			
				info.isTitle = true;
				info.text = Translate["Normal modes"];
				UIDropDownMenu_AddButton(info, level);
				info.isTitle = nil;
				info.disabled = nil;
			end

			info.text = value["name"];
			info.tooltipTitle = value["name"];
			info.tooltipText = value["tooltip"];
			info.value = {
				["category"] = UIDROPDOWNMENU_MENU_VALUE["category"];
				["selected"] = key;
			};
			info.func = handleModeButton;
			UIDropDownMenu_AddButton(info, level);
			
			-- only for finding the end of the instants
			temp_last = value["name"];
			
		end -- for key,subsubarray
	end -- if level 2
end
function handleModeButton()
	local catName = this.value["category"];
	local setMode = this.value["selected"];
	
	if (setMode ~= nil and BrabbelRP.db.char.categories[catName].mode ~= setMode) then
		BrabbelRP:stopTimersAndEvents(catName); -- we have to disable timer and all events for this cat BEFORE any chances, because we cannot disable an event listener, if we dont know it anymore
		
		HideDropDownMenu(1);
		BrabbelRP.db.char.categories[catName].mode = setMode;
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Set mode for category "..catName..": "..setMode); end
		
		if (BrabbelRP.db.char.categories[catName].mode == nil or BrabbelRP.db.char.categories[catName].mode == "") then
			BrabbelRP.db.char.categories[catName].mode = "STANDARD";
		end
		
		if (BrabbelRP:isActiveCategory(catName)) then -- delete state var too
			if (isInstantMode(BrabbelRP.db.char.categories[catName].mode) or BrabbelRP.db.char.categories[catName].mode == "STANDARD") then
				BrabbelRP.db.char.activeCats[catName].state = 1;
			else
				BrabbelRP.db.char.activeCats[catName].state = nil;
			end
			
			BrabbelRP:startTimersAndEvents(catName); -- timer reinitialisieren
		end
		
		UpdateGui();	
	end
end


local icon_menu = {}
function IconButton_OnLoad(level, value)
	if (not HideAllOpenEdits(false)) then
		return
	end
	icon_menu.checked = nil;
	
	-- title
	icon_menu.tooltipTitle = nil;
	icon_menu.tooltipText = nil;
	icon_menu.hasArrow = nil;
	icon_menu.text = "BrabbelRP";
	icon_menu.isTitle = true;
	UIDropDownMenu_AddButton(icon_menu);
	
	-- spacing
	icon_menu.isTitle = nil;
	icon_menu.disabled = true;
	icon_menu.text = nil;
	UIDropDownMenu_AddButton(icon_menu);
	icon_menu.disabled = nil;
	
	-- brp toggle
	icon_menu.text = Translate["BrabbelRP enabled"];
	icon_menu.func = function() HideDropDownMenu(1); BRP_ToggleActive(); end;
	icon_menu.checked = BrabbelRP:IsActive();
	UIDropDownMenu_AddButton(icon_menu);
		
	-- icon toggle
	icon_menu.text = Translate["Hide minimap icon"];
	icon_menu.func = function() HideDropDownMenu(1); BrabbelRP:toggleIcon(false); end;
	icon_menu.tooltipTitle = TT_ICONSW_HELP_TITLE2;
	icon_menu.tooltipText = TT_ICONSW_HELP_TEXT;
	icon_menu.checked = nil;
	UIDropDownMenu_AddButton(icon_menu);
	
end


function isInstantMode(checkName)
	if (checkName == "STANDARD") then
		return false;
	end
	
	for modeCatName, mode in pairs(BrabbelModi_Data) do	-- go through the modeData categories
		for modeName, modeContent in pairs(mode) do						-- go through the content of the mode
			if (modeName == checkName) then
				return modeContent['isInstantEvent'];
			end
		end
	end
	
	return nil;
end

function checkModeExists(modeName)

	if (modeName == "STANDARD") then return true end
	
	for modeCatName, mode in pairs(BrabbelModi_Data) do	-- go through the modeData categories
		if (mode[modeName] ~= nil) then
			return true
		end
	end
	
	return false
end

function getActivatingEventsOfMode(modeName)
	if (modeName == "STANDARD") then return {} end
		
	for modeCatName, mode in pairs(BrabbelModi_Data) do	-- go through the modeData categories
		for tempModeName, modeContent in pairs(mode) do						-- go through the content of the mode
			if (modeName == tempModeName) then
				if (modeContent["activating_events"] == nil) then
					return {}
				else
					return modeContent["activating_events"];
				end
			end
		end
	end
	return nil;
end

function getDeactivatingEventsOfMode(modeName)
	if (modeName == "STANDARD") then return {} end
	
	for modeCatName, mode in pairs(BrabbelModi_Data) do	-- go through the modeData categories
		for tempModeName, modeContent in pairs(mode) do						-- go through the content of the mode
			if (modeName == tempModeName) then
				if (modeContent["deactivating_events"] == nil) then
					return {}
				else
					return modeContent["deactivating_events"];
				end
			end
		end
	end
	return nil;
end

function trimEventName(eventName)

	-- trim @'s if needed
	local foundAt = eventName:find("@");
	if (foundAt ~= nil) then
		eventName = eventName:sub(0,foundAt-1);
	end

	-- trim |'s if needed
	if (eventName:find("|") ~= nil) then
		return eventName:sub(0,eventName:find("|")-1)
	else
		return eventName
	end
end

function BrabbelRP:IsDebug()
	return (BrabbelRP.db.char.debug);
end

function BrabbelRP:SetDebug(bl)
	BrabbelRP.db.char.debug = bl;
end

function BrabbelRP:SwitchToLinesView()
	if (selectedCat == nil) then
		return
	end
	
	if (not HideAllOpenEdits(false)) then
		return
	end
	
	CatsScrollFrame:Hide();
	CatActionButtons:Hide();
	
	LinesScrollFrame:Show();
	LinesActionButtons:Show();
	
	QuoteFrame:Show();
	QuoteActionButtons:Show();
	
	UpdateGui();
end


function TryToRenameCat()
	if (not HideAllOpenEdits(false) or not myTabPage1:IsVisible()) then
		return
	end
	
	for line=1,16 do
		if (getglobal("CategoryEntry"..line.."_selected"):IsVisible()) then
			getglobal("CategoryEntry"..line.."_EditBox"):SetText(getglobal("CategoryEntry"..line):GetText());
			getglobal("CategoryEntry"..line.."_EditBox"):Show();
			SetScrollBarEnabled(false);
			break;
		end
	end
	
end

function BrabbelRP:showStatusTooltip()
	if (getglobal(this:GetName().."_text"):GetText() == Translate["active"]) then
		GameTooltip_AddNewbieTip(TT_ACTIVE_HELP_TITLE, 1.0, 1.0, 1.0, TT_ACTIVE_HELP_TEXT_ACTIVE, 1);
	elseif (getglobal(this:GetName().."_text"):GetText() == Translate["inactive"]) then
		GameTooltip_AddNewbieTip(TT_ACTIVE_HELP_TITLE, 1.0, 1.0, 1.0, TT_ACTIVE_HELP_TEXT_INACTIVE, 1);
	else
		GameTooltip_AddNewbieTip(TT_ACTIVE_HELP_TITLE, 1.0, 1.0, 1.0, TT_ACTIVE_HELP_TEXT_SEMI, 1);
	end
end

function BrabbelRP:showTimerTooltip()
	if (this:GetScript("OnDoubleClick") == nil) then
		GameTooltip_AddNewbieTip(TT_TIMER_HELP_TITLE, 1.0, 1.0, 1.0, TT_TIMER_HELP_INACTIVE, 1);
	else
		GameTooltip_AddNewbieTip(TT_TIMER_HELP_TITLE, 1.0, 1.0, 1.0, TT_TIMER_HELP_TEXT, 1);
	end
end

function BrabbelRP:showHelp()
	StaticPopupDialogs["BRABBELRP_HELP"] = {
		text = TT_FIRST_HELP_TITLE .. "\n\n" .. TT_FIRST_HELP_TEXT,
		button1 = "OK",
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1,
		OnShow = function()
			BrabbelRPForm:SetAlpha(0.3);
			getglobal(this:GetName().."Text"):SetJustifyH("LEFT");
		end,
		OnHide = function()
			BrabbelRPForm:SetAlpha(1);
		end,
	};
	StaticPopup_Show ("BRABBELRP_HELP");
end

function BrabbelRP:showLoadDefaults()
	StaticPopupDialogs["BRABBELRP_LOADDEFAULTS"] = {
		text = TT_LOAD_DEFAULTS_TITLE .. "\n\n" .. TT_LOAD_DEFAULTS_TEXT,
		button1 = "OK",
		button2 = Translate["Cancel"],
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1,
		OnShow = function()
			BrabbelRPForm:SetAlpha(0.3);
			getglobal(this:GetName().."Text"):SetJustifyH("LEFT");
		end,
		OnHide = function()
			BrabbelRPForm:SetAlpha(1);
		end,
		OnAccept = function(argName)
			-- guck nach ob es in der DEFAULT-Tabelle einen Eintrag fuer die  aktuelle Sprache gibt.
			sprache = Translate:GetLocale();
			if (BrabbelRP_default ~= nil and BrabbelRP_default[sprache] ~= nil) then
				BrabbelRP:LoadDefaultCats(sprache);
			end
			
		end,
	};
	StaticPopup_Show ("BRABBELRP_LOADDEFAULTS");
end

function itIsUsedByOtherActiveCatThanThis(testCatName,testEventName)
	foundAnotherEvent = false;
	if(BrabbelRP.db.char.activeCats ~= nil) then
        table.foreach(BrabbelRP.db.char.activeCats, function(cat)
            if (testCatName ~= cat) then -- if it is another cat, check if it uses the requested eventName
				for eventId, eventName in pairs(getActivatingEventsOfMode(BrabbelRP.db.char.categories[cat].mode)) do
					if (trimEventName(testEventName) == trimEventName(eventName)) then
						foundAnotherEvent = true;
						break; -- we found something, so we can get out of the for-end
					end
				end
				if (not foundAnotherEvent) then	-- ggf. noch in den DeactivatingEvents suchen...
					for eventId, eventName in pairs(getDeactivatingEventsOfMode(BrabbelRP.db.char.categories[cat].mode)) do
						if (trimEventName(testEventName) == trimEventName(eventName)) then
							foundAnotherEvent = true;
							break; -- we found something, so we can get out of the for-end
						end
					end
				end
			end
        end);
		
	end
	return foundAnotherEvent;
end

function BrabbelRP:Try2Show_LoadDefaultButton()
	sprache = Translate:GetLocale();
	
	if (self:IsDebug()) then
		self:Print(sprache);
	end
	
	if (BrabbelRP_default ~= nil and BrabbelRP_default[sprache] ~= nil) then
		getglobal("BrabbelRPForm_Defaults"):Show();
		return
	end
	
	if (self:IsDebug()) then
		self:Print("no default cats available for the current language!");
	end
end

function BrabbelRP:LoadDefaultCats(sprache)
	BrabbelRP.db.char.activeCats = {}; -- reset the activeCats
	ResetGui();

	-- die table neu erstellen
	BrabbelRP.db.char.categories = {};
	
	-- alle einträge aus der default-table holen und einfügen. ein direktes "=" würde nur eine referenz bedeuten und probleme machen.
	for k, v in pairs (BrabbelRP_default[sprache]["categories"]) do 
		BrabbelRP.db.char.categories[k] = v;
	end
	
	if (self:IsDebug()) then BrabbelRP:Print("loading default categories for '"..sprache.."' ..."); end
	
	UpdateGui();
end


function BrabbelRP:translate(gebrabbel)

	if (BrabbelRP.db.char.categories[gebrabbel] == nil) then
		BrabbelRP:Print("Cat with translations not found");
		return
	end

	
	transText = "";
	for i,v in ipairs(BrabbelRP.db.char.categories[gebrabbel].lines) do
		transText = transText .. "\n" .. v;
	end
	transText = "\n"..transText.."\n";

	
	BrabbelRP.db.char.translate = {}
	BrabbelRP.db.char.nottranslated = {}
	for k, v in Translate:GetIterator() do
		
		foundNew = transText:find("\n"..k.."@");
		
		if (foundNew) then
		
			von = trim(transText:sub(foundNew+1));
			
			--BrabbelRP:Print("{"..von.."}");
			
			von = von:sub(von:find("@") + 1);
			
			--BrabbelRP:Print("["..von.."]");
			
			if (von:find("@")) then
				
				von = von:sub(0,von:find("@")-1);
				
				lastNL = von:find("\n");
				while (von:find("\n",lastNL+1)) do
					lastNL = von:find("\n",lastNL+1);
				end
				von = trim(von:sub(0,lastNL-1));
				
				--BrabbelRP:Print("1%"..k.."%%"..von.."%");
				BrabbelRP.db.char.translate[k] = von;
				
			else
				--BrabbelRP:Print("2%"..k.."%%"..von.."%");
				BrabbelRP.db.char.translate[k] = von;
			end

		else
			--BrabbelRP:Print("[n/a] "..k);
			BrabbelRP.db.char.nottranslated[k] = v;
		end

	end
	
	BrabbelRP:Print("Uebersetzt");
end

function sortedpairs(t,comparator)
	local sortedKeys = {};
	
	local testElement = next(t);
	if (testElement and t[testElement].name) then

		table.foreach(t, function(k,v)
			table.insert(sortedKeys,v.name)
		end);
		
		table.sort(sortedKeys,comparator);
		
		local i = 0;
		local function _f(_s,_v)
			i = i + 1;
			local k = sortedKeys[i];
			if (k) then
				local out_1;
				local out_2;
				table.foreach(t, function(temp_k,temp_v)
					if (k == temp_v.name) then
						out_1 = temp_k;
						out_2 = temp_v;
					end
				end);
				return out_1,out_2;
			end
		end
		
		return _f,nil,nil;

	else
		
		table.foreach(t, function(k,v)
			table.insert(sortedKeys,k)
		end);
		
		table.sort(sortedKeys,comparator);
		
		local i = 0;
		local function _f(_s,_v)
			i = i + 1;
			local k = sortedKeys[i];
			if (k) then
				return k,t[k];
			end
		end
		
		return _f,nil,nil;
		
	end
end

function BrabbelRP:toggleIcon(boolean)
	if ((boolean ~= nil and boolean == false) or BrabbelRP.db.char.showIcon == nil or BrabbelRP.db.char.showIcon == true) then
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Hiding BrabbelRP icon."); end
		BrabbelRP.db.char.showIcon = false;
		getglobal("BrabbelButtonFrame"):Hide();
		getglobal("BRP_IconEnabled"):SetChecked(false);
		
	else
		if (BrabbelRP:IsDebug()) then BrabbelRP:Print("Showing BrabbelRP icon."); end
		BrabbelRP.db.char.showIcon = true;
		getglobal("BrabbelButtonFrame"):Show();
		getglobal("BRP_IconEnabled"):SetChecked(true);
	end

end

function DeActivateAll(thisText)
	if (not HideAllOpenEdits(false)) then
		return
	end
	
	if (thisText == Translate["Activate all"]) then
		if(BrabbelRP.db.char["categories"] == nil) then
			return
		end
		
		table.foreach(BrabbelRP.db.char["categories"], function(cat)
				BrabbelRP:activateCat(cat);
			end
		);
		
		ResetGui();
	
	else
		if(BrabbelRP.db.char.activeCats == nil) then
			return
		end
		
		table.foreach(BrabbelRP.db.char.activeCats, function(cat)
				BrabbelRP:deactivateCat(cat);
			end
		);
		
		ResetGui();
		DeActivateAll_Text:SetText(Translate["Activate all"]);
	end
	
end
