// WIP by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Game")
{
	string6 scene : 0xD0AFC;
}

startup
{
	settings.Add("openSafe",false,"Open Eloise Safe");
	settings.Add("openLocker",false,"Open Jake's Locker");
	settings.Add("meetHulk",false,"Meet Hulk");
	settings.Add("openLibrary",true,"Open Library");
	settings.Add("meetConnie",false,"Meet Connie");
	settings.Add("meetHal",false,"Meet Hal");
	settings.Add("teachersLounge",true,"Break Into Teacher's Lounge");
	settings.Add("meetDaryl",false,"Meet Daryl");
	settings.Add("getBoilerNote",false,"Get Boiler Note");
	settings.Add("openBoiler",false,"Open Boiler Room");
	settings.Add("escapeBoiler",false,"Escape Boiler Room");
	settings.Add("watchTape",true,"Watch Blackmail Tape");
}

start
{
	if (current.scene == "OpLet1")
	{
		vars.openSafe = !settings["openSafe"];
		vars.openLocker = !settings["openLocker"];
		vars.readPaper = !settings["readPaper"];
		vars.meetHulk = !settings["meetHulk"];
		vars.judoPoster = !settings["judoPoster"];
		vars.openLibrary = !settings["openLibrary"];
		vars.meetConnie = !settings["meetConnie"];
		vars.meetHal = !settings["meetHal"];
		vars.teachersLounge = !settings["teachersLounge"];
		vars.meetDaryl = !settings["meetDaryl"];
		vars.getBoilerNote = !settings["getBoilerNote"];
		vars.openBoiler = !settings["openBoiler"];
		vars.escapeBoiler = !settings["escapeBoiler"];
		vars.watchTape = !settings["watchTape"];
		return true;
	}
}

split
{
	string s = current.scene;
	switch (s) {
		case "cllet1":
			return true;
		case "ae1r":
			if (!vars.openSafe) { vars.openSafe = true; return true; }
			break;
		case "sh3f":
			if (!vars.openLocker) { vars.openLocker = true; return true; }
			break;
		case "sh3l":
			if (!vars.readPaper) { vars.readPaper = true; return true; }
			break;
		case "Sg1h":
			if (!vars.meetHulk) { vars.meetHulk = true; return true; }
			break;
		case "sg1c":
			if (!vars.judoPoster) { vars.judoPoster = true; return true; }
			break;
		case "LE1x":
			if (!vars.openLibrary) { vars.openLibrary = true; return true; }
			break;
		case "SU1C":
			if (!vars.meetConnie) { vars.meetConnie = true; return true; }
			break;
		case "Sd1h":
			if (!vars.meetHal) { vars.meetHal = true; return true; }
			break;
		case "tl1x":
			if (!vars.teachersLounge) { vars.teachersLounge = true; return true; }
			break;
		case "dd1d":
			if (!vars.meetDaryl) { vars.meetDaryl = true; return true; }
			break;
		case "dd1e":
			if (!vars.getBoilerNote) { vars.getBoilerNote = true; return true; }
			break;
		case "sc1m":
			if (!vars.openBoiler) { vars.openBoiler = true; return true; }
			break;
		case "sb1g":
			if (!vars.escapeBoiler) { vars.escapeBoiler = true; return true; }
			break;
		case "ad1t":
			if (!vars.watchTape) { vars.watchTape = true; return true; }
			break;
	}
}