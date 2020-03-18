// (1.0) by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Game")
{
	string6 scene : 0xD0AFC;
	uint sceneval : 0xD2114;
}

startup
{
	settings.Add("openSafe",false,"Open Eloise Safe");
	settings.Add("openLocker",false,"Open Jake's Locker");
	settings.Add("meetHulk",false,"Meet Hulk");
	settings.Add("doneHulk",false,"Ask Hulk about the robbery");
	settings.Add("openLibrary",true,"Open Library");
	settings.Add("meetConnie",false,"Meet Connie");
	settings.Add("meetHal",false,"Meet Hal");
	settings.Add("halConnie",false,"Ask Hal about Connie");
	settings.Add("connie2",false,"2nd Connie Convo");
	settings.Add("teachersLounge",true,"Break Into Teacher's Lounge");
	settings.Add("essay",false,"Look at Hal's essay");
	settings.Add("meetDaryl",false,"Meet Daryl");
	settings.Add("getBoilerNote",false,"Get Boiler Note");
	settings.Add("openBoiler",false,"Open Boiler Room");
	settings.Add("enterBoiler",false,"Enter the boiler room");
	settings.Add("escapeBoiler",false,"Escape Boiler Room");
	settings.Add("watchTape",true,"Watch Blackmail Tape");
	settings.Add("halTape",false,"See Hal on the blackmail tape");
	settings.Add("accuseConnie",false,"Connie says \"I didn't kill Jake\"");
	settings.Add("daryl2",true,"3rd Daryl Convo/Confession");
	settings.Add("darylMitch",false,"Daryl agrees to help you get Mitch");
	settings.Add("connieMitch",false,"Connie says she won't help get Mitch");
}

start
{
	if (current.scene == "OpLet1")
	{
		vars.openSafe = !settings["openSafe"];
		vars.openLocker = !settings["openLocker"];
		vars.meetHulk = !settings["meetHulk"];
		vars.doneHulk = !settings["doneHulk"];
		vars.openLibrary = !settings["openLibrary"];
		vars.meetConnie = !settings["meetConnie"];
		vars.meetHal = !settings["meetHal"];
		vars.halConnie = !settings["halConnie"];
		vars.connie2 = !settings["connie2"];
		vars.teachersLounge = !settings["teachersLounge"];
		vars.essay = !settings["essay"];
		vars.meetDaryl = !settings["meetDaryl"];
		vars.getBoilerNote = !settings["getBoilerNote"];
		vars.openBoiler = !settings["openBoiler"];
		vars.enterBoiler = !settings["enterBoiler"];
		vars.escapeBoiler = !settings["escapeBoiler"];
		vars.watchTape = !settings["watchTape"];
		vars.halTape = !settings["halTape"];
		vars.accuseConnie = !settings["accuseConnie"];
		vars.daryl2 = !settings["daryl2"];
		vars.darylMitch = !settings["darylMitch"];
		vars.connieMitch = !settings["connieMitch"];
		vars.daryl = 0;
		vars.connie = 0;
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
			if (old.scene != "SU1C") { vars.connie++; }
			if (!vars.meetConnie && vars.connie == 1) { vars.meetConnie = true; return true; }
			if (!vars.connie2 && vars.connie == 2) { vars.connie2 = true; return true; }
			break;
		case "Sd1h":
			if (!vars.meetHal) { vars.meetHal = true; return true; }
			break;
		case "tl1x":
			if (!vars.teachersLounge) { vars.teachersLounge = true; return true; }
			break;
		case "dd1d":
			if (old.scene != "dd1d") { vars.daryl++; }
			if (!vars.meetDaryl && vars.daryl == 1) { vars.meetDaryl = true; return true; }
			if (!vars.daryl2 && vars.daryl == 3) { vars.daryl2 = true; return true; }
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

	uint t = current.sceneval;
  switch (t) {
		case 2070: // End Letter
			return true;
		case 243: // I *clap* Didn't *clap* Kill *clap* Jake
			if (!vars.accuseConnie) {vars.accuseConnie = true; return true;}
			break;
		case 250: // Connie refuses to get Mitch
			if (!vars.connieMitch) {vars.connieMitch = true; return true;}
			break;
		case 343: // All I know about is football
			if (!vars.doneHulk) {vars.doneHulk = true; return true;}
			break;
		case 437: // Asked Hal about Connie
			if (!vars.halConnie) {vars.halConnie = true; return true;}
			break;
    case 653: // Hal on Tape
			if (!vars.halTape) {vars.halTape = true; return true;}
      break;
		case 1607: // Look at Hal's essay
			if (!vars.essay) {vars.essay = true; return true;}
			break;
		case 2077: // Enter the boiler room
			if (!vars.enterBoiler) {vars.enterBoiler = true; return true;}
			break;
		case 3216: // Daryl agrees to help catch Mitch
			if (!vars.darylMitch) {vars.darylMitch = true; return true;}
			break;
  }
}
