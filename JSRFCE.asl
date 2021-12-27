/************************** Created by Austin 'Auddy' Davenport *************************
************************ Special thanks to the JSRF Modding Team ************************
*************************** Last Updated: December 26th, 2021 ***************************/

//  Jet Set Radio Future Category Extensions Timer

state("cxbxr-ldr")									// Emulator state
{
	int fight : 0x1E69D0;							// Enemy defeat / End of Any% & PJ%
	ushort mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int igt : 0x27B1CC;								// The In Game Timer
}

state("cxbx")										// Emulator state
{
	int fight : 0x1E69D0;							// Enemy defeat / End of Any% & PJ%
	ushort mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int igt : 0x27B1CC;								// The In Game Timer
}

state("jsrf_data_container")						// Xbox state
{
	int changeCount : 0x7A20;						// Change count
	ushort cutscene: 0x7A26;						// Cutscenes
	ushort mission : 0x7A24;						// The mission number
	int igt : 0x7A2C;								// The In Game Timer
}

init
{
	// Set initial values
	vars.gameMode = 0;	// Set the game mode to None = 0, Any% = 1, Souls% = 2 or PJ% = 3
}

startup
{
	settings.CurrentDefaultParent = null;
	settings.Add("gameMode",true, "Game Modes");
	settings.SetToolTip("gameMode", "Do not uncheck this box");
	
	// Any%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Any", true, "Any%");
	settings.SetToolTip("Any", "Check this Option if you want to run Any%");
	
	settings.CurrentDefaultParent = "Any";
	settings.Add("splitsAny", true, "Autosplitter");
	settings.SetToolTip("splitsAny", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsAny";
	settings.Add("missionsAny", true, "Missions");
	settings.SetToolTip("missionsAny", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsAny";
	settings.Add("garage",true,"Garage");
	settings.Add("beat",false,"Beat Race");
	settings.Add("dogen",true,"Dogenzaka Hill");
	settings.Add("combo",false,"Combo Challenge");
	settings.Add("shibuya",true,"Shibuya Terminal");
	settings.Add("tanks",false,"Tanks/Hayashi Fight");
	settings.Add("chuoToRDH",false,"Chuo Street to Rokkaku Dai Heights");
	settings.Add("rdhCops",false,"RDH Cop Fight");
	settings.Add("rdhToChuo",false,"Rokkaku Dai Heights to Chuo Street");
	settings.Add("start99",false,"Completed RDH & Chuo aka starting 99th Street");
	settings.Add("99Light",false,"99th Light Side");
	settings.Add("99Dark",false,"99th Dark Side");
	settings.Add("99",true,"99th Street");
	settings.Add("sewers",true,"Sewers");
	settings.Add("bottom",true,"Bottom Point");
	settings.Add("hikageTerror",false,"Terror Drone Fight");
	settings.Add("hikageCops",false,"Left & Right Cop Fights");
	settings.Add("hikageToKibo",false,"Hikage Street to Kibogaoka Hill");
	settings.Add("kiboToHikage",false,"Kibogaoka Hill to Hikage Street");
	settings.Add("startSDPP",false,"Completed Hikage & Kibo aka starting Skyscraper District");
	settings.Add("sdppCops",false,"SDPP Cop Fight");
	settings.Add("sdpp",true,"Skyscraper District");
	settings.Add("highway",true,"Highway Zero");
	settings.Add("doom",false,"Doom Riders Race");
	settings.Add("immortals",false,"Immortals Race");
	settings.Add("deathball",true,"Death Ball");
	settings.Add("noiseDogen",false,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuya",false,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuo",false,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDH",false,"Noise Tank Cleanup RDH");
	settings.Add("noise",true,"Noise Tank Cleanup");
	settings.Add("skydino",true,"Sky Dinosaurian Square");
	settings.Add("frzBlue",false,"FRZ Blue Devices");
	settings.Add("frzRed",false,"FRZ Red Devices");
	settings.Add("frz",true,"Fortified Residential Zone");
	settings.Add("claw",true,"Claw");
	settings.Add("flame",true,"Flame");
	settings.Add("train",true,"Train");
	settings.Add("zerobeat",true,"Zero Beat");
	settings.Add("akumu",true,"A.KU.MU (always active)");
}

start
{
	// Settings for New Game start Any%
	if(((current.mission == 1 && old.mission == 90) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["Any"]){
		vars.gameMode = 1;	// Set game mode
		return true;
	}
}

/*gameTime
{
	// In Game Time
	if(current.igt != old.igt && vars.gameMode != 4){
		return TimeSpan.FromSeconds(current.igt*.01666666666666666666666666666667);
	}
}*/

/*isLoading
{
	// Loading screens
	if(current.igt == old.igt){
		return true;
	}
}*/

split
{
	// Any%
	if((vars.gameMode == 1) &&
	(((current.mission == 196 && old.mission == 1) || (current.mission == 196 && old.mission == 101)) && settings["garageAny"])
	||
	((current.mission == 112 && old.mission == 110) && settings["beat"])
	||
	((current.mission == 120 && old.mission == 100) && settings["dogen"])
	||
	((current.mission == 123 && old.mission == 121) && settings["combo"])
	||
	((current.mission == 296 && old.mission == 122) && settings["shibuya"])
	||
	((current.mission == 230 && old.mission == 231) && settings["tanks"])
	||
	((current.mission == 240 && old.mission == 200) && settings["chuoToRDH"])
	||
	((current.mission == 240 && old.mission == 241) && settings["rdhCops"])
	||
	((current.mission == 230 && old.mission == 210) && settings["rdhToChuo"])
	||
	((current.mission == 250 && old.mission == 200) && settings["start99"])
	||
	((current.mission == 250 && old.mission == 251) && settings["99Light"])
	||
	((current.mission == 252 && old.mission == 250) && settings["99Dark"])
	||
	((current.mission == 396 && old.mission == 252) && settings["99"])
	||
	((current.mission == 370 && old.mission == 360) && settings["sewers"])
	||
	((current.mission == 496 && old.mission == 370) && settings["bottom"])
	||
	((current.mission == 450 && old.mission == 451) && settings["hikageTerror"])
	||
	((current.mission == 450 && old.mission == 452) && settings["hikageCops"])
	||
	((current.mission == 460 && old.mission == 430) && settings["hikageToKibo"])
	||
	((current.mission == 450 && old.mission == 410) && settings["kiboToHikage"])
	||
	((current.mission == 470 && old.mission == 440) && settings["startSDPP"])
	||
	((current.mission == 470 && old.mission == 471) && settings["sdppCops"])
	||
	((current.mission == 480 && old.mission == 470) && settings["sdpp"])
	||
	((current.mission == 596 && old.mission == 480) && settings["highway"])
	||
	((current.mission == 696 && old.mission == 514) && settings["deathball"])
	||
	((current.mission == 610 && old.mission == 620) && settings["noiseDogen"])
	||
	((current.mission == 615 && old.mission == 610) && settings["noiseShibuya"])
	||
	((current.mission == 630 && old.mission == 600) && settings["noiseChuo"])
	||
	((current.mission == 655 && old.mission == 600) && settings["noiseRDH"])
	||
	((current.mission == 660 && old.mission == 675) && settings["noise"])
	||
	((current.mission == 796 && old.mission == 660) && settings["skydino"])
	||
	(((current.mission == 750 && current.fight == 2064 && old.fight == 1040) || (current.mission == 750 && current.cutscene == 83 && old.cutscene == 82)) && settings["frzBlue"])
	||
	((current.mission == 752 && old.mission == 750) && settings["frzRed"])
	||
	((current.mission == 896 && old.mission == 751) && settings["frz"])
	||
	((current.mission == 870 && old.mission == 875) && settings["claw"])
	||
	((current.mission == 880 && old.mission == 875) && settings["flame"])
	||
	((current.mission == 898 && old.mission == 880) && settings["train"])
	||
	((current.mission == 811 && old.mission == 812) && settings["zerobeat"])
	||
	(((current.mission == 890 && current.fight == 80 && old.fight == 48) || (current.mission == 890 && current.cutscene == 102 && old.cutscene == 101)) && settings["akumu"])
	){
		return true;
	}
}

reset
{
	// Reset if we are on the Main Menu
	if(current.mission == 65535 && old.mission != 65535){
		vars.gameMode = 0;
		return true;
	}
}
