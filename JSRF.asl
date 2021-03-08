/***************************** Created by The JSRF Mod Team ******************************************
************************ Credits: Austin 'Auddy' Davenport & Demo ***********************************/

//  Jet Set Radio Future Timer - Alpha

state("cxbxr-ldr")
{
	int AKUMU : 0x1E69D0;						// A.KU.MU defeat / End of Any% English
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int newGameStart : 0x25A4C4; 				// Start of a New Game Japanese
}

state("cxbx")
{
	int AKUMU : 0x1E69D0;						// A.KU.MU defeat / End of Any% English
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number for English
	int newGameStart : 0x25A4C4; 				// Start of a New Game Japanese
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
	settings.Add("garageAny",true,"Garage");
	settings.Add("dogenAny",true,"Dogenzaka Hill");
	settings.Add("shibuyaAny",true,"Shibuya");
	settings.Add("chuoAny",true,"Chuo Street");
	settings.Add("rdhAny",true,"Rokkaku Dai Heights");
	settings.Add("99Any",true,"99th Street");
	settings.Add("sewersAny",true,"Sewers");
	settings.Add("bottomAny",true,"Bottom Point");
	settings.Add("hikageAny",true,"Hikage Street");
	settings.Add("kiboAny",true,"Kibogaoka Hill");
	settings.Add("sdppAny",true,"Skyscraper District");
	settings.Add("highwayAny",true,"Highway Zero");
	settings.Add("deathballAny",true,"Death Ball");
	settings.Add("noiseAny",true,"Noise Tank Cleanup");
	settings.Add("skydinoAny",true,"Sky Dinosaurian Square");
	settings.Add("frzAny",true,"Fortified Residential Zone");
	settings.Add("clawAny",true,"Claw");
	settings.Add("flameAny",true,"Flame");
	settings.Add("trainAny",true,"Train");
	settings.Add("zerobeatAny",true,"Zero Beat");
	settings.Add("akumuAny",true,"A.KU.MU (always active)");
	
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Souls", false, "Souls%");
	settings.SetToolTip("Souls", "Check this Option if you want to run Souls%");
	settings.CurrentDefaultParent = "Souls";
	settings.Add("splitsSouls", true, "Autosplitter");
	settings.SetToolTip("splitsSouls", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsSouls";
	settings.Add("missionsSouls", true, "splits");
	settings.SetToolTip("missionsSouls", "Check this Option if you want to Autosplit on splits");
	settings.CurrentDefaultParent = "missionsSouls";
	settings.Add("garageSouls",true,"Garage");
	settings.Add("akumuSouls",true,"A.KU.MU (always active)");
	
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
	settings.Add("dogenPJ",true,"Dogenzaka Hill");
	settings.Add("shibuyaPJ",true,"Dogenzaka Hill");
	settings.Add("chuoPJ",true,"Chuo Street");
	settings.Add("rdhPJ",true,"Rokkaku Dai Heights");
	settings.Add("99PJ",true,"99th Street");
	settings.Add("sewersPJ",true,"Sewers");
	settings.Add("bottomPJ",true,"Bottom Point (always active)");
}

start
{
	// Settings for New Game Start
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0)) && settings["Any"]){
		vars.gameMode = 1;	// Set game mode
		return true;
	}
}

split
{
	// Any%
	if((vars.gameMode == 1) &&
	(current.mission == 65732 && old.mission == 65537 && settings["garageAny"])
	||
	(current.mission == 65656 && old.mission == 65636 && settings["dogenAny"])
	||
	(current.mission == 131168 && old.mission == 65658 && settings["shibuyaAny"])
	||
	(current.mission == 131312 && old.mission == 131272 && settings["chuoAny"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["rdhAny"])
	||
	(current.mission == 196704 && old.mission == 131324 && settings["99Any"])
	||
	(current.mission == 196978 && old.mission == 196968 && settings["sewersAny"])
	||
	(current.mission == 262240 && old.mission == 196978 && settings["bottomAny"])
	||
	(current.mission == 262604 && old.mission == 262574 && settings["hikageAny"])
	||
	(current.mission == 262614 && old.mission == 262584 && settings["kiboAny"])
	||
	(current.mission == 262624 && old.mission == 262614 && settings["sdppAny"])
	||
	(current.mission == 327776 && old.mission == 262624 && settings["highwayAny"])
	||
	(current.mission == 393312 && old.mission == 328194 && settings["deathballAny"])
	||
	(current.mission == 393876 && old.mission == 393891 && settings["noiseAny"])
	||
	(current.mission == 458848 && old.mission == 393876 && settings["skydinoAny"])
	||
	(current.mission == 524384 && old.mission == 459503 && settings["frzAny"])
	||
	(current.mission == 525158 && old.mission == 525163 && settings["clawAny"])
	||
	(current.mission == 525168 && old.mission == 525163 && settings["flameAny"])
	||
	(current.mission == 525186 && old.mission == 525168 && settings["trainAny"])
	||
	(current.mission == 525099 && old.mission == 525100 && settings["zerobeatAny"])
	||
	(current.mission == 525178 && current.AKUMU == 80 && old.AKUMU == 48 && settings["akumuAny"])
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
