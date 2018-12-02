/***************************** Created by Austin 'Auddy' Davenport ******************************************/

//  Halo Wars: Definitive Edition Full Game Timer

state("xgameFinal")
{
	float igt : 0x166BB68;  // The In Game Timer
	uint results : 0x1620704;  // The Results screens / value = 2 if they are on the screen
	uint coopResults : 0x1620710; //The Coop Results screens / value = 4 if they are on the screen
	uint cutscenes : 0x17E3C94;  // The Cutscenes / value != 0 if they are on the screen
	uint tutorials : 0x1619E30;  // The Tutorial screens / value = 0 if they are on the screen
	uint playing : 0x184D658;  // Value when player has control in game / value = 1 if the level has started

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
	settings.Add("Coop", false, "Coop");
	settings.SetToolTip("Coop", "Check this option if you are running Coop");	
}

start
{
	// Start the timer when the In Game Timer starts running
	if(current.igt > old.igt && current.playing == 1){
		vars.totalGameTime = 0;
		return true;
	}
}

split
{
	// Split settings for Solo
	if((current.results == 2 && old.results != 2) && !settings["Coop"]){
		return true;
	}
	
	// Split settings for Coop
	if((current.coopResults == 4 && old.coopResults != 4) && settings["Coop"]){
		return true;
	}
}

isLoading
{
	// Pause the timer when the IGT isn't going on Solo
	if((current.igt == old.igt || current.results == 2 || current.cutscenes != 0 || current.tutorials == 0 || current.playing != 1) && !settings["Coop"]){
		return true;
	}
	
	// Pause the timer when the IGT isn't going on Coop
	if((current.igt == old.igt || current.coopResults == 4 || current.cutscenes != 0 || current.tutorials == 0 || current.playing != 1) && settings["Coop"]){
		return true;
	}
}

gameTime
{
	// Show the current IGT on the LiveSplit timer for Solo
	if((current.igt > old.igt && current.results != 2 && current.tutorials != 0 && current.playing == 1) && !settings["Coop"]){
		return TimeSpan.FromSeconds(System.Math.Floor(current.igt));
	}
	
	// Show the current IGT on the LiveSplit timer for Coop
	if((current.igt > old.igt && current.coopResults != 4 && current.tutorials != 0 && current.playing == 1) && settings["Coop"]){
		return TimeSpan.FromSeconds(System.Math.Floor(current.igt));
	}

	// Show all the level IGT's combined for Solo
	if((current.results == 2 && old.results != 2) && !settings["Coop"]){
		vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igt);
		return TimeSpan.FromSeconds(vars.totalGameTime);
	}
	
	// Show all the level IGT's combined for Coop
	if((current.coopResults == 4 && old.coopResults != 4) && settings["Coop"]){
		vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igt);
		return TimeSpan.FromSeconds(vars.totalGameTime);
	}
}
