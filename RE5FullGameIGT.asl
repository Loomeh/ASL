/***************************** Old game values found by Dread | Modified by Austin 'Auddy' Davenport & Wipefinger ******************************************/

//  Resident Evil 5: Full Game Timer

state("re5dx9")
{
	int levelNumber : 0xDA21B8, 0x273d0;  //Steam old
	float igt : 0xDA2124, 0x27758;  //Steam old
	
	int newLevelNumber : 0xDA23D8, 0x273d0;  //Steam 1.1.0
	float newIGT : 0xDA23D8, 0x27410;  //Steam 1.1.0
}

state("re5dx10")
{
	int levelNumber : 0xE79ED0, 0x21EF0;  //DX10
	float igt : 0xE79ED0, 0x21F30;  //DX10
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
	settings.SetToolTip("1.1.0", "Check this box if you are playing the Steam 1.1.0 version");

	settings.CurrentDefaultParent = "version";
	settings.Add("old", false, "Old");
	settings.SetToolTip("old", "Check this box if you are playing any Steam version before 1.1.0");

	settings.CurrentDefaultParent = "version";
	settings.Add("DX10", false, "GFWL DX10");
	settings.SetToolTip("DX10", "Check this option if you are running the GFWL DX10 / Split Screen version");
}

start
{
	// Settings for 1.1.0
	if(settings["1.1.0"]){
		if(current.newLevelNumber == 0 && current.newIGT > old.newIGT){
			vars.totalGameTime = 0;
			return true;
		}
	}

	// Settings for pre patch
	if(settings["old"]){
		if(current.levelNumber == 0 && current.igt > old.igt){
			vars.totalGameTime = 0;
			return true;
		}
	}
		
	// Settings for GFWL
	if(settings["DX10"]){
		if(current.levelNumberGFWL == 0 && current.igtGFWL > old.igtGFWL){
			vars.totalGameTime = 0;
			return true;
		}
	}
}

split
{
	// Settings for 1.1.0
	if(settings["1.1.0"]){
		if(current.newLevelNumber > old.newLevelNumber){
			return true;
			vars.totalGameTime = 0;
		}
	}	

	// Settings for pre patch
	if(settings["old"]){
		if(current.levelNumber > old.levelNumber){
			return true;
			vars.totalGameTime = 0;
		}
	}

	// Settings for GFWL
	if(settings["DX10"]){
		if(current.levelNumberGFWL > old.levelNumberGFWL && settings["DX10"]){
			return true;
			vars.totalGameTime = 0;
		}
	}
}

isLoading
{
	// Settings for 1.1.0
	if(settings["1.1.0"]){
		if(current.newIGT == old.newIGT){
			return true;
		}
	}
	
	// Settings for pre patch
	if(settings["old"]){
		if(current.igt == old.igt){
			return true;
		}
	}

	// Settings for GFWL
	if(settings["DX10"]){
		if(current.igtGFWL == old.igtGFWL){
			return true;
		}
	}
}

gameTime
{
	// Settings for 1.1.0
	if(settings["1.1.0"]){
		if(current.newIGT > old.newIGT){
			return TimeSpan.FromSeconds(System.Math.Floor(current.newIGT));
		}
		if((current.newIGT == 0 && old.newIGT > 0 && current.newLevelNumber != 5) || (current.newIGT == 0 && old.newIGT > 25 && current.newLevelNumber == 5)){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.newIGT);
			return TimeSpan.FromSeconds(vars.totalGameTime);
		}
	}
	
	//Settings for pre patch
	if(settings["old"]){
		if(current.igt > old.igt){
			return TimeSpan.FromSeconds(System.Math.Floor(current.igt));
		}
		if((current.igt == 0 && old.igt > 0 && current.levelNumber != 5) || (current.igt == 0 && old.igt > 25 && current.levelNumber == 5)){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igt);
			return TimeSpan.FromSeconds(vars.totalGameTime);
		}
	}
	
	// Settings for GFWL
	if(settings["DX10"]){
		if(current.igtGFWL > old.igtGFWL){
			return TimeSpan.FromSeconds(System.Math.Floor(current.igtGFWL));
		}
		if(current.igtGFWL == 0 && old.igtGFWL > 0){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igtGFWL);
			return TimeSpan.FromSeconds(vars.totalGameTime);
		}
	}
}
