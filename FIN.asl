// (1.0) by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Game")
{
	string15 scene : 0xEFC3A;
}

startup
{
	settings.Add("meetSimone",false,"Meet Simone");
	settings.Add("meetJoseph",false,"Meet Joseph");
	settings.Add("getFlash",true,"Beat the Magician");
	settings.Add("openSafe",false,"Open Basement Safe");
	settings.Add("readLetter",false,"Read Houdini Letter");
	settings.Add("meetNick",false,"Meet Nick");
	settings.Add("day2",true,"Day 2 Starts");
	settings.Add("getLockPin",false,"Open Simone Drawer");
	settings.Add("lowerCages",true,"Lower Cages");
	settings.Add("findMaya",false,"Find Maya (in peephole)");
	settings.Add("kissJoseph",false,"Kiss Jospeh");
	settings.Add("enterMagic",false,"Enter Magician's Room");
	settings.Add("scareBrady",false,"Brady Cutscene");
	settings.Add("day3",true,"Day 3 Starts");
	settings.Add("makeKey",false,"Make Key");
	settings.Add("openProjector",false,"Open Projector");
}

start
{
	if (current.scene == "OPEN_A")
	{
		vars.meetSimone = !settings["meetSimone"];
		vars.meetJoseph = !settings["meetJoseph"];
		vars.getFlash = !settings["getFlash"];
		vars.openSafe = !settings["openSafe"];
		vars.readLetter = !settings["readLetter"];
		vars.meetNick = !settings["meetNick"];
		vars.day2 = !settings["day2"];
		vars.getLockPin = !settings["getLockPin"];
		vars.lowerCages = !settings["lowerCages"];
		vars.findMaya = !settings["findMaya"];
		vars.kissJoseph = !settings["kissJoseph"];
		vars.enterMagic = !settings["enterMagic"];
		vars.scareBrady = !settings["scareBrady"];
		vars.day3 = !settings["day3"];
		vars.makeKey = !settings["makeKey"];
		vars.openProjector = !settings["openProjector"];
		return true;
	}
}

split
{
	string s = current.scene;
	switch (s) {
		case "CLOSE_A":
			return true;
		case "Simone CAL Fina":
			if (!vars.meetSimone) { vars.meetSimone = true; return true; }
			break;
		case "Joseph CAL Fina":
			if (!vars.meetJoseph) { vars.meetJoseph = true; return true; }
			break;
		case "LOB_MAZCHSRCOIN":
			if (!vars.winBeesKnees) { vars.winBeesKnees = true; return true; }
			break;
		case "BSM_PRIZE_CU":
			if (!vars.getFlash) { vars.getFlash = true; return true; }
			break;
		case "BSM_PUZ_CU_AOPN":
			if (!vars.openSafe) { vars.openSafe = true; return true; }
			break;
		case "BSM_JJPPRWKPG1C":
			if (!vars.readLetter) { vars.readLetter = true; return true; }
			break;
		case "Nicholas CAL Fi":
			if (!vars.meetNick) { vars.meetNick = true; return true; }
			break;
		case "Daytwo":
			if (!vars.day2) { vars.day2 = true; return true; }
			break;
		case "WMN_DRWR_CU_AOP":
			if (!vars.getLockPin) { vars.getLockPin = true; return true; }
			break;
		case "PRJ_CNTRLPANELT":
			if (!vars.lowerCages) { vars.lowerCages = true; return true; }
			break;
		case "MGC_MAYAPEEPEVI":
			if (!vars.findMaya) { vars.findMaya = true; return true; }
			break;
		case "MGC_SEATDOOROPN":
			if (!vars.kissJoseph) { vars.kissJoseph = true; return true; }
			break;
		case "MGC_DOORENT":
		//641382579
			if (!vars.enterMagic) { vars.enterMagic = true; return true; }
			break;
		case "BRA065still":
		//BRA065still
			if (!vars.scareBrady) { vars.scareBrady = true; return true; }
			break;
		case "Daythree":
			if (!vars.day3) { vars.day3 = true; return true; }
			break;
		case "LOB_KeyMkrtop":
			if (!vars.makeKey) { vars.makeKey = true; return true; }
			break;
		case "PRJ_PROJBODYOPN":
			if (!vars.openProjector) { vars.openProjector = true; return true; }
			break;
	}
}