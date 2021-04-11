/************************** Created by Austin 'Auddy' Davenport **************************
************************ Special thanks to the JSRF Modding Team ************************/

//  Jet Set Radio Future Timer

state("cxbxr-ldr")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int newGameStart : 0x25A4C4; 				// Start of a New Game
}

state("cxbx")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number for English
	int newGameStart : 0x25A4C4; 				// Start of a New Game
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
	settings.Add("garageAny",true,"Garage");
	settings.Add("beatAny",false,"Beat Race");
	settings.Add("dogenAny",true,"Dogenzaka Hill");
	settings.Add("comboAny",false,"Combo Challenge");
	settings.Add("shibuyaAny",true,"Shibuya Terminal");
	settings.Add("tanksAny",false,"Tanks/Hayashi Fight");
	settings.Add("chuoAny",true,"Chuo Street");
	settings.Add("rdhCopsAny",false,"RDH Cop Fight");
	settings.Add("rdhAny",true,"Rokkaku Dai Heights");
	settings.Add("99LightAny",false,"99th Light Side");
	settings.Add("99DarkAny",false,"99th Dark Side");
	settings.Add("99Any",true,"99th Street");
	settings.Add("sewersAny",true,"Sewers");
	settings.Add("bottomAny",true,"Bottom Point");
	settings.Add("hikageTerrorAny",false,"Terror Drone Fight");
	settings.Add("hikageCopsAny",false,"Left & Right Cop Fights");
	settings.Add("hikageAny",true,"Hikage Street");
	settings.Add("kiboAny",true,"Kibogaoka Hill");
	settings.Add("sdppCopsAny",false,"SDPP Cop Fight");
	settings.Add("sdppAny",true,"Skyscraper District");
	settings.Add("highwayAny",true,"Highway Zero");
	settings.Add("doomAny",false,"Doom Riders Race");
	settings.Add("immortalsAny",false,"Immortals Race");
	settings.Add("deathballAny",true,"Death Ball");
	settings.Add("noiseDogenAny",false,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaAny",false,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoAny",false,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHAny",false,"Noise Tank Cleanup RDH");
	settings.Add("noiseAny",true,"Noise Tank Cleanup");
	settings.Add("skydinoAny",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueAny",false,"FRZ Blue Devices");
	settings.Add("frzRedAny",false,"FRZ Red Devices");
	settings.Add("frzAny",true,"Fortified Residential Zone");
	settings.Add("clawAny",true,"Claw");
	settings.Add("flameAny",true,"Flame");
	settings.Add("trainAny",true,"Train");
	settings.Add("zerobeatAny",true,"Zero Beat");
	settings.Add("akumuAny",true,"A.KU.MU (always active)");
	
	// Souls%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Souls", false, "Souls%");
	settings.SetToolTip("Souls", "Check this Option if you want to run Souls%");
	
	settings.CurrentDefaultParent = "Souls";
	settings.Add("splitsSouls", true, "Autosplitter");
	settings.SetToolTip("splitsSouls", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsSouls";
	settings.Add("missionsSouls", true, "Missions");
	settings.SetToolTip("missionsSouls", "Check this Option if you want to Autosplit on splits");
	
	settings.CurrentDefaultParent = "missionsSouls";
	settings.Add("garageSouls",true,"Garage");
	settings.Add("beatSouls",false,"Beat Race");
	settings.Add("dogenSouls",true,"Dogenzaka Hill");
	settings.Add("comboSouls",false,"Combo Challenge");
	settings.Add("shibuyaSouls",true,"Shibuya Terminal");
	settings.Add("tanksSouls",false,"Tanks/Hayashi Fight");
	settings.Add("chuoSouls",true,"Chuo Street");
	settings.Add("rdhCopsSouls",false,"RDH Cop Fight");
	settings.Add("rdhSouls",true,"Rokkaku Dai Heights");
	settings.Add("99LightSouls",false,"99th Light Side");
	settings.Add("99DarkSouls",false,"99th Dark Side");
	settings.Add("99Souls",true,"99th Street");
	settings.Add("sewersSouls",true,"Sewers");
	settings.Add("bottomSouls",true,"Bottom Point");
	settings.Add("hikageTerrorSouls",false,"Terror Drone Fight");
	settings.Add("hikageCopsSouls",false,"Left & Right Cop Fights");
	settings.Add("hikageSouls",true,"Hikage Street");
	settings.Add("kiboSouls",true,"Kibogaoka Hill");
	settings.Add("sdppCopsSouls",false,"SDPP Cop Fight");
	settings.Add("sdppSouls",true,"Skyscraper District");
	settings.Add("highwaySouls",true,"Highway Zero");
	settings.Add("doomSouls",false,"Doom Riders Race");
	settings.Add("immortalsSouls",false,"Immortals Race");
	settings.Add("deathballSouls",true,"Death Ball");
	settings.Add("noiseDogenSouls",true,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaSouls",true,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoSouls",true,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHSouls",true,"Noise Tank Cleanup RDH");
	settings.Add("noiseSouls",true,"Noise Tank Cleanup");
	settings.Add("skydinoSouls",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueSouls",false,"FRZ Blue Devices");
	settings.Add("frzRedSouls",false,"FRZ Red Devices");
	settings.Add("frzSouls",true,"Fortified Residential Zone");
	settings.Add("clawSouls",true,"Claw");
	settings.Add("frz2Souls",true,"Fortified Residential Zone 2");
	settings.Add("flameSouls",true,"Flame");
	settings.Add("trainSouls",true,"Train");
	settings.Add("zerobeatSouls",true,"Zero Beat");
	settings.Add("akumuSouls",true,"A.KU.MU (always active)");
	
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
	settings.Add("chuoPJ",true,"Chuo Street");
	settings.Add("rdhCopsPJ",false,"RDH Cop Fight");
	settings.Add("rdhPJ",true,"Rokkaku Dai Heights");
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
	
	// Settings for New Game start Souls%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0)) && settings["Souls"]){
		vars.gameMode = 2;	// Set game mode
		return true;
	}
	
	// Settings for New Game start PJ%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0)) && settings["PJ"]){
		vars.gameMode = 3;	// Set game mode
		return true;
	}
}

split
{
	// Any%
	if((vars.gameMode == 1) &&
	(current.mission == 65732 && old.mission == 65537 && settings["garageAny"])
	||
	(current.mission == 65648 && old.mission == 65646 && settings["beatAny"])
	||
	(current.mission == 65656 && old.mission == 65636 && settings["dogenAny"])
	||
	(current.mission == 65659 && old.mission == 65657 && settings["comboAny"])
	||
	(current.mission == 131168 && old.mission == 65658 && settings["shibuyaAny"])
	||
	(current.mission == 131302 && old.mission == 131303 && settings["tanksAny"])
	||
	(current.mission == 131312 && old.mission == 131272 && settings["chuoAny"])
	||
	(current.mission == 131312 && old.mission == 131313 && settings["rdhCopsAny"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["rdhAny"])
	||
	(current.mission == 131322 && old.mission == 131323 && settings["99LightAny"])
	||
	(current.mission == 131324 && old.mission == 131322 && settings["99DarkAny"])
	||
	(current.mission == 196704 && old.mission == 131324 && settings["99Any"])
	||
	(current.mission == 196978 && old.mission == 196968 && settings["sewersAny"])
	||
	(current.mission == 262240 && old.mission == 196978 && settings["bottomAny"])
	||
	(current.mission == 262594 && old.mission == 262595 && settings["hikageTerrorAny"])
	||
	(current.mission == 262594 && old.mission == 262596 && settings["hikageCopsAny"])
	||
	(current.mission == 262604 && old.mission == 262574 && settings["hikageAny"])
	||
	(current.mission == 262614 && old.mission == 262584 && settings["kiboAny"])
	||
	(current.mission == 262614 && old.mission == 262615 && settings["sdppCopsAny"])
	||
	(current.mission == 262624 && old.mission == 262614 && settings["sdppAny"])
	||
	(current.mission == 327776 && old.mission == 262624 && settings["highwayAny"])
	||
	(current.mission == 328190 && old.mission == 328191 && settings["doomAny"])
	||
	(current.mission == 328190 && old.mission == 328192 && settings["immortalsAny"])
	||
	(current.mission == 393312 && old.mission == 328194 && settings["deathballAny"])
	||
	(current.mission == 393826 && old.mission == 393836 && settings["noiseDogenAny"])
	||
	(current.mission == 393831 && old.mission == 393826 && settings["noiseShibuyaAny"])
	||
	(current.mission == 393846 && old.mission == 393816 && settings["noiseChuoAny"])
	||
	(current.mission == 393871 && old.mission == 393816 && settings["noiseRDHAny"])
	||
	(current.mission == 393876 && old.mission == 393891 && settings["noiseAny"])
	||
	(current.mission == 458848 && old.mission == 393876 && settings["skydinoAny"])
	||
	(current.mission == 459502 && current.fight == 2064 && old.fight == 1040 && settings["frzBlueAny"])
	||
	(current.mission == 459504 && old.mission == 459502 && settings["frzRedAny"])
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
	(current.mission == 525178 && current.fight == 80 && old.fight == 48 && settings["akumuAny"])
	){
		return true;
	}
	
	// Souls%
	if((vars.gameMode == 2) &&
	(current.mission == 65732 && old.mission == 65537 && settings["garageSouls"])
	||
	(current.mission == 65648 && old.mission == 65646 && settings["beatSouls"])
	||
	(current.mission == 65656 && old.mission == 65646 && settings["dogenSouls"])
	||
	(current.mission == 65659 && old.mission == 65657 && settings["comboSouls"])
	||
	(current.mission == 131168 && old.mission == 65658 && settings["shibuyaSouls"])
	||
	(current.mission == 131302 && old.mission == 131303 && settings["tanksSouls"])
	||
	(current.mission == 131312 && old.mission == 131272 && settings["chuoSouls"])
	||
	(current.mission == 131312 && old.mission == 131313 && settings["rdhCopsSouls"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["rdhSouls"])
	||
	(current.mission == 131322 && old.mission == 131323 && settings["99LightSouls"])
	||
	(current.mission == 131324 && old.mission == 131322 && settings["99DarkSouls"])
	||
	(current.mission == 196704 && old.mission == 131324 && settings["99Souls"])
	||
	(current.mission == 196978 && old.mission == 196968 && settings["sewersSouls"])
	||
	(current.mission == 262240 && old.mission == 196978 && settings["bottomSouls"])
	||
	(current.mission == 262594 && old.mission == 262595 && settings["hikageTerrorSouls"])
	||
	(current.mission == 262594 && old.mission == 262596 && settings["hikageCopsSouls"])
	||
	(current.mission == 262604 && old.mission == 262574 && settings["hikageSouls"])
	||
	(current.mission == 262614 && old.mission == 262584 && settings["kiboSouls"])
	||
	(current.mission == 262614 && old.mission == 262615 && settings["sdppCopsSouls"])
	||
	(current.mission == 262624 && old.mission == 262614 && settings["sdppSouls"])
	||
	(current.mission == 327776 && old.mission == 262624 && settings["highwaySouls"])
	||
	(current.mission == 328190 && old.mission == 328191 && settings["doomSouls"])
	||
	(current.mission == 328190 && old.mission == 328192 && settings["immortalsSouls"])
	||
	(current.mission == 393312 && old.mission == 328194 && settings["deathballSouls"])
	||
	(current.mission == 393826 && old.mission == 393836 && settings["noiseDogenSouls"])
	||
	(current.mission == 393831 && old.mission == 393826 && settings["noiseShibuyaSouls"])
	||
	(current.mission == 393846 && old.mission == 393816 && settings["noiseChuoSouls"])
	||
	(current.mission == 393871 && old.mission == 393816 && settings["noiseRDHSouls"])
	||
	(current.mission == 393876 && old.mission == 393891 && settings["noiseSouls"])
	||
	(current.mission == 458848 && old.mission == 393876 && settings["skydinoSouls"])
	||
	(current.mission == 459502 && current.fight == 2064 && old.fight == 1040 && settings["frzBlueSouls"])
	||
	(current.mission == 459504 && old.mission == 459502 && settings["frzRedSouls"])
	||
	(current.mission == 524384 && old.mission == 459503 && settings["frzSouls"])
	||
	(current.mission == 525138 && old.mission == 525123 && settings["clawSouls"])
	||
	(current.mission == 525158 && old.mission == 525163 && settings["frz2Souls"])
	||
	(current.mission == 525168 && old.mission == 525163 && settings["flameSouls"])
	||
	(current.mission == 525186 && old.mission == 525168 && settings["trainSouls"])
	||
	(current.mission == 525099 && old.mission == 525100 && settings["zerobeatSouls"])
	||
	(current.mission == 525178 && current.fight == 80 && old.fight == 48 && settings["akumuSouls"])
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
	(current.mission == 131312 && old.mission == 131272 && settings["chuoPJ"])
	||
	(current.mission == 131312 && old.mission == 131313 && settings["rdhCopsPJ"])
	||
	(current.mission == 131322 && old.mission == 131272 && settings["rdhPJ"])
	||
	(current.mission == 131322 && old.mission == 131323 && settings["99LightSouls"])
	||
	(current.mission == 131324 && old.mission == 131322 && settings["99DarkSouls"])
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
