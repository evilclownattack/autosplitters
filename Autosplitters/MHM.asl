// Out of date, use Toburr's instead

state("Game")
{
	string10 scene : 0xF8FD9;
}

startup
{
	vars.tan = false;
}

start
{
	if (current.scene == "HOUSE01")
	{
		vars.tan = false;
		return true;
	}
}

split
{
	if (old.scene == "DIN TanPUZ" && current.scene == "DIN InlayP")
	{
		vars.tan = true;
		return true;
	}
	if (current.scene == "toast" && vars.tan)
	{
		vars.tan = false;
		return true;
	}
	if (current.scene == "STU LouisC" && old.scene == "STU CorrBr")
	{
		return true;
	}
	if (current.scene == "PRL FireOU" && old.scene == "PRL FireSD")
	{
		return true;
	}
	if (current.scene == "CHI Zodiac" && old.scene == "CHI WallPa")
	{
		return true;
	}
	if (current.scene == "CloseLette")
	{
		return true;
	}
}