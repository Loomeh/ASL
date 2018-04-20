/***************************** Old game values found by Dread | Modified by Austin 'Auddy' Davenport & Wipefinger ******************************************/

//  Resident Evil 5: Full Game Timer

state("re5dx9")
{
	int levelNumber : 0xDA21B8, 0x273d0;  //old
	float igt : 0xDA2124, 0x27758;  //old
	
	int newLevelNumber : 0xDA23D8, 0x273d0;  //1.1.0
	float newIGT : 0xDA23D8, 0x27410;  //1.1.0
}

init
{
	vars.totalGameTime = 0;
}

startup
{
	settings.Add("version",true, "Version");
	settings.SetToolTip("version", "Do not uncheck this box");
	settings.CurrentDefaultParent = "version";
	settings.Add("1.1.0", true, "1.1.0");
	settings.SetToolTip("1.1.0", "Check this option if you are running the 1.1.0 patch");
}

start
{
	// Settings for 1.1.0
	if((current.newLevelNumber == 0 && current.newIGT > old.newIGT) && settings["1.1.0"]){
		vars.totalGameTime = 0;
		return true;
	}
	
	//Settings for pre patch
	if((current.levelNumber == 0 && current.igt > old.igt) && !settings["1.1.0"]){
		vars.totalGameTime = 0;
		return true;
	}
}

split
{
	// Settings for 1.1.0
	if((current.newLevelNumber > old.newLevelNumber) && settings["1.1.0"]){
		return true;
		vars.totalGameTime = 0;
	}
	
	//Settings for pre patch
	if((current.levelNumber > old.levelNumber) && !settings["1.1.0"]){
		return true;
		vars.totalGameTime = 0;
	}
}

isLoading
{
	// Settings for 1.1.0
	if((current.newIGT == old.newIGT) && settings["1.1.0"]){
		return true;
	}
	
	//Settings for pre patch
	if((current.igt == old.igt) && !settings["1.1.0"]){
		return true;
	}
}

gameTime
{
	// Settings for 1.1.0
	if(settings["1.1.0"]){
		if(current.newIGT > old.newIGT){
			return TimeSpan.FromSeconds(System.Math.Floor(current.newIGT));
		}
		if(current.newIGT == 0 && old.newIGT > 0){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.newIGT);
			return TimeSpan.FromSeconds(vars.totalGameTime);
		}
	}
	
	//Settings for pre patch
	if(!settings["1.1.0"]){
		if(current.igt > old.igt){
			return TimeSpan.FromSeconds(System.Math.Floor(current.igt));
		}
		if(current.igt == 0 && old.igt > 0){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igt);
			return TimeSpan.FromSeconds(vars.totalGameTime);
		}
	}
}
