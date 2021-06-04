// (1.0 RC) by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Game")
{
	string10 scene : 0xE762C;
}

startup
{
	settings.Add("meetJock",false,"Meet Jacques");
	settings.Add("meetHotchkiss",false,"Meet Hotchkiss");
	settings.Add("getRiddle",false,"Get Riddle Note");
	settings.Add("sleep",false,"Go to Sleep (1st Time)");
	settings.Add("enterLibrary",false,"Enter Library");
	settings.Add("secretOffice",false,"Enter Secret Workshop");
	settings.Add("caughtJock",true,"Caught Jock");
	settings.Add("openLocker",false,"Open Jacques Locker");
	settings.Add("redMed",false,"Get Red Medallion");
	settings.Add("shedKey",true,"Get Shed Key");
	settings.Add("openPuzzle",false,"Open Journal Compartment");
	settings.Add("meetLisa",false,"Meet Lisa");
	settings.Add("nightOwl",false,"Meet Hotchkiss (in person)");
	settings.Add("hotchkissTape",false,"Watch Hotchkiss Tape");
	settings.Add("greenMed",true,"Get Green Medallion");
	settings.Add("blueMed",true,"Get Blue Medallion");
	settings.Add("decode",true,"Read Decoder");
}

start
{
	if (current.scene == "INTROA")
	{
		vars.meetJock = !settings["meetJock"];
		vars.meetHotchkiss = !settings["meetHotchkiss"];
		vars.getRiddle = !settings["getRiddle"];
		vars.sleep = !settings["sleep"];
		vars.enterLibrary = !settings["enterLibrary"];
		vars.secretOffice = !settings["secretOffice"];
		vars.caughtJock = !settings["caughtJock"];
		vars.openLocker = !settings["openLocker"];
		vars.redMed = !settings["redMed"];
		vars.shedKey = !settings["shedKey"];
		vars.openPuzzle = !settings["openPuzzle"];
		vars.meetLisa = !settings["meetLisa"];
		vars.nightOwl = !settings["nightOwl"];
		vars.hotchkissTape = !settings["hotchkissTape"];
		vars.greenMed = !settings["greenMed"];
		vars.blueMed = !settings["blueMed"];
		vars.decode = !settings["decode"];
		return true;
	}
}

split
{
	string s = current.scene;
	switch (s) {
		case "CLOSEA":
			return true;
		case "Jacque CAL":
			if (!vars.meetJock) { vars.meetJock = true; return true; }
			break;
		case "HAL2_PDoor":
			if (!vars.meetHotchkiss) { vars.meetHotchkiss = true; return true; }
			break;
		case "HAL2_Riddl":
			if (!vars.getRiddle) { vars.getRiddle = true; return true; }
			break;
		case "toast":
			if (!vars.sleep) { vars.sleep = true; return true; }
			break;
		case "Lib_EnterF":
			if (!vars.enterLibrary) { vars.enterLibrary = true; return true; }
			break;
		case "EZR_DeskUn":
			if (!vars.secretOffice) { vars.secretOffice = true; return true; }
			break;
		case "TNL_GE_ba":
			if (!vars.caughtJock) { vars.caughtJock = true; return true; }
			break;
		case "LKR_Locker":
			if (!vars.openLocker) { vars.openLocker = true; return true; }
			break;
		case "GAR_Medali":
			if (!vars.redMed) { vars.redMed = true; return true; }
			break;
		case "SHD_KeyCU":
			if (!vars.shedKey) { vars.shedKey = true; return true; }
			break;
		case "TWR_GOLDLF":
			if (!vars.openPuzzle) { vars.openPuzzle = true; return true; }
			break;
		case "Lisa CAL F":
			if (!vars.meetLisa) { vars.meetLisa = true; return true; }
			break;
		case "Hotchkiss":
			if (!vars.nightOwl) { vars.nightOwl = true; return true; }
			break;
		case "HAL2_FlyBy":
			if (!vars.hotchkissTape) { vars.hotchkissTape = true; return true; }
			break;
		case "SHD_Medali":
			if (!vars.greenMed) { vars.greenMed = true; return true; }
			break;
		case "PRO_Couch_":
			if (!vars.blueMed) { vars.blueMed = true; return true; }
			break;
		case "PRO_Typwri":
			if (!vars.decode) { vars.decode = true; return true; }
			break;
	}
}