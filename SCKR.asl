// (1.0 RC) by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Secrets")
{
	string5 scene : 0x001887AC, 0x20, 0x14;
	double level : 0x001887B8, 0x20, 0x8, 0x4, 0x4, 0x4, 0x0, 0x18;
}

startup
{
	refreshRate = 1500;
	settings.Add("openSafe",false,"Open Safe");
	settings.Add("beechCall",false,"Beech Phone Call");
	settings.Add("openLocker",false,"Open Jake's Locker");
	settings.Add("meetHulk",true,"Meet Hulk");
	settings.Add("enterLibrary",false,"Enter Library");
	settings.Add("useComputer",false,"Use Library Computer");
	settings.Add("meetConnie",true,"Meet Connie");
	settings.Add("teachersLounge",false,"Enter Teacher's Lounge");
	settings.Add("meetHal",false,"Meet Hal");
	settings.Add("hulkAgain",true,"Talk to Hulk Again");
	settings.Add("meetDaryl",false,"Meet Daryl");
	settings.Add("getNote",false,"Get Boiler Note");
	settings.Add("enterBoiler",false,"Enter Boiler Room");
	settings.Add("exitBoiler",true,"Exit Boiler Room");
	settings.Add("solveElements",false,"Solve Elements Puzzle");
	settings.Add("watchTape",false,"Wach Blackmail Tape");
	settings.Add("meetBeech",false,"Beech Fight");
	settings.Add("easterEgg",false,"Get Easter Egg");
	settings.Add("teachersComputer",false,"Use Teacher's Computer");
	settings.Add("awardsScreen",false,"Awards Screen");
	settings.Add("barnacleBlast",false,"Barnacle Blast");
	settings.Add("level1",false,"Level 1","barnacleBlast");
	settings.Add("level2",false,"Level 2","barnacleBlast");
	settings.Add("level3",false,"Level 3","barnacleBlast");
	settings.Add("level4",false,"Level 4","barnacleBlast");
	settings.Add("level5",false,"Level 5","barnacleBlast");
	settings.Add("level6",false,"Level 6","barnacleBlast");
	settings.Add("level7",false,"Level 7","barnacleBlast");
	settings.Add("level8",false,"Level 8","barnacleBlast");
	settings.Add("level9",false,"Level 9","barnacleBlast");
	settings.Add("level10",false,"Level 10","barnacleBlast");
	settings.Add("level11",false,"Level 11","barnacleBlast");
	settings.Add("level12",false,"Level 12","barnacleBlast");
	settings.Add("level13",false,"Level 13","barnacleBlast");
	settings.Add("level14",false,"Level 14","barnacleBlast");
	settings.Add("level15",false,"Level 15","barnacleBlast");
	settings.Add("level16",false,"Level 16","barnacleBlast");
	settings.Add("level17",false,"Level 17","barnacleBlast");
	settings.Add("level18",false,"Level 18","barnacleBlast");
	settings.Add("level19",false,"Level 19","barnacleBlast");
	settings.Add("level20",false,"Level 20","barnacleBlast");
}

update
{
	if (current.scene != old.scene) {
		print(current.scene);
	}
}

start
{
	if (current.scene == "S6430")
	{
		vars.openSafe = !settings["openSafe"];
		vars.beechCall = !settings["beechCall"];
		vars.openLocker = !settings["openLocker"];
		vars.meetHulk = !settings["meetHulk"];
		vars.enterLibrary = !settings["enterLibrary"];
		vars.useComputer = !settings["useComputer"];
		vars.meetConnie = !settings["meetConnie"];
		vars.teachersLounge = !settings["teachersLounge"];
		vars.meetHal = !settings["meetHal"];
		vars.hulkAgain = !settings["hulkAgain"];
		vars.meetDaryl = !settings["meetDaryl"];
		vars.getNote = !settings["getNote"];
		vars.enterBoiler = !settings["enterBoiler"];
		vars.exitBoiler = !settings["exitBoiler"];
		vars.solveElements = !settings["solveElements"];
		vars.watchTape = !settings["watchTape"];
		vars.meetBeech = !settings["meetBeech"];
		return true;
	}
}

split
{
	string s = current.scene;
	switch (s) {
		case "S6431": //the end
			if (!settings["awardsScreen"]) { return true; }
			break;
		case "poopy": //100 end
			if (settings["awardsScreen"]) { return true; }
			break;
		case "S4106": //open safe
			if (!vars.openSafe) { vars.openSafe = true; return true; }
			break;
		case "S4102": //beech call X
			if (!vars.beechCall) { vars.beechCall = true; return true; }
			break;
		case "S3011": //open locker
			if (!vars.openLocker) { vars.openLocker = true; return true; }
			break;
		case "S1300": //meet Hulk X
			if (!vars.meetHulk) { vars.meetHulk = true; return true; }
			break;
		case "S3210": //enter library
			if (!vars.enterLibrary) { vars.enterLibrary = true; return true; }
			break;
		case "S3370": //use computer
			if (!vars.useComputer) { vars.useComputer = true; return true; }
			break;
		case "S1201": //meet Connie X
			if (!vars.meetConnie) { vars.meetConnie = true; return true; }
			break;
		case "S5610": //teacher's lounge
			if (!vars.teachersLounge) { vars.teachersLounge = true; return true; }
			break;
		case "S1400": //meet Hal
			if (!vars.meetHal) { vars.meetHal = true; return true; }
			break;
		case "S3023": //Hulk again
			if (!vars.hulkAgain) { vars.hulkAgain = true; return true; }
			break;
		case "S1100": //meet Daryl
			if (!vars.meetDaryl) { vars.meetDaryl = true; return true; }
			break;
		case "S1194": //get note
			if (!vars.getNote) { vars.getNote = true; return true; }
			break;
		case "S2330": //enter boiler room
			if (!vars.enterBoiler) { vars.enterBoiler = true; return true; }
			break;
		case "S2323": //exit boiler
			if (!vars.exitBoiler) { vars.exitBoiler = true; return true; }
			break;
		case "S3299": //solve elements
			if (!vars.solveElements) { vars.solveElements = true; return true; }
			break;
		case "S4142": //watch tape
			if (!vars.watchTape) { vars.watchTape = true; return true; }
			break;
		case "S1600": //Beech in house
			if (!vars.meetBeech) { vars.meetBeech = true; return true; }
			break;
	}
	if (settings["barnacleBlast"]) {
		if (old.level != current.level) {
			string name = "level" + current.level;
			if (settings[name]) {
				return true;
			}
		}
	}
		
}