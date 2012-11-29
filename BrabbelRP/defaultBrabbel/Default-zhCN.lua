-- we also need some chinese default entries here

BrabbelRP_default["zhCN"] = {
	-- BEGIN GERMAN default categories and lines
	["categories"] = {
			["Gegner trifft nicht"] = {
				["timer"] = 300,
				["mode"] = "ENEMY_MISSES",
				["chance"] = 5,
				["lines"] = {
					"Daneben!\n/e lacht lauthals.", -- [1]
					"Wolltest du mich treffen? Ich steh hier dr\195\188ben!\n/e grinst.", -- [2]
					"/e lacht %t aus.", -- [3]
					"Meine Gro\195\159mutter trifft besser als du!", -- [4]
					"Du solltest mal Treffen \195\188ben!", -- [5]
				},
			},
			["Schaden bekomm"] = {
				["timer"] = 300,
				["mode"] = "I_WAS_HIT",
				["lines"] = {
					"Autsch.", -- [1]
					"Das gibt ne Narbe.", -- [2]
					"Hast du nicht mehr drauf?", -- [3]
					"/e verzieht das Gesicht vor Schmerzen.", -- [4]
					"Diese Narbe wird mich immer an deinen Untergang erinnern!", -- [5]
					"Mach das nicht nochmal!\n/e guckt b\195\182se.", -- [6]
					"Wie l\195\164cherlich.\n/e lacht.", -- [7]
					"/e flucht.", -- [8]
					"/e versucht die Wunde zu ignorieren.", -- [9]
				},
				["chance"] = 4,
			},
			["levelup"] = {
				["timer"] = 300,
				["mode"] = "LEVEL_UP",
				["lines"] = {
					"/e sieht fit aus, bereit f\195\188r neue Taten.", -- [1]
					"/e blinzelt und guckt ein wenig verwirrt.\nIrgendwas kribbelt da.", -- [2]
					"/y Juhu!\n/e springt erfreut auf.", -- [3]
					"/e sieht ein wenig weiser aus.", -- [4]
					"/e freut sich. Die Erfahrung hat sich gelohnt.", -- [5]
				},
				["chance"] = 90,
			},
			["erste hilfe"] = {
				["timer"] = 10,
				["mode"] = "SELF_HEALING_TIMED",
				["chance"] = 4,
				["lines"] = {
					"/e heilt sich.", -- [1]
					"/e versorgt die Wunden.", -- [2]
					"Diese Wunde muss behandelt werden.", -- [3]
				},
			},
			["freundl. Spieler stirbt"] = {
				["timer"] = 300,
				["mode"] = "FRIENDLY_PLAYER_DIES",
				["lines"] = {
					"/e guckt traurig.", -- [1]
					"/e sieht w\195\188tend aus.\nDu hast einen von uns ermordet! Daf\195\188r wirst du bezahlen!", -- [2]
					"/y Neeeiiin!!!!", -- [3]
					"/e trauert um einen Gefallenen mehr.", -- [4]
				},
				["chance"] = 10,
			},
			["Zauberwirken"] = {
				["timer"] = 300,
				["mode"] = "UNIT_SPELLCAST_START",
				["chance"] = 4,
				["lines"] = {
					"/e wirkt einen Zauber.", -- [1]
					"Dieser Zauber wird dein Untergang sein!", -- [2]
					"/e konzentriert sich und murmelt ein paar Worte bevor ein wilder Zauber entfesselt wird.", -- [3]
				},
			},
			["Schaden mach"] = {
				["timer"] = 300,
				["mode"] = "ME_HITS",
				["lines"] = {
					"Nimm das!", -- [1]
					"/y Stirb du Biest!", -- [2]
					"/e holt zu einem kr\195\164ftigen Schlag aus.", -- [3]
					"Sp\195\188re meinen Zorn!", -- [4]
					"Mach dich bereit zu sterben!", -- [5]
					"/y Stirb!", -- [6]
					"/y Keine Gnade!", -- [7]
					"/e grinst fies.", -- [8]
				},
				["chance"] = 3,
			},
			["in der Stadt"] = {
				["timer"] = 300,
				["mode"] = "CITY",
				["lines"] = {
					"/e schlendert durch die Strassen.", -- [1]
					"/e pfeift ein Liedchen.", -- [2]
					"/e schaut sich entspannt um.", -- [3]
					"Ahh, endlich habe ich ein wenig Ruhe und Frieden.", -- [4]
				},
				["chance"] = 20,
			},
			["Kontrollverlust"] = {
				["timer"] = 300,
				["mode"] = "LOSE_CONTROL",
				["lines"] = {
					"/y Waaaaah, ich wei\195\159 nicht mehr was ich tu!", -- [1]
					"/e verliert die Kontrolle.", -- [2]
					"/y Hilfeeeee!", -- [3]
					"/y Mami, ich hab Angst.", -- [4]
					"/e wimmert \195\164ngstlich.", -- [5]
				},
				["chance"] = 8,
			},
			["unterwegs"] = {
				["timer"] = 300,
				["mode"] = "OUTSIDE_THE_CITY",
				["lines"] = {
					"/e schlendert durch die Gegend.", -- [1]
					"Was f\195\188r ein sch\195\182ner Tag.", -- [2]
					"/e untersucht den Boden nach Fu\195\159spuren.\nIch glaube der Feind ist in der N\195\164he.", -- [3]
				},
				["chance"] = 20,
			},
			["Tierchen angreifen lassen"] = {
				["timer"] = 300,
				["mode"] = "PET_ATTACK_START",
				["chance"] = 7,
				["lines"] = {
					"/y Fass!", -- [1]
					"Hol sie dir, Kleiner!", -- [2]
					"Das schaffst du auch ohne mich.", -- [3]
					"/e schaut kurz zu ihrem Begleiter und nickt.", -- [4]
				},
			},
			["quest-zuende"] = {
				["timer"] = 300,
				["mode"] = "QUEST_COMPLETE",
				["chance"] = 60,
				["lines"] = {
					"Keine Ursache, %t.", -- [1]
					"Ich habe euch gern geholfen, %t.", -- [2]
					"Diese Aufgabe war doch ein Kinderspiel.\n/e lacht.", -- [3]
				},
			},
			["Handel abschliessen"] = {
				["timer"] = 300,
				["mode"] = "TRADE_CLOSED",
				["lines"] = {
					"/e l\195\164chelt.\nIhr werdet diesen Handel nicht bereuen.", -- [1]
					"Es war ein Vergn\195\188gen mit euch Gesch\195\164fte zu machen.", -- [2]
					"/e schaut freudig in die gef\195\188llte Tasche.", -- [3]
				},
				["chance"] = 45,
			},
			["looten"] = {
				["timer"] = 300,
				["mode"] = "LOOTING_START",
				["lines"] = {
					"/e untersucht die \195\156berreste nach N\195\188tzlichem.", -- [1]
					"Was haben wir denn da?", -- [2]
					"/e nimmt dem besiegten Gegner einige Gegenst\195\164nde und steckt sie ein.", -- [3]
					"Das sieht praktisch aus. Das nehm ich mir.", -- [4]
					"Das verscherbel ich beim n\195\164chsten H\195\164ndler.\n/e lacht fr\195\182hlich.", -- [5]
				},
				["chance"] = 4,
			},
			["geheilt werd"] = {
				["timer"] = 300,
				["mode"] = "SELF_HEALING_START",
				["chance"] = 8,
				["lines"] = {
					"Jetzt f\195\188hl ich mich schon besser.", -- [1]
					"/e l\195\164chelt erleichtert.", -- [2]
					"/e sieht wieder etwas ges\195\188nder aus.", -- [3]
				},
			},
			["mit NPC reden"] = {
				["timer"] = 30,
				["mode"] = "NPC_TALK_START",
				["chance"] = 20,
				["lines"] = {
					"Und, wie gehts der Familie, %t?", -- [1]
					"/e plaudert mit %t.", -- [2]
				},
			},
		},
	-- END GERMAN default categories and lines
}