--[[
ä = \195\164 (z.B. Jäger = J\195\164ger)
Ä = \195\132 (z.B. Ärger = \195\132rger)
ö = \195\182 (z.B. schön = sch\195\182n)
Ö = \195\150 (z.B. Ödipus = \195\150dipus)
ü = \195\188 (z.B. Rüstung = R\195\188stung)
Ü = \195\156 (z.B. Übung = \195\156bung)
ß = \195\159 (z.B. Straße = Stra\195\159e)
]]--

AceLibrary("AceLocale-2.2"):new("BrabbelRP"):RegisterTranslations("deDE", function() return {
    ["BrabbelRP initialized"] = "BrabbelRP initialisiert",
	["Debug mode"] = "Debug-Modus",
	["Mute in stealth mode"] = "Still w\195\164hrend Schattenhaftigkeit",
	["Minimap icon visible"] = "BrabbelRP-Icon anzeigen",
	["Hide minimap icon"] = "BrabbelRP-Icon verstecken",
	["Cancel"] = "Abbrechen",
    ["Good evening"] = "Guten Abend",
    ["Monkey"] = "Affe",
    ["This category does not exist."] = "Diese Kategorie gibt es nicht.",
    ["Lines in this category:"] = "Zeilen in dieser Kategorie:",
    ["Categories"] = "Kategorien",
    ["category"] = "Kategorie",
    ["A category with this name exists already."] = "Es gibt bereits eine Kategorie mit diesem Namen.",
    ["There are no categories registered for this character."] = "Es gibt keine Kategorien f\195\188r diesen Charakter.",
    ["There are no lines for this category."] = "In dieser Kategorie existieren noch keine Zeilen.",
    ["No category chosen at the moment."] = "Im Moment ist keine Kategorie ausgew\195\164hlt.",
    ["active category"] = "aktive Kategorie",
    ["show active category"] = "aktive Kategorie anzeigen",
    ["old"] = "alt",
    ["new"] = "neu",
    ["an unknown error occured"] = "Ein unbekannter Fehler trat auf.",
    ["The postition of the line is invalid!"]= "Die Position der Zeile ist ung\195\188ltig!",
    ["change active category"] = "die aktive Kategorie wechseln",
    ["show active category"] = "zeige die aktive Kategorie",
    ["add a new category"] = "eine neue Kategorie hinzuf\195\188gen",
    ["show all categories"] = "zeige alle Kategorien",
    ["add a new line to a category"] = "einer Kategorie eine neue Zeile hinzuf\195\188gen",
    ["change an old line to a new line"] = "eine Zeile ersetzen",
    ["change a category-name"] = "einen Kategorie-Namen \195\164ndern",
    ["show all lines for a certain category"] = "alle Zeilen einer Kategorie anzeigen",
    ["delete a certain category and all its lines!"] = "eine Kategorie und alle ihre Zeilen entfernen",
    ["Category Name here"] = "Kategoriename hier",
    ["The category"] = "Die Kategorie",
    ["does not exist."] = "existiert nicht.",
    ["Usage"] = "Benutzung",
    ["old categorie name"] = "alter Kategoriename",
    ["new categorie name"] = "neuer Kategoriename",
    ["line number"] = "Zeilennummer",
    ["line"] = "Zeile",
    ["The line does not contain any characters."] = "Diese Zeile besitzt keine Zeichen",
    ["add new Category named"] = "eine neue Kategorie hinzugef\195\188gt",
    ["unknown error creating category"] = "unbekannter Fehler beim Erstellen der Kategorie",
    ["second(s)"] = "Sekunde(n)",
    ["timer for category"] = "Timer f\195\188r die Kategorie",
    ["chance for category"] = "Wahrscheinlichkeit f\195\188r die Kategorie",
    ["value is not valid"] = "falscher Wert",
    ["chance set"] = "Wahrscheinlichkeit gesetzt",
    ["timer set"] = "Timer gesetzt",
    ["activated category"] = "Kategorie aktiviert",
    ["deactivated category"] = "Kategorie deaktiviert",
    ["active categories"] = "Aktive Kategorien",
    ["/yell"] = "/schreien",
    ["/say"] = "/sprechen",
    
    -- GUI Texts
    ["General Settings"] = "Einstellungen",
    ["This cat has no quotes yet."] = "Diese Kategorie hat bisher keine Inhalte.",
    ["choose a quote first"] = "Bitte zuerst oben ein Gebrabbel ausw\195\164hlen.",
    ["repPreventionFrame_note"] = "Hier kannst du den Unterdr\195\188ckungstimer setzen. Diese Zeit bestimmt, wie viel Zeit zwischen den einzelnen Ausgaben vergangen sein muss.",
    ["timerFrame_note"] = "Dies ist der standard Timer, der als Initialwert f\195\188r neue Kategorien verwendet wird. Du kannst die Timer f\195\188r jede Kategorie auch separat setzen.",
    ["chanceFrame_note"] = "Dies ist die standard-Wahrscheinlichkeit die f\195\188r neue Kategorien gesetzt wird. Du kannst die Wahrscheinlichkeiten auch f\195\188r jede Kategorie separat setzen.",
    ["Repeating prevention"] = "Unterdr\195\188ckungstimer",
    ["Save Quote"] = "Speichere Zeile",
    ["Status"] = "Status",
	["Mode"] = "Modus",
    ["Timer"] = "Timer",
    ["Chance"] = "Wkt.",
    ["Add new category"] = "Neue Kategorie hinzuf\195\188gen",
    ["Delete selected category"] = "Ausgew\195\164hlte Kategorie l\195\182schen",
	["Deactivate all"] = "Alle deaktivieren",
	["Activate all"] = "Alle aktivieren",
    ["Quotes"] = "Zeilen",
    ["Add new quote"] = "Neue Zeile erstellen",
    ["Delete selected quote"] = "Ausgew\195\164hlte Zeile l\195\182schen",
    ["Default timer"] = "Standard-Timer",
    ["Default chance"] = "Standard-Wkt.",
    ["Select a category"] = "W\195\164hle eine Kategorie.",
    
    -- more GUI Texts
    ["remove category "] = "Kategorie l\195\182schen",
    ["added new line to cat"] = "Neue Zeile zur Kategorie hinzugef\195\188gt",
    ["category changed"] = "Kategorie ge\195\164ndert",
    ["No categories active at the moment."] = "Zur Zeit sind keine Kategorien aktiv.",
    ["category already active"] = "Kategorie bereits aktiv",
    ["Category is active but has no entries"] = "Kategorie ist aktiv, enth\195\164lt aber keine Zeilen",
    ["Timer set to"] = "Timer gesetzt",
    ["Chance set to"] = "Wahrscheinlichkeit gesetzt",
    ["RepPrevent set to"] = "Unterdr\195\188ckungstimer gesetzt",
    ["BrabbelRP enabled"] = "BrabbelRP aktiviert",
    ["active"] = "aktiv",
	["semi-active"] = "semiaktiv",
    ["inactive"] = "inaktiv",
	["newCategory_defaultName"] = "Neue Kategorie",
	["Really delete? (doubleclick)"] = "Wirklich l\195\182schen? (doppelklicken)",
	["Load defaults"] = "Lade Standards",
	["Really load default cats and overwrite current categories? (doubleclick)"] = "Wirklich Standardkategorien laden und jetzige Kategorien \195\188berschreiben? (doppelklick)",
	["Choose a mode"] = "W\195\164hle einen Modus",
    ["Standard mode"] = "Standard-Modus",
	["Set standard mode"] = "Standard-Modus setzen",
	["Set_standard_mode_tooltiptext"] = "In diesem Modus sind der Kategorie keine Events zugeordnet und sie reagiert nur noch auf den eingestellten Timer.",
	["Instant modes"] = "Instant Modi",
	["Normal modes"] = "Normale Modi",
	["You will need to install the addon 'PetEmote' to use this command"] = "Du musst das Addon 'PetEmote' installieren, um diesen Befehl zu benutzen",
    
    -- error messages
    ["Message type or channel unknown"] = "Nachrichtentyp/Channel unbekannt",
    ["Please enter some value for the repeating prevention time."] = "Bitte einen Wert f\195\188r Unterdr\195\188ckungstimer angeben.",
    ["Please enter some value for the default timer."] = "Bitte einen Wert f\195\188r standard timer eingeben.",
    ["Please enter some value for the default chance."] = "Bitte einen Wert f\195\188r standard Wahrscheinlichkeit eingeben.",
    ["Category name can not be empty"] = "Der Name der Kategorie darf nicht leer sein!",
    ["A category with this name already exists"] = "Es existiert bereits eine Kategorie mit dem Namen.",
    ["Timer can not be empty"] = "Timer darf nicht leer sein!",
    ["Chance can not be empty"] = "Wahrscheinlichkeit darf nicht leer sein!",
    ["New category name can not be empty"] = "Der Name einer neuen Kategorie darf nicht leer sein!",
	["You will need to install the addon '"] = "Du musst das Addon '",
	["' to use this command"] = "' installieren, um dieses Kommando zu nutzen",
	
	--tooltips
	["TT_FIRST_HELP_TITLE"] = "Hilfe",
	["TT_FIRST_HELP_TEXT"] = ""..
	"* Die Oberfl\195\164che des BrabbelRP-Addons ist eigentlich sehr intuitiv gestaltet.\n"..
	"\n"..
	"Kategorie - \195\156bersicht:\n"..
	"Zum \195\132ndern der einzelnen Einstellungen der Kategorien, klicke einfach doppelt auf das, was du \195\164ndern m\195\182chtest.\n"..
	"Um einen Kategorie sp\195\164ter nocheinmal umzubenennen, klicke einfach neben dem Namen auf die '...'\n"..
	"\n"..
	"Weiterhin kommst du durch einen Doppelklick auf den Kategorienamen oder - sofern eine Kategorie ausgew\195\164hlt wurde - \195\188ber den Link "..
	"oberhalb der Kategorie-Tabelle zu der \195\156bersicht der einzelnen Spr\195\188che/Emotes dieser Kategorie.\n"..
	"\n"..
	"Spr\195\188che/Emote - \195\156bersicht:\n"..
	"Genauso einfach wie in der Kategorie-\195\156bersicht kannst du hier Zeilen/Emotes einfach durch Anklicken ausw\195\164hlen und ggf. in der Box darunter editieren. *",
	
	["TT_LOAD_DEFAULTS_TITLE"] = "Standard-Kategorien laden",
	["TT_LOAD_DEFAULTS_SHORT"] = "Setzt die Kategorien von BrabbelRP zur\195\188ck.",
	["TT_LOAD_DEFAULTS_TEXT"] = "Achtung: Wenn du auf OK klickst, werden alle Kategorien, welche du derzeit in BrabbelRP eingetragen hast, gel\195\182scht und durch Standardeintr\195\164ge ersetzt.\nBist du dir sicher dass du das m\195\182chtest?",
	
	["TT_ACTIVE_HELP_TITLE"] = "Status",
	["TT_ACTIVE_HELP_TEXT_SHORT"] = "Dies ist der gegenw\195\164rtige Status der Kategorie.",
	["TT_ACTIVE_HELP_TEXT_ACTIVE"] = "Aktiv\n"..
	"\n"..
	"* Diese Kategorie ist im Moment aktiv und brabbelt je nach Ereignissen, Wahrscheinlichkeit und ggf. Zeiteinstellung vor sich hin. *\n"..
	"\n"..
	"Zum Deaktivieren doppelklicken...",
	["TT_ACTIVE_HELP_TEXT_INACTIVE"] = "Inaktiv\n"..
		"\n"..
		"* Diese Kategorie ist im Moment deaktiviert und wird somit nichts brabbeln. *\n"..
		"\n"..
		"Zum Aktivieren doppelklicken...",
	["TT_ACTIVE_HELP_TEXT_SEMI"] = "Semiaktiv\n"..
		"\n"..
		"* Diese Kategorie befindet sich zur Zeit in einer Art Standby, in welchem sie auf ein bestimmtes Ereignis wartet.\n"..
		"Zum Beispiel ist eine Kategorie mit dem Modus 'Stadt' solange nur semiaktiv, bis der Charakter sich in eine Stadt "..
		"begibt.\n"..
		"Dort wird diese Kategorie automatisch ganz aktiviert und beim Verlassen wieder semiaktiv. *\n"..
		"\n"..
		"Zum Deaktivieren doppelklicken...",
	["TT_MODUS_HELP_TITLE"] = "Modus",
	["TT_MODUS_HELP_TEXT"] = "* Der Modus gibt an, wie diese Kategorie reagieren soll.\n"..
		"\n"..
		"Im Modus 'Standard' wird eine aktivierte Kategorie einfach alle x Sekunden mit der gesetzten Wahrscheinlichkeit brabbeln.\n"..
		"\n"..
		"Ein Modus mit einer vorangestellten Raute(#) beschreibt einen Instant-Modus, welcher direkt und ohne Verz\195\182gerung - aber dennoch mit der eingestellten Wahrscheinlichkeit - auf bestimmte Ereignisse reagiert.\n"..
		"\n"..
		"Ein Modus ohne vorangestellte Raute(#) beschreibt einen Modus, in welchem die Kategorie nur innerhalb einer bestimmten Gegend oder zb w\195\164hrend einem Kampf brabbelt. *",
	["TT_TIMER_HELP_TITLE"] = "Timer",
	["TT_TIMER_HELP_TEXT"] = "* Dieser Timer gibt an, wie oft versucht wird aus dieser Kategorie zu brabbeln. *",
	["TT_TIMER_HELP_INACTIVE"] = "* Diese Kategorie besitzt keinen Timer, da sie in einem Modus arbeitet, welcher direkt auf ein bestimmtes Event reagiert.\n"..
		"\n"..
		"Wichtig ist auch, der Kategorie so viele passende Spr\195\188che/Emotes wie nur m\195\182glich zu vergeben, so dass beim Brabbeln nicht immer mit dem gleichen Spruch/Emote reagiert wird. *",
	["TT_CHANCE_HELP_TITLE"] = "Wahrscheinlichkeit",
	["TT_CHANCE_HELP_TEXT"] = "* Hiermit kannst du die Wahrscheinlichkeit f\195\188r den Brabbelversuch einstellen.\n"..
		"\n"..
		"Zum Beispiel kann eine Kategorie aller 60 Sekunden(Timer) !versuchen! mit einer Wahrscheinlichkeit von 25% etwas zu brabbeln. Sie wird dann in etwa alle 4 Versuche erfolgreich brabbeln.\n"..
		"Wobei dies eben vollkommen zuf\195\164llig erw\195\188rfelt wird...\n"..
		"Dies soll helfen, das Gebrabbel so realistisch als m\195\182glich wirken zu lassen.\n"..
		"\n"..
		"Wichtig ist auch, der Kategorie so viele passende Spr\195\188che/Emotes wie nur m\195\182glich zu vergeben, so dass beim Brabbeln nicht immer mit dem gleichen Spruch/Emote reagiert wird. *",
	["TT_COUNT_HELP_TITLE"] = "Spruch/Emote - Anzahl",
	["TT_COUNT_HELP_TEXT"] = "* Diese Zahl gibt an, wieviele Spr\195\188che/Emotes diese Kategorie besitzt. *",
	["TT_IMPORTANT_HELP_TITLE"] = "Wichtige Kategorie",
	["TT_IMPORTANT_HELP_TEXT"] = "* Als 'wichtig' markierte Kategorien brabbeln trotz eines noch nicht abgelaufenem Unterdr\195\188ckungstimers *",
	["TT_LINES_TABLE_HELP_TITLE"] = "Gebrabbel - \195\156bersicht",
	["TT_LINES_TABLE_HELP_TEXT"] = "* W\195\164hle einfach aus den vorhandenen Eintr\195\164gen aus oder f\195\188ge eigene Neue hinzu.\n"..
		"Sei dabei am Besten so kreativ wie m\195\182glich um deinem Charakter deinen ganz pers\195\182nlichen Touch zu geben!"..
		"\n"..
		"Eine gr\195\182\195\159ere Anzahl an Eintr\195\164gen ist vorallem auch interessanter, da dann beim Brabbeln nicht immer mit dem gleichen Spruch/Emote reagiert wird. *",
	["TT_LINES_HELP_TITLE"] = "Gebrabbel - Editor",
	["TT_LINES_HELP_TEXT"] = "* Du kannst pro Gebrabbel mehrere Zeilen (durch ENTER geteilt) hinzuf\195\188gen, welche beim Brabbeln gleichzeitig abgearbeitet werden.\n"..
		"\n"..
		"Dadurch ist es zum Beispiel m\195\182glich, neben einem netten Spruch auch ein Emote (/e) auszugeben. *",
	["TT_DEBUG_HELP_TITLE"] = "Debug - Modus",
	["TT_DEBUG_HELP_TEXT"] = "* Im Debug-Modus ist das Addon sehr 'gespr\195\164chig' und zeigt im Chat teilweise seine Logik um zb. verschiedene Probleme entdecken zu k\195\182nnen.\n"..
		"Diese Option sollte f\195\188r den Normalgebrauch deaktiviert bleiben. *",
	["TT_STEALTHP_HELP_TITLE"] = "Stealth-Unterdr\195\188ckung",
	["TT_STEALTHP_HELP_TEXT"] = "* Ist diese Option aktiviert, wird der Charakter w\195\164hrend der Schattenhaftigkeit still sein. Vorallem für Schurken ist diese Option sehr wichtig um getarnt nicht aufzufallen. *",
	["TT_ICONSW_HELP_TITLE"] = "BrabbelRP-Icon anzeigen/verstecken",
	["TT_ICONSW_HELP_TITLE2"] = "BrabbelRP-Icon verstecken",
	["TT_ICONSW_HELP_TEXT"] = "* Wenn du das Icon versteckst, kannst du das BrabbelRP-Fenster weiterhin noch per '/brp toggleWindow' im Chat \195\182ffnen. Auch das Icon kannst du jederzeit mit '/brp toggleIcon' anzeigen bzw. verstecken. *",
		
	--[[ TRADE CHANNEL REGEX
	the name of the trade-channel in the game
	this is used to find out whether the character has joined the trade-channel
	]]--
	["MM-TRADE-CHANNEL-REGEX"] = "Handel",
	
	-- Mode Menu
	-- Mode Menu - Titel
	["MMT-MORE"] = "Mehr",
	["MMT-QUESTS"] = "Quests/NPCs",
	["MMT-TRADE"] = "Handel",
	["MMT-LOOT"] = "Loot",
	["MMT-PET"] = "Begleiter",
	["MMT-RAID"] = "Raid",
	["MMT-COMBAT"] = "Kampf",
	["MMT-AREA-EVENTS"] = "Zonen",
	["MMT-MOUNT-EVENTS"] = "Mounts",
	["MMT-FISHING-EVENTS"] = "Angeln",
	["MMT-DRUNKARD-EVENTS"] = "Besoffen & co.",
	
	-- ModeMenu - Eintraege
	["MM-FISHING-TITLE"] = "W\195\164hrend des Angelns",
	["MM-FISHING-TEXT"] = "Ist aktiv solange der Charakter die Angel im Wasser hat",
	
	["MM-FISHING_START-TITLE"] = "# Beim Angel-Auswerfen",
	["MM-FISHING_START-TEXT"] = "Wird aktiviert wenn die Angel ins Wasser geworfen wird",
	
	["MM-FISHING_END-TITLE"] = "# Beim Angel-Einholen",
	["MM-FISHING_END-TEXT"] = "Wird aktiviert wenn die Angel aus dem Wasser geholt wird",
	
	["MM-FISHING_LUCK-TITLE"] = "# Fischergl\195\188ck",
	["MM-FISHING_LUCK-TEXT"] = "Wird aktiviert wenn etwas an der Angel war",
	
	["MM-MOUNTED-TITLE"] = "W\195\164hrend des Reitens",
	["MM-MOUNTED-TEXT"] = "Ist aktiv solange der Charakter auf einem Reittier sitzt",
	
	["MM-MOUNTING-TITLE"] = "# Beim Aufsitzen",
	["MM-MOUNTING-TEXT"] = "Wird aktiviert wenn man auf ein Reittier aufsteigt",
	
	["MM-UNMOUNTING-TITLE"] = "# Beim Absitzen",
	["MM-UNMOUNTING-TEXT"] = "Wird aktiviert wenn man von einem Reittier absteigt",
	
	["MM-SOBER-TITLE"] = "# Wieder n\195\188chtern",
	["MM-SOBER-TEXT"] = "Wird aktiviert wenn der Charakter wieder n\195\188chtern wird",
	
	["MM-DRUNKEN-TITLE"] = "# Wird betrunken",
	["MM-DRUNKEN-TEXT"] = "Wird aktiviert wenn der Charakter betrunken wird",
	
	["MM-DRUNKEN_TIMED-TITLE"] = "Ist betrunken",
	["MM-DRUNKEN_TIMED-TEXT"] = "Ist aktiv w\195\164hrend der Charakter betrunken ist",
	
	["MM_EVENT_TESTING_TITLE"] = "Event-Testing",
	["MM-EVENT-TESTING-TEXT"] = "** wird nur zum Testen verwendet**",
	
	["MM-LEVELUP-TITLE"] = "# Level-Up",
	["MM-LEVELUP-TEXT"] = "Wird aktiviert wenn der Character im Level aufsteigt.",
	
	["MM-LEAVING-TITLE"] = "# Ausloggen",
	["MM-LEAVING-TEXT"] = "Wird aktiviert wenn der/die Spieler/in ausloggt.",
	
	["MM-QUEST-COMPLETE-TITLE"] = "# Quest beendet",
	["MM-QUEST-COMPLETE-TEXT"] = "Wird aktiviert wenn eine Aufgabe abgeschlossen und beim NPC abgegeben wurde.",
	
	["MM-NPC-TALK-START-TITLE"] = "# Beginne NPC-Gespr\195\164ch",
	["MM-NPC-TALK-START-TEXT"] = "Wird aktiviert wenn der Charakter einen NPC anspricht um sich nach dem Weg zu erkundigen, den Ruhestein zu binden, Quests anzunehmen, usw.";
	
	["MM-NPC-TALK-END-TITLE"] ="# Beende NPC-Gespr\195\164ch",
	["MM-NPC-TALK-END-TEXT"] = "Wird aktiviert wenn der Charakter die Unterhaltung mit einem NPC beendet (durch Schliessen des NPC-Fensters)",
	
	["MM-NPC-TALKING-TITLE"] = "W\195\164hrend eines NPC-Gespr\195\164chs",
	["MM-NPC-TALKING-TEXT"] = "Ist aktiv w\195\164hrend der Charakter mit einem NPC spricht.",
	
	["MM-TRADE-SHOW-TITLE"] = "# Handel beginnen",
	["MM-TRADE-SHOW-TEXT"] = "Wird aktiviert wenn das Handelsfenster (beim Handel mit einem/r anderen Spieler/in) ge\195\182ffnet wird.",
	
	["MM-MERCHANT-SHOW-TITLE"] = "W\195\164hrend NPC-Handel",
	["MM-MERCHANT-SHOW-TEXT"] = "Ist aktiv w\195\164hrend der Charakter mit einem NPC handelt.",
	
	["MM-MERCHANT-OPENED-TITLE"] = "# NPC-Handel beginnen",
	["MM-MERCHANT-OPENED-TEXT"] = "Wird aktiviert wenn das Handelsfenster eines NPC ge\195\182ffnet wird.",
	
	["MM-MERCHANT-CLOSED-TITLE"] = "# NPC-Handel beenden",
	["MM-MERCHANT-CLOSED-TEXT"] = "Wird aktiviert wenn das Handelsfenster eines NPC wieder geschlossen wird.",
	
	["MM-TRADE-MONEY-CHANGED-TITLE"] = "# Geldbetrag ge\195\164ndert",
	["MM-TRADE-MONEY-CHANGED-TEXT"] = "Wird aktiviert wenn beim Handel mit einem/r anderen Spieler/in der Geldbetrag ge\195\164ndert wird.",
	
	["MM-TRADE-CLOSED-TITLE"] = "# Handel beenden",
	["MM-TRADE-CLOSED-TEXT"] = "Wird aktiviert wenn das Handelsfenster (beim Handel mit einem/r anderen Spieler/in) geschlossen wird.",
	
	["MM-LOOTING-TITLE"] = "Looten",
	["MM-LOOTING-TEXT"] = "Ist aktiv w\195\164hrend der Charakter einen besiegten Gegner, Truhen, Kisten, etc. lootet.",
	
	["MM-LOOTING-START-TITLE"] = "# Beginne looten",
	["MM-LOOTING-START-TEXT"] = "Wird aktiviert wenn ein Loot-Fenster ge\195\182ffnet wird.",
	
	["MM-LOOTING-END-TITLE"] = "# Beende looten",
	["MM-LOOTING-END-TEXT"] = "Wird aktiviert wenn ein Loot-Fenster geschlossen wird.",
	
	["MM-PET-ATTACK-START-TITLE"] = "# Begleiter Angriff",
	["MM-PET-ATTACK-START-TEXT"] = "Wird aktiviert wenn der Begleiter angreift.",
	
	["MM-READY-CHECK-TITLE"] = "# Raid Bereitschaftscheck",
	["MM-READY-CHECK-TEXT"] = "Wird aktiviert wenn der Raidleiter einen Bereitschaftscheck durchf\195\188hrt.",
	
	["MM-DUEL-REQUESTED-TITLE"] = "# Duell gefordert",
	["MM-DUEL-REQUESTED-TEXT"] = "Wird aktiviert wenn jemand ein Duell fordert.",
	
	["MM-UNIT-SPELLCAST-START-TITLE"] = "# Zauber wirken",
	["MM-UNIT-SPELLCAST-START-TEXT"] = "Wird aktiviert wenn ein Zaubert mit Zauberzeit gestartet wird, also keine Sofortzauber oder kanalisierte Zauber.",
	
	["MM-DUEL-FINISHED-TITLE"] = "# Duell beendet",
	["MM-DUEL-FINISHED-TEXT"] = "Wird aktiviert wenn du ein Duell beendest.",
	
	["MM-LOSE-CONTROL-TITLE"] = "# Kontrolle verlieren",
	["MM-LOSE-CONTROL-TEXT"] = "Wird aktiviert wenn du die Kontrolle \195\188ber deinen Charakter verlierst. Bsp: Furcht, Blenden, usw.",
	
	["MM-KILLED_HOSTILE-TITLE"] = "# Feind get\195\182tet",
	["MM-KILLED_HOSTILE-TEXT"] = "Wird aktiviert wenn du einen Feind im Kampf t\195\182test.",
	
	["MM-I-WAS-HIT-TITLE"] = "# Ich wurde getroffen",
	["MM-I-WAS-HIT-TEXT"] = "Wird aktiviert wenn du getroffen wirst und Schaden erleidest.",
	
	["MM-SELF-HEALING-TIMED-TITLE"] = "W\195\164hrend der Heilung",
	["MM-SELF-HEALING-TIMED-TEXT"] = "Ist aktiv, w\195\164hrend ich mich heile.",
	
	["MM-SELF-HEALING-START-TITLE"] = "# Jemand heilt mich",
	["MM-SELF-HEALING-START-TEXT"] = "Wird aktiviert wenn du von jemandem geheilt wirst.",
	
	["MM-ENEMY-MISSES-TITLE"] = "# Gegner verfehlt mich",
	["MM-ENEMY-MISSES-TEXT"] = "Wird aktiviert wenn der Gegner versucht dir zu schaden und verfehlt.",
	
	["MM-ME-HITS-TITLE"] = "# Ich mache Schaden",
	["MM-ME-HITS-TEXT"] = "Wird aktiviert wenn du oder dein Begleiter einem Gegner Schaden zuf\195\188gst.",
	
	["MM-PET-HITS-TITLE"] = "# Begleiter macht Schaden",
	["MM-PET-HITS-TEXT"] = "Wird aktiviert wenn dein Begleiter einem Gegner Schaden zuf\195\188gt.",
	
	["MM-PET-PET-HAPPY-TITLE"]= "Begleiter ist gl\195\188cklich",
	["MM-PET-PET-HAPPY-TEXT"]= "Ist aktiv, w\195\164hrend der Begleiter gl\195\188cklich ist",
	
	["MM-PET-PET-CONTENT-TITLE"]= "Begleiter ist ausgeglichen",
	["MM-PET-PET-CONTENT-TEXT"]= "Ist aktiv, w\195\164hrend der Begleiter ausgeglichen ist",
	
	["MM-PET-PET-UNHAPPY-TITLE"]= "Begleiter ist ungl\195\188cklich",
	["MM-PET-PET-UNHAPPY-TEXT"]= "Ist aktiv, w\195\164hrend der Begleiter ungl\195\188cklich ist",
	
	["MM-PET-PET-CONTENT2UNHAPPY-TITLE"]= "# Begleiter wird ungl\195\188cklich",
	["MM-PET-PET-CONTENT2UNHAPPY-TEXT"]= "Wird aktiviert wenn dein Begleiter gerade ungl\195\188cklich wird",
	
	["MM-IN-COMBAT-TITLE"] = "W\195\164hrend des Kampfes",
	["MM-IN-COMBAT-TEXT"] = "Ist aktiv w\195\164hrend du in einen Kampf verwickelt bist.",
	
	["MM-FRIENDLY-PLAYER-DIES-TITLE"] = "# Fraktionsmitglied stirbt",
	["MM-FRIENDLY-PLAYER-DIES-TEXT"] = "Wird aktiv, wenn ein Charakter stirbt, der deiner Fraktion angeh\195\182rt und dir somit freundlich gesonnen ist.",
	
	["MM-CITY-ENTER-TITLE"] = "# Hauptstadt betreten", 
	["MM-CITY-ENTER-TEXT"] = "Wird aktiviert wenn du eine Hauptstadt betrittst.",
	
	["MM-CITY-LEAVE-TITLE"] = "# Hauptstadt verlassen", 
	["MM-CITY-LEAVE-TEXT"] = "Wird aktiviert wenn du eine Hauptstadt verl\195\164sst.",
	
	["MM-CITY-TITLE"] = "In der Stadt", 
	["MM-CITY-TEXT"] = "Ist aktiv w\195\164hrend du dich in einer Hauptstadt aufh\195\164ltst.",
	
	["MM-OUTSIDE-THE-CITY-TITLE"] = "Au\195\159erhalb der Stadt",
	["MM-OUTSIDE-THE-CITY-TEXT"] = "Ist aktiv w\195\164hrend du dich au\195\159erhalb einer Hauptstadt aufh\195\164ltst. (Auch in Gasth\195\164usern!)",
	
	["MM-STEALTH_START-TITLE"] = "# Schattenhaftigkeit an",
	["MM-STEALTH_START-TEXT"] = "Wird aktiviert wenn du in den Schatten verschwindest.",
	
	["MM-STEALTH_END-TITLE"] = "# Schattenhaftigkeit aus",
	["MM-STEALTH_END-TEXT"] = "Wird aktiviert wenn du aus dem Schatten heraus wieder auftauchst.",
	
	["MM-SPELLBOOK_OPEN-TITLE"] = "# Zauberbuch/F\195\164higkeiten ge\195\182ffnet",
	["MM-SPELLBOOK_OPEN-TEXT"] = "Wird aktiv, wenn du das Zauberbuch bzw. die F\195\164higkeiten \195\182ffnest",
	
	["MM-OUT-COMBAT-TITLE"] = "Au\195\159erhalb des Kampfes",
	["MM-OUT-COMBAT-TEXT"] = "Ist aktiv au\195\159erhalb eines Kampfes.",
	
	["MM-PET-DIES-TITLE"] = "# Begleiter stirb",
	["MM-PET-DIES-TEXT"] = "Wird aktiviert wenn dein Begleiter stirbt.",
	
	["MM-OOM-TITLE"] = "# Mana wird knapp",
	["MM-OOM-TEXT"] = "Wird aktiviert wenn der Mana Level unter 20 Prozent f\195\164llt.",
	
	["MM-OOH-TITLE"] = "# Gesundheit wird knapp",
	["MM-OOH-TEXT"] = "Wird aktiviert wenn der Gesundheits Level unter 25 Prozent f\195\164llt.",
	
	["MM-TAXIMAP-OPENED-TITLE"] = "# Flugroutenanzeige \195\182ffnen",
	["MM-TAXIMAP-OPENED-TEXT"] = "Wird aktiviert wenn beim Greifenmeister die Flugrouten angezeigt werden.",
	
	["MM-TAXIMAP-CLOSED-TITLE"] = "# Flugroutenanzeige schlie\195\159en",
	["MM-TAXIMAP-CLOSED-TEXT"] = "Wird aktiviert wenn das Fenster der Flugrouten beim Greifenmeister geschlossen wird und kein Flug gew\195\164hlt wurde.",
	
} end )


