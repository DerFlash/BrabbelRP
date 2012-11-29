BrabbelRP_default["enUS"] = {
	-- BEGIN ENGLISH default categories and lines
	["categories"] = {
			["enemy misses"] = {
				["timer"] = 300,
				["mode"] = "ENEMY_MISSES",
				["chance"] = 5,
				["lines"] = {
					"You missed!\e laughs out loud.", -- [1]
					"Did you want to hit me? I am over here!\n/e grins.", -- [2]
					"/e laughs at %t.", -- [3]
					"My grandmother is a better fighter than you are!", -- [4]
					"You should practise fighting a lot more.", -- [5]
				},
			},
			["i was hit"] = {
				["timer"] = 300,
				["mode"] = "I_WAS_HIT",
				["lines"] = {
					"Ouch.", -- [1]
					"That hurt!", -- [2]
					"/e pulls a face.", -- [3]
					"This scar will always remind me of your death!", -- [5]
					"Do that again and I'll hurt you badly!\n/e glares at the enemy.", -- [6]
					"That did not really hurt!\n/e laughs.", -- [7]
					"/e tries to ignore the wounds.", -- [9]
				},
				["chance"] = 4,
			},
			["levelup"] = {
				["timer"] = 300,
				["mode"] = "LEVEL_UP",
				["lines"] = {
					"/e seems to be more fit, ready for new quests.", -- [1]
					"/e looks confused.\nSomething is tickeling me.", -- [2]
					"/y Hurray!\n/e jumps up and down.", -- [3]
					"/e looks wiser now.", -- [4]
					"/e cheers. The experience was worth the effort.", -- [5]
				},
				["chance"] = 90,
			},
			["first aid"] = {
				["timer"] = 10,
				["mode"] = "SELF_HEALING_TIMED",
				["chance"] = 4,
				["lines"] = {
					"/e uses a bandage.", -- [1]
					"/e mends the wounds.", -- [2]
					"These wounds need to be taken care of.", -- [3]
				},
			},
			["friendly player dies"] = {
				["timer"] = 300,
				["mode"] = "FRIENDLY_PLAYER_DIES",
				["lines"] = {
					"/e looks sad.", -- [1]
					"/e looks angry.\nYou killed one of us! You will pay for that!", -- [2]
					"/y Nooooo!!!!", -- [3]
					"/e grieves for the dead.", -- [4]
				},
				["chance"] = 10,
			},
			["cast a spell"] = {
				["timer"] = 300,
				["mode"] = "UNIT_SPELLCAST_START",
				["chance"] = 4,
				["lines"] = {
					"/e casts a powerfull spell.", -- [1]
					"This spell will lead to your downfall!", -- [2]
					"/e concentrates and murmurs some strange words.", -- [3]
				},
			},
			["hit enemy"] = {
				["timer"] = 300,
				["mode"] = "ME_HITS",
				["lines"] = {
					"/y Die you foul beast!", -- [1]
					"/s You'll regret this day!", -- [2]
					"/e gets ready for a heavy strike against the enemy.", -- [3]
					"/y Fear my wrath!", -- [4]
					"Get ready to die!", -- [5]
					"/e strikes at the enemy.", -- [6]
					"/y No mercy!", -- [7]
					"/e grins evil.", -- [8]
				},
				["chance"] = 3,
			},
			["in town"] = {
				["timer"] = 300,
				["mode"] = "CITY",
				["lines"] = {
					"/e wanders along the streets.", -- [1]
					"/e whistels a happy tune.", -- [2]
					"/e seems at easy and looks around.", -- [3]
					"Ahh, some quiet and peace.", -- [4]
				},
				["chance"] = 20,
			},
			["control lost"] = {
				["timer"] = 300,
				["mode"] = "LOSE_CONTROL",
				["lines"] = {
					"/y Aaaaahh, I don't know what I'm doing anymore!", -- [1]
					"/e loses control.", -- [2]
					"/y Heeeelp!", -- [3]
					"/y Mummy, I want to go home.", -- [4]
				},
				["chance"] = 8,
			},
			["on the road"] = {
				["timer"] = 300,
				["mode"] = "OUTSIDE_THE_CITY",
				["lines"] = {
					"/e strolls around.", -- [1]
					"What a nice day.", -- [2]
					"/e search for footprints.\nI think the enemy is near.", -- [3]
					"/e looks at a map.", --[4]
				},
				["chance"] = 20,
			},
			["pet starts attack"] = {
				["timer"] = 300,
				["mode"] = "PET_ATTACK_START",
				["chance"] = 7,
				["lines"] = {
					"/y Fight!", -- [1]
					"Go get them!", -- [2]
					"You can do that without my help.", -- [3]
					"/e looks at the pet and nods shortly.", -- [4]
				},
			},
			["quest completed"] = {
				["timer"] = 300,
				["mode"] = "QUEST_COMPLETE",
				["chance"] = 60,
				["lines"] = {
					"You're welcome, %t.", -- [1]
					"I always help if I can, %t.", -- [2]
					"This quest was easy.\n/e laughs.", -- [3]
				},
			},
			["end trade"] = {
				["timer"] = 300,
				["mode"] = "TRADE_CLOSED",
				["lines"] = {
					"/e smiles.\nYou won't regret trading with me.", -- [1]
					"It's always a pleasure to trade with you.", -- [2]
					"/e looks satisfied into the now filled bags.", -- [3]
				},
				["chance"] = 45,
			},
			["loot"] = {
				["timer"] = 300,
				["mode"] = "LOOTING_START",
				["lines"] = {
					"/e searches for something useful.", -- [1]
					"What do we have here?", -- [2]
					"/e takes some things and puts them into the bag.", -- [3]
					"That seems to be useful.", -- [4]
					"I can sell that to the next vendor.\n/e smiles happily.", -- [5]
				},
				["chance"] = 4,
			},
			["being healed by someone"] = {
				["timer"] = 300,
				["mode"] = "SELF_HEALING_START",
				["chance"] = 8,
				["lines"] = {
					"I feel better now.", -- [1]
					"/e smiles and looks relieved.", -- [2]
					"/e seems to be more healthy now.", -- [3]
				},
			},
			["talk to NPC"] = {
				["timer"] = 30,
				["mode"] = "NPC_TALK_START",
				["chance"] = 20,
				["lines"] = {
					"How are the kids, %t?", -- [1]
					"/e talks to %t.", -- [2]
				},
			},
		},
	-- END ENGLISH default categories and lines
}