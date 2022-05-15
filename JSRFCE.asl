/************************** Created by Austin 'Auddy' Davenport **************************
************************ Special thanks to the JSRF Modding Team ************************/

//  Jet Set Radio Future Category Extensions Timer

state("cxbxr-ldr")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int newGameStart : 0x25A4C4; 				// Start of a New Game
	int igt : 0x27A390;							// The In Game Timer
}

state("cxbx")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number for English
	int newGameStart : 0x25A4C4; 				// Start of a New Game
	int igt : 0x27A390;							// The In Game Timer
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
	
	// PJ%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("PJ", false, "PJ%");
	settings.SetToolTip("PJ", "Check this Option if you want to run PJ%");
	
	settings.CurrentDefaultParent = "PJ";
	settings.Add("splitsPJ", true, "Autosplitter");
	settings.SetToolTip("splitsPJ", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsPJ";
	settings.Add("missionsPJ", true, "Missions");
	settings.SetToolTip("missionsPJ", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsPJ";
	settings.Add("garagePJ",true,"Garage");
	settings.Add("beatPJ",false,"Beat Race");
	settings.Add("dogenPJ",true,"Dogenzaka Hill");
	settings.Add("comboPJ",false,"Combo Challenge");
	settings.Add("shibuyaPJ",true,"Shibuya Terminal");
	settings.Add("tanksPJ",false,"Tanks/Hayashi Fight");
	settings.Add("chuoToRDHPJ",false,"Chuo Street to Rokkaku Dai Heights");
	settings.Add("rdhCopsPJ",false,"RDH Cop Fight");
	settings.Add("rdhToChuoPJ",false,"Rokkaku Dai Heights to Chuo Street");
	settings.Add("start99PJ",false,"Completed RDH & Chuo aka starting 99th Street");
	settings.Add("99LightPJ",false,"99th Light Side");
	settings.Add("99DarkPJ",false,"99th Dark Side");
	settings.Add("99PJ",true,"99th Street");
	settings.Add("sewersPJ",true,"Sewers");
	settings.Add("bottomPJ",true,"Bottom Point (always active)");
}

start
{
	// Settings for New Game start Any%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0)) && settings["Any"]){
		vars.gameMode = 1;	// Set game mode
		return true;
	}
	
	// Settings for New Game start PJ%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0)) && settings["PJ"]){
		vars.gameMode = 3;	// Set game mode
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
	(current.mission == 65732 && old.mission == 65537 && settings["garage"])
	||
	(current.mission == 65648 && old.mission == 65646 && settings["beat"])
	||
	(current.mission == 65656 && old.mission == 65636 && settings["dogen"])
	||
	(current.mission == 65659 && old.mission == 65657 && settings["combo"])
	||
	(current.mission == 131168 && old.mission == 65658 && settings["shibuya"])
	||
	(current.mission == 131302 && old.mission == 131303 && settings["tanks"])
	||
	(current.mission == 131312 && old.mission == 131272 && settings["chuoToRDH"])
	||
	(current.mission == 131312 && old.mission == 131313 && settings["rdhCops"])
	||
	(current.mission == 131302 && old.mission == 131282 && settings["rdhToChuo"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["start99"])
	||
	(current.mission == 131322 && old.mission == 131323 && settings["99Light"])
	||
	(current.mission == 131324 && old.mission == 131322 && settings["99Dark"])
	||
	(current.mission == 196704 && old.mission == 131324 && settings["99"])
	||
	(current.mission == 196978 && old.mission == 196968 && settings["sewers"])
	||
	(current.mission == 262240 && old.mission == 196978 && settings["bottom"])
	||
	(current.mission == 262594 && old.mission == 262595 && settings["hikageTerror"])
	||
	(current.mission == 262594 && old.mission == 262596 && settings["hikageCops"])
	||
	(current.mission == 262604 && old.mission == 262574 && settings["hikageToKibo"])
	||
	(current.mission == 262594 && old.mission == 262554 && settings["kiboToHikage"])
	||
	(current.mission == 262614 && old.mission == 262584 && settings["startSDPP"])
	||
	(current.mission == 262614 && old.mission == 262615 && settings["sdppCops"])
	||
	(current.mission == 262624 && old.mission == 262614 && settings["sdpp"])
	||
	(current.mission == 327776 && old.mission == 262624 && settings["highway"])
	||
	(current.mission == 328190 && old.mission == 328191 && settings["doom"])
	||
	(current.mission == 328190 && old.mission == 328192 && settings["immortals"])
	||
	(current.mission == 393312 && old.mission == 328194 && settings["deathball"])
	||
	(current.mission == 393826 && old.mission == 393836 && settings["noiseDogen"])
	||
	(current.mission == 393831 && old.mission == 393826 && settings["noiseShibuya"])
	||
	(current.mission == 393846 && old.mission == 393816 && settings["noiseChuo"])
	||
	(current.mission == 393871 && old.mission == 393816 && settings["noiseRDH"])
	||
	(current.mission == 393876 && old.mission == 393891 && settings["noise"])
	||
	(current.mission == 458848 && old.mission == 393876 && settings["skydino"])
	||
	(current.mission == 459502 && current.fight == 2064 && old.fight == 1040 && settings["frzBlue"])
	||
	(current.mission == 459504 && old.mission == 459502 && settings["frzRed"])
	||
	(current.mission == 524384 && old.mission == 459503 && settings["frz"])
	||
	(current.mission == 525158 && old.mission == 525163 && settings["claw"])
	||
	(current.mission == 525168 && old.mission == 525163 && settings["flame"])
	||
	(current.mission == 525186 && old.mission == 525168 && settings["train"])
	||
	(current.mission == 525099 && old.mission == 525100 && settings["zerobeat"])
	||
	(current.mission == 525178 && current.fight == 80 && old.fight == 48 && settings["akumu"])
	){
		return true;
	}
	
	// PJ%
	if((vars.gameMode == 3) &&
	(current.mission == 65732 && old.mission == 65537 && settings["garagePJ"])
	||
	(current.mission == 65648 && old.mission == 65646 && settings["beatPJ"])
	||
	(current.mission == 65656 && old.mission == 65636 && settings["dogenPJ"])
	||
	(current.mission == 65659 && old.mission == 65657 && settings["comboPJ"])
	||
	(current.mission == 131168 && old.mission == 65658 && settings["shibuyaPJ"])
	||
	(current.mission == 131302 && old.mission == 131303 && settings["tanksPJ"])
	||
	(current.mission == 131312 && old.mission == 131272 && settings["chuoToRDHPJ"])
	||
	(current.mission == 131312 && old.mission == 131313 && settings["rdhCopsPJ"])
	||
	(current.mission == 131302 && old.mission == 131282 && settings["rdhToChuoPJ"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["start99PJ"])
	||
	(current.mission == 131322 && old.mission == 131323 && settings["99LightSoulsPJ"])
	||
	(current.mission == 131324 && old.mission == 131322 && settings["99DarkSoulsPJ"])
	||
	(current.mission == 196704 && old.mission == 131324 && settings["99PJ"])
	||
	(current.mission == 196978 && old.mission == 196968 && settings["sewersPJ"])
	||
	(current.mission == 196979 && current.fight == 16 && old.fight == 0 && settings["bottomPJ"])
	){
		return true;
	}
}

reset
{
	// Reset if we are on the Main Menu
	if(current.mission == 90 && old.mission != 90){
		vars.gameMode = 0;
		return true;
	}
}
