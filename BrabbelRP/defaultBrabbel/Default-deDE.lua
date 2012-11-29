BrabbelRP_default["deDE"] = {
	-- BEGIN GERMAN default categories and lines
		["categories"] = {
			["Gegner trifft nicht"] = {
				["lines"] = {
					"Daneben!\n/me lacht lauthals\n", -- [1]
					"/grinsen\nWolltest du mich treffen? Ich steh hier drüben!", -- [2]
					"/lachen", -- [3]
					"Meine Großmutter trifft besser als du!", -- [4]
					"/lachen\nDu solltest mal Treffen üben!", -- [5]
					"Meine Güte. Soll ich dir etwas von meinem Zielwasser geben? Das war 5 Meter daneben....", -- [6]
				},
				["chance"] = 10,
				["mode"] = "ENEMY_MISSES",
				["timer"] = 300,
			},
			["Mount - Absitzen"] = {
				["lines"] = {
					"/me steigt von seinem prachtvollen Säbler ab", -- [1]
					"/me steigt elegant von seinem Säbler und lässt ihn dann durch einen Strich über seinen Ring verschwinden", -- [2]
				},
				["chance"] = 15,
				["mode"] = "BRP_UNMOUNTING",
				["timer"] = 600,
			},
			["NPC-Gespräch beginnen"] = {
				["lines"] = {
					"Und, wie gehts der Familie, %t?", -- [1]
					"/e plaudert mit %t.", -- [2]
				},
				["chance"] = 20,
				["mode"] = "NPC_TALK_START",
				["timer"] = 30,
			},
			["Ein frdl. Spieler stirbt"] = {
				["lines"] = {
					"/e guckt traurig.", -- [1]
					"/e sieht wütend aus.\nDu hast einen von uns ermordet! Dafür wirst du bezahlen!", -- [2]
					"/y Neeeiiin!!!!", -- [3]
					"/e trauert um einen Gefallenen mehr.", -- [4]
					"/weinen", -- [5]
				},
				["chance"] = 100,
				["isImportant"] = true,
				["timer"] = 300,
				["mode"] = "FRIENDLY_PLAYER_DIES",
			},
			["Looten"] = {
				["lines"] = {
					"/e untersucht die Überreste nach Nützlichem.", -- [1]
					"Was haben wir denn da?", -- [2]
					"/e nimmt dem besiegten Gegner einige Gegenstände und steckt sie ein.", -- [3]
					"Das sieht praktisch aus. Das nehm ich mir.", -- [4]
					"Das verscherbel ich beim nächsten Händler.\n/lachen nil", -- [5]
				},
				["chance"] = 10,
				["isImportant"] = false,
				["timer"] = 300,
				["mode"] = "LOOTING_START",
			},
			["Stadtgebrabbel"] = {
				["lines"] = {
					"/e schlendert durch die Strassen.", -- [1]
					"/e pfeift ein Liedchen.", -- [2]
					"/e schaut sich entspannt um.", -- [3]
					"Ahh, endlich habe ich ein wenig Ruhe und Frieden.", -- [4]
				},
				["chance"] = 10,
				["mode"] = "CITY",
				["timer"] = 200,
			},
			["Angeln - Etwas gefangen"] = {
				["lines"] = {
					"HA! Hab ich heut ein Glück.\n/me mustert den prachtvollen Fang", -- [1]
					"/me reisst die Rute zurück und hat prompt einen dicken Fang an der Angel", -- [2]
					"/me sieht wie der Köder untertaucht und zieht sofort an der Angel", -- [3]
				},
				["timer"] = 600,
				["mode"] = "BRP_ANGELN_FANG",
				["chance"] = 10,
				["isImportant"] = false,
			},
			["Begleiter - Angriff!"] = {
				["lines"] = {
					"Auf gehts, %p. Angriff!", -- [1]
					"Fass, %pet!", -- [2]
					"/me schickt %p auf den Gegner", -- [3]
					"/me 's %p greift an", -- [4]
				},
				["chance"] = 20,
				["mode"] = "PET_ATTACK_START",
				["timer"] = 600,
			},
			["Zauberwirken"] = {
				["lines"] = {
					"/e wirkt einen Zauber.", -- [1]
					"/e konzentriert sich und murmelt ein paar Worte bevor ein wilder Zauber entfesselt wird.", -- [2]
					"/me fuchtelt ein wenig mit den Händen in der Luft herum", -- [3]
					"/me streicht über seinen Ring um einen Zauber zu beschwören", -- [4]
				},
				["chance"] = 2,
				["mode"] = "UNIT_SPELLCAST_START",
				["timer"] = 300,
			},
			["Schatten - verlassen"] = {
				["lines"] = {
					"/me zeigt sich wieder", -- [1]
					"/me kehrt aus dem Schatten zurück", -- [2]
				},
				["timer"] = 600,
				["isImportant"] = false,
				["chance"] = 10,
				["mode"] = "STEALTH_END",
			},
			["Einen Feind getötet"] = {
				["lines"] = {
					"HA! Das hast du nun davon.", -- [1]
					"Und wieder einer weniger...\n/lachen ", -- [2]
				},
				["chance"] = 10,
				["mode"] = "KILLED_HOSTILE",
				["timer"] = 600,
			},
			["Quest beendet"] = {
				["lines"] = {
					"Keine Ursache, %t.", -- [1]
					"Ich habe euch gern geholfen, %t.", -- [2]
					"Diese Aufgabe war doch ein Kinderspiel.\n/e lacht.", -- [3]
				},
				["chance"] = 10,
				["mode"] = "QUEST_COMPLETE",
				["timer"] = 300,
			},
			["Ausserhalb der Stadt"] = {
				["lines"] = {
					"Was für ein schöner Tag.", -- [1]
					"/me brabbelt leise etwas in seinen Bart...", -- [2]
					"/me schaut in den Himmel und schmunzelt etwas", -- [3]
					"/me pfeift ein Liedchen", -- [4]
				},
				["chance"] = 10,
				["isImportant"] = false,
				["timer"] = 200,
				["mode"] = "OUTSIDE_THE_CITY",
			},
			["Heilung bekommen"] = {
				["lines"] = {
					"/me fühlt eine heilende Kraft", -- [1]
					"/me spürt die Kraft des Heilzaubers", -- [2]
					"/me sieht etwas besser aus", -- [3]
				},
				["chance"] = 10,
				["mode"] = "SELF_HEALING_START",
				["timer"] = 600,
			},
			["Begleiter - Stirbt..."] = {
				["lines"] = {
					"NEEEINNNN! %pet ... Du hast ihn getötet! Das wirst du büßen!!!", -- [1]
					"%p !!! Neeeeein...", -- [2]
				},
				["chance"] = 10,
				["mode"] = "PET_DIES",
				["timer"] = 600,
			},
			["Handel - abschliessen"] = {
				["lines"] = {
					"/e lächelt.\nIhr werdet diesen Handel nicht bereuen.", -- [1]
					"Es war ein Vergnügen mit euch Geschäfte zu machen.", -- [2]
					"/e schaut freudig in die gefüllte Tasche.", -- [3]
					"/me wirft seinen Rucksack gekonnt wieder auf den Rücken", -- [4]
				},
				["timer"] = 300,
				["mode"] = "TRADE_CLOSED",
				["chance"] = 20,
				["isImportant"] = false,
			},
			["Gesundheit knapp"] = {
				["lines"] = {
					"Heilt mich bitte!", -- [1]
					"Ich glaube mir wird schwarz vor Augen. Bitte... heilt mich!", -- [2]
					"Gleich ist's um mich geschehen...\n/me hofft auf einen Zauber der ihm wieder Kraft geben wird", -- [3]
					"/heilmich", -- [4]
					"/hilferufen", -- [5]
				},
				["timer"] = 600,
				["mode"] = "PLAYER_OOH",
				["chance"] = 100,
				["isImportant"] = true,
			},
			["Betrunken - Währenddessen"] = {
				["lines"] = {
					"Kann mahhl jem'nd die We ... *hick* ... Welt anhalt'n? 'sch wüll austeig'n...", -- [1]
					"/me schaut in seinen Rucksack und erschreckt...\nHaahht irg'ndjemand hier noch was zu trink'n? *hicks*", -- [2]
					"/me taumelt betrunken umher", -- [3]
					"/me 's Augen versuchen krampfhaft gerade aus zu stieren, gehen aber immer wieder ein ein Schielen über...", -- [4]
				},
				["chance"] = 5,
				["mode"] = "BRP_BETRUNKEN_TIMED",
				["timer"] = 10,
			},
			["Kontrollverlust"] = {
				["lines"] = {
					"/e verliert die Kontrolle.", -- [1]
					"/y Hilfeeeee!", -- [2]
					"/y Mami, ich hab Angst.", -- [3]
					"/e wimmert ängstlich.", -- [4]
				},
				["timer"] = 300,
				["mode"] = "LOSE_CONTROL",
				["chance"] = 8,
				["isImportant"] = false,
			},
			["Schaden - machen"] = {
				["lines"] = {
					"Nimm das!", -- [1]
					"/y Stirb du Biest!", -- [2]
					"/e holt zu einem kräftigen Schlag aus.", -- [3]
					"Spüre meinen Zorn!", -- [4]
					"Mach dich bereit zu sterben!", -- [5]
					"/y Stirb!", -- [6]
					"/y Keine Gnade!", -- [7]
					"/e grinst fies.", -- [8]
					"Meine Güte. Nun stirb endlich!", -- [9]
				},
				["chance"] = 5,
				["isImportant"] = false,
				["timer"] = 300,
				["mode"] = "ME_HITS",
			},
			["Mount - Beim Reiten"] = {
				["lines"] = {
					"/me streichelt seinen treuen Gefährten", -- [1]
				},
				["chance"] = 5,
				["mode"] = "BRP_MOUNTED",
				["timer"] = 600,
			},
			["Angeln - Beim Angeln"] = {
				["lines"] = {
					"Nun beiss schon!", -- [1]
					"/me zuft sanft an der Angel um den Köder etwas zu bewegen", -- [2]
					"/me schaut gespannt auf den Schwimmer", -- [3]
				},
				["chance"] = 2,
				["mode"] = "BRP_ANGELN",
				["timer"] = 3,
			},
			["Mana zu knapp"] = {
				["lines"] = {
					"Mein Mana wird knapp!", -- [1]
					"/me Zauber werden langsam schwächer. Sein Mana scheint knapp...", -- [2]
					"/me holt schonmal seinen Stab vom Rücken, da sein Mana sich dem Ende neigt", -- [3]
					"/oom", -- [4]
				},
				["timer"] = 600,
				["mode"] = "PLAYER_OOM",
				["chance"] = 100,
				["isImportant"] = true,
			},
			["Begleiter - Unglücklich"] = {
				["lines"] = {
					"/me 's %pet sieht wieder etwas unglücklich aus", -- [1]
					"/me 's %p senkt etwas den Kopf um zu zeigen, dass er gern etwas zu essen hätte", -- [2]
				},
				["chance"] = 100,
				["mode"] = "PET_CONTENT2UNHAPPY",
				["timer"] = 600,
				["isImportant"] = true,
			},
			["Mount - Aufsitzen"] = {
				["lines"] = {
					"/me sitzt auf", -- [1]
					"/me steigt auf seinen prachtvollen Säbler", -- [2]
					"Auf gehts!", -- [3]
					"/me streicht sanft über seinen Ring an den Fingern und beschwört dadurch seinen treuen Säbler", -- [4]
				},
				["chance"] = 15,
				["mode"] = "BRP_MOUNTING",
				["timer"] = 600,
			},
			["Schatten - betreten"] = {
				["lines"] = {
					"/me versteckt sich", -- [1]
					"/me verschwindet", -- [2]
					"/me entschwindet lautlos in die Schattenwelt\n", -- [3]
				},
				["chance"] = 10,
				["mode"] = "STEALTH_START",
				["timer"] = 600,
				["isImportant"] = false,
			},
			["Schaden - bekommen"] = {
				["lines"] = {
					"Autsch.", -- [1]
					"Das gibt ne Narbe.", -- [2]
					"Hast du nicht mehr drauf?", -- [3]
					"/e verzieht das Gesicht vor Schmerzen.", -- [4]
					"Diese Narbe wird mich immer an deinen Untergang erinnern!", -- [5]
					"Mach das nicht nochmal!\n/e guckt böse.", -- [6]
					"Wie lächerlich.\n/e lacht.", -- [7]
					"/e flucht.", -- [8]
					"/e versucht die Wunde zu ignorieren.", -- [9]
					"Mehr hast du wirklich nicht drauf?\n/lachen", -- [10]
				},
				["chance"] = 5,
				["isImportant"] = false,
				["timer"] = 300,
				["mode"] = "I_WAS_HIT",
			},
			["Zirkel aufsteigen"] = {
				["lines"] = {
					"/e sieht fit aus, bereit für neue Taten.", -- [1]
					"/e blinzelt und guckt ein wenig verwirrt.\nIrgendwas kribbelt da.", -- [2]
					"/y Juhu!\n/e springt erfreut auf.", -- [3]
					"/e sieht ein wenig weiser aus.", -- [4]
					"/e freut sich. Die Erfahrung hat sich gelohnt.", -- [5]
				},
				["chance"] = 100,
				["mode"] = "LEVEL_UP",
				["timer"] = 300,
			},
		},
	-- END GERMAN default categories and lines
}