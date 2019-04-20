// (1.0) by evilclownattack
// Report bugs/request settings to me on Discord
// evilclownattack#9843

state("Game", "Disc")
{
	string15 scene : 0x12D9F8;
	string5 gscene : 0x12D9F8;
}

state("Game", "Steam/Newer Disc")
{
	string15 scene : 0x12EA08;
	string5 gscene : 0x12EA08;
}

init
{
	if (modules.First().ModuleMemorySize != 1966080) {
		version = "Steam/Newer Disc";
	}
	else {
		version = "Disc";
	}
}

startup
{
	settings.Add("pondDone",true,"Finish Shoveling Pond");
	settings.Add("avalanche",false,"Avalanche at Chicken Ridge");
	settings.Add("ollie",true,"Meet Ollie");
	settings.Add("snowball",true,"Meet Freddie");
	settings.Add("knockout",false,"Knocked Out after Fishing");
	settings.Add("floe",true,"Escape Ice Floes");
	settings.Add("snowshoes",true,"Get Snowshoes");
	settings.Add("cookingStart",false,"Start Cooking");
	settings.Add("cookingFinish",true,"Finish Cooking");
	settings.Add("openShack",false,"Open Julius Shack");
	settings.Add("louNote",true,"Get Lou Newspaper");
	settings.Add("pyramid1",false,"Open Pyramid (1st time)");
	settings.Add("sauna",false,"Get Out of Sauna");
	settings.Add("pyramid2",true,"Open Pyramid (2nd time)");
	settings.Add("moose",false,"Get Moose Key");
	settings.Add("tunnels",false,"Open Tunnels");
	settings.Add("pig",false,"Get Pig Key");
	settings.Add("wolf",true,"Get Wolf Key");
	settings.Add("fadngStart",false,"Start Fox and Geese");
	settings.Add("fandgFinish",true,"Finish Fox and Geese");
	settings.Add("needle",false,"Open Needle");
}

start
{
	if (current.scene == "Toast")
	{
		vars.pondDone = !settings["pondDone"];
		vars.avalanche = !settings["avalanche"];
		vars.ollie = !settings["ollie"];
		vars.snowball = !settings["snowball"];
		vars.knockout = !settings["knockout"];
		vars.floe = !settings["floe"];
		vars.snowshoes = !settings["snowshoes"];
		vars.cookingStart = !settings["cookingStart"];
		vars.cookingFinish = !settings["cookingFinish"];
		vars.openShack = !settings["openShack"];
		vars.louNote = !settings["louNote"];
		vars.pyramid1 = !settings["pyramid1"];
		vars.sauna = !settings["sauna"];
		vars.pyramid2 = !settings["pyramid2"];
		vars.moose = !settings["moose"];
		vars.tunnels = !settings["tunnels"];
		vars.pig = !settings["pig"];
		vars.wolf = !settings["wolf"];
		vars.fandgStart = !settings["fandgStart"];
		vars.fandgFinish = !settings["fandgFinish"];
		vars.needle = !settings["needle"];
		vars.hasCooked = false;
		vars.playedFandg = false;
		return true;
	}
}

split
{
	string s = current.scene;
	switch (s) {
		case "Close_A":
			return true;
		case "SKA_ToNEE":
			if (!vars.pondDone) { vars.pondDone = true; return true; }
			break;
		case "SLO_CHI_Cin02_B":
			if (!vars.avalanche) { vars.avalanche = true; return true; }
			break;
		case "BAS_N":
			if (!vars.ollie) { vars.ollie = true; return true; }
			break;
		case "EXT_AB":
			if (!vars.snowball) { vars.snowball = true; return true; }
			break;
		case "ICI_IceFloeANIM":
			if (!vars.knockout) { vars.knockout = true; return true; }
			break;
		case "ICI_JuliusCoatG":
			if (!vars.floe) { vars.floe = true; return true; }
			break;
		case "LOB_lockOpenGon":
			if (!vars.snowshoes) { vars.snowshoes = true; return true; }
			break;
		case "LOB_INVTinoFaxC":
			if (!vars.louNote) { vars.louNote = true; return true; }
			break;
		case "LOB_PySideOpene":
			if (!vars.pyramid1) { vars.pyramid1 = true; return true; }
			break;
		case "toast":
			if (!vars.sauna && old.scene == "BAS_Pipe_PUZ")
				{ vars.sauna = true; return true; }
			break;
		case "LOB_TDJournalPa":
			if (!vars.pyramid2) { vars.pyramid2 = true; return true; }
			break;
		case "ROO_YVmooseCU":
			if (!vars.moose) { vars.moose = true; return true; }
			break;
		case "HER_ToSubAOpen":
			if (!vars.tunnels) { vars.tunnels = true; return true; }
			break;
		case "ROO_pigCU":
			if (!vars.pig) { vars.pig = true; return true; }
			break;
		case "BAS_WolfKeyCU":
			if (!vars.wolf) { vars.wolf = true; return true; }
			break;
		case "LOB_FoxGoosePUZ":
			if (!vars.fandgStart) { vars.fandgStart = true; return true; }
			vars.playedFandg = true;
			break;
		case "LOB_Vb":
			if (!vars.fandgFinish && vars.playedFandg) { vars.fandgFinish = true; return true; }
			break;
		case "LOB_Va":
			if (!vars.fandgFinish && vars.playedFandg) { vars.fandgFinish = true; return true; }
			break;
		case "NEE_NeedleLock_":
			if (!vars.needle) { vars.needle = true; return true; }
			break;
	}
	if (current.gscene == "XejO_"){
		vars.hasCooked = true;
		if (!vars.cookingStart) { vars.cookingStart = true; return true; }
	}
	if (old.gscene == "XejO_" && current.gscene != old.gscene) {
		if (!vars.cookingFinish && vars.hasCooked)
			{ vars.cookingFinish = true; return true; }
	}
	if (current.gscene == "HEXZC"){
		if (!vars.openShack) { vars.openShack = true; return true; }
	}
	
}